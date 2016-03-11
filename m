From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:49:24 +0100
Subject: [Buildroot] [PATCH 11/16 v5] core/legal-info: renumber saved patches
In-Reply-To: <cover.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <239b97de0688ee582fee97a67f9534cd8ad29493.1457718289.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches we save can come from various locations;
  - bundled with Buildroot
  - downloaded
  - from one or more global-patch-dir

It is possible that two patches lying into different locations have the
same basename, like so (first is bundled, second is from an hypothetical
global-patch-dir):
    package/foo/0001-fix-Makefile.patch
    /path/to/my/patches/foo/0001-fix-Makefile.patch

In that case, we'd save only the second patch, overwriting the first.

We fix that by forcibly prefixing saved patches with a new numbering, to
guarantee the unicity of saved files.

The unfortunate side-effects are that:
  - most saved patches will be twice-numbered,
  - the series file is now redundant.

While the former is mostly not nice-looking, we shouldn't try to strip
any leading numbering, as that might not be a numbering (e.g.
42-retries.patch which is a patch add 42 retries).

The latter is not really problematic. A lot of tools (and people) can
work with, and prefer to have a series file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Note that I've made this a separate change, not because the patch would
be too complex if squahed with the previous, but rather to have a more
detailed commit log about the reason for the renumbering; squashing the
two changes together would make for a really long commit log, at the
risk of being more difficult to follow.

Note: an alternative solution was suggested by Luca (and Arnout?), which
would be to check that no two patches have the same basename or bail-out
otherwise. I choose to keep the renumbering, because it follows the path
of least resistance (i.e. it does not break existing setups).
---
 package/pkg-generic.mk | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3a6f62b..ed139fb 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -827,9 +827,16 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
 		     $$($(2)_REDIST_SOURCES_DIR))
 # Save patches and generate the series file
-	$$(Q)while read f; do \
-		$$(call hardlink-copy,$$$${f},$$($(2)_REDIST_SOURCES_DIR)) || exit 1; \
-		printf "%s\n" "$$$${f##*/}" >>$$($(2)_REDIST_SOURCES_DIR)/series || exit 1; \
+# Because patches may come from various places (bundled in Buildroot,
+# from one or more global-patch-dir), there might be collisions on the
+# basenames of those files.
+# We add a new numbering to each patch to ensure unicity of the filenames.
+	$$(Q)patch_num=1; while read f; do \
+		prefix_num=$$$$(printf "%04d" $$$${patch_num}); \
+		$$(call hardlink-copy,$$$${f},$$($(2)_REDIST_SOURCES_DIR),\
+			$$$${prefix_num}-$$$${f##*/}) || exit 1; \
+		printf "%s\n" "$$$${prefix_num}-$$$${f##*/}" >>$$($(2)_REDIST_SOURCES_DIR)/series || exit 1; \
+		: $$$$((patch_num++)); \
 	done <$$($(2)_DIR)/.applied_patches_list
 endif # redistribute
 
-- 
1.9.1
