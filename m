From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 6 Apr 2017 20:18:52 +0200
Subject: [Buildroot] [PATCH v5 12/13] support/test-pkg: use merge_config.sh
	to merge the fragments
In-Reply-To: <cover.1491502445.git.arnout@mind.be>
References: <cover.1491502445.git.arnout@mind.be>
Message-ID: <20170406181854.5242-12-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is supposedly more robust than just concatenating.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/test-pkg | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index d7f5cbe8cf..383e018c63 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -98,11 +98,9 @@ build_one() {
     local cfg="${3}"
     local pkg="${4}"
 
-    cat "${toolchainconfig}" "support/misc/minimal.config" "${cfg}" >>"${dir}/.config"
+    support/kconfig/merge_config.sh -O "${dir}" \
+        "${toolchainconfig}" "support/misc/minimal.config" "${cfg}" > /dev/null
 
-    if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then
-        return 2
-    fi
     # We want all the options from the snippet to be present as-is (set
     # or not set) in the actual .config; if one of them is not, it means
     # some dependency from the toolchain or arch is not available, in
-- 
2.11.0
