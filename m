From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:28 +0200
Subject: [Buildroot] [PATCH 05/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: change the type of variable 'new_package'
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190903211341.10341-5-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change the type of variable 'new_package' to make it a class member.
It will be used not only locally.
Also initialize it.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index f8bfe6a577..de5faa19a2 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -67,6 +67,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
     def before(self):
         self.state = ""
+        self.new_package = ""
 
     def get_level(self):
         return len(self.state.split('-')) - 1
@@ -122,10 +123,10 @@ class CommentsMenusPackagesOrder(_CheckFunction):
             self.level = self.get_level()
 
         elif source_line:
-            new_package = source_line.group(1)
+            self.new_package = source_line.group(1)
 
             # We order _ before A, so replace it with .
-            new_package_ord = new_package.replace('_', '.')
+            new_package_ord = self.new_package.replace('_', '.')
 
             if self.package[self.level] != "" and \
                self.print_package_warning[self.level] and \
@@ -139,7 +140,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                         "{spaces}first incorrect package: {package}"
                         .format(prefix=prefix, spaces=spaces,
                                 menu=self.menu_of_packages[self.level],
-                                package=new_package),
+                                package=self.new_package),
                         text]
 
             self.package[self.level] = new_package_ord
-- 
2.17.1
