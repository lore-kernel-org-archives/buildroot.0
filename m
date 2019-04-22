From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 21:24:06 +0200
Subject: [Buildroot] [PATCH 10/12] core: allow br2-external trees to provide
 libjpeg
In-Reply-To: <cover.1555960978.git.yann.morin.1998@free.fr>
References: <cover.1555960978.git.yann.morin.1998@free.fr>
Message-ID: <053a154d3e22031271460a8e5e588893c36e7dd8.1555960978.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similarly to toolchains, we now offer a way for br2-external trees to
provide their libjpeg implementation, which gets included in the jpeg
choice.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jpeg/Config.in       |  3 +++
 support/scripts/br2-external | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index a4a63cc7dc..6940d4dfe1 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -38,6 +38,9 @@ config BR2_PACKAGE_JPEG_TURBO
 
 	  http://www.libjpeg-turbo.org
 
+# libjpeg from br2-external trees, if any
+source "$BR2_BASE_DIR/.br2-external.jpeg.in"
+
 endchoice
 
 config BR2_PACKAGE_HAS_JPEG
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 9f4f261c3d..573e706502 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -153,7 +153,7 @@ do_kconfig() {
     local outputdir="${1}"
     local br2_name br2_ext br2
 
-    for br2 in paths menus toolchains; do
+    for br2 in paths menus toolchains jpeg; do
         {
             printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
             printf '\n'
@@ -198,6 +198,14 @@ do_kconfig() {
         else
             printf '# No toolchain from %s\n\n' "${br2_desc}"
         fi >>"${outputdir}/.br2-external.toolchains.in"
+
+        if [ -f "${br2_ext}/provides/jpeg.in" ]; then
+            printf 'comment "jpeg from: %s"\n' "${br2_desc}"
+            printf 'source "%s/provides/jpeg.in"\n' "${br2_ext}"
+            printf '\n'
+        else
+            printf '# No jpeg from %s\n\n' "${br2_desc}"
+        fi >>"${outputdir}/.br2-external.jpeg.in"
     done
 
     printf 'endmenu\n' >>"${outputdir}/.br2-external.menus.in"
-- 
2.14.1
