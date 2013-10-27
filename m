From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Oct 2013 17:24:12 +0000
Subject: [Buildroot] [PATCH 3/4] pkg-infra: add hook to log timing of steps
In-Reply-To: <a356a9112eac610a00a35e48fa9a04a81a460fe0.1382894622.git.yann.morin.1998@free.fr>
References: <a356a9112eac610a00a35e48fa9a04a81a460fe0.1382894622.git.yann.morin.1998@free.fr>
Message-ID: <335ee8e69b9b82ab47b8ff33f5bbd8f45eef793d.1382894622.git.yann.morin.1998@free.fr>
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
index 799555c..72e0e82 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -43,6 +43,17 @@ define step_end
 	$(foreach hook,$(STEP_HOOKS),$(call $(hook),end,$(1),$($(PKG)_NAME))$(sep))
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
+STEP_HOOKS += step_time
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
-- 
1.8.1.2
