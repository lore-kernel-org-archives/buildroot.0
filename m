From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 May 2016 19:38:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/cups: add _PRE_CONFIGURE_HOOKS for
	proper autoconf
Message-ID: <1464543503-9057-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cups uses only autoconf, also using autoheader is broken:
https://github.com/apple/cups/issues/4667#issuecomment-197689571

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
I wrote this patch while trying to fix
http://autobuild.buildroot.net/results/70d/70d147fcac588610521974b8f7384e710a9a6d41/
which would end up in a major rewrite of the build system, so I
cancelled my attempt. Nonetheless I think we should have this patch
so future patches to configure.in will be easier.

 ...01-Remove-man-from-BUILDDIRS-in-configure.patch | 27 ++++++++++------------
 package/cups/cups.mk                               |  7 ++++++
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
index c0e87a4..af85ca8 100644
--- a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
+++ b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
@@ -1,21 +1,18 @@
-From a77bb18a5584bb23687ed3c522dbd91a9987d5a7 Mon Sep 17 00:00:00 2001
-From: Olivier Schonken <olivier.schonken@gmail.com>
-Date: Wed, 20 Jan 2016 22:13:11 +0200
-Subject: [PATCH] Remove man from BUILDDIRS in configure
+From 6bc1d15250841cf17d307cfb4f35c960c23d8797 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 29 May 2016 19:31:50 +0200
+Subject: [PATCH 1/1] Remove man from BUILDDIRS in configure
 
-Since cups doesn't autoreconf properly, we directly patch the
-configure script.
-
-Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- configure | 2 +-
+ config-scripts/cups-common.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure b/configure
-index 4170ff3..3879a75 100755
---- a/configure
-+++ b/configure
-@@ -5921,7 +5921,7 @@ fi
+diff --git a/config-scripts/cups-common.m4 b/config-scripts/cups-common.m4
+index fbba715..77d0f5c 100644
+--- a/config-scripts/cups-common.m4
++++ b/config-scripts/cups-common.m4
+@@ -446,7 +446,7 @@ AC_ARG_WITH(components, [  --with-components       set components to build:
  
  case "$COMPONENTS" in
  	all)
@@ -25,5 +22,5 @@ index 4170ff3..3879a75 100755
  
  	core)
 -- 
-2.5.0
+2.8.1
 
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index c07dcb4..797d31a 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -13,6 +13,12 @@ CUPS_INSTALL_STAGING = YES
 CUPS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
 CUPS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
 
+# Using autoconf, not autoheader, so we cannot use AUTORECONF = YES.
+define CUPS_RUN_AUTOCONF
+	cd $(@D); $(HOST_DIR)/usr/bin/autoconf -f
+endef
+CUPS_PRE_CONFIGURE_HOOKS += CUPS_RUN_AUTOCONF
+
 CUPS_CONF_OPTS = \
 	--without-perl \
 	--without-java \
@@ -21,6 +27,7 @@ CUPS_CONF_OPTS = \
 	--libdir=/usr/lib
 CUPS_CONFIG_SCRIPTS = cups-config
 CUPS_DEPENDENCIES = \
+	host-autoconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.8.1
