From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 23:53:51 +0100
Subject: [Buildroot] [PATCH 4/5] qt5declarative: enable Quick for non-GL
 platforms
In-Reply-To: <1478601048-21388-5-git-send-email-anaumann@ultratronik.de>
References: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
 <1478601048-21388-5-git-send-email-anaumann@ultratronik.de>
Message-ID: <adaf71af-b685-8ba8-36dd-ce58e26fed4f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 11:30, Andreas Naumann wrote:
> However, some modules provide less functionality without OpenGL, so install
> steps have to be limited for the softrender only backend:
> - qtmultimedia does not provide qml
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/qt5/qt5declarative/Config.in       | 4 +---
>  package/qt5/qt5multimedia/qt5multimedia.mk | 2 ++
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
> index eba4c8d..0604e85 100644
> --- a/package/qt5/qt5declarative/Config.in
> +++ b/package/qt5/qt5declarative/Config.in
> @@ -14,12 +14,10 @@ config BR2_PACKAGE_QT5DECLARATIVE
>  
>  if BR2_PACKAGE_QT5DECLARATIVE
>  
> -comment "quick module needs an OpenGL-capable backend"
> +comment "quick module without OpenGL-capable backend will use a less performant software backend"

 I think this comment can just be removed.

>  	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
>  
>  config BR2_PACKAGE_QT5DECLARATIVE_QUICK
>  	bool "quick module"
> -	select BR2_PACKAGE_QT5BASE_OPENGL
> -	depends on BR2_PACKAGE_QT5_GL_AVAILABLE

 Shouldn't this be
	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5_GL_AVAILABLE
? We really want to use opengl if we can...

>  
>  endif
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
> index 67e7968..41eb0f6 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.mk
> +++ b/package/qt5/qt5multimedia/qt5multimedia.mk
> @@ -53,11 +53,13 @@ define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
>  endef
>  endif
>  
> +ifeq ($(BR2_PACKAGE_QT5_GL_AVAILABLE),y)

 Add a comment here to explain why, it looks a bit strange.

 Regards,
 Arnout

>  ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
>  define QT5MULTIMEDIA_INSTALL_TARGET_QMLS
>  	cp -dpfr $(STAGING_DIR)/usr/qml/QtMultimedia $(TARGET_DIR)/usr/qml/
>  endef
>  endif
> +endif
>  
>  define QT5MULTIMEDIA_INSTALL_TARGET_CMDS
>  	$(QT5MULTIMEDIA_INSTALL_TARGET_LIBS)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
