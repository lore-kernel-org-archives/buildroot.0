From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Jun 2019 22:13:38 +0200
Subject: [Buildroot] [PATCH buildroot-test] web/import.inc.php: account for
 failures that contain an images/ path
Message-ID: <20190616201338.4593-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the testing of BR2_REPRODUCIBLE=y recently added and its
generation of a tar filesystem, we are now testing the tar filesystem
generation logic, and this reveals some interesting breakage, such as:

  http://autobuild.buildroot.net/results/fe3/fe378bca29c86a681ba9ad40386cb89248195c50/build-end.log

However, the "reason" deduced from the build log by the PHP logic is a
bit crappy, it's
"/home/br-user/autobuild/run/instance-0/output/images/rootfs.tar".

This commit adjusts the ugly PHP code with even more ugliness to take
into account the fact that a path may look like
foo/thing/build/<pkg>-<version>/.stamp_something or like
foo/thing/images/rootfs.tar.

The reasons extracted for the two previous examples would be
"<pkg>-<version>" (like is done today) and "rootfs.tar".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 web/import.inc.php | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/web/import.inc.php b/web/import.inc.php
index 5b5462e..956c6d8 100644
--- a/web/import.inc.php
+++ b/web/import.inc.php
@@ -231,7 +231,7 @@ function import_result($buildid, $filename)
       $reason = "none";
     else {
 	$tmp = Array();
-	exec("tail -3 " . $thisbuildfinaldir . "build-end.log | grep -v '\[_all\]' | grep 'make.*: \*\*\*' | sed 's,.*\[\([^\]*\)\] Error.*,\\1,' | sed 's,.*/build/\([^/]*\)/.*,\\1,'", $tmp);
+	exec("tail -3 " . $thisbuildfinaldir . "build-end.log | grep -v '\[_all\]' | grep 'make.*: \*\*\*' | sed 's,.*\[\([^\]*\)\] Error.*,\\1,' | sed 's,.*/\(images\|build\)/\([^/]*\).*,\\2,'", $tmp);
 	if (trim($tmp[0]))
 	  $reason = $tmp[0];
 	else {
-- 
2.21.0
