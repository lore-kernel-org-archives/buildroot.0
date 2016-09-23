From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date: Fri, 23 Sep 2016 10:54:49 +0200
Subject: [Buildroot] [PATCH] package/coreutils: add -i/-p option to uname
Message-ID: <1474620889-5777-1-git-send-email-marcin.nowakowski@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds -i/-p options to uname app using a patch from Fedora
tree. These options are described as non-portable, but the same patch
(with various smaller or larger variations) is applied to the most
popular linux distros (Fedora, Debian, Ubuntu), so some linux tools
expect these to work.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 .../0002-uname-processortype-from-fedora.patch     | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/coreutils/0002-uname-processortype-from-fedora.patch

diff --git a/package/coreutils/0002-uname-processortype-from-fedora.patch b/package/coreutils/0002-uname-processortype-from-fedora.patch
new file mode 100644
index 0000000..bf8a309
--- /dev/null
+++ b/package/coreutils/0002-uname-processortype-from-fedora.patch
@@ -0,0 +1,53 @@
+From 99cafffe1000517f9af550210c84fed4c4ceb49d Mon Sep 17 00:00:00 2001
+From: Ondrej Vasik <ovasik@fedoraproject.org>
+Date: Sat, 19 Dec 2009 08:42:03 +0000
+Subject: bring back uname -p/-i functionality
+
+diff -urNp coreutils-8.2-orig/src/uname.c coreutils-8.2/src/uname.c
+--- coreutils-8.2-orig/src/uname.c	2009-09-23 10:25:44.000000000 +0200
++++ coreutils-8.2/src/uname.c	2009-12-19 09:09:11.663607110 +0100
+@@ -299,13 +299,19 @@ main (int argc, char **argv)
+ 
+   if (toprint & PRINT_PROCESSOR)
+     {
+-      char const *element = unknown;
++      char *element = unknown;
+ #if HAVE_SYSINFO && defined SI_ARCHITECTURE
+       {
+         static char processor[257];
+         if (0 <= sysinfo (SI_ARCHITECTURE, processor, sizeof processor))
+           element = processor;
+       }
++#else
++      {
++	static struct utsname u;
++	uname(&u);
++	element = u.machine;
++      }
+ #endif
+ #ifdef UNAME_PROCESSOR
+       if (element == unknown)
+@@ -343,7 +349,7 @@ main (int argc, char **argv)
+ 
+   if (toprint & PRINT_HARDWARE_PLATFORM)
+     {
+-      char const *element = unknown;
++      char *element = unknown;
+ #if HAVE_SYSINFO && defined SI_PLATFORM
+       {
+         static char hardware_platform[257];
+@@ -351,6 +357,14 @@ main (int argc, char **argv)
+                           hardware_platform, sizeof hardware_platform))
+           element = hardware_platform;
+       }
++#else
++      {
++	static struct utsname u;
++	uname(&u);
++	element = u.machine;
++	if(strlen(element)==4 && element[0]=='i' && element[2]=='8' && element[3]=='6')
++		element[1]='3';
++      }
+ #endif
+ #ifdef UNAME_HARDWARE_PLATFORM
+       if (element == unknown)
-- 
2.7.4
