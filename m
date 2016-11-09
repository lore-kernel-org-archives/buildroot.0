From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed,  9 Nov 2016 11:57:27 +0100
Subject: [Buildroot] [PATCH] infra: fix striping of ld.so and libpthread
Message-ID: <20161109105727.7068-1-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If 'lib' is a symlink, 'find lib' does not return correct result. So, until now,
libpthread*.so* and ld-*.so* was not stripped when 'lib' was a symlink.

We fix tit by using 'find lib/' instead of 'find lib'

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 6cf5f1c..e4f5441 100644
--- a/Makefile
+++ b/Makefile
@@ -644,7 +644,7 @@ target-finalize: $(PACKAGES)
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
 		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
 	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
-	find $(TARGET_DIR)/lib $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/libexec \
+	find $(TARGET_DIR)/lib/ $(TARGET_DIR)/usr/lib/ $(TARGET_DIR)/usr/libexec/ \
 		\( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 ifneq ($(BR2_PACKAGE_GDB),y)
 	rm -rf $(TARGET_DIR)/usr/share/gdb
@@ -666,13 +666,13 @@ endif
 # besides the one in which crash occurred; or SIGTRAP kills my program when
 # I set a breakpoint"
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-	find $(TARGET_DIR)/lib -type f -name 'libpthread*.so*' | \
+	find $(TARGET_DIR)/lib/ -type f -name 'libpthread*.so*' | \
 		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
 endif
 
 # Valgrind needs ld.so with enough information, so only strip
 # debugging symbols.
-	find $(TARGET_DIR)/lib -type f -name 'ld-*.so*' | \
+	find $(TARGET_DIR)/lib/ -type f -name 'ld-*.so*' | \
 		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
 	test -f $(TARGET_DIR)/etc/ld.so.conf && \
 		{ echo "ERROR: we shouldn't have a /etc/ld.so.conf file"; exit 1; } || true
-- 
2.9.3
