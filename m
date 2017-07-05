From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:28:23 +0200
Subject: [Buildroot] [git commit] Revert "package/qt5base: provide "qt.conf"
	to make "qmake" relocatable"
Message-ID: <20170705092619.E2D50817BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6858e21b523b98271d195627e5b7d3587feebce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit a2efb84dec42608e46860a24c31db5a4588edd1e, as it
causes files to be installed in an invalid location, causing build
failures.

Fixes:

  http://autobuild.buildroot.net/results/a1a9eeb7fec07a2f9f0d05e6c1900ad7cffb6656/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt.conf.in | 6 ------
 package/qt5/qt5base/qt5base.mk | 8 --------
 2 files changed, 14 deletions(-)

diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
deleted file mode 100644
index 48e4b92..0000000
--- a/package/qt5/qt5base/qt.conf.in
+++ /dev/null
@@ -1,6 +0,0 @@
-[Paths]
-Prefix=@@HOST_DIR@@/usr
-Sysroot=@@STAGING_DIR@@
-Headers=/usr/include/qt5
-Plugins=/usr/lib/qt/plugins
-Examples=/usr/lib/qt/examples
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 3e55002..5fe8bb8 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -258,17 +258,9 @@ define QT5BASE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
-# The file "qt.conf" can be used to override the hard-coded paths that are
-# compiled into the Qt library. We need it to make "qmake" relocatable.
-define QT5BASE_INSTALL_QT_CONF
-	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
-		$(QT5BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/usr/bin/qt.conf
-endef
-
 define QT5BASE_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 	$(QT5_LA_PRL_FILES_FIXUP)
-	$(QT5BASE_INSTALL_QT_CONF)
 endef
 
 define QT5BASE_INSTALL_TARGET_LIBS
