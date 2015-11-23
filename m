From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:34 +0100
Subject: [Buildroot] [PATCH 04/51] core/pkg-generic: add macro to
	hardlink-or-copy
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <bd5f3150dca38c5163fbbee0aa65de83d4e347fe.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes RFC -> v1:
  - move to pkg-utils  (Luca)
---
 package/pkg-utils.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 44bd2c9..447b849 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -113,6 +113,24 @@ $$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
 endif
 endef
 
+################################################################################
+# hardlink-copy -- hardlink source and destination if possible, otherwise
+# do a simple copy
+#
+# argument 1 is the source *file*
+# argument 2 is the destination *directory*
+#
+# example:
+#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir/)
+#
+# Note: we make that a single command, so se can:
+#  - use '$(Q)' in front of it and properly silence the whole macro,
+#  - use '|| exit 1' after it, so we can exit on error in compound commands,
+################################################################################
+define hardlink-copy
+	{ mkdir -p $(2) && { cp -l $(1) $(2) 2>/dev/null || cp $(1) $(2); } }
+endef
+
 #
 # legal-info helper functions
 #
-- 
1.9.1
