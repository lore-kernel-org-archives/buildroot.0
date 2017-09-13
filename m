From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 13 Sep 2017 15:36:33 +0200
Subject: [Buildroot] [RFC] scanpypi: convert to Python 3 syntax
Message-ID: <20170913133633.8477-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Some Python 3 only packages have Python 3 syntax in their setup.py
files. Besides setup.py files can have UTF-8 encoding. Both cases
would make scanpypi fail.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 utils/scanpypi | 63 +++++++++++++++++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 02384f2569..9e632c3024 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -1,4 +1,4 @@
-#!/usr/bin/env python2
+#!/usr/bin/env python3
 """
 
 Utility for building Buildroot packages for existing PyPI packages
@@ -6,14 +6,16 @@ Utility for building Buildroot packages for existing PyPI packages
 Any package built by scanpypi should be manually checked for
 errors.
 """
-from __future__ import print_function
+
 import argparse
 import json
-import urllib2
+import urllib.request
+import urllib.error
+import urllib.parse
 import sys
 import os
 import shutil
-import StringIO
+import io
 import tarfile
 import zipfile
 import errno
@@ -62,7 +64,7 @@ def find_file_upper_case(filenames, path='./'):
     for root, dirs, files in os.walk(path):
         for file in files:
             if file.upper() in filenames:
-                yield (os.path.join(root, file))
+                yield os.path.join(root, file)
 
 
 def pkg_buildroot_name(pkg_name):
@@ -131,15 +133,15 @@ class BuildrootPackage():
         self.metadata_url = 'https://pypi.python.org/pypi/{pkg}/json'.format(
             pkg=self.real_name)
         try:
-            pkg_json = urllib2.urlopen(self.metadata_url).read().decode()
-        except urllib2.HTTPError as error:
+            pkg_json = urllib.request.urlopen(self.metadata_url).read().decode()
+        except urllib.error.HTTPError as error:
             print('ERROR:', error.getcode(), error.msg, file=sys.stderr)
             print('ERROR: Could not find package {pkg}.\n'
                   'Check syntax inside the python package index:\n'
                   'https://pypi.python.org/pypi/ '
                   .format(pkg=self.real_name))
             raise
-        except urllib2.URLError:
+        except urllib.error.URLError:
             print('ERROR: Could not find package {pkg}.\n'
                   'Check syntax inside the python package index:\n'
                   'https://pypi.python.org/pypi/ '
@@ -165,7 +167,7 @@ class BuildrootPackage():
                 'md5_digest': None}]
             # In this case, we can't get the name of the downloaded file
             # from the pypi api, so we need to find it, this should work
-            urlpath = urllib2.urlparse.urlparse(
+            urlpath = urllib.parse.urlparse(
                 self.metadata['info']['download_url']).path
             # urlparse().path give something like
             # /path/to/file-version.tar.gz
@@ -176,9 +178,9 @@ class BuildrootPackage():
                 continue
             try:
                 print('Downloading package {pkg} from {url}...'.format(
-                      pkg=self.real_name, url=download_url['url']))
-                download = urllib2.urlopen(download_url['url'])
-            except urllib2.HTTPError as http_error:
+                    pkg=self.real_name, url=download_url['url']))
+                download = urllib.request.urlopen(download_url['url'])
+            except urllib.error.HTTPError as http_error:
                 download = http_error
             else:
                 self.used_url = download_url
@@ -189,7 +191,7 @@ class BuildrootPackage():
                 if self.md5_sum == download_url['md5_digest']:
                     break
         else:
-            if download.__class__ == urllib2.HTTPError:
+            if download.__class__ == urllib.error.HTTPError:
                 raise download
             raise DownloadFailed('Failed to downloas package {pkg}'
                                  .format(pkg=self.real_name))
@@ -203,7 +205,7 @@ class BuildrootPackage():
         Keyword arguments:
         tmp_path -- directory where you want the package to be extracted
         """
-        as_file = StringIO.StringIO(self.as_string)
+        as_file = io.BytesIO(self.as_string)
         if self.filename[-3:] == 'zip':
             with zipfile.ZipFile(as_file) as as_zipfile:
                 tmp_pkg = os.path.join(tmp_path, self.buildroot_name)
@@ -211,9 +213,9 @@ class BuildrootPackage():
                     os.makedirs(tmp_pkg)
                 except OSError as exception:
                     if exception.errno != errno.EEXIST:
-                        print("ERROR: ", exception.message, file=sys.stderr)
+                        print("ERROR: ", exception.strerror, file=sys.stderr)
                         return None, None
-                    print('WARNING:', exception.message, file=sys.stderr)
+                    print('WARNING:', exception.strerror, file=sys.stderr)
                     print('Removing {pkg}...'.format(pkg=tmp_pkg))
                     shutil.rmtree(tmp_pkg)
                     os.makedirs(tmp_pkg)
@@ -225,9 +227,9 @@ class BuildrootPackage():
                     os.makedirs(tmp_pkg)
                 except OSError as exception:
                     if exception.errno != errno.EEXIST:
-                        print("ERROR: ", exception.message, file=sys.stderr)
+                        print("ERROR: ", exception.strerror, file=sys.stderr)
                         return None, None
-                    print('WARNING:', exception.message, file=sys.stderr)
+                    print('WARNING:', exception.strerror, file=sys.stderr)
                     print('Removing {pkg}...'.format(pkg=tmp_pkg))
                     shutil.rmtree(tmp_pkg)
                     os.makedirs(tmp_pkg)
@@ -262,7 +264,7 @@ class BuildrootPackage():
         # setup from the __main__ but does not come with a 'main()' function,
         # for some reason setup.main() will successfully call the main
         # function of a previous package...
-        sys.modules.pop('setup',None)
+        sys.modules.pop('setup', None)
         del setup
         os.chdir(current_dir)
         sys.path.remove(self.tmp_extract)
@@ -282,8 +284,8 @@ class BuildrootPackage():
         self.pkg_req = [re.sub('([-.\w]+).*', r'\1', req)
                         for req in self.pkg_req]
         req_not_found = self.pkg_req
-        self.pkg_req = map(pkg_buildroot_name, self.pkg_req)
-        pkg_tuples = zip(req_not_found, self.pkg_req)
+        self.pkg_req = list(map(pkg_buildroot_name, self.pkg_req))
+        pkg_tuples = list(zip(req_not_found, self.pkg_req))
         # pkg_tuples is a list of tuples that looks like
         # ('werkzeug','python-werkzeug') because I need both when checking if
         # dependencies already exist or are already in the download list
@@ -403,8 +405,7 @@ class BuildrootPackage():
         classifiers_licenses = [regexp.sub(r"\1", lic)
                                 for lic in self.metadata['info']['classifiers']
                                 if regexp.match(lic)]
-        licenses = map(lambda x: license_dict[x] if x in license_dict else x,
-                       classifiers_licenses)
+        licenses = [license_dict[x] if x in license_dict else x for x in classifiers_licenses]
         lines = []
         if not len(licenses):
             print('WARNING: License has been set to "{license}". It is most'
@@ -417,7 +418,7 @@ class BuildrootPackage():
         lines.append(license_line)
 
         filenames = ['LICENCE', 'LICENSE', 'LICENSE.RST', 'LICENSE.TXT',
-		     'COPYING', 'COPYING.TXT']
+                     'COPYING', 'COPYING.TXT']
         license_files = list(find_file_upper_case(filenames, self.tmp_extract))
         license_files = [license.replace(self.tmp_extract, '')[1:]
                          for license in license_files]
@@ -484,7 +485,7 @@ class BuildrootPackage():
         lines = []
         if self.used_url['md5_digest']:
             md5_comment = '# md5 from {url}, sha256 locally computed\n'.format(
-		url=self.metadata_url)
+                url=self.metadata_url)
             lines.append(md5_comment)
             hash_line = '{method}\t{digest}  {filename}\n'.format(
                 method='md5',
@@ -533,7 +534,7 @@ class BuildrootPackage():
         # \t + two spaces is 3 char long
         help_lines.append('')
         help_lines.append('\t  ' + self.metadata['info']['home_page'])
-        help_lines = map(lambda x: x + '\n', help_lines)
+        help_lines = [x + '\n' for x in help_lines]
         lines += help_lines
 
         with open(path_to_config, 'w') as config_file:
@@ -574,7 +575,7 @@ def main():
             print('Fetching package', package.real_name)
             try:
                 package.fetch_package_info()
-            except (urllib2.URLError, urllib2.HTTPError):
+            except (urllib.error.URLError, urllib.error.HTTPError):
                 continue
             if package.metadata_name.lower() == 'setuptools':
                 # setuptools imports itself, that does not work very well
@@ -584,7 +585,7 @@ def main():
 
             try:
                 package.download_package()
-            except urllib2.HTTPError as error:
+            except urllib.error.HTTPError as error:
                 print('Error: {code} {reason}'.format(code=error.code,
                                                       reason=error.reason))
                 print('Error downloading package :', package.buildroot_name)
@@ -603,7 +604,7 @@ def main():
             try:
                 package.load_setup()
             except ImportError as err:
-                if 'buildutils' in err.message:
+                if 'buildutils' == err.name:
                     print('This package needs buildutils')
                 else:
                     raise
@@ -628,11 +629,11 @@ def main():
                 os.makedirs(package.pkg_dir)
             except OSError as exception:
                 if exception.errno != errno.EEXIST:
-                    print("ERROR: ", exception.message, file=sys.stderr)
+                    print("ERROR: ", exception.strerror, file=sys.stderr)
                     continue
                 print('Error: Package {name} already exists'
                       .format(name=package.pkg_dir))
-                del_pkg = raw_input(
+                del_pkg = input(
                     'Do you want to delete existing package ? [y/N]')
                 if del_pkg.lower() == 'y':
                     shutil.rmtree(package.pkg_dir)
-- 
2.11.0
