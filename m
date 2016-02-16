From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 Feb 2016 21:53:13 +0100
Subject: [Buildroot] [PATCH v2 1/2] libimxvpuapi: add new package
In-Reply-To: <1454363759-23349-2-git-send-email-gary.bisson@boundarydevices.com>
References: <1454363759-23349-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454363759-23349-2-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160216215313.15f228fe@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gary,

On Mon,  1 Feb 2016 22:55:58 +0100, Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> This is a library for using the i.MX6 VPU. It is an alternative to
> libfslvpuwrap, hosted on Github, and has an API that features several
> improvements over libfslvpuwrap, which include:
> 
> * User-defined context information associated with input frames, which
> is passed on to corresponding output frames (to be able to identify
> which input frame produced which output frame)
> * Groundwork for future DMA-BUF/BMM/ION/CMA allocator integration, using
> file descriptors instead of physical addresses
> * Indicators for when it is safe to try to decode frames, which is
> critical in multi-threaded playback cases
> * Simplified, higher-level JPEG en/decoding API, based on the VPU MJPEG
> codec; useful for picture viewing without the extra boilerplate for
> VPU-based en/decoding
> 
> Changelog 0.10.0 -> 0.10.1:
> - add debian packaging files
> - update waf to version 1.8.16
> - add workaround in wscript to prevent stale pkg-config .pc files
> - fix memory leak by adding missing IOFreeVirtMem() call in vpulib
> backend
> 
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/e519d6c
> https://github.com/Freescale/meta-fsl-arm/commit/1dd6a5b
> 
> This package has been implicitely tested through gstreamer as the
> plugins rely on it for vpu decoding:
>  # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> 
> Changelog v1->v2:
> - add hash file
> - add upstream URL
> - change license to LGPLv2.1+
> 
> Thanks,
> Gary
> 
> ---
>  package/Config.in                      |  1 +
>  package/libimxvpuapi/Config.in         | 12 ++++++++++++
>  package/libimxvpuapi/libimxvpuapi.hash |  2 ++
>  package/libimxvpuapi/libimxvpuapi.mk   | 35 ++++++++++++++++++++++++++++++++++
>  4 files changed, 50 insertions(+)
>  create mode 100644 package/libimxvpuapi/Config.in
>  create mode 100644 package/libimxvpuapi/libimxvpuapi.hash
>  create mode 100644 package/libimxvpuapi/libimxvpuapi.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 09c2b40..d3e5e30 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1033,6 +1033,7 @@ menu "Multimedia"
>  	source "package/libfslparser/Config.in"
>  	source "package/libfslvpuwrap/Config.in"
>  	source "package/libhdhomerun/Config.in"
> +	source "package/libimxvpuapi/Config.in"
>  	source "package/libmatroska/Config.in"
>  	source "package/libmms/Config.in"
>  	source "package/libmpeg2/Config.in"
> diff --git a/package/libimxvpuapi/Config.in b/package/libimxvpuapi/Config.in
> new file mode 100644
> index 0000000..a48e441
> --- /dev/null
> +++ b/package/libimxvpuapi/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_LIBIMXVPUAPI
> +	bool "libimxvpuapi"
> +	depends on BR2_arm # Only relevant for i.MX
> +	select BR2_PACKAGE_FREESCALE_IMX
> +	select BR2_PACKAGE_IMX_VPU
> +	help
> +	  This library provides an API for using the iMX6 VPU video engine. It
> +	  is an alternative to Freescale's VPU wrapper. Both the wrapper and
> +	  this library are layered on top of imx-vpu, the low-level iMX6 VPU
> +	  interface.
> +
> +	  https://github.com/Freescale/libimxvpuapi
> diff --git a/package/libimxvpuapi/libimxvpuapi.hash b/package/libimxvpuapi/libimxvpuapi.hash
> new file mode 100644
> index 0000000..fd90a20
> --- /dev/null
> +++ b/package/libimxvpuapi/libimxvpuapi.hash
> @@ -0,0 +1,2 @@
> +# locally computed hash
> +sha256 8d7aeed88c06fda44318cef9565ae47b86461bd309908b1103a7974ed0822a8d  libimxvpuapi-0.10.1.tar.gz
> diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
> new file mode 100644
> index 0000000..8e62682
> --- /dev/null
> +++ b/package/libimxvpuapi/libimxvpuapi.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# libimxvpuapi
> +#
> +################################################################################
> +
> +LIBIMXVPUAPI_VERSION = 0.10.1
> +LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
> +LIBIMXVPUAPI_LICENSE = LGPLv2.1+
> +LIBIMXVPUAPI_LICENSE_FILES = LICENSE
> +LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu
> +LIBIMXVPUAPI_INSTALL_STAGING = YES
> +
> +define LIBIMXVPUAPI_CONFIGURE_CMDS
> +	cd $(@D); \
> +	$(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python2 ./waf configure \
> +		--prefix=/usr
> +endef

On my x86_64 (OpenSUSE-13.2) host build the libs and libimxvpuapi.pc
are installed into $(STAGING_DIR)/usr/lib64 and $(TARGET_DIR)/usr/lib64.

To be usable by eg. gst1-imx the install path should be $(STAGING_DIR)/usr/lib
and $(TARGET_DIR)/usr/lib. To achieve this I added '--libdir=/usr/lib' to
overwrite the default '/usr/lib64':

--- a/package/libimxvpuapi/libimxvpuapi.mk
+++ b/package/libimxvpuapi/libimxvpuapi.mk
@@ -14,7 +14,7 @@ LIBIMXVPUAPI_INSTALL_STAGING = YES
 define LIBIMXVPUAPI_CONFIGURE_CMDS
        cd $(@D); \
        $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python2 ./waf configure \
-               --prefix=/usr
+               --prefix=/usr --libdir=/usr/lib
 endef
 
 define LIBIMXVPUAPI_BUILD_CMDS


With this you can add my

Tested-by: Peter Seiderer <ps.report@gmx.net>

for '...! imxvpudec ! imxipuvideosink'

But I had problems using the imxeglvivsink element and
with qt5 eglfs, suspecting your 'Update most Freescale packages' patch series
(using buildroot-2016.02-rc1 with your '[PATCH v3 0/2] gst1-imx: bump version to 0.12.0'
patches on top), but did not find time yet to investigate further...

Regards,
Peter

> +
> +define LIBIMXVPUAPI_BUILD_CMDS
> +	cd $(@D); \
> +	$(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS)
> +endef
> +
> +define LIBIMXVPUAPI_INSTALL_STAGING_CMDS
> +	cd $(@D); \
> +	$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) install
> +endef
> +
> +define LIBIMXVPUAPI_INSTALL_TARGET_CMDS
> +	cd $(@D); \
> +	$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) install
> +endef
> +
> +$(eval $(generic-package))
