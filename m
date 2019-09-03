From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:27 +0200
Subject: [Buildroot] [PATCH 04/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: add functions to initialize arrays elements
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190903211341.10341-4-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index e6a5f1b182..f8bfe6a577 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -71,6 +71,20 @@ class CommentsMenusPackagesOrder(_CheckFunction):
     def get_level(self):
         return len(self.state.split('-')) - 1
 
+    def initialize_package_level_elements(self, text):
+        try:
+            self.menu_of_packages[self.level] = text[:-1]
+            self.package[self.level] = ""
+            self.print_package_warning[self.level] = True
+        except IndexError:
+            self.menu_of_packages.append(text[:-1])
+            self.package.append("")
+            self.print_package_warning.append(True)
+
+    def initialize_level_elements(self, text):
+        self.level = self.get_level()
+        self.initialize_package_level_elements(text)
+
     def check_line(self, lineno, text):
         # We only want to force sorting for the top-level menus
         if self.filename not in ["package/Config.in",
@@ -93,16 +107,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                 elif text.startswith("menu"):
                     self.state += "-menu"
 
-            self.level = self.get_level()
-
-            try:
-                self.menu_of_packages[self.level] = text[:-1]
-                self.package[self.level] = ""
-                self.print_package_warning[self.level] = True
-            except IndexError:
-                self.menu_of_packages.append(text[:-1])
-                self.package.append("")
-                self.print_package_warning.append(True)
+            self.initialize_level_elements(text)
 
         elif text.startswith("endif") or text.startswith("endmenu"):
             if self.state.endswith("comment"):
-- 
2.17.1
