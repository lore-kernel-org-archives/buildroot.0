From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Apr 2018 17:39:04 +0200
Subject: [Buildroot] [PATCH v2 1/2] coreutils: rewrite for loop with foreach
In-Reply-To: <20180401153905.14483-1-thomas.petazzoni@bootlin.com>
References: <20180401153905.14483-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180401153905.14483-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This brings up error checking at each iteration of the loop for free,
which removes the need for "|| exit 1".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/coreutils.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 8259f42f4a..8880e77dcc 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -104,9 +104,9 @@ endif
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
 define COREUTILS_CLEANUP_BIN
 	# some things go in root rather than usr
-	for f in $(COREUTILS_BIN_PROGS); do \
-		mv -f $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f || exit 1; \
-	done
+	$(foreach f,$(COREUTILS_BIN_PROGS), \
+		mv -f $(TARGET_DIR)/usr/bin/$(f) $(TARGET_DIR)/bin/$(f)
+	)
 endef
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP_BIN
 endif
-- 
2.14.3
