From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 15:59:04 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: decode
 subprocess output for python3
Message-ID: <20200309140909.817DE8894D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb05ab22425e8cd8715611b66eadb1a3a5da5fa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Python 3, the functions from the subprocess module return bytes
(and no longer strings as in Python 2), which must be decoded for
further text operations.

Now, pkg-stats can be run in Python 3.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 7721d98459..e414ec50f2 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -157,7 +157,7 @@ class Package:
         o = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()[1]
         lines = o.splitlines()
         for line in lines:
-            m = re.match("^([0-9]*) warnings generated", line)
+            m = re.match("^([0-9]*) warnings generated", line.decode())
             if m:
                 self.warnings = int(m.group(1))
                 return
@@ -351,7 +351,7 @@ def package_init_make_info():
     # Fetch all variables at once
     variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
                                          "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES"])
-    variable_list = variables.splitlines()
+    variable_list = variables.decode().splitlines()
 
     # We process first the host package VERSION, and then the target
     # package VERSION. This means that if a package exists in both
@@ -886,7 +886,7 @@ def __main__():
         package_list = None
     date = datetime.datetime.utcnow()
     commit = subprocess.check_output(['git', 'rev-parse',
-                                      'HEAD']).splitlines()[0]
+                                      'HEAD']).splitlines()[0].decode()
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
     print("Getting package make info ...")
