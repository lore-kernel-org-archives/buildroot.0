From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2019 23:51:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/glog: switch to cmake
In-Reply-To: <20191028173304.25884-1-fontaine.fabrice@gmail.com>
References: <20191028173304.25884-1-fontaine.fabrice@gmail.com>
Message-ID: <2b498b48-b825-4ece-c353-64a3d50bb6d0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 18:33, Fabrice Fontaine wrote:
> Switch to cmake to fix a build failure on m68k with uclibc because
> glog's configure tests wrongly thinks that -fPIE works
> 
> By switching to cmake, we can remove the patch as the unittests won't be
> built anymore
> 
> We can also finely tune options such as gflags, threads and dynamic
> library support. This last option is handled through the standard
> BUILD_SHARED_LIBS option

 Thank you for the detailed commit message.

> 
> Fixes:
>  - http://autobuild.buildroot.net/results/5a659d960c24256a2905f129dfa70e3dc9e92aec
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

[snip]
> diff --git a/package/glog/Config.in b/package/glog/Config.in
> index 534997af49..e864094646 100644
> --- a/package/glog/Config.in
> +++ b/package/glog/Config.in
> @@ -1,13 +1,10 @@
>  config BR2_PACKAGE_GLOG
>  	bool "glog"
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on !BR2_STATIC_LIBS

 Normally, we'd like this in 2 or 3 separate patches: one that just does the
cmake conversion (so without the new patch, and keeping these dependencies), and
a second one that removes those dependencies. That allows the first patch to be
backported to stable branches. It also makes the review a whole lot simpler.

 However, since I anyway reviewed it already, and since the failure doesn't
occur on the stable branches since it is triggered by the version bump, I've
applied to master, thanks.

 Regards,
 Arnout

>  	help
>  	  C++ implementation of the Google logging module
>  
>  	  https://github.com/google/glog
>  
> -comment "glog needs a toolchain w/ C++, threads, dynamic library"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		BR2_STATIC_LIBS
> +comment "glog needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/glog/glog.mk b/package/glog/glog.mk
> index 6974f7bac7..9d31732a88 100644
> --- a/package/glog/glog.mk
> +++ b/package/glog/glog.mk
> @@ -9,23 +9,14 @@ GLOG_SITE = $(call github,google,glog,v$(GLOG_VERSION))
>  GLOG_INSTALL_STAGING = YES
>  GLOG_LICENSE = BSD-3-Clause
>  GLOG_LICENSE_FILES = COPYING
> -
> -# No configure script provided, so we need autoreconf
> -GLOG_AUTORECONF = YES
> +GLOG_CONF_OPTS = \
> +	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-DWITH_THREADS=ON, -DWITH_THREADS=OFF)
>  
>  ifeq ($(BR2_PACKAGE_GFLAGS),y)
>  GLOG_DEPENDENCIES = gflags
> +GLOG_CONF_OPTS += -DWITH_GFLAGS=ON
> +else
> +GLOG_CONF_OPTS += -DWITH_GFLAGS=OFF
>  endif
>  
> -# glog can optionally use atomic __sync built-ins. However, its
> -# configure script only checks for the availability of the 4 bytes
> -# version, but the code also uses the 1 byte version. While this works
> -# on most architectures, it does not on architectures that implement
> -# only the 4 bytes version, such as Microblaze. So if the architecture
> -# does not implement the 1 byte version, we hint the configure script
> -# that atomic built-ins should not be used.
> -ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_1),)
> -GLOG_CONF_ENV += ac_cv___sync_val_compare_and_swap=no
> -endif
> -
> -$(eval $(autotools-package))
> +$(eval $(cmake-package))
> 
