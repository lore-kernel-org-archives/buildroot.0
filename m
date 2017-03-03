From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri,  3 Mar 2017 15:18:48 +0100
Subject: [Buildroot] [RFC PATCH 4/9] core: add {TARGET,
	STAGING}_SANITIZE_RPATH_HOOK to TARGET_FINALIZE_HOOKS
In-Reply-To: <1488550733-3956-1-git-send-email-wg@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
Message-ID: <1488550733-3956-5-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

This patch introduces the TARGET_SANITIZE_RPATH_HOOK and
STAGING_SANITIZE_RPATH_HOOK hooks fixing the ELF files' RPATH of
binaries from, respectively, the TARGET_DIR and the STAGING_DIR
locations.

It is a fair assumption that all target package has been built before
reaching the target-finalize target; hence the execution of these hooks
as TARGET_FINALIZE_HOOKS.

After running these hooks, the RPATH from any target ELF files from both
the target and the staging locations won't contain any occurrence of the
sysroot or some build locations.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 Makefile | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Makefile b/Makefile
index 54c815b..a68c9ce 100644
--- a/Makefile
+++ b/Makefile
@@ -661,6 +661,22 @@ endef
 TARGET_FINALIZE_HOOKS += PURGE_LOCALES
 endif
 
+# Function sanitizing target/staging ELF files' RPATH.
+# i.e. it removes paths pointing to the staging or build location from the ELF
+# files' RPATH.
+define TARGET_SANITIZE_RPATH_HOOK
+	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
+	$(TOPDIR)/support/scripts/fix-rpath target $(TARGET_DIR)
+endef
+
+define STAGING_SANITIZE_RPATH_HOOK
+	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
+	$(TOPDIR)/support/scripts/fix-rpath staging $(STAGING_DIR)
+endef
+
+TARGET_FINALIZE_HOOKS += TARGET_SANITIZE_RPATH_HOOK \
+       STAGING_SANITIZE_RPATH_HOOK
+
 $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(PACKAGES)
-- 
1.9.1
