From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 09:55:41 +0100
Subject: [Buildroot] [PATCH v2 2/2] check-host-tar.sh: blacklist tar 1.30+
In-Reply-To: <20180227085541.11318-1-peter@korsgaard.com>
References: <20180227085541.11318-1-peter@korsgaard.com>
Message-ID: <20180227085541.11318-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tar 1.30 changed the --numeric-owner output for filenames > 100 characters,
leading to hash mismatches for the tar archives we create ourselves from
git.  This is really a fix for a bug in earlier tar versions regarding
deterministic output, so it is unlikely to be reverted in later versions.

To work around this issue, blacklist tar 1.30+ similar to how we do it for
pre-1.17 versions so Buildroot falls back to building host-tar.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Changes since v1:
  - None

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
-- 
2.11.0
