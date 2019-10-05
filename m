From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 Oct 2019 14:22:24 +0200
Subject: [Buildroot] [PATCH v2 10/13] utils/checkpackagelib:
 CommentsMenusPackagesOrder: check the order of menu of menus
In-Reply-To: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20191005122227.7297-11-jerzy.m.grzegorek@gmail.com>
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/checkpackagelib/lib_config.py | 37 ++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 06d45bd6ec..97d256bb1c 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -64,11 +64,14 @@ class CommentsMenusPackagesOrder(_CheckFunction):
     def before(self):
         self.comment = [""]
         self.comments_order_checking = [False]
+        self.first_menu = [True, True]
         self.level = 0
+        self.menu = [""]
         self.menu_of_packages = ["The top level menu"]
         self.new_package = ""
         self.package = [""]
         self.print_comment_warning = [True]
+        self.print_menu_warning = [True]
         self.print_package_warning = [True]
         self.state = ""
 
@@ -91,11 +94,17 @@ class CommentsMenusPackagesOrder(_CheckFunction):
         try:
             self.comment[self.level] = ""
             self.comments_order_checking[self.level] = False
+            self.first_menu[self.level+1] = True
+            self.menu[self.level] = ""
             self.print_comment_warning[self.level] = True
+            self.print_menu_warning[self.level] = True
         except IndexError:
             self.comment.append("")
             self.comments_order_checking.append(False)
+            self.first_menu.append(True)
+            self.menu.append("")
             self.print_comment_warning.append(True)
+            self.print_menu_warning.append(True)
 
         self.initialize_package_level_elements(text)
 
@@ -148,7 +157,33 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
             self.state += "-menu"
 
-            self.initialize_level_elements(text)
+            self.level = self.get_level()
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
