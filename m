From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 May 2010 09:32:15 +0200
Subject: [Buildroot] [git commit master] lockfile-progs: use correct CFLAGS
Message-ID: <20100530073455.104CBBF93C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a4bba08343325113122b6601b09fe70e501bd93b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the correct CFLAGS from BR and not just the LDFLAGS. This is especially
important for external toolchain setups, but the lockfile-progs buildsystem
also hardcodes -Werror, which breaks the build in certain setups.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |    4 ++--
 package/lockfile-progs/lockfile-progs.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5f65824..c6b64c0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,8 +2,8 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: coreutils, hal, libcap, ncftp,
-	xserver_xorg-server
+	Updated/fixed packages: coreutils, hal, libcap,
+	lockfile-progs, ncftp, xserver_xorg-server
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 6494f81..4098330 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -21,7 +21,7 @@ $(LOCKFILE_PROGS_DIR)/.unpacked: $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE)
 	touch $(LOCKFILE_PROGS_DIR)/.unpacked
 
 $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY): $(LOCKFILE_PROGS_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDFLAGS="$(TARGET_LDFLAGS)" \
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_CONFIGURE_ENV) \
 		-C $(LOCKFILE_PROGS_DIR)
 	cp -a $(LOCKFILE_PROGS_DIR)/bin/lockfile* $(TARGET_DIR)/usr/bin
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY)
-- 
1.6.3.3
