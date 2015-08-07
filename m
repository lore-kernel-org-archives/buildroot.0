From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Aug 2015 13:04:58 +0200
Subject: [Buildroot] [git commit] lrzsz: mark as not available for static
	builds
Message-ID: <20150807110600.A283981DEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74e99ce3191b3b3f6a873c6673e582435cbb81ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lrzsz could technically build in a static-only environment, but it
unconditionally redefines the error() and error_at_line() functions,
which clashes with the definition from uClibc. Since the autotools
packaging dates back from 1998, lots of work is needed to fix it, and
do some proper tests on the availability of such functions.

So, let's mark it as not available for static builds, until someone
interested enough fixes it.

Fixes:

  http://autobuild.buildroot.net/results/8106ab057f538d1408d736736fdbe50b99ae709d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lrzsz/Config.in |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/lrzsz/Config.in b/package/lrzsz/Config.in
index 70f10cd..1b5da14 100644
--- a/package/lrzsz/Config.in
+++ b/package/lrzsz/Config.in
@@ -1,6 +1,16 @@
 config BR2_PACKAGE_LRZSZ
 	bool "lrzsz"
+	# It could technically build in a static-only environment, but
+	# it unconditionally redefines the error() and error_at_line()
+	# functions, which clashes with the definition from
+	# uClibc. Since the autotools packaging dates back from 1998,
+	# lots of work is needed to fix it, and do some proper tests
+	# on the availability of such functions.
+	depends on !BR2_STATIC_LIBS
 	help
 	  Portable and fast implementation of the X/Y/Zmodem protocols.
 
 	  http://www.ohse.de/uwe/software/lrzsz.html
+
+comment "lrzsz needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
