From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 30 Jun 2017 10:37:03 +0200
Subject: [Buildroot] [RFC PATCH v5 06/11] pkg-generic: add
	GLOBAL_INSTRUMENTATION_HOOKS for rpath sanitation
In-Reply-To: <1498811828-6893-1-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
Message-ID: <1498811828-6893-7-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hook calls the script "fix-rpath" at the end of the installation
step.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 package/pkg-generic.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 825ab0c..8812193 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -139,6 +139,16 @@ define step_check_build_dir
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_check_build_dir
 
+define step_sanitize_rpath
+	$(if $(filter install-host-end,$(2)-$(1)),\
+		support/scripts/fix-rpath "host" $($(PKG)_DIR)/.br_host_filelist)
+	$(if $(filter install-staging-end,$(2)-$(1)),\
+		support/scripts/fix-rpath "staging" $($(PKG)_DIR)/.br_staging_filelist)
+	$(if $(filter install-target-end,$(2)-$(1)),\
+		support/scripts/fix-rpath "target" $($(PKG)_DIR)/.br_target_filelist)
+endef
+GLOBAL_INSTRUMENTATION_HOOKS += step_sanitize_rpath
+
 # User-supplied script
 ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
 define step_user
-- 
2.7.4
