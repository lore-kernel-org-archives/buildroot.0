From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Oct 2016 18:38:52 +0200
Subject: [Buildroot] [PATCH 6/6] core/pkg-generic: check proper package
	installation
In-Reply-To: <cover.1477327063.git.yann.morin.1998@free.fr>
References: <cover.1477327063.git.yann.morin.1998@free.fr>
Message-ID: <705884038a0fa0824f162280fc1ac2adfd6f03d7.1477327064.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/pkg-generic.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e726ac5..7fb0517 100644
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
-- 
2.7.4
