From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 22:36:44 +0200
Subject: [Buildroot] [git commit] core/pkg-generic: check proper package
	installation
Message-ID: <20161026203713.9732A7FD9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=938f47c7e89362e7b824dbd0bd1ee9839d56d603
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages misbehave, and install files in either $(STAGING_DIR)/$(O)
or in $(TARGET_DIR)/$(O) .

One common reason for that is that pkgconf now prepends the sysroot path
to all the paths it returns. Other reasons vary, but are mostly due to
poorly writen generic-packages.

And a new step hooks to check that no file gets installed in either
location, called after the install-target and install-staging steps.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3349092..827de62 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -95,6 +95,21 @@ define check_host_rpath
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += check_host_rpath
 
+define step_check_build_dir_one
+	if [ -d $(2) ]; then \
+		printf "%s: installs files in %s\n" $(1) $(2) >&2; \
+		exit 1; \
+	fi
+endef
+
+define step_check_build_dir
+	$(if $(filter install-staging,$(2)),\
+		$(if $(filter end,$(1)),$(call step_check_build_dir_one,$(3),$(STAGING_DIR)/$(O))))
+	$(if $(filter install-target,$(2)),\
+		$(if $(filter end,$(1)),$(call step_check_build_dir_one,$(3),$(TARGET_DIR)/$(O))))
+endef
+GLOBAL_INSTRUMENTATION_HOOKS += step_check_build_dir
+
 # User-supplied script
 ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
 define step_user
