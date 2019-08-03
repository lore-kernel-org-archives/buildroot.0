From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 00:13:37 +0200
Subject: [Buildroot] [git commit] core: allow br2-external trees to provide
 pre-configured toolchains
Message-ID: <20190803221404.EF7DD8E02E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa037acee09f8c74be2f4eb047a1ac1ea7f677f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we have a choice for the pre-configured pre-built toolchains,
there is no possbility for a br2-external to provide its own. The
only solution so far for defconfigs in br2-external trees is to use
BR2_TOOLCHAIN_EXTERNAL_CUSTOM and define all the bits by itself...

This is not so convemient, so offer a way for br2-external trees to
provide such pre-configured toolchains.

To allow for this, we now scan each br2-external tree and look for a
specific file, provides.toolchains.in. We generate a kconfig file that
sources each such file, and that generated file is sourced from within
the toolchain choice, thus making the toolchains from a br2-external
tree possible and available in the same location as the ones known to
Buildroot:

    Toolchain  --->
        Toolchain type (External toolchain)  --->
        Toolchain  --->
            (X) Arm ARM 2019.03
            ( ) Linaro ARM 2018.05
            ( ) Custom toolchain
                *** Toolchains from my-br2-ext-tree: ***
            ( ) My custom ARM toolchain
                *** Toolchains from another-br2-ext-tree: ***
            ( ) Another custom ARM toolchain
            ( ) A third custom ARM toolchain

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/br2-external           | 9 +++++++++
 toolchain/toolchain-external/Config.in | 5 ++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index da315d5c1d..b08b77bd33 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -157,6 +157,7 @@ do_kconfig() {
     items=(
         paths
         menus
+        toolchains
     )
 
     for br2 in "${items[@]}"; do
@@ -196,6 +197,14 @@ do_kconfig() {
             fi
             printf '\n'
         } >>"${outputdir}/.br2-external.in.menus"
+
+        if [ -f "${br2_ext}/provides/toolchains.in" ]; then
+            printf 'comment "Toolchains from: %s"\n' "${br2_desc}"
+            printf 'source "%s/provides/toolchains.in"\n' "${br2_ext}"
+            printf '\n'
+        else
+            printf '# No toolchain from: %s\n\n' "${br2_desc}"
+        fi >>"${outputdir}/.br2-external.in.toolchains"
     done
 
     printf 'endmenu\n' >>"${outputdir}/.br2-external.in.menus"
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d234c1c552..128bea257e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -47,9 +47,12 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Confi
 
 # Kept last, so it remains the non-default choice, unless there isn't
 # any available toolchain profile for the currently selected
-# architecture.
+# architecture, but before toolchains from br2-external trees.
 source "toolchain/toolchain-external/toolchain-external-custom/Config.in"
 
+# Toolchains from br2-external trees, if any
+source "$BR2_BASE_DIR/.br2-external.in.toolchains"
+
 endchoice
 
 choice
