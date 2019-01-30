From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Jan 2019 10:43:02 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] leveldb: disable parallel
 build
Message-ID: <20190130094302.48FAE8156E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c738000ee5cfa535d84b1e6e67b81496fa33513d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Commit abba4e701246f69bc22ca9045e9932abfe9228e9 did not succeed in
fixing all parallel build failures because sometimes $(SHARED_OUTDIR) is
created but not $(SHARED_OUTDIR)/db so instead of fixing this mess,
revert the patch and disable parallel build as upstream switched to
cmake

Fixes:
 - http://autobuild.buildroot.org/results/9c33692aa130a20b0f8e868156e49990e862d6ee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fb22931bcfa66e2b1c8788245876ad7fed134477)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/leveldb/leveldb.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 54942a0f27..af9e879828 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -17,18 +17,18 @@ LEVELDB_MAKE_ARGS += SHARED_LIBS= SHARED_PROGRAMS=
 endif
 
 define LEVELDB_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) \
 		$(LEVELDB_MAKE_ARGS) -C $(@D)
 endef
 
 define LEVELDB_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) \
+	$(TARGET_MAKE_ENV) $(MAKE1) \
 		INSTALL_ROOT=$(STAGING_DIR) INSTALL_PREFIX=/usr \
 		$(LEVELDB_MAKE_ARGS) -C $(@D) install
 endef
 
 define LEVELDB_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) \
+	$(TARGET_MAKE_ENV) $(MAKE1) \
 		INSTALL_ROOT=$(TARGET_DIR) INSTALL_PREFIX=/usr \
 		$(LEVELDB_MAKE_ARGS) -C $(@D) install
 endef
