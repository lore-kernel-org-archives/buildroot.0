From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 15:49:25 +0200
Subject: [Buildroot] [git commit] support/scripts: check-host-rpath now
	handles $ORIGIN as well
Message-ID: <20170702134624.61797807BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=824f3d9bebee5008ed4f21ab9857778b7d200802
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"$ORIGIN/../../usr/lib" is also a valid RPATH for binaries in
"$hostdir/usr/bin". After RPATH sanitation, all RPATH
directories start with "$ORIGIN".

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
