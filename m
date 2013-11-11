From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Nov 2013 16:03:28 +0100
Subject: [Buildroot] [PATCH 3/4] pkg-infra: add hook to log timing of steps
In-Reply-To: <cover.1384182040.git.yann.morin.1998@free.fr>
References: <cover.1384182040.git.yann.morin.1998@free.fr>
Message-ID: <e7bea6b2655562e1df5e1b73a139ca6b9c9966ca.1384182040.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The timing information is stored in the file $(O)/build-time.log

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4519223..1cf23a0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -44,6 +44,17 @@ define step_end
 	$(foreach hook,$(GLOBAL_INSTRUMENTATION_HOOKS),$(call $(hook),end,$(1),$($(PKG)_NAME))$(sep))
 endef
 
+#######################################
+# Actual steps hooks
+
+# Time steps
+define step_time
+	printf "%s:%-5.5s:%-20.20s: %s\n"           \
+	       "$$(date +%s)" "$(1)" "$(2)" "$(3)"  \
+	       >>"$(BUILD_DIR)/build-time.log"
+endef
+GLOBAL_INSTRUMENTATION_HOOKS += step_time
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
-- 
1.8.1.2
