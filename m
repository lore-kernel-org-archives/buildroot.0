From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Apr 2015 21:59:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/softether: Fix build error on ARC
Message-ID: <1428004759-25894-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ifaddrs.h is not included in the toolchain, this patch informs softether about this.

Fixes
http://autobuild.buildroot.net/results/199/19992951da34a703a476dc62ea92e12927c8a02d/
http://autobuild.buildroot.net/results/fa7/fa77579aa6502ef1d84976d355637513f38c39c9/
http://autobuild.buildroot.net/results/ec8/ec853d4b8d8e91d6d3cdb46bcc15a400d2fcd5d8/
http://autobuild.buildroot.net/results/e13/e13ee90bd15a7bba99b3c54de596c8fcb14e60c0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/softether/0007-arc.patch |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/softether/0007-arc.patch

diff --git a/package/softether/0007-arc.patch b/package/softether/0007-arc.patch
new file mode 100644
index 0000000..c2acd40
--- /dev/null
+++ b/package/softether/0007-arc.patch
@@ -0,0 +1,20 @@
+Fix ARC build
+
+../../src/Mayaqua/Mayaqua.h:289:21: fatal error: ifaddrs.h: No such file or directory
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/src/Mayaqua/Mayaqua.h.org	2015-04-02 21:52:44.911083674 +0200
++++ b/src/Mayaqua/Mayaqua.h	2015-04-02 21:51:52.075081069 +0200
+@@ -235,9 +235,11 @@
+ #ifdef	OS_UNIX
+ #ifndef	UNIX_SOLARIS
+ #ifndef	CPU_SH4
++#ifndef	__arc__
+ // Getifaddrs system call is supported on UNIX other than Solaris.
+ // However, it is not supported also by the Linux on SH4 CPU
+ #define	MAYAQUA_SUPPORTS_GETIFADDRS
++#endif	// __arc__
+ #endif	// CPU_SH4
+ #endif	// UNIX_SOLARIS
+ #endif	// OS_UNIX
-- 
1.7.10.4
