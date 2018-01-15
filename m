From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 23:27:02 +0100
Subject: [Buildroot] [git commit] utils/checkpackagelib: add function to
 check of the default package source variable
Message-ID: <20180115222704.7099580E40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f5421cb2c0afd0e14800997a8d1a688a3f91d3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
 
