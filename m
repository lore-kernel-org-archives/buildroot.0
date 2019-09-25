From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 22:24:42 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: change the type of variable 'new_package'
Message-ID: <20190925201939.42FAC8F69E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c82e0092f53cbf97dc0a0bfb7db1afa023513cd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change the type of variable 'new_package' to make it a class member.
It will be used not only locally. Also initialize it.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/checkpackagelib/lib_config.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index aaa31e4d72..fc0df3dd17 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -68,6 +68,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
     def before(self):
         self.state = ""
         self.level = 0
+        self.new_package = ""
 
     def get_level(self):
         return len(self.state.split('-')) - 1
@@ -123,10 +124,10 @@ class CommentsMenusPackagesOrder(_CheckFunction):
             self.level = self.get_level()
 
         elif source_line:
-            new_package = source_line.group(1)
+            self.new_package = source_line.group(1)
 
             # We order _ before A, so replace it with .
-            new_package_ord = new_package.replace('_', '.')
+            new_package_ord = self.new_package.replace('_', '.')
 
             if self.package[self.level] != "" and \
                self.print_package_warning[self.level] and \
@@ -140,7 +141,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                         "{spaces}first incorrect package: {package}"
                         .format(prefix=prefix, spaces=spaces,
                                 menu=self.menu_of_packages[self.level],
-                                package=new_package),
+                                package=self.new_package),
                         text]
 
             self.package[self.level] = new_package_ord
