From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Dec 2013 20:15:19 -0000
Subject: [Buildroot] [git commit] pkg-infra: add hook to log timing of steps
Message-ID: <20131201201518.EE05A9BE44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17d4eb1e0261793a9f89e4a2253602c7ab926d2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The timing information is stored in the file $(O)/build-time.log

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 073cff3..619974e 100644
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
