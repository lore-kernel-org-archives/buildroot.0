From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Aug 2019 17:17:29 +0200
Subject: [Buildroot] [git commit] check-package: fix check of file in
 current dir with -b
Message-ID: <20190803152016.9A97683902@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1842bb1470cac3b8bf59b69f33b098761e07a02c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

One of the possible usages of check-package is to first cd to the
directory that contains the files to test (e.g. a package directory) and
then call the script passing the files in the current dir.
It already works when used for intree files, but for files in a
br2-external it throws an exception because some check functions (from
utils/checkpackagelib/lib_*.py) do need the name of the file being
processed and assume there will be a slash before the name.

Fix all check functions that assume that the full filename being checked
contains a slash. Do not use regexps to extract the filename, use
os.path functions instead.

Notice RemoveDefaultPackageSourceVariable and TypoInPackageVariable lead
to an exception in this case, but ApplyOrder instead generates a false
warning.

Fixes bug #11271.

Reported-by: Vitaliy Lotorev <lotorev@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vitaliy Lotorev <lotorev@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_mk.py    | 7 +++----
 utils/checkpackagelib/lib_patch.py | 5 +++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 9e9a045776..dd04ffd58f 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -4,6 +4,7 @@
 # menu options using "make menuconfig" and by running "make" with appropriate
 # packages enabled.
 
+import os
 import re
 
 from checkpackagelib.base import _CheckFunction
@@ -165,10 +166,9 @@ class PackageHeader(_CheckFunction):
 
 class RemoveDefaultPackageSourceVariable(_CheckFunction):
     packages_that_may_contain_default_source = ["binutils", "gcc", "gdb"]
-    PACKAGE_NAME = re.compile("/([^/]+)\.mk")
 
     def before(self):
-        package = self.PACKAGE_NAME.search(self.filename).group(1)
+        package, _ = os.path.splitext(os.path.basename(self.filename))
         package_upper = package.replace("-", "_").upper()
         self.package = package
         self.FIND_SOURCE = re.compile(
@@ -238,11 +238,10 @@ class TypoInPackageVariable(_CheckFunction):
         "TARGET_FINALIZE_HOOKS",
         "TARGETS_ROOTFS",
         "XTENSA_CORE_NAME"]))
-    PACKAGE_NAME = re.compile("/([^/]+)\.mk")
     VARIABLE = re.compile("^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=")
 
     def before(self):
-        package = self.PACKAGE_NAME.search(self.filename).group(1)
+        package, _ = os.path.splitext(os.path.basename(self.filename))
         package = package.replace("-", "_").upper()
         # linux tools do not use LINUX_TOOL_ prefix for variables
         package = package.replace("LINUX_TOOL_", "")
diff --git a/utils/checkpackagelib/lib_patch.py b/utils/checkpackagelib/lib_patch.py
index 453b782e6c..438353ad3b 100644
--- a/utils/checkpackagelib/lib_patch.py
+++ b/utils/checkpackagelib/lib_patch.py
@@ -3,6 +3,7 @@
 # functions don't need to check for things already checked by running
 # "make package-dirclean package-patch".
 
+import os
 import re
 
 from checkpackagelib.base import _CheckFunction
@@ -10,10 +11,10 @@ from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 
 
 class ApplyOrder(_CheckFunction):
-    APPLY_ORDER = re.compile("/\d{1,4}-[^/]*$")
+    APPLY_ORDER = re.compile("\d{1,4}-[^/]*$")
 
     def before(self):
-        if not self.APPLY_ORDER.search(self.filename):
+        if not self.APPLY_ORDER.match(os.path.basename(self.filename)):
             return ["{}:0: use name <number>-<description>.patch "
                     "({}#_providing_patches)"
                     .format(self.filename, self.url_to_manual)]
