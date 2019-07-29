From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jul 2019 22:20:01 +0200
Subject: [Buildroot] [PATCH 11/13 v2] core: allow br2-external trees to
 provide libjpeg
In-Reply-To: <cover.1564431589.git.yann.morin.1998@free.fr>
References: <cover.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <aaf91818a2ee035e4881a2a3f04a542fbde3d425.1564431589.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to toolchains, we now offer a way for br2-external trees to
provide their libjpeg implementation, which gets included in the jpeg
choice.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
---
 package/jpeg/Config.in       | 3 +++
 support/scripts/br2-external | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index a4a63cc7dc..3d0fea83b1 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -38,6 +38,9 @@ config BR2_PACKAGE_JPEG_TURBO
 
 	  http://www.libjpeg-turbo.org
 
+# libjpeg from br2-external trees, if any
+source "$BR2_BASE_DIR/.br2-external.in.jpeg"
+
 endchoice
 
 config BR2_PACKAGE_HAS_JPEG
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index b08b77bd33..82c8afd64c 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -158,6 +158,7 @@ do_kconfig() {
         paths
         menus
         toolchains
+        jpeg
     )
 
     for br2 in "${items[@]}"; do
@@ -205,6 +206,14 @@ do_kconfig() {
         else
             printf '# No toolchain from: %s\n\n' "${br2_desc}"
         fi >>"${outputdir}/.br2-external.in.toolchains"
+
+        if [ -f "${br2_ext}/provides/jpeg.in" ]; then
+            printf 'comment "jpeg from: %s"\n' "${br2_desc}"
+            printf 'source "%s/provides/jpeg.in"\n' "${br2_ext}"
+            printf '\n'
+        else
+            printf '# No jpeg from: %s\n\n' "${br2_desc}"
+        fi >>"${outputdir}/.br2-external.in.jpeg"
     done
 
     printf 'endmenu\n' >>"${outputdir}/.br2-external.in.menus"
-- 
2.20.1
