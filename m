From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 18:05:17 +0200
Subject: [Buildroot] [git commit] package/qt5base: provide "qt.conf" to make
	"qmake" relocatable
Message-ID: <20170704160233.6C4867FBE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2efb84dec42608e46860a24c31db5a4588edd1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The file "qt.conf" can be used to override the hard-coded paths that are
compiled into the Qt library. We need it to make "qmake" relocatable.

CC: Julien Corjon <corjon.j@ecagroup.com>
CC: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
[Thomas:
 - use | instead of \ as sed separator, suggested by Arnout.
 - fix indentation, suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt.conf.in | 6 ++++++
 package/qt5/qt5base/qt5base.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

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
index 5fe8bb8..3e55002 100644
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
