From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@collabora.com>
Date: Wed,  2 Jan 2019 15:56:28 -0500
Subject: [Buildroot] [PATCH v3 1/3] leveldb: install memenv static library
 and header
In-Reply-To: <20190102205630.18725-1-gael.portay@collabora.com>
References: <20190102205630.18725-1-gael.portay@collabora.com>
Message-ID: <20190102205630.18725-2-gael.portay@collabora.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project builds a tiny static library that consists of a single
symbol which creates an in-memory LevelDB database.

That library is not installed by default and may be used by other
projects.

This commit installs in the staging directory the libmemenv.a static
library and the memenv.h header file.

Signed-off-by: Ga?l PORTAY <gael.portay@collabora.com>
---
 package/leveldb/leveldb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 54942a0f27..7999373770 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -25,6 +25,8 @@ define LEVELDB_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) \
 		INSTALL_ROOT=$(STAGING_DIR) INSTALL_PREFIX=/usr \
 		$(LEVELDB_MAKE_ARGS) -C $(@D) install
+	$(INSTALL) -D -m 0644 $(@D)/out-static/libmemenv.a $(STAGING_DIR)/usr/lib/libmemenv.a
+	$(INSTALL) -D -m 0644 $(@D)/helpers/memenv/memenv.h $(STAGING_DIR)/usr/include/helpers/memenv/memenv.h
 endef
 
 define LEVELDB_INSTALL_TARGET_CMDS
-- 
2.20.1
