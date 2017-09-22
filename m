From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Fri, 22 Sep 2017 15:50:03 +0300
Subject: [Buildroot] [PATCH] qt: Allow enabling of QtWebKit with GCC 6+
Message-ID: <20170922125003.32618-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 .../qt/0014-Enable-QtWebKit-with-newer-GCC.patch   | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/qt/0014-Enable-QtWebKit-with-newer-GCC.patch

diff --git a/package/qt/0014-Enable-QtWebKit-with-newer-GCC.patch b/package/qt/0014-Enable-QtWebKit-with-newer-GCC.patch
new file mode 100644
index 000000000..88d3761a1
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
-- 
2.11.0
