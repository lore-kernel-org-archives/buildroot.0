From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Aug 2014 09:18:56 +0200
Subject: [Buildroot] [git commit] manual/user guide/customization: rework
	section on BR2_EXTERNAL
Message-ID: <20140830072020.72A5A9D2FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d36f10426c1f93406eb4c43f9839bc9a2b2cd21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch reworks the section on BR2_EXTERNAL as follows:
- move note about upstreaming to the chapter introduction
- streamline the section with the previously added section 'Recommended
  directory structure', avoiding duplication.
- use $(BR2_EXTERNAL) rather than BR2_EXTERNAL when referring to file paths.
- some general rewording

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-directory-structure.txt |    1 +
 docs/manual/customize-outside-br.txt          |   90 ++++++++-----------------
 docs/manual/customize.txt                     |    8 ++
 3 files changed, 38 insertions(+), 61 deletions(-)

diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.txt
index 341464a..2ba9d28 100644
--- a/docs/manual/customize-directory-structure.txt
+++ b/docs/manual/customize-directory-structure.txt
@@ -1,6 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
+[[customize-dir-structure]]
 === Recommended directory structure
 
 When customizing Buildroot for your project, you will be creating one or
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index f80ba70..5fe7b60 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -1,30 +1,25 @@
 // -*- mode:doc -*- ;
 
 [[outside-br-custom]]
-=== Keeping customizations outside Buildroot
+=== Keeping customizations outside of Buildroot
 
-The Buildroot community recommends and encourages upstreaming to the
-official Buildroot version the packages and board support that are
-written by developers. However, it is sometimes not possible or
-desirable because some of these packages or board support are highly
-specific or proprietary.
+As already briefly mentioned in xref:customize-dir-structure[], you can
+place project-specific customizations in two locations:
 
-In this case, Buildroot users are offered two choices:
+ * directly within the Buildroot tree, typically maintaining them using
+   branches in a version control system so that upgrading to a newer
+   Buildroot release is easy.
 
- * They can add their packages, board support and configuration files
-   directly within the Buildroot tree, and maintain them by using
-   branches in a version control system.
-
- * They can use the +BR2_EXTERNAL+ mechanism, which allows to keep
-   package recipes, board support and configuration files outside of
-   the Buildroot tree, while still having them nicely integrated in
-   the build logic. The following paragraphs give details on how to
-   use +BR2_EXTERNAL+.
+ * outside of the Buildroot tree, using the +BR2_EXTERNAL+ mechanism.
+   This mechanism allows to keep package recipes, board support and
+   configuration files outside of the Buildroot tree, while still
+   having them nicely integrated in the build logic. This section
+   explains how to use +BR2_EXTERNAL+.
 
 +BR2_EXTERNAL+ is an environment variable that can be used to point to
 a directory that contains Buildroot customizations. It can be passed
 to any Buildroot +make+ invocation. It is automatically saved in the
-hidden +.br-external+ file in the output directory. By doing this,
+hidden +.br-external+ file in the output directory. Thanks to this,
 there is no need to pass +BR2_EXTERNAL+ at every +make+ invocation. It
 can however be changed at any time by passing a new value, and can be
 removed by passing an empty value.
@@ -32,7 +27,7 @@ removed by passing an empty value.
 *Note:* the +BR2_EXTERNAL+ path can be either an absolute or a relative path,
 but if it's passed as a relative path, it is important to note that it
 is interpreted relative to the main Buildroot source directory, *not*
-the Buildroot output directory.
+to the Buildroot output directory.
 
 Some examples:
 
@@ -40,7 +35,7 @@ Some examples:
  buildroot/ $ make BR2_EXTERNAL=/path/to/foobar menuconfig
 -----
 
-Starting from now on, external definitions from the +/path/to/foobar+
+From now on, external definitions from the +/path/to/foobar+
 directory will be used:
 
 -----
@@ -60,7 +55,7 @@ Or disable the usage of external definitions:
  buildroot/ $ make BR2_EXTERNAL= xconfig
 -----
 
-+BR2_EXTERNAL+ then allows three different things:
++BR2_EXTERNAL+ allows three different things:
 
  * One can store all the board-specific configuration files there,
    such as the kernel configuration, the root filesystem overlay, or
@@ -72,63 +67,36 @@ Or disable the usage of external definitions:
    filesystem overlay), or the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
    Buildroot option to
    +$(BR2_EXTERNAL)/board/<boardname>/kernel.config+ (to specify the
-   location of the kernel configuration file). To achieve this, it is
-   recommended but not mandatory, to store those details in
-   directories called +board/<boardname>/+ under +BR2_EXTERNAL+. This
-   matches the directory structure used within Buildroot.
+   location of the kernel configuration file).
 
  * One can store package recipes (i.e. +Config.in+ and
    +<packagename>.mk+), or even custom configuration options and make
-   logic. Buildroot automatically includes +BR2_EXTERNAL/Config.in+ to
+   logic. Buildroot automatically includes +$(BR2_EXTERNAL)/Config.in+ to
    make it appear in the top-level configuration menu, and includes
-   +BR2_EXTERNAL/external.mk+ with the rest of the makefile logic.
+   +$(BR2_EXTERNAL)/external.mk+ with the rest of the makefile logic.
    Providing those two files is mandatory, but they can be empty.
 +
 The main usage of this is to store package recipes. The recommended
-   way to do this is to write a +BR2_EXTERNAL/Config.in+ that looks
-   like:
+   way to do this is to write a +$(BR2_EXTERNAL)/Config.in+ file that
+   looks like:
 +
 ------
-source "$BR2_EXTERNAL/package/package1/Config.in"
-source "$BR2_EXTERNAL/package/package2/Config.in"
+source "$BR2_EXTERNAL/package/<boardname>/package1/Config.in"
+source "$BR2_EXTERNAL/package/<boardname>/package2/Config.in"
 ------
 +
-Then, have a +BR2_EXTERNAL/external.mk+ file that looks like:
+Then, have a +$(BR2_EXTERNAL)/external.mk+ file that looks like:
 +
 ------
-include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
+include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*/*.mk))
 ------
 +
-And then in +BR2_EXTERNAL/package/package1+ and
-   +BR2_EXTERNAL/package/package2+ create normal Buildroot package
-   recipes, as explained in xref:adding-packages[].
+And then in +$(BR2_EXTERNAL)/package/<boardname>/package1+ and
+   +$(BR2_EXTERNAL)/package/<boardname>/package2+ create normal Buildroot
+   package recipes, as explained in xref:adding-packages[].
 
  * One can store Buildroot defconfigs in the +configs+ subdirectory of
-   +BR2_EXTERNAL+. Buildroot will automatically show them in the
+   +$(BR2_EXTERNAL)+. Buildroot will automatically show them in the
    output of +make help+ and allow them to be loaded with the normal
    +make <name>_defconfig+ command. They will be visible under the
-   +User-provided configs:+' label in the 'make help' output.
-
-In the end, a typical +BR2_EXTERNAL+ directory organization would
-generally be:
-
------
-$(BR2_EXTERNAL)/
-+-- Config.in
-+-- external.mk
-+-- board/
-|   +-- <boardname>/
-|       +-- linux.config
-|       +-- overlay/
-|           +-- etc/
-|               +-- <some file>
-+-- configs/
-|   +-- <boardname>_defconfig
-+-- package/
-    +-- package1/
-    |    +-- Config.in
-    |    +-- package1.mk
-    +-- package2/
-        +-- Config.in
-        +-- package2.mk
-------
+   +User-provided configs+' label in the 'make help' output.
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index 6a1102c..9c9533d 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -20,6 +20,14 @@ Typical actions you may need to perform for a given project are:
   (using +BR2_ROOTFS_POST_IMAGE_SCRIPT+)
 - adding project-specific packages
 
+An important note regarding such 'project-specific' customizations:
+please carefully consider which changes are indeed project-specific and
+which changes are also useful to developers outside your project. The
+Buildroot community highly recommends and encourages the upstreaming of
+improvements, packages and board support to the official Buildroot
+project. Of course, it is sometimes not possible or desirable to
+upstream because the changes are highly specific or proprietary.
+
 This chapter describes how to make such project-specific customizations
 in Buildroot and how to store them in a way that you can build the same
 image in a reproducible way, even after running 'make clean'. By
