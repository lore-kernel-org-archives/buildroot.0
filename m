From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 20:43:43 +0100
Subject: [Buildroot] [PATCH 1/2] package/pkg-generic.mk: simplify
 step_pkg_size
In-Reply-To: <20200226194345.1087529-1-thomas.petazzoni@bootlin.com>
References: <20200226194345.1087529-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200226194345.1087529-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the same trick in step_pkg_size as the one used in check_bin_arch:
factorize the two $(filter ...) calls into one, checking in one step
the step and whether it's the beginning or end of the step.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f4f525f41a..6687ac9198 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -95,12 +95,12 @@ define step_pkg_size_inner
 endef
 
 define step_pkg_size
-	$(if $(filter install-target,$(2)),\
-		$(if $(filter end,$(1)),$(call step_pkg_size_inner,$(3),$(TARGET_DIR))))
-	$(if $(filter install-staging,$(2)),\
-		$(if $(filter end,$(1)),$(call step_pkg_size_inner,$(3),$(STAGING_DIR),-staging)))
-	$(if $(filter install-host,$(2)),\
-		$(if $(filter end,$(1)),$(call step_pkg_size_inner,$(3),$(HOST_DIR),-host)))
+	$(if $(filter end-install-target,$(1)-$(2)),\
+		$(call step_pkg_size_inner,$(3),$(TARGET_DIR)))
+	$(if $(filter end-install-staging,$(1)-$(2)),\
+		$(call step_pkg_size_inner,$(3),$(STAGING_DIR),-staging))
+	$(if $(filter end-install-host,$(1)-$(2)),\
+		$(call step_pkg_size_inner,$(3),$(HOST_DIR),-host))
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
 
-- 
2.24.1
