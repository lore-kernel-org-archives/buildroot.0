From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 27 Jun 2016 22:58:39 -0500
Subject: [Buildroot] [PATCH v12 9/9] skeleton: busybox individual apps no
	symlink
In-Reply-To: <1467086319-42783-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1467086319-42783-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1467086319-42783-9-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ignore the creation of a symlink when individual binaries are
used.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes v11 -> v12:
  - Added a comment " allow busybox shell binary to remain when symlink are enabled"

Changes v1 -> v11:
  - No changes
---
 package/skeleton/skeleton.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 4e3cdc6..d19bd55 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -200,10 +200,14 @@ define SKELETON_SYSTEM_BIN_SH
 	rm -f $(TARGET_DIR)/bin/sh
 endef
 else
+#Allow a busybox shell binary to remain and not get replaced by a symlink 
+#if individual binaries are enabled
+ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),)
 define SKELETON_SYSTEM_BIN_SH
 	ln -sf $(SKELETON_TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
 endef
 endif
+endif
 TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_BIN_SH
 
 ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
-- 
1.9.1
