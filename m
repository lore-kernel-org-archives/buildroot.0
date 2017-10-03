From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Oct 2017 21:58:40 +0200
Subject: [Buildroot] [git commit] qt: Allow enabling of QtWebKit with GCC 6+
Message-ID: <20171003195153.487B380046@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f95bb8562ef02935d6fcf9b254060454e5be796c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building Qt with QtWebKit on configuration step there is
a check which disables QtWebKit build with GCC 6+.
Back in the day nobody thought about building Qt with GCC
version greater than 5.x. And now with modern GCCs like
6.x and 7.x this assumption gets in the way.

Given in Buildroot today we don't have GCC older than 4.9
it should be safe to remove now meaningless check completely
by adding patch to qt.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../qt/0014-Enable-QtWebKit-with-newer-GCC.patch   | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/qt/0014-Enable-QtWebKit-with-newer-GCC.patch b/package/qt/0014-Enable-QtWebKit-with-newer-GCC.patch
new file mode 100644
index 0000000..1e555e7
--- /dev/null
+++ b/package/qt/0014-Enable-QtWebKit-with-newer-GCC.patch
@@ -0,0 +1,50 @@
+From f566411fb314b7e4ab01f28e25e942cfaf8c59b7 Mon Sep 17 00:00:00 2001
+From: Evgeniy Didin <didin@synopsys.com>
+Date: Fri, 15 Sep 2017 19:43:48 +0300
+Subject: [PATCH] qt: Allow enabling of QtWebKit with GCC 6+
+
+Building Qt with QtWebKit on configuration step there is
+a check which disables QtWebKit build with GCC 6+.
+Back in the day nobody thought about building Qt with GCC
+version greater than 5.x. And now with modern GCCs like
+6.x and 7.x this assumption gets in the way.
+
+Given in Buildroot today we don't have GCC older than 4.9 
+it should be safe to remove now meaningless check completely.
+
+Signed-off-by: Evgeniy Didin <didin@synopsys.com>
+Cc: Alexey Brodkin <abrodkin@synopsys.com>
+Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ configure | 14 --------------
+ 1 file changed, 14 deletions(-)
+
+diff --git a/configure b/configure
+index 10ad7ca0b0..8771144a65 100755
+--- a/configure
++++ b/configure
+@@ -7731,20 +7731,6 @@ case "$XPLATFORM" in
+ 	canBuildWebKit="no"
+ 	canBuildQtXmlPatterns="no"
+ 	;;
+-    *-g++*)
+-	# Check gcc's version
+-	case "$(${QMAKE_CONF_COMPILER} -dumpversion)" in
+-	    5*|4*|3.4*)
+-		;;
+-            3.3*)
+-                canBuildWebKit="no"
+-                ;;
+-	    *)
+-		canBuildWebKit="no"
+-		canBuildQtXmlPatterns="no"
+-		;;
+-	esac
+-	;;
+     solaris-cc*)
+         # Check the compiler version
+         case `${QMAKE_CONF_COMPILER} -V 2>&1 | awk '{print $4}'` in
+-- 
+2.11.0
+
