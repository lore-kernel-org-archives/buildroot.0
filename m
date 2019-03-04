From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Mar 2019 20:13:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5base: add
 BR2_PACKAGE_QT5BASE_OPENSSL
In-Reply-To: <20190304172808.4672-1-fontaine.fabrice@gmail.com>
References: <20190304172808.4672-1-fontaine.fabrice@gmail.com>
Message-ID: <65868048-c722-551d-9f8a-2c8bb213f221@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/03/2019 18:28, Fabrice Fontaine wrote:
> Commit c110e48cecde6f543da18388322907b05b25e7d2 disabled openssl support
> on QT 5.6, this has the side-effect of breaking the build of
> python-pyqt5 because support of openssl is enabled on python-pyqt5 if
> BR2_PACKAGE_OPENSSL is selected
> 
> To fix this issue, add a new BR2_PACKAGE_QT5BASE_OPENSSL option in
> qt5base and use it in python-pyqt5

 I like it!

> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e92991308d47649cecc4084e41ab5711ec96831f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-pyqt5/python-pyqt5.mk | 2 +-
>  package/qt5/qt5base/Config.in        | 8 ++++++++
>  package/qt5/qt5base/qt5base.mk       | 9 ++-------
>  3 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
> index cde026ef63..4955936ae3 100644
> --- a/package/python-pyqt5/python-pyqt5.mk
> +++ b/package/python-pyqt5/python-pyqt5.mk
> @@ -25,9 +25,9 @@ PYTHON_PYQT5_QTDETAIL_LICENSE = Open Source
>  PYTHON_PYQT5_QTDETAIL_TYPE = shared
>  
>  # Turn off features that aren't available in current qt configuration
> -PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_OPENSSL),,PyQt_SSL)
>  PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL),,PyQt_OpenGL)
>  PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP),,PyQt_Desktop_OpenGL)
> +PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENSSL),,PyQt_SSL)
>  
>  define PYTHON_PYQT5_QTDETAIL
>  	echo $(1) >> $(2)/qtdetail.out
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index 1340ea48f0..709fec8d3b 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -286,6 +286,14 @@ comment "icu support needs a toolchain w/ gcc >= 4.8, host gcc >= 4.8"
>  	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
>  		!BR2_HOST_GCC_AT_LEAST_4_8
>  
> +config BR2_PACKAGE_QT5BASE_OPENSSL
> +	bool "OpenSSL support"

 Since this was implicitly enabled before, you should add

	default y

here.

> +	# No OpenSSL 1.1.x support in Qt 5.6.x
> +	depends on !BR2_PACKAGE_QT5_VERSION_5_6

 James added a follow-up patch that re-enabled it for libressl. That one would
have to be rewritten as well, obviously. It will be difficult, though, since you
get circular dependencies... So, if that can't be solved, I'm not sure we should
accept this patch either (although I really like the approach).

 Regards,
 Arnout

> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  This option enables OpenSSL support.
> +
>  config BR2_PACKAGE_QT5BASE_TSLIB
>  	bool "Enable Tslib support"
>  	select BR2_PACKAGE_TSLIB
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index a5ce583327..20f8a21d91 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -188,13 +188,8 @@ else
>  QT5BASE_CONFIGURE_OPTS += -no-eglfs
>  endif
>  
> -ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
> -# No OpenSSL 1.1.x support in Qt 5.6.x
> -QT5BASE_CONFIGURE_OPTS += -no-openssl
> -else
> -QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
> -QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
> -endif
> +QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_OPENSSL),-openssl,-no-openssl)
> +QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_OPENSSL),openssl)
>  
>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
>  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
> 
