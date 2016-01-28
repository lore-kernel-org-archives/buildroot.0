From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2016 19:15:04 +0100
Subject: [Buildroot] [PATCH 06/16 v3] core/legal-info: ensure legal-info
	works in off-line mode
In-Reply-To: <cover.1454004518.git.yann.morin.1998@free.fr>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
Message-ID: <bd9e70a4286f01ccd6612f19ee541aad9350ac79.1454004518.git.yann.morin.1998@free.fr>
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

We fix that by adding a new rule, $(1)-legal-source which only
$(1)-all-source depends on, so that we only download it for a top-level
'make source', not as part of the standard download mechanism (i.e. only
what is really needed to build).

This way, we can do a complete [0] off-line build and are still able to
generate legal-info, while at the same time we do not incur any download
overhead during a simple build.

Also, we previously downloaded the _ACTUAL_SOURCE_TARBALL when it was
not empty. However, since _ACTUAL_SOURCE_TARBALL defaults to the value
of _SOURCE, it can not be empty when _SOURCE is not. Thus, we'd get a
spurious report of a missing hash for the tarball, since it was not in
a standard package rule (configure, build, install..) and thus would
miss the PKG and PKGDIR variables to find the .hash file.

We fix that in this commit as well, by:

  - setting PKG and PKGDIR just for the -legal-source rule;

  - only downloading _ACTUAL_SOURCE_TARBALL if it is not empty *and* not
    the same as _SOURCE (to avoid a second report about the hash).

[0] Save for nodejs which invarriably wants to download stuff at build
time. Sigh... :-( Fixing that is work for another time...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>

---
Changes v2 -> v3:
  - re-order the PHONY targets  (Arnout)
  - don't reorder setting _ACTUAL_SOURCE/_SITE, it's done in its own
    patch now  (Arnout)
  - adapt the commit log accordingly  (Arnout)
  - typo

Changes v1 -> v2:
  - drop the 'redistribute == ignore', it does not exist yet
---
 package/pkg-generic.mk | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5958029..f8ff6f1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -634,6 +634,10 @@ $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
 $(1)-source:		$$($(2)_TARGET_SOURCE)
 
+$(1)-all-source:	$(1)-legal-source
+$(1)-legal-info:	$(1)-legal-source
+$(1)-legal-source:	$(1)-source
+
 $(1)-source-check:
 	$$(foreach p,$$($(2)_ALL_DOWNLOADS),$$(call SOURCE_CHECK,$$(p))$$(sep))
 
@@ -771,6 +775,20 @@ endif
 endif
 endif
 
+# Download actual sources if they differ from the extracted sources
+# (e.g. for external toolchains)
+#
+# We need to provide PKG and PKGDIR, because there's no .stamp file for
+# the legal-info step.
+$(1)-legal-source:	PKG=$(2)
+$(1)-legal-source:	PKGDIR=$(pkgdir)
+$(1)-legal-source:
+ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),)
+ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
+	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
+endif # actual sources != sources
+endif # actual sources != ""
+
 # legal-info: produce legally relevant info.
 $(1)-legal-info:
 # Packages without a source are assumed to be part of Buildroot, skip them.
@@ -801,9 +819,6 @@ else
 # Other packages
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
-ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
-	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
-endif
 # Copy the source tarball
 	$$(Q)$$(call hardlink-copy,\
 		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
@@ -898,6 +913,7 @@ endif
 	$(1)-install-staging \
 	$(1)-install-target \
 	$(1)-legal-info \
+	$(1)-legal-source \
 	$(1)-patch \
 	$(1)-rebuild \
 	$(1)-reconfigure \
-- 
1.9.1
