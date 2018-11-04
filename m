From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  4 Nov 2018 02:12:05 -0200
Subject: [Buildroot] [PATCH v2 1/5] check-package: fix check of file in
 current dir with -b
In-Reply-To: <20181104041209.23028-1-ricardo.martincoski@gmail.com>
References: <20181104041209.23028-1-ricardo.martincoski@gmail.com>
Message-ID: <20181104041209.23028-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1 -> v2:
  - do not absolutize paths on output (Vitaliy Lotorev)
---
 utils/checkpackagelib/lib_mk.py    | 7 +++----
 utils/checkpackagelib/lib_patch.py | 5 +++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 0e430a2f12..f2f2a244be 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -4,6 +4,7 @@
 # menu options using "make menuconfig" and by running "make" with appropriate
 # packages enabled.
 
+import os
 import re
 
 from base import _CheckFunction
@@ -100,10 +101,9 @@ class PackageHeader(_CheckFunction):
 
 class RemoveDefaultPackageSourceVariable(_CheckFunction):
     packages_that_may_contain_default_source = ["binutils", "gcc", "gdb"]
-    PACKAGE_NAME = re.compile("/([^/]+)\.mk")
 
     def before(self):
-        package = self.PACKAGE_NAME.search(self.filename).group(1)
+        package, _ = os.path.splitext(os.path.basename(self.filename))
         package_upper = package.replace("-", "_").upper()
         self.package = package
         self.FIND_SOURCE = re.compile(
@@ -173,11 +173,10 @@ class TypoInPackageVariable(_CheckFunction):
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
index 555621afa1..bd0f24938b 100644
--- a/utils/checkpackagelib/lib_patch.py
+++ b/utils/checkpackagelib/lib_patch.py
@@ -3,6 +3,7 @@
 # functions don't need to check for things already checked by running
 # "make package-dirclean package-patch".
 
+import os
 import re
 
 from base import _CheckFunction
@@ -10,10 +11,10 @@ from lib import NewlineAtEof           # noqa: F401
 
 
 class ApplyOrder(_CheckFunction):
-    APPLY_ORDER = re.compile("/\d{1,4}-[^/]*$")
+    APPLY_ORDER = re.compile("\d{1,4}-[^/]*$")
 
     def before(self):
-        if not self.APPLY_ORDER.search(self.filename):
+        if not self.APPLY_ORDER.match(os.path.basename(self.filename)):
             return ["{}:0: use name <number>-<description>.patch "
                     "({}#_providing_patches)"
                     .format(self.filename, self.url_to_manual)]
-- 
2.17.1
