From: Louis des Landes <louis@psykar.com>
Date: Wed, 17 Apr 2019 09:39:30 +0930
Subject: [Buildroot] [PATCH 1/2] Makefile: add chmod before rm when cleaning.
Message-ID: <20190417000931.5356-1-louis.deslandes@fleet.space>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some build systems (looking at you golang) create read only directories
as caches.
As such rm -rf will actually fail, causing clean and <pkg>-dirclean to fail.

This patch will cause `make clean` to run chmod -R +w on the relevant
directory first, which will allow rm -rf to work.

This may be resolved if https://github.com/golang/go/issues/31481 is
resolved satisfactorily.

Signed-off-by: Louis des Landes <louis.deslandes@fleet.space>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 522c0b0606..fc2a82e074 100644
--- a/Makefile
+++ b/Makefile
@@ -1060,6 +1060,12 @@ printvars:
 
 .PHONY: clean
 clean:
+	# Some build systems (looking at you golang) create read only directories
+	# As such rm -rf will actually fail, so brute force them all to writeable
+	# before removing them.
+	chmod -R u+w $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
+		$(BUILD_DIR) $(BASE_DIR)/staging \
+		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
 	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
-- 
2.21.0
