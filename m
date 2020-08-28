From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:34:43 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] utils/scanpypi: use raw
 strings in re.compile/re.sub
Message-ID: <20200828164650.501778040F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=caf04bab8dfec8308315aafa511fa27a371a50f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following Python 3.x flake8 warning:

W605 invalid escape sequence '\w'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f9150a6a3d0650acdc61eb56ac354cda319e345b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 387755bbb8..dfbf8131cd 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -96,10 +96,10 @@ def pkg_buildroot_name(pkg_name):
     Keyword arguments:
     pkg_name -- String to rename
     """
-    name = re.sub('[^\w-]', '', pkg_name.lower())
+    name = re.sub(r'[^\w-]', '', pkg_name.lower())
     name = name.replace('_', '-')
     prefix = 'python-'
-    pattern = re.compile('^(?!' + prefix + ')(.+?)$')
+    pattern = re.compile(r'^(?!' + prefix + ')(.+?)$')
     name = pattern.sub(r'python-\1', name)
     return name
 
@@ -337,7 +337,7 @@ class BuildrootPackage():
             self.pkg_req = None
             return set()
         self.pkg_req = self.setup_metadata['install_requires']
-        self.pkg_req = [re.sub('([-.\w]+).*', r'\1', req)
+        self.pkg_req = [re.sub(r'([-.\w]+).*', r'\1', req)
                         for req in self.pkg_req]
 
         # get rid of commented lines and also strip the package strings
@@ -451,7 +451,7 @@ class BuildrootPackage():
                 "Mozilla Public License 2.0": "MPL-2.0",
                 "Zope Public License": "ZPL"
                 }
-            regexp = re.compile('^License :* *.* *:+ (.*)( \(.*\))?$')
+            regexp = re.compile(r'^License :* *.* *:+ (.*)( \(.*\))?$')
             classifiers_licenses = [regexp.sub(r"\1", lic)
                                     for lic in self.metadata['info']['classifiers']
                                     if regexp.match(lic)]
