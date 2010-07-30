From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Jul 2010 10:46:37 +0200
Subject: [Buildroot] [git commit master 1/1] Remove gdb plugins from target
Message-ID: <20100730084731.B7A52836CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e48a72e5e958ca8227c04a3ee1e47cac2037a56e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Don't install gdb plugins unless BR2_TARGET_GDB is set

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                     |    3 +++
 package/libglib2/libglib2.mk |    9 +++++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index f130325..291badf 100644
--- a/Makefile
+++ b/Makefile
@@ -388,6 +388,9 @@ else
 	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 endif
+ifneq ($(BR2_PACKAGE_GDB),y)
+	rm -rf $(TARGET_DIR)/usr/share/gdb
+endif
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/man
 	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 35b7ee8..8dc1fcb 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -79,6 +79,15 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DEV_FILES
 endif
 
+define LIBGLIB2_REMOVE_GDB_FILES
+	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gdb
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
+endef
+
+ifneq ($(BR2_PACKAGE_GDB),y)
+LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_GDB_FILES
+endif
+
 $(eval $(call AUTOTARGETS,package,libglib2))
 $(eval $(call AUTOTARGETS,package,libglib2,host))
 
-- 
1.7.1
