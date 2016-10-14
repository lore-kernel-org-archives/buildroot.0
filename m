From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Oct 2016 16:39:21 +0200
Subject: [Buildroot] [PATCH 09/12] docs/manual: document multi br2-external
In-Reply-To: <cover.1476455955.git.yann.morin.1998@free.fr>
References: <cover.1476455955.git.yann.morin.1998@free.fr>
Message-ID: <54967bac9ee761e7cd3e160bb86d00bd6e1146f8.1476455955.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Julien CORJON <corjon.j@ecagroup.com>
---
 docs/manual/br2-external-converting.txt |  9 ++++--
 docs/manual/customize-outside-br.txt    | 49 ++++++++++++++++++++++++---------
 2 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/docs/manual/br2-external-converting.txt b/docs/manual/br2-external-converting.txt
index b207601..9c7a168 100644
--- a/docs/manual/br2-external-converting.txt
+++ b/docs/manual/br2-external-converting.txt
@@ -4,9 +4,12 @@
 [[br2-external-converting]]
 == Converting old br2-external trees
 
-Buildroot 2016.11 introduced a backward-incompatible change in the way
-br2-external trees are handled. A minor change has to be made: adding
-a name to your br2-external tree, see xref:outside-br-custom[].
+Before Buildroot 2016.11, it was possible to use only one br2-external
+tree at once. With Buildroot 2016.11 came the possibility to use more
+than one simultaneously (for details, see xref:outside-br-custom[]).
+
+This however means that older br2-external trees are not usable as-is.
+A minor change has to be made: adding a name to your br2-external tree.
 
 This can be done very easily in just a few steps:
 
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 3ad0bc0..09977e0 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -19,10 +19,10 @@ place project-specific customizations in two locations:
    the br2-external mechanism and what to provide in a br2-external
    tree.
 
-One can tell Buildroot to use a br2-external tree by setting the
-+BR2_EXTERNAL+ make variable set to the path of the br2-external tree
-to use. It can be passed to any Buildroot +make+ invocation. It is
-automatically saved in the hidden +.br-external.mk+ file in the output
+One can tell Buildroot to use one or more br2-external trees by setting
+the +BR2_EXTERNAL+ make variable set to the path(s) of the br2-external
+tree(s) to use. It can be passed to any Buildroot +make+ invocation. It
+is automatically saved in the hidden +.br-external.mk+ file in the output
 directory. Thanks to this, there is no need to pass +BR2_EXTERNAL+ at
 every +make+ invocation. It can however be changed at any time by
 passing a new value, and can be removed by passing an empty value.
@@ -41,10 +41,10 @@ xref:br2-external-converting[] for help on doing so.
 Some examples:
 
 -----
-buildroot/ $ make BR2_EXTERNAL=/path/to/foobar menuconfig
+buildroot/ $ make BR2_EXTERNAL=/path/to/foo menuconfig
 -----
 
-From now on, definitions from the +/path/to/foobar+ br2-external tree
+From now on, definitions from the +/path/to/foo+ br2-external tree
 will be used:
 
 -----
@@ -55,9 +55,15 @@ buildroot/ $ make legal-info
 We can switch to another br2-external tree at any time:
 
 -----
-buildroot/ $ make BR2_EXTERNAL=/where/we/have/barfoo xconfig
+buildroot/ $ make BR2_EXTERNAL=/where/we/have/bar xconfig
 -----
 
+We can also use multiple br2-external trees:
+
+----
+buildroot/ $ make BR2_EXTERNAL=/path/to/foo:/where/we/have/bar menuconfig
+----
+
 Or disable the usage of any br2-external tree:
 
 -----
@@ -73,13 +79,23 @@ A br2-external tree must contain at least those three files:
    the keyword 'name:', followed by one or more spaces, followed by the
    name.
 +
-Buildroot sets +BR2_EXTERNAL_$(NAME)_PATH+ to the absolute path of the
+Buildroot sets +BR2_EXTERNAL_$(NAME)_PATH+ to the absolute path of each
    br2-external tree, so that you can use it to refer to your br2-external
    tree. This variable is available both in Kconfig, so you can use it
    to source your Kconfig files (see below) and in the Makefile, so that
    you can use it to include other Makefiles (see below) or refer to other
    files (like data files) from your br2-external tree.
 +
+.Note:
+Since it is possible to use multiple br2-external trees at once, this
+  name is used by Buildroot to generate variables for each of those trees.
+  That name is used to identify your br2-external tree, so try to come up
+  with a name that really describes your br2-external tree, in order for
+  it to be relatively unique, so that it does not clash with another name
+  from another br2-external tree, especially if you are planning on
+  somehow sharing your br2-external tree with third parties or using
+  br2-external trees from third parties.
++
 Example of an +external.desc+ file that declares the name +FOO+:
 +
 ----
@@ -119,9 +135,10 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=$(BR2_EXTERNAL_BAR_42_FOO)/board/<boardname>
 
  * One can store package recipes (i.e. +Config.in+ and +<packagename>.mk+),
    or even custom configuration options and make logic. Buildroot
-   automatically includes +Config.in+ to make it appear in the top-level
-   configuration menu, and includes +external.mk+ with the rest of the
-   makefile logic.
+   automatically includes the +Config.in+ from each br2-external tree to
+   make it appear in the top-level configuration menu, and includes the
+   +external.mk+ from each br2-external tree with the rest of the makefile
+   logic.
 +
 The main usage of this is to store package recipes. The recommended way
    to do this is to write a +Config.in+ file that looks like:
@@ -146,5 +163,11 @@ And then in +$(BR2_EXTERNAL_FOO_42_PATH)/package/package1+ and
  * One can store Buildroot defconfigs in the +configs+ subdirectory of
    the br2-external tree. Buildroot will automatically show them in the
    output of +make list-defconfigs+ and allow them to be loaded with the
-   normal +make <name>_defconfig+ command. They will be visible under the
-   +User-provided configs+' label in the 'make list-defconfigs' output.
+   normal +make <name>_defconfig+ command. They will be visible in the
+   'make list-defconfigs' output, below an +External configs+ label that
+   contains the name of the br2-extermnal tree they are defined in.
++
+.Note:
+If a defconfig file is present in more than one br2-external tree, then
+   the first one is used. It is not possible to override a defconfig
+   bundled in Buildroot.
-- 
2.7.4
