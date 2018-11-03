From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat,  3 Nov 2018 01:56:21 -0300
Subject: [Buildroot] [PATCH 2/5] support/testing: allow run-tests to be
 called from anywhere
In-Reply-To: <20181103045624.31059-1-ricardo.martincoski@gmail.com>
References: <20181103045624.31059-1-ricardo.martincoski@gmail.com>
Message-ID: <20181103045624.31059-3-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently run-tests must be called from the Buildroot top directory.

Derive the top directory from the script path, so run-tests can be called from
any path.
As a consequence the test infra will always test the repo it belongs to.

Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
The suggestion happened one year ago, but I just remembered it now that
I need the base dir to be used by a test case.
Search for "derive the top" in
http://patchwork.ozlabs.org/patch/814544/
---
 support/testing/infra/__init__.py | 8 +++++++-
 support/testing/infra/builder.py  | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index e229e90852..1d4d18bbe9 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -6,6 +6,7 @@ import subprocess
 from urllib2 import urlopen, HTTPError, URLError
 
 ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"
+BASE_DIR = os.path.realpath(os.path.join(os.path.dirname(__file__), "../../.."))
 
 
 def open_log_file(builddir, stage, logtofile=True):
@@ -21,8 +22,13 @@ def open_log_file(builddir, stage, logtofile=True):
     return fhandle
 
 
+def basepath(relpath=""):
+    """Return the absolute path for a file or directory relative to the Buildroot top directory."""
+    return os.path.join(BASE_DIR, relpath)
+
+
 def filepath(relpath):
-    return os.path.join(os.getcwd(), "support/testing", relpath)
+    return os.path.join(BASE_DIR, "support/testing", relpath)
 
 
 def download(dldir, filename):
diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index fc318fe26e..26fa6be7ae 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -29,7 +29,7 @@ class Builder(object):
                "O={}".format(self.builddir),
                "olddefconfig"]
         ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
-                              env=env)
+                              cwd=infra.basepath(), env=env)
         if ret != 0:
             raise SystemError("Cannot olddefconfig")
 
-- 
2.17.1
