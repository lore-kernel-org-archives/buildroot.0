From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Apr 2012 11:30:33 -0300
Subject: [Buildroot] [PATCH 2/2] berkeleydb: add option for tools install
In-Reply-To: <1335364233-21057-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335364233-21057-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335364233-21057-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to install (or not) the berkeleydb binary tools.
The default is no since most of the time/application just need the
library and it helps save some space in the target.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/berkeleydb/Config.in     |    6 ++++++
 package/berkeleydb/berkeleydb.mk |   13 +++++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/berkeleydb/Config.in b/package/berkeleydb/Config.in
index 9568d44..a597abb 100644
--- a/package/berkeleydb/Config.in
+++ b/package/berkeleydb/Config.in
@@ -5,3 +5,9 @@ config BR2_PACKAGE_BERKELEYDB
 	  applications.
 
 	  http://www.sleepycat.com/products/db.shtml
+
+config BR2_PACKAGE_BERKELEYDB_TOOLS
+	bool "install tools"
+	depends on BR2_PACKAGE_BERKELEYDB
+	help
+	  Install berkeleydb tools, mostly useful for debugging purposes.
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index b2b0a45..d737896 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -8,6 +8,9 @@ BERKELEYDB_SITE = http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE = db-$(BERKELEYDB_VERSION).NC.tar.gz
 BERKELEYDB_SUBDIR = build_unix
 BERKELEYDB_INSTALL_STAGING = YES
+BERKELEYDB_BINARIES = db_archive db_checkpoint db_deadlock db_dump \
+	db_hotbackup db_load db_log_verify db_printlog db_recover db_replicate \
+	db_stat db_tuner db_upgrade db_verify
 
 # build directory can't be the directory where configure are there, so..
 define BERKELEYDB_CONFIGURE_CMDS
@@ -33,6 +36,16 @@ define BERKELEYDB_CONFIGURE_CMDS
 	$(SED) 's/\.lo/.o/g' $(@D)/build_unix/Makefile
 endef
 
+ifneq ($(BR2_PACKAGE_BERKELEYDB_TOOLS),y)
+
+define BERKELEYDB_REMOVE_TOOLS
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(BERKELEYDB_BINARIES))
+endef
+
+BERKELEYDB_POST_INSTALL_TARGET_HOOKS += BERKELEYDB_REMOVE_TOOLS
+
+endif
+
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 
 define BERKELEYDB_REMOVE_DOCS
-- 
1.7.3.4
