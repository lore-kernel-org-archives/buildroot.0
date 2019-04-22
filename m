From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 21:24:05 +0200
Subject: [Buildroot] [PATCH 09/12] core: allow br2-external trees to provide
 pre-configured toolchains
In-Reply-To: <cover.1555960978.git.yann.morin.1998@free.fr>
References: <cover.1555960978.git.yann.morin.1998@free.fr>
Message-ID: <12a55c71a864eba5523aeee7f8a7398f720d258a.1555960978.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we have a choice for the pre-configured pre-built toolchains,
there is no p[ossbility for a br2-external to provide its own. The
only solution so far for defconfigs in br2-external trees is to use
BR2_TOOLCHAIN_EXTERNAL_CUSTOM and define all the bits by itself...

This is not so convemient, so offer a way for br2-external trees to
provide such pre-configure toolchains.

To allow for this, we now scan each br2-external tree and look for a
specific file, provides.toiolchains.in. We generate a kconfig file that
sources each such file, and that generated file is sourced from within
the toolchain choice, thus making the toolchains from a br2-external
tree possible and available in the same location as the ones known to
Buildroot.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/br2-external           | 10 +++++++++-
 toolchain/toolchain-external/Config.in |  5 ++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 60ae67c967..9f4f261c3d 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -153,7 +153,7 @@ do_kconfig() {
     local outputdir="${1}"
     local br2_name br2_ext br2
 
-    for br2 in paths menus; do
+    for br2 in paths menus toolchains; do
         {
             printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
             printf '\n'
@@ -190,6 +190,14 @@ do_kconfig() {
             fi
             printf '\n'
         } >>"${outputdir}/.br2-external.menus.in"
+
+        if [ -f "${br2_ext}/provides/toolchains.in" ]; then
+            printf 'comment "Toolchains from: %s"\n' "${br2_desc}"
+            printf 'source "%s/provides/toolchains.in"\n' "${br2_ext}"
+            printf '\n'
+        else
+            printf '# No toolchain from %s\n\n' "${br2_desc}"
+        fi >>"${outputdir}/.br2-external.toolchains.in"
     done
 
     printf 'endmenu\n' >>"${outputdir}/.br2-external.menus.in"
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d234c1c552..1cf4fc850d 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -47,9 +47,12 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Confi
 
 # Kept last, so it remains the non-default choice, unless there isn't
 # any available toolchain profile for the currently selected
-# architecture.
+# architecture, but before toolchains from br2-external trees.
 source "toolchain/toolchain-external/toolchain-external-custom/Config.in"
 
+# Toolchains from br2-external trees, if any
+source "$BR2_BASE_DIR/.br2-external.toolchains.in"
+
 endchoice
 
 choice
-- 
2.14.1
