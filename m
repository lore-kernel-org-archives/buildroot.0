From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 14:09:49 +0200
Subject: [Buildroot] [PATCH 2/3] check-host-rpath: no longer allow
	$(HOST_DIR)/usr
In-Reply-To: <20170705120950.23189-1-arnout@mind.be>
References: <20170705120950.23189-1-arnout@mind.be>
Message-ID: <20170705120950.23189-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now all packages have been updated to install things in $(HOST_DIR)/lib
instead of $(HOST_DIR)/usr/lib, there should no longer be any reason
to have $(HOST_DIR)/usr/lib in the RPATH, so we don't allow it any more.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Wolfgang Grandegger <wg@grandegger.com>
---
 support/scripts/check-host-rpath | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 2846d5eb51..74a25ba99c 100755
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
-- 
2.13.2
