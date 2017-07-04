From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 00:15:05 +0200
Subject: [Buildroot] [git commit] utils/brmake: print the error code of the
	build
Message-ID: <20170704221202.1BE4B7FFDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8d8f74a939ac1381d7ac7dee356247f91347ace
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the stdout and stderr streams are redirected, it is not
immediately obvious when a build failed, even though brmake really exits
with the same error code as make did.

When there is an error, print the exit code after the elapsed time.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/brmake | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/utils/brmake b/utils/brmake
index 3c6f848..e30119d 100755
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
