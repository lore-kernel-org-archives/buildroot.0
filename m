From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 30 Jun 2016 09:25:04 +0200
Subject: [Buildroot] [PATCH] scanpypi: rework runtime dependency handling
Message-ID: <1467271504-929-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

In most cases Python's package dependencies found in setup.py are
runtime dependencies and hence don't need to be mentioned in *.mk
file.

Also add '# runtime' tag to select statements in Config.in.

__create_mk_requirements() itself is left for future uses (cffi backend
handling etc.).

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 support/scripts/scanpypi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/support/scripts/scanpypi b/support/scripts/scanpypi
index da578f4..f0d584a 100755
--- a/support/scripts/scanpypi
+++ b/support/scripts/scanpypi
@@ -466,8 +466,6 @@ class BuildrootPackage():
         lines += self.__create_mk_download_info()
         lines += self.__create_mk_setup()
         lines += self.__create_mk_license()
-        if self.pkg_req:
-            lines += self.__create_mk_requirements()
 
         lines.append('\n')
         lines.append('$(eval $(python-package))')
@@ -518,7 +516,7 @@ class BuildrootPackage():
         lines.append(bool_line)
         if self.pkg_req:
             for dep in self.pkg_req:
-                dep_line = '\tselect BR2_PACKAGE_{req}\n'.format(
+                dep_line = '\tselect BR2_PACKAGE_{req} # runtime\n'.format(
                     req=dep.upper().replace('-', '_'))
                 lines.append(dep_line)
 
-- 
2.1.4
