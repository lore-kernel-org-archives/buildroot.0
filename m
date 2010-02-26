From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Feb 2010 10:42:26 +0100
Subject: [Buildroot] [git commit master] cramfs: add CFLAGS/LDFLAGS and
	host-zlib dependency
Message-ID: <20100226094313.300B27775C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c4ba3fdae5a576ed26815a3ef637614b2017fc18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cramfs depends on host-zlib, so it must be built prior to cramfs.

Moreover, we need to pass the HOST_CFLAGS and HOST_LDFLAGS variables,
otherwise it doesn't find zlib in $(HOST_DIR).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/cramfs/cramfs.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/cramfs/cramfs.mk b/target/cramfs/cramfs.mk
index 79353b5..e6d63ed 100644
--- a/target/cramfs/cramfs.mk
+++ b/target/cramfs/cramfs.mk
@@ -20,10 +20,10 @@ $(CRAMFS_DIR): $(DL_DIR)/$(CRAMFS_SOURCE)
 	toolchain/patch-kernel.sh $(CRAMFS_DIR) target/cramfs/ cramfs\*.patch
 
 $(CRAMFS_DIR)/mkcramfs: $(CRAMFS_DIR)
-	$(MAKE) CFLAGS="-Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" -C $(CRAMFS_DIR)
+	$(MAKE) CFLAGS="$(HOST_CFLAGS) -Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="$(HOST_LDFLAGS)" -C $(CRAMFS_DIR)
 	touch -c $@
 
-cramfs: $(CRAMFS_DIR)/mkcramfs
+cramfs: host-zlib $(CRAMFS_DIR)/mkcramfs
 
 cramfs-source: $(DL_DIR)/$(CRAMFS_SOURCE)
 
-- 
1.6.3.3
