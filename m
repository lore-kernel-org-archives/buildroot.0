From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 15:48:00 +0100
Subject: [Buildroot] [PATCH v2] Makefile: drop ldconfig handling
Message-ID: <1451573280-7301-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ldconfig handling in the main Makefile is utterly broken, as it
calls the build machine ldconfig to generate the ld.so.cache of the
target. Unfortunately, the format of the ld.so.cache is architecture
specific, and therefore the build machine ldconfig cannot be used
as-is.

This patch therefore simply drops using ldconfig entirely, and removes
/etc/ld.so.conf.d/ from the target skeleton. The idea is that all
libraries that should be loaded by the dynamic linker must be
installed in paths where the dynamic linker searches them by default
(typically /lib or /usr/lib).

This might potentially break a few packages, but the only way to know
is to actually stop handling ldconfig.

In order to be notified of such cases, we add a check in
target-finalize to verify that there is no /etc/ld.so.conf file as
well as no /etc/ld.so.conf.d directory. Such checks are done after the
rootfs overlays are copied and post-build scripts are executed, in
order to also catch the cases where such mechanisms would add ld.so
related configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes from v1:
 - Add check for /etc/ld.so.conf.d suggested by Yann
 - Move the checks after copying the rootfs overlays and running the
   post build scripts, in order to catch cases where the ld.so
   configuration would be added by an overlay or a post-build
   script. This was suggested by Arnout.
---
 Makefile                                | 17 +++++------------
 system/skeleton/etc/ld.so.conf.d/.empty |  0
 2 files changed, 5 insertions(+), 12 deletions(-)
 delete mode 100644 system/skeleton/etc/ld.so.conf.d/.empty

diff --git a/Makefile b/Makefile
index 1d69192..8953b02 100644
--- a/Makefile
+++ b/Makefile
@@ -598,18 +598,6 @@ endif
 		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
 
 	mkdir -p $(TARGET_DIR)/etc
-	# Mandatory configuration file and auxiliary cache directory
-	# for recent versions of ldconfig
-	touch $(TARGET_DIR)/etc/ld.so.conf
-	mkdir -p $(TARGET_DIR)/var/cache/ldconfig
-	if [ -x "$(TARGET_CROSS)ldconfig" ]; \
-	then \
-		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR) \
-					-f $(TARGET_DIR)/etc/ld.so.conf; \
-	else \
-		/sbin/ldconfig -r $(TARGET_DIR) \
-			       -f $(TARGET_DIR)/etc/ld.so.conf; \
-	fi
 	( \
 		echo "NAME=Buildroot"; \
 		echo "VERSION=$(BR2_VERSION_FULL)"; \
@@ -628,6 +616,11 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+	test -f $(TARGET_DIR)/etc/ld.so.conf && \
+		{ echo "ERROR: we shouldn't have a /etc/ld.so.conf file"; exit 1; } || true
+	test -d $(TARGET_DIR)/etc/ld.so.conf.d && \
+		{ echo "ERROR: we shouldn't have a /etc/ld.so.conf.d directory"; exit 1; } || true
+
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
diff --git a/system/skeleton/etc/ld.so.conf.d/.empty b/system/skeleton/etc/ld.so.conf.d/.empty
deleted file mode 100644
index e69de29..0000000
-- 
2.6.4
