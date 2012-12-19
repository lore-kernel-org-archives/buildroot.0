From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 20 Dec 2012 01:43:47 +0200
Subject: [Buildroot] [PATCH 09/12] elfutils: new package
In-Reply-To: <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
References: <y>
 <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1355960630-25089-9-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc does not have fts.h (which is nonstandard) enabled by default.
So we use fts_.h from libgnu.a as substitute and also expose
__UCLIBC__ macro from features.h so that ifdef ... else ... endif
will work correctly.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 .../elfutils/elfutils-linux-kernel-modules.patch   |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/elfutils/elfutils-linux-kernel-modules.patch

diff --git a/package/elfutils/elfutils-linux-kernel-modules.patch b/package/elfutils/elfutils-linux-kernel-modules.patch
new file mode 100644
index 0000000..3fc2117
--- /dev/null
+++ b/package/elfutils/elfutils-linux-kernel-modules.patch
@@ -0,0 +1,29 @@
+diff -Naur elfutils-0.155.org/libdwfl/linux-kernel-modules.c elfutils-0.155/libdwfl/linux-kernel-modules.c
+--- elfutils-0.155.org/libdwfl/linux-kernel-modules.c	2012-12-17 21:41:10.075379208 +0200
++++ elfutils-0.155/libdwfl/linux-kernel-modules.c	2012-12-17 21:42:00.336767164 +0200
+@@ -29,7 +29,13 @@
+ /* We include this before config.h because it can't handle _FILE_OFFSET_BITS.
+    Everything we need here is fine if its declarations just come first.  */
+ 
++#include <features.h>
++
++#ifdef	__UCLIBC__
++#include <fts_.h>
++#else
+ #include <fts.h>
++#endif
+ 
+ #include <config.h>
+ 
+diff -Naur elfutils-0.155.org/libdwfl/Makefile.am elfutils-0.155/libdwfl/Makefile.am
+--- elfutils-0.155.org/libdwfl/Makefile.am	2012-12-17 21:44:27.747502320 +0200
++++ elfutils-0.155/libdwfl/Makefile.am	2012-12-17 21:45:14.681467381 +0200
+@@ -31,7 +31,7 @@
+ ##
+ include $(top_srcdir)/config/eu.am
+ INCLUDES += -I$(srcdir) -I$(srcdir)/../libelf -I$(srcdir)/../libebl \
+-	   -I$(srcdir)/../libdw
++	   -I$(srcdir)/../libdw -I$(srcdir)/../gnulib
+ VERSION = 1
+ 
+ noinst_LIBRARIES = libdwfl.a
-- 
1.7.7.6
