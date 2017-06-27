From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 27 Jun 2017 12:26:46 +0200
Subject: [Buildroot] [PATCH v4 10/11] support/scripts: check-host-rpath now
	handles $ORIGIN as well
In-Reply-To: <1498559207-8050-1-git-send-email-wg@grandegger.com>
References: <1498559207-8050-1-git-send-email-wg@grandegger.com>
Message-ID: <1498559207-8050-11-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"$ORIGIN/../../usr/lib" is also a valid RPATH for binaries in
"$hostdir/usr/bin". After RPATH sanitation, all RPATH
directories start with "$ORIGIN".

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 support/scripts/check-host-rpath | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 6ce547c..020c123 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -58,7 +58,7 @@ check_elf_has_rpath() {
         for dir in ${rpath//:/ }; do
             # Remove duplicate and trailing '/' for proper match
             dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
-            [ "${dir}" = "${hostdir}/usr/lib" ] && return 0
+            [ "${dir}" = "${hostdir}/usr/lib" -o "${dir}" = "\$ORIGIN/../../usr/lib" ] && return 0
         done
     done < <( readelf -d "${file}"                                              \
               |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
-- 
2.7.4
