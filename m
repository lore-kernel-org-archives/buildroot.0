From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:12 +0200
Subject: [Buildroot] [PATCH 17/21 RFC] core: move pkg-utils.mk to support/
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <ebdfbb9d502c91d983aea48addd2c9a3c15d8a1d.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pkg-utils.mk contains various definitions that are used in the package
infrastructures and packages themselves.

However, those definitions can be useful in other parts of Buildroot,
and are already used in a few places that are not related to the package
infrastructure. Also, $(sep) will be needed early in the Makefile when
we eventually support multiple br2-external trees.

Since this file only contains definitions, we can include it anytime.

So, consider that file to no longer be specific to the package infras:
  - move it to support and rename it,
  - move a few similar definitions from the main Makefile to that file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 Makefile                                      | 11 ++---------
 package/pkg-utils.mk => support/misc/utils.mk | 16 ++++++++++++++--
 2 files changed, 16 insertions(+), 11 deletions(-)
 rename package/pkg-utils.mk => support/misc/utils.mk (94%)

diff --git a/Makefile b/Makefile
index b3f515b..ca87e57 100644
--- a/Makefile
+++ b/Makefile
@@ -95,14 +95,8 @@ else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
 BR_BUILDING = y
 endif
 
-# Strip quotes and then whitespaces
-qstrip = $(strip $(subst ",,$(1)))
-#"))
-
-# Variables for use in Make constructs
-comma := ,
-empty :=
-space := $(empty) $(empty)
+# Include some helper macros and variables
+include support/misc/utils.mk
 
 ifneq ("$(origin O)", "command line")
 O := output
@@ -305,7 +299,6 @@ unexport DESTDIR
 # Causes breakage with packages that needs host-ruby
 unexport RUBYOPT
 
-include package/pkg-utils.mk
 include package/doc-asciidoc.mk
 
 ifeq ($(BR2_HAVE_DOT_CONFIG),y)
diff --git a/package/pkg-utils.mk b/support/misc/utils.mk
similarity index 94%
rename from package/pkg-utils.mk
rename to support/misc/utils.mk
index 99a3c1e..1ed0a01 100644
--- a/package/pkg-utils.mk
+++ b/support/misc/utils.mk
@@ -1,10 +1,22 @@
 ################################################################################
 #
-# This file contains various utility functions used by the package
-# infrastructure, or by the packages themselves.
+# This file contains various utility macros and variables used about
+# everywhere in make constructs:
+#  - the core of Buildroot
+#  - package infrastructures
+#  - packages themselves
 #
 ################################################################################
 
+# Strip quotes and then whitespaces
+qstrip = $(strip $(subst ",,$(1)))
+#"))
+
+# Variables for use in Make constructs
+comma := ,
+empty :=
+space := $(empty) $(empty)
+
 # Case conversion macros. This is inspired by the 'up' macro from gmsl
 # (http://gmsl.sf.net). It is optimised very heavily because these macros
 # are used a lot. It is about 5 times faster than forking a shell and tr.
-- 
1.9.1
