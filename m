From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 27 Jun 2017 12:26:47 +0200
Subject: [Buildroot] [PATCH v4 11/11] package/qt5base: provide "qt.conf" to
	make "qmake" relocatable
In-Reply-To: <1498559207-8050-1-git-send-email-wg@grandegger.com>
References: <1498559207-8050-1-git-send-email-wg@grandegger.com>
Message-ID: <1498559207-8050-12-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The file "qt.conf" can be used to override the hard-coded paths that are
compiled into the Qt library. We need it to make "qmake" relocatable.

CC: Julien Corjon <corjon.j@ecagroup.com>
CC: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 package/qt5/qt5base/qt.conf.in | 6 ++++++
 package/qt5/qt5base/qt5base.mk | 8 ++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 package/qt5/qt5base/qt.conf.in

diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
new file mode 100644
index 0000000..48e4b92
--- /dev/null
+++ b/package/qt5/qt5base/qt.conf.in
@@ -0,0 +1,6 @@
+[Paths]
+Prefix=@@HOST_DIR@@/usr
+Sysroot=@@STAGING_DIR@@
+Headers=/usr/include/qt5
+Plugins=/usr/lib/qt/plugins
+Examples=/usr/lib/qt/examples
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 5fe8bb8..71dbd5d 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -258,9 +258,17 @@ define QT5BASE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
+# The file "qt.conf" can be used to override the hard-coded paths that are
+# compiled into the Qt library. We need it to make "qmake" relocatable.
+define QT5BASE_INSTALL_QT_CONF
+	sed -e "s\\@@HOST_DIR@@\\$(HOST_DIR)\\" -e "s\\@@STAGING_DIR@@\\$(STAGING_DIR)\\" \
+	$(QT5BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/usr/bin/qt.conf
+endef
+
 define QT5BASE_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 	$(QT5_LA_PRL_FILES_FIXUP)
+	$(QT5BASE_INSTALL_QT_CONF)
 endef
 
 define QT5BASE_INSTALL_TARGET_LIBS
-- 
2.7.4
