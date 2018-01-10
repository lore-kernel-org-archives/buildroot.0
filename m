From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 10 Jan 2018 09:45:52 +0100
Subject: [Buildroot] [PATCH v2] scanpypi: get license names from SPDX
 database
Message-ID: <20180110084552.1968-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Use spdx_lookup package to compare packages' license file texts
with SPDX database.

This feature is optional.

Bonus: fix wrong indentation.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
	- add a warning message if spdx_lookup wasn't found (Thomas Petazzoni)
 	- mention indentaion fix in the commit log (Thomas Petazzoni)

 utils/scanpypi | 134 ++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 79 insertions(+), 55 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 939c26a187..d3b0d2f51a 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -24,6 +24,15 @@ import tempfile
 import imp
 from functools import wraps
 
+try:
+    import spdx_lookup as liclookup
+except ImportError:
+    # spdx_lookup is not installed
+    print('spdx_lookup module is not installed. This can lead to an '
+          'inaccurate licence detection. Please install it via\n'
+          'pip install spdx_lookup')
+    liclookup = None
+
 def setup_decorator(func, method):
     """
     Decorator for distutils.core.setup and setuptools.setup.
@@ -354,71 +363,86 @@ class BuildrootPackage():
         lines.append(setup_type_line)
         return lines
 
-    def __create_mk_license(self):
+    def __get_license_names(self, license_files):
         """
-        Create the lines referring to the package's license informations of the
-        <package_name>.mk file
+        Try to determine the related license name.
+
+        There are two possibilities. Either the scripts tries to
+        get license name from package's metadata or, if spdx_lookup
+        package is available, the script compares license files with
+        SPDX database.
+        """
+        license_line = ''
+        if liclookup is None:
+            license_dict = {
+                'Apache Software License': 'Apache-2.0',
+                'BSD License': 'BSD',
+                'European Union Public Licence 1.0': 'EUPL-1.0',
+                'European Union Public Licence 1.1': 'EUPL-1.1',
+                "GNU General Public License": "GPL",
+                "GNU General Public License v2": "GPL-2.0",
+                "GNU General Public License v2 or later": "GPL-2.0+",
+                "GNU General Public License v3": "GPL-3.0",
+                "GNU General Public License v3 or later": "GPL-3.0+",
+                "GNU Lesser General Public License v2": "LGPL-2.1",
+                "GNU Lesser General Public License v2 or later": "LGPL-2.1+",
+                "GNU Lesser General Public License v3": "LGPL-3.0",
+                "GNU Lesser General Public License v3 or later": "LGPL-3.0+",
+                "GNU Library or Lesser General Public License": "LGPL-2.0",
+                "ISC License": "ISC",
+                "MIT License": "MIT",
+                "Mozilla Public License 1.0": "MPL-1.0",
+                "Mozilla Public License 1.1": "MPL-1.1",
+                "Mozilla Public License 2.0": "MPL-2.0",
+                "Zope Public License": "ZPL"
+                }
+            regexp = re.compile('^License :* *.* *:+ (.*)( \(.*\))?$')
+            classifiers_licenses = [regexp.sub(r"\1", lic)
+                                    for lic in self.metadata['info']['classifiers']
+                                    if regexp.match(lic)]
+            licenses = map(lambda x: license_dict[x] if x in license_dict else x,
+                           classifiers_licenses)
+            if not len(licenses):
+                print('WARNING: License has been set to "{license}". It is most'
+                      ' likely wrong, please change it if need be'.format(
+                          license=', '.join(licenses)))
+                licenses = [self.metadata['info']['license']]
+            license_line = '{name}_LICENSE = {license}\n'.format(
+                name=self.mk_name,
+                license=', '.join(licenses))
+        else:
+            license_names = []
+            for license_file in license_files:
+                with open(license_file) as lic_file:
+                    match = liclookup.match(lic_file.read())
+                if match.confidence >= 90.0:
+                    license_names.append(match.license.id)
 
-        The license is found using the metadata from pypi.
-        In the metadata, the license can be found either with standard names in
-        the classifiers part or with naming from the packager in the "License"
-        part.
+            if len(license_names) > 0:
+                license_line = ('{name}_LICENSE ='
+                                ' {names}\n'.format(
+                                    name=self.mk_name,
+                                    names=', '.join(license_names)))
 
-        From the classifiers, the license is "translated" according to
-        buildroot standards if need be (i.e. from Apache Software License to
-        Apache-2.0).
+        return license_line
 
-        From the License part, we cannot guess what formatting the packager
-        used. Hence, it is likely to be incorrect. (i.e. Apache License 2.0
-        instead of Apache-2.0).
+    def __create_mk_license(self):
+        """
+        Create the lines referring to the package's license informations of the
+        <package_name>.mk file
 
-        The license's files are found by searching the package for files named
-        license or license.txt (case insensitive).
-        If more than one license file is found, the user is asked to select
-        which ones he wants to use.
+        The license's files are found by searching the package (case insensitive)
+        for files named license, license.txt etc. If more than one license file
+        is found, the user is asked to select which ones he wants to use.
         """
-        license_dict = {
-            'Apache Software License': 'Apache-2.0',
-            'BSD License': 'BSD',
-            'European Union Public Licence 1.0': 'EUPL-1.0',
-            'European Union Public Licence 1.1': 'EUPL-1.1',
-            "GNU General Public License": "GPL",
-            "GNU General Public License v2": "GPL-2.0",
-            "GNU General Public License v2 or later": "GPL-2.0+",
-            "GNU General Public License v3": "GPL-3.0",
-            "GNU General Public License v3 or later": "GPL-3.0+",
-            "GNU Lesser General Public License v2": "LGPL-2.1",
-            "GNU Lesser General Public License v2 or later": "LGPL-2.1+",
-            "GNU Lesser General Public License v3": "LGPL-3.0",
-            "GNU Lesser General Public License v3 or later": "LGPL-3.0+",
-            "GNU Library or Lesser General Public License": "LGPL-2.0",
-            "ISC License": "ISC",
-            "MIT License": "MIT",
-            "Mozilla Public License 1.0": "MPL-1.0",
-            "Mozilla Public License 1.1": "MPL-1.1",
-            "Mozilla Public License 2.0": "MPL-2.0",
-            "Zope Public License": "ZPL"
-            }
-        regexp = re.compile('^License :* *.* *:+ (.*)( \(.*\))?$')
-        classifiers_licenses = [regexp.sub(r"\1", lic)
-                                for lic in self.metadata['info']['classifiers']
-                                if regexp.match(lic)]
-        licenses = map(lambda x: license_dict[x] if x in license_dict else x,
-                       classifiers_licenses)
         lines = []
-        if not len(licenses):
-            print('WARNING: License has been set to "{license}". It is most'
-                  ' likely wrong, please change it if need be'.format(
-                      license=', '.join(licenses)))
-            licenses = [self.metadata['info']['license']]
-        license_line = '{name}_LICENSE = {license}\n'.format(
-            name=self.mk_name,
-            license=', '.join(licenses))
-        lines.append(license_line)
 
         filenames = ['LICENCE', 'LICENSE', 'LICENSE.RST', 'LICENSE.TXT',
-		     'COPYING', 'COPYING.TXT']
+                     'COPYING', 'COPYING.TXT']
         license_files = list(find_file_upper_case(filenames, self.tmp_extract))
+
+        lines.append(self.__get_license_names(license_files))
+
         license_files = [license.replace(self.tmp_extract, '')[1:]
                          for license in license_files]
         if len(license_files) > 0:
-- 
2.11.0
