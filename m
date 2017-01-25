From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:05:20 +1300
Subject: [Buildroot] [git commit] jack2: fix NGREG build failures
Message-ID: <20170125100542.21AC7818F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cccaf5e046dedcda481e818752b07c6593cbeeb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit replaces the patch adding nios2 "support" to jack2 by a more
generic approach that solves the NGREG definition problem by using
proper checks in the waf script. This allows to remove the
architecture-specific compile time conditionals, and will solve build
failures on other architectures than just nios2.

Fixes:

  http://autobuild.buildroot.net/results/d15dc78cdd74b51b551512ce1ba88e4d61219e86/ (xtensa)
  http://autobuild.buildroot.net/results/8244e3fdda52d3f4f24d7199e8855c99a2a7b4b1/ (arc)
  http://autobuild.buildroot.net/results/badb9ec391f9f0438d593a2768f2f6c6a873c021/ (microblaze)

This commit has been built tested with all the external toolchains used
in the autobuilders.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jack2/0001-Add-support-for-nios2.patch     | 34 ---------
 .../jack2/0001-Improve-check-for-ucontext.patch    | 84 ++++++++++++++++++++++
 2 files changed, 84 insertions(+), 34 deletions(-)

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
diff --git a/package/jack2/0001-Improve-check-for-ucontext.patch b/package/jack2/0001-Improve-check-for-ucontext.patch
new file mode 100644
index 0000000..b8aa1da
--- /dev/null
+++ b/package/jack2/0001-Improve-check-for-ucontext.patch
@@ -0,0 +1,84 @@
+From ad79670d6d1e7ef2aad6935715921e5317cbe618 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 23 May 2016 22:28:12 +0200
+Subject: [PATCH] Improve check for ucontext
+
+The ucontext functionality is not available on all CPUs with all C
+libraries. Instead of making just assumptions based on the CPU
+architecture, this commit adds the necessary checks in wscript to verify
+the availability of the ucontext functionality, before using it in
+dbus/sigsegv.c.
+
+This avoids the long list of architecture exclusions, and make it more
+robust when building jack2 for new CPU architectures.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ dbus/sigsegv.c | 12 ++++++------
+ wscript        | 16 +++++++++++++++-
+ 2 files changed, 21 insertions(+), 7 deletions(-)
+
+diff --git a/dbus/sigsegv.c b/dbus/sigsegv.c
+index df2c42c..00a62b5 100644
+--- a/dbus/sigsegv.c
++++ b/dbus/sigsegv.c
+@@ -106,20 +106,20 @@ static void signal_segv(int signum, siginfo_t* info, void*ptr) {
+     jack_error("info.si_errno = %d", info->si_errno);
+     jack_error("info.si_code  = %d (%s)", info->si_code, si_code_str);
+     jack_error("info.si_addr  = %p", info->si_addr);
+-#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__)
++#if defined(HAVE_UCONTEXT) && defined(HAVE_NGREG)
+     for(i = 0; i < NGREG; i++)
+         jack_error("reg[%02d]       = 0x" REGFORMAT, i, 
+-#if defined(__powerpc64__)
++#if defined(HAVE_UCONTEXT_GP_REGS)
+                 ucontext->uc_mcontext.gp_regs[i]
+-#elif defined(__powerpc__)
++#elif defined(HAVE_UCONTEXT_UC_REGS)
+                 ucontext->uc_mcontext.uc_regs[i]
+-#elif defined(__sparc__) && defined(__arch64__)
++#elif defined(HAVE_UCONTEXT_MC_GREGS)
+                 ucontext->uc_mcontext.mc_gregs[i]
+-#else
++#elif defined(HAVE_UCONTEXT_GREGS)
+                 ucontext->uc_mcontext.gregs[i]
+ #endif
+                 );
+-#endif /* alpha, ia64, kFreeBSD, arm, hppa */
++#endif /* defined(HAVE_UCONTEXT) && defined(HAVE_NGREG) */
+ 
+ #if defined(SIGSEGV_STACK_X86) || defined(SIGSEGV_STACK_IA64)
+ # if defined(SIGSEGV_STACK_IA64)
+diff --git a/wscript b/wscript
+index 63ba3aa..34a56fc 100644
+--- a/wscript
++++ b/wscript
+@@ -168,10 +168,24 @@ def configure(conf):
+ 
+     conf.check_cc(header_name='execinfo.h', define_name="HAVE_EXECINFO_H", mandatory=False)
+     conf.check_cc(header_name='samplerate.h', define_name="HAVE_SAMPLERATE")
+-
+     if conf.is_defined('HAVE_SAMPLERATE'):
+         conf.env['LIB_SAMPLERATE'] = ['samplerate']
+ 
++    # test for the availability of ucontext, and how it should be used
++    for t in ("gp_regs", "uc_regs", "mc_gregs", "gregs"):
++        fragment = "#include <ucontext.h>\n"
++        fragment += "int main() { ucontext_t *ucontext; return (int) ucontext->uc_mcontext.%s[0]; }" % t
++        confvar = "HAVE_UCONTEXT_%s" % t.upper()
++        conf.check_cc(fragment=fragment, define_name=confvar, mandatory=False,
++                      msg="Checking for ucontext->uc_mcontext.%s" % t)
++        if conf.is_defined(confvar):
++            conf.define('HAVE_UCONTEXT', 1)
++
++    fragment = "#include <ucontext.h>\n"
++    fragment += "int main() { return NGREG; }"
++    conf.check_cc(fragment=fragment, define_name="HAVE_NGREG", mandatory=False,
++                  msg="Checking for NGREG")
++
+     conf.sub_config('example-clients')
+ 
+     if conf.check_cfg(package='celt', atleast_version='0.11.0', args='--cflags --libs', mandatory=False):
+-- 
+2.7.4
+
