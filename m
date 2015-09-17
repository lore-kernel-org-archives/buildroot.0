From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Thu, 17 Sep 2015 17:46:32 +0300
Subject: [Buildroot] [PATCH 1/2] Add dependency on bash to gzip for runtime
Message-ID: <1442501193-6059-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

The GNU gzip package provides eleven executable files, all but one of
which are bash shell scripts. If we allow inclusion of gzip without
bash, then on executing commands such as lxc-checkconfig that actually
use these shell scripts, you will get errors like 'zgrep: not found',
even though the zgrep executable is in PATH.

This patch also sharpens up the help text and eliminates the claim to
provide gzcat.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/gzip/Config.in |   13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/gzip/Config.in b/package/gzip/Config.in
index a251425..9e2dc0d 100644
--- a/package/gzip/Config.in
+++ b/package/gzip/Config.in
@@ -1,11 +1,14 @@
 config BR2_PACKAGE_GZIP
 	bool "gzip"
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR && BR2_PACKAGE_BASH
 	help
-	  Standard GNU compressor. Provides things like gzip,
-	  gunzip, gzcat, etc...
+	  The GNU implementation of gzip (http://www.gzip.org).
+	  Provides: gunzip, gzexe, gzip, zcat, zcmp, zdiff, zforce,
+	  zgrep, zless, zmore, and znew. All of the executables except
+	  gzip are Bourne-Again shell scripts. Busybox provides a gzip
+	  applet.
 
 	  http://www.gnu.org/software/gzip/gzip.html
 
-comment "gzip needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "gzip needs bash and a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR || !BR2_PACKAGE_BASH
-- 
1.7.9.5
