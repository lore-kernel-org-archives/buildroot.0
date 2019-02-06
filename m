From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 15:44:24 +0100
Subject: [Buildroot] [git commit] package/quazip: remove qt4 support
Message-ID: <20190206145217.1BDE68040D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=537948d06b5b62e47c7216f12172217bd444324c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt4 support is about to be dropped, so remove the support from quazip as
well.

Also add an explicit depends on for qt5 for consistency with other packages.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/quazip/Config.in |  1 +
 package/quazip/quazip.mk | 11 ++---------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/quazip/Config.in b/package/quazip/Config.in
index 83537d4613..e980297558 100644
--- a/package/quazip/Config.in
+++ b/package/quazip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QUAZIP
 	bool "quazip"
+	depends on BR2_PACKAGE_QT5
 	select BR2_PACKAGE_ZLIB
 	help
 	  QuaZIP is a simple C++ wrapper over Gilles Vollant's
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 872340ab40..aba8274506 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -9,19 +9,12 @@ QUAZIP_SITE = $(call github,stachenov,quazip,$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = \
 	zlib \
-	$(if $(BR2_PACKAGE_QT),qt) \
-	$(if $(BR2_PACKAGE_QT5),qt5base)
+	qt5base
 QUAZIP_LICENSE = LGPL-2.1
 QUAZIP_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_QT5),y)
-QUAZIP_QMAKE = $(QT5_QMAKE)
-else
-QUAZIP_QMAKE = $(QT_QMAKE)
-endif
-
 define QUAZIP_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QUAZIP_QMAKE) PREFIX=/usr)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) PREFIX=/usr)
 endef
 
 define QUAZIP_BUILD_CMDS
