From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Mon, 15 Jul 2019 10:32:09 +0200
Subject: [Buildroot] [PATCH 1/1] utils/checkpackagelib:
 CommentsMenusPackagesOrder: append elements to arrays if needed
Message-ID: <20190715083209.7319-1-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be "future-proof" append elements to arrays if needed.
Also change order of variables.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 utils/checkpackagelib/lib_config.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index f0edb9993d..f55bb33d69 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -61,9 +61,9 @@ class AttributesOrder(_CheckFunction):
 
 
 class CommentsMenusPackagesOrder(_CheckFunction):
-    print_package_warning = [True, True, True, True, True, True]
-    menu_of_packages = ["", "", "", "", "", ""]
-    package = ["", "", "", "", "", ""]
+    menu_of_packages = [""]
+    package = [""]
+    print_package_warning = [True]
 
     def before(self):
         self.state = ""
@@ -87,9 +87,15 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                     self.state += "-menu"
 
             level = self.get_level()
+
+            if level > len(self.package) - 1:
+                self.menu_of_packages.append("")
+                self.package.append("")
+                self.print_package_warning.append(True)
+
+            self.menu_of_packages[level] = text[:-1]
             self.package[level] = ""
             self.print_package_warning[level] = True
-            self.menu_of_packages[level] = text[:-1]
 
         elif text.startswith("endif") or text.startswith("endmenu"):
             if self.state.endswith("comment"):
-- 
2.17.1
