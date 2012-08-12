From: Avishay Orpaz <avishorp@gmail.com>
Date: Sun, 12 Aug 2012 16:18:29 +0300
Subject: [Buildroot] [PATCH] Added new package - rdiff-backup.
Message-ID: <1344777509-17936-1-git-send-email-avishorp@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Avishay Orpaz <avishorp@gmail.com>
---
 package/Config.in                    |    1 +
 package/python/Config.in             |    6 ++++++
 package/python/python.mk             |    4 ++++
 package/rdiff-backup/Config.in       |   10 ++++++++++
 package/rdiff-backup/rdiff-backup.mk |   28 ++++++++++++++++++++++++++++
 5 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 package/rdiff-backup/Config.in
 create mode 100644 package/rdiff-backup/rdiff-backup.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..1e4d7a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -503,6 +503,7 @@ source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
 source "package/sound-theme-borealis/Config.in"
 source "package/sound-theme-freedesktop/Config.in"
+source "package/rdiff-backup/Config.in"
 endmenu
 
 menu "Networking applications"
diff --git a/package/python/Config.in b/package/python/Config.in
index 11aa267..65aac23 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -93,6 +93,12 @@ config BR2_PACKAGE_PYTHON_ZLIB
 	help
 	  zlib support in Python
 
+config BR2_PACKAGE_PYTHON_HASHLIB
+	bool "hashlib module"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  hashlib support in Python
+
 endmenu
 
 endif
diff --git a/package/python/python.mk b/package/python/python.mk
index fae4e5c..0584a5a 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -110,6 +110,10 @@ else
 PYTHON_CONF_OPT += --disable-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON_HASHLIB),y)
+PYTHON_DEPENDENCIES += openssl
+endif
+
 PYTHON_CONF_ENV += \
 	PYTHON_FOR_BUILD=$(HOST_PYTHON_DIR)/python \
 	PGEN_FOR_BUILD=$(HOST_PYTHON_DIR)/Parser/pgen \
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
index 0000000..77d9caf
--- /dev/null
+++ b/package/rdiff-backup/rdiff-backup.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# rdiff-backup
+#
+#############################################################
+
+RDIFF_BACKUP_VERSION = 1.2.8
+RDIFF_BACKUP_SOURCE = rdiff-backup-$(RDIFF_BACKUP_VERSION).tar.gz
+RDIFF_BACKUP_SITE = http://savannah.nongnu.org/download/rdiff-backup
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
