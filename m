From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Nov 2013 16:03:29 +0100
Subject: [Buildroot] [PATCH 4/4] pkg-infra: add user-supplied step-hooks
In-Reply-To: <cover.1384182040.git.yann.morin.1998@free.fr>
References: <cover.1384182040.git.yann.morin.1998@free.fr>
Message-ID: <8e74486ebbb0c14cd011d2143b988d261f592f7a.1384182040.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Allow user to supply their own step-hooks by passing a variable
on the make command-line:
    make BR2_INSTRUMENTATION_SCRIPTS=/path/to/my/script

This can be usefull to run site-specific actions at each step of the
build process, such as logging installed, removed or modified files,
do sanity checks on installed files...

It is possible to call more than one script, by passing a space-separated
lists of scripts to call.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 docs/manual/debugging-buildroot.txt | 33 +++++++++++++++++++++++++++++++++
 docs/manual/developer-guide.txt     |  2 ++
 package/pkg-generic.mk              |  9 +++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 docs/manual/debugging-buildroot.txt

diff --git a/docs/manual/debugging-buildroot.txt b/docs/manual/debugging-buildroot.txt
new file mode 100644
index 0000000..5fa05b0
--- /dev/null
+++ b/docs/manual/debugging-buildroot.txt
@@ -0,0 +1,33 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[debugging-buildroot]]
+
+Debugging Buildroot
+-------------------
+
+It is possible to instrument the steps +Buildroot+ does when building
+packages. Define the variable +BR2_INSTRUMENTATION_SCRIPTS+ to contain
+the path of one or more scripts (or other executables), in a
+space-separated list, you want called before and after each step. The
+scripts are called in sequence, with three parameters:
+
+  - +start+ or +end+ to denote the start (resp. the end) of a step;
+  - the name of the step about to be started, or which just ended.
+  - the name of the package
+
+For example :
+
+----
+make BR2_INSTRUMENTATION_SCRIPTS="/path/to/my/script1 /path/to/my/script2"
+----
+
+That script has access to the following variables:
+
+  - +BUILDROOT_CONFIG+: the path to the Buildroot .config file
+  - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
+    xref:generic-package-reference[]
+  - +BUILD_DIR+: the directory where packages are extracted and built
+  - +BINARIES_DIR+: the place where all binary files (aka images) are
+    stored
+  - +BASE_DIR+: the base output directory
diff --git a/docs/manual/developer-guide.txt b/docs/manual/developer-guide.txt
index 8125ad5..9054dee 100644
--- a/docs/manual/developer-guide.txt
+++ b/docs/manual/developer-guide.txt
@@ -11,3 +11,5 @@ include::adding-packages.txt[]
 include::patch-policy.txt[]
 
 include::download-infra.txt[]
+
+include::debugging-buildroot.txt[]
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1cf23a0..2822bd7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -55,6 +55,15 @@ define step_time
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_time
 
+# User-supplied script
+define step_user
+	@$(foreach user_hook, $(BR2_INSTRUMENTATION_SCRIPTS), \
+		$(USER_HOOKS_EXTRA_ENV) $(user_hook) "$(1)" "$(2)" "$(3)"$(sep))
+endef
+ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
+GLOBAL_INSTRUMENTATION_HOOKS += step_user
+endif
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
-- 
1.8.1.2
