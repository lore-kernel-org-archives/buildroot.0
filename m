From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Thu,  6 Jan 2011 17:53:15 +0200
Subject: [Buildroot] [PATCH 1/6] gstreamer: remove unnecessary feature
In-Reply-To: <1294329200-10418-1-git-send-email-felipe.contreras@gmail.com>
References: <1294329200-10418-1-git-send-email-felipe.contreras@gmail.com>
Message-ID: <1294329200-10418-2-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 0.10.11 the binary-registry was added, on 0.10.12 the libxml2
dependency was dropped when binary-registry was used, on 0.10.18 the
binary-registry was made default, and on 0.10.23 it was the only option.

So, libxml2 is not needed any more for the registry.

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/gstreamer/Config.in    |    6 ------
 package/multimedia/gstreamer/gstreamer.mk |   10 ++--------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index a3ce859..7de904c 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -9,9 +9,3 @@ config BR2_PACKAGE_GSTREAMER
 
 comment "gstreamer requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
-
-config BR2_PACKAGE_GSTREAMER_LIBXML2
-	bool "require libxml2 for registry and load/save"
-	default y
-	select BR2_PACKAGE_LIBXML2
-	depends on BR2_PACKAGE_GSTREAMER
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 49ac0df..d689619 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -19,15 +19,9 @@ endif
 GSTREAMER_CONF_OPT = \
 		--disable-examples \
 		--disable-tests \
-		--disable-failing-tests
+		--disable-failing-tests \
+		--disable-loadsave
 
 GSTREAMER_DEPENDENCIES = libglib2 host-pkg-config
 
-ifeq ($(BR2_PACKAGE_GSTREAMER_LIBXML2),y)
-GSTREAMER_DEPENDENCIES += libxml2
-else
-GSTREAMER_CONF_OPT += \
-	--disable-loadsave
-endif
-
 $(eval $(call AUTOTARGETS,package/multimedia,gstreamer))
-- 
1.7.4.rc1
