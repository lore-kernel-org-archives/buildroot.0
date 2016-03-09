From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 06:58:43 -0300
Subject: [Buildroot] [PATCH v3 5/7] wayland: bump to version 1.10.0
In-Reply-To: <1457517525-7716-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457517525-7716-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1457517525-7716-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wayland-scanner host/cross support is now native so drop the funky
trick.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wayland/Config.in    |  3 ++-
 package/wayland/wayland.hash |  4 ++--
 package/wayland/wayland.mk   | 18 +++---------------
 3 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/package/wayland/Config.in b/package/wayland/Config.in
index 857ba73..32718fc 100644
--- a/package/wayland/Config.in
+++ b/package/wayland/Config.in
@@ -2,8 +2,9 @@ config BR2_PACKAGE_WAYLAND
 	bool "wayland"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_LIBXML2
 	help
 	  Wayland is a project to define a protocol for a compositor
 	  to talk to its clients as well as a library implementation
diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 316d6b5..c9d0721 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,2 +1,2 @@
-# From: http://lists.freedesktop.org/archives/wayland-devel/2015-June/022630.html
-sha256  f17c938d1c24fd0a10f650a623a2775d329db3168b5732e498b08388ec776fc8 wayland-1.8.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-February/027038.html
+sha256  4bf6e790aa6f50ab3825676282ecd75850ec9c4767af96ecb7127b1f3c3d60dc	wayland-1.10.0.tar.xz
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 4e44fa0..215e70a 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,28 +4,16 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.8.1
+WAYLAND_VERSION = 1.10.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
 WAYLAND_LICENSE_FILES = COPYING
-
 WAYLAND_INSTALL_STAGING = YES
-WAYLAND_DEPENDENCIES = libffi host-pkgconf host-wayland expat
+WAYLAND_DEPENDENCIES = host-pkgconf host-wayland expat libffi libxml2
 
 # wayland-scanner is only needed for building, not on the target
-WAYLAND_CONF_OPTS = --disable-scanner
-
-# We must provide a specialy-crafted wayland-scanner .pc file
-# which we vampirise and adapt from the host-wayland copy
-define WAYLAND_SCANNER_PC
-	$(INSTALL) -m 0644 -D $(HOST_DIR)/usr/lib/pkgconfig/wayland-scanner.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
-	$(SED) 's:^prefix=.*:prefix=/usr:' \
-		-e 's:^wayland_scanner=.*:wayland_scanner=$(HOST_DIR)/usr/bin/wayland-scanner:' \
-		$(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
-endef
-WAYLAND_POST_INSTALL_STAGING_HOOKS += WAYLAND_SCANNER_PC
+WAYLAND_CONF_OPTS = --disable-scanner --with-host-scanner
 
 # Remove the DTD from the target, it's not needed at runtime
 define WAYLAND_TARGET_CLEANUP
-- 
2.4.10
