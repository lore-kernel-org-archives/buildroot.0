From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2016 10:19:32 +0100
Subject: [Buildroot] [PATCH 2/3] libraw: add patch to remove Byte order mark
In-Reply-To: <1455268773-12503-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1455268773-12503-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1455268773-12503-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This Byte order mark is not recognized by gcc < 4.4, which is the case
on Blackfin where gcc 4.3.x is used. Since this BOM is not useful
anyway, we simply remove it. The patch has been submitted upstream.

Fixes:

  http://autobuild.buildroot.net/results/143c4c2a1d8527c97362ce11507e8b5a79dd0d6b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...002-libraw_x3f.cpp-remove-Byte-order-mark.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libraw/0002-libraw_x3f.cpp-remove-Byte-order-mark.patch

diff --git a/package/libraw/0002-libraw_x3f.cpp-remove-Byte-order-mark.patch b/package/libraw/0002-libraw_x3f.cpp-remove-Byte-order-mark.patch
new file mode 100644
index 0000000..24f0eb1
--- /dev/null
+++ b/package/libraw/0002-libraw_x3f.cpp-remove-Byte-order-mark.patch
@@ -0,0 +1,39 @@
+From 0f2507bfe30f2df10dfc38b94cdfde5594902b8e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 12 Feb 2016 10:00:12 +0100
+Subject: [PATCH] libraw_x3f.cpp: remove Byte order mark
+
+The U+FEFF character, which is a Byte order mark, at the beginning of
+libraw_x3f.cpp, prevents gcc 4.3.x from building this file:
+
+src/../internal/libraw_x3f.cpp:1: error: stray '\357' in program
+src/../internal/libraw_x3f.cpp:1: error: stray '\273' in program
+src/../internal/libraw_x3f.cpp:1: error: stray '\277' in program
+
+Support in gcc for the Byte order mark has been added in gcc
+4.4.x. Since anyway this Byte order mark is not useful, we simply
+remove it.
+
+See https://en.wikipedia.org/wiki/Byte_order_mark for more details.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+Submitted upstream at:
+https://github.com/LibRaw/LibRaw/pull/61
+
+ internal/libraw_x3f.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/internal/libraw_x3f.cpp b/internal/libraw_x3f.cpp
+index dbf28c1..67047ab 100644
+--- a/internal/libraw_x3f.cpp
++++ b/internal/libraw_x3f.cpp
+@@ -1,4 +1,4 @@
+-?/* Library for accessing X3F Files 
++/* Library for accessing X3F Files 
+ ----------------------------------------------------------------
+ BSD-style License
+ ----------------------------------------------------------------
+-- 
+2.6.4
+
-- 
2.6.4
