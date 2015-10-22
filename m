From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Oct 2015 22:33:56 +0200
Subject: [Buildroot] [PATCH 01/21 v2] core: do not accept multiple
	definitions of a package
In-Reply-To: <cover.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <1996959fcee1f7bf71e9e8539fa2471fce6b1308.1445545973.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

One of the selling points for br2-external is to provide a mean to add
new packages. However, it is not supported that a package be defined by
Buildroot and then redefined in a br2-external tree.

This situation may occur without the user noticing or even willing to
redefine the package, for example:
  - br2-external is first created against a version of Buildroot
  - a package (missing in Buildroot) is added to that br2-external tree
  - upstream Buildroot adds this package
  - user updates to the new Buildroot

In this case, the result in undefined, and we can't make any guarantee
on the result (working or not).

Add a sanity check so that a package redefinition gets caught.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile               | 1 +
 package/pkg-generic.mk | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index dd8959f..da78f18 100644
--- a/Makefile
+++ b/Makefile
@@ -336,6 +336,7 @@ unexport O
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
 PACKAGES :=
+PACKAGES_ALL :=
 
 # silent mode requested?
 QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ffef4d3..7f0c2ab 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -341,6 +341,14 @@ endef
 
 define inner-generic-package
 
+# Ensure the package is only declared once, i.e. do not accept that a
+# package be re-defined by a br2-external tree
+ifneq ($(call strip,$(filter $(1),$(PACKAGES_ALL))),)
+$$(error Package '$(1)' defined a second time in '$(pkgdir)'; \
+	previous definition was in '$$($(2)_PKGDIR)')
+endif
+PACKAGES_ALL += $(1)
+
 # Define default values for various package-related variables, if not
 # already defined. For some variables (version, source, site and
 # subdir), if they are undefined, we try to see if a variable without
@@ -351,6 +359,7 @@ define inner-generic-package
 $(2)_TYPE                       =  $(4)
 $(2)_NAME			=  $(1)
 $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
+$(2)_PKGDIR			=  $(pkgdir)
 
 # Keep the package version that may contain forward slashes in the _DL_VERSION
 # variable, then replace all forward slashes ('/') by underscores ('_') to
-- 
1.9.1
