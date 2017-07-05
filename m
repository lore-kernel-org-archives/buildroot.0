From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed,  5 Jul 2017 18:53:14 +0200
Subject: [Buildroot] [PATCH v7 9/9] package/qt5base: provide "qt.conf" to
	make "qmake" relocatable
In-Reply-To: <1499273594-12106-1-git-send-email-wg@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
Message-ID: <1499273594-12106-10-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The file "qt.conf" can be used to override the hard-coded paths that
are compiled into the Qt library. This is required to make "qmake"
relocatable. Actually, we need to specify all variables to overwrite
the compiled in values.

CC: Julien Corjon <corjon.j@ecagroup.com>
CC: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 package/qt5/qt5base/qt.conf.in | 19 +++++++++++++++++++
 package/qt5/qt5base/qt5base.mk |  8 ++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 package/qt5/qt5base/qt.conf.in

diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
new file mode 100644
index 0000000..67ae04d
--- /dev/null
+++ b/package/qt5/qt5base/qt.conf.in
@@ -0,0 +1,19 @@
+[Paths]
+Prefix=@@HOST_DIR@@/usr
+Sysroot=@@STAGING_DIR@@
+Headers=/usr/include/qt5
+Libraries=/usr/lib
+LibraryExecutables=/usr/libexec
+Binaries=/usr/bin
+Plugins=/usr/lib/qt/plugins
+Examples=/usr/lib/qt/examples
+Qml2Imports=/usr/qml
+Imports=/usr/imports
+Translations=/usr/translations
+Examples=/usr/lib/qt/examples
+Demos=/usr/lib/qt/examples
+Tests=/usr/tests
+Settings=/usr
+Documentation=/usr/doc
+ArchData=/usr
+Data=/usr
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index c5d2aa1..71592b2 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -258,9 +258,17 @@ define QT5BASE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
+# The file "qt.conf" can be used to override the hard-coded paths that are
+# compiled into the Qt library. We need it to make "qmake" relocatable.
+define QT5BASE_INSTALL_QT_CONF
+	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
+		$(QT5BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/usr/bin/qt.conf
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
