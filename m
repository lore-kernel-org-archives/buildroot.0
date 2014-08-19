From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Aug 2014 21:41:47 +0200
Subject: [Buildroot] [PATCH 2 of 3 for 2014.08] manual/user guide:
	high-level restructuring
In-Reply-To: <patchbomb.1408477305@localhost>
References: <patchbomb.1408477305@localhost>
Message-ID: <80688762f12421672494.1408477307@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---

 docs/manual/common-usage.txt        |   8 ++++-
 docs/manual/configure.txt           |  25 ++++++++++++++-
 docs/manual/customize-store.txt     |   9 +----
 docs/manual/customize-toolchain.txt |  49 -----------------------------
 docs/manual/customize.txt           |  16 ++++-----
 docs/manual/eclipse-integration.txt |   2 +-
 docs/manual/going-further.txt       |   8 ----
 docs/manual/how-buildroot-works.txt |   2 +-
 docs/manual/make-tips.txt           |   2 +-
 docs/manual/manual.txt              |   4 +-
 docs/manual/working-with.txt        |  16 +--------
 11 files changed, 46 insertions(+), 95 deletions(-)


Again, for ease of reviewing the structure, the original structure of the
User guide was:

II. User guide

    6. Details on Buildroot configuration

        6.1. Cross-compilation toolchain
        6.2. /dev management
        6.3. init system

    7. make tips
    8. Customization

        8.1. Customizing the generated target filesystem
        8.2. Customizing the BusyBox configuration
        8.3. Customizing the uClibc configuration
        8.4. Customizing the Linux kernel configuration
        8.5. Customizing the toolchain

    9. Storing the configuration

        9.1. Basics for storing the configuration
        9.2. Creating your own board support
        9.3. Step-by-step instructions for storing configuration
        9.4. Customizing packages
        9.5. Keeping customizations outside Buildroot

    10. Daily use

        10.1. Understanding when a full rebuild is necessary
        10.2. Understanding how to rebuild packages
        10.3. Offline builds
        10.4. Building out-of-tree
        10.5. Environment variables
        10.6. Dealing efficiently with filesystem images
        10.7. Graphing the dependencies between packages
        10.8. Graphing the build duration

    11. Integration with Eclipse
    12. Hacking Buildroot
    13. Frequently Asked Questions & Troubleshooting

        13.1. The boot hangs after Starting network?
        13.2. Why is there no compiler on the target?
        13.3. Why are there no development files on the target?
        13.4. Why is there no documentation on the target?
        13.5. Why are some packages not visible in the Buildroot config
menu?
        13.6. Why not use the target directory as a chroot directory?
        13.7. Why doesn?t Buildroot generate binary packages (.deb, .ipkg?)?

    14. Known issues
    15. Going further in Buildroot?s innards

        15.1. How Buildroot works
        15.2. Advanced usage

    16. Legal notice and licensing

        16.1. Complying with open source licenses
        16.2. License abbreviations
        16.3. Complying with the Buildroot license

    17. Beyond Buildroot

        17.1. Boot the generated images
        17.2. Chroot

and this becomes:

II. User guide

    6. Buildroot configuration

        6.1. Cross-compilation toolchain
        6.2. /dev management
        6.3. init system

    7. Configuration of other components

        7.1. Customizing the BusyBox configuration
        7.2. Customizing the uClibc configuration
        7.3. Customizing the Linux kernel configuration

    8. General Buildroot usage

        8.1. make tips
        8.2. Understanding when a full rebuild is necessary
        8.3. Understanding how to rebuild packages
        8.4. Offline builds
        8.5. Building out-of-tree
        8.6. Environment variables
        8.7. Dealing efficiently with filesystem images
        8.8. Graphing the dependencies between packages
        8.9. Graphing the build duration
        8.10. Integration with Eclipse
        8.11. Advanced usage

    9. Project-specific customization

        9.1. Customizing the generated target filesystem
        9.2. Basics for storing the configuration
        9.3. Creating your own board support
        9.4. Step-by-step instructions for storing configuration
        9.5. Customizing packages
        9.6. Keeping customizations outside Buildroot

    10. Frequently Asked Questions & Troubleshooting

        10.1. The boot hangs after Starting network?
        10.2. Why is there no compiler on the target?
        10.3. Why are there no development files on the target?
        10.4. Why is there no documentation on the target?
        10.5. Why are some packages not visible in the Buildroot config
menu?
        10.6. Why not use the target directory as a chroot directory?
        10.7. Why doesn?t Buildroot generate binary packages (.deb, .ipkg?)?

    11. Known issues
    12. Legal notice and licensing

        12.1. Complying with open source licenses
        12.2. License abbreviations
        12.3. Complying with the Buildroot license

    13. Beyond Buildroot

        13.1. Boot the generated images
        13.2. Chroot

diff -r 6da37bceeeff -r 80688762f124 docs/manual/common-usage.txt
--- a/docs/manual/common-usage.txt	Tue Aug 12 22:14:07 2014 +0200
+++ b/docs/manual/common-usage.txt	Thu Aug 14 21:45:29 2014 +0200
@@ -1,7 +1,9 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== Daily use
+== General Buildroot usage
+
+include::make-tips.txt[]
 
 include::rebuilding-packages.txt[]
 
@@ -262,3 +264,7 @@
 ----------------
 BR2_GRAPH_OUT=png make graph-build
 ----------------
+
+include::eclipse-integration.txt[]
+
+include::advanced.txt[]
diff -r 6da37bceeeff -r 80688762f124 docs/manual/configure.txt
--- a/docs/manual/configure.txt	Tue Aug 12 22:14:07 2014 +0200
+++ b/docs/manual/configure.txt	Thu Aug 14 21:45:29 2014 +0200
@@ -2,7 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[configure]]
-== Details on Buildroot configuration
+== Buildroot configuration
 
 All the configuration options in +make *config+ have a help text
 providing details about the option. However, a number of topics
@@ -215,6 +215,20 @@
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
@@ -355,3 +369,12 @@
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
diff -r 6da37bceeeff -r 80688762f124 docs/manual/customize-store.txt
--- a/docs/manual/customize-store.txt	Tue Aug 12 22:14:07 2014 +0200
+++ b/docs/manual/customize-store.txt	Thu Aug 14 21:45:29 2014 +0200
@@ -1,8 +1,8 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-[[customize-store]]
-== Storing the configuration
+[[customize-store-basics]]
+=== Basics for storing the configuration
 
 When you have a buildroot configuration that you are satisfied with and
 you want to share it with others, put it under revision control or move
@@ -12,11 +12,6 @@
 packages that you use (kernel, busybox, uClibc, ...), and your rootfs
 modifications.
 
-
-[[customize-store-basics]]
-=== Basics for storing the configuration
-
-
 [[customize-store-buildroot-config]]
 ==== Buildroot configuration
 
diff -r 6da37bceeeff -r 80688762f124 docs/manual/customize-toolchain.txt
--- a/docs/manual/customize-toolchain.txt	Tue Aug 12 22:14:07 2014 +0200
+++ /dev/null	Thu Jan 01 00:00:00 1970 +0000
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
diff -r 6da37bceeeff -r 80688762f124 docs/manual/customize.txt
--- a/docs/manual/customize.txt	Tue Aug 12 22:14:07 2014 +0200
+++ b/docs/manual/customize.txt	Thu Aug 14 21:45:29 2014 +0200
@@ -1,18 +1,16 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== Customization
+== Project-specific customization
+
+The following sections describe the various way in which you can
+customize Buildroot for a given project.
+
+For instructions on how to add new packages to Buildroot, refer to
+xref:adding-packages[]
 
 include::customize-rootfs.txt[]
 
-include::customize-busybox-config.txt[]
-
-include::customize-uclibc-config.txt[]
-
-include::customize-kernel-config.txt[]
-
-include::customize-toolchain.txt[]
-
 include::customize-store.txt[]
 
 include::customize-packages.txt[]
diff -r 6da37bceeeff -r 80688762f124 docs/manual/eclipse-integration.txt
--- a/docs/manual/eclipse-integration.txt	Tue Aug 12 22:14:07 2014 +0200
+++ b/docs/manual/eclipse-integration.txt	Thu Aug 14 21:45:29 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== Integration with Eclipse
+=== Integration with Eclipse
 
 While a part of the embedded Linux developers like classical text
 editors like Vim or Emacs, and command-line based interfaces, a number
diff -r 6da37bceeeff -r 80688762f124 docs/manual/going-further.txt
--- a/docs/manual/going-further.txt	Tue Aug 12 22:14:07 2014 +0200
+++ /dev/null	Thu Jan 01 00:00:00 1970 +0000
@@ -1,8 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-== Going further in Buildroot's innards
-
-include::how-buildroot-works.txt[]
-
-include::advanced.txt[]
diff -r 6da37bceeeff -r 80688762f124 docs/manual/how-buildroot-works.txt
--- a/docs/manual/how-buildroot-works.txt	Tue Aug 12 22:14:07 2014 +0200
+++ b/docs/manual/how-buildroot-works.txt	Thu Aug 14 21:45:29 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== How Buildroot works
+== How Buildroot works
 
 As mentioned above, Buildroot is basically a set of Makefiles that
 download, configure, and compile software with the correct options. It
diff -r 6da37bceeeff -r 80688762f124 docs/manual/make-tips.txt
--- a/docs/manual/make-tips.txt	Tue Aug 12 22:14:07 2014 +0200
+++ b/docs/manual/make-tips.txt	Thu Aug 14 21:45:29 2014 +0200
@@ -2,7 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[make-tips]]
-== 'make' tips
+=== 'make' tips
 
 This is a collection of tips that help you make the most of Buildroot.
 
diff -r 6da37bceeeff -r 80688762f124 docs/manual/manual.txt
--- a/docs/manual/manual.txt	Tue Aug 12 22:14:07 2014 +0200
+++ b/docs/manual/manual.txt	Thu Aug 14 21:45:29 2014 +0200
@@ -32,14 +32,14 @@
 
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
diff -r 6da37bceeeff -r 80688762f124 docs/manual/working-with.txt
--- a/docs/manual/working-with.txt	Tue Aug 12 22:14:07 2014 +0200
+++ b/docs/manual/working-with.txt	Thu Aug 14 21:45:29 2014 +0200
@@ -6,20 +6,6 @@
 
 include::configure.txt[]
 
-include::make-tips.txt[]
+include::common-usage.txt[]
 
 include::customize.txt[]
-
-include::common-usage.txt[]
-
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
