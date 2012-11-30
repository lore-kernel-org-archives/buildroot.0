From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 12:06:40 -0800
Subject: [Buildroot] [git commit] pkg-infra: introduce errors for legacy API
Message-ID: <20121130201152.E2AE89940D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebcfa987df4095a7805ff124ab648fb607c89215
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed in the BR developer days, we want to be more strict about API
changes in buildroot. I.e., we want to make it less likely that a user's
customizations break down after upgrading buildroot.

A first step is to make sure that the user is warned about API changes.
This patch introduces Makefile.legacy and Config.in.legacy, which will
issue clear error messages for such situations.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in        |    2 ++
 Config.in.legacy |   51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile         |    7 ++++++-
 Makefile.legacy  |   13 +++++++++++++
 4 files changed, 72 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index eaafece..b319ac7 100644
--- a/Config.in
+++ b/Config.in
@@ -434,3 +434,5 @@ source "fs/Config.in"
 source "boot/Config.in"
 
 source "linux/Config.in"
+
+source "Config.in.legacy"
diff --git a/Config.in.legacy b/Config.in.legacy
new file mode 100644
index 0000000..4bc8784
--- /dev/null
+++ b/Config.in.legacy
@@ -0,0 +1,51 @@
+#
+# Config.in.legacy - support for backward compatibility
+#
+# When an existing Config.in symbol is removed, it should be added again in this
+# file, and take appropriate action to approximate backward compatibility. If
+# there is an equivalent (set of) new symbols, these can just be select'ed by
+# the old symbol. This makes sure that running 'make oldconfig' will make things
+# "just work" when upgrading to a new buildroot version. If the change is too
+# fundamental and cannot be fixed by a simple select, then the old symbol should
+# select BR2_LEGACY.  If that symbol is set, the build will issue an error.
+#
+# When adding legacy symbols to this file, add them to the front. The oldest
+# symbols will be removed again after about two years.
+#
+# The symbol should be copied as-is from the place where it was previously
+# defined, but the help text should be removed or replaced with something that
+# explains how to fix it.
+
+config BR2_LEGACY
+	bool
+	help
+	  This option is selected automatically when your old .config uses an
+	  option that no longer exists in current buildroot. In that case, the
+	  build will fail. Look for config options which are selected in the
+	  menu below: they no longer exist and should be replaced by something
+	  else.
+
+# This comment fits exactly in a 80-column display
+comment "Legacy detected: check the content of the menu below"
+	depends on BR2_LEGACY
+
+# This option should get a new name with every buildroot release, so it defaults
+# to y again for people who upgrade.
+menuconfig BR2_LEGACY_CHECK_2012_11
+	bool "Check for legacy config options"
+	default y
+	help
+	  Select this option to see the config options that are present in your
+	  current .config but are no longer supported by buildroot. If any of
+	  the options in this menu is selected, they should be replaced with
+	  something else. As long as they stay selected, the build will fail.
+	  Just de-select this option to automatically remove all the legacy
+	  configuration.
+
+if BR2_LEGACY_CHECK_2012_11
+
+#
+# Legacy options from 2012.08
+#
+
+endif
diff --git a/Makefile b/Makefile
index 21aa054..1e257e9 100644
--- a/Makefile
+++ b/Makefile
@@ -290,6 +290,12 @@ endif
 
 all: world
 
+# Include legacy before the other things, because package .mk files
+# may rely on it.
+ifneq ($(BR2_DEPRECATED),y)
+include Makefile.legacy
+endif
+
 include package/Makefile.in
 include support/dependencies/dependencies.mk
 
@@ -762,4 +768,3 @@ print-version:
 include docs/manual/manual.mk
 
 .PHONY: $(noconfig_targets)
-
diff --git a/Makefile.legacy b/Makefile.legacy
new file mode 100644
index 0000000..2e015a1
--- /dev/null
+++ b/Makefile.legacy
@@ -0,0 +1,13 @@
+#
+# Makefile.legacy - support for backward compatibility
+#
+# This file contains placeholders to detect backward-compatibility problems.
+# When a buildroot "API" feature is being deprecated, a rule should be added
+# here that issues an error when the old feature is used.
+#
+# This file is not included if BR2_DEPRECATED is selected, so it is possible
+# to bypass the errors (although that's usually a bad idea).
+
+ifeq ($(BR2_LEGACY),y)
+$(error "You have legacy configuration in your .config! Please check your configuration.")
+endif
