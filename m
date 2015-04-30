From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 01:05:19 +0200
Subject: [Buildroot] [PATCH] package/ccache: add universal wrapper script
In-Reply-To: <1430309142-36242-1-git-send-email-kaszak@gmail.com>
References: <1430309142-36242-1-git-send-email-kaszak@gmail.com>
Message-ID: <5542B52F.203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/29/15 14:05, Karoly Kasza wrote:
> This patch adds a wrapper script to call ccache, which will differentiate
> if the HOST or either internal or external TARGET compiler is called.
> 
> Ccache needs to know what compiler we use, but can be simply fooled to fetch
> invalid objects. To circumvent this, it uses different algorythms to
> distiguish the compilers. This needs to be tuned for Buildroot's usage,
> as the internal toolchains' characteristics change with every recompilation,
> while ccache can not directly access the external toolchains (symlinks).
> 
> This patch does the following:
> - Reenable using mtime (hash of binary size and modification date) as the
>   default compiler_check algorythm. This will be used for the host compiler.
> - Renames the ccache binary, so the wrapper script can be installed on it's
>   place.
> - Creates a wrapper script with hardcoded values for performance, which will
>   disable the mtime compiler check and add an extra file to hash if it is called
>   for a target compiler (either internal or external). It is basically all the
>   same if we are using internal or external toolchains, ccache only sees a path.
> - Creates a checksum file for the above method from the extract of the current
>   Buildroot config, which should not change when configuring packages or
>   recompiling the whole project. However it will change if the compiler options
>   change, thus safely pointing to cached objects.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  Config.in                |    7 -------
>  package/ccache/ccache.mk |   25 ++++++++++++++++++++-----
>  2 files changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 2b39d6a..6e7f722 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -257,13 +257,6 @@ config BR2_CCACHE
>  	  up future builds. By default, the cache is stored in
>  	  $HOME/.buildroot-ccache.
>  
> -	  Note that Buildroot does not try to invalidate the cache
> -	  contents when the compiler changes in an incompatible
> -	  way. Therefore, if you make a change to the compiler version
> -	  and/or configuration, you are responsible for purging the
> -	  ccache cache by removing the $HOME/.buildroot-ccache
> -	  directory.
> -
>  if BR2_CCACHE
>  
>  config BR2_CCACHE_DIR
> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index 52b5c67..ee9085d 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -26,16 +26,14 @@ HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
>  #    is already used by autotargets for the ccache package.
>  #    BR_CACHE_DIR is exported by Makefile based on config option
>  #    BR2_CCACHE_DIR.
> -#  - ccache shouldn't use the compiler binary mtime to detect a change in
> -#    the compiler, because in the context of Buildroot, that completely
> -#    defeats the purpose of ccache. Of course, that leaves the user
> -#    responsible for purging its cache when the compiler changes.
>  #  - Change hard-coded last-ditch default to match path in .config, to avoid
>  #    the need to specify BR_CACHE_DIR when invoking ccache directly.
> +#  - Rename ccache binary to ccache.bin, so later the wrapper can be safely
> +#    named ccache, as referred everywhere
>  define HOST_CCACHE_PATCH_CONFIGURATION
>  	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
> -	sed -i 's,conf->compiler_check = x_strdup("mtime"),conf->compiler_check = x_strdup("none"),' $(@D)/conf.c
>  	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/conf.c
> +	sed -i 's,#define MYNAME "ccache",#define MYNAME "ccache.bin",' $(@D)/ccache.h
>  endef
>  
>  HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
> @@ -58,6 +56,23 @@ endef
>  HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_DO_INITIAL_SETUP
>  endif
>  
> +# Install a wrapper script, which, when using the TARGET_ toolchain, will make
> +# ccache use the hash of the toolchain options instead of the compiler's mtime
> +define HOST_CCACHE_INSTALL_WRAPPER
> +	mv $(CCACHE) $(CCACHE).bin
> +	echo "#!/bin/sh" > $(CCACHE)
> +	echo "if [ \"$$"'1'"\" = \"$(TARGET_CC_NOCCACHE)\" ] || \\" >> $(CCACHE)
> +	echo "   [ \"$$"'1'"\" = \"$(TARGET_CXX_NOCCACHE)\" ]; then" >> $(CCACHE)
> +	echo "	export CCACHE_COMPILERCHECK=none CCACHE_EXTRAFILES=$(HOST_DIR)/ccache_toolchain.config.hash" >> $(CCACHE)
> +	echo "fi" >> $(CCACHE)
> +	echo "$(CCACHE).bin \"$$"'@'"\"" >> $(CCACHE)

 I don't really like this additional wrapper script. Can't we just define two
variables, HOST_CCACHE and TARGET_CCACHE:

HOST_CCACHE = $(HOST_DIR)/usr/bin/ccache
TARGET_CCACHE = \
	CCACHE_COMPILERCHECK=none \
	CCACHE_EXTRAFILES=$(HOST_DIR)/ccache_toolchain.config.hash \
	$(HOST_DIR)/usr/bin/ccache

TARGET_CC := $(TARGET_CCACHE) $(TARGET_CC)

(and subsitute the other references to $(CCACHE) as appropriate)

 The handling of cmake and qmake will require a bit of thinking however.


 If you do keep the wrapper script, then I'd prefer if you create it as
package/ccache/ccache_wrapper.in and fill in the relevant variables with sed.


> +	grep "BR2_ARCH\|BR2_TOOLCHAIN\|BR2_GCC\|BR2_BINUTILS\|BR2_UCLIBC\|BR2_GLIBC\|BR2_EGLIBC" $(BR2_CONFIG) | \
> +	grep -v "#" | md5sum > $(HOST_DIR)/ccache_toolchain.config.hash

 Since CCACHE_EXTRAFILES is anyway taken together with the input file into one
big hash, I wouldn't bother with hashing it here, but just put the actual
options to be hashed in that file. That gives a good reference when you want to
debug ccache, and the speed penalty is negligible (the overhead of opening the
file is larger than reading and hashing it).


 Regards,
 Arnout


> +	chmod 755 $(CCACHE)
> +endef
> +
> +HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_INSTALL_WRAPPER
> +
>  $(eval $(host-autotools-package))
>  
>  ifeq ($(BR2_CCACHE),y)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
