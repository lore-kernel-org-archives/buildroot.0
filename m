From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 20:53:58 +0200
Subject: [Buildroot] [git commit] package/dstat: invert select of the python
 interpreter version
Message-ID: <20191026184724.5D312888D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=444c7546ff3e47585e7b7184a11179161ed8519c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 05484f621c1c2f80b2d735b2f4694996baad4a61 ("package/dstat: bump
to 0.7.4 which allows to run on Python3") added:

   select BR2_PACKAGE_PYTHON if !BR2_PACKAGE_PYTHON3

Unfortunately, some other packages do it the other way around, which
causes the following Kconfig circular dependency:

package/python/Config.in:5:error: recursive dependency detected!
package/python/Config.in:5:	symbol BR2_PACKAGE_PYTHON is selected by BR2_PACKAGE_PYTHON3
package/python3/Config.in:5:	symbol BR2_PACKAGE_PYTHON3 is selected by BR2_PACKAGE_PYTHON

Fix that by inverting the python version selection in the dstat
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dstat/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index 81f53e74b7..647a7033c6 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_DSTAT
 	depends on BR2_USE_MMU # python
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python
 	depends on !BR2_STATIC_LIBS # python
-	select BR2_PACKAGE_PYTHON if !BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	help
 	  Dstat, written in Python, is a versatile replacement for
 	  vmstat, iostat, netstat and ifstat. Dstat overcomes some of
