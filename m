From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:08:57 +0100
Subject: [Buildroot] [git commit] support/scripts/check-host-rpath: split
 condition on two statements
Message-ID: <20181202071559.634D8815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eeb6341410b5168f97d4ed747c9537244477ec42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Inside the check_elf_has_rpath(), we check if the host binary has a
correct RPATH, which should be either an absolute path to
$(HOST_DIR)/lib, or a relative path using $ORIGIN. Those two
conditions are checked in a single statements, but as we are going to
add a third condition, let's split this up a bit:

 - If we have a RPATH to $(HOST_DIR)/lib -> we're good, return 0
 - If we have a RPATH to $ORIGIN/../lib -> we're good, return 0
 - Otherwise, we will exit the loop, and return 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/check-host-rpath | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 169628decb..6c5767da05 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -63,7 +63,8 @@ check_elf_has_rpath() {
         for dir in ${rpath//:/ }; do
             # Remove duplicate and trailing '/' for proper match
             dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
-            [ "${dir}" = "${hostdir}/lib" -o "${dir}" = "\$ORIGIN/../lib" ] && return 0
+            [ "${dir}" = "${hostdir}/lib" ] && return 0
+            [ "${dir}" = "\$ORIGIN/../lib" ] && return 0
         done
     done < <( readelf -d "${file}"                                              \
               |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
