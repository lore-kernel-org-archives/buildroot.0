From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  4 Jul 2017 23:53:15 +0200
Subject: [Buildroot] [PATCH] utils/brmake: print the error code of the build
Message-ID: <20170704215315.19990-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the stdout and stderr streams are redirected, it is not
immediately obvious when a build failed, even though brmake really exits
with the same error code as make did.

When there is an error, print the exit code after the elapsed time.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 utils/brmake | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/utils/brmake b/utils/brmake
index 3c6f8485ab..e30119dd10 100755
--- a/utils/brmake
+++ b/utils/brmake
@@ -29,7 +29,12 @@ main() {
     m=$((d/60))
     d=$((d%60))
     [ ${m} -eq 0 ] || { printf "%${mf}dmin " ${m}; sf="02"; }
-    printf "%${sf}ds\n" ${d}
+    printf "%${sf}ds" ${d}
+
+    if [ ${ret} -ne 0 ]; then
+        printf "  (error code: %s)" ${ret}
+    fi
+    printf "\n"
 
     return ${ret}
 }
-- 
2.11.0
