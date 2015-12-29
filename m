From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 19:34:21 +0100
Subject: [Buildroot] [git commit] pkg-generic: detect incorrectly used
	package
Message-ID: <20151229183524.598AC81DA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28f67899e54f15c6e48484ea2976c3e431756bcb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Thomas: adjust the error message as suggested by Yann, to take into
account the fact that the problem might not be in a direct reverse
dependency, but in something higher up in the tree of reverse
dependencies.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1e024d3..2daf337 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -182,6 +182,17 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
+# Only trigger the check for default builds. If the user forces
+# building a package, even if not enabled in the configuration, we
+# want to accept it.
+ifeq ($(MAKECMDGOALS),)
+	@if test "$($(PKG)_TYPE)" = "target" -a -z "$($($(PKG)_KCONFIG_VAR))" ; then \
+		echo "ERROR: $($(PKG)_NAME) is in the dependency chain of a package that has" ; \
+		echo "added it to its _DEPENDENCIES variable (directly or indirectly)" ; \
+		echo "without selecting it from Config.in." ; \
+		exit 1 ; \
+	fi
+endif
 	@$(call step_start,configure)
 	@$(call MESSAGE,"Configuring")
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
