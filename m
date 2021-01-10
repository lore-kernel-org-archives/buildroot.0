From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 19:42:04 +0100
Subject: [Buildroot] [git commit] core/pkg-infra: prepare for alternate
 default source archives
Message-ID: <20210110205118.BCDC68120A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38a9fdd02f57871835572ffebf8f47e38fc28002
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The .tar.gz default extension is historical, and we initially used
to only fetch tarballs from remote sites.

When we introduced downloads from VCS repositories, we kept that
extension, and kept compressing with gz, by lack of good reason to
switch to some other compression scheme.

However, nowadays, we will want to change the way we construct the
tarballs we generate from VCS. This will de facto change the hashes
of those tarballs.

So we will want that the archives we generate do not clash with the
existing ones, so we need another filename. Thus, we need a way to
be able to use a different extension when we generate archives from
VCS.

Use a macro as suggested by Arnout.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/pkg-generic.mk | 2 +-
 package/pkg-utils.mk   | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 621fb91424..c46c742352 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -518,7 +518,7 @@ ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
  else ifdef $(2)_VERSION
-  $(2)_SOURCE			?= $$($(2)_BASENAME_RAW).tar.gz
+  $(2)_SOURCE			?= $$($(2)_BASENAME_RAW)$$(call pkg_source_ext,$(2))
  endif
 endif
 
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index a2cc160d0b..c7597a3a45 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -40,6 +40,11 @@ KCONFIG_DISABLE_OPT = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(SHARP_SIGN) $(1)
 pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
 pkgname = $(lastword $(subst /, ,$(pkgdir)))
 
+# Helper to build the extension for a package archive, based on various
+# conditions.
+# $(1): upper-case package name
+pkg_source_ext = .tar.gz
+
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
 INFLATE.gz   = $(ZCAT)
