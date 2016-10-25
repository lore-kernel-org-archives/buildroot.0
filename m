From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Tue, 25 Oct 2016 14:26:10 -0500
Subject: [Buildroot] [PATCH v13 8/8] skeleton: busybox individual apps no
	symlink
In-Reply-To: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <1477423570-15694-8-git-send-email-bryce.ferguson@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Ignore the creation of a symlink when individual binaries are
used.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes v12 -> v13:
  - No changes

Changes v11 -> v12:
  - Added a comment " allow busybox shell binary to remain when symlink are enabled"

Changes v1 -> v11:
  - No changes
---
 package/skeleton/skeleton.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 1000161..40ac3b1 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -203,10 +203,14 @@ define SKELETON_BIN_SH
 	rm -f $(TARGET_DIR)/bin/sh
 endef
 else
+#Allow a busybox shell binary to remain and not get replaced by a symlink 
+#if individual binaries are enabled
+ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),)
 define SKELETON_BIN_SH
 	ln -sf $(SKELETON_TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
 endef
 endif
+endif
 TARGET_FINALIZE_HOOKS += SKELETON_BIN_SH
 
 ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
-- 
1.9.1
