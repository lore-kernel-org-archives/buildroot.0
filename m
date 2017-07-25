From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 23:07:03 +0200
Subject: [Buildroot] [git commit] test-pkg: use merge_config.sh to merge the
	fragments
Message-ID: <20170725210435.E4B597FCC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de46cc9be0873fbd60b19552c5687ad142aa0c99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is supposedly more robust than just concatenating.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/test-pkg | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 8c60649..f951eda 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -94,11 +94,9 @@ build_one() {
 
     mkdir -p "${dir}"
 
-    cat "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" >>"${dir}/.config"
-
-    if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then
-        return 2
-    fi
+    support/kconfig/merge_config.sh -O "${dir}" \
+        "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" \
+        > /dev/null
     # We want all the options from the snippet to be present as-is (set
     # or not set) in the actual .config; if one of them is not, it means
     # some dependency from the toolchain or arch is not available, in
