From: Avishay Orpaz <avishorp@gmail.com>
Date: Mon, 13 Aug 2012 17:19:38 +0300
Subject: [Buildroot] [PATCH 2/2] rdiff-backup: new package
In-Reply-To: <1344867578-12784-1-git-send-email-avishorp@gmail.com>
References: <1344867578-12784-1-git-send-email-avishorp@gmail.com>
Message-ID: <1344867578-12784-2-git-send-email-avishorp@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/rdiff-backup/Config.in       |   10 ++++++++++
 package/rdiff-backup/rdiff-backup.mk |   29 +++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 package/rdiff-backup/Config.in
 create mode 100644 package/rdiff-backup/rdiff-backup.mk

diff --git a/package/rdiff-backup/Config.in b/package/rdiff-backup/Config.in
new file mode 100644
index 0000000..1e8bc27
--- /dev/null
+++ b/package/rdiff-backup/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RDIFF_BACKUP
+    bool "rdiff-backup"
+    depends on BR2_PACKAGE_PYTHON
+    select BR2_PACKAGE_PYTHON_HASHLIB
+    select BR2_PACKAGE_PYTHON_ZLIB
+    help
+      Tool for incremental, network efficient backup
+
+      http://nongnu.org/rdiff-backup
+
diff --git a/package/rdiff-backup/rdiff-backup.mk b/package/rdiff-backup/rdiff-backup.mk
new file mode 100644
index 0000000..bb0c3ca
--- /dev/null
+++ b/package/rdiff-backup/rdiff-backup.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# rdiff-backup
+#
+#############################################################
+
+RDIFF_BACKUP_VERSION = 1.2.8
+RDIFF_BACKUP_SOURCE = rdiff-backup-$(RDIFF_BACKUP_VERSION).tar.gz
+RDIFF_BACKUP_SITE = http://savannah.nongnu.org/download/rdiff-backup
+RDIFF_BACKUP_LICENSE = GPLv2
+
+RDIFF_BACKUP_DEPENDENCIES = python librsync
+
+define RDIFF_BACKUP_BUILD_CMDS
+	(cd $(@D); \
+		CC="$(TARGET_CC)"		\
+		CFLAGS="$(TARGET_CFLAGS)" 	\
+		LDSHARED="$(TARGET_CC) -shared" \
+		LDFLAGS="$(TARGET_LDFLAGS)" 	\
+	$(HOST_DIR)/usr/bin/python setup.py build_ext \
+	--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR))
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build -e /usr/bin/python )
+endef
+
+define RDIFF_BACKUP_INSTALL_TARGET_CMDS
+    (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
