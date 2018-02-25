From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 22:21:54 +0100
Subject: [Buildroot] [git commit branch/next] scanpypi: add support for
 Python3
Message-ID: <20180225212213.7DE028816A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a0c20c5309b36c379af97038e69c8ebd4119f83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The script was changed via modernize utility. The only manual
made part was the handling of StringIO.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scanpypi | 43 ++++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 55bfb2fedb..12bfc24e10 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -7,13 +7,13 @@ Any package built by scanpypi should be manually checked for
 errors.
 """
 from __future__ import print_function
+from __future__ import absolute_import
 import argparse
 import json
-import urllib2
+import six.moves.urllib.request, six.moves.urllib.error, six.moves.urllib.parse
 import sys
 import os
 import shutil
-import StringIO
 import tarfile
 import zipfile
 import errno
@@ -23,6 +23,13 @@ import textwrap
 import tempfile
 import imp
 from functools import wraps
+from six.moves import map
+from six.moves import zip
+from six.moves import input
+if six.PY2:
+    import StringIO
+else:
+    import io
 
 BUF_SIZE = 65536
 
@@ -147,15 +154,15 @@ class BuildrootPackage():
         self.metadata_url = 'https://pypi.python.org/pypi/{pkg}/json'.format(
             pkg=self.real_name)
         try:
-            pkg_json = urllib2.urlopen(self.metadata_url).read().decode()
-        except urllib2.HTTPError as error:
+            pkg_json = six.moves.urllib.request.urlopen(self.metadata_url).read().decode()
+        except six.moves.urllib.error.HTTPError as error:
             print('ERROR:', error.getcode(), error.msg, file=sys.stderr)
             print('ERROR: Could not find package {pkg}.\n'
                   'Check syntax inside the python package index:\n'
                   'https://pypi.python.org/pypi/ '
                   .format(pkg=self.real_name))
             raise
-        except urllib2.URLError:
+        except six.moves.urllib.error.URLError:
             print('ERROR: Could not find package {pkg}.\n'
                   'Check syntax inside the python package index:\n'
                   'https://pypi.python.org/pypi/ '
@@ -193,8 +200,8 @@ class BuildrootPackage():
             try:
                 print('Downloading package {pkg} from {url}...'.format(
                       pkg=self.real_name, url=download_url['url']))
-                download = urllib2.urlopen(download_url['url'])
-            except urllib2.HTTPError as http_error:
+                download = six.moves.urllib.request.urlopen(download_url['url'])
+            except six.moves.urllib.error.HTTPError as http_error:
                 download = http_error
             else:
                 self.used_url = download_url
@@ -205,7 +212,7 @@ class BuildrootPackage():
                 if self.md5_sum == download_url['md5_digest']:
                     break
         else:
-            if download.__class__ == urllib2.HTTPError:
+            if download.__class__ == six.moves.urllib.error.HTTPError:
                 raise download
             raise DownloadFailed('Failed to downloas package {pkg}'
                                  .format(pkg=self.real_name))
@@ -219,7 +226,10 @@ class BuildrootPackage():
         Keyword arguments:
         tmp_path -- directory where you want the package to be extracted
         """
-        as_file = StringIO.StringIO(self.as_string)
+        if six.PY2:
+            as_file = StringIO.StringIO(self.as_string)
+        else:
+            as_file = io.BytesIO(self.as_string)
         if self.filename[-3:] == 'zip':
             with zipfile.ZipFile(as_file) as as_zipfile:
                 tmp_pkg = os.path.join(tmp_path, self.buildroot_name)
@@ -303,8 +313,8 @@ class BuildrootPackage():
                         if len(item) > 0 and item[0] != '#']
 
         req_not_found = self.pkg_req
-        self.pkg_req = map(pkg_buildroot_name, self.pkg_req)
-        pkg_tuples = zip(req_not_found, self.pkg_req)
+        self.pkg_req = list(map(pkg_buildroot_name, self.pkg_req))
+        pkg_tuples = list(zip(req_not_found, self.pkg_req))
         # pkg_tuples is a list of tuples that looks like
         # ('werkzeug','python-werkzeug') because I need both when checking if
         # dependencies already exist or are already in the download list
@@ -412,8 +422,7 @@ class BuildrootPackage():
             classifiers_licenses = [regexp.sub(r"\1", lic)
                                     for lic in self.metadata['info']['classifiers']
                                     if regexp.match(lic)]
-            licenses = map(lambda x: license_dict[x] if x in license_dict else x,
-                           classifiers_licenses)
+            licenses = [license_dict[x] if x in license_dict else x for x in classifiers_licenses]
             if not len(licenses):
                 print('WARNING: License has been set to "{license}". It is most'
                       ' likely wrong, please change it if need be'.format(
@@ -583,7 +592,7 @@ class BuildrootPackage():
         # \t + two spaces is 3 char long
         help_lines.append('')
         help_lines.append('\t  ' + self.metadata['info']['home_page'])
-        help_lines = map(lambda x: x + '\n', help_lines)
+        help_lines = [x + '\n' for x in help_lines]
         lines += help_lines
 
         with open(path_to_config, 'w') as config_file:
@@ -624,7 +633,7 @@ def main():
             print('Fetching package', package.real_name)
             try:
                 package.fetch_package_info()
-            except (urllib2.URLError, urllib2.HTTPError):
+            except (six.moves.urllib.error.URLError, six.moves.urllib.error.HTTPError):
                 continue
             if package.metadata_name.lower() == 'setuptools':
                 # setuptools imports itself, that does not work very well
@@ -634,7 +643,7 @@ def main():
 
             try:
                 package.download_package()
-            except urllib2.HTTPError as error:
+            except six.moves.urllib.error.HTTPError as error:
                 print('Error: {code} {reason}'.format(code=error.code,
                                                       reason=error.reason))
                 print('Error downloading package :', package.buildroot_name)
@@ -682,7 +691,7 @@ def main():
                     continue
                 print('Error: Package {name} already exists'
                       .format(name=package.pkg_dir))
-                del_pkg = raw_input(
+                del_pkg = input(
                     'Do you want to delete existing package ? [y/N]')
                 if del_pkg.lower() == 'y':
                     shutil.rmtree(package.pkg_dir)
