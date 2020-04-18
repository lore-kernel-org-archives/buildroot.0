From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Apr 2020 14:17:14 +0200
Subject: [Buildroot] [PATCH 2/4] package/openjdk: fix installation with
 merged usr directories
In-Reply-To: <20200417232922.3762195-2-aduskett@gmail.com>
References: <20200417232922.3762195-1-aduskett@gmail.com>
 <20200417232922.3762195-2-aduskett@gmail.com>
Message-ID: <20200418121714.GO5853@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-04-17 16:29 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Currently, Buildroot installs the jre libraries using
> cp -dprf /build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/
> 
> However, if a system has a merged /usr directory, and there is a
> built kernel before installing OpenJDK, the installation fails because
> jre/lib has binary modules file, which causes the following error:
> cp: cannot overwrite directory '/usr/lib/modules with non-directory
> 
> The obvious fix is to install the modules to /usr/lib/jvm/ and set the
> appropriate rpaths via the --with-extra-ldflags conf option. However, this fix
> does not work because the binaries themselves do not link against libjava.so
> and instead search for libjava.so with hardcoded paths in the following
> directories:
>   - /usr/lib
>   - /usr/jre/lib
>   - $(dirname $0)/../lib
> 
> As such, most distributions such as Redhat create the directory
> /usr/lib/jvm/java-$(JAVA_VERSION)/ and install all directories and files
> found in images/jre to that directory, and then symlink the binaries to
> /usr/bin.
> 
> However, because Buildroot does not need to support multiple versions of java
> concurrently, there is no need for the java-$(JAVA_VERSION) directory.
> 
> To fix the above error, perform the following changes:
>   - Introduce the variable "OPENJDK_INSTALL_BASE" which points to usr/lib/jvm
>   - Set the --with-extra-ldflags conf_opt to
>       "-Wl,-rpath,/$(OPENJDK_INSTALL_BASE)/lib,-rpath,
>       /$(OPENJDK_INSTALL_BASE)/lib/$(OPENJDK_JVM_VARIANT)"
>   - Run "mkdir -p $(TARGET_DIR)/usr/lib/jvm" in the INSTALL_TARGET_CMDS step.
>   - Copy both the lib and bin directories to /usr/lib/jvm/
>   - Symlink the binaries in /usr/lib/jvm/bin/ to /usr/bin.

There: this is a good commit log: it explains the problem, and the
reason for it, lists the various solutions that have been attempted,
and provides explanations for the final solutio that was implemented
(partly again rephrasing the code, but that's OK given the rest is
good). :-)

See a little nit below...

> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12751
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/openjdk/openjdk.mk | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> index edc86c6fbe..d540b65edc 100644
> --- a/package/openjdk/openjdk.mk
> +++ b/package/openjdk/openjdk.mk
> @@ -46,6 +46,14 @@ OPENJDK_JVM_VARIANT = zero
>  OPENJDK_DEPENDENCIES += libffi
>  endif
>  
> +# Because jre/lib has a modules file, installation on a system with a merged
> +# /usr directory, and a built Kernel before OpenJDK, the following error
> +# occurs: "cp: cannot overwrite directory '/usr/lib/modules with non-directory"

This is a bit confusing, and I'm afraid will be hard to parse in the
future. What about:

    # openJDK installs a file named 'modules' in jre/lib, which gets
    # installed as /usr/lib/modules. However, with a merged /usr, this
    # will conflict with the directory named 'modules' installed by the
    # kernel. If openJDK gets built after the kernel, this manifests
    # itself with: "cp: cannot overwrite directory '/usr/lib/modules
    # with non-directory"

> +# To prevent this error, we follow what other distributions traditionally do:
> +# Install the OpenJDK files in /usr/lib/jvm/ and symlink the binaries to
> +# /usr/bin.
> +OPENJDK_INSTALL_BASE=usr/lib/jvm

This is supposed to be an absolute path on the target, so really make
that an absolute path (also, spaces around '='):

    OPENJDK_INSTALL_BASE = /usr/lib/jvm

>  # OpenJDK ignores some variables unless passed via the environment.
>  # These variables are PATH, LD, CC, CXX, and CPP.
>  # OpenJDK defaults ld to the ld binary but passes -Xlinker and -z as
> @@ -75,6 +83,7 @@ OPENJDK_CONF_OPTS = \
>  	--with-devkit=$(HOST_DIR) \
>  	--with-extra-cflags="$(TARGET_CFLAGS)" \
>  	--with-extra-cxxflags="$(TARGET_CXXFLAGS)" \
> +	--with-extra-ldflags="-Wl,-rpath,/$(OPENJDK_INSTALL_BASE)/lib,-rpath,/$(OPENJDK_INSTALL_BASE)/lib/$(OPENJDK_JVM_VARIANT)" \

And here, you don't need to prepend the leading '/' (twice)

>  	--with-giflib=system \
>  	--with-jobs=$(PARALLEL_JOBS) \
>  	--with-jvm-variants=$(OPENJDK_JVM_VARIANT) \
> @@ -114,8 +123,12 @@ endef
>  # Calling make install always builds and installs the JDK instead of the JRE,
>  # which makes manual installation necessary.
>  define OPENJDK_INSTALL_TARGET_CMDS
> -	cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/* $(TARGET_DIR)/usr/bin/
> -	cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/
> +	mkdir -p $(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)
> +	cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/ \
> +		$(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)
> +	cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/ \
> +		$(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)

In all thos e 'cp'. repeatign the '/' can be avoided too. But that is
not a real problem either...

Regards,
Yann E. MORIN.

> +	cd $(TARGET_DIR)/usr/bin && ln -snf ../../$(OPENJDK_INSTALL_BASE)/bin/* .
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
