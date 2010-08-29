From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Aug 2010 21:51:07 +0200
Subject: [Buildroot] [git commit master 1/1] proftpd: breaks with parallel
	builds
Message-ID: <20100829195129.C4DD78A2D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6ef440ba0d1a0754c07db26ddb77ab81a0d401de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The proftpd build system has a race condition, which may break the build
with high -j<level> values (libsupp.a isn't built by the time it is needed).

Fix it by using MAKE1 instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    4 ++--
 package/proftpd/proftpd.mk |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index e68adf0..5d0b940 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,8 +18,8 @@
 	fs: old-style squashfs for big endian archs fixed.
 
 	Updated/fixed packages: busybox, imagemagick, libglib2, lua,
-	luafilesystem, lzo, netcat, php, qt, samba, startup-notification,
-	sysvinit, util-linux
+	luafilesystem, lzo, netcat, php, proftpd, qt, samba,
+	startup-notification, sysvinit, util-linux
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 7404d83..11ef1ef 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -52,9 +52,9 @@ $(PROFTPD_DIR)/.configured: $(PROFTPD_DIR)/.unpacked
 	touch $@
 
 $(PROFTPD_DIR)/$(PROFTPD_BINARY): $(PROFTPD_DIR)/.configured
-	$(MAKE) CC="$(HOSTCC)" CFLAGS="" LDFLAGS="" \
+	$(MAKE1) CC="$(HOSTCC)" CFLAGS="" LDFLAGS="" \
 		-C $(PROFTPD_DIR)/lib/libcap _makenames
-	$(MAKE) -C $(PROFTPD_DIR)
+	$(MAKE1) -C $(PROFTPD_DIR)
 
 $(TARGET_DIR)/$(PROFTPD_TARGET_BINARY): $(PROFTPD_DIR)/$(PROFTPD_BINARY)
 	cp -dpf $(PROFTPD_DIR)/$(PROFTPD_BINARY) \
-- 
1.7.1
