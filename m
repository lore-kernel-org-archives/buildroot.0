From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:05:30 +0200
Subject: [Buildroot] [PATCH v7 23/23] test-pkg: use merge_config.sh to merge
	the fragments
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170721010530.4747-24-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is supposedly more robust than just concatenating.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
v7: Rebased
v6: Rebased
v5: First version
---
 utils/test-pkg | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 7eb9c535c3..6899d44f7c 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -98,11 +98,9 @@ build_one() {
 
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
-- 
2.13.2
