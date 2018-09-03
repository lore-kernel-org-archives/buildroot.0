From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon,  3 Sep 2018 03:25:26 -0400
Subject: [Buildroot] [PATCH v2 1/3] leveldb: install memenv static library
 and header
In-Reply-To: <20180903072528.15744-1-gael.portay@savoirfairelinux.com>
References: <20180903072528.15744-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180903072528.15744-2-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project builds a tiny static library that consists of a single
symbol which creates an in-memory LevelDB database.

That library is not installed by default and may be used by other
projects.

This commit creates a config option that installs in the staging
directory the libmemenv.a static library and the memenv.h header file
when the option is set.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/leveldb/Config.in  | 10 ++++++++++
 package/leveldb/leveldb.mk |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/leveldb/Config.in b/package/leveldb/Config.in
index 163a75e8f2..4ceb2cfb5b 100644
--- a/package/leveldb/Config.in
+++ b/package/leveldb/Config.in
@@ -10,5 +10,15 @@ config BR2_PACKAGE_LEVELDB
 
 	  https://github.com/google/leveldb
 
+if BR2_PACKAGE_LEVELDB
+
+config BR2_PACKAGE_LEVELDB_MEMENV
+	bool "memenv"
+	help
+	  Installs memenv static library and header to create in-memory
+	  LevelDB database.
+
+endif
+
 comment "leveldb needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 54942a0f27..c8c2e102c0 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -21,10 +21,18 @@ define LEVELDB_BUILD_CMDS
 		$(LEVELDB_MAKE_ARGS) -C $(@D)
 endef
 
+ifdef BR2_PACKAGE_LEVELDB_MEMENV
+define LEVELDB_INSTALL_MEMENV
+	$(INSTALL) -m 0644 $(@D)/out-static/libmemenv.a $(STAGING_DIR)/usr/lib
+	$(INSTALL) -D -m 0644 $(@D)/helpers/memenv/memenv.h $(STAGING_DIR)/usr/include/helpers/memenv/memenv.h
+endef
+endif
+
 define LEVELDB_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) \
 		INSTALL_ROOT=$(STAGING_DIR) INSTALL_PREFIX=/usr \
 		$(LEVELDB_MAKE_ARGS) -C $(@D) install
+	$(LEVELDB_INSTALL_MEMENV)
 endef
 
 define LEVELDB_INSTALL_TARGET_CMDS
-- 
2.11.0
