From: Richard Braun <rbraun@sceen.net>
Date: Tue, 20 Nov 2012 18:18:11 +0100
Subject: [Buildroot] [PATCH] Makefile: fix thread libraries stripping
Message-ID: <1353431891-30930-1-git-send-email-rbraun@sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Strip libthread_db the same as any other library, but strip libpthread
with --strip-debug. See the relevant mailing list discussion [1] for
additional details.

[1] http://lists.busybox.net/pipermail/buildroot/2012-October/060126.html

Signed-off-by: Richard Braun <rbraun@sceen.net>
---
 Makefile            |   10 +++++++++-
 package/Makefile.in |    2 ++
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 21aa054..4db5cbc 100644
--- a/Makefile
+++ b/Makefile
@@ -419,7 +419,7 @@ ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
 STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
 endif
 STRIP_FIND_CMD += -type f -perm +111
-STRIP_FIND_CMD += -not \( $(call findfileclauses,libthread_db*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
+STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
 
 target-finalize:
 ifeq ($(BR2_HAVE_DEVFILES),y)
@@ -450,6 +450,14 @@ endif
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
 		xargs -r $(KSTRIPCMD) || true
 
+# See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
+# besides the one in which crash occurred; or SIGTRAP kills my program when
+# I set a breakpoint"
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+	find $(TARGET_DIR)/lib -type f -name 'libpthread*.so*' | \
+		xargs $(STRIPCMD) $(STRIP_STRIP_DEBUG) || true
+endif
+
 	mkdir -p $(TARGET_DIR)/etc
 	# Mandatory configuration file and auxilliary cache directory
 	# for recent versions of ldconfig
diff --git a/package/Makefile.in b/package/Makefile.in
index 9fdc745..4813674 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -126,6 +126,7 @@ TARGET_CXX := $(CCACHE) $(TARGET_CXX)
 endif
 
 ifeq ($(BR2_STRIP_strip),y)
+STRIP_STRIP_DEBUG:=--strip-debug
 STRIP_STRIP_UNNEEDED:=--strip-unneeded
 STRIP_STRIP_ALL:=--strip-all
 TARGET_STRIP=$(TARGET_CROSS)strip
@@ -133,6 +134,7 @@ STRIPCMD=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
 KSTRIPCMD=$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
 endif
 ifeq ($(BR2_STRIP_sstrip),y)
+STRIP_STRIP_DEBUG:=
 STRIP_STRIP_UNNEEDED:=
 STRIP_STRIP_ALL:=
 TARGET_STRIP=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-sstrip
-- 
1.7.2.5
