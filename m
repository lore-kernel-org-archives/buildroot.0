From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 1 Jul 2013 11:51:24 +0100
Subject: [Buildroot] [PATCH] Makefile: Symlink lib32 to lib for MIPS64/n32
Message-ID: <1372675884-963-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

gcc hardcodes the uClibc interpreter for MIPS64/n32 as follows:
(gcc-4.7.3, gcc/config/mips/linux64.h):
define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"

However, buildroot always creates the $(TARGET_DIR)/lib and
$(TARGET_DIR)/usr/lib directories, therefore for consinstency
reasons, we create a lib32->lib symlink to fix the interpreter
problems for MIPS64/n32.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index c514e4f..0059d0c 100644
--- a/Makefile
+++ b/Makefile
@@ -436,6 +436,12 @@ $(BUILD_DIR)/.root:
 		--exclude .hg --exclude=CVS --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
+ifeq ($(BR2_MIPS_NABI32),y)
+	pushd $(TARGET_DIR) > /dev/null 2>&1; \
+		ln -sfn lib lib32; \
+		ln -sfn lib usr/lib32; \
+		popd > /dev/null 2>&1
+endif
 	touch $@
 
 $(TARGET_DIR): $(BUILD_DIR)/.root
-- 
1.8.2.1
