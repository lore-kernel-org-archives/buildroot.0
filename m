From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Feb 2017 22:44:33 +0100
Subject: [Buildroot] [PATCH 5/7 v4] support/test-pkg: cannonicalize paths
	early
In-Reply-To: <cover.1487195062.git.yann.morin.1998@free.fr>
References: <cover.1487195062.git.yann.morin.1998@free.fr>
Message-ID: <8d9c7f879f73629ee21b834aa26c6ccb086da3ca.1487195062.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/test-pkg | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 5714afa..d65cfe2 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -57,16 +57,21 @@ main() {
     (/*)    url="file://${url}";;
     esac
 
-    # Extract the URLs of the toolchains; drop internal toolchains
+    # Extract the URLs of the toolchains; drop internal toolchains,
     # E.g.: http://server/path/to/name.config,arch,libc
     #  -->  http://server/path/to/name.config
+    # then change local paths to URI
+    # E.g.: /path/toname.config
+    #  -->  file:///path/toname.config
     toolchains=($(curl -s "${url}" \
                   |sed -r -e 's/,.*//; /internal/d;' \
                   |if [ ${random} -gt 0 ]; then \
                       sort -R |head -n ${random}
                    else
                       cat
-                   fi |sort
+                   fi \
+                  |sort \
+                  |sed -r -e 's,^/,file:///,'
                  )
                )
 
@@ -100,12 +105,6 @@ build_one() {
     local pkg="${4}"
     local toolchain
 
-    # Transform local paths to URI to make curl happy and simplify
-    # our code path
-    case "${url}" in
-    (/*)    url="file://${url}";;
-    esac
-
     # Using basename(1) on a URL works nicely
     toolchain="$(basename "${url}" .config)"
 
-- 
2.7.4
