From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 3 Jul 2013 14:06:56 +0100
Subject: [Buildroot] [PATCH v2] Makefile: Symlink lib32 to lib for MIPS64/n32
Message-ID: <1372856816-12493-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

gcc hardcodes the uClibc interpreter for MIPS64/n32 as follows:
(gcc-4.7.3, gcc/config/mips/linux64.h):
define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"

However, buildroot always creates the $(TARGET_DIR)/lib,
$(TARGET_DIR)/usr/lib, $(STAGING_DIR)/lib and
$(STAGING_DIR)/usr/lib directories, therefore for consinstency
reasons, we create a lib32->lib symlink to fix the interpreter
problems for MIPS64/n32.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Changes since v1:
http://lists.busybox.net/pipermail/buildroot/2013-July/074586.html
- drop pushd/popd
- Create symlinks for the STAGING_DIR as well
---
 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index 509eab6..31c41e4 100644
--- a/Makefile
+++ b/Makefile
@@ -436,6 +436,13 @@ $(BUILD_DIR)/.root:
 		--exclude .hg --exclude=CVS --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
+ifeq ($(BR2_MIPS_NABI32),y)
+	ln -sfn lib $(TARGET_DIR)/lib32
+	ln -sfn lib $(TARGET_DIR)/usr/lib32
+	ln -sfn lib $(STAGING_DIR)/lib32
+	ln -sfn lib $(STAGING_DIR)/usr/lib32
+
+endif
 	touch $@
 
 $(TARGET_DIR): $(BUILD_DIR)/.root
-- 
1.8.2.1
