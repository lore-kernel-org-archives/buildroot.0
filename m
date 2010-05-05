From: luca at lucaceresoli.net <luca@lucaceresoli.net>
Date: Thu,  6 May 2010 00:16:59 +0200
Subject: [Buildroot] [PATCH] customize: fix copy paths
Message-ID: <1273097819-8002-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Luca Ceresoli <luca@lucaceresoli.net>

customize.mk used to copy files with a wrong command, resulting in one
directory level in excess. For example, source/etc/myfile would have
produced /etc/etc/myfile in the target filesystem instead of /etc/myfile.
---
 package/customize/customize.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/customize/customize.mk b/package/customize/customize.mk
index 780e42b..d2b8518 100644
--- a/package/customize/customize.mk
+++ b/package/customize/customize.mk
@@ -11,7 +11,7 @@ $(BUILD_DIR)/.customize:
 	 /bin/ls -d * > $(BUILD_DIR)/series || \
 	 touch $(BUILD_DIR)/series )
 	for f in `cat $(BUILD_DIR)/series`; do \
-		cp -af $(CUST_DIR)/$$f $(TARGET_DIR)/$$f; \
+		cp -af $(CUST_DIR)/$$f $(TARGET_DIR); \
 	done
 	rm -f $(BUILD_DIR)/series
 	touch $@
-- 
1.5.4.3
