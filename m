From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat, 13 Jan 2018 22:39:43 +0100
Subject: [Buildroot] [PATCHv3 1/1] utils/checkpackagelib: add function to
 check of the default package source variable
Message-ID: <1515879583-8269-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes v2 -> v3
 - add missing whitespaces after ',' (Ricardo Martincoski)
 - remove value returned by the check function (Ricardo Martincoski)

Changes v1 -> v2
 - remove unused variable (Ricardo Martincoski)
 - change warning url (Ricardo Martincoski)
 - add whitelist of packages (Ricardo Martincoski)

 utils/checkpackagelib/lib_mk.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 817e809..a6cfeb6 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -99,6 +99,30 @@ class PackageHeader(_CheckFunction):
                         text]
 
 
+class RemoveDefaultPackageSourceVariable(_CheckFunction):
+    packages_that_may_contain_default_source = ["binutils", "gcc", "gdb"]
+    PACKAGE_NAME = re.compile("/([^/]+)\.mk")
+
+    def before(self):
+        package = self.PACKAGE_NAME.search(self.filename).group(1)
+        package_upper = package.replace("-", "_").upper()
+        self.package = package
+        self.FIND_SOURCE = re.compile(
+            "^{}_SOURCE\s*=\s*{}-\$\({}_VERSION\)\.tar\.gz"
+            .format(package_upper, package, package_upper))
+
+    def check_line(self, lineno, text):
+        if self.FIND_SOURCE.search(text):
+
+            if self.package in self.packages_that_may_contain_default_source:
+                return
+
+            return ["{}:{}: remove default value of _SOURCE variable "
+                    "({}#generic-package-reference)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+
+
 class SpaceBeforeBackslash(_CheckFunction):
     TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH = re.compile(r"^.*(  |\t)\\$")
 
-- 
1.9.1
