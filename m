From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Sep 2015 23:11:38 +0200
Subject: [Buildroot] [PATCHv4] pkg-generic: detect incorrectly used package
Message-ID: <1441141898-26885-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In Buildroot, the selection of a package from a Config.in level and
from a Makefile level are completely disconnected. This can lead to
issues where the build of a package is triggered at the Makefile level
due to the package being listed in another package <pkg>_DEPENDENCIES
variable, even if that package is not enabled in the configuration.

This has for example been the case recently with python-can having
'python' in its <pkg>_DEPENDENCIES, while python-can could be enabled
when Python 3.x is used, in which case the 'python' package should not
be built.

To detect such issues more easily, this patch adds a check in the
package infrastructure. When the build process of a package is being
triggered, we verify that the package is enabled in the
configuration. We do this check in the "configure" step, since this
step is the first common step between the normal download case and the
"local site method" / "package override" case.

This requires passing two new target variables to the configure
target:

 - TYPE, which is either host or target. This is needed since the test
   should only be done on target packages (most host packages don't
   have a Config.in option)

 - KCONFIG_VAR, which is the name of the Config.in variable
   corresponding to the package being built. For most packages, it's
   BR2_PACKAGE_<pkg>, but not for toolchain packages, bootloaders or
   linux.

In addition to displaying an error, we try to help the user by saying
which packages could be the culprit. To achieve this, we register the
reverse dependencies of each package in a variable called
<pkg>_DEPENDENT_OF, and display this variable for the problematic
package when the error is detected. Many thanks to Yann E. Morin for
the idea and implementation!

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v3:
 - Add the DEPENDENT_OF mechanism to display which packages are
   mistakenly depending on a package without selecting it. Suggested
   and implement by Yann E. Morin.

Changes since v2:
 - Only do the check if MAKECMDGOALS is empty, i.e if a "default"
   build is being done. This allows advanced users to continue doing
   "make <pkg>" to forcefully build a package even if not enabled in
   the configuration. Suggested by Peter Korsgaard.
 - Add @ in front of the test command so that it doesn't get
   displayed. Suggested by Peter Korsgaard.
 - Improve error message, as suggested by Peter Korsgaard.

Changes since v1:
 - Use KCONFIG_VAR in order to make the thing work for toolchain
   packages, bootloaders and Linux. Issue reported by Vicente.
---
 package/pkg-generic.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6a7d97e..596c798 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -143,6 +143,18 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
+# Only trigger the check for default builds. If the user forces
+# building a package, even if not enabled in the configuration, we
+# want to accept it.
+ifeq ($(MAKECMDGOALS),)
+	@if test "$(TYPE)" = "target" -a -z "$($(KCONFIG_VAR))" ; then \
+		echo "ERROR: A package must have added $($(PKG)_NAME) to its _DEPENDENCIES line but" ; \
+		echo "forgot to add the corresponding select / depends on $(KCONFIG_VAR)." ; \
+		echo "Potential culprits: " ; \
+		for p in $($(PKG)_DEPENDENT_OF) ; do echo " - $$p" ; done ; \
+		exit 1 ; \
+	fi
+endif
 	@$(call step_start,configure)
 	@$(call MESSAGE,"Configuring")
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -664,6 +676,8 @@ $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_CONFIGURE):		TYPE=$(4)
+$$($(2)_TARGET_CONFIGURE):		KCONFIG_VAR=$$($(2)_KCONFIG_VAR)
 $$($(2)_TARGET_RSYNC):                  SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):                  PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
@@ -758,6 +772,9 @@ endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 # configuration
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
+# Store reverse build-dependency information
+$$(eval $$(foreach d,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(call UPPERCASE,$$(d))_DEPENDENT_OF += $(1)$$(sep)))
+
 # Ensure the calling package is the declared provider for all the virtual
 # packages it claims to be an implementation of.
 ifneq ($$($(2)_PROVIDES),)
-- 
2.5.1
