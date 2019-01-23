From: Gerhard Heift <gerhard@heift.name>
Date: Wed, 23 Jan 2019 14:15:39 +0100
Subject: [Buildroot] [PATCH] store debug information in $HOST_DIR/lib/debug
Message-ID: <20190123131539.24699-1-Gerhard@Heift.Name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before striping the binaries in $TARGET_DIR, the debug information is saved to
$HOST_DIR/lib/debug using the following command as described in [1]:

  $ objcopy --only-keep-debug --compress-debug-sections $file

This allows remote debugging as described in section 8.12.2 with striped
binaries in the final image. Therefore the build ID is included during the build
process, if debug information is enabled via BR2_ENABLE_DEBUG.

[1] https://sourceware.org/gdb/onlinedocs/gdb/Separate-Debug-Files.html

Signed-off-by: Gerhard Heift <Gerhard@Heift.Name>
---
 Makefile                   |  6 ++---
 package/Makefile.in        | 12 ++++++---
 support/scripts/copy-debug | 52 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 7 deletions(-)
 create mode 100755 support/scripts/copy-debug

diff --git a/Makefile b/Makefile
index a382a5defb..d0b5e665b0 100644
--- a/Makefile
+++ b/Makefile
@@ -743,20 +743,20 @@ endif
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	rmdir $(TARGET_DIR)/usr/share 2>/dev/null || true
-	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
+	$(STRIP_FIND_CMD) | xargs -0 $(TOPDIR)/support/scripts/copy-debug $(HOST_DIR)/lib/debug $(TARGET_OBJCOPY) $(STRIPCMD) 2>/dev/null || true
 
 # See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
 # besides the one in which crash occurred; or SIGTRAP kills my program when
 # I set a breakpoint"
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	find $(TARGET_DIR)/lib/ -type f -name 'libpthread*.so*' | \
-		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
+		xargs -r $(TOPDIR)/support/scripts/copy-debug $(HOST_DIR)/lib/debug $(TARGET_OBJCOPY) $(STRIPCMD) $(STRIP_STRIP_DEBUG)
 endif
 
 # Valgrind needs ld.so with enough information, so only strip
 # debugging symbols.
 	find $(TARGET_DIR)/lib/ -type f -name 'ld-*.so*' | \
-		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
+		xargs -r $(TOPDIR)/support/scripts/copy-debug $(HOST_DIR)/lib/debug $(TARGET_OBJCOPY) $(STRIPCMD) $(STRIP_STRIP_DEBUG)
 	test -f $(TARGET_DIR)/etc/ld.so.conf && \
 		{ echo "ERROR: we shouldn't have a /etc/ld.so.conf file"; exit 1; } || true
 	test -d $(TARGET_DIR)/etc/ld.so.conf.d && \
diff --git a/package/Makefile.in b/package/Makefile.in
index dc818a2c18..a4b75ac2b9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -110,6 +110,8 @@ endif
 STAGING_SUBDIR = $(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
 
+TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
+
 ifeq ($(BR2_OPTIMIZE_0),y)
 TARGET_OPTIMIZATION = -O0
 endif
@@ -132,16 +134,18 @@ ifeq ($(BR2_OPTIMIZE_FAST),y)
 TARGET_OPTIMIZATION = -Ofast
 endif
 ifeq ($(BR2_DEBUG_1),y)
-TARGET_DEBUGGING = -g1
+TARGET_DEBUGGING = -g1 -Wl,--build-id
+TARGET_LDFLAGS += -Wl,--build-id
 endif
 ifeq ($(BR2_DEBUG_2),y)
-TARGET_DEBUGGING = -g2
+TARGET_DEBUGGING = -g2 -Wl,--build-id
+TARGET_LDFLAGS += -Wl,--build-id
 endif
 ifeq ($(BR2_DEBUG_3),y)
-TARGET_DEBUGGING = -g3
+TARGET_DEBUGGING = -g3 -Wl,--build-id
+TARGET_LDFLAGS += -Wl,--build-id
 endif
 
-TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 # By design, _FORTIFY_SOURCE requires gcc optimization to be enabled.
 # Therefore, we need to pass _FORTIFY_SOURCE and the optimization level
diff --git a/support/scripts/copy-debug b/support/scripts/copy-debug
new file mode 100755
index 0000000000..001ff157bf
--- /dev/null
+++ b/support/scripts/copy-debug
@@ -0,0 +1,52 @@
+#!/usr/bin/env sh
+DEBUG_DIR="$1"
+OBJCOPY_EXEC="$2"
+STRIP_EXEC="$3"
+shift 3
+
+for arg in "$@"; do
+    if [ "${arg#-}" != "${arg}" ]; then
+        continue
+    fi
+    INFO="$(file "$arg")"
+
+    # echo $arg: $INFO
+    if [ "x${INFO%not stripped*}" = "x$INFO" ]; then
+        # echo $arg already stripped
+        continue
+    fi
+    if [ "x${INFO#*BuildID[[]sha1]=}" = "x$INFO" ]; then
+        # echo $arg has no build ID
+        continue
+    fi
+
+    BUILD_ID="${INFO#*BuildID[[]sha1]=}"
+    BUILD_ID="${BUILD_ID%%,*}"
+
+    if [ "x${BUILD_ID}y" = xy ]; then
+        # echo $arg has empty build ID?
+        continue
+    fi
+
+    # 40 hex
+    if [ "x${BUILD_ID#[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]}y" != xy ]; then
+        # echo $arg has invalid build ID: $BUILD_ID?
+        continue
+    fi
+
+    POST="${BUILD_ID#[0-9a-z][0-9a-z]}"
+    PRE="${BUILD_ID%$POST}"
+
+    # echo $arg build ID: $BUILD_ID
+    # echo $DEBUG_DIR/.build-id/$PRE/$POST
+
+    mkdir -p $DEBUG_DIR/.build-id/$PRE
+    DEBUG_FILE=$DEBUG_DIR/.build-id/$PRE/$POST.debug
+
+    if ! [ -e $DEBUG_FILE ]; then
+        $OBJCOPY_EXEC --only-keep-debug --compress-debug-sections $arg $DEBUG_FILE
+        chmod 644 $DEBUG_FILE
+    fi
+done
+
+$STRIP_EXEC "$@"
-- 
2.20.1
