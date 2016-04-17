From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 17 Apr 2016 23:38:22 +0200
Subject: [Buildroot] [PATCH v8 05/14] core: add {TARGET,
	STAGING}_SANITIZE_RPATH_HOOK to TARGET_FINALIZE_HOOKS
In-Reply-To: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
References: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1460929111-15615-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces the TARGET_SANITIZE_RPATH_HOOK and
STAGING_SANITIZE_RPATH_HOOK hooks fixing the ELF files' RPATH of
binaries from, respectively, the TARGET_DIR and the STAGING_DIR
locations.

After running this hook, the RPATH from any target ELF files from both
the target and the staging locations won't contain any occurence of the
sysroot or some build locations.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v7->v8:
- none

changes v6->v7:
- remove the DEBUG env. var. specific handling in Makefile

changes v5->v6:
- update for the new script version
- add debug mode support

changes v4->v5:
- target hook now sanitizes the rpath (Baruch)
- add verbose support
- update comment

changes v3->v4:
- rebase
- add comment

changes v2->v3:
- move hook in Makefile (Baruch)
---
 Makefile | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Makefile b/Makefile
index e3574cf..38d1076 100644
--- a/Makefile
+++ b/Makefile
@@ -653,6 +653,24 @@ endef
 
 TARGET_FINALIZE_HOOKS += HOST_SANITIZE_RPATH_HOOK
 
+# Function sanitizing target/staging ELF files' RPATH.
+# i.e. it removes paths pointing to the staging or build location from the ELF
+# files' RPATH.
+define TARGET_SANITIZE_RPATH_HOOK
+	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
+	READELF=$(TARGET_READELF) \
+		$(TOPDIR)/support/scripts/fix-rpath target $(TARGET_DIR)
+endef
+
+define STAGING_SANITIZE_RPATH_HOOK
+	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
+	READELF=$(TARGET_READELF) \
+		$(TOPDIR)/support/scripts/fix-rpath staging $(STAGING_DIR)
+endef
+
+TARGET_FINALIZE_HOOKS += TARGET_SANITIZE_RPATH_HOOK \
+       STAGING_SANITIZE_RPATH_HOOK
+
 $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(PACKAGES)
-- 
2.8.0
