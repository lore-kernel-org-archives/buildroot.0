From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 23 May 2016 18:47:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/jack2: Fix build on xtensa
Message-ID: <1464022076-24135-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/1ee/1ee48356d8da5e0ebf3e5b61b02fed81704a01dd/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/jack2/0003-Add-support-for-xtensa.patch | 34 +++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/jack2/0003-Add-support-for-xtensa.patch

diff --git a/package/jack2/0003-Add-support-for-xtensa.patch b/package/jack2/0003-Add-support-for-xtensa.patch
new file mode 100644
index 0000000..f4e7180
--- /dev/null
+++ b/package/jack2/0003-Add-support-for-xtensa.patch
@@ -0,0 +1,34 @@
+From bf35254cf21bf27a1cb79d5612ee02032c6ec39e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 23 May 2016 17:42:39 +0200
+Subject: [PATCH 1/2] Add support for xtensa
+
+When compiling jack on nios2, compilation fails because NGREGS is not
+defined. Since this is only for debug output on segmentation faults, stub
+the debug print out like it's been done for other platforms before.
+
+Inspired by
+https://github.com/jackaudio/jack2/commit/d11bb095291d8880508c87adfe625bf2bcab1456
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(Patch sent upstream: https://github.com/jackaudio/jack2/pull/210)
+---
+ dbus/sigsegv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dbus/sigsegv.c b/dbus/sigsegv.c
+index ee12f91..137adf1 100644
+--- a/dbus/sigsegv.c
++++ b/dbus/sigsegv.c
+@@ -104,7 +104,7 @@ static void signal_segv(int signum, siginfo_t* info, void*ptr) {
+     jack_error("info.si_errno = %d", info->si_errno);
+     jack_error("info.si_code  = %d (%s)", info->si_code, si_code_str);
+     jack_error("info.si_addr  = %p", info->si_addr);
+-#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__) && !defined(nios2)
++#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__) && !defined(nios2) && !defined(__XTENSA__)
+     for(i = 0; i < NGREG; i++)
+         jack_error("reg[%02d]       = 0x" REGFORMAT, i, 
+ #if defined(__powerpc64__)
+-- 
+2.8.1
+
-- 
2.8.1
