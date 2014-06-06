From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Fri,  6 Jun 2014 13:56:24 +0400
Subject: [Buildroot] [PATCH] binutils: arc: Fix native binutils build failure
Message-ID: <1402048584-19658-1-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARC-specific Makefile has been ignoring DESTDIR when doing target "install".
This has been causing build failure for native binutils, since it was trying
to install into the host's "/usr". This commit adds a patch that teaches
Makefile to honor DESTDIR. This patch should be removed after ARC Binutils
will be bumped to next release.

This fixes:
http://autobuild.buildroot.net/results/68ee094509db3e8fbedf9bab5745ff68cdfe0a84/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 ...0001-arc-Honor-DESTDIR-in-custom-Makefile.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/binutils/arc-4.8-R3/0001-arc-Honor-DESTDIR-in-custom-Makefile.patch

diff --git a/package/binutils/arc-4.8-R3/0001-arc-Honor-DESTDIR-in-custom-Makefile.patch b/package/binutils/arc-4.8-R3/0001-arc-Honor-DESTDIR-in-custom-Makefile.patch
new file mode 100644
index 0000000..9895a3f
--- /dev/null
+++ b/package/binutils/arc-4.8-R3/0001-arc-Honor-DESTDIR-in-custom-Makefile.patch
@@ -0,0 +1,47 @@
+From e2b7b635c28915d59cb3c1b47f8e79401e1e6c46 Mon Sep 17 00:00:00 2001
+From: Anton Kolesov <Anton.Kolesov@synopsys.com>
+Date: Fri, 6 Jun 2014 12:58:45 +0400
+Subject: [PATCH] arc: Honor DESTDIR in custom Makefile
+
+Installing native binutils in Buildroot faile, because `prefix` is /usr, and
+proper installation path on host is achieved via usage of DESTDIR variable.
+Homegrown ARC Makefile was ignoring this variable and therefour it was
+trying to install files into /usr/extlib, when doing native binutils build.
+This patch teaches our Makefile to honor DESTDIR.
+
+Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
+---
+ gas/ChangeLog.ARC             | 4 ++++
+ gas/config/extlib/Makefile.in | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/gas/ChangeLog.ARC b/gas/ChangeLog.ARC
+index 42a386f..80aedb5 100644
+--- a/gas/ChangeLog.ARC
++++ b/gas/ChangeLog.ARC
+@@ -1,3 +1,7 @@
++2014-06-06 Anton Kolesov  <Anton Kolesov@synopsys.com>
++
++	* config/extlib/Makefile.in: Honor DESTDIR.
++
+ 2014-03-20 Claudiu Zissulescu <claziss@synopsys.com>
+ 
+         * config/tc-arc.c (arc_extoper): Allow negative value when
+diff --git a/gas/config/extlib/Makefile.in b/gas/config/extlib/Makefile.in
+index 75e6a82..35232ea 100644
+--- a/gas/config/extlib/Makefile.in
++++ b/gas/config/extlib/Makefile.in
+@@ -1,8 +1,8 @@
+ all:
+ 	-install @srcdir@/*.s .
+ install:
+-	install -d @prefix@/extlib
+-	install @srcdir@/*.s @prefix@/extlib
++	install -d $(DESTDIR)@prefix@/extlib
++	install @srcdir@/*.s $(DESTDIR)@prefix@/extlib
+ 
+ check:
+ clean:
+-- 
+1.8.4.1
+
-- 
1.8.4.1
