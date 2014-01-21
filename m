From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Jan 2014 22:04:57 +0100
Subject: [Buildroot] [PATCH] BR2_EXTERNAL: check it is a valid BR2_EXTERNAL
	dir before using it
Message-ID: <1390338297-733-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Using a relative path for BR2_EXTERNAL, and using an external defconfig,
such as in (from a Buildroot top-dir):
    make O=.. BR2_EXTERNAL=.. foo_defconfig

is broken. It is unclear why the %_defconfig rule recurses in that case,
but using relative paths is inherently broken.

This patch first makes BR2_EXTERNAL canonical (ie. makes it an absolute
path). Then we check this path exists and contains a valid BR2_EXTERNAL
tree, by checking external.mk and Config.in exist.

The manual is updated to discourage using relative paths.

Also, a note is added to the O documentation that relative paths are
discouraged as well.

Reported-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 Makefile                             | 10 +++++++++-
 docs/manual/common-usage.txt         | 13 ++++++++++---
 docs/manual/customize-outside-br.txt | 12 +++++++-----
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 9dfb1e0..5753f81 100644
--- a/Makefile
+++ b/Makefile
@@ -118,7 +118,15 @@ ifeq ($(BR2_EXTERNAL),)
   override BR2_EXTERNAL = support/dummy-external
   $(shell rm -f $(BR2_EXTERNAL_FILE))
 else
-  $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
+  _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
+  ifeq ($(and $(_BR2_EXTERNAL),$(wildcard $(_BR2_EXTERNAL)/external.mk),$(wildcard $(_BR2_EXTERNAL)/Config.in)),)
+    ifeq ($(patsubst /%,/,$(BR2_EXTERNAL)),)
+      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist)
+    else
+      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relatively to $(TOPDIR))
+    endif
+  endif
+  $(shell echo BR2_EXTERNAL ?= $(_BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
 endif
 
 # Need that early, before we scan packages
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 1d15c05..ca44b10 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -40,7 +40,8 @@ Or:
  $ cd /tmp/build; make O=$PWD -C path/to/buildroot
 --------------------
 
-All the output files will be located under +/tmp/build+.
+All the output files will be located under +/tmp/build+. If the +O+
+path does not exist, Buildroot will create it.
 
 When using out-of-tree builds, the Buildroot +.config+ and temporary
 files are also stored in the output directory. This means that you can
@@ -48,13 +49,19 @@ safely run multiple builds in parallel using the same source tree as
 long as they use unique output directories.
 
 For ease of use, Buildroot generates a Makefile wrapper in the output
-directory - so after the first run, you no longer need to pass +O=..+
-and +-C ..+, simply run (in the output directory):
+directory - so after the first run, you no longer need to pass +O=<...>+
+and +-C <...>+, simply run (in the output directory):
 
 --------------------
  $ make <target>
 --------------------
 
+The +O+ path can be either an absolute or a relative path, but if it's
+passed as a relative path, it is important to note that it is interpreted
+relative to the main Buildroot source directory, not the current working
+directory. Using relative paths can lead to various broken setups, and
+thus is highly discouraged in favour of using absolute paths.
+
 [[env-vars]]
 
 Environment variables
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 19257e6..53d88d7 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -32,16 +32,18 @@ removed by passing an empty value.
 
 The +BR2_EXTERNAL+ path can be either an absolute or a relative path,
 but if it's passed as a relative path, it is important to note that it
-is interpreted relatively to the main Buildroot source directory, not
-the Buildroot output directory.
+is interpreted relative to the main Buildroot source directory, not
+the Buildroot output directory. Using relative paths can lead to various
+broken setups, and thus is highly discouraged in favour of using
+absolute paths.
 
 Some examples:
 
 -----
- buildroot/ $ make BR2_EXTERNAL=../foobar menuconfig
+ buildroot/ $ make BR2_EXTERNAL=/path/to/foobar menuconfig
 -----
 
-Starting from now on, external definitions from the +../foobar+
+Starting from now on, external definitions from the +/path/to/foobar+
 directory will be used:
 
 -----
@@ -52,7 +54,7 @@ directory will be used:
 We can switch to another external definitions directory at any time:
 
 -----
- buildroot/ $ make BR2_EXTERNAL=../barfoo xconfig
+ buildroot/ $ make BR2_EXTERNAL=/where/we/have/barfoo xconfig
 -----
 
 Or disable the usage of external definitions:
-- 
1.8.1.2
