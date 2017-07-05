From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:54:12 +0200
Subject: [Buildroot] [git commit] check-host-rpath: no longer allow
	$(HOST_DIR)/usr
Message-ID: <20170705145153.15A387FF07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d11d6314cd5ab793b5f2db784d11614f2d2d604
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now all packages have been updated to install things in $(HOST_DIR)/lib
instead of $(HOST_DIR)/usr/lib, there should no longer be any reason
to have $(HOST_DIR)/usr/lib in the RPATH, so we don't allow it any more.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Wolfgang Grandegger <wg@grandegger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/check-host-rpath | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 2846d5e..74a25ba 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -1,7 +1,7 @@
 #!/usr/bin/env bash
 
 # This script scans $(HOST_DIR)/{bin,sbin} for all ELF files, and checks
-# they have an RPATH to $(HOST_DIR)/{,usr/}lib if they need libraries from
+# they have an RPATH to $(HOST_DIR)/lib if they need libraries from
 # there.
 
 # Override the user's locale so we are sure we can parse the output of
@@ -59,8 +59,6 @@ check_elf_has_rpath() {
             # Remove duplicate and trailing '/' for proper match
             dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
             [ "${dir}" = "${hostdir}/lib" -o "${dir}" = "\$ORIGIN/../lib" ] && return 0
-            # For the time being, the rpath is allowed with both usr/lib and lib
-            [ "${dir}" = "${hostdir}/usr/lib" -o "${dir}" = "\$ORIGIN/../../usr/lib" ] && return 0
         done
     done < <( readelf -d "${file}"                                              \
               |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
