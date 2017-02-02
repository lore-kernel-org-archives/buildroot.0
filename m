From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 Feb 2017 23:20:14 +0100
Subject: [Buildroot] [PATCH v6 5/9] qt5declarative: enable Quick for
 non-GL platforms for Qt 5.8.0
In-Reply-To: <1485849551-20469-6-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1485849551-20469-6-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <f6764894-9b11-b449-f970-c94811e8089a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-01-17 08:59, Zoltan Gyarmati wrote:
> From: Naumann Andreas <ANaumann@ultratronik.de>
> 
> Since Qt 5.8.0 provides a software rasterizer we can enable Quick for non-GL
> platforms. However, some modules provide less functionality without OpenGL,
> so install steps have to be limited for the softrender only backend:
> - qtmultimedia does not provide qml
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  package/qt5/qt5declarative/Config.in       | 6 +++---
>  package/qt5/qt5multimedia/qt5multimedia.mk | 3 +++
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
> index eba4c8d..a8accdb 100644
> --- a/package/qt5/qt5declarative/Config.in
> +++ b/package/qt5/qt5declarative/Config.in
> @@ -15,11 +15,11 @@ config BR2_PACKAGE_QT5DECLARATIVE
>  if BR2_PACKAGE_QT5DECLARATIVE
>  
>  comment "quick module needs an OpenGL-capable backend"
> -	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_QT5_VERSION_5_6
>  
>  config BR2_PACKAGE_QT5DECLARATIVE_QUICK
>  	bool "quick module"
> -	select BR2_PACKAGE_QT5BASE_OPENGL
> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
> +	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_QT5_VERSION_5_8

 This means that the conditions that are added to be able to select
BR2_PACKAGE_QT5DECLARATIVE_QUICK are no longer correct (e.g. in
qt5quickcontrols). Since the condition is a bit complicated, it's probably
better to add an auxiliary symbol:

config BR2_PACKAGE_QT5DECLARATIVE_QUICK_AVAILABLE
	default y
	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || !BR2_QT5_VERSION_5_6

comment "quick module needs an OpenGL-capable backend"
	depends on !BR2_PACKAGE_QT5DECLARATIVE_QUICK_AVAILABLE

etc.

 Do that as a separate patch that converts all the existing users of
BR2_PACKAGE_QT5DECLARATIVE_QUICK.

 Note that it has to be checked if all the packages that now depend on
BR2_PACKAGE_QT5_GL_AVAILABLE really do work with the softrenderer.



>  
>  endif
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
> index 7ce947a..b11b8d1 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.mk
> +++ b/package/qt5/qt5multimedia/qt5multimedia.mk
> @@ -58,11 +58,14 @@ define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
>  endef
>  endif
>  
> +# QtMultimedia QMLs have a hard dependency on OpenGL -> not available for softraster backends

 Line is too long - wrap at 80 characters.

 Just to be sure: if you try to use these QML classes you get a runtime failure,
correct? So the only reason not to copy them is that we know they won't work anyway?

 Regards,
 Arnout

> +ifeq ($(BR2_PACKAGE_QT5_GL_AVAILABLE),y)
>  ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
>  define QT5MULTIMEDIA_INSTALL_TARGET_QMLS
>  	cp -dpfr $(STAGING_DIR)/usr/qml/QtMultimedia $(TARGET_DIR)/usr/qml/
>  endef
>  endif
> +endif
>  
>  ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
>  define QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
