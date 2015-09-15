From: Herve Codina <Herve.CODINA@celad.com>
Date: Tue, 15 Sep 2015 15:27:06 +0200
Subject: [Buildroot] [PATCH 1/1] target-finalize: remove extra
	/usr/libexec/*.a and *.la files
Message-ID: <1442323626-31294-1-git-send-email-Herve.CODINA@celad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages, sudo for instance, install .la files in $(TARGET_DIR)/usr/libexec.
These files are not needed on target.

This patch simply removes *.a and *.la files from $(TARGET_DIR)/usr/libexec if it exists

Signed-off-by: Herve Codina <Herve.CODINA@celad.com>
---
 Makefile |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 23e2ee6..9bf5fbc 100644
--- a/Makefile
+++ b/Makefile
@@ -565,6 +565,9 @@ target-finalize: $(PACKAGES)
 	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
+	if test -d $(TARGET_DIR)/usr/libexec; then \
+		find $(TARGET_DIR)/usr/libexec \( -name '*.a' -o -name '*.la' \) -print0 | \
+		xargs -0 rm -f; fi
 ifneq ($(BR2_PACKAGE_GDB),y)
 	rm -rf $(TARGET_DIR)/usr/share/gdb
 endif
-- 
1.7.9.5
