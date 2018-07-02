From: John Keeping <john@metanate.com>
Date: Mon,  2 Jul 2018 17:00:27 +0100
Subject: [Buildroot] [PATCH] Makefile: respect strip exclusions for special
 libraries
Message-ID: <20180702160027.28557-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ld-*.so and libpthread*.so* are not stripped in the same way as other
binaries because some applications need symbols in these libraries in
order to operate correctly.

However, the special handling for these binaries ignores the usual
BR2_STRIP_EXCLUDE_* rules so it is not possible to build an image which
has debugging symbols in these binaries.

Instead of running one-off commands to strip each of these special
binaries, build a single command for everything that needs
$(STRIP_STRIP_DEBUG) and include the normal exclusion rules in this
command.

Signed-off-by: John Keeping <john@metanate.com>
---
 Makefile | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 8d25c8a239..2deb5fd54a 100644
--- a/Makefile
+++ b/Makefile
@@ -606,6 +606,26 @@ STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
 #   done for kernel modules with incorrect permissions.
 STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* ld-*.so* *.ko $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print0
 
+# This is the command used to handle the special cases above.
+STRIP_SPECIAL_LIBS_CMD = find $(TARGET_DIR)/lib/
+ifneq (,$(filter lib/%,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))))
+STRIP_SPECIAL_LIBS_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(BR2_STRIP_EXCLUDE_DIRS)) \) -prune -o
+endif
+# Valgrind needs ld.so with enough information, so only strip
+# debugging symbols.
+STRIP_SPECIAL_LIBS_CMD += \( -name 'ld-*.so*'
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+# See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
+# besides the one in which crash occurred; or SIGTRAP kills my program when
+# I set a breakpoint"
+STRIP_SPECIAL_LIBS_CMD += -o -name 'libpthread*.so*'
+endif
+STRIP_SPECIAL_LIBS_CMD += \)
+ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)))
+STRIP_SPECIAL_LIBS_CMD += -not \( $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)) \)
+endif
+STRIP_SPECIAL_LIBS_CMD += | xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
+
 ifeq ($(BR2_ECLIPSE_REGISTER),y)
 define TOOLCHAIN_ECLIPSE_REGISTER
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` \
@@ -717,18 +737,8 @@ endif
 	rmdir $(TARGET_DIR)/usr/share 2>/dev/null || true
 	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
 
-# See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
-# besides the one in which crash occurred; or SIGTRAP kills my program when
-# I set a breakpoint"
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-	find $(TARGET_DIR)/lib/ -type f -name 'libpthread*.so*' | \
-		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
-endif
+	$(STRIP_SPECIAL_LIBS_CMD) || true
 
-# Valgrind needs ld.so with enough information, so only strip
-# debugging symbols.
-	find $(TARGET_DIR)/lib/ -type f -name 'ld-*.so*' | \
-		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
 	test -f $(TARGET_DIR)/etc/ld.so.conf && \
 		{ echo "ERROR: we shouldn't have a /etc/ld.so.conf file"; exit 1; } || true
 	test -d $(TARGET_DIR)/etc/ld.so.conf.d && \
-- 
2.18.0
