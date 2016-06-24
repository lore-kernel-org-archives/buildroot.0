From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 17:09:32 +0200
Subject: [Buildroot] [git commit] core/pkg-generic: reorder variables
	definitions for legal-info
Message-ID: <20160624151035.D228281819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2474868057e1c01de6ceff3c8d8b74b7317317b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the declarations of _ACTUAL_SOURCE and _ACTUAL_SITE earlier, so
that they are close to where _SOURCE and _SITE are handled.

This looks so far like a purely cosmetic change, but makes more sense
with the follow-up patch, where we'll need them earlier in the file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8674770..272d35f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -428,6 +428,14 @@ ifndef $(2)_SOURCE
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
@@ -763,14 +771,6 @@ $(1)-legal-info: $(1)-source $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
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
 # Packages without a source are assumed to be part of Buildroot, skip them.
