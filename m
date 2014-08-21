From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:39:32 +0200
Subject: [Buildroot] [git commit] manual/user guide: high-level restructuring
Message-ID: <20140821134002.AA69A9D4CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77007ad95075c013c0c418b13b291645bf631c33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch performs some additional restructuring of the manual,
specifically in the User Guide. In detail:

- Rename 'Daily use' to 'General Buildroot usage'
- Move chapters 'make tips', 'Eclipse integration', and 'Advanced usage' as
  sections under the 'General Buildroot usage' chapter.
- Rename 'Details on Buildroot configuration' into 'Buildroot configuration'
- Rework the 'Customization' section as follows:
  - Move the short section on debugging the external toolchain wrapper into
    the rest of the explanation on external toolchains.
  - Remove the now redundant section on toolchains, as this is already
    explained in much more detail in the 'Buildroot configuration' chapter.
  - Move the sections on busybox/uclibc/kernel configuration from chapter
    'Customization' into a separate chapter 'Configuration of other
    components'.
  - Rename the remaining part of the original 'Customization' chapter into
    'Project-specific customization' and fold it together with the next
    chapter 'Storing the configuration'
- Remove the chapter 'Going further in Buildroot innards' thanks to:
  - Moving the chapter 'How Buildroot works' to the Developer guide.
  - Moving the 'Advanced Buildroot usage' section to the 'General Buildroot
    usage' chapter.
- Remove the chapter 'Hacking Buildroot' by:
  - Adding a reference to adding packages to the 'Project-specific
    customizations' chapter
  - Leaving out the explicit reference to creating board support, as this is
    part of the previous chapter already, so an extra reference is
    redundant.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/common-usage.txt        |    8 +++++-
 docs/manual/configure.txt           |   25 +++++++++++++++++-
 docs/manual/customize-store.txt     |    9 +-----
 docs/manual/customize-toolchain.txt |   49 -----------------------------------
 docs/manual/customize.txt           |   14 ++++-----
 docs/manual/eclipse-integration.txt |    2 +-
 docs/manual/going-further.txt       |    8 -----
 docs/manual/how-buildroot-works.txt |    2 +-
 docs/manual/make-tips.txt           |    2 +-
 docs/manual/manual.txt              |    4 +-
 docs/manual/working-with.txt        |   16 +----------
 11 files changed, 45 insertions(+), 94 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 539185a..89cd9fe 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -1,7 +1,9 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== Daily use
+== General Buildroot usage
+
+include::make-tips.txt[]
 
 include::rebuilding-packages.txt[]
 
@@ -262,3 +264,7 @@ only other format supported is PNG:
 ----------------
 BR2_GRAPH_OUT=png make graph-build
 ----------------
+
+include::eclipse-integration.txt[]
+
+include::advanced.txt[]
diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 16b9cd6..30c34c8 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -2,7 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[configure]]
-== Details on Buildroot configuration
+== Buildroot configuration
 
 All the configuration options in +make *config+ have a help text
 providing details about the option. However, a number of topics
@@ -215,6 +215,20 @@ Drawbacks of this backend:
   fix from the toolchain vendor, unless you build your external
   toolchain by yourself using Crosstool-NG.
 
+===== External toolchain wrapper
+
+When using an external toolchain, Buildroot generates a wrapper program,
+that transparently passes the appropriate options (according to the
+configuration) to the external toolchain programs. In case you need to
+debug this wrapper to check exactly what arguments are passed, you can
+set the environment variable +BR2_DEBUG_WRAPPER+ to either one of:
+
+* +0+, empty or not set: no debug
+
+* +1+: trace all arguments on a single line
+
+* +2+: trace one argument per line
+
 === /dev management
 
 On a Linux system, the +/dev+ directory contains special files, called
@@ -355,3 +369,12 @@ can be chosen from +System configuration+, +Init system+:
 The solution recommended by Buildroot developers is to use the
 *BusyBox init* as it is sufficient for most embedded
 systems. *systemd* can be used for more complex situations.
+
+== Configuration of other components
+
+include::customize-busybox-config.txt[]
+
+include::customize-uclibc-config.txt[]
+
+include::customize-kernel-config.txt[]
+
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index e51edb2..d557902 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -1,8 +1,8 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-[[customize-store]]
-== Storing the configuration
+[[customize-store-basics]]
+=== Basics for storing the configuration
 
 When you have a buildroot configuration that you are satisfied with and
 you want to share it with others, put it under revision control or move
@@ -12,11 +12,6 @@ consists of the buildroot configuration, the configuration files for
 packages that you use (kernel, busybox, uClibc, ...), and your rootfs
 modifications.
 
-
-[[customize-store-basics]]
-=== Basics for storing the configuration
-
-
 [[customize-store-buildroot-config]]
 ==== Buildroot configuration
 
diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
deleted file mode 100644
index 5511431..0000000
--- a/docs/manual/customize-toolchain.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-[[toolchain-custom]]
-=== Customizing the toolchain
-
-There are three distinct types of toolchain backend supported in Buildroot,
-available under the menu +Toolchain+, invoking +make menuconfig+.
-
-==== Using the external toolchain backend
-
-There is no way of tuning an external toolchain since Buildroot does not
-generate it.
-
-It also requires to set the Buildroot settings according to the toolchain ones
-(see xref:external-toolchain-backend[]).
-
-When using an external toolchain, Buildroot generates a wrapper program,
-that transparently passes the appropriate options (according to the
-configuration) to the external toolchain programs. In case you need to
-debug this wrapper to check exactly what arguments are passed, you can
-set the environment variable +BR2_DEBUG_WRAPPER+ to either one of:
-
-* +0+, empty or not set: no debug
-
-* +1+: trace all arguments on a single line
-
-* +2+: trace one argument per line
-
-==== Using the internal Buildroot toolchain backend
-
-The internal Buildroot toolchain backend allows to generate toolchains
-based on http://www.uclibc.org/[uClibc],
-https://www.gnu.org/software/libc/[glibc] and
-http://www.eglibc.org/[eglibc].
-Generation of (e)glibc-based toolchains is still experimental in
-Buildroot.
-
-It allows to tune major settings, such as:
-
-* Linux headers version;
-
-* C library configuration (only available for
-  http://www.uclibc.org/[uClibc], see xref:uclibc-custom[uClibc]);
-
-* Binutils, GCC, Gdb and toolchain options.
-
-These settings are available after selecting the +Buildroot toolchain+ type in
-the menu +Toolchain+.
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index 48a32ea..8dc428d 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -1,17 +1,15 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== Customization
+== Project-specific customization
 
-include::customize-rootfs.txt[]
-
-include::customize-busybox-config.txt[]
+The following sections describe the various way in which you can
+customize Buildroot for a given project.
 
-include::customize-uclibc-config.txt[]
+For instructions on how to add new packages to Buildroot, refer to
+xref:adding-packages[]
 
-include::customize-kernel-config.txt[]
-
-include::customize-toolchain.txt[]
+include::customize-rootfs.txt[]
 
 include::customize-store.txt[]
 
diff --git a/docs/manual/eclipse-integration.txt b/docs/manual/eclipse-integration.txt
index 17ccda5..1f726d8 100644
--- a/docs/manual/eclipse-integration.txt
+++ b/docs/manual/eclipse-integration.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== Integration with Eclipse
+=== Integration with Eclipse
 
 While a part of the embedded Linux developers like classical text
 editors like Vim or Emacs, and command-line based interfaces, a number
diff --git a/docs/manual/going-further.txt b/docs/manual/going-further.txt
deleted file mode 100644
index e9ffcd2..0000000
--- a/docs/manual/going-further.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-== Going further in Buildroot's innards
-
-include::how-buildroot-works.txt[]
-
-include::advanced.txt[]
diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
index 3c09fd9..1204d1e 100644
--- a/docs/manual/how-buildroot-works.txt
+++ b/docs/manual/how-buildroot-works.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== How Buildroot works
+== How Buildroot works
 
 As mentioned above, Buildroot is basically a set of Makefiles that
 download, configure, and compile software with the correct options. It
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 281b628..6d7aa77 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -2,7 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[make-tips]]
-== 'make' tips
+=== 'make' tips
 
 This is a collection of tips that help you make the most of Buildroot.
 
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 053d443..3c2111f 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -32,14 +32,14 @@ include::faq-troubleshooting.txt[]
 
 include::known-issues.txt[]
 
-include::going-further.txt[]
-
 include::legal-notice.txt[]
 
 include::beyond-buildroot.txt[]
 
 = Developer guide
 
+include::how-buildroot-works.txt[]
+
 include::developer-guide.txt[]
 
 include::contribute.txt[]
diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
index 7ad855d..5b7b1bc 100644
--- a/docs/manual/working-with.txt
+++ b/docs/manual/working-with.txt
@@ -6,20 +6,6 @@ needs.
 
 include::configure.txt[]
 
-include::make-tips.txt[]
-
-include::customize.txt[]
-
 include::common-usage.txt[]
 
-include::eclipse-integration.txt[]
-
-== Hacking Buildroot
-
-If Buildroot does not yet fit all your requirements, you may be
-interested in hacking it to add:
-
-* new packages: refer to the xref:adding-packages[Developer guide]
-
-* new board support: refer to the
-  xref:customize-store-board-support[Developer guide].
+include::customize.txt[]
