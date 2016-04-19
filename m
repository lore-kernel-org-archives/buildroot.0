From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 21:03:13 +0200
Subject: [Buildroot] [git commit] package/jack2: Fix build on nios2
Message-ID: <20160419190331.701D6818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=520186dd0ef64c7befb852c18eb36545b3b73ccb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/8f3/8f3d2139de7f85f729e0555f8513fdbd177cbadd/
http://autobuild.buildroot.net/results/5d2/5d2f049ab9fa6a1a4e3fa9884983ab66b2fccb56/
http://autobuild.buildroot.net/results/85a/85a4a7ee4cf5c0b65e4543a524909d9c0422eea4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jack2/0001-Add-support-for-nios2.patch | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/jack2/0001-Add-support-for-nios2.patch b/package/jack2/0001-Add-support-for-nios2.patch
new file mode 100644
index 0000000..f6d60af
--- /dev/null
+++ b/package/jack2/0001-Add-support-for-nios2.patch
@@ -0,0 +1,34 @@
+From 3651f95d0433c84d2b67e30e68dd6140585535b0 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 19 Apr 2016 19:32:35 +0200
+Subject: [PATCH 1/1] Add support for nios2
+
+When compiling jack on nios2, compilation fails because NGREGS is not
+defined. Since this is only for debug output on segmentation faults, stub
+the debug print out like it's been done for other platforms before.
+
+Inspired by
+https://github.com/jackaudio/jack2/commit/d11bb095291d8880508c87adfe625bf2bcab1456
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Patch sent upstream: https://github.com/jackaudio/jack2/pull/199]
+---
+ dbus/sigsegv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dbus/sigsegv.c b/dbus/sigsegv.c
+index 64c3986..ee12f91 100644
+--- a/dbus/sigsegv.c
++++ b/dbus/sigsegv.c
+@@ -104,7 +104,7 @@ static void signal_segv(int signum, siginfo_t* info, void*ptr) {
+     jack_error("info.si_errno = %d", info->si_errno);
+     jack_error("info.si_code  = %d (%s)", info->si_code, si_code_str);
+     jack_error("info.si_addr  = %p", info->si_addr);
+-#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__)
++#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__) && !defined(nios2)
+     for(i = 0; i < NGREG; i++)
+         jack_error("reg[%02d]       = 0x" REGFORMAT, i, 
+ #if defined(__powerpc64__)
+-- 
+2.8.0.rc3
+
