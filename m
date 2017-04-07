From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 7 Apr 2017 13:16:24 +0200
Subject: [Buildroot] [PATCH v6 9/9] support/test-pkg: use merge_config.sh to
	merge the fragments
In-Reply-To: <20170407111624.4629-1-arnout@mind.be>
References: <20170407111624.4629-1-arnout@mind.be>
Message-ID: <20170407111624.4629-10-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is supposedly more robust than just concatenating.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
v6: Rebased
v5: First version
---
 support/scripts/test-pkg | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 2ac7aefac7..9ce01a3125 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -98,13 +98,11 @@ build_one() {
     local pkg="${4}"
 
     mkdir -p "${dir}"
-    
-    cat "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" >>"${dir}/.config"
 
+    support/kconfig/merge_config.sh -O "${dir}" \
+        "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" \
+        > /dev/null
 
-    if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then
-        return 2
-    fi
     # We want all the options from the snippet to be present as-is (set
     # or not set) in the actual .config; if one of them is not, it means
     # some dependency from the toolchain or arch is not available, in
-- 
2.11.0
