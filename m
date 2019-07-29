From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jul 2019 22:20:02 +0200
Subject: [Buildroot] [PATCH 12/13 v2] core: allow br2-external trees to
 provide opensl
In-Reply-To: <cover.1564431589.git.yann.morin.1998@free.fr>
References: <cover.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <17776fab64a42131b80ee61de4996741a2bc7aa1.1564431589.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to toolchains and jpeg, we now offer a way for br2-external
trees to provide their openssl implementation, which gets included in
the openssl choice.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
---
 package/openssl/Config.in    | 3 +++
 support/scripts/br2-external | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index d84033141f..a64660bea3 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -68,6 +68,9 @@ config BR2_PACKAGE_LIBRESSL_BIN
 
 endif
 
+# openssl from br2-external trees, if any
+source "$BR2_BASE_DIR/.br2-external.in.openssl"
+
 endchoice
 
 config BR2_PACKAGE_HAS_OPENSSL
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 82c8afd64c..171526f8c8 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -159,6 +159,7 @@ do_kconfig() {
         menus
         toolchains
         jpeg
+        openssl
     )
 
     for br2 in "${items[@]}"; do
@@ -214,6 +215,14 @@ do_kconfig() {
         else
             printf '# No jpeg from: %s\n\n' "${br2_desc}"
         fi >>"${outputdir}/.br2-external.in.jpeg"
+
+        if [ -f "${br2_ext}/provides/openssl.in" ]; then
+            printf 'comment "openssl from: %s"\n' "${br2_desc}"
+            printf 'source "%s/provides/openssl.in"\n' "${br2_ext}"
+            printf '\n'
+        else
+            printf '# No openssl from: %s\n\n' "${br2_desc}"
+        fi >>"${outputdir}/.br2-external.in.openssl"
     done
 
     printf 'endmenu\n' >>"${outputdir}/.br2-external.in.menus"
-- 
2.20.1
