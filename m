From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 22:24:42 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: change the type of variable 'level'
Message-ID: <20190925201939.28CEC8F60B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6748e42acebe4dfa2221ef508883321f85253ca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change the type of variable "level" to make it a class member.
It will be used not only locally.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Thomas: initialize self.level in the before() method, as suggested by
Ricardo]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/checkpackagelib/lib_config.py | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index a3fbd0e69e..8f7b13a866 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -67,6 +67,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
     def before(self):
         self.state = ""
+        self.level = 0
 
     def get_level(self):
         return len(self.state.split('-')) - 1
@@ -93,12 +94,12 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                 elif text.startswith("menu"):
                     self.state += "-menu"
 
-            level = self.get_level()
+            self.level = self.get_level()
 
             try:
-                self.menu_of_packages[level] = text[:-1]
-                self.package[level] = ""
-                self.print_package_warning[level] = True
+                self.menu_of_packages[self.level] = text[:-1]
+                self.package[self.level] = ""
+                self.print_package_warning[self.level] = True
             except IndexError:
                 self.menu_of_packages.append(text[:-1])
                 self.package.append("")
@@ -115,16 +116,16 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                 self.state = self.state[:-5]
 
         elif source_line:
-            level = self.get_level()
+            self.level = self.get_level()
             new_package = source_line.group(1)
 
             # We order _ before A, so replace it with .
             new_package_ord = new_package.replace('_', '.')
 
-            if self.package[level] != "" and \
-               self.print_package_warning[level] and \
-               new_package_ord < self.package[level]:
-                self.print_package_warning[level] = False
+            if self.package[self.level] != "" and \
+               self.print_package_warning[self.level] and \
+               new_package_ord < self.package[self.level]:
+                self.print_package_warning[self.level] = False
                 prefix = "{}:{}: ".format(self.filename, lineno)
                 spaces = " " * len(prefix)
                 return ["{prefix}Packages in: {menu},\n"
@@ -132,11 +133,11 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                         "{spaces}correct order: '-', '_', digits, capitals, lowercase;\n"
                         "{spaces}first incorrect package: {package}"
                         .format(prefix=prefix, spaces=spaces,
-                                menu=self.menu_of_packages[level],
+                                menu=self.menu_of_packages[self.level],
                                 package=new_package),
                         text]
 
-            self.package[level] = new_package_ord
+            self.package[self.level] = new_package_ord
 
 
 class HelpText(_CheckFunction):
