From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri,  3 Mar 2017 15:18:53 +0100
Subject: [Buildroot] [RFC PATCH 9/9] support/scripts: check-host-rpath now
	uses patchelf to get the rpath
In-Reply-To: <1488550733-3956-1-git-send-email-wg@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
Message-ID: <1488550733-3956-10-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"patchelf --print-rpath" returns the rpath without using regex's.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 support/scripts/check-host-rpath | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 020c123..2847f40 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -5,7 +5,7 @@
 # there.
 
 # Override the user's locale so we are sure we can parse the output of
-# readelf(1) and file(1)
+# file(1)
 export LC_ALL=C
 
 main() {
@@ -41,10 +41,7 @@ elf_needs_rpath() {
 
     while read lib; do
         [ -e "${hostdir}/usr/lib/${lib}" ] && return 0
-    done < <( readelf -d "${file}"                                         \
-              |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
-                     -e 's//\1/;'                                          \
-            )
+    done < <( patchelf --print-needed "${file}" )
 
     return 1
 }
@@ -60,10 +57,7 @@ check_elf_has_rpath() {
             dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
             [ "${dir}" = "${hostdir}/usr/lib" -o "${dir}" = "\$ORIGIN/../../usr/lib" ] && return 0
         done
-    done < <( readelf -d "${file}"                                              \
-              |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
-                      -e 's//\3/;'                                              \
-            )
+    done < <( patchelf --print-rpath "${file}" )
 
     return 1
 }
-- 
1.9.1
