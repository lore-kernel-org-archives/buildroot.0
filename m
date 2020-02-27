From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 22:45:12 +0100
Subject: [Buildroot] [git commit] package/pkg-generic.mk: simplify
 step_pkg_size
Message-ID: <20200227215246.4700B8EDD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=894d58a15c9678bb34ce40f093d7aa39dd4cb1e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the same trick in step_pkg_size as the one used in check_bin_arch:
factorize the two $(filter ...) calls into one, checking in one step
the step and whether it's the beginning or end of the step.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
