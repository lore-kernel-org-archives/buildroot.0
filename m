From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 12:26:59 +0200
Subject: [Buildroot] [PATCH] utils/test-pkg: log the output of merge-config
Message-ID: <20180708102659.26293-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the stdout is consigned to oblivion, while the stderr is not
redirected at all. So, when the configuration under test redefines a
symbol, like is the case when testing busybox for example, there is an
ugly warning.

So, just redirect both stdout and stderr to the logfile.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 utils/test-pkg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 54951276fa..aa91ee02cf 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -131,7 +131,7 @@ build_one() {
 
     support/kconfig/merge_config.sh -O "${dir}" \
         "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" \
-        > /dev/null
+        >> "${dir}/logfile" 2>&1
     # We want all the options from the snippet to be present as-is (set
     # or not set) in the actual .config; if one of them is not, it means
     # some dependency from the toolchain or arch is not available, in
-- 
2.14.1
