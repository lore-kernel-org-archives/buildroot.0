From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 20:51:56 +0100
Subject: [Buildroot] [PATCH v5] qt53d: enable assimpsceneparser plugin
In-Reply-To: <1456088489-10062-1-git-send-email-ps.report@gmx.net>
References: <1456088489-10062-1-git-send-email-ps.report@gmx.net>
Message-ID: <56CCB85C.9000407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/21/16 22:01, Peter Seiderer wrote:
> - add hint to help text
> - add assimp dependency

 One thing more could have been noted in the commit message:

- always install the gltf (and any future) sceneparser to target.

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (Build-test, compared with/without assimp).


 Regards,
 Arnout

> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v4 -> v5:
>   - change assimp dependency declaration location (suggested by Arnout Vandecappelle)
> 
> Changes v3 -> v4:
>   - change to optional dependency on assimp (suggested by Thomas Petazzoni)
>   - always copy plugins/sceneparsers directory (because of new
>     gltfsceneparser plugin)
> 
> Changes v2 -> v3:
>   - no changes
> 
> Changes v1 -> v2:
>   - no changes
> ---
>  package/qt5/qt53d/Config.in | 2 ++
>  package/qt5/qt53d/qt53d.mk  | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
> index b2d2912..ff50204 100644
> --- a/package/qt5/qt53d/Config.in
> +++ b/package/qt5/qt53d/Config.in
> @@ -12,6 +12,8 @@ config BR2_PACKAGE_QT53D
>  
>  	  This package corresponds to the qt53d module.
>  
> +	  Enable the assimp package to gain the assimp sceneparser plugin.
> +
>  	  http://doc.qt.io/qt-5/qt3d-index.html
>  
>  comment "qt53d module needs an OpenGL-capable backend"
> diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
> index 810242b..24c42e6 100644
> --- a/package/qt5/qt53d/qt53d.mk
> +++ b/package/qt5/qt53d/qt53d.mk
> @@ -10,6 +10,10 @@ QT53D_SOURCE = qt3d-opensource-src-$(QT5SVG_VERSION).tar.xz
>  QT53D_DEPENDENCIES = qt5base qt5declarative
>  QT53D_INSTALL_STAGING = YES
>  
> +ifeq ($(BR2_PACKAGE_ASSIMP),y)
> +QT53D_DEPENDENCIES += assimp
> +endif
> +
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
>  QT53D_LICENSE = GPLv2+ or LGPLv3
>  QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.LGPLv3
> @@ -34,6 +38,7 @@ endef
>  ifeq ($(BR2_STATIC_LIBS),)
>  define QT53D_INSTALL_TARGET_CMDS
>  	cp -dpf $(STAGING_DIR)/usr/lib/libQt53D*.so.* $(TARGET_DIR)/usr/lib
> +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/sceneparsers $(TARGET_DIR)/usr/lib/qt/plugins
>  	cp -dpfr $(STAGING_DIR)/usr/qml/Qt3D $(TARGET_DIR)/usr/qml
>  endef
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
