From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 11 Jul 2019 11:54:47 +0200
Subject: [Buildroot] [PATCH 1/2] support/script/pkg-stats: run the 3 `make`
 calls in parallel
Message-ID: <20190711095448.7417-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pkg-stats calls 3 times `make` to get a bunch of variables. These
calls all takes about the same time -- 95% of the time is spent parsing
the makefile -- so running these subprocesses in parallel can save this
shared time.

The gain scale quite well since with only 3 subprocesses I achieve a
x2.5 ~ x3 speedup.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 support/scripts/pkg-stats | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 1ff3fb2bd1..2ed41dffa9 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -220,11 +220,30 @@ def get_pkglist(npackages, package_list):
     return packages
 
 
+def check_multiple_output(cmds, *popenargs, **kwargs):
+    '''
+    Run each `cmd` asynchronousely and return their respective output.
+    The execution time is the max of all subprocess execution time.
+    '''
+    processes = [subprocess.Popen(cmd, *popenargs,
+                                  stdout=subprocess.PIPE,
+                                  stderr=subprocess.PIPE,
+                                  **kwargs) for cmd in cmds]
+    for proc in processes:
+        out, err = proc.communicate()
+        yield out
+
+
 def package_init_make_info():
+    # Fetch all variables at once
+    licenses, files, versions = check_multiple_output([
+        ["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars", "VARS=%_LICENSE"],
+        ["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars", "VARS=%_LICENSE_FILES"],
+        ["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars", "VARS=%_VERSION"],
+    ])
+
     # Licenses
-    o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
-                                 "-s", "printvars", "VARS=%_LICENSE"])
-    for l in o.splitlines():
+    for l in licenses.splitlines():
         # Get variable name and value
         pkgvar, value = l.split("=")
 
@@ -241,9 +260,7 @@ def package_init_make_info():
         Package.all_licenses.append(pkgvar)
 
     # License files
-    o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
-                                 "-s", "printvars", "VARS=%_LICENSE_FILES"])
-    for l in o.splitlines():
+    for l in files.splitlines():
         # Get variable name and value
         pkgvar, value = l.split("=")
 
@@ -260,14 +277,12 @@ def package_init_make_info():
         Package.all_license_files.append(pkgvar)
 
     # Version
-    o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
-                                 "-s", "printvars", "VARS=%_VERSION"])
 
     # We process first the host package VERSION, and then the target
     # package VERSION. This means that if a package exists in both
     # target and host variants, with different version numbers
     # (unlikely), we'll report the target version number.
-    version_list = o.splitlines()
+    version_list = versions.splitlines()
     version_list = [x for x in version_list if x.startswith("HOST_")] + \
                    [x for x in version_list if not x.startswith("HOST_")]
     for l in version_list:
-- 
2.21.0
