From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Apr 2020 23:20:35 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/openjdk: fix installation
 with merged usr directories
In-Reply-To: <20200418190701.2629613-1-aduskett@gmail.com>
References: <20200418190701.2629613-1-aduskett@gmail.com>
Message-ID: <20200421212035.GZ5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-04-18 12:06 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Currently, Buildroot installs the jre libraries using
> cp -dprf /build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/
> 
> However, if a system has a merged /usr directory, and there is a built kernel
> before installing OpenJDK, the installation fails because jre/lib has binary
> modules file, which causes the following error: cp: cannot overwrite directory
> '/usr/lib/modules with non-directory

Patch applied to master, after extending a bit one of the explanations
as discussed on IRC. Thanks! :-)

Regards,
Yann E. MORIN.

> The obvious fix is to install the modules to /usr/lib/jvm/ and set the
> appropriate rpaths via the --with-extra-ldflags conf option. However, this fix
> does not work because the built binaries themselves do not link against
> libjava.so
> 
> Indeed, running readelf on the built java binary reports the following:
> "(RUNPATH) Library runpath: [/usr/lib/jvm]" and /usr/lib/jvm/libjava.so exists.
> However, when running the Java binary on the target, the following error
> occurs: "Error: could not find libjava.so."
> 
> The following is the result of "strace java" ran on the target:
> faccessat(AT_FDCWD, "/usr/lib/libjava.so", F_OK) = -1 ENOENT
> faccessat(AT_FDCWD, "/usr/jre/lib/libjava.so", F_OK) = -1 ENOENT
> newfstatat(AT_FDCWD, "/usr/lib/libjava.so", 0x7ffe7b4af8, 0) = -1 ENOENT
> newfstatat(AT_FDCWD, "/usr/lib/jvm/libjli.so", [sic] AT_SYMLINK_NOFOLLOW) = 0
> 
> As seen above, the java binary searches for libjli.so in /usr/lib/jvm,
> but libjava.so has the search paths hardcoded to the following directories:
>   - /usr/lib/
>   - /usr/jre/lib/
>   - $(dirname $0)/../lib/
> 
> The reason behind the hardcoded paths given by the maintainers is due to
> historical purposes for the need to support several java versions at the
> same time on a single system, and that changing the above behavior is not
> likely to ever happen.
> 
> As such, most distributions such as Redhat do the following:
>   - Create the directory /usr/lib/jvm/java-$(JAVA_VERSION)/
>   - Install all directories and files found in images/jre to that directory.
>   - Symlink the binaries to in /usr/lib/jvm/java-$(JAVA_VERSION)/bin to
>     /usr/bin.
> 
> However, because Buildroot does not need to support multiple versions of java
> concurrently, there is no need for the additional java-$(JAVA_VERSION)
> directory.
> 
> To fix the above issue, the following changes are performed:
>   - Introduce the variable "OPENJDK_INSTALL_BASE" which points to /usr/lib/jvm
>   - Set the --with-extra-ldflags conf_opt to
>       "-Wl,-rpath,$(OPENJDK_INSTALL_BASE)/lib,-rpath,
>       $(OPENJDK_INSTALL_BASE)/lib/$(OPENJDK_JVM_VARIANT)"
>   - Run "mkdir -p $(TARGET_DIR)/usr/lib/jvm/" in the INSTALL_TARGET_CMDS step.
>   - Copy both the lib and bin directories to /usr/lib/jvm/
>   - Symlink the binaries in /usr/lib/jvm/bin/ to /usr/bin.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12751
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Fixed comments in openjdk.mk (Yann)
>   - Added spaces around the = sign for OPENJDK_INSTALL_BASE (Yann)
>   - Added trailing /'s for copying (Yann)
>   - Added a more complete commit message.
> 
>  package/openjdk/openjdk.mk | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> index edc86c6fbe..a06a8a7307 100644
> --- a/package/openjdk/openjdk.mk
> +++ b/package/openjdk/openjdk.mk
> @@ -46,6 +46,13 @@ OPENJDK_JVM_VARIANT = zero
>  OPENJDK_DEPENDENCIES += libffi
>  endif
>  
> +# OpenJDK installs a file named 'modules' in jre/lib, which gets installed as
> +# /usr/lib/modules. However, with a merged /usr, this conflicts with the
> +# directory named 'modules' installed by the kernel. If OpenJDK gets built
> +# after the kernel, this manifests itself with: "cp: cannot overwrite
> +# directory '/usr/lib/modules with non-directory."
> +OPENJDK_INSTALL_BASE = /usr/lib/jvm
> +
>  # OpenJDK ignores some variables unless passed via the environment.
>  # These variables are PATH, LD, CC, CXX, and CPP.
>  # OpenJDK defaults ld to the ld binary but passes -Xlinker and -z as
> @@ -75,6 +82,7 @@ OPENJDK_CONF_OPTS = \
>  	--with-devkit=$(HOST_DIR) \
>  	--with-extra-cflags="$(TARGET_CFLAGS)" \
>  	--with-extra-cxxflags="$(TARGET_CXXFLAGS)" \
> +	--with-extra-ldflags="-Wl,-rpath,$(OPENJDK_INSTALL_BASE)/lib,-rpath,$(OPENJDK_INSTALL_BASE)/lib/$(OPENJDK_JVM_VARIANT)" \
>  	--with-giflib=system \
>  	--with-jobs=$(PARALLEL_JOBS) \
>  	--with-jvm-variants=$(OPENJDK_JVM_VARIANT) \
> @@ -114,8 +122,12 @@ endef
>  # Calling make install always builds and installs the JDK instead of the JRE,
>  # which makes manual installation necessary.
>  define OPENJDK_INSTALL_TARGET_CMDS
> -	cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/* $(TARGET_DIR)/usr/bin/
> -	cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/
> +	mkdir -p $(TARGET_DIR)$(OPENJDK_INSTALL_BASE)
> +	cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/ \
> +		$(TARGET_DIR)$(OPENJDK_INSTALL_BASE)
> +	cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/ \
> +		$(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)/
> +	cd $(TARGET_DIR)/usr/bin && ln -snf ../..$(OPENJDK_INSTALL_BASE)/bin/* .
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.25.2
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
