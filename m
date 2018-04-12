From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:26:54 +0200
Subject: [Buildroot] [git commit] picocom: fix build for x86 with musl libc
Message-ID: <20180412192700.82C62884DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63f7b84932e884409c5a46c7e91058e2c9f75a00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 3.1 picocom enabled by default custom baud rate support
for x86 targets. This requires the c_ispeed and c_opseed field in struct
termios that musl libc does not provide. Add an upstream patch that
restricts custom baud rates to C libraries that provide the needed
termios fields.

Fixes:
http://autobuild.buildroot.net/results/28e/28ec584484dedfd6ef473dfd9dd24481e27ce2b3/
http://autobuild.buildroot.net/results/912/912493a8f99416524a5897634ae62604436e9b51/
http://autobuild.buildroot.net/results/65d/65d0f449822f296dfe6b9be0e03a5a855f700a9e/

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...mpile-with-libc-s-without-cispeed-cospeed.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/picocom/0001-Compile-with-libc-s-without-cispeed-cospeed.patch b/package/picocom/0001-Compile-with-libc-s-without-cispeed-cospeed.patch
new file mode 100644
index 0000000000..5143e31102
--- /dev/null
+++ b/package/picocom/0001-Compile-with-libc-s-without-cispeed-cospeed.patch
@@ -0,0 +1,49 @@
+From 30c712c5f14306460c44bea70e24419db9d44f8c Mon Sep 17 00:00:00 2001
+From: Nick Patavalis <npat@efault.net>
+Date: Thu, 12 Apr 2018 15:16:04 +0300
+Subject: [PATCH] Compile with libc's without cispeed / cospeed
+
+Some libc implementations (e.g. musl) do not define the cispeed and
+cospeed struct termios fields. So we have to check the
+_HAVE_STRUCT_TERMIOS_C_ISPEED and _HAVE_STRUCT_TERMIOS_C_OSPEED
+macros. If not defined, we disable custom baudrate support.
+
+[baruch: backported from upstream master to 3.1]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 1acf1ddabaf3
+
+ custbaud.h | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/custbaud.h b/custbaud.h
+index 48151a4a4e84..ae4ae8daf49e 100644
+--- a/custbaud.h
++++ b/custbaud.h
+@@ -26,6 +26,8 @@
+ #ifndef CUSTBAUD_H
+ #define CUSTBAUD_H
+ 
++#include <termios.h>
++
+ #ifndef NO_CUSTOM_BAUD
+ 
+ #if defined (__linux__)
+@@ -33,7 +35,13 @@
+ /* Enable by-default for kernels > 2.6.0 on x86 and x86_64 only */
+ #include <linux/version.h>
+ #if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,0)
+-#if defined (__i386__) || defined (__x86_64__) || defined (USE_CUSTOM_BAUD)
++/* Some libc implementations (e.g. musl) do not define the cispeed and
++   cospeed struct termios fields. We do not support custom baudrates
++   on them. */
++#if ( (defined (__i386__) || defined (__x86_64__))  \
++      && defined (_HAVE_STRUCT_TERMIOS_C_ISPEED)    \
++      && defined (_HAVE_STRUCT_TERMIOS_C_OSPEED) )  \
++    || defined (USE_CUSTOM_BAUD)
+ #ifndef USE_CUSTOM_BAUD
+ #define USE_CUSTOM_BAUD
+ #endif
+-- 
+2.16.3
+
