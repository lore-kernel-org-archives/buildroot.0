From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 11:42:32 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] leveldb: install memenv
 static library and header
Message-ID: <20190325121748.72FF882DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29cedb230b2022c1c9339cd807907f6b0818c9aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

The project builds a tiny static library that consists of a single
symbol which creates an in-memory LevelDB database.

That library is not installed by default and may be used by other
projects.

This commit installs in the staging directory the libmemenv.a static
library and the memenv.h header file.

Signed-off-by: Ga??l PORTAY <gael.portay@collabora.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 16f847340d07dce620e4c3fc0a099aa79898d86a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/leveldb/leveldb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index af9e879828..6078cd496c 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -25,6 +25,8 @@ define LEVELDB_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) \
 		INSTALL_ROOT=$(STAGING_DIR) INSTALL_PREFIX=/usr \
 		$(LEVELDB_MAKE_ARGS) -C $(@D) install
+	$(INSTALL) -D -m 0644 $(@D)/out-static/libmemenv.a $(STAGING_DIR)/usr/lib/libmemenv.a
+	$(INSTALL) -D -m 0644 $(@D)/helpers/memenv/memenv.h $(STAGING_DIR)/usr/include/helpers/memenv/memenv.h
 endef
 
 define LEVELDB_INSTALL_TARGET_CMDS
