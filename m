From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jun 2020 22:11:46 +0200
Subject: [Buildroot] [PATCH v4 1/2] package/libcamera: bump version to
 96fab38
In-Reply-To: <20200616185951.30319-2-ps.report@gmx.net>
References: <20200616185951.30319-1-ps.report@gmx.net>
 <20200616185951.30319-2-ps.report@gmx.net>
Message-ID: <20200618201146.GQ2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-06-16 20:59 +0200, Peter Seiderer spake thusly:
> - add host dependencies: openssl, pkgconf, python3-pyyaml
> - add dependencies: gnutls
> - changed from mandatory to optional dependency: udev
> - add dedicated pipeline configure options
> - add optional dependencies: boost, gstreamer1/gst1-plugins-base,
>   qt5base, tiff
> - update license info (Apache-2.0 omitted - applies only for android code)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Applied to master, after simplifying the qt5 widgets and qt5 linguist
conditions. Thanks!

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - re-add LIBCAMERA_LICENSE_FILES list (Kieran Bingham)
>   - fix typo in commit message (Kieran Bingham)
>   - add Reviewed-by from Kieran Bingham
> 
> Changes v2 -> v3:
>   - add dedicated pipeline configure options to reduce default
>     dependencies (boost)
>   - fix another typo in commit message (Kieran Bingham)
>   - bump version to 96fab38
> 
> Changes v3 -> v4:
>   - use menuconfig
>   - force at least one default pipeline (uvcvideo)
>   - remove repetitive libcamera from options/help text
>   - remove spurios empty line
>   - add reviewd-by from Kieran
> ---
>  package/libcamera/Config.in      | 58 ++++++++++++++++++++++++---
>  package/libcamera/libcamera.hash | 15 +++++--
>  package/libcamera/libcamera.mk   | 67 +++++++++++++++++++++++++++++---
>  3 files changed, 125 insertions(+), 15 deletions(-)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index 0b3540a657..56ca5aaf18 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -1,10 +1,12 @@
> -config BR2_PACKAGE_LIBCAMERA
> +menuconfig BR2_PACKAGE_LIBCAMERA
>  	bool "libcamera"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	# C++11 + https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54316
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
> -	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
> +	depends on !BR2_STATIC_LIBS # gnutls
> +	depends on BR2_USE_WCHAR # gnutls
> +	select BR2_PACKAGE_GNUTLS
> +	select BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO if !BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
>  	help
>  	  libcamera provides a software stack to support
>  	  complex devices that need heavy hardware image
> @@ -12,6 +14,50 @@ config BR2_PACKAGE_LIBCAMERA
>  
>  	  http://www.libcamera.org/
>  
> -comment "libcamera needs udev and a toolchain w/ C++, threads, gcc >= 5"
> +if BR2_PACKAGE_LIBCAMERA
> +
> +config BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
> +	bool
> +
> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3
> +	bool "ipu3 pipeline"
> +	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
> +	help
> +	  Pipeline for Intel IPU3.
> +
> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
> +	bool "raspberrypi pipeline"
> +	depends on BR2_USE_WCHAR # boost (already enforced for gnutls)
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
> +	help
> +	  Pipeline for Raspberry Pi devices.
> +
> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
> +	bool "rkisp1 pipeline"
> +	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
> +	help
> +	  Pipeline for Rockchip ISP1.
> +
> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE
> +	bool "simple pipeline"
> +	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
> +	help
> +	  Pipeline for simple pipelines.
> +
> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO
> +	bool "uvcvideo pipeline"
> +	help
> +	  Pipeline for uvcvideo devices.
> +
> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC
> +	bool "vimc pipeline"
> +	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
> +	help
> +	  Pipeline for the vimc device.
> +
> +endif # BR2_PACKAGE_LIBCAMERA
> +
> +comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 5"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_PACKAGE_HAS_UDEV
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index 6f721d87ee..907764de63 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,3 +1,12 @@
> -sha256 cbaa7e06059717f71b57f9c20135c86d5f121d9aab10bfc20513ba5d04478756  libcamera-448393f77ec9e37cb807e8e8d35c1a4877d253d4.tar.gz
> -sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/gnu-gpl-2.0.txt
> -sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  licenses/gnu-lgpl-2.1.txt
> +sha256  6995be9d707ba3bcbe7a79bad894484561ee686f68b6523943ada7c0f6607e86  libcamera-96fab38e02792a109c0d35ca2154e95a7b4c8fcb.tar.gz
> +
> +# license files
> +sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> +sha256  e11af671c491efac2f94c1d752bea92f4308ca2450c7d11e582e4b48c40e4de1  LICENSES/BSD-3-Clause.txt
> +sha256  6a573fb2f9082662978cf21fb153096df0a1981deaea7dbc10a11046fe005d9f  LICENSES/CC0-1.0.txt
> +sha256  ec3732087acf8c52429a020d6bba362ff578705bdb53365a21744485ec15b0e6  LICENSES/CC-BY-SA-4.0.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
> +sha256  606aa26338f69ce178f1cbc648b7574aec4b5bbaeb20f4df36ff49010cb8fbbd  LICENSES/GPL-2.0-or-later.txt
> +sha256  1ccf09bf2f598308df4bed9cd8e9657dc5cd0973d2800318f2e241486e2edf3f  LICENSES/LGPL-2.1-or-later.txt
> +sha256  3f9e477523febab58de8b716ccfbcf02e6ef1c8e7728953905e8558637abe2a9  LICENSES/Linux-syscall-note.txt
> +sha256  8f25018489d6fe0dec34a352314c38dc146247b7de65735790f4398a92afa84b  LICENSES/MIT.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index d209a38df3..c7513d2e68 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,14 +5,69 @@
>  ################################################################################
>  
>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = 448393f77ec9e37cb807e8e8d35c1a4877d253d4
> +LIBCAMERA_VERSION = 96fab38e02792a109c0d35ca2154e95a7b4c8fcb
>  LIBCAMERA_SITE_METHOD = git
> -LIBCAMERA_DEPENDENCIES = udev
> -LIBCAMERA_CONF_OPTS = -Dtest=false -Ddocumentation=false
> +LIBCAMERA_DEPENDENCIES = \
> +	host-openssl \
> +	host-pkgconf \
> +	host-python3-pyyaml \
> +	gnutls
> +LIBCAMERA_CONF_OPTS = \
> +	-Dandroid=false \
> +	-Ddocumentation=false \
> +	-Dtest=false \
> +	-Dv4l2=false
>  LIBCAMERA_INSTALL_STAGING = yes
> -LIBCAMERA_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (utils)
> +LIBCAMERA_LICENSE = \
> +	LGPL-2.1+ (library), \
> +	GPL-2.0+ (utils), \
> +	MIT (qcam/assets/feathericons), \
> +	BSD-2-Clause (raspberrypi), \
> +	GPL-2.0 with Linux-syscall-note or BSD-3-Clause (linux kernel headers), \
> +	CC0-1.0 (meson build system), \
> +	CC-BY-SA-4.0 (doc)
>  LIBCAMERA_LICENSE_FILES = \
> -	licenses/gnu-gpl-2.0.txt \
> -	licenses/gnu-lgpl-2.1.txt
> +	LICENSES/LGPL-2.1-or-later.txt \
> +	LICENSES/GPL-2.0-or-later.txt \
> +	LICENSES/MIT.txt \
> +	LICENSES/BSD-2-Clause.txt \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/Linux-syscall-note.txt \
> +	LICENSES/BSD-3-Clause.txt \
> +	LICENSES/CC0-1.0.txt \
> +	LICENSES/CC-BY-SA-4.0.txt
> +
> +LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
> +ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI),y)
> +LIBCAMERA_PIPELINES-y += raspberrypi
> +LIBCAMERA_DEPENDENCIES += boost
> +endif
> +LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
> +LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE) += simple
> +LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO) += uvcvideo
> +LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC) += vimc
> +
> +LIBCAMERA_CONF_OPTS += -Dpipelines=$(subst $(space),$(comma),$(LIBCAMERA_PIPELINES-y))
> +
> +# gstreamer-video-1.0, gstreamer-allocators-1.0
> +ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
> +LIBCAMERA_CONF_OPTS += -Dgstreamer=enabled
> +LIBCAMERA_DEPENDENCIES += gstreamer1 gst1-plugins-base
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
> +LIBCAMERA_DEPENDENCIES += qt5base
> +ifeq ($(BR2_PACKAGE_QT5TOOLS)$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),yy)
> +LIBCAMERA_DEPENDENCIES += qt5tools
> +endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TIFF),y)
> +LIBCAMERA_DEPENDENCIES += tiff
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +LIBCAMERA_DEPENDENCIES += udev
> +endif
>  
>  $(eval $(meson-package))
> -- 
> 2.27.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
