From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Wed, 3 Apr 2019 18:26:32 +0700
Subject: [Buildroot] [PATCH] package/libcamera: Add libcamera package
In-Reply-To: <20190403112246.25471-1-kieran.bingham@ideasonboard.com>
References: <20190403112246.25471-1-kieran.bingham@ideasonboard.com>
Message-ID: <a54f9eda-d956-3563-1be3-60a9ba31e126@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All...

I'm sorry - a debug line has crept in that I thought I had kept out of
the patch.

V2 (actually it's V3 anyway) to arrive imminently....

Sorry for the noise.

--
Kieran


On 03/04/2019 12:22, Kieran Bingham wrote:
>   http://libcamera.org/
> 
> Cameras are complex devices that need heavy hardware image processing
> operations. Control of the processing is based on advanced algorithms
> that must run on a programmable processor. This has traditionally been
> implemented in a dedicated MCU in the camera, but in embedded devices
> algorithms have been moved to the main CPU to save cost. Blurring the
> boundary between camera devices and Linux often left the user with no
> other option than a vendor-specific closed-source solution.
> 
> To address this problem the Linux media community has very recently
> started collaboration with the industry to develop a camera stack that
> will be open-source-friendly while still protecting vendor core IP.
> libcamera was born out of that collaboration and will offer modern
> camera support to Linux-based systems, including traditional Linux
> distributions, ChromeOS and Android.
> 
> The project has not made an official release as of yet, so we're
> using the latest sha1 from master
> 
> We utilise C++ 11 but we mandate GCC5+ due to a bug [0] in earlier
> versions which result in compile failures on our code base.
> 
> [0] Bug 54316 - [C++11] move constructor for stringstream
>     https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54316
> 
> Documentation and Tests are disabled from the build.
> 
> With the following added to libcamera.config:
> 
>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>   BR2_PACKAGE_LIBCAMERA=y
> 
> ./utils/test-pkg -c libcamera.config -p libcamera
>                              br-arm-full [1/6]: SKIPPED
>                   br-arm-cortex-a9-glibc [2/6]: OK
>                    br-arm-cortex-m4-full [3/6]: SKIPPED
>                           br-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: SKIPPED
>                             sourcery-arm [6/6]: SKIPPED
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  DEVELOPERS                       |  3 +++
>  package/Config.in                |  1 +
>  package/libcamera/Config.in      | 13 +++++++++++++
>  package/libcamera/libcamera.hash |  4 ++++
>  package/libcamera/libcamera.mk   | 19 +++++++++++++++++++
>  5 files changed, 40 insertions(+)
>  create mode 100644 package/libcamera/Config.in
>  create mode 100644 package/libcamera/libcamera.hash
>  create mode 100644 package/libcamera/libcamera.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c91325e28486..5bcdf208a62b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1260,6 +1260,9 @@ F:	package/ramsmp/
>  N:	Kevin Joly <kevin.joly@sensefly.com>
>  F:	package/libgphoto2/
>  
> +N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
> +F:	package/libcamera/
> +
>  N:	Koen Martens <gmc@sonologic.nl>
>  F:	package/capnproto/
>  F:	package/linuxconsoletools/
> diff --git a/package/Config.in b/package/Config.in
> index b5321aeb49c9..a9d25e58b202 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1472,6 +1472,7 @@ menu "Multimedia"
>  	source "package/libass/Config.in"
>  	source "package/libbdplus/Config.in"
>  	source "package/libbluray/Config.in"
> +	source "package/libcamera/Config.in"
>  	source "package/libdcadec/Config.in"
>  	source "package/libdvbcsa/Config.in"
>  	source "package/libdvbpsi/Config.in"
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> new file mode 100644
> index 000000000000..cc5e84424c38
> --- /dev/null
> +++ b/package/libcamera/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_LIBCAMERA
> +	bool "libcamera"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	# C++11 + https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54316
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	help
> +	  libcamera provides a software stack to support
> +	  complex devices that need heavy hardware image
> +	  processing operations.
> +
> +		http://www.libcamera.org/
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> new file mode 100644
> index 000000000000..7d5392dde2bb
> --- /dev/null
> +++ b/package/libcamera/libcamera.hash
> @@ -0,0 +1,4 @@
> +sha256 2c01dc76d98ef257660f8ef3f4f17f042e112b5eca6b364ad615220c96fbd066  libcamera-d5ca33f6c7b0cd1ca20ec5dc7131aeedf1503080.tar.gz
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/gnu-gpl-2.0.txt
> +sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  licenses/gnu-lgpl-2.1.txt
> +
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> new file mode 100644
> index 000000000000..342d5e34cad0
> --- /dev/null
> +++ b/package/libcamera/libcamera.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# libcamera
> +#
> +################################################################################
> +
> +LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> +#LIBCAMERA_SITE = https://gitlab.com/libcamera/libcamera.git

^^^

This should not be here :D


> +LIBCAMERA_VERSION = d5ca33f6c7b0cd1ca20ec5dc7131aeedf1503080
> +LIBCAMERA_SITE_METHOD = git
> +LIBCAMERA_DEPENDENCIES = udev
> +LIBCAMERA_CONF_OPTS = -Dtests=false -Ddocumentation=false
> +LIBCAMERA_INSTALL_STAGING = yes
> +LIBCAMERA_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (utils)
> +LIBCAMERA_LICENSE_FILES = \
> +	licenses/gnu-gpl-2.0.txt \
> +	licenses/gnu-lgpl-2.1.txt
> +
> +$(eval $(meson-package))
> 

-- 
Regards
--
Kieran
