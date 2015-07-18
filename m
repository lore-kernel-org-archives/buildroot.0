From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 23:50:02 +0200
Subject: [Buildroot] [git commit] quazip: new package
Message-ID: <20150718215045.B1FFD81DCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40f0c0c122bd93fc835a44d804096f7022f833be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - fix indentation of select BR2_PACKAGE_ZLIB in Config.in
 - rewrap Config.in help text, lines were too long
 - remove depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5, since
   quazip/Config.in is already only included if one of Qt4 or Qt5 is
   enabled.
 - remove QUAZIP_SOURCE definition, since its value was the default
 - add the missing zlib dependency in the .mk file
 - add spaces around '=' signs when setting QUAZIP_QMAKE
 - pass $(TARGET_MAKE_ENV) at install time]

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/quazip/Config.in   |    9 +++++++++
 package/quazip/quazip.hash |    2 ++
 package/quazip/quazip.mk   |   39 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ddbf180..20ecd38 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -265,6 +265,7 @@ comment "QT libraries and helper libraries"
 	source "package/qextserialport/Config.in"
 	source "package/qjson/Config.in"
 	source "package/qtuio/Config.in"
+	source "package/quazip/Config.in"
 	source "package/qwt/Config.in"
 endif
 	source "package/weston/Config.in"
diff --git a/package/quazip/Config.in b/package/quazip/Config.in
new file mode 100644
index 0000000..83537d4
--- /dev/null
+++ b/package/quazip/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QUAZIP
+	bool "quazip"
+	select BR2_PACKAGE_ZLIB
+	help
+	  QuaZIP is a simple C++ wrapper over Gilles Vollant's
+	  ZIP/UNZIP package that can be used to access ZIP
+	  archives. It uses the Qt toolkit.
+
+	  http://quazip.sourceforge.net
diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
new file mode 100644
index 0000000..84b56c7
--- /dev/null
+++ b/package/quazip/quazip.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 78c984103555c51e6f7ef52e3a2128e2beb9896871b2cc4d4dbd4d64bff132de quazip-0.7.1.tar.gz
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
new file mode 100644
index 0000000..178a531
--- /dev/null
+++ b/package/quazip/quazip.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# quazip
+#
+################################################################################
+
+QUAZIP_VERSION = 0.7.1
+QUAZIP_SITE = http://sourceforge.net/projects/quazip/files/quazip/$(QUAZIP_VERSION)/
+QUAZIP_INSTALL_STAGING = YES
+QUAZIP_DEPENDENCIES = \
+	zlib \
+	$(if $(BR2_PACKAGE_QT),qt) \
+	$(if $(BR2_PACKAGE_QT5),qt5base)
+QUAZIP_LICENSE = LGPLv2.1
+QUAZIP_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_QT5),y)
+QUAZIP_QMAKE = $(QT5_QMAKE)
+else
+QUAZIP_QMAKE = $(QT_QMAKE)
+endif
+
+define QUAZIP_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QUAZIP_QMAKE) PREFIX=/usr)
+endef
+
+define QUAZIP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QUAZIP_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(STAGING_DIR)
+endef
+
+define QUAZIP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
