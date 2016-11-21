From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 21 Nov 2016 17:49:55 +0300
Subject: [Buildroot] [PATCH] jack2: Try better fix for NGREG problem
Message-ID: <1479739795-31046-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After quite some time trying this and that we seem to have no
better solution than proposed by Thomas back in the day [1].

The solution in question is to check [during jack2 configuration]
if NGREG is exposed via ucontext.h and then use its value in
source code later on. This replaces long and still growing list
of architectures for which we explicitly escape usage of NGREG.

Just for reference [2] is my attempt to fix in in the other
supposedly better way but with no luck because of the mess in
kernel's UAPI headers.

[1] http://lists.busybox.net/pipermail/buildroot/2016-May/161785.html
[2] http://lists.busybox.net/pipermail/buildroot/2016-June/162461.html

Still not sure if that works for every other architectures, so testing
and Acks from all interested parties are much appreciated.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Waldemar Brodkorb <wbx@openadk.org>
---
 package/jack2/0001-Add-support-for-nios2.patch     | 34 --------------
 .../jack2/0004-Add-check-for-the-NGREG-macro.patch | 52 ++++++++++++++++++++++
 2 files changed, 52 insertions(+), 34 deletions(-)
 delete mode 100644 package/jack2/0001-Add-support-for-nios2.patch
 create mode 100644 package/jack2/0004-Add-check-for-the-NGREG-macro.patch

diff --git a/package/jack2/0001-Add-support-for-nios2.patch b/package/jack2/0001-Add-support-for-nios2.patch
deleted file mode 100644
index f6d60af..0000000
--- a/package/jack2/0001-Add-support-for-nios2.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 3651f95d0433c84d2b67e30e68dd6140585535b0 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Tue, 19 Apr 2016 19:32:35 +0200
-Subject: [PATCH 1/1] Add support for nios2
-
-When compiling jack on nios2, compilation fails because NGREGS is not
-defined. Since this is only for debug output on segmentation faults, stub
-the debug print out like it's been done for other platforms before.
-
-Inspired by
-https://github.com/jackaudio/jack2/commit/d11bb095291d8880508c87adfe625bf2bcab1456
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Patch sent upstream: https://github.com/jackaudio/jack2/pull/199]
----
- dbus/sigsegv.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dbus/sigsegv.c b/dbus/sigsegv.c
-index 64c3986..ee12f91 100644
---- a/dbus/sigsegv.c
-+++ b/dbus/sigsegv.c
-@@ -104,7 +104,7 @@ static void signal_segv(int signum, siginfo_t* info, void*ptr) {
-     jack_error("info.si_errno = %d", info->si_errno);
-     jack_error("info.si_code  = %d (%s)", info->si_code, si_code_str);
-     jack_error("info.si_addr  = %p", info->si_addr);
--#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__)
-+#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__) && !defined(nios2)
-     for(i = 0; i < NGREG; i++)
-         jack_error("reg[%02d]       = 0x" REGFORMAT, i, 
- #if defined(__powerpc64__)
--- 
-2.8.0.rc3
-
diff --git a/package/jack2/0004-Add-check-for-the-NGREG-macro.patch b/package/jack2/0004-Add-check-for-the-NGREG-macro.patch
new file mode 100644
index 0000000..36190ce
--- /dev/null
+++ b/package/jack2/0004-Add-check-for-the-NGREG-macro.patch
@@ -0,0 +1,52 @@
+From 754205cfccc7b28732c2a952a14d1434b67eb074 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 23 May 2016 22:28:12 +0200
+Subject: [PATCH] Add check for the NGREG macro
+
+The NGREG macro is not available on all CPU architectures. Rather than
+making a long list of exclusions longer and longer, add a waf check to
+test for its functionality.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ dbus/sigsegv.c | 4 ++--
+ wscript        | 2 ++
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/dbus/sigsegv.c b/dbus/sigsegv.c
+index df2c42c..35c5151 100644
+--- a/dbus/sigsegv.c
++++ b/dbus/sigsegv.c
+@@ -106,7 +106,7 @@ static void signal_segv(int signum, siginfo_t* info, void*ptr) {
+     jack_error("info.si_errno = %d", info->si_errno);
+     jack_error("info.si_code  = %d (%s)", info->si_code, si_code_str);
+     jack_error("info.si_addr  = %p", info->si_addr);
+-#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__)
++#if HAVE_NGREG
+     for(i = 0; i < NGREG; i++)
+         jack_error("reg[%02d]       = 0x" REGFORMAT, i, 
+ #if defined(__powerpc64__)
+@@ -119,7 +119,7 @@ static void signal_segv(int signum, siginfo_t* info, void*ptr) {
+                 ucontext->uc_mcontext.gregs[i]
+ #endif
+                 );
+-#endif /* alpha, ia64, kFreeBSD, arm, hppa */
++#endif /* NGREG */
+ 
+ #if defined(SIGSEGV_STACK_X86) || defined(SIGSEGV_STACK_IA64)
+ # if defined(SIGSEGV_STACK_IA64)
+diff --git a/wscript b/wscript
+index 63ba3aa..a0838b0 100644
+--- a/wscript
++++ b/wscript
+@@ -168,6 +168,8 @@ def configure(conf):
+ 
+     conf.check_cc(header_name='execinfo.h', define_name="HAVE_EXECINFO_H", mandatory=False)
+     conf.check_cc(header_name='samplerate.h', define_name="HAVE_SAMPLERATE")
++    conf.check_cc(fragment="#include <ucontext.h>\nint main() { return NGREG; }\n",
++                  define_name="HAVE_NGREG", mandatory=False)
+ 
+     if conf.is_defined('HAVE_SAMPLERATE'):
+         conf.env['LIB_SAMPLERATE'] = ['samplerate']
+-- 
+2.7.4
-- 
2.6.3
