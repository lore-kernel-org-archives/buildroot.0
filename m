From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 20:36:44 +0200
Subject: [Buildroot] [PATCH] time: mark as not available for static-only
	builds
Message-ID: <1464115004-26552-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to some code imported from gnulib, the time package doesn't build
in static-only configurations. Indeed the gnulib code redefines the
error() and error_at_line() functions, which are also provided by the
C library. Since fixing the gnulib code is really difficult, let's
just disable this package for static-only builds.

Fixes:

  http://autobuild.buildroot.org/results/a0e64faba69fa86755c693f575fb258a77e4e9d1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/time/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/time/Config.in b/package/time/Config.in
index 0ec3be3..f4694a2 100644
--- a/package/time/Config.in
+++ b/package/time/Config.in
@@ -1,7 +1,13 @@
 config BR2_PACKAGE_TIME
 	bool "time"
 	depends on BR2_USE_MMU # fork()
+	# See https://savannah.gnu.org/bugs/index.php?48000
+	depends on !BR2_STATIC_LIBS
 	help
 	  The GNU time utility.
 
 	  http://savannah.gnu.org/projects/time/
+
+comment "time needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
-- 
2.7.4
