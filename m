From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jun 2020 13:42:46 +0200
Subject: [Buildroot] [PATCH] package/openjdk-bin: install to
 host/usr/lib/jvm
In-Reply-To: <20200617215520.3600744-1-aduskett@gmail.com>
References: <20200617215520.3600744-1-aduskett@gmail.com>
Message-ID: <20200618114246.GM2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-06-17 14:55 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> Buildroot currently installs openjdk-bin to $(HOST_DIR)/ instead of the more
> traditional (for java installations) $(HOST_DIR)/usr/lib/jvm.
> 
> As described in https://bugs.busybox.net/show_bug.cgi?id=13001
> 
> "Openjdk-bin provides it's own libfreetype.so and places it into
> $(HOST_DIR)/lib/. This library causes build failures with the
> host-xapp_mkfontscale package due to the overwritten libfreetype.so.
> 
> mkfontscale.o: In function `doDirectory':
> mkfontscale.c:(.text+0x1a80): undefined reference to `FT_Get_BDF_Property'
> collect2: error: ld returned 1 exit status
> 
> Reproducing the error is done by repeating the following steps.
> make host-freetype
> make host-openjdk-bin
> make host-xapp_mkfontscale"
> 
> There are two options for fixing this problem:
> 
> 1) Add host-freetype and host-lksctp-tools as dependencies to host-openjdk-bin
>    and then remove the provided libfreetype.so and libsctp.so libraries in a
>    post_extract_hook.
> 
> 2) Change the installation directory from $(HOST_DIR)/ to
>    $(HOST_DIR)/usr/lib/jvm just like the target OpenJDK package and copy the
>    entire source directories contents to the above location.
> 
> The second option provides the following advantages:
>  - The directory structure is consistent with how we handle the target OpenJDK.
> 
>  - The HOST_OPENJDK_BIN_INSTALL_CMDS step is simplified.
> 
>  - Packages such as Maven require directories of which we are currently not
>    copying. These missing directories cause programs such as Maven to crash
>    when running with an error such as
>    "Can't read cryptographic policy directory: unlimited."
> 
> Because the second option is both simple, easier to implement, is low-impact,
> and fixes the problems described above wholly, it is the best to implement.
> 
> To implement the above changes, we must also modify the following files in the
> same patch to match the host's new directory paths:
> 
>  - openjdk.mk
>  - openjdk-jni-test.mk
>  - openjdk-hello-world.mk
> 
> Tested with:
> ./support/testing/run-tests -o out -d dl tests.package.test_openjdk.TestOpenJdk
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=13001
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I've slightly changed that patch, see the commit I just pushed:

  - introduce HOST_OPENJDK_BIN_ROOT_DIR and JAVAC
  - expand and tweak the commit log

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/openjdk-bin/openjdk-bin.mk                        | 8 +++-----
>  package/openjdk/openjdk.mk                                | 2 +-
>  .../package/openjdk-hello-world/openjdk-hello-world.mk    | 2 +-
>  .../openjdk/package/openjdk-jni-test/openjdk-jni-test.mk  | 2 +-
>  4 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
> index f4a8979e0b..f67f3b7ee5 100644
> --- a/package/openjdk-bin/openjdk-bin.mk
> +++ b/package/openjdk-bin/openjdk-bin.mk
> @@ -26,11 +26,9 @@ HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEM
>  # Because unpack200 is a deprecated tool, removing it to fix this
>  # issue is safe.
>  define HOST_OPENJDK_BIN_INSTALL_CMDS
> -	mkdir -p $(HOST_DIR)/bin
> -	cp -dpfr $(@D)/bin/* $(HOST_DIR)/bin/
> -	mkdir -p $(HOST_DIR)/lib
> -	cp -dpfr $(@D)/lib/* $(HOST_DIR)/lib/
> -	$(RM) -f $(HOST_DIR)/bin/unpack200
> +	mkdir -p $(HOST_DIR)/usr/lib/jvm
> +	cp -dpfr $(@D)/* $(HOST_DIR)/usr/lib/jvm/
> +	$(RM) -f $(HOST_DIR)/usr/lib/jvm/bin/unpack200
>  endef
>  
>  $(eval $(host-generic-package))
> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> index 22c9a777b5..baefdf59bb 100644
> --- a/package/openjdk/openjdk.mk
> +++ b/package/openjdk/openjdk.mk
> @@ -94,7 +94,7 @@ OPENJDK_CONF_OPTS = \
>  	--enable-openjdk-only \
>  	--enable-unlimited-crypto \
>  	--openjdk-target=$(GNU_TARGET_NAME) \
> -	--with-boot-jdk=$(HOST_DIR) \
> +	--with-boot-jdk=$(HOST_DIR)/usr/lib/jvm \
>  	--with-stdc++lib=dynamic \
>  	--with-debug-level=release \
>  	--with-devkit=$(HOST_DIR) \
> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk
> index 998117b8e2..6157c4dd9c 100644
> --- a/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk
> @@ -8,7 +8,7 @@ OPENJDK_HELLO_WORLD_DEPENDENCIES = openjdk
>  
>  define OPENJDK_HELLO_WORLD_BUILD_CMDS
>  	$(INSTALL) -D $(OPENJDK_HELLO_WORLD_PKGDIR)/HelloWorld.java $(@D)/HelloWorld.java
> -	$(HOST_DIR)/bin/javac $(@D)/HelloWorld.java
> +	$(HOST_DIR)/usr/lib/jvm/bin/javac $(@D)/HelloWorld.java
>  endef
>  
>  define OPENJDK_HELLO_WORLD_INSTALL_TARGET_CMDS
> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/openjdk-jni-test.mk b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/openjdk-jni-test.mk
> index f279e5cd70..51ae44cabd 100644
> --- a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/openjdk-jni-test.mk
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/openjdk-jni-test.mk
> @@ -10,7 +10,7 @@ JNI_INCLUDE_PATH = $(BUILD_DIR)/openjdk-$(OPENJDK_VERSION)/build/linux-aarch64-s
>  
>  define OPENJDK_JNI_TEST_BUILD_CMDS
>  	# Compile Java classes and generate native headers
> -	$(HOST_DIR)/bin/javac -d $(@D) -h $(@D) \
> +	$(HOST_DIR)/usr/lib/jvm/bin/javac -d $(@D) -h $(@D) \
>  		$(OPENJDK_JNI_TEST_PKGDIR)/JniTest.java \
>  		$(OPENJDK_JNI_TEST_PKGDIR)/JniWrapper.java \
>  		$(OPENJDK_JNI_TEST_PKGDIR)/JniHelper.java
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
