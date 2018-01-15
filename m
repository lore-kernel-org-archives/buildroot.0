From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 22:12:47 +0100
Subject: [Buildroot] [git commit] scanpypi: add support for licence files
 checksums
Message-ID: <20180115211250.9BE02838F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13d94669b924be92ea9e8f0690f9a51617705b57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Store the list of detected licence files in the main object and
automatically add their sha256 checksums when creating *.hash file.

Bonus: fix wrong indentation.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/scanpypi | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index d3b0d2f..765bfdc 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -24,6 +24,8 @@ import tempfile
 import imp
 from functools import wraps
 
+BUF_SIZE = 65536
+
 try:
     import spdx_lookup as liclookup
 except ImportError:
@@ -132,6 +134,7 @@ class BuildrootPackage():
         self.filename = None
         self.url = None
         self.version = None
+        self.license_files = []
 
     def fetch_package_info(self):
         """
@@ -439,12 +442,12 @@ class BuildrootPackage():
 
         filenames = ['LICENCE', 'LICENSE', 'LICENSE.RST', 'LICENSE.TXT',
                      'COPYING', 'COPYING.TXT']
-        license_files = list(find_file_upper_case(filenames, self.tmp_extract))
+        self.license_files = list(find_file_upper_case(filenames, self.tmp_extract))
 
-        lines.append(self.__get_license_names(license_files))
+        lines.append(self.__get_license_names(self.license_files))
 
         license_files = [license.replace(self.tmp_extract, '')[1:]
-                         for license in license_files]
+                         for license in self.license_files]
         if len(license_files) > 0:
             if len(license_files) > 1:
                 print('More than one file found for license:',
@@ -508,7 +511,7 @@ class BuildrootPackage():
         lines = []
         if self.used_url['md5_digest']:
             md5_comment = '# md5 from {url}, sha256 locally computed\n'.format(
-		url=self.metadata_url)
+                url=self.metadata_url)
             lines.append(md5_comment)
             hash_line = '{method}\t{digest}  {filename}\n'.format(
                 method='md5',
@@ -522,6 +525,20 @@ class BuildrootPackage():
             filename=self.filename)
         lines.append(hash_line)
 
+        for license_file in self.license_files:
+            sha256 = hashlib.sha256()
+            with open(license_file, 'rb') as lic_f:
+                while True:
+                    data = lic_f.read(BUF_SIZE)
+                    if not data:
+                        break
+                    sha256.update(data)
+            hash_line = '{method}\t{digest}  {filename}\n'.format(
+                method='sha256',
+                digest=sha256.hexdigest(),
+                filename=os.path.basename(license_file))
+            lines.append(hash_line)
+
         with open(path_to_hash, 'w') as hash_file:
             hash_file.writelines(lines)
 
