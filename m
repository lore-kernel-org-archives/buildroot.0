From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Fri, 19 Jul 2019 07:26:36 +0200
Subject: [Buildroot] [PATCH v2 1/1] utils/checkpackagelib:
 CommentsMenusPackagesOrder: append elements to arrays if needed
Message-ID: <20190719052636.3281-1-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the future max value of level variable (index of arrays) may increase,
so we have to append elements to arrays if needed.

Also change order of variables.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
Changes v1 -> v2:
  - use try/except statement instead of if one (Yann)

    At the beginning self.state is empty and variable level (index of arrays)
    is equal 0. We append elements to arrays for the first time when a line
    begining with "comment ", "if " or "menu ". At that moment level is equal 1
    and each array should have two elements (index 0 and 1). To achieve this
    we can use empty arrays or arrays with an initial value (index 0).

    1. Arrays with an initial value and if statement (previous version)
       ...
       if level > len(array) - 1
           append elements
       ...

    2. Empty arrays and while statement  
       ...
       while level > len(array) - 1
           append elements
       ...

    3. Arrays with an initial value and try/except statement (this version)
       ...
       try:
           assigment staff
       except IndexError:
           append elements
       ...
---
 utils/checkpackagelib/lib_config.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index f0edb9993d..eabb882483 100644
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
-            self.package[level] = ""
-            self.print_package_warning[level] = True
-            self.menu_of_packages[level] = text[:-1]
+
+            try:
+                self.menu_of_packages[level] = text[:-1]
+                self.package[level] = ""
+                self.print_package_warning[level] = True
+            except IndexError:
+                self.menu_of_packages.append(text[:-1])
+                self.package.append("")
+                self.print_package_warning.append(True)
 
         elif text.startswith("endif") or text.startswith("endmenu"):
             if self.state.endswith("comment"):
-- 
2.17.1
