From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:45:58 +0200
Subject: [Buildroot] [git commit] check-host-rpath: no longer check
	$(HOST_DIR)/usr/{bin, sbin}
Message-ID: <20170705095035.D1EBD7FA7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2295780a950cbcd8eb76b01ceb15503b0f973f55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since $(HOST_DIR)/usr/{bin,sbin} are now symlinks to
$(HOST_DIR)/{bin,sbin}, it makes no sense to check them - they are
already covered.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/check-host-rpath | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index adabfdf..2846d5e 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -1,6 +1,6 @@
 #!/usr/bin/env bash
 
-# This script scans $(HOST_DIR)/{,usr/}{bin,sbin} for all ELF files, and checks
+# This script scans $(HOST_DIR)/{bin,sbin} for all ELF files, and checks
 # they have an RPATH to $(HOST_DIR)/{,usr/}lib if they need libraries from
 # there.
 
@@ -26,7 +26,7 @@ main() {
             printf "*** ERROR: package %s installs executables without proper RPATH:\n" "${pkg}"
         fi
         printf "***   %s\n" "${file}"
-    done < <( find "${hostdir}"/{,usr/}{bin,sbin} -type f -exec file {} + 2>/dev/null \
+    done < <( find "${hostdir}"/{bin,sbin} -type f -exec file {} + 2>/dev/null \
               |sed -r -e '/^([^:]+):.*\<ELF\>.*\<executable\>.*/!d'                \
                       -e 's//\1/'                                                  \
             )
