From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Oct 2015 11:15:05 +0200
Subject: [Buildroot] [PATCHv5 1/2] pkg-generic: detect incorrectly used
	package
In-Reply-To: <1444382106-16019-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1444382106-16019-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1444382106-16019-2-git-send-email-thomas.petazzoni@free-electrons.com>
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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v4:
 - Use $($(PKG)_KCONFIG_VAR) and $($(PKG)_TYPE) as suggested by Arnout.
 - Split the "potential culprit" mechanism into a separate commit, as
   suggested by Yann.

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
 package/pkg-generic.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 76ec295..a831199 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -143,6 +143,16 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
+# Only trigger the check for default builds. If the user forces
+# building a package, even if not enabled in the configuration, we
+# want to accept it.
+ifeq ($(MAKECMDGOALS),)
+	@if test "$($(PKG)_TYPE)" = "target" -a -z "$($($(PKG)_KCONFIG_VAR))" ; then \
+		echo "ERROR: A package must have added $($(PKG)_NAME) to its _DEPENDENCIES line but" ; \
+		echo "forgot to add the corresponding select / depends on $($(PKG)_KCONFIG_VAR)." ; \
+		exit 1 ; \
+	fi
+endif
 	@$(call step_start,configure)
 	@$(call MESSAGE,"Configuring")
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
-- 
2.6.1
