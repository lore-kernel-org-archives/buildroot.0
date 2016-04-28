From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Apr 2016 00:27:21 +0200
Subject: [Buildroot] [PATCH 03/13 v6] core/pkg-generic: reorder variables
	definitions for legal-info
In-Reply-To: <cover.1461881416.git.yann.morin.1998@free.fr>
References: <cover.1461881416.git.yann.morin.1998@free.fr>
Message-ID: <91c9d245f46eddf663259865e81210e14665c2ff.1461881416.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the declarations of _ACTUAL_SOURCE and _ACTUAL_SITE earlier, so
that they are close to where _SOURCE and _SITE are handled.

This looks so far like a purely cosmetic change, but makes more sense
with the follow-up patch, where we'll need them earlier in the file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v2 -> v3:
  - move that to its own patch  (Arnout)
---
 package/pkg-generic.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5c2e46d..cbdf96e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -427,6 +427,14 @@ ifndef $(2)_SOURCE
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
@@ -762,14 +770,6 @@ $(1)-legal-info: $(1)-source $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
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
-- 
1.9.1
