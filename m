From: Malte Starostik <m-starostik@versanet.de>
Date: Sat, 24 Jul 2010 21:29:54 +0200
Subject: [Buildroot] [Corrected - my bad][PATCH] Remove gdb plugins from
	target
In-Reply-To: <20100724195818.4b7c0bd6@surf>
References: <20100724195818.4b7c0bd6@surf>
Message-ID: <1279999794-9385-1-git-send-email-m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Don't install gdb plugins unless BR2_TARGET_GDB is set

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
---
 Makefile                     |    3 +++
 package/libglib2/libglib2.mk |    9 +++++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 0123e97..f8af6bd 100644
--- a/Makefile
+++ b/Makefile
@@ -399,6 +399,9 @@ else
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
index 6a43829..d7cd828 100644
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
