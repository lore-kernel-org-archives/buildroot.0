From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Wed, 26 Oct 2016 13:45:17 +0300
Subject: [Buildroot] [PATCH][autobuild] Use last 4 lines of log instead of 3
	when getting failure reason
Message-ID: <1477478717-19209-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Latest versions of make produce a bit different output than older
versions do. They also print number of line in Makefile where the
failure occurred.

E.g. latest make produces the following output:
---------------------------------->8------------------------------------
GNUmakefile:277: recipe for target 'cgiedit.o' failed
make[2]: *** [cgiedit.o] Error 1
package/pkg-generic.mk:201: recipe for target '/home/buildroot/autobuild/run/instance-2/output/build/privoxy-3.0.26/.stamp_built' failed
make[1]: *** [/home/buildroot/autobuild/run/instance-2/output/build/privoxy-3.0.26/.stamp_built] Error 2
Makefile:88: recipe for target '_all' failed
make: *** [_all] Error 2
make: Leaving directory '/home/buildroot/autobuild/run/instance-2/buildroot'
---------------------------------->8------------------------------------

When with old version we get something like:
---------------------------------->8------------------------------------
make[2]: *** [cgiedit.o] Error 1
make[1]: *** [/home/buildroot/autobuild/run/instance-1/output/build/privoxy-3.0.26/.stamp_built] Error 2
make: *** [_all] Error 2
make: Leaving directory `/home/buildroot/autobuild/run/instance-1/buildroot'
---------------------------------->8------------------------------------

So latest make produce much more "noise" and we have to analyze
at least 4 last lines of log to be sure that they contain a line
with failure reason.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 scripts/autobuild-run | 2 +-
 web/import.inc.php    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 0fa5fdc..8c86a29 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -667,7 +667,7 @@ def send_results(result, **kwargs):
     def get_failure_reason():
         # Output is a tuple (package, version), or None.
         lastlines = decode_bytes(subprocess.Popen(
-            ["tail", "-n", "3", os.path.join(outputdir, "logfile")],
+            ["tail", "-n", "4", os.path.join(outputdir, "logfile")],
             stdout=subprocess.PIPE).communicate()[0]).splitlines()
 
         regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
diff --git a/web/import.inc.php b/web/import.inc.php
index 243a1f3..3be1251 100644
--- a/web/import.inc.php
+++ b/web/import.inc.php
@@ -102,7 +102,7 @@ function import_result($buildid, $filename)
       $reason = "none";
     else {
 	$tmp = Array();
-	exec("tail -3 " . $thisbuildfinaldir . "build-end.log | grep -v '\[_all\]' | grep 'make.*: \*\*\*' | sed 's,.*\[\([^\]*\)\] Error.*,\\1,' | sed 's,.*/build/\([^/]*\)/.*,\\1,'", $tmp);
+	exec("tail -4 " . $thisbuildfinaldir . "build-end.log | grep -v '\[_all\]' | grep 'make.*: \*\*\*' | sed 's,.*\[\([^\]*\)\] Error.*,\\1,' | sed 's,.*/build/\([^/]*\)/.*,\\1,'", $tmp);
 	if (trim($tmp[0]))
 	  $reason = $tmp[0];
 	else
-- 
2.5.5
