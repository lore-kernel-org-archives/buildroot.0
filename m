From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Jan 2016 11:20:29 -0300
Subject: [Buildroot] [PATCH v2 5/6] wayland: bump to version 1.9.0
In-Reply-To: <1452003630-14516-1-git-send-email-gustavo@zacarias.com.ar>
References: <1452003630-14516-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1452003630-14516-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wayland-scanner host/cross support is now native so drop the funky
trick.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wayland/wayland.hash |  4 ++--
 package/wayland/wayland.mk   | 15 ++-------------
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 316d6b5..0deafd0 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,2 +1,2 @@
-# From: http://lists.freedesktop.org/archives/wayland-devel/2015-June/022630.html
-sha256  f17c938d1c24fd0a10f650a623a2775d329db3168b5732e498b08388ec776fc8 wayland-1.8.1.tar.xz
+# http://lists.freedesktop.org/archives/wayland-devel/2015-September/024302.html
+sha256  9c8770720aa0034479735f58a4dc4ca9b172ecfede28f5134312e135b7301efa	wayland-1.9.0.tar.xz
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 4e44fa0..74142ec 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.8.1
+WAYLAND_VERSION = 1.9.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
@@ -14,18 +14,7 @@ WAYLAND_INSTALL_STAGING = YES
 WAYLAND_DEPENDENCIES = libffi host-pkgconf host-wayland expat
 
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
