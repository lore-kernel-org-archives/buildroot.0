From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 13:54:04 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] utils/scanpypi: protect
 against zip-slip vulnerability in zip/tar handling
Message-ID: <20190221125235.C6B448CA4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73192f7056684ef7eb9604cdf367a2da355e50b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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
(cherry picked from commit a83e30ad63e00d6c81a6409161c2d3010d98d373)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/utils/scanpypi b/utils/scanpypi
index cb4b5e76a3..23e64e65ec 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -212,6 +212,22 @@ class BuildrootPackage():
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
@@ -233,6 +249,7 @@ class BuildrootPackage():
                     print('Removing {pkg}...'.format(pkg=tmp_pkg))
                     shutil.rmtree(tmp_pkg)
                     os.makedirs(tmp_pkg)
+                self.check_archive(as_zipfile.namelist())
                 as_zipfile.extractall(tmp_pkg)
                 pkg_filename = self.filename.split(".zip")[0]
         else:
@@ -248,6 +265,7 @@ class BuildrootPackage():
                     print('Removing {pkg}...'.format(pkg=tmp_pkg))
                     shutil.rmtree(tmp_pkg)
                     os.makedirs(tmp_pkg)
+                self.check_archive(as_tarfile.getnames())
                 as_tarfile.extractall(tmp_pkg)
                 pkg_filename = self.filename.split(".tar")[0]
 
