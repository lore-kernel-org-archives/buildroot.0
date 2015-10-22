From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Oct 2015 22:34:16 +0200
Subject: [Buildroot] [PATCH 21/21 v2] docs/manual: document multi
	br2-external
In-Reply-To: <cover.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <4ae06b5c21e26de732cbd8f41870a31721227b74.1445545973.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/customize-outside-br.txt | 62 ++++++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 21 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index afc5b78..9d5b521 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -17,19 +17,18 @@ place project-specific customizations in two locations:
    having them nicely integrated in the build logic. This section
    explains how to use +BR2_EXTERNAL+.
 
-+BR2_EXTERNAL+ is an environment variable that can be used to point to
-a directory that contains Buildroot customizations. It can be passed
-to any Buildroot +make+ invocation. It is automatically saved in the
-hidden +.br-external+ file in the output directory. Thanks to this,
-there is no need to pass +BR2_EXTERNAL+ at every +make+ invocation. It
-can however be changed at any time by passing a new value, and can be
++BR2_EXTERNAL+ is an environment variable that can be set to contain the
+paths to one or more directories that contains Buildroot customizations.
+It can be passed to any Buildroot +make+ invocation. It is automatically
+saved in the hidden +.br-external+ file in the output directory. Thanks
+to this, there is no need to pass +BR2_EXTERNAL+ at every +make+ invocation.
+It can however be changed at any time by passing a new value, and can be
 removed by passing an empty value.
 
 .Note
-The +BR2_EXTERNAL+ path can be either an absolute or a relative path,
-but if it's passed as a relative path, it is important to note that it
-is interpreted relative to the main Buildroot source directory, *not*
-to the Buildroot output directory.
+Paths in +BR2_EXTERNAL+ can be either absolute or relative paths, but it
+is important to note that relative paths are interpreted relative to the
+main Buildroot source directory, *not* to the Buildroot output directory.
 
 Some examples:
 
@@ -51,6 +50,12 @@ We can switch to another external definitions directory at any time:
 buildroot/ $ make BR2_EXTERNAL=/where/we/have/barfoo xconfig
 -----
 
+We can also use multiple +BR2_EXTERNAL+ locations:
+
+----
+buildroot/ $ make BR2_EXTERNAL="/path/to/foobar /where/we/have/barfoo" menuconfig
+----
+
 Or disable the usage of external definitions:
 
 -----
@@ -60,12 +65,22 @@ buildroot/ $ make BR2_EXTERNAL= xconfig
 A +BR2_EXTERNAL+ tree must contain at least those three files:
 
 +external.id+::
-   That file should contain the ID for the +BR2_EXTERNAL+ tree.
+   That file should contain the ID for that +BR2_EXTERNAL+ tree.
    That ID is used to construct the +BR2_EXTERNAL_$(ID)+ variable,
    available in +Config.in+ and +external.mk+ (see below), so that ID
    must be a valid make and Kconfig variable. Buildroot sets
    +BR2_EXTERNAL_$(ID)+ to the path of the +BR2_EXTERNAL+ tree.
 +
+.Note:
+Since it is possible to use multiple +BR2_EXTERNAL+ trees at once, this
+  ID is used by Buildroot to generate variables for each of those trees.
+  That ID is used to identify your +BR2_EXTERNAL+ tree, so try to come up
+  with an ID that really describes your +BR2_EXTERNAL+ tree, in order for
+  it to be relatively unique, so that it does not clash with another ID
+  from another +BR2_EXTERNAL+ tree, especially if you are planning on
+  somehow sharing your +BR2_EXTERNAL+ tree with third parties or using
+  +BR2_EXTERNAL+ external trees from third parties.
++
 Examples:
 +
   ** +FOO+ -> +BR2_EXTERNAL_FOO+
@@ -93,22 +108,22 @@ Using +BR2_EXTERNAL+ then allows three different things:
    +$(BR2_EXTERNAL_BAR_42)/board/<boardname>/kernel.config+ (to specify
    the location of the kernel configuration file).
 
- * One can store package recipes (i.e. +Config.in+ and
-   +<packagename>.mk+), or even custom configuration options and make
-   logic. Buildroot automatically includes +$(BR2_EXTERNAL)/Config.in+ to
-   make it appear in the top-level configuration menu, and includes
-   +$(BR2_EXTERNAL)/external.mk+ with the rest of the makefile logic.
+ * One can store package recipes (i.e. +Config.in+ and +<packagename>.mk+),
+   or even custom configuration options and make logic. Buildroot
+   automatically includes the +Config.in+ from each paths in +BR2_EXTERNAL+
+   to make it appear in a sub-menu labelled _User-provided options_ at the
+   root of the main configuration menu, and includes the +external.mk+ from
+   each paths in +BR2_EXTERNAL+ with the rest of the makefile logic.
 +
 The main usage of this is to store package recipes. The recommended
-   way to do this is to write a +$(BR2_EXTERNAL)/Config.in+ file that
-   looks like:
+   way to do this is to write +Config.in+ files that look like:
 +
 ------
 source "$BR2_EXTERNAL_BAR_42/package/package1/Config.in"
 source "$BR2_EXTERNAL_BAR_42/package/package2/Config.in"
 ------
 +
-Then, have a +$(BR2_EXTERNAL)/external.mk+ file that looks like:
+Then, write +/external.mk+ files that look like:
 +
 ------
 include $(sort $(wildcard $(BR2_EXTERNAL_BAR_42)/package/*/*.mk))
@@ -121,7 +136,12 @@ And then in +$(BR2_EXTERNAL_FOO_42)/package/package1+ and
    called <boardname> and adapt the above paths accordingly.
 
  * One can store Buildroot defconfigs in the +configs+ subdirectory of
-   +$(BR2_EXTERNAL)+. Buildroot will automatically show them in the
+   a +BR2_EXTERNAL+ tree. Buildroot will automatically show them in the
    output of +make list-defconfigs+ and allow them to be loaded with the
    normal +make <name>_defconfig+ command. They will be visible under the
-   +User-provided configs+' label in the 'make list-defconfigs' output.
+   +User-provided configs+ label in the 'make list-defconfigs' output.
++
+.Note
+If a defconfig file is present in more than one +BR2_EXTERNAL+ location,
+   then the last one is used. It is also possible to override a defconfig
+   bundled in Buildroot.
-- 
1.9.1
