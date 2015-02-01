From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 22:19:28 +0100
Subject: [Buildroot] [git commit] neardal: bump version
Message-ID: <20150201211956.418477FA52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7cd6782ad79edce02ff6ab6d8885c92ec128ad85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add dependency on either readline or libedit, which is needed
for new versions of neardal.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/neardal/Config.in  |    1 +
 package/neardal/neardal.mk |   10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/neardal/Config.in b/package/neardal/Config.in
index 0e87171..c729283 100644
--- a/package/neardal/Config.in
+++ b/package/neardal/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_NEARDAL
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_READLINE if !BR2_PACKAGE_LIBEDIT
 	help
 	  Provides a simple C API to exchange data with the neard NFC
 	  manager daemon.
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index 0720fe8..cbbc628 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEARDAL_VERSION = da8e06d3884d214bb19b894d2b8fdc9c7ca8575f
+NEARDAL_VERSION = 33b54a55032b047fd885a5eb3592c169c0056c49
 NEARDAL_SITE = $(call github,connectivity,neardal,$(NEARDAL_VERSION))
 NEARDAL_INSTALL_STAGING = YES
 NEARDAL_LICENSE = GPLv2
@@ -13,6 +13,14 @@ NEARDAL_LICENSE_FILES = COPYING
 NEARDAL_DEPENDENCIES = host-pkgconf dbus dbus-glib
 NEARDAL_AUTORECONF = YES
 
+# Either readline or libedit are needed, and the Config.in file
+# guarantees at least one of them is enabled
+ifeq ($(BR2_PACKAGE_READLINE),y)
+NEARDAL_DEPENDENCIES += readline
+else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+NEARDAL_DEPENDENCIES += libedit
+endif
+
 define NEARDAL_INSTALL_NCL
 	$(INSTALL) -m 0755 -D $(@D)/ncl/ncl $(TARGET_DIR)/usr/bin/ncl
 endef
