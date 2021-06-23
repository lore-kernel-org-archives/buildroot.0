From: Andreas Naumann <anaumann@ultratronik.de>
Date: Wed, 23 Jun 2021 10:39:27 +0200
Subject: [Buildroot] [PATCH 1/1] qt5: Fix sporadic build failure during
 top-level parallel build
Message-ID: <20210623083927.8278-1-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using top level parallel build, independent qt5 packages may be
built in parallel. Because of their staging dirs being hardlinked, they
all use the same qt.conf file to manipulate during configure, while
another qt5 package might already use it. This leads to weird build failures
because the folders qmake is using are diverted in erratic ways.
Fix this by actually recreating a non-shared qt.conf file for every package.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index db6ccd2b42..3ffb7b0063 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -15,6 +15,7 @@ include $(sort $(wildcard package/qt5/*/*.mk))
 # compiled into the Qt library. We need it to make "qmake" relocatable and
 # tweak the per-package install pathes
 define QT5_INSTALL_QT_CONF
+	rm -f $(HOST_DIR)/bin/qt.conf
 	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
 		$(QT5BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
 endef
-- 
2.32.0
