From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 21:24:07 +0200
Subject: [Buildroot] [PATCH 11/12] core: allow br2-external trees to provide
 opensl
In-Reply-To: <cover.1555960978.git.yann.morin.1998@free.fr>
References: <cover.1555960978.git.yann.morin.1998@free.fr>
Message-ID: <a82a080a6837b57c875b74036fcda08bfcfd0998.1555960978.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similarly to toolchains and jpeg, we now offer a way for br2-external
trees to provide their openssl implementation, which gets included in
the openssl choice.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openssl/Config.in    |  3 +++
 support/scripts/br2-external | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index d84033141f..43468be43c 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -68,6 +68,9 @@ config BR2_PACKAGE_LIBRESSL_BIN
 
 endif
 
+# openssl from br2-external trees, if any
+source "$BR2_BASE_DIR/.br2-external.openssl.in"
+
 endchoice
 
 config BR2_PACKAGE_HAS_OPENSSL
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 573e706502..a9ee602da5 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -153,7 +153,7 @@ do_kconfig() {
     local outputdir="${1}"
     local br2_name br2_ext br2
 
-    for br2 in paths menus toolchains jpeg; do
+    for br2 in paths menus toolchains jpeg openssl; do
         {
             printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
             printf '\n'
@@ -206,6 +206,14 @@ do_kconfig() {
         else
             printf '# No jpeg from %s\n\n' "${br2_desc}"
         fi >>"${outputdir}/.br2-external.jpeg.in"
+
+        if [ -f "${br2_ext}/provides/openssl.in" ]; then
+            printf 'comment "openssl from: %s"\n' "${br2_desc}"
+            printf 'source "%s/provides/openssl.in"\n' "${br2_ext}"
+            printf '\n'
+        else
+            printf '# No openssl from %s\n\n' "${br2_desc}"
+        fi >>"${outputdir}/.br2-external.openssl.in"
     done
 
     printf 'endmenu\n' >>"${outputdir}/.br2-external.menus.in"
-- 
2.14.1
