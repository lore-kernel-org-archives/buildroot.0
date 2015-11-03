From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  3 Nov 2015 20:06:04 +0100
Subject: [Buildroot] [PATCH 2/2 v2] core/pkg-generic: check proper package
	installation
In-Reply-To: <cover.1446577223.git.yann.morin.1998@free.fr>
References: <cover.1446577223.git.yann.morin.1998@free.fr>
Message-ID: <fe19a41362f17e9435b0da14097ce9fecda38780.1446577223.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages misbehave, and install files in either $(STAGING_DIR)/$(O)
or in $(TARGET_DIR)/$(O)

One common reason for that is that pkgconf now prepends the sysroot path
to all the paths it returns. Other reasons vary, but are mostly due to
poorly writen generic-packages.

And a new step hooks to check that no file gets installed in either
location, called after the install-target and install-staging steps.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Romain Naour <romain.naour@openwide.fr>

---
Note that, in the current state of Buildroot, this *will* cause a lot of
build failures until all those packages are fixed. Among the known to
break are quite a few Xorg packages, plus many packages that need to
call moc (from Qt4 for sure, possibly from Qt5 too).
---
 package/pkg-generic.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3db616c..59b0938 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -87,6 +87,21 @@ define step_pkg_size
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
 
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
1.9.1
