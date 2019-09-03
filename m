From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:38 +0200
Subject: [Buildroot] [PATCH 15/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: check the order of menu of menus
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190903211341.10341-15-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At any level if the 'menu ...' line occurs for the first time a new state '-menu'
is added and all arrays elements for that level are initialized. For the second
and subsequent times only packages arrays elements are initialized.
Because of this that condition must be checked before appending elements to arrays.
Therefore array's first_menu element must exist for that level and therefore this
array must have one more element than the others and in time of initialization
the higher level element of this array is initialized.
The menu of menus corresponds to menu of packages of lower level.
The alphabetical order of menus at that level is checked until the first error
occurs.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 41 ++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index cb8061e371..ad0142d259 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -65,6 +65,10 @@ class CommentsMenusPackagesOrder(_CheckFunction):
     comments_order_checking = [False]
     print_comment_warning = [True]
 
+    first_menu = [True, True]
+    menu = [""]
+    print_menu_warning = [True]
+
     menu_of_packages = ["The top level menu"]
     package = [""]
     print_package_warning = [True]
@@ -95,6 +99,15 @@ class CommentsMenusPackagesOrder(_CheckFunction):
             self.comments_order_checking.append(False)
             self.print_comment_warning.append(True)
 
+        try:
+            self.first_menu[self.level+1] = True
+            self.menu[self.level] = ""
+            self.print_menu_warning[self.level] = True
+        except IndexError:
+            self.first_menu.append(True)
+            self.menu.append("")
+            self.print_menu_warning.append(True)
+
         self.initialize_package_level_elements(text)
 
     def check_line(self, lineno, text):
@@ -146,7 +159,33 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
             self.state += "-menu"
 
-            self.initialize_level_elements(text)
+            self.level = len(self.state.split('-')) - 1
+
+            if self.first_menu[self.level]:
+                self.first_menu[self.level] = False
+
+                self.initialize_level_elements(text)
+            else:
+                self.initialize_package_level_elements(text)
+
+            new_menu = text[6: -2:]
+
+            if self.menu[self.level] != "" and \
+               self.print_menu_warning[self.level] and \
+               new_menu < self.menu[self.level]:
+                self.print_menu_warning[self.level] = False
+                prefix = "{}:{}: ".format(self.filename, lineno)
+                spaces = " " * len(prefix)
+                return ["{prefix}Menus in: {menu},\n"
+                        "{spaces}are not alphabetically ordered;\n"
+                        "{spaces}correct order: '-', '_', digits, capitals, lowercase;\n"
+                        "{spaces}first incorrect menu: {comment}"
+                        .format(prefix=prefix, spaces=spaces,
+                                menu=self.menu_of_packages[self.level-1],
+                                comment=new_menu),
+                        text]
+
+            self.menu[self.level] = new_menu
 
         elif text.startswith("endif") or text.startswith("endmenu"):
             if self.state.endswith("-comment"):
-- 
2.17.1
