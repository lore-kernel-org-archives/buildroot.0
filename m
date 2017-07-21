From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 21 Jul 2017 08:56:41 +0200
Subject: [Buildroot] [PATCH] package/qt5location: handle plugins being
 conditionally built
In-Reply-To: <1500593609-5610-1-git-send-email-joshua.henderson@microchip.com>
References: <1500593609-5610-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <trinity-2e3bcfb2-19ec-4b5f-af7f-1c84a5d187d3-1500620201526@3capp-gmx-bs73>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joshua,

> Gesendet: Freitag, 21. Juli 2017 um 01:33 Uhr
> Von: "Joshua Henderson" <joshua.henderson@microchip.com>
> An: buildroot at buildroot.org
> Cc: "Peter Seiderer" <ps.report@gmx.net>, "Julien Corjon" <corjon.j@ecagroup.com>, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Betreff: [PATCH] package/qt5location: handle plugins being conditionally built
>
> This fixes a build issue where the qt5location plugins are not built, but are
> attempted to be installed.
> 
> The qt5location plugins have dependencies that are automatically resolved
> causing plugins to conditionaly be built. This change checks for the existance
> of the plugins prior to trying to install them.
> 

No, the dependencies of the position plugins are only on module positioning (one purpose of the qt5location
package):

    $  cat src/plugins/plugins.pro 
TEMPLATE = subdirs
qtHaveModule(positioning): SUBDIRS +=  position
qtHaveModule(location): SUBDIRS += geoservices


The problem is a build-ordering, the right fix is to enable ordering in src/src.pro:

diff --git a/src/src.pro b/src/src.pro
index d0a1ee4..d45ddb8 100644
--- a/src/src.pro
+++ b/src/src.pro
@@ -1,5 +1,6 @@
 TEMPLATE = subdirs
-
+CONFIG += ordered
+ 
 SUBDIRS += 3rdparty/clip2tri 3rdparty/clipper 3rdparty/poly2tri
 3rdparty/clip2tri.depends = 3rdparty/clipper 3rdparty/poly2tri

Buildroot patch follows...

Regards,
Peter

> Fixes:
> 
>     http://autobuild.buildroot.net/results/bc1/bc13abf3bb2fe1c991aec2334ee658c9641d1fd5/build-end.log
> 
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> ---
>  package/qt5/qt5location/qt5location.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
> index e9f1e4d..fcd9fc8 100644
> --- a/package/qt5/qt5location/qt5location.mk
> +++ b/package/qt5/qt5location/qt5location.mk
> @@ -48,7 +48,9 @@ endif
>  
>  define QT5LOCATION_INSTALL_TARGET_POSITION
>  	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Positioning.so.* $(TARGET_DIR)/usr/lib
> -	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/position $(TARGET_DIR)/usr/lib/qt/plugins/
> +	if [ -d $(STAGING_DIR)/usr/lib/qt/plugins/position ] ; then \
> +		cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/position $(TARGET_DIR)/usr/lib/qt/plugins/ ; \
> +	fi
>  endef
>  
>  define QT5LOCATION_INSTALL_TARGET_CMDS
> -- 
> 2.7.4
> 
> 
