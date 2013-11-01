From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 01 Nov 2013 17:06:48 +0100
Subject: [Buildroot] [PATCH 3 of 4] manual: split info on hooks to a
	separate section/file
In-Reply-To: <patchbomb.1383322005@argentina>
References: <patchbomb.1383322005@argentina>
Message-ID: <5c6b13a01d904a47ea33.1383322008@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Split out the information on hooks to a separate section (and source file).
Not only because the hooks are useful for all infrastructures (and thus
don't really fit specifically in the generic infrastructure section), but
also for clarity when the info on hooks will be expanded in later patches.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-autotools.txt |   3 +-
 docs/manual/adding-packages-cmake.txt     |   3 +-
 docs/manual/adding-packages-generic.txt   |  40 +-------------------------
 docs/manual/adding-packages-hooks.txt     |  41 +++++++++++++++++++++++++++
 docs/manual/adding-packages.txt           |   2 +
 5 files changed, 46 insertions(+), 43 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -162,8 +162,7 @@ well for most autotools-based packages. 
 still possible to customize what is done in any particular step:
 
 * By adding a post-operation hook (after extract, patch, configure,
-  build or install). See the reference documentation of the generic
-  infrastructure for details.
+  build or install). See xref:hooks[] for details.
 
 * By overriding one of the steps. For example, even if the autotools
   infrastructure is used, if the package +.mk+ file defines its
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -135,8 +135,7 @@ for most CMake-based packages. However, 
 possible to customize what is done in any particular step:
 
 * By adding a post-operation hook (after extract, patch, configure,
-  build or install). See the reference documentation of the generic
-  infrastructure for details.
+  build or install). See xref:hooks[] for details.
 
 * By overriding one of the steps. For example, even if the CMake
   infrastructure is used, if the package +.mk+ file defines its own
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -451,42 +451,4 @@ In the action definitions, you can use t
 * Of course the +$(HOST_DIR)+, +$(STAGING_DIR)+ and +$(TARGET_DIR)+
   variables to install the packages properly.
 
-The last feature of the generic infrastructure is the ability to add
-hooks. These define further actions to perform after existing steps.
-Most hooks aren't really useful for generic packages, since the +.mk+
-file already has full control over the actions performed in each step
-of the package construction. The hooks are more useful for packages
-using the autotools infrastructure described below.  However, since
-they are provided by the generic infrastructure, they are documented
-here. The exception is +LIBFOO_POST_PATCH_HOOKS+.  Patching the
-package and producing legal info are not user definable, so
-+LIBFOO_POST_PATCH_HOOKS+ and +LIBFOO_POST_LEGAL_INFO_HOOKS+ are
-useful for generic packages.
-
-The following hook points are available:
-
-* +LIBFOO_POST_DOWNLOAD_HOOKS+
-* +LIBFOO_POST_EXTRACT_HOOKS+
-* +LIBFOO_POST_RSYNC_HOOKS+
-* +LIBFOO_PRE_PATCH_HOOKS+
-* +LIBFOO_POST_PATCH_HOOKS+
-* +LIBFOO_PRE_CONFIGURE_HOOKS+
-* +LIBFOO_POST_CONFIGURE_HOOKS+
-* +LIBFOO_POST_BUILD_HOOKS+
-* +LIBFOO_POST_INSTALL_HOOKS+ (for host packages only)
-* +LIBFOO_POST_INSTALL_STAGING_HOOKS+ (for target packages only)
-* +LIBFOO_POST_INSTALL_TARGET_HOOKS+ (for target packages only)
-* +LIBFOO_POST_LEGAL_INFO_HOOKS+
-
-These variables are 'lists' of variable names containing actions to be
-performed at this hook point. This allows several hooks to be
-registered at a given hook point. Here is an example:
-
-----------------------
-define LIBFOO_POST_PATCH_FIXUP
-	action1
-	action2
-endef
-
-LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
-----------------------
+Finally, you can also use hooks. See xref:hooks[] for more information.
diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
new file mode 100644
--- /dev/null
+++ b/docs/manual/adding-packages-hooks.txt
@@ -0,0 +1,41 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[hooks]]
+Hooks available in the various build steps
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The generic infrastructure (and as a result also the derived autotools
+and cmake infrastructures) allow packages to specify hooks.
+These define further actions to perform after existing steps.
+Most hooks aren't really useful for generic packages, since the +.mk+
+file already has full control over the actions performed in each step
+of the package construction.
+
+The following hook points are available:
+
+* +LIBFOO_POST_DOWNLOAD_HOOKS+
+* +LIBFOO_POST_EXTRACT_HOOKS+
+* +LIBFOO_POST_RSYNC_HOOKS+
+* +LIBFOO_PRE_PATCH_HOOKS+
+* +LIBFOO_POST_PATCH_HOOKS+
+* +LIBFOO_PRE_CONFIGURE_HOOKS+
+* +LIBFOO_POST_CONFIGURE_HOOKS+
+* +LIBFOO_POST_BUILD_HOOKS+
+* +LIBFOO_POST_INSTALL_HOOKS+ (for host packages only)
+* +LIBFOO_POST_INSTALL_STAGING_HOOKS+ (for target packages only)
+* +LIBFOO_POST_INSTALL_TARGET_HOOKS+ (for target packages only)
+* +LIBFOO_POST_LEGAL_INFO_HOOKS+
+
+These variables are 'lists' of variable names containing actions to be
+performed at this hook point. This allows several hooks to be
+registered at a given hook point. Here is an example:
+
+----------------------
+define LIBFOO_POST_PATCH_FIXUP
+	action1
+	action2
+endef
+
+LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
+----------------------
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -18,6 +18,8 @@ include::adding-packages-autotools.txt[]
 
 include::adding-packages-cmake.txt[]
 
+include::adding-packages-hooks.txt[]
+
 include::adding-packages-gettext.txt[]
 
 include::adding-packages-tips.txt[]
