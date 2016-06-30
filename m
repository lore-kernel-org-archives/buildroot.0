From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:03:54 +0200
Subject: [Buildroot] [git commit] scanpypi: rework runtime dependency
	handling
Message-ID: <20160630220359.22EE3817A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a64ade2f3dc5ccce53c50db2112d9a8fae94024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In most cases Python's package dependencies found in setup.py are
runtime dependencies and hence don't need to be mentioned in *.mk
file.

Also add '# runtime' tag to select statements in Config.in.

__create_mk_requirements() itself is left for future uses (cffi backend
handling etc.).

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/scanpypi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/support/scripts/scanpypi b/support/scripts/scanpypi
index 230791f..79a888c 100755
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
 
