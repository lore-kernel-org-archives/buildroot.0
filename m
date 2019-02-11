From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Feb 2019 23:22:02 +0100
Subject: [Buildroot] [PATCH] utils/scanpypi: protect against zip-slip
 vulnerability in zip/tar handling
Message-ID: <20190211222202.10786-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details, see https://github.com/snyk/zip-slip-vulnerability

Older python versions do not validate that the extracted files are inside
the target directory.  Detect and error out on evil paths before extracting
.zip / .tar file.

Given the scope of this (zip issue was fixed in python 2.7.4, released
2013-04-06, scanpypi is only used by a developer when adding a new python
package), the security impact is fairly minimal, but it is good to get it
fixed anyway.

Reported-by: Bas van Schaik <security-reports@semmle.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/utils/scanpypi b/utils/scanpypi
index a75d696222..bdce6924b6 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -225,6 +225,22 @@ class BuildrootPackage():
         self.filename = self.used_url['filename']
         self.url = self.used_url['url']
 
+    def check_archive(self, members):
+        """
+        Check archive content before extracting
+
+        Keyword arguments:
+        members -- list of archive members
+        """
+        # Protect against https://github.com/snyk/zip-slip-vulnerability
+        # Older python versions do not validate that the extracted files are
+        # inside the target directory. Detect and error out on evil paths
+        evil = [e for e in members if os.path.relpath(e).startswith(('/', '..'))]
+        if evil:
+            print('ERROR: Refusing to extract {} with suspicious members {}'.format(
+                self.filename, evil))
+            sys.exit(1)
+
     def extract_package(self, tmp_path):
         """
         Extract the package contents into a directrory
@@ -249,6 +265,7 @@ class BuildrootPackage():
                     print('Removing {pkg}...'.format(pkg=tmp_pkg))
                     shutil.rmtree(tmp_pkg)
                     os.makedirs(tmp_pkg)
+                self.check_archive(as_zipfile.namelist())
                 as_zipfile.extractall(tmp_pkg)
                 pkg_filename = self.filename.split(".zip")[0]
         else:
@@ -264,6 +281,7 @@ class BuildrootPackage():
                     print('Removing {pkg}...'.format(pkg=tmp_pkg))
                     shutil.rmtree(tmp_pkg)
                     os.makedirs(tmp_pkg)
+                self.check_archive(as_tarfile.getnames())
                 as_tarfile.extractall(tmp_pkg)
                 pkg_filename = self.filename.split(".tar")[0]
 
-- 
2.11.0
