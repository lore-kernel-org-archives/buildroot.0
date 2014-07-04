From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 Jul 2014 22:03:09 +0200
Subject: [Buildroot] [PATCH] qt5: Add an option to select default
	platform
In-Reply-To: <1404466571-27586-1-git-send-email-jezz@sysmic.org>
References: <1404466571-27586-1-git-send-email-jezz@sysmic.org>
Message-ID: <53B7087D.4080801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/07/14 11:36, J?r?me Pouiller wrote:
> Whithout this path, default platform is automaticaly set (generally
> set to "eglfs" as defined in
> qt5base/mkspecs/devices/common/linux_device_pre.conf:1). This choice
> is not always what the user would like. Thus, user have to manually
> appends "-platform <BACKEND>" to command line when running any qt5
> application.
> 
> This patch allows user to choose default platform explicitly.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/qt5/qt5base/Config.in  | 43 ++++++++++++++++++++++++++++++++++++++++++
>  package/qt5/qt5base/qt5base.mk |  6 ++++++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index 70ddcd3..5fa7c02 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -144,6 +144,49 @@ config BR2_PACKAGE_QT5BASE_EGLFS
>  comment "eglfs backend available if OpenGLES and EGL are enabled"
>  	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
>  
> +choice
> +	prompt "default graphical platform"
> +	default BR2_PACKAGE_QT5BASE_DEFAULT_QPA_MINIMAL

 I wonder if it is really worthwhile to make this a choice. That means that
whenever a new platform is added (wayland, vnc, ...) we have to update the
choice. And one could imagine a user implementing their own QPA plugin...

 So I would propose to make this a string, default to empty, and when it's empty
don't pass the -qpa option.

 Help text could be something like

	  Choose the default platform abstraction to use for graphical
	  application. If this is empty, the default for your architecture
	  will be used (usually this is eglfs).

	  You can get a list of supported platform by running a Qt application
	  with the option "-platform help" on your target. You can choose a
	  different platform at runtime with the -platform option.



 Regards,
 Arnout

> +	help
> +	  Notice you may choose platform at runtime using -platform (-platform
> +	  help to get list of compiled platforms).
> +
> +config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_MINIMAL
> +	bool "minimal"
> +
> +config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_OFFSCREEN
> +	bool "offscreen"
> +
> +config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_LINUXFB
> +	bool "linuxfb"
> +	depends on BR2_PACKAGE_QT5BASE_LINUXFB
> +
> +comment 'linuxfb needs linuxfb support enabled'
> +	depends on !BR2_PACKAGE_QT5BASE_LINUXFB
> +
> +config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_DIRECTFB
> +	bool "directfb"
> +	depends on BR2_PACKAGE_QT5BASE_DIRECTFB
> +
> +comment 'directfb needs directfb support enabled'
> +	depends on !BR2_PACKAGE_QT5BASE_DIRECTFB
> +
> +config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_XCB
> +	bool "xcb"
> +	depends on BR2_PACKAGE_QT5BASE_XCB
> +
> +comment 'xcb needs X.org XCB support enabled'
> +	depends on !BR2_PACKAGE_QT5BASE_XCB
> +
> +config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_EGLFS
> +	bool "eglfs"
> +	depends on BR2_PACKAGE_QT5BASE_EGLFS
> +
> +comment 'eglfs needs eglfs support enabled'
> +	depends on !BR2_PACKAGE_QT5BASE_EGLFS
> +
> +endchoice
> +
>  config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
>  	bool "print support module"
>  	select BR2_PACKAGE_QT5BASE_WIDGETS
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 618251e..9018ff8 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -96,6 +96,12 @@ else
>  QT5BASE_CONFIGURE_OPTS += -no-xcb
>  endif
>  
> +QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DEFAULT_QPA_MINIMAL),-qpa minimalb)
> +QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DEFAULT_QPA_OFFSCREEN),-qpa offscreen)
> +QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DEFAULT_QPA_LINUXFB),-qpa linuxfb)
> +QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DEFAULT_QPA_XCB),-qpa xcb)
> +QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DEFAULT_QPA_EGLFS),-qpa eglfs)
> +
>  ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
>  QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs
>  QT5BASE_DEPENDENCIES   += libgles libegl
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
