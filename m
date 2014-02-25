From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Feb 2014 23:02:07 +0100
Subject: [Buildroot] [PATCH 07/10] package/libopenvg: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1393365231.git.yann.morin.1998@free.fr>
References: <cover.1393365231.git.yann.morin.1998@free.fr>
Message-ID: <2659fb4f807c11d8d257bf90934431fece8117da.1393365231.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
---
 package/cairo/cairo.mk                |  2 +-
 package/opengl/libopenvg/Config.in    |  6 +++---
 package/opengl/libopenvg/libopenvg.mk | 12 +-----------
 package/rpi-userland/Config.in        |  4 ++--
 4 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index ee58aff..43238ca 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -61,7 +61,7 @@ else
 	CAIRO_CONF_OPT += --disable-glesv2
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_OPENVG),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
 	CAIRO_CONF_OPT += --enable-vg
 	CAIRO_DEPENDENCIES += libopenvg
 else
diff --git a/package/opengl/libopenvg/Config.in b/package/opengl/libopenvg/Config.in
index 9d31525..53cde6a 100644
--- a/package/opengl/libopenvg/Config.in
+++ b/package/opengl/libopenvg/Config.in
@@ -1,6 +1,6 @@
-config BR2_PACKAGE_HAS_OPENVG
+config BR2_PACKAGE_HAS_LIBOPENVG
 	bool
 
-config BR2_PACKAGE_PROVIDES_OPENVG
-	depends on BR2_PACKAGE_HAS_OPENVG
+config BR2_PACKAGE_PROVIDES_LIBOPENVG
+	depends on BR2_PACKAGE_HAS_LIBOPENVG
 	string
diff --git a/package/opengl/libopenvg/libopenvg.mk b/package/opengl/libopenvg/libopenvg.mk
index ffd9d68..3ce85a1 100644
--- a/package/opengl/libopenvg/libopenvg.mk
+++ b/package/opengl/libopenvg/libopenvg.mk
@@ -4,14 +4,4 @@
 #
 ################################################################################
 
-LIBOPENVG_SOURCE =
-LIBOPENVG_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENVG))
-
-ifeq ($(LIBOPENVG_DEPENDENCIES),)
-define LIBOPENVG_CONFIGURE_CMDS
-	echo "No libOpenVG implementation selected. Configuration error."
-	exit 1
-endef
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 68ac1f6..aeee5e1 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_RPI_USERLAND
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_HAS_OPENVG
+	select BR2_PACKAGE_HAS_LIBOPENVG
 	select BR2_PACKAGE_HAS_LIBOPENMAX
 	help
 	  Raspberry Pi Userland contains the necessary library to use the
@@ -25,7 +25,7 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "rpi-userland"
 
-config BR2_PACKAGE_PROVIDES_OPENVG
+config BR2_PACKAGE_PROVIDES_LIBOPENVG
 	default "rpi-userland"
 
 config BR2_PACKAGE_PROVIDES_LIBOPENMAX
-- 
1.8.3.2
