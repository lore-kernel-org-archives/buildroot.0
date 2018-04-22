From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 23:37:56 +0200
Subject: [Buildroot] [git commit] lz4: don't build library and tools in
 parallel
Message-ID: <20180422213759.0C217836D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e0d304d20b66d3ec3e0e471c06e521e447d4640
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit e93fec6673e (lz4: bump to version 1.8.1.2) we use two make
targets, 'lib' and 'lz4'. Both targets depend on the static library.
When these targets run in parallel the two make instances that build the
static library race against each other. Split these targets to ensure
build order.

Should fix:
http://autobuild.buildroot.net/results/a8d/a8d956ff420f6a265c5c00b33646dbbc24ce2d48/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lz4/lz4.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index a77f6b5f5f..b17bc8ada9 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -15,7 +15,8 @@ LZ4_MAKE_OPTS += BUILD_SHARED=no
 endif
 
 define HOST_LZ4_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) lib lz4
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) lib
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) lz4
 endef
 
 define HOST_LZ4_INSTALL_CMDS
@@ -25,7 +26,9 @@ endef
 
 define LZ4_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(LZ4_MAKE_OPTS) \
-		-C $(@D) lib lz4
+		-C $(@D) lib
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(LZ4_MAKE_OPTS) \
+		-C $(@D) lz4
 endef
 
 define LZ4_INSTALL_STAGING_CMDS
