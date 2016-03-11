From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:49:18 +0100
Subject: [Buildroot] [PATCH 05/16 v5] core/legal-info: ensure legal-info
	works in off-line mode
In-Reply-To: <cover.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <443f6e993a976155675520920d86e979a5fc8880.1457718289.git.yann.morin.1998@free.fr>
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

This new rule depends, like the normal download mechanism, on a stamp
file, so that we do not emit a spurious hash-check message on successive
runs of 'make source'.

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
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v3 -> v4:
  - handle it with a stamp file  (Luca)

Changes v2 -> v3:
  - re-order the PHONY targets  (Arnout)
  - don't reorder setting _ACTUAL_SOURCE/_SITE, it's done in its own
    patch now  (Arnout)
  - adapt the commit log accordingly  (Arnout)
  - typo

Changes v1 -> v2:
  - drop the 'redistribute == ignore', it does not exist yet
---
 package/pkg-generic.mk | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8e70eae..ce5525c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -123,6 +123,12 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 	$(Q)mkdir -p $(@D)
 	$(Q)touch $@
 
+# Retrieve actual source archive, e.g. for prebuilt external toolchains
+$(BUILD_DIR)/%/.stamp_actual_downloaded:
+	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL)); \
+	$(Q)mkdir -p $(@D)
+	$(Q)touch $@
+
 # Unpack the archive
 $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call step_start,extract)
@@ -527,6 +533,7 @@ $(2)_TARGET_RSYNC =	        $$($(2)_DIR)/.stamp_rsynced
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
+$(2)_TARGET_ACTUAL_SOURCE =	$$($(2)_DIR)/.stamp_actual_downloaded
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
 # default extract command
@@ -634,6 +641,17 @@ $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
 $(1)-source:		$$($(2)_TARGET_SOURCE)
 
+$(1)-all-source:	$(1)-legal-source
+$(1)-legal-info:	$(1)-legal-source
+$(1)-legal-source:	$(1)-source
+
+# Only download the actual source if it differs from the 'main' archive
+ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),)
+ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
+$(1)-legal-source:	$$($(2)_TARGET_ACTUAL_SOURCE)
+endif # actual sources != sources
+endif # actual sources != ""
+
 $(1)-source-check:
 	$$(foreach p,$$($(2)_ALL_DOWNLOADS),$$(call SOURCE_CHECK,$$(p))$$(sep))
 
@@ -659,6 +677,7 @@ $(1)-extract:		$(1)-rsync
 $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 
 $(1)-source:
+$(1)-legal-source:
 
 $(1)-source-check:
 	test -d $$($(2)_OVERRIDE_SRCDIR)
@@ -733,6 +752,8 @@ $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
+$$($(2)_TARGET_ACTUAL_SOURCE):		PKG=$(2)
+$$($(2)_TARGET_ACTUAL_SOURCE):		PKGDIR=$(pkgdir)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 
 # Compute the name of the Kconfig option that correspond to the
@@ -800,9 +821,6 @@ else
 # Other packages
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
-ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
-	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
-endif
 # Save the source tarball
 	$$(Q)$$(call hardlink-copy,\
 		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
@@ -897,6 +915,7 @@ endif
 	$(1)-install-staging \
 	$(1)-install-target \
 	$(1)-legal-info \
+	$(1)-legal-source \
 	$(1)-patch \
 	$(1)-rebuild \
 	$(1)-reconfigure \
-- 
1.9.1
