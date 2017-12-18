From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Mon, 18 Dec 2017 13:14:26 +0100
Subject: [Buildroot] [PATCH 1/1] utils/checkpackagelib: add function to
 check of the default package source variable
Message-ID: <1513599266-6954-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 utils/checkpackagelib/lib_mk.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 817e809..5ae565c 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -99,6 +99,25 @@ class PackageHeader(_CheckFunction):
                         text]
 
 
+class RemoveDefaultPackageSourceVariable(_CheckFunction):
+    PACKAGE_NAME = re.compile("/([^/]+)\.mk")
+
+    def before(self):
+        package = self.PACKAGE_NAME.search(self.filename).group(1)
+        package_upper = package.replace("-", "_").upper()
+        self.package = package
+        self.package_upper = package_upper
+        self.FIND_SOURCE = re.compile(
+            "^{}_SOURCE\s*=\s*{}-\$\({}_VERSION\)\.tar\.gz"
+            .format(package_upper, package, package_upper))
+
+    def check_line(self, lineno, text):
+        if self.FIND_SOURCE.search(text):
+            return ["{}:{}: remove default value of _SOURCE variable ({}#writing-rules-mk)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+
+
 class SpaceBeforeBackslash(_CheckFunction):
     TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH = re.compile(r"^.*(  |\t)\\$")
 
-- 
1.9.1
