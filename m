From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  5 Nov 2015 21:52:36 +0100
Subject: [Buildroot] [PATCHv3] core/pkg-generic: check proper package
	installation
Message-ID: <1446756756-12147-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages misbehave, and install files in either of;
  - $(STAGING_DIR)/$(O) or $(TARGET_DIR)/$(O),
  - $(STAGING_DIR)/$(HOST_DIR) or $(TARGET_DIR)/$(HOST_DIR).

One common reason for that is that pkgconf now prepends the sysroot path
to all the paths it returns. Other reasons vary, but are mostly due to
poorly writen generic-packages.

And a new step hooks to check that no file gets installed in either
locations, called after the install-target and install-staging steps.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Romain Naour <romain.naour@openwide.fr>

---
Changes v2 -> v3;
  - also check for $(HOST_DIR) in case the user specified an
    out-of-build-dir locatiopn  (Arnout)

---
Note that, in the current state of Buildroot, this *will* cause a lot of
build failures until all those packages are fixed. Among the known to
break are quite a few Xorg packages, plus many packages that need to
call moc (from Qt4 for sure, possibly from Qt5 too).
---
 package/pkg-generic.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a5d0e57..2fb3fd8 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -87,6 +87,25 @@ define step_pkg_size
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
 
+define step_check_build_dir_one
+	if [ -d $(2) ]; then \
+		printf "ERROR: package %s installs files in %s\n" $(1) $(2) >&2; \
+		exit 1; \
+	fi
+endef
+
+define step_check_build_dir
+	$(if $(filter install-staging,$(2)),\
+		$(if $(filter end,$(1)),\
+				$(call step_check_build_dir_one,$(3),$(STAGING_DIR)/$(HOST_DIR)); \
+				$(call step_check_build_dir_one,$(3),$(STAGING_DIR)/$(O))))
+	$(if $(filter install-target,$(2)),\
+		$(if $(filter end,$(1)),\
+				$(call step_check_build_dir_one,$(3),$(TARGET_DIR)/$(HOST_DIR)); \
+				$(call step_check_build_dir_one,$(3),$(TARGET_DIR)/$(O))))
+endef
+GLOBAL_INSTRUMENTATION_HOOKS += step_check_build_dir
+
 # User-supplied script
 ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
 define step_user
-- 
1.9.1
