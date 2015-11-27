From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Nov 2015 23:39:12 +0100
Subject: [Buildroot] [PATCH 5/7 v3] autobuild: avoid infinite loop when
	sanitising the configuration
In-Reply-To: <cover.1448663846.git.yann.morin.1998@free.fr>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
Message-ID: <003627a7778af3a996b720e7058cd3a757387fec.1448663846.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are (hard-to-debug) cases where we can't quickly converge to a
valid configuration. In which case, the sanitising loop is just a plain
infinite loop.

Limit the loop to at most 100 (arbitrary) iterations, so we're not
forever stuck.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/autobuild-run | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 397c770..0fce008 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -518,7 +518,14 @@ def gen_config(**kwargs):
 
     # Now, generate the random selection of packages, and fixup
     # things if needed.
+    # Safe-guard, in case we can not quickly come to a valid
+    # configuration: allow at most 100 (arbitrary) iterations.
+    bounded_loop = 100
     while True:
+        if bounded_loop == 0:
+            log_write(log, "ERROR: cannot generate random configuration after 100 iterations")
+            return -1
+        bounded_loop -= 1
         ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
                                "KCONFIG_PROBABILITY=%d" % randint(1,30), "randpackageconfig"],
                               stdout=devnull, stderr=devnull)
-- 
1.9.1
