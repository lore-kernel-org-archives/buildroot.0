From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Tue, 13 Oct 2020 17:36:01 -0500
Subject: [Buildroot] [PATCH v2 1/5] system: support br2-external skeleton
 packages
In-Reply-To: <20201013194149.171518-1-brandon.maier@rockwellcollins.com>
References: <20201013194149.171518-1-brandon.maier@rockwellcollins.com>
Message-ID: <20201013223605.188920-1-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Today, the BR2_ROOTFS_SKELETON_CUSTOM is the only way to build a custom
skeleton. But it's limiting as users must provide a pre-built skeleton
for each target. Supporting a br2-external package allows users to build
up a skeleton and customize it with their own KConfig options.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 support/scripts/br2-external | 9 +++++++++
 system/Config.in             | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index ededd2d900..01804e1220 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -161,6 +161,7 @@ do_kconfig() {
         toolchains
         jpeg
         openssl
+        skeleton
     )
 
     for br2 in "${items[@]}"; do
@@ -224,6 +225,14 @@ do_kconfig() {
         else
             printf '# No openssl from: %s\n\n' "${br2_desc}"
         fi >>"${outputdir}/.br2-external.in.openssl"
+
+        if [ -f "${br2_ext}/provides/skeleton.in" ]; then
+            printf 'comment "skeleton from: %s"\n' "${br2_desc}"
+            printf 'source "%s/provides/skeleton.in"\n' "${br2_ext}"
+            printf '\n'
+        else
+            printf '# No skeleton from: %s\n\n' "${br2_desc}"
+        fi >>"${outputdir}/.br2-external.in.skeleton"
     done
 
     printf 'endmenu\n' >>"${outputdir}/.br2-external.in.menus"
diff --git a/system/Config.in b/system/Config.in
index b8b7c16529..a363e099e5 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -23,6 +23,9 @@ config BR2_ROOTFS_SKELETON_CUSTOM
 	help
 	  Use custom target skeleton.
 
+# skeleton from br2-external trees, if any
+source "$BR2_BASE_DIR/.br2-external.in.skeleton"
+
 endchoice
 
 if BR2_ROOTFS_SKELETON_CUSTOM
-- 
2.28.0
