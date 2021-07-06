From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:24:59 +0200
Subject: [Buildroot] [PATCH v2 16/18] support/testing/infra: add
 log_file_path() function
In-Reply-To: <20210706142501.951345-1-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
Message-ID: <20210706142501.951345-17-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Some tests will need to grep through the build log to verify that some
features are working are expected. In order to allow them to open the
build log, we provide a new function called log_file_path(), which
returns the path to the log file if available.

We also use this function in open_log_file().

Note that open_log_file() cannot be used directly to grep through the
log file at the end of a build: because it opens in "a+" mode, it
greps starting from the end of the file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
New patch in this v2 series

This patch is retrieved from Thomas's work.
The first version was discussed
https://patchwork.ozlabs.org/project/buildroot/patch/20200430095249.782597-10-thomas.petazzoni at bootlin.com/

This new version was not already submitted by Thomas or I missed it.
Compared to the first version, this patch use a more python-like
syntax as proposed by Yann in the previous review.

 support/testing/infra/__init__.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index b10a7601a3..1f003f24c6 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -10,17 +10,18 @@ ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"
 BASE_DIR = os.path.realpath(os.path.join(os.path.dirname(__file__), "../../.."))
 
 
+def log_file_path(builddir, stage, logtofile=True):
+    """Return path to log file"""
+    return "{}-{}.log".format(builddir, stage) if logtofile else None
+
+
 def open_log_file(builddir, stage, logtofile=True):
     """
     Open a file for logging and return its handler.
     If logtofile is True, returns sys.stdout. Otherwise opens a file
     with a suitable name in the build directory.
     """
-    if logtofile:
-        fhandle = open("{}-{}.log".format(builddir, stage), 'a+')
-    else:
-        fhandle = sys.stdout
-    return fhandle
+    return open(log_file_path(builddir, stage, logtofile), 'a+') if logtofile else sys.stdout
 
 
 def basepath(relpath=""):
-- 
2.31.1
