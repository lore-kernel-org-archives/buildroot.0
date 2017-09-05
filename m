From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Sep 2017 19:55:45 +0200
Subject: [Buildroot] [PATCH] Revert "check-host-rpath: no longer allow
	$(HOST_DIR)/usr"
Message-ID: <20170905175545.3243-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer have any host package that installs files in
$(HOST_DIR)/usr, so we indeed no longer have any package that is
supposed to have an RPATH to $(HOST_DIR)/usr/lib.

However, there exists out-of-tree packages that hard-code that path in
there build-system, and they are now broken.

This reverts commit 1d11d6314cd5ab793b5f2db784d11614f2d2d604.

Reported-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Note: I'm not sure we really want to revert it; this is just to
kickstart the discussion.
---
 support/scripts/check-host-rpath | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 74a25ba99c..2846d5eb51 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -1,7 +1,7 @@
 #!/usr/bin/env bash
 
 # This script scans $(HOST_DIR)/{bin,sbin} for all ELF files, and checks
-# they have an RPATH to $(HOST_DIR)/lib if they need libraries from
+# they have an RPATH to $(HOST_DIR)/{,usr/}lib if they need libraries from
 # there.
 
 # Override the user's locale so we are sure we can parse the output of
@@ -59,6 +59,8 @@ check_elf_has_rpath() {
             # Remove duplicate and trailing '/' for proper match
             dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
             [ "${dir}" = "${hostdir}/lib" -o "${dir}" = "\$ORIGIN/../lib" ] && return 0
+            # For the time being, the rpath is allowed with both usr/lib and lib
+            [ "${dir}" = "${hostdir}/usr/lib" -o "${dir}" = "\$ORIGIN/../../usr/lib" ] && return 0
         done
     done < <( readelf -d "${file}"                                              \
               |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
-- 
2.11.0
