From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 17:02:26 +0100
Subject: [Buildroot] [git commit] check-host-tar.sh: blacklist tar 1.30+
Message-ID: <20180227160401.C769981298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8fa273d500b44153e9939f0a100e97db2ff63ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tar 1.30 changed the --numeric-owner output for filenames > 100 characters,
leading to hash mismatches for the tar archives we create ourselves from
git.  This is really a fix for a bug in earlier tar versions regarding
deterministic output, so it is unlikely to be reverted in later versions.

For more details, see:
http://lists.busybox.net/pipermail/buildroot/2018-January/211222.html

To work around this issue, blacklist tar 1.30+ similar to how we do it for
pre-1.17 versions so Buildroot falls back to building host-tar.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/check-host-tar.sh | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index 932d3c4fb2..2143877524 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -30,13 +30,28 @@ fi
 # containing hard-links if the --strip-components option is used).
 major_min=1
 minor_min=17
-if [ $major -gt $major_min ]; then
-	echo $tar
-else
-	if [ $major -eq $major_min -a $minor -ge $minor_min ]; then
-		echo $tar
-	else
-		# echo nothing: no suitable tar found
-		exit 1
-	fi
+
+# Maximal version = 1.29 (1.30 changed --numeric-owner output for
+# filenames > 100 characters). This is really a fix for a bug in
+# earlier tar versions regarding deterministic output so it is
+# unlikely to be reverted in later versions.
+major_max=1
+minor_max=29
+
+if [ $major -lt $major_min -o $major -gt $major_max ]; then
+	# echo nothing: no suitable tar found
+	exit 1
 fi
+
+if [ $major -eq $major_min -a $minor -lt $minor_min ]; then
+	# echo nothing: no suitable tar found
+	exit 1
+fi
+
+if [ $major -eq $major_max -a $minor -gt $minor_max ]; then
+	# echo nothing: no suitable tar found
+	exit 1
+fi
+
+# valid
+echo $tar
