From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:16 +0100
Subject: [Buildroot] [PATCH 21/21 RFC] core/pkg-infra: ensure legal-info
	works in off-line mode
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <0aa743543356cbe19450b672b435f016260ee7d6.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Almost all packages which are saved for legal-info have their source
archives downloaded as part of 'make source', which makes an off-line
build completely possible [0].

However, for the pre-configured external toolchains, the source tarball
is different, as the main tarball is a binary package. And that source
tarball is only downloaded during the legal-info phase, which makes it
inconvenient for full off-line builds.

We fix that in two steps:

  - first, we move the declaration of _ACTUAL_SOURCE_TARBALL and _SITE
    earlier in the pkg-generic.mk file, so we get those definitions at
    the time we define the -source and -all-source rules;

  - second, we add a new rule, $(1)-legal-source which only
    $(1)-all-source depends on, so that we only download it for a
    top-level 'make source', not as part of the standard download
    mechanism (i.e. only what is really needed to build).

This way, we can do a complete [0] off-line build and are still able to
generate legal-info, while at the same time we do not incur any download
overhead during a simple build.

[0] Save for nodejs which invarriably wants to download stuff at build
time. Sigh... :-( Fixing that is work for another time...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/pkg-generic.mk | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8730a8d..9db0c62 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -438,6 +438,14 @@ ifndef $(2)_SOURCE
  endif
 endif
 
+# If FOO_ACTUAL_SOURCE_TARBALL is explicitly defined, it means FOO_SOURCE is
+# indeed a binary (e.g. external toolchain) and FOO_ACTUAL_SOURCE_TARBALL/_SITE
+# point to the actual sources tarball. Use the actual sources for legal-info.
+# For most packages the FOO_SITE/FOO_SOURCE pair points to real source code,
+# so these are the defaults for FOO_ACTUAL_*.
+$(2)_ACTUAL_SOURCE_TARBALL ?= $$($(2)_SOURCE)
+$(2)_ACTUAL_SOURCE_SITE    ?= $$(call qstrip,$$($(2)_SITE))
+
 ifndef $(2)_PATCH
  ifdef $(3)_PATCH
   $(2)_PATCH = $$($(3)_PATCH)
@@ -639,6 +647,13 @@ $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
 $(1)-source:		$$($(2)_TARGET_SOURCE)
 
+$(1)-all-source:	$(1)-legal-source
+
+$(1)-legal-source:	$(1)-source
+ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),)
+	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
+endif
+
 $(1)-source-check:
 	$$(foreach p,$$($(2)_ALL_DOWNLOADS),$$(call SOURCE_CHECK,$$(p))$$(sep))
 
@@ -780,14 +795,6 @@ endif
 endif
 endif
 
-# If FOO_ACTUAL_SOURCE_TARBALL is explicitly defined, it means FOO_SOURCE is
-# indeed a binary (e.g. external toolchain) and FOO_ACTUAL_SOURCE_TARBALL/_SITE
-# point to the actual sources tarball. Use the actual sources for legal-info.
-# For most packages the FOO_SITE/FOO_SOURCE pair points to real source code,
-# so these are the defaults for FOO_ACTUAL_*.
-$(2)_ACTUAL_SOURCE_TARBALL ?= $$($(2)_SOURCE)
-$(2)_ACTUAL_SOURCE_SITE    ?= $$(call qstrip,$$($(2)_SITE))
-
 # legal-info: produce legally relevant info.
 $(1)-legal-info:
 ifneq ($$($(2)_REDISTRIBUTE),IGNORE)
@@ -820,9 +827,6 @@ else
 # Other packages
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
-ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
-	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
-endif
 # Copy the source tarball
 	$$(Q)$$(call hardlink-copy,\
 		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
@@ -931,6 +935,7 @@ endif
 	$(1)-show-depends \
 	$(1)-show-version \
 	$(1)-source \
+	$(1)-legal-source \
 	$(1)-source-check
 
 ifeq ($$(patsubst %/,ERROR,$$($(2)_SITE)),ERROR)
-- 
1.9.1
