From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Nov 2018 11:55:53 +0100
Subject: [Buildroot] [PATCH next v4 2/6] support/scripts/check-host-rpath:
 split condition on two statements
In-Reply-To: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181114105557.12599-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Inside the check_elf_has_rpath(), we check if the host binary has a
correct RPATH, which should be either an absolute path to
$(HOST_DIR)/lib, or a relative path using $ORIGIN. Those two
conditions are checked in a single statements, but as we are going to
add a third condition, let's split this up a bit:

 - If we have a RPATH to $(HOST_DIR)/lib -> we're good, return 0
 - If we have a RPATH to $ORIGIN/../lib -> we're good, return 0
 - Otherwise, we will exit the loop, and return 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.19.1
