From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Oct 2020 22:48:42 +0200
Subject: [Buildroot] [git commit] system: support br2-external init systems
Message-ID: <20201014210410.3EFE3815EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0b041d6c14ff89b234a9edba344a997d19c880a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some externals may wish to provide custom init systems for tightly
integrated boot. This has been supported through the BR2_INIT_NONE,
however a downside to the BR2_INIT_NONE is it forces the custom init
system to use either skeleton-custom and roll a custom skeleton for
each target, or skeleton-init-none which isn't a complete skeleton.

Allowing br2-external to define custom BR2_INIT_* means they can now
safely 'select' the BR2_PACKAGE_SKELETON_INIT_*, and re-use any of the
skeletons in Buildroot, or one from a br2-external tree.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/br2-external | 9 +++++++++
 system/Config.in             | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 01804e1220..56dc6f53ca 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -162,6 +162,7 @@ do_kconfig() {
         jpeg
         openssl
         skeleton
+        init
     )
 
     for br2 in "${items[@]}"; do
@@ -233,6 +234,14 @@ do_kconfig() {
         else
             printf '# No skeleton from: %s\n\n' "${br2_desc}"
         fi >>"${outputdir}/.br2-external.in.skeleton"
+
+        if [ -f "${br2_ext}/provides/init.in" ]; then
+            printf 'comment "init from: %s"\n' "${br2_desc}"
+            printf 'source "%s/provides/init.in"\n' "${br2_ext}"
+            printf '\n'
+        else
+            printf '# No init from: %s\n\n' "${br2_desc}"
+        fi >>"${outputdir}/.br2-external.in.init"
     done
 
     printf 'endmenu\n' >>"${outputdir}/.br2-external.in.menus"
diff --git a/system/Config.in b/system/Config.in
index a7a05c9af2..b3abeddd68 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -149,6 +149,9 @@ config BR2_INIT_NONE
 	  have to provide your own, either with a new package
 	  or with a rootfs-overlay.
 
+# Init systems from br2-external trees, if any
+source "$BR2_BASE_DIR/.br2-external.in.init"
+
 endchoice
 
 choice
