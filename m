From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:10 +0100
Subject: [Buildroot] [PATCH 15/21 RFC] core/pkg-generic: add macro to
	hardlink-or-copy
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <13184d01305cbba2861610b0e54ffa3895c8a2f0.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pkg-generic.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 544ae5c..82fbeb0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -305,6 +305,24 @@ endif
 endef
 
 ################################################################################
+# hardlink-copy -- hardlink source and destination if possible, otherwise
+# do a simple copy
+#
+# argument 1 is the source
+# argument 2 is the destination *directory*
+#
+# example:
+#   $(call hard-link-copy,source,destination)
+#
+# Note: we make that a single command, so se can:
+#  - use '$(Q)' in front of it and properly silence the whole macro,
+#  - use '|| exit 1' after it, so we can exit on error in compound commands.
+################################################################################
+define hardlink-copy
+	{ mkdir -p $(2) && { cp -l $(1) $(2) 2>/dev/null || cp $(1) $(2); } }
+endef
+
+################################################################################
 # inner-generic-package -- generates the make targets needed to build a
 # generic package
 #
-- 
1.9.1
