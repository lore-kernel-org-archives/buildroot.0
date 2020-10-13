From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Tue, 13 Oct 2020 14:41:49 -0500
Subject: [Buildroot] [PATCH 2/2] system: support br2-external init systems
In-Reply-To: <20201013194149.171518-1-brandon.maier@rockwellcollins.com>
References: <20201013194149.171518-1-brandon.maier@rockwellcollins.com>
Message-ID: <20201013194149.171518-2-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some externals may wish to provide custom init systems for tightly
integrated boot. This has been supported through the BR2_INIT_NONE,
however a downside to the BR2_INIT_NONE is it forces the custom init
system to use either skeleton-custom and roll a custom skeleton for
each target, or skeleton-init-none which isn't a complete skeleton.

Allowing br2-external to define custom BR2_INIT_* means they can now
safely 'select' the BR2_PACKAGE_SKELETON_INIT_* and use a sysv style
skeleton if they want.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 support/scripts/br2-external | 17 +++++++++++++++++
 system/Config.in             |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index ededd2d900..f6ad722f72 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -161,6 +161,7 @@ do_kconfig() {
         toolchains
         jpeg
         openssl
+        init
     )
 
     for br2 in "${items[@]}"; do
@@ -224,7 +225,23 @@ do_kconfig() {
         else
             printf '# No openssl from: %s\n\n' "${br2_desc}"
         fi >>"${outputdir}/.br2-external.in.openssl"
+
+        if [ -f "${br2_ext}/provides/init.in" ]; then
+            printf 'comment "init from: %s"\n' "${br2_desc}"
+            printf 'source "%s/provides/init.in"\n' "${br2_ext}"
+            printf '\n'
+        else
+            printf '# No init from: %s\n\n' "${br2_desc}"
+        fi >>"${outputdir}/.br2-external.in.init"
     done
+        if [ -f "${br2_ext}/provides/toolchains.in" ]; then
+            printf 'comment "Toolchains from: %s"\n' "${br2_desc}"
+            printf 'source "%s/provides/toolchains.in"\n' "${br2_ext}"
+            printf '\n'
+        else
+            printf '# No toolchain from: %s\n\n' "${br2_desc}"
+        fi >>"${outputdir}/.br2-external.in.toolchains"
+
 
     printf 'endmenu\n' >>"${outputdir}/.br2-external.in.menus"
 }
diff --git a/system/Config.in b/system/Config.in
index ec61fac781..ff7a470561 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -144,6 +144,9 @@ config BR2_INIT_NONE
 	  have to provide your own, either with a new package
 	  or with a rootfs-overlay.
 
+# Init systems from br2-external trees, if any
+source "$BR2_BASE_DIR/.br2-external.in.init"
+
 endchoice
 
 choice
-- 
2.28.0
