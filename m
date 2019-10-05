From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 Oct 2019 14:22:23 +0200
Subject: [Buildroot] [PATCH v2 09/13] utils/checkpackagelib:
 CommentsMenusPackagesOrder: check the order of comments menu
In-Reply-To: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20191005122227.7297-10-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At any level if the 'comment ...' line occurs for the first time a new state
'-comment' is added and all arrays elements for that level are initialized.
For the second and subsequent time only packages arrays elements are initialized.
The menu of comments corresponds to menu of packages of lower level.
Only the valid comments are compared. The comment is valid only if there is
at least one a 'source ...' line after it and before the next 'comment ...',
'menu ...' or 'if ...' line.
The alphabetical order of comments at that level is checked until the first
error occurs.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/checkpackagelib/lib_config.py | 43 ++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 709dbae0fe..06d45bd6ec 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -62,10 +62,13 @@ class AttributesOrder(_CheckFunction):
 
 class CommentsMenusPackagesOrder(_CheckFunction):
     def before(self):
+        self.comment = [""]
+        self.comments_order_checking = [False]
         self.level = 0
         self.menu_of_packages = ["The top level menu"]
         self.new_package = ""
         self.package = [""]
+        self.print_comment_warning = [True]
         self.print_package_warning = [True]
         self.state = ""
 
@@ -84,6 +87,16 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
     def initialize_level_elements(self, text):
         self.level = self.get_level()
+
+        try:
+            self.comment[self.level] = ""
+            self.comments_order_checking[self.level] = False
+            self.print_comment_warning[self.level] = True
+        except IndexError:
+            self.comment.append("")
+            self.comments_order_checking.append(False)
+            self.print_comment_warning.append(True)
+
         self.initialize_package_level_elements(text)
 
     def check_line(self, lineno, text):
@@ -101,7 +114,12 @@ class CommentsMenusPackagesOrder(_CheckFunction):
             if not self.state.endswith("-comment"):
                 self.state += "-comment"
 
-            self.initialize_level_elements(text)
+                self.initialize_level_elements(text)
+            else:
+                self.initialize_package_level_elements(text)
+
+            if self.print_comment_warning[self.level]:
+                self.comments_order_checking[self.level] = True
 
         elif text.startswith("if "):
             self.state += "-if"
@@ -145,6 +163,29 @@ class CommentsMenusPackagesOrder(_CheckFunction):
             self.level = self.get_level()
 
         elif source_line:
+            if self.comments_order_checking[self.level]:
+
+                self.comments_order_checking[self.level] = False
+
+                new_comment = self.menu_of_packages[self.level][9: -1:]
+
+                if self.comment[self.level] != "" and \
+                   self.print_comment_warning[self.level] and \
+                   new_comment < self.comment[self.level]:
+                    self.print_comment_warning[self.level] = False
+                    prefix = "{}:{}: ".format(self.filename, lineno)
+                    spaces = " " * len(prefix)
+                    return ["{prefix}Comments in: {menu},\n"
+                            "{spaces}are not alphabetically ordered;\n"
+                            "{spaces}correct order: '-', '_', digits, capitals, lowercase;\n"
+                            "{spaces}first incorrect comment: {comment}"
+                            .format(prefix=prefix, spaces=spaces,
+                                    menu=self.menu_of_packages[self.level-1],
+                                    comment=new_comment),
+                            text]
+
+                self.comment[self.level] = new_comment
+
             self.new_package = source_line.group(1)
 
             # We order _ before A, so replace it with .
-- 
2.17.1
