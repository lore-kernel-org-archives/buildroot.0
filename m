Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732D3CA0EE4
	for <buildroot@archiver.kernel.org>; Sun, 17 Aug 2025 19:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C27C83E63;
	Sun, 17 Aug 2025 19:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcd2NglJSoO1; Sun, 17 Aug 2025 19:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47DF8843EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47DF8843EB;
	Sun, 17 Aug 2025 19:07:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6C0C75
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 19:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89B4B4108F
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 19:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhaSanSlFWJl for <buildroot@buildroot.org>;
 Sun, 17 Aug 2025 19:07:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8AB040EEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8AB040EEB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8AB040EEB
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 19:07:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id C12C44445A;
 Sun, 17 Aug 2025 19:07:03 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 17 Aug 2025 21:07:00 +0200
Message-ID: <20250817190701.1907290-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduhedtheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffdvvdfhudetteejvdeikeffkeelkeevffefveevvdeijeekiefhheduheeiveejnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpr
 hgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755457624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7ed+qqIZqYAcwKlAbT6AOh1q3nnnboRd/OF+Ck7RwCg=;
 b=IMcLbjcBeWn8b7lpuZebKd63k8kjqzUNNbwjhwTGO76Ma+ST3gxvYjTTqGvDn5NBReKOpm
 5fWbYsT2Y5C8tIzR2yzxtQ6Cc0icrcC/1IYBifltGIZZLkh2ZbRabHbUZjjus/Oi7aOz0E
 A5/s3m3k6EHcOjGVuUDNR9pCii+S5C22XzW6Jz7R6PY46VtyyDFbZSlKsn7C91IDoNYO56
 RxeOmu0cj8HBvGdUxTutfRBrWT28Zu6xMcCHCsdj11fx2+oPtBujRYvge2GHM5m9sQGeSV
 driRl1PlsBZes0k4QOLj92QEI18D6p1M6SbOX09lyITqt/yEn5PQ8sQ8G+7dBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IMcLbjcB
Subject: [Buildroot] [PATCH] package/binutils: add patches to fix gprofng
 build with GCC 15.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When BR2_BINUTILS_GPROFNG=y, the build currently fails with GCC 15.x,
of course on architectures for which gprofng is actually
available. This issue only exists in binutils 2.42 and 2.43.1, as
binutils 2.44 has the necessary fixes.

Therefore, this commit backports the relevant commits from binutils
2.44 to 2.43.1 and 2.42.

Fixes:

  https://autobuild.buildroot.net/results/7cf52019f87625c73ef3c4ca0b6270e20a4ab768/ (binutils 2.42)
  https://autobuild.buildroot.net/results/478e24af1a03dea5ec64b77ca611b4f7225c9d39/ (binutils 2.43.1)

The following defconfig, built under a Fedora 42 Docker container
allows to reproduce the issue:

 BR2_x86_nehalem=y
 BR2_BINUTILS_VERSION_2_42_X=y
 BR2_BINUTILS_GPROFNG=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 # BR2_TARGET_ROOTFS_TAR is not set

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ngs-when-building-gprofng-with-Clang.patch | 770 +++++++++++++++++
 ...gnu23-compatibility-wrt-unprototyped.patch | 619 ++++++++++++++
 ...007-gprofng-fix-build-with-std-gnu23.patch | 199 +++++
 ...ngs-when-building-gprofng-with-Clang.patch | 801 ++++++++++++++++++
 ...gnu23-compatibility-wrt-unprototyped.patch | 619 ++++++++++++++
 ...007-gprofng-fix-build-with-std-gnu23.patch | 199 +++++
 6 files changed, 3207 insertions(+)
 create mode 100644 package/binutils/2.42/0005-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch
 create mode 100644 package/binutils/2.42/0006-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch
 create mode 100644 package/binutils/2.42/0007-gprofng-fix-build-with-std-gnu23.patch
 create mode 100644 package/binutils/2.43.1/0005-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch
 create mode 100644 package/binutils/2.43.1/0006-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch
 create mode 100644 package/binutils/2.43.1/0007-gprofng-fix-build-with-std-gnu23.patch

diff --git a/package/binutils/2.42/0005-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch b/package/binutils/2.42/0005-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch
new file mode 100644
index 0000000000..2f75861434
--- /dev/null
+++ b/package/binutils/2.42/0005-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch
@@ -0,0 +1,770 @@
+From 0cec0418dacd30f4215d0d778b4e5d23f6a93801 Mon Sep 17 00:00:00 2001
+From: Vladimir Mezentsev <vladimir.mezentsev@oracle.com>
+Date: Tue, 3 Sep 2024 21:30:31 -0700
+Subject: [PATCH] Fix 32097 Warnings when building gprofng with Clang
+
+gprofng/ChangeLog
+2024-09-03  Vladimir Mezentsev  <vladimir.mezentsev@oracle.com>.
+
+	PR gprofng/32097
+	* common/hwcdrv.c: Fix -Wempty-body warnings.
+	* common/hwcentry.h: Fix -Wdeprecated-non-prototype warnings.
+	* common/hwctable.c: Fix -Wdeprecated-non-prototype warnings.
+	* libcollector/collector.c: Likewise.
+	* libcollector/collector.h: Likewise.
+	* libcollector/collectorAPI.c: Likewise.
+	* libcollector/dispatcher.c: Likewise.
+	* libcollector/iotrace.c: Likewise.
+	* libcollector/libcol_util.c: Fix -Wunused-but-set-variable warnings.
+	* libcollector/libcol_util.h: Remove unused declarations.
+	* libcollector/linetrace.c: Fix -Wdeprecated-non-prototype warnings.
+	* src/BaseMetricTreeNode.h: Fix -Wunused-private-field warnings.
+	* src/Dbe.cc: Fix -Wself-assign warnings.
+	* src/DbeSession.cc: Fix -Wunused-but-set-variable warnings.
+	* src/Disasm.cc: Fix -Wunused-const-variable warnings.
+	* src/Experiment.cc: Fix -Wunused-private-field warnings.
+	* src/HashMap.h: Fix -Wself-assign warnings.
+	* src/IOActivity.h: Fix -Wunused-private-field warnings.
+	* src/collctrl.cc: Fix -Wself-assign, -Wparentheses-equality warnings.
+	* src/collctrl.h: Fix -Wunused-private-field warnings.
+	* src/collector_module.h: Fix -Wdeprecated-non-prototype warnings.
+	* src/gp-display-src.cc: Fix -Wunused-private-field warnings.
+	* src/gp-print.h: Fix -Wheader-guard warnings.
+	* src/hwc_intel_icelake.h: Fix -Winitializer-overrides warnings.
+	* src/util.cc: Fix -Wunused-but-set-variable warnings.
+
+Upstream: b79c457ca01df82dbe1facb708e45def4584c903
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ gprofng/common/hwcdrv.c             |  3 ++-
+ gprofng/common/hwcentry.h           |  7 +----
+ gprofng/common/hwctable.c           | 13 +---------
+ gprofng/libcollector/collector.c    | 15 ++++-------
+ gprofng/libcollector/collector.h    |  2 +-
+ gprofng/libcollector/collectorAPI.c | 15 ++++++-----
+ gprofng/libcollector/dispatcher.c   | 19 ++++++++------
+ gprofng/libcollector/iotrace.c      | 12 ++++-----
+ gprofng/libcollector/libcol_util.c  |  2 --
+ gprofng/libcollector/libcol_util.h  |  6 -----
+ gprofng/libcollector/linetrace.c    | 40 +++++++++++++++++------------
+ gprofng/src/BaseMetricTreeNode.h    |  1 -
+ gprofng/src/Dbe.cc                  | 12 ++++-----
+ gprofng/src/DbeSession.cc           |  3 ---
+ gprofng/src/Disasm.cc               |  1 -
+ gprofng/src/Experiment.cc           |  2 --
+ gprofng/src/HashMap.h               |  3 +--
+ gprofng/src/IOActivity.h            |  1 -
+ gprofng/src/collctrl.cc             | 14 +++++-----
+ gprofng/src/collector_module.h      | 20 +++++++--------
+ gprofng/src/gp-display-src.cc       |  8 ------
+ gprofng/src/gp-print.h              |  2 +-
+ gprofng/src/util.cc                 | 10 +++-----
+ 23 files changed, 84 insertions(+), 127 deletions(-)
+
+diff --git a/gprofng/common/hwcdrv.c b/gprofng/common/hwcdrv.c
+index 2d549b0d6a5..fa1ad32430b 100644
+--- a/gprofng/common/hwcdrv.c
++++ b/gprofng/common/hwcdrv.c
+@@ -650,6 +650,7 @@ read_sample (counter_state_t *ctr_state, int msgsz, uint64_t *rvalue,
+ static void
+ dump_perf_event_attr (struct perf_event_attr *at)
+ {
++#if defined(DEBUG)
+   TprintfT (DBG_LT2, "dump_perf_event_attr:  size=%d  type=%d  sample_period=%lld\n"
+ 	    "  config=0x%llx  config1=0x%llx  config2=0x%llx  wakeup_events=%lld __reserved_1=%lld\n",
+ 	    (int) at->size, (int) at->type, (unsigned long long) at->sample_period,
+@@ -665,13 +666,13 @@ dump_perf_event_attr (struct perf_event_attr *at)
+   DUMP_F (exclude_kernel);
+   DUMP_F (exclude_hv);
+   DUMP_F (exclude_idle);
+-  //    DUMP_F(xmmap);
+   DUMP_F (comm);
+   DUMP_F (freq);
+   DUMP_F (inherit_stat);
+   DUMP_F (enable_on_exec);
+   DUMP_F (task);
+   DUMP_F (watermark);
++#endif
+ }
+ 
+ static void
+diff --git a/gprofng/common/hwcentry.h b/gprofng/common/hwcentry.h
+index a35a363e693..7899875cf96 100644
+--- a/gprofng/common/hwcentry.h
++++ b/gprofng/common/hwcentry.h
+@@ -202,17 +202,12 @@ extern "C"
+   extern char *hwc_get_docref (char *buf, size_t buflen);
+   /* Return a CPU HWC document reference, or NULL. */
+ 
+-  // TBR
+-  extern char *hwc_get_default_cntrs ();
+-  /* Return a default HW counter string; may be NULL, or zero-length */
+-  /* NULL means none is defined in the table; or zero-length means string defined could not be loaded */
+-
+   extern char *hwc_get_default_cntrs2 (int forKernel, int style);
+   /* like hwc_get_default_cntrs() for style==1 */
+   /* but allows other styles of formatting as well */
+   /* deprecate and eventually remove hwc_get_default_cntrs() */
+ 
+-  extern char *hwc_get_orig_default_cntrs ();
++  extern char *hwc_get_orig_default_cntrs (int forKernel);
+   /* Get the default HW counter string as set in the table */
+   /* NULL means none is defined in the table */
+ 
+diff --git a/gprofng/common/hwctable.c b/gprofng/common/hwctable.c
+index d0735132fac..fe9153190e7 100644
+--- a/gprofng/common/hwctable.c
++++ b/gprofng/common/hwctable.c
+@@ -3231,7 +3231,7 @@ check_tables ()
+ }
+ #endif
+ 
+-static int try_a_counter ();
++static int try_a_counter (int forKernel);
+ static void hwc_process_raw_ctrs (int forKernel, Hwcentry ***pstd_out,
+ 				  Hwcentry ***praw_out, Hwcentry ***phidden_out,
+ 				  Hwcentry**static_tables,
+@@ -4321,17 +4321,6 @@ hwc_get_docref (char *buf, size_t buflen)
+   return buf;
+ }
+ 
+-//TBR:
+-
+-extern char*
+-hwc_get_default_cntrs ()
+-{
+-  setup_cpcx ();
+-  if (cpcx_default_hwcs[0] != NULL)
+-    return strdup (cpcx_default_hwcs[0]); // TBR deprecate this
+-  return NULL;
+-}
+-
+ extern char*
+ hwc_get_default_cntrs2 (int forKernel, int style)
+ {
+diff --git a/gprofng/libcollector/collector.c b/gprofng/libcollector/collector.c
+index 39529758600..ef580dcbdd9 100644
+--- a/gprofng/libcollector/collector.c
++++ b/gprofng/libcollector/collector.c
+@@ -210,15 +210,10 @@ get_collector_interface ()
+ static void
+ collector_module_init (CollectorInterface *col_intf)
+ {
+-  int nmodules = 0;
+-
+   ModuleInitFunc next_init = (ModuleInitFunc) dlsym (RTLD_DEFAULT, "__collector_module_init");
+   if (next_init != NULL)
+-    {
+-      nmodules++;
+-      next_init (col_intf);
+-    }
+-  TprintfT (DBG_LT1, "collector_module_init: %d modules\n", nmodules);
++    next_init (col_intf);
++  TprintfT (DBG_LT1, "collector_module_init: %d modules\n", next_init ? 1 : 0);
+ }
+ 
+ /*   Routines concerned with general experiment start and stop */
+@@ -1784,7 +1779,7 @@ __collector_pause ()
+ }
+ 
+ void
+-__collector_pause_m (char *reason)
++__collector_pause_m (const char *reason)
+ {
+   hrtime_t now;
+   char xreason[MAXPATHLEN];
+@@ -2451,8 +2446,8 @@ __collector_dlog (int tflag, int level, char *format, ...)
+ 
+ static void (*__real__exit) (int status) = NULL; /* libc only: _exit */
+ static void (*__real__Exit) (int status) = NULL; /* libc only: _Exit */
+-void _exit () __attribute__ ((weak, alias ("__collector_exit")));
+-void _Exit () __attribute__ ((weak, alias ("__collector_Exit")));
++void _exit (int status) __attribute__ ((weak, alias ("__collector_exit")));
++void _Exit (int status) __attribute__ ((weak, alias ("__collector_Exit")));
+ 
+ void
+ __collector_exit (int status)
+diff --git a/gprofng/libcollector/collector.h b/gprofng/libcollector/collector.h
+index 07a03bdd17a..eda68a0e4f5 100644
+--- a/gprofng/libcollector/collector.h
++++ b/gprofng/libcollector/collector.h
+@@ -123,7 +123,7 @@ extern void __collector_terminate_expt ();
+ extern void __collector_terminate_hook ();
+ extern void __collector_sample (char *name);
+ extern void __collector_pause ();
+-extern void __collector_pause_m ();
++extern void __collector_pause_m (const char *reason);
+ extern void __collector_resume ();
+ extern int collector_sigemt_sigaction (const struct sigaction*,
+ 				       struct sigaction*);
+diff --git a/gprofng/libcollector/collectorAPI.c b/gprofng/libcollector/collectorAPI.c
+index 5fa6403ad49..449bbbaab65 100644
+--- a/gprofng/libcollector/collectorAPI.c
++++ b/gprofng/libcollector/collectorAPI.c
+@@ -26,16 +26,17 @@
+ #include "collectorAPI.h"
+ #include "gp-experiment.h"
+ 
+-static void *__real_collector_sample = NULL;
+-static void *__real_collector_pause = NULL;
+-static void *__real_collector_resume = NULL;
+-static void *__real_collector_terminate_expt = NULL;
+-static void *__real_collector_func_load = NULL;
+-static void *__real_collector_func_unload = NULL;
++static void (*__real_collector_sample)(const char *) = NULL;
++static void (*__real_collector_pause)() = NULL;
++static void (*__real_collector_resume)() = NULL;
++static void (*__real_collector_terminate_expt)() = NULL;
++static void (*__real_collector_func_load)(const char *, const char *,
++		const char *, void *, int, int, Lineno *) = NULL;
++static void (*__real_collector_func_unload)(void *) = NULL;
+ 
+ #define INIT_API        if (init_API == 0) collectorAPI_initAPI()
+ #define NULL_PTR(x)     (__real_##x == NULL)
+-#define CALL_REAL(x)    (*(void(*)())__real_##x)
++#define CALL_REAL(x)    (__real_##x)
+ #define CALL_IF_REAL(x) INIT_API; if (!NULL_PTR(x)) CALL_REAL(x)
+ 
+ static int init_API = 0;
+diff --git a/gprofng/libcollector/dispatcher.c b/gprofng/libcollector/dispatcher.c
+index d2a4ad0b60b..867753a22ec 100644
+--- a/gprofng/libcollector/dispatcher.c
++++ b/gprofng/libcollector/dispatcher.c
+@@ -909,8 +909,9 @@ sigset (int sig, sighandler_t handler)
+ 
+ // map interposed symbol versions
+ static int
+-gprofng_timer_create (int (real_func) (), clockid_t clockid,
+-                      struct sigevent *sevp, timer_t *timerid)
++gprofng_timer_create (int (real_func) (clockid_t, struct sigevent *, timer_t *),
++		      clockid_t clockid,
++		      struct sigevent *sevp, timer_t *timerid)
+ {
+   // collector reserves SIGPROF
+   if (sevp == NULL || sevp->sigev_notify != SIGEV_SIGNAL ||
+@@ -1045,7 +1046,7 @@ __collector_thr_sigsetmask (int how, const sigset_t* iset, sigset_t* oset)
+ // map interposed symbol versions
+ 
+ static int
+-gprofng_pthread_sigmask (int (real_func) (),
++gprofng_pthread_sigmask (int (real_func) (int, const sigset_t *, sigset_t*),
+                          int how, const sigset_t *iset, sigset_t* oset)
+ {
+   sigset_t lsigset;
+@@ -1140,9 +1141,10 @@ collector_root (void *cargs)
+ // map interposed symbol versions
+ 
+ static int
+-gprofng_pthread_create (int (real_func) (), pthread_t *thread,
+-                        const pthread_attr_t *attr,
+-                        void *(*func)(void*), void *arg)
++gprofng_pthread_create (int (real_func) (pthread_t *, const pthread_attr_t *,
++					 void *(*)(void *), void *),
++			pthread_t *thread, const pthread_attr_t *attr,
++			void *(*func)(void*), void *arg)
+ {
+   TprintfT (DBG_LTT, "gprofng_pthread_create @%p\n", real_func);
+   if (dispatch_mode != DISPATCH_ON)
+@@ -1277,6 +1279,7 @@ __collector_ext_clone_pthread (int (*fn)(void *), void *child_stack, int flags,
+ }
+ 
+ // weak symbols:
+-int sigprocmask () __attribute__ ((weak, alias ("__collector_sigprocmask")));
+-int thr_sigsetmask () __attribute__ ((weak, alias ("__collector_thr_sigsetmask")));
++int sigprocmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_sigprocmask")));
++int thr_sigsetmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_thr_sigsetmask")));
+ int setitimer () __attribute__ ((weak, alias ("_setitimer")));
++
+diff --git a/gprofng/libcollector/iotrace.c b/gprofng/libcollector/iotrace.c
+index 18060864796..3deb441d9c7 100644
+--- a/gprofng/libcollector/iotrace.c
++++ b/gprofng/libcollector/iotrace.c
+@@ -1350,7 +1350,7 @@ mkstemp (char *template)
+   unsigned pktSize;
+   if (NULL_PTR (mkstemp))
+     init_io_intf ();
+-  if (CHCK_REENTRANCE (guard) || template == NULL)
++  if (CHCK_REENTRANCE (guard))
+     return CALL_REAL (mkstemp)(template);
+   PUSH_REENTRANCE (guard);
+   hrtime_t reqt = gethrtime ();
+@@ -1405,7 +1405,7 @@ mkstemps (char *template, int slen)
+   unsigned pktSize;
+   if (NULL_PTR (mkstemps))
+     init_io_intf ();
+-  if (CHCK_REENTRANCE (guard) || template == NULL)
++  if (CHCK_REENTRANCE (guard))
+     return CALL_REAL (mkstemps)(template, slen);
+   PUSH_REENTRANCE (guard);
+   hrtime_t reqt = gethrtime ();
+@@ -1485,7 +1485,7 @@ close (int fildes)
+ 
+ /*------------------------------------------------------------- fopen */
+ static FILE*
+-gprofng_fopen (FILE*(real_fopen) (), const char *filename, const char *mode)
++gprofng_fopen (FILE*(real_fopen) (const char *, const char *), const char *filename, const char *mode)
+ {
+   int *guard;
+   FILE *fp = NULL;
+@@ -1559,7 +1559,7 @@ DCL_FOPEN (fopen)
+ 
+ /*------------------------------------------------------------- fclose */
+ static int
+-gprofng_fclose (int(real_fclose) (), FILE *stream)
++gprofng_fclose (int(real_fclose) (FILE *), FILE *stream)
+ {
+   int *guard;
+   int stat;
+@@ -1645,7 +1645,7 @@ fflush (FILE *stream)
+ 
+ /*------------------------------------------------------------- fdopen */
+ static FILE*
+-gprofng_fdopen (FILE*(real_fdopen) (), int fildes, const char *mode)
++gprofng_fdopen (FILE*(real_fdopen) (int, const char *), int fildes, const char *mode)
+ {
+   int *guard;
+   FILE *fp = NULL;
+@@ -2957,7 +2957,7 @@ DCL_FGETPOS (fgetpos)
+ 
+ /*------------------------------------------------------------- fgetpos64 */
+ static int
+-gprofng_fgetpos64 (int(real_fgetpos64) (), FILE *stream, fpos64_t *pos)
++gprofng_fgetpos64 (int(real_fgetpos64) (FILE *, fpos64_t *), FILE *stream, fpos64_t *pos)
+ {
+   int *guard;
+   int ret;
+diff --git a/gprofng/libcollector/libcol_util.c b/gprofng/libcollector/libcol_util.c
+index 15ba24d2ab5..c2b82894e6b 100644
+--- a/gprofng/libcollector/libcol_util.c
++++ b/gprofng/libcollector/libcol_util.c
+@@ -1013,7 +1013,6 @@ __collector_open (const char *path, int oflag, ...)
+   mode_t mode = 0;
+ 
+   hrtime_t t_timeout = __collector_gethrtime () + 5 * ((hrtime_t) NANOSEC);
+-  int nretries = 0;
+   long long delay = 100; /* start at some small, arbitrary value */
+ 
+   /* get optional mode argument if it's expected/required */
+@@ -1058,7 +1057,6 @@ __collector_open (const char *path, int oflag, ...)
+       delay *= 2;
+       if (delay > 100000000)
+ 	delay = 100000000; /* cap at some large, arbitrary value */
+-      nretries++;
+     }
+   return fd;
+ }
+diff --git a/gprofng/libcollector/libcol_util.h b/gprofng/libcollector/libcol_util.h
+index 2eeeaeed50b..1b1b928180a 100644
+--- a/gprofng/libcollector/libcol_util.h
++++ b/gprofng/libcollector/libcol_util.h
+@@ -81,12 +81,6 @@ extern int __collector_mutex_trylock (collector_mutex_t *mp);
+ #define __collector_mutex_init(xx) \
+   do { collector_mutex_t tmp=COLLECTOR_MUTEX_INITIALIZER; *(xx)=tmp; } while(0)
+ 
+-void __collector_sample (char *name);
+-void __collector_terminate_expt ();
+-void __collector_pause ();
+-void __collector_pause_m ();
+-void __collector_resume ();
+-
+ struct DT_lineno;
+ 
+ typedef enum
+diff --git a/gprofng/libcollector/linetrace.c b/gprofng/libcollector/linetrace.c
+index 67b2d7e9030..66844bc1337 100644
+--- a/gprofng/libcollector/linetrace.c
++++ b/gprofng/libcollector/linetrace.c
+@@ -1207,7 +1207,7 @@ __collector_vfork (void)
+ }
+ 
+ /*------------------------------------------------------------- execve */
+-int execve () __attribute__ ((weak, alias ("__collector_execve")));
++int execve (const char *, char *const [], char *const []) __attribute__ ((weak, alias ("__collector_execve")));
+ 
+ int
+ __collector_execve (const char* path, char *const argv[], char *const envp[])
+@@ -1237,7 +1237,7 @@ __collector_execve (const char* path, char *const argv[], char *const envp[])
+   return ret;
+ }
+ 
+-int execvp () __attribute__ ((weak, alias ("__collector_execvp")));
++int execvp (const char *, char *const []) __attribute__ ((weak, alias ("__collector_execvp")));
+ 
+ int
+ __collector_execvp (const char* file, char *const argv[])
+@@ -1269,7 +1269,7 @@ __collector_execvp (const char* file, char *const argv[])
+   return ret;
+ }
+ 
+-int execv () __attribute__ ((weak, alias ("__collector_execv")));
++int execv (const char *, char *const []) __attribute__ ((weak, alias ("__collector_execv")));
+ 
+ int
+ __collector_execv (const char* path, char *const argv[])
+@@ -1408,7 +1408,10 @@ __collector_execl (const char* path, const char *arg0, ...)
+ /*-------------------------------------------------------- posix_spawn */
+ // map interposed symbol versions
+ static int
+-gprofng_posix_spawn (int(real_posix_spawn) (),
++gprofng_posix_spawn (int(real_posix_spawn) (pid_t *, const char *,
++				const posix_spawn_file_actions_t *,
++				const posix_spawnattr_t *,
++				char *const [], char *const []),
+ 		     pid_t *pidp, const char *path,
+ 		     const posix_spawn_file_actions_t *file_actions,
+ 		     const posix_spawnattr_t *attrp,
+@@ -1466,7 +1469,10 @@ DCL_POSIX_SPAWN (posix_spawn)
+ 
+ /*-------------------------------------------------------- posix_spawnp */
+ static int
+-gprofng_posix_spawnp (int (real_posix_spawnp) (),
++gprofng_posix_spawnp (int (real_posix_spawnp) (pid_t *, const char *,
++				const posix_spawn_file_actions_t *,
++				const posix_spawnattr_t *,
++				char *const [], char *const []),
+                       pid_t *pidp, const char *path,
+                       const posix_spawn_file_actions_t *file_actions,
+                       const posix_spawnattr_t *attrp,
+@@ -1754,8 +1760,8 @@ __collector_clone (int (*fn)(void *), void *child_stack, int flags, void *arg,
+ }
+ 
+ /*-------------------------------------------------------------------- setuid */
+-int setuid () __attribute__ ((weak, alias ("__collector_setuid")));
+-int _setuid () __attribute__ ((weak, alias ("__collector_setuid")));
++int setuid (uid_t) __attribute__ ((weak, alias ("__collector_setuid")));
++int _setuid (uid_t) __attribute__ ((weak, alias ("__collector_setuid")));
+ 
+ int
+ __collector_setuid (uid_t ruid)
+@@ -1770,8 +1776,8 @@ __collector_setuid (uid_t ruid)
+ }
+ 
+ /*------------------------------------------------------------------- seteuid */
+-int seteuid () __attribute__ ((weak, alias ("__collector_seteuid")));
+-int _seteuid () __attribute__ ((weak, alias ("__collector_seteuid")));
++int seteuid (uid_t) __attribute__ ((weak, alias ("__collector_seteuid")));
++int _seteuid (uid_t) __attribute__ ((weak, alias ("__collector_seteuid")));
+ 
+ int
+ __collector_seteuid (uid_t euid)
+@@ -1786,8 +1792,8 @@ __collector_seteuid (uid_t euid)
+ }
+ 
+ /*------------------------------------------------------------------ setreuid */
+-int setreuid () __attribute__ ((weak, alias ("__collector_setreuid")));
+-int _setreuid () __attribute__ ((weak, alias ("__collector_setreuid")));
++int setreuid (uid_t, uid_t) __attribute__ ((weak, alias ("__collector_setreuid")));
++int _setreuid (uid_t, uid_t) __attribute__ ((weak, alias ("__collector_setreuid")));
+ 
+ int
+ __collector_setreuid (uid_t ruid, uid_t euid)
+@@ -1802,8 +1808,8 @@ __collector_setreuid (uid_t ruid, uid_t euid)
+ }
+ 
+ /*-------------------------------------------------------------------- setgid */
+-int setgid () __attribute__ ((weak, alias ("__collector_setgid")));
+-int _setgid () __attribute__ ((weak, alias ("__collector_setgid")));
++int setgid (gid_t) __attribute__ ((weak, alias ("__collector_setgid")));
++int _setgid (gid_t) __attribute__ ((weak, alias ("__collector_setgid")));
+ 
+ int
+ __collector_setgid (gid_t rgid)
+@@ -1818,8 +1824,8 @@ __collector_setgid (gid_t rgid)
+ }
+ 
+ /*------------------------------------------------------------------- setegid */
+-int setegid () __attribute__ ((weak, alias ("__collector_setegid")));
+-int _setegid () __attribute__ ((weak, alias ("__collector_setegid")));
++int setegid (gid_t) __attribute__ ((weak, alias ("__collector_setegid")));
++int _setegid (gid_t) __attribute__ ((weak, alias ("__collector_setegid")));
+ 
+ int
+ __collector_setegid (gid_t egid)
+@@ -1834,8 +1840,8 @@ __collector_setegid (gid_t egid)
+ }
+ 
+ /*------------------------------------------------------------------ setregid */
+-int setregid () __attribute__ ((weak, alias ("__collector_setregid")));
+-int _setregid () __attribute__ ((weak, alias ("__collector_setregid")));
++int setregid (gid_t, gid_t) __attribute__ ((weak, alias ("__collector_setregid")));
++int _setregid (gid_t, gid_t) __attribute__ ((weak, alias ("__collector_setregid")));
+ 
+ int
+ __collector_setregid (gid_t rgid, gid_t egid)
+diff --git a/gprofng/src/BaseMetricTreeNode.h b/gprofng/src/BaseMetricTreeNode.h
+index d73d244e27e..7698f9c6eaf 100644
+--- a/gprofng/src/BaseMetricTreeNode.h
++++ b/gprofng/src/BaseMetricTreeNode.h
+@@ -85,7 +85,6 @@ private:
+ 
+   BaseMetricTreeNode *root;     // root of tree
+   BaseMetricTreeNode *parent;   // my parent
+-  bool aggregation;             // value is based on children's values
+   char *name;           // bm->get_cmd() for metrics, unique string otherwise
+   char *uname;                  // user-visible text
+   char *unit;                   // see UNIT_* defines
+diff --git a/gprofng/src/Dbe.cc b/gprofng/src/Dbe.cc
+index 91a5aa5ef05..bcbf4694565 100644
+--- a/gprofng/src/Dbe.cc
++++ b/gprofng/src/Dbe.cc
+@@ -9594,14 +9594,12 @@ dbeGetTLDataRepVals (VMode view_mode, hrtime_t start_ts, hrtime_t delta,
+ 	}
+       if (sampleVals != NULL)
+ 	{
+-	  Sample* sample = (Sample*) packets->getObjValue (PROP_SMPLOBJ, packetIdx);
+-	  if (!sample || !sample->get_usage ())
+-	    sample = sample;
+-	  else
++	  Sample *sample = (Sample*) packets->getObjValue (PROP_SMPLOBJ, packetIdx);
++	  if (sample != NULL)
+ 	    {
+-	      PrUsage* prusage = sample->get_usage ();
+-	      Vector<long long> *mstateVals = prusage->getMstateValues ();
+-	      sampleVals->store (eventIdx, mstateVals);
++	      PrUsage *prusage = sample->get_usage ();
++	      if (prusage != NULL)
++		sampleVals->store (eventIdx, prusage->getMstateValues ());
+ 	    }
+ 	}
+     }
+diff --git a/gprofng/src/DbeSession.cc b/gprofng/src/DbeSession.cc
+index 20329091167..5d6bab75638 100644
+--- a/gprofng/src/DbeSession.cc
++++ b/gprofng/src/DbeSession.cc
+@@ -1162,8 +1162,6 @@ DbeSession::open_experiment (Experiment *exp, char *path)
+   closedir (exp_dir);
+   exp_names->sort (dir_name_cmp);
+   Experiment **t_exp_list = new Experiment *[exp_names->size ()];
+-  int nsubexps = 0;
+-
+   for (int j = 0, jsz = exp_names->size (); j < jsz; j++)
+     {
+       t_exp_list[j] = NULL;
+@@ -1220,7 +1218,6 @@ DbeSession::open_experiment (Experiment *exp, char *path)
+ 	dexp->open (dpath);
+       append (dexp);
+       t_exp_list[j] = dexp;
+-      nsubexps++;
+       dexp->set_clock (exp->clock);
+ 
+       // DbeView add_experiment() is split into two parts
+diff --git a/gprofng/src/Disasm.cc b/gprofng/src/Disasm.cc
+index 1396e4fb072..d78212cee39 100644
+--- a/gprofng/src/Disasm.cc
++++ b/gprofng/src/Disasm.cc
+@@ -49,7 +49,6 @@ struct DisContext
+ };
+ 
+ static const int MAX_DISASM_STR     = 2048;
+-static const int MAX_INSTR_SIZE     = 8;
+ 
+ Disasm::Disasm (char *fname)
+ {
+diff --git a/gprofng/src/Experiment.cc b/gprofng/src/Experiment.cc
+index 02a24ebc40d..a31550aff66 100644
+--- a/gprofng/src/Experiment.cc
++++ b/gprofng/src/Experiment.cc
+@@ -1935,8 +1935,6 @@ private:
+   }
+ 
+   Experiment *exp;
+-  char *hostname;
+-  hrtime_t time, tstamp;
+ };
+ 
+ void
+diff --git a/gprofng/src/HashMap.h b/gprofng/src/HashMap.h
+index 918c0dc95f9..c5fdd345ba8 100644
+--- a/gprofng/src/HashMap.h
++++ b/gprofng/src/HashMap.h
+@@ -78,9 +78,8 @@ copy_key (uint64_t a)
+ }
+ 
+ template<> inline void
+-delete_key (uint64_t a)
++delete_key (uint64_t)
+ {
+-  a = a;
+ }
+ 
+ template<> inline int
+diff --git a/gprofng/src/IOActivity.h b/gprofng/src/IOActivity.h
+index cf462cf8d55..f3a22ada6b1 100644
+--- a/gprofng/src/IOActivity.h
++++ b/gprofng/src/IOActivity.h
+@@ -78,7 +78,6 @@ private:
+   Hist_data *hist_data_file_all;
+   Hist_data *hist_data_vfd_all;
+   Hist_data *hist_data_callstack_all;
+-  Hist_data *hist_data_callstack;
+ 
+   DbeView *dbev;
+ };
+diff --git a/gprofng/src/collctrl.cc b/gprofng/src/collctrl.cc
+index ebf888c5a20..b0ed66efcdc 100644
+--- a/gprofng/src/collctrl.cc
++++ b/gprofng/src/collctrl.cc
+@@ -952,9 +952,7 @@ Coll_Ctrl::set_clkprof (const char *string, char** warn)
+       double dval = strtod (string, &endchar);
+       if (*endchar == 'm' || *endchar == 0) /* user specified milliseconds */
+ 	dval = dval * 1000.;
+-      else if (*endchar == 'u')     /* user specified microseconds */
+-	dval = dval;
+-      else
++      else if (*endchar != 'u')
+ 	return dbe_sprintf (GTXT ("Unrecognized clock-profiling interval `%s'\n"), string);
+       nclkprof_timer = (int) (dval + 0.5);
+     }
+@@ -2901,7 +2899,7 @@ Coll_Ctrl::get (char * control)
+     }
+   if (!strncmp (control, ipc_str_javaprof, len))
+     {
+-      if ((java_mode == 0))
++      if (java_mode == 0)
+ 	return strdup (ipc_str_off);
+       return strdup (ipc_str_on);
+     }
+@@ -2917,7 +2915,7 @@ Coll_Ctrl::get (char * control)
+     }
+   if (!strncmp (control, ipc_str_sample_sig, len))
+     {
+-      if ((sample_sig == 0))
++      if (sample_sig == 0)
+ 	return strdup (ipc_str_off);
+       char *str_signal = find_signal_name (sample_sig);
+       if (str_signal != NULL)
+@@ -2951,15 +2949,15 @@ Coll_Ctrl::get (char * control)
+     }
+   if (!strncmp (control, ipc_str_iotrace, len))
+     {
+-      if ((iotrace_enabled == 0))
++      if (iotrace_enabled == 0)
+ 	return strdup (ipc_str_off);
+       return strdup (ipc_str_on);
+     }
+   if (!strncmp (control, ipc_str_count, len))
+     {
+-      if ((count_enabled == 0))
++      if (count_enabled == 0)
+ 	return strdup (ipc_str_off);
+-      if ((count_enabled < 0))
++      if (count_enabled < 0)
+ 	return strdup ("on\nstatic");
+       return strdup (ipc_str_on);
+     }
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index bb48eadb9f8..ebcdbca561f 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -40,12 +40,12 @@ struct tm;
+  * If you add any, please put it in the right place */
+ typedef struct CollectorUtilFuncs
+ {
+-  int (*access)();
++  int (*access)(const char *, int);
+   int (*atoi)(const char *nptr);
+   void *(*calloc)(size_t nelem, size_t elsize);
+   int (*clearenv)(void);
+   int (*close)(int);
+-  int (*closedir)();
++  int (*closedir)(DIR *);
+   int (*execv)(const char *path, char *const argv[]);
+   void (*exit)(int status);
+   int (*fclose)(FILE *stream);
+@@ -66,20 +66,20 @@ typedef struct CollectorUtilFuncs
+   off_t (*lseek)(int fd, off_t offset, int whence);
+   void *(*malloc)(size_t size);
+   void *(*memset)(void *s1, int c, size_t n);
+-  int (*mkdir)();
++  int (*mkdir)(const char *, mode_t);
+   time_t (*mktime)(struct tm *timeptr);
+   void *(*mmap)(void *, size_t, int, int, int, off_t);
+-  void *(*mmap64_)();
+-  int (*munmap)();
++  void *(*mmap64_)(void *, size_t, int, int, int, off_t);
++  int (*munmap)(void *, size_t);
+   int (*open)(const char *, int, ...);
+   int (*open_bare)(const char *, int, ...);
+-  DIR *(*opendir)();
++  DIR *(*opendir)(const char *);
+   int (*pclose)(FILE *stream);
+   FILE *(*popen)(const char *command, const char *mode);
+   int (*putenv)(char *string);
+-  ssize_t (*pwrite)();
+-  ssize_t (*pwrite64_)();
+-  ssize_t (*read)();
++  ssize_t (*pwrite)(int, const void *, size_t, off_t);
++  ssize_t (*pwrite64_)(int, const void *, size_t, off_t);
++  ssize_t (*read)(int, void *, size_t);
+   int (*setenv)(const char *name, const char *value, int overwrite);
+   int (*sigfillset)(sigset_t *set);
+   int (*sigprocmask)(int how, const sigset_t *set, sigset_t *oldset);
+@@ -112,7 +112,7 @@ typedef struct CollectorUtilFuncs
+   int (*unsetenv)(const char *name);
+   int (*vsnprintf)(char *str, size_t size, const char *format, va_list ap);
+   pid_t (*waitpid)(pid_t pid, int *stat_loc, int options);
+-  ssize_t (*write)();
++  ssize_t (*write)(int, void *, size_t);
+   double (*atof)();
+   void *n_a;
+ } CollectorUtilFuncs;
+diff --git a/gprofng/src/gp-display-src.cc b/gprofng/src/gp-display-src.cc
+index 200e6080d2e..24af375edf1 100644
+--- a/gprofng/src/gp-display-src.cc
++++ b/gprofng/src/gp-display-src.cc
+@@ -75,14 +75,6 @@ private:
+   bool v_opt;
+   int multiple;
+   char *str_compcom;
+-  bool hex_visible;
+-  int src_visible;
+-  int vis_src;
+-  int vis_dis;
+-  int threshold_src;
+-  int threshold_dis;
+-  int threshold;
+-  int vis_bits;
+ };
+ 
+ static int
+diff --git a/gprofng/src/gp-print.h b/gprofng/src/gp-print.h
+index 1b748ea60a3..1a8ad3b6c13 100644
+--- a/gprofng/src/gp-print.h
++++ b/gprofng/src/gp-print.h
+@@ -19,7 +19,7 @@
+    MA 02110-1301, USA.  */
+ 
+ #ifndef _GP_PRINT_H
+-#define _ER_PRINT_H
++#define _GP_PRINT_H
+ 
+ #include "Command.h"
+ #include "DbeApplication.h"
+diff --git a/gprofng/src/util.cc b/gprofng/src/util.cc
+index 201f7088b66..228140b61ae 100644
+--- a/gprofng/src/util.cc
++++ b/gprofng/src/util.cc
+@@ -741,17 +741,13 @@ get_relative_link (const char *path_from, const char *path_to)
+   s2 = canonical_path (s2);
+   long l = dbe_sstrlen (s1);
+   // try to find common directories
+-  int common_slashes = 0;
+   int last_common_slash = -1;
+   for (int i = 0; i < l; i++)
+     {
+-      if (s1[i] != s2[i]) break;
+-      if (s1[i] == 0) break;
++      if (s1[i] != s2[i] || s1[i] == 0)
++	break;
+       if (s1[i] == '/')
+-	{
+-	  common_slashes++;
+-	  last_common_slash = i;
+-	}
++	last_common_slash = i;
+     }
+   // find slashes in remaining path_to
+   int slashes = 0;
+-- 
+2.50.1
+
diff --git a/package/binutils/2.42/0006-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch b/package/binutils/2.42/0006-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch
new file mode 100644
index 0000000000..06ca165570
--- /dev/null
+++ b/package/binutils/2.42/0006-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch
@@ -0,0 +1,619 @@
+From 2e59be3bc9dad69af4f62d26107b6ace23e9998a Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 16 Nov 2024 05:13:48 +0000
+Subject: [PATCH] gprofng: fix -std=gnu23 compatibility wrt unprototyped
+ functions
+
+C23 removes support for unprototyped functions. Fix function pointer types
+accordingly.
+
+This does not fix all instances, there's a few left as I commented on in
+PR32374 (e.g. setitimer which I have a local workaround for but it involves
+a glibc implementation detail; the Linaro precommit CI tester pointed that
+out too, so dropped that).
+
+ChangeLog:
+	PR gprofng/32374
+
+	* libcollector/collector.c (collector_sample): Fix prototype.
+	* libcollector/envmgmt.c (putenv): Ditto.
+	(_putenv): Ditto.
+	(__collector_putenv): Ditto.
+	(setenv): Ditto.
+	(_setenv): Ditto.
+	(__collector_setenv): Ditto.
+	(unsetenv): Ditto.
+	(_unsetenv): Ditto.
+	(__collector_unsetenv): Ditto.
+	* libcollector/jprofile.c (open_experiment): Ditto.
+	(__collector_jprofile_enable_synctrace): Ditto.
+	(jprof_find_asyncgetcalltrace): Ditto.
+	* libcollector/libcol_util.c (__collector_util_init): Ditto.
+	(ARCH): Ditto.
+	* libcollector/mmaptrace.c (collector_func_load): Ditto.
+	(collector_func_unload): Ditto.
+	* libcollector/unwind.c (__collector_ext_unwind_init): Ditto.
+	* src/collector_module.h: Ditto.
+
+Upstream: a2f774427e078f3da2c06bdea25f77a61979a695
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ gprofng/libcollector/collector.c   |  2 +-
+ gprofng/libcollector/dispatcher.c  |  1 -
+ gprofng/libcollector/envmgmt.c     | 24 ++++-----
+ gprofng/libcollector/jprofile.c    | 10 ++--
+ gprofng/libcollector/libcol_util.c | 84 +++++++++++++++---------------
+ gprofng/libcollector/mmaptrace.c   |  4 +-
+ gprofng/libcollector/unwind.c      |  2 +-
+ gprofng/src/collector_module.h     |  2 +-
+ 8 files changed, 64 insertions(+), 65 deletions(-)
+
+diff --git a/gprofng/libcollector/collector.c b/gprofng/libcollector/collector.c
+index ef580dcbdd9..899f08a5381 100644
+--- a/gprofng/libcollector/collector.c
++++ b/gprofng/libcollector/collector.c
+@@ -1579,7 +1579,7 @@ __collector_resume_experiment ()
+ }
+ 
+ /* Code to support Samples and Pause/Resume */
+-void collector_sample () __attribute__ ((weak, alias ("__collector_sample")));
++void collector_sample (char *name) __attribute__ ((weak, alias ("__collector_sample")));
+ void
+ __collector_sample (char *name)
+ {
+diff --git a/gprofng/libcollector/dispatcher.c b/gprofng/libcollector/dispatcher.c
+index 867753a22ec..5ee0bf895bf 100644
+--- a/gprofng/libcollector/dispatcher.c
++++ b/gprofng/libcollector/dispatcher.c
+@@ -1282,4 +1282,3 @@ __collector_ext_clone_pthread (int (*fn)(void *), void *child_stack, int flags,
+ int sigprocmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_sigprocmask")));
+ int thr_sigsetmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_thr_sigsetmask")));
+ int setitimer () __attribute__ ((weak, alias ("_setitimer")));
+-
+diff --git a/gprofng/libcollector/envmgmt.c b/gprofng/libcollector/envmgmt.c
+index ebe08f82007..0ff7621070d 100644
+--- a/gprofng/libcollector/envmgmt.c
++++ b/gprofng/libcollector/envmgmt.c
+@@ -692,8 +692,8 @@ __collector_env_update (char *envp[])
+ 
+ 
+ /*------------------------------------------------------------- putenv */
+-int putenv () __attribute__ ((weak, alias ("__collector_putenv")));
+-int _putenv () __attribute__ ((weak, alias ("__collector_putenv")));
++int putenv (char*) __attribute__ ((weak, alias ("__collector_putenv")));
++int _putenv (char*) __attribute__ ((weak, alias ("__collector_putenv")));
+ 
+ int
+ __collector_putenv (char * string)
+@@ -701,9 +701,9 @@ __collector_putenv (char * string)
+   if (CALL_UTIL (putenv) == __collector_putenv ||
+       CALL_UTIL (putenv) == NULL)
+     { // __collector_libc_funcs_init failed
+-      CALL_UTIL (putenv) = (int(*)())dlsym (RTLD_NEXT, "putenv");
++      CALL_UTIL (putenv) = (int(*)(char*))dlsym (RTLD_NEXT, "putenv");
+       if (CALL_UTIL (putenv) == NULL || CALL_UTIL (putenv) == __collector_putenv)
+-	  CALL_UTIL (putenv) = (int(*)())dlsym (RTLD_DEFAULT, "putenv");
++	  CALL_UTIL (putenv) = (int(*)(char*))dlsym (RTLD_DEFAULT, "putenv");
+       if (CALL_UTIL (putenv) == NULL || CALL_UTIL (putenv) == __collector_putenv)
+ 	{
+ 	  TprintfT (DBG_LT2, "__collector_putenv(): ERROR: no pointer found.\n");
+@@ -719,8 +719,8 @@ __collector_putenv (char * string)
+ }
+ 
+ /*------------------------------------------------------------- setenv */
+-int setenv () __attribute__ ((weak, alias ("__collector_setenv")));
+-int _setenv () __attribute__ ((weak, alias ("__collector_setenv")));
++int setenv (const char*, const char*, int) __attribute__ ((weak, alias ("__collector_setenv")));
++int _setenv (const char*, const char*, int) __attribute__ ((weak, alias ("__collector_setenv")));
+ 
+ int
+ __collector_setenv (const char *name, const char *value, int overwrite)
+@@ -728,9 +728,9 @@ __collector_setenv (const char *name, const char *value, int overwrite)
+   if (CALL_UTIL (setenv) == __collector_setenv ||
+       CALL_UTIL (setenv) == NULL)
+     { // __collector_libc_funcs_init failed
+-      CALL_UTIL (setenv) = (int(*)())dlsym (RTLD_NEXT, "setenv");
++      CALL_UTIL (setenv) = (int(*)(const char*, const char*, int))dlsym (RTLD_NEXT, "setenv");
+       if (CALL_UTIL (setenv) == NULL || CALL_UTIL (setenv) == __collector_setenv)
+-	CALL_UTIL (setenv) = (int(*)())dlsym (RTLD_DEFAULT, "setenv");
++	CALL_UTIL (setenv) = (int(*)(const char*, const char*, int))dlsym (RTLD_DEFAULT, "setenv");
+       if (CALL_UTIL (setenv) == NULL || CALL_UTIL (setenv) == __collector_setenv)
+ 	{
+ 	  TprintfT (DBG_LT2, "__collector_setenv(): ERROR: no pointer found.\n");
+@@ -765,8 +765,8 @@ __collector_setenv (const char *name, const char *value, int overwrite)
+ }
+ 
+ /*------------------------------------------------------------- unsetenv */
+-int unsetenv () __attribute__ ((weak, alias ("__collector_unsetenv")));
+-int _unsetenv () __attribute__ ((weak, alias ("__collector_unsetenv")));
++int unsetenv (const char*) __attribute__ ((weak, alias ("__collector_unsetenv")));
++int _unsetenv (const char*) __attribute__ ((weak, alias ("__collector_unsetenv")));
+ 
+ int
+ __collector_unsetenv (const char *name)
+@@ -774,9 +774,9 @@ __collector_unsetenv (const char *name)
+   if (CALL_UTIL (unsetenv) == __collector_unsetenv ||
+       CALL_UTIL (unsetenv) == NULL)
+     { // __collector_libc_funcs_init failed
+-      CALL_UTIL (unsetenv) = (int(*)())dlsym (RTLD_NEXT, "unsetenv");
++      CALL_UTIL (unsetenv) = (int(*)(const char*))dlsym (RTLD_NEXT, "unsetenv");
+       if (CALL_UTIL (unsetenv) == NULL || CALL_UTIL (unsetenv) == __collector_unsetenv)
+-	CALL_UTIL (unsetenv) = (int(*)())dlsym (RTLD_DEFAULT, "unsetenv");
++	CALL_UTIL (unsetenv) = (int(*)(const char*))dlsym (RTLD_DEFAULT, "unsetenv");
+       if (CALL_UTIL (unsetenv) == NULL || CALL_UTIL (unsetenv) == __collector_unsetenv)
+ 	{
+ 	  TprintfT (DBG_LT2, "__collector_unsetenv(): ERROR: no pointer found.\n");
+diff --git a/gprofng/libcollector/jprofile.c b/gprofng/libcollector/jprofile.c
+index 1bacacc1a2a..11051f937ef 100644
+--- a/gprofng/libcollector/jprofile.c
++++ b/gprofng/libcollector/jprofile.c
+@@ -105,8 +105,8 @@ static void rwrite (int fd, const void *buf, size_t nbyte);
+ static void addToDynamicArchive (const char* name, const unsigned char* class_data, int class_data_len);
+ static void (*AsyncGetCallTrace)(JVMPI_CallTrace*, jint, ucontext_t*) = NULL;
+ static void (*collector_heap_record)(int, int, void*) = NULL;
+-static void (*collector_jsync_begin)() = NULL;
+-static void (*collector_jsync_end)(hrtime_t, void *) = NULL;
++static void (*collector_jsync_begin)(void) = NULL;
++static void (*collector_jsync_end)(hrtime_t, void*) = NULL;
+ 
+ #define gethrtime collector_interface->getHiResTime
+ 
+@@ -230,7 +230,7 @@ open_experiment (const char *exp)
+       else if (__collector_strStartWith (args, "s:") == 0)
+ 	{
+ 	  java_sync_mode = 1;
+-	  collector_jsync_begin = (void(*)(hrtime_t, void *))dlsym (RTLD_DEFAULT, "__collector_jsync_begin");
++	  collector_jsync_begin = (void(*)(void))dlsym (RTLD_DEFAULT, "__collector_jsync_begin");
+ 	  collector_jsync_end = (void(*)(hrtime_t, void *))dlsym (RTLD_DEFAULT, "__collector_jsync_end");
+ 	}
+ #endif
+@@ -255,7 +255,7 @@ __collector_jprofile_enable_synctrace ()
+       return;
+     }
+   java_sync_mode = 1;
+-  collector_jsync_begin = (void(*)(hrtime_t, void *))dlsym (RTLD_DEFAULT, "__collector_jsync_begin");
++  collector_jsync_begin = (void(*)(void))dlsym (RTLD_DEFAULT, "__collector_jsync_begin");
+   collector_jsync_end = (void(*)(hrtime_t, void *))dlsym (RTLD_DEFAULT, "__collector_jsync_end");
+   TprintfT (DBG_LT1, "jprofile: turning on Java synctrace, and requesting events\n");
+ }
+@@ -1129,7 +1129,7 @@ jprof_find_asyncgetcalltrace ()
+ {
+   void *jvmhandle;
+   if (__collector_VM_ReadByteInstruction == NULL)
+-    __collector_VM_ReadByteInstruction = (int(*)()) dlsym (RTLD_DEFAULT, "Async_VM_ReadByteInstruction");
++    __collector_VM_ReadByteInstruction = (int(*)(unsigned char*)) dlsym (RTLD_DEFAULT, "Async_VM_ReadByteInstruction");
+ 
+   /* look for stack unwind function using default path */
+   AsyncGetCallTrace = (void (*)(JVMPI_CallTrace*, jint, ucontext_t*))
+diff --git a/gprofng/libcollector/libcol_util.c b/gprofng/libcollector/libcol_util.c
+index c2b82894e6b..688bdf19c6d 100644
+--- a/gprofng/libcollector/libcol_util.c
++++ b/gprofng/libcollector/libcol_util.c
+@@ -1114,7 +1114,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "munmap");
+   if (ptr)
+-    __collector_util_funcs.munmap = (int(*)())ptr;
++    __collector_util_funcs.munmap = (int(*)(void *, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT munmap: %s\n", dlerror ());
+@@ -1123,7 +1123,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "close");
+   if (ptr)
+-    __collector_util_funcs.close = (int(*)())ptr;
++    __collector_util_funcs.close = (int(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT close: %s\n", dlerror ());
+@@ -1158,7 +1158,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "close");
+   if (ptr)
+-    __collector_util_funcs.close = (int(*)())ptr;
++    __collector_util_funcs.close = (int(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT close: %s\n", dlerror ());
+@@ -1167,7 +1167,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "read");
+   if (ptr)
+-    __collector_util_funcs.read = (ssize_t (*)())ptr;
++    __collector_util_funcs.read = (ssize_t (*)(int, void*, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT read: %s\n", dlerror ());
+@@ -1176,7 +1176,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "write");
+   if (ptr)
+-    __collector_util_funcs.write = (ssize_t (*)())ptr;
++    __collector_util_funcs.write = (ssize_t (*)(int, void*, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT write: %s\n", dlerror ());
+@@ -1186,14 +1186,14 @@ __collector_util_init ()
+ #if ARCH(Intel) && WSIZE(32)
+   ptr = dlvsym (libc, "pwrite", "GLIBC_2.2"); // it is in /lib/libpthread.so.0
+   if (ptr)
+-    __collector_util_funcs.pwrite = (ssize_t (*)())ptr;
++    __collector_util_funcs.pwrite = (ssize_t (*)(int, void*, size_t, off_t))ptr;
+   else
+     {
+       Tprintf (DBG_LT0, "libcol_util: WARNING: dlvsym for %s@%s failed. Using dlsym() instead.", "pwrite", "GLIBC_2.2");
+ #endif /* ARCH(Intel) && WSIZE(32) */
+       ptr = dlsym (libc, "pwrite");
+       if (ptr)
+-	__collector_util_funcs.pwrite = (ssize_t (*)())ptr;
++	__collector_util_funcs.pwrite = (ssize_t (*)(int, const void*, size_t, off_t))ptr;
+       else
+ 	{
+ 	  CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT pwrite: %s\n", dlerror ());
+@@ -1213,7 +1213,7 @@ __collector_util_init ()
+ #endif /* ARCH(Intel) && WSIZE(32) */
+       ptr = dlsym (libc, "pwrite64");
+       if (ptr)
+-	__collector_util_funcs.pwrite64_ = (ssize_t (*)())ptr;
++	__collector_util_funcs.pwrite64_ = (ssize_t (*)(int, const void*, size_t, off_t))ptr;
+       else
+ 	__collector_util_funcs.pwrite64_ = __collector_util_funcs.pwrite;
+ #if ARCH(Intel) && WSIZE(32)
+@@ -1222,7 +1222,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "lseek");
+   if (ptr)
+-    __collector_util_funcs.lseek = (off_t (*)())ptr;
++    __collector_util_funcs.lseek = (off_t (*)(int, off_t, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT lseek: %s\n", dlerror ());
+@@ -1231,7 +1231,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "access");
+   if (ptr)
+-    __collector_util_funcs.access = (int(*)())ptr;
++    __collector_util_funcs.access = (int(*)(const char*, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT access: %s\n", dlerror ());
+@@ -1240,7 +1240,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "mkdir");
+   if (ptr)
+-    __collector_util_funcs.mkdir = (int(*)())ptr;
++    __collector_util_funcs.mkdir = (int(*)(const char*, mode_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT mkdir: %s\n", dlerror ());
+@@ -1249,7 +1249,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "opendir");
+   if (ptr)
+-    __collector_util_funcs.opendir = (DIR * (*)())ptr;
++    __collector_util_funcs.opendir = (DIR * (*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT opendir: %s\n", dlerror ());
+@@ -1258,7 +1258,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "closedir");
+   if (ptr)
+-    __collector_util_funcs.closedir = (int(*)())ptr;
++    __collector_util_funcs.closedir = (int(*)(DIR*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT closedir: %s\n", dlerror ());
+@@ -1267,7 +1267,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "execv");
+   if (ptr)
+-    __collector_util_funcs.execv = (int(*)())ptr;
++    __collector_util_funcs.execv = (int(*)(const char*, char* const*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT execv: %s\n", dlerror ());
+@@ -1276,7 +1276,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "exit");
+   if (ptr)
+-    __collector_util_funcs.exit = (void(*)())ptr;
++    __collector_util_funcs.exit = (void(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT exit: %s\n", dlerror ());
+@@ -1285,7 +1285,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "vfork");
+   if (ptr)
+-    __collector_util_funcs.vfork = (pid_t (*)())ptr;
++    __collector_util_funcs.vfork = (pid_t (*)(void))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT vfork: %s\n", dlerror ());
+@@ -1294,7 +1294,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "waitpid");
+   if (ptr)
+-    __collector_util_funcs.waitpid = (pid_t (*)())ptr;
++    __collector_util_funcs.waitpid = (pid_t (*)(pid_t, int*, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT waitpid: %s\n", dlerror ());
+@@ -1313,7 +1313,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "getcontext");
+   if (ptr)
+-    __collector_util_funcs.getcontext = (int(*)())ptr;
++    __collector_util_funcs.getcontext = (int(*)(ucontext_t*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT getcontext: %s\n", dlerror ());
+@@ -1331,7 +1331,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "putenv");
+   if (ptr)
+-    __collector_util_funcs.putenv = (int(*)())ptr;
++    __collector_util_funcs.putenv = (int(*)(char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT putenv: %s\n", dlerror ());
+@@ -1340,7 +1340,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "getenv");
+   if (ptr)
+-    __collector_util_funcs.getenv = (char*(*)())ptr;
++    __collector_util_funcs.getenv = (char*(*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT getenv: %s\n", dlerror ());
+@@ -1349,7 +1349,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "time");
+   if (ptr)
+-    __collector_util_funcs.time = (time_t (*)())ptr;
++    __collector_util_funcs.time = (time_t (*)(time_t*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT time: %s\n", dlerror ());
+@@ -1358,7 +1358,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "mktime");
+   if (ptr)
+-    __collector_util_funcs.mktime = (time_t (*)())ptr;
++    __collector_util_funcs.mktime = (time_t (*)(struct tm*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT mktime: %s\n", dlerror ());
+@@ -1372,7 +1372,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "gmtime_r");
+   if (ptr)
+-    __collector_util_funcs.gmtime_r = (struct tm * (*)())ptr;
++    __collector_util_funcs.gmtime_r = (struct tm * (*)(const time_t*, struct tm*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT gmtime_r: %s\n", dlerror ());
+@@ -1381,7 +1381,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strtol");
+   if (ptr)
+-    __collector_util_funcs.strtol = (long (*)())ptr;
++    __collector_util_funcs.strtol = (long (*)(const char*, char**, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strtol: %s\n", dlerror ());
+@@ -1390,7 +1390,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strtoll");
+   if (ptr)
+-    __collector_util_funcs.strtoll = (long long (*)())ptr;
++    __collector_util_funcs.strtoll = (long long (*)(const char*, char**, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strtoll: %s\n", dlerror ());
+@@ -1402,7 +1402,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "setenv");
+   if (ptr)
+-    __collector_util_funcs.setenv = (int(*)())ptr;
++    __collector_util_funcs.setenv = (int(*)(const char*, const char*, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT setenv: %s\n", dlerror ());
+@@ -1411,7 +1411,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "unsetenv");
+   if (ptr)
+-    __collector_util_funcs.unsetenv = (int(*)())ptr;
++    __collector_util_funcs.unsetenv = (int(*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT unsetenv: %s\n", dlerror ());
+@@ -1498,7 +1498,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "pclose");
+   if (ptr)
+-    __collector_util_funcs.pclose = (int(*)())ptr;
++    __collector_util_funcs.pclose = (int(*)(FILE*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT pclose: %s\n", dlerror ());
+@@ -1507,7 +1507,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "fgets");
+   if (ptr)
+-    __collector_util_funcs.fgets = (char*(*)())ptr;
++    __collector_util_funcs.fgets = (char*(*)(char*, int, FILE*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT fgets: %s\n", dlerror ());
+@@ -1534,7 +1534,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "vsnprintf");
+   if (ptr)
+-    __collector_util_funcs.vsnprintf = (int(*)())ptr;
++    __collector_util_funcs.vsnprintf = (int(*)(char*, size_t, const char*, ...))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT vsnprintf: %s\n", dlerror ());
+@@ -1543,7 +1543,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "atoi");
+   if (ptr)
+-    __collector_util_funcs.atoi = (int(*)())ptr;
++    __collector_util_funcs.atoi = (int(*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT atoi: %s\n", dlerror ());
+@@ -1552,7 +1552,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "calloc");
+   if (ptr)
+-    __collector_util_funcs.calloc = (void*(*)())ptr;
++    __collector_util_funcs.calloc = (void*(*)(size_t, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT calloc: %s\n", dlerror ());
+@@ -1562,7 +1562,7 @@ __collector_util_init ()
+   ptr = dlsym (libc, "free");
+   if (ptr)
+     {
+-      __collector_util_funcs.free = (void(*)())ptr;
++      __collector_util_funcs.free = (void(*)(void*))ptr;
+     }
+   else
+     {
+@@ -1572,7 +1572,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strdup");
+   if (ptr)
+-    __collector_util_funcs.libc_strdup = (char*(*)())ptr;
++    __collector_util_funcs.libc_strdup = (char*(*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strdup: %s\n", dlerror ());
+@@ -1585,7 +1585,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strerror");
+   if (ptr)
+-    __collector_util_funcs.strerror = (char*(*)())ptr;
++    __collector_util_funcs.strerror = (char*(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strerror: %s\n", dlerror ());
+@@ -1593,7 +1593,7 @@ __collector_util_init ()
+     }
+   ptr = dlsym (libc, "strerror_r");
+   if (ptr)
+-    __collector_util_funcs.strerror_r = (int(*)())ptr;
++    __collector_util_funcs.strerror_r = (int(*)(int, char*, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strerror_r: %s\n", dlerror ());
+@@ -1601,7 +1601,7 @@ __collector_util_init ()
+     }
+   ptr = dlsym (libc, "strspn");
+   if (ptr)
+-    __collector_util_funcs.strspn = (size_t (*)())ptr;
++    __collector_util_funcs.strspn = (size_t (*)(const char*, const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strspn: %s\n", dlerror ());
+@@ -1610,7 +1610,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strtoul");
+   if (ptr)
+-    __collector_util_funcs.strtoul = (unsigned long int(*)())ptr;
++    __collector_util_funcs.strtoul = (unsigned long int(*)(const char*, char**, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strtoul: %s\n", dlerror ());
+@@ -1619,7 +1619,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strtoull");
+   if (ptr)
+-    __collector_util_funcs.strtoull = (unsigned long long int(*)())ptr;
++    __collector_util_funcs.strtoull = (unsigned long long int(*)(const char*, char**, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strtoull: %s\n", dlerror ());
+@@ -1664,7 +1664,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "sysconf");
+   if (ptr)
+-    __collector_util_funcs.sysconf = (long(*)())ptr;
++    __collector_util_funcs.sysconf = (long(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT sysconf: %s\n", dlerror ());
+@@ -1673,7 +1673,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "sigfillset");
+   if (ptr)
+-    __collector_util_funcs.sigfillset = (int(*)())ptr;
++    __collector_util_funcs.sigfillset = (int(*)(sigset_t*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT sigfillset: %s\n", dlerror ());
+@@ -1682,7 +1682,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "sigprocmask");
+   if (ptr)
+-    __collector_util_funcs.sigprocmask = (int(*)())ptr;
++    __collector_util_funcs.sigprocmask = (int(*)(int, const sigset_t*, sigset_t*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT sigprocmask: %s\n", dlerror ());
+diff --git a/gprofng/libcollector/mmaptrace.c b/gprofng/libcollector/mmaptrace.c
+index f07f4d76513..2a6857ab58e 100644
+--- a/gprofng/libcollector/mmaptrace.c
++++ b/gprofng/libcollector/mmaptrace.c
+@@ -1209,7 +1209,7 @@ process_vsyscall_page ()
+ /*
+  * collector API for dynamic functions
+  */
+-void collector_func_load () __attribute__ ((weak, alias ("__collector_func_load")));
++void collector_func_load (char*, char*, char*, void*, int, int, DT_lineno *) __attribute__ ((weak, alias ("__collector_func_load")));
+ void
+ __collector_func_load (char *name, char *alias, char *sourcename,
+ 		       void *vaddr, int size, int lntsize, DT_lineno *lntable)
+@@ -1218,7 +1218,7 @@ __collector_func_load (char *name, char *alias, char *sourcename,
+ 			     vaddr, size, lntsize, lntable);
+ }
+ 
+-void collector_func_unload () __attribute__ ((weak, alias ("__collector_func_unload")));
++void collector_func_unload (void *vaddr) __attribute__ ((weak, alias ("__collector_func_unload")));
+ void
+ __collector_func_unload (void *vaddr)
+ {
+diff --git a/gprofng/libcollector/unwind.c b/gprofng/libcollector/unwind.c
+index 91678b1e334..cd47d4fbe0f 100644
+--- a/gprofng/libcollector/unwind.c
++++ b/gprofng/libcollector/unwind.c
+@@ -416,7 +416,7 @@ __collector_ext_unwind_init (int record)
+   omp_no_walk = 1;
+ 
+   if (__collector_VM_ReadByteInstruction == NULL)
+-    __collector_VM_ReadByteInstruction = (int(*)()) dlsym (RTLD_DEFAULT, "Async_VM_ReadByteInstruction");
++    __collector_VM_ReadByteInstruction = (int(*)(unsigned char*)) dlsym (RTLD_DEFAULT, "Async_VM_ReadByteInstruction");
+ 
+ #if ARCH(SPARC)
+ #if WSIZE(64)
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index ebcdbca561f..fd888cd58dd 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -110,7 +110,7 @@ typedef struct CollectorUtilFuncs
+   long (*sysinfo)(int command, char *buf, long count);
+   time_t (*time)(time_t *tloc);
+   int (*unsetenv)(const char *name);
+-  int (*vsnprintf)(char *str, size_t size, const char *format, va_list ap);
++  int (*vsnprintf)(char *str, size_t size, const char *format, ...);
+   pid_t (*waitpid)(pid_t pid, int *stat_loc, int options);
+   ssize_t (*write)(int, void *, size_t);
+   double (*atof)();
+-- 
+2.50.1
+
diff --git a/package/binutils/2.42/0007-gprofng-fix-build-with-std-gnu23.patch b/package/binutils/2.42/0007-gprofng-fix-build-with-std-gnu23.patch
new file mode 100644
index 0000000000..15a56f14af
--- /dev/null
+++ b/package/binutils/2.42/0007-gprofng-fix-build-with-std-gnu23.patch
@@ -0,0 +1,199 @@
+From e91e1fd342c9ded87f53bc7e9e8d5d693b9a570a Mon Sep 17 00:00:00 2001
+From: Vladimir Mezentsev <vladimir.mezentsev@oracle.com>
+Date: Thu, 21 Nov 2024 14:48:20 -0800
+Subject: [PATCH] gprofng: fix build with -std=gnu23
+
+Fix function pointer types accordingly.
+Remove unused function pointers.
+
+gprofng/ChangeLog
+2024-11-21  Vladimir Mezentsev  <vladimir.mezentsev@oracle.com>
+
+	PR gprofng/32374
+	PR gprofng/32373
+	* common/cpuid.c: Define ATTRIBUTE_UNUSED if necessary.
+	* libcollector/libcol_util.c (sysinfo): Remove unused pointer.
+	* src/collector_module.h: Likewise.
+	* libcollector/dispatcher.c (setitimer): Fix prototype.
+	* libcollector/linetrace.c (system, grantpt, ptsname): Likewise.
+	* testsuite/gprofng.display/mttest/mttest.c (dump_arrays): Likewise.
+	* testsuite/gprofng.display/synprog/endcases.c (xinline_code,
+	s_inline_code): Likewise.
+	* testsuite/gprofng.display/synprog/inc_inline.h (ext_inline_code):
+	Likewise.
+	* testsuite/gprofng.display/synprog/synprog.c (doabort): Rename nullptr.
+
+Upstream: 4e943705e3e8a5a9448d087502bcb390a694ad02
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ gprofng/common/cpuid.c                                 |  2 ++
+ gprofng/libcollector/dispatcher.c                      |  2 +-
+ gprofng/libcollector/libcol_util.c                     |  9 ---------
+ gprofng/libcollector/linetrace.c                       | 10 +++++-----
+ gprofng/src/collector_module.h                         |  1 -
+ gprofng/testsuite/gprofng.display/mttest/mttest.c      |  2 +-
+ gprofng/testsuite/gprofng.display/synprog/endcases.c   |  4 ++--
+ gprofng/testsuite/gprofng.display/synprog/inc_inline.h |  2 +-
+ gprofng/testsuite/gprofng.display/synprog/synprog.c    |  4 ++--
+ 9 files changed, 14 insertions(+), 22 deletions(-)
+
+diff --git a/gprofng/common/cpuid.c b/gprofng/common/cpuid.c
+index af15439eb27..0373969693b 100644
+--- a/gprofng/common/cpuid.c
++++ b/gprofng/common/cpuid.c
+@@ -21,7 +21,9 @@
+ #if defined(__i386__) || defined(__x86_64)
+ #include <cpuid.h>  /* GCC-provided */
+ #elif defined(__aarch64__)
++#if !defined(ATTRIBUTE_UNUSED)
+ #define ATTRIBUTE_UNUSED __attribute__((unused))
++#endif
+ 
+ static inline uint_t __attribute_const__
+ __get_cpuid (unsigned int op ATTRIBUTE_UNUSED, unsigned int *eax,
+diff --git a/gprofng/libcollector/dispatcher.c b/gprofng/libcollector/dispatcher.c
+index 5ee0bf895bf..e85c343c776 100644
+--- a/gprofng/libcollector/dispatcher.c
++++ b/gprofng/libcollector/dispatcher.c
+@@ -1281,4 +1281,4 @@ __collector_ext_clone_pthread (int (*fn)(void *), void *child_stack, int flags,
+ // weak symbols:
+ int sigprocmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_sigprocmask")));
+ int thr_sigsetmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_thr_sigsetmask")));
+-int setitimer () __attribute__ ((weak, alias ("_setitimer")));
++__typeof(setitimer) setitimer __attribute__ ((weak, alias ("_setitimer")));
+diff --git a/gprofng/libcollector/libcol_util.c b/gprofng/libcollector/libcol_util.c
+index 688bdf19c6d..46f8b80ccb4 100644
+--- a/gprofng/libcollector/libcol_util.c
++++ b/gprofng/libcollector/libcol_util.c
+@@ -1427,15 +1427,6 @@ __collector_util_init ()
+       err = COL_ERROR_UTIL_INIT;
+     }
+ 
+-  ptr = dlsym (libc, "sysinfo");
+-  if (ptr)
+-    __collector_util_funcs.sysinfo = (long (*)())ptr;
+-  else
+-    {
+-      CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT sysinfo: %s\n", dlerror ());
+-      err = COL_ERROR_UTIL_INIT;
+-    }
+-
+   ptr = dlsym (libc, "clearenv");
+   if (ptr)
+     __collector_util_funcs.clearenv = (int(*)())ptr;
+diff --git a/gprofng/libcollector/linetrace.c b/gprofng/libcollector/linetrace.c
+index 66844bc1337..c81ae1a2272 100644
+--- a/gprofng/libcollector/linetrace.c
++++ b/gprofng/libcollector/linetrace.c
+@@ -1527,7 +1527,7 @@ DCL_FUNC_VER (DCL_POSIX_SPAWNP, posix_spawnp_2_2, posix_spawnp@GLIBC_2.2)
+ DCL_POSIX_SPAWNP (posix_spawnp)
+ 
+ /*------------------------------------------------------------- system */
+-int system () __attribute__ ((weak, alias ("__collector_system")));
++int system (const char *cmd) __attribute__ ((weak, alias ("__collector_system")));
+ 
+ int
+ __collector_system (const char *cmd)
+@@ -1582,10 +1582,10 @@ DCL_FUNC_VER (DCL_POPEN, popen_2_0, popen@GLIBC_2.0)
+ DCL_POPEN (popen)
+ 
+ /*------------------------------------------------------------- grantpt */
+-int grantpt () __attribute__ ((weak, alias ("__collector_grantpt")));
++int grantpt (int fildes) __attribute__ ((weak, alias ("__collector_grantpt")));
+ 
+ int
+-__collector_grantpt (const int fildes)
++__collector_grantpt (int fildes)
+ {
+   if (NULL_PTR (grantpt))
+     init_lineage_intf ();
+@@ -1607,10 +1607,10 @@ __collector_grantpt (const int fildes)
+ }
+ 
+ /*------------------------------------------------------------- ptsname */
+-char *ptsname () __attribute__ ((weak, alias ("__collector_ptsname")));
++char *ptsname (int fildes) __attribute__ ((weak, alias ("__collector_ptsname")));
+ 
+ char *
+-__collector_ptsname (const int fildes)
++__collector_ptsname (int fildes)
+ {
+   if (NULL_PTR (ptsname))
+     init_lineage_intf ();
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index fd888cd58dd..6640f12fa3c 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -107,7 +107,6 @@ typedef struct CollectorUtilFuncs
+   int (*symlink)(const char *s1, const char *s2);
+   int (*syscall)(int number, ...);
+   long (*sysconf)(int name);
+-  long (*sysinfo)(int command, char *buf, long count);
+   time_t (*time)(time_t *tloc);
+   int (*unsetenv)(const char *name);
+   int (*vsnprintf)(char *str, size_t size, const char *format, ...);
+diff --git a/gprofng/testsuite/gprofng.display/mttest/mttest.c b/gprofng/testsuite/gprofng.display/mttest/mttest.c
+index e0835c833e5..3db5b8d8e86 100644
+--- a/gprofng/testsuite/gprofng.display/mttest/mttest.c
++++ b/gprofng/testsuite/gprofng.display/mttest/mttest.c
+@@ -171,7 +171,7 @@ void computeJ (workStruct_t *x);
+ void computeK (workStruct_t *x);
+ void addone (workCtr_t *x);
+ void init_arrays (int strat);
+-void dump_arrays ();
++void dump_arrays (hrtime_t real, hrtime_t cpu, int case_index);
+ void *do_work (void *v);
+ void thread_work ();
+ void nothreads (Workblk *array, struct scripttab *k);
+diff --git a/gprofng/testsuite/gprofng.display/synprog/endcases.c b/gprofng/testsuite/gprofng.display/synprog/endcases.c
+index a6a1389658a..6f1c83b6859 100644
+--- a/gprofng/testsuite/gprofng.display/synprog/endcases.c
++++ b/gprofng/testsuite/gprofng.display/synprog/endcases.c
+@@ -40,8 +40,8 @@ static void s_inline_code (int);
+ void ext_inline_code (int);
+ 
+ #ifndef NO_INLINE
+-void xinline_code () __attribute__ ((always_inline));
+-void s_inline_code () __attribute__ ((always_inline));
++void xinline_code (int) __attribute__ ((always_inline));
++void s_inline_code (int) __attribute__ ((always_inline));
+ #endif
+ 
+ #include "inc_inline.h"
+diff --git a/gprofng/testsuite/gprofng.display/synprog/inc_inline.h b/gprofng/testsuite/gprofng.display/synprog/inc_inline.h
+index da42563c828..6600eacb66d 100644
+--- a/gprofng/testsuite/gprofng.display/synprog/inc_inline.h
++++ b/gprofng/testsuite/gprofng.display/synprog/inc_inline.h
+@@ -19,7 +19,7 @@
+    MA 02110-1301, USA.  */
+ 
+ #ifndef NO_INLINE
+-void ext_inline_code() __attribute__ ((always_inline));
++void ext_inline_code(int) __attribute__ ((always_inline));
+ #endif
+ 
+ void
+diff --git a/gprofng/testsuite/gprofng.display/synprog/synprog.c b/gprofng/testsuite/gprofng.display/synprog/synprog.c
+index cf1bc5b0909..05920dc7419 100644
+--- a/gprofng/testsuite/gprofng.display/synprog/synprog.c
++++ b/gprofng/testsuite/gprofng.display/synprog/synprog.c
+@@ -528,14 +528,14 @@ reapchildren ()
+ int
+ doabort (int k)
+ {
+-  char *nullptr = NULL;
++  char *p = NULL;
+   char c;
+ 
+   /* Log the event */
+   wlog ("start of doabort", NULL);
+ 
+   /* and dereference a NULL */
+-  c = *nullptr;
++  c = *p;
+ 
+   /* this should never be reached */
+   return (int) c;
+-- 
+2.50.1
+
diff --git a/package/binutils/2.43.1/0005-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch b/package/binutils/2.43.1/0005-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch
new file mode 100644
index 0000000000..1f28137190
--- /dev/null
+++ b/package/binutils/2.43.1/0005-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch
@@ -0,0 +1,801 @@
+From 3e8c6e03675963d65a2f98eb006336c5cd375ec3 Mon Sep 17 00:00:00 2001
+From: Vladimir Mezentsev <vladimir.mezentsev@oracle.com>
+Date: Tue, 3 Sep 2024 21:30:31 -0700
+Subject: [PATCH] Fix 32097 Warnings when building gprofng with Clang
+
+gprofng/ChangeLog
+2024-09-03  Vladimir Mezentsev  <vladimir.mezentsev@oracle.com>.
+
+	PR gprofng/32097
+	* common/hwcdrv.c: Fix -Wempty-body warnings.
+	* common/hwcentry.h: Fix -Wdeprecated-non-prototype warnings.
+	* common/hwctable.c: Fix -Wdeprecated-non-prototype warnings.
+	* libcollector/collector.c: Likewise.
+	* libcollector/collector.h: Likewise.
+	* libcollector/collectorAPI.c: Likewise.
+	* libcollector/dispatcher.c: Likewise.
+	* libcollector/iotrace.c: Likewise.
+	* libcollector/libcol_util.c: Fix -Wunused-but-set-variable warnings.
+	* libcollector/libcol_util.h: Remove unused declarations.
+	* libcollector/linetrace.c: Fix -Wdeprecated-non-prototype warnings.
+	* src/BaseMetricTreeNode.h: Fix -Wunused-private-field warnings.
+	* src/Dbe.cc: Fix -Wself-assign warnings.
+	* src/DbeSession.cc: Fix -Wunused-but-set-variable warnings.
+	* src/Disasm.cc: Fix -Wunused-const-variable warnings.
+	* src/Experiment.cc: Fix -Wunused-private-field warnings.
+	* src/HashMap.h: Fix -Wself-assign warnings.
+	* src/IOActivity.h: Fix -Wunused-private-field warnings.
+	* src/collctrl.cc: Fix -Wself-assign, -Wparentheses-equality warnings.
+	* src/collctrl.h: Fix -Wunused-private-field warnings.
+	* src/collector_module.h: Fix -Wdeprecated-non-prototype warnings.
+	* src/gp-display-src.cc: Fix -Wunused-private-field warnings.
+	* src/gp-print.h: Fix -Wheader-guard warnings.
+	* src/hwc_intel_icelake.h: Fix -Winitializer-overrides warnings.
+	* src/util.cc: Fix -Wunused-but-set-variable warnings.
+
+Upstream: b79c457ca01df82dbe1facb708e45def4584c903
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ gprofng/common/hwcdrv.c             |  3 ++-
+ gprofng/common/hwcentry.h           |  7 +----
+ gprofng/common/hwctable.c           | 13 +---------
+ gprofng/libcollector/collector.c    | 15 ++++-------
+ gprofng/libcollector/collector.h    |  2 +-
+ gprofng/libcollector/collectorAPI.c | 15 ++++++-----
+ gprofng/libcollector/dispatcher.c   | 19 ++++++++------
+ gprofng/libcollector/iotrace.c      | 12 ++++-----
+ gprofng/libcollector/libcol_util.c  |  2 --
+ gprofng/libcollector/libcol_util.h  |  6 -----
+ gprofng/libcollector/linetrace.c    | 40 +++++++++++++++++------------
+ gprofng/src/BaseMetricTreeNode.h    |  1 -
+ gprofng/src/Dbe.cc                  | 12 ++++-----
+ gprofng/src/DbeSession.cc           |  3 ---
+ gprofng/src/Disasm.cc               |  1 -
+ gprofng/src/Experiment.cc           |  2 --
+ gprofng/src/HashMap.h               |  3 +--
+ gprofng/src/IOActivity.h            |  1 -
+ gprofng/src/collctrl.cc             | 14 +++++-----
+ gprofng/src/collctrl.h              |  1 -
+ gprofng/src/collector_module.h      | 20 +++++++--------
+ gprofng/src/gp-display-src.cc       |  8 ------
+ gprofng/src/gp-print.h              |  2 +-
+ gprofng/src/hwc_intel_icelake.h     |  6 +++--
+ gprofng/src/util.cc                 | 10 +++-----
+ 25 files changed, 88 insertions(+), 130 deletions(-)
+
+diff --git a/gprofng/common/hwcdrv.c b/gprofng/common/hwcdrv.c
+index aaf3acdf9cd..51492a8d35c 100644
+--- a/gprofng/common/hwcdrv.c
++++ b/gprofng/common/hwcdrv.c
+@@ -574,6 +574,7 @@ read_sample (counter_state_t *ctr_state, int msgsz, uint64_t *rvalue,
+ static void
+ dump_perf_event_attr (struct perf_event_attr *at)
+ {
++#if defined(DEBUG)
+   TprintfT (DBG_LT2, "dump_perf_event_attr:  size=%d  type=%d  sample_period=%lld\n"
+ 	    "  config=0x%llx  config1=0x%llx  config2=0x%llx  wakeup_events=%lld __reserved_1=%lld\n",
+ 	    (int) at->size, (int) at->type, (unsigned long long) at->sample_period,
+@@ -589,13 +590,13 @@ dump_perf_event_attr (struct perf_event_attr *at)
+   DUMP_F (exclude_kernel);
+   DUMP_F (exclude_hv);
+   DUMP_F (exclude_idle);
+-  //    DUMP_F(xmmap);
+   DUMP_F (comm);
+   DUMP_F (freq);
+   DUMP_F (inherit_stat);
+   DUMP_F (enable_on_exec);
+   DUMP_F (task);
+   DUMP_F (watermark);
++#endif
+ }
+ 
+ static void
+diff --git a/gprofng/common/hwcentry.h b/gprofng/common/hwcentry.h
+index b2ab8b9b22c..0b923fc3576 100644
+--- a/gprofng/common/hwcentry.h
++++ b/gprofng/common/hwcentry.h
+@@ -200,17 +200,12 @@ extern "C"
+   extern char *hwc_get_docref (char *buf, size_t buflen);
+   /* Return a CPU HWC document reference, or NULL. */
+ 
+-  // TBR
+-  extern char *hwc_get_default_cntrs ();
+-  /* Return a default HW counter string; may be NULL, or zero-length */
+-  /* NULL means none is defined in the table; or zero-length means string defined could not be loaded */
+-
+   extern char *hwc_get_default_cntrs2 (int forKernel, int style);
+   /* like hwc_get_default_cntrs() for style==1 */
+   /* but allows other styles of formatting as well */
+   /* deprecate and eventually remove hwc_get_default_cntrs() */
+ 
+-  extern char *hwc_get_orig_default_cntrs ();
++  extern char *hwc_get_orig_default_cntrs (int forKernel);
+   /* Get the default HW counter string as set in the table */
+   /* NULL means none is defined in the table */
+ 
+diff --git a/gprofng/common/hwctable.c b/gprofng/common/hwctable.c
+index 0baf63b1805..338a1ea86f4 100644
+--- a/gprofng/common/hwctable.c
++++ b/gprofng/common/hwctable.c
+@@ -1783,7 +1783,7 @@ check_tables ()
+ }
+ #endif
+ 
+-static int try_a_counter ();
++static int try_a_counter (int forKernel);
+ static void hwc_process_raw_ctrs (int forKernel, Hwcentry ***pstd_out,
+ 				  Hwcentry ***praw_out, Hwcentry ***phidden_out,
+ 				  Hwcentry**static_tables,
+@@ -2824,17 +2824,6 @@ hwc_get_docref (char *buf, size_t buflen)
+   return buf;
+ }
+ 
+-//TBR:
+-
+-extern char*
+-hwc_get_default_cntrs ()
+-{
+-  setup_cpcx ();
+-  if (cpcx_default_hwcs[0] != NULL)
+-    return strdup (cpcx_default_hwcs[0]); // TBR deprecate this
+-  return NULL;
+-}
+-
+ extern char*
+ hwc_get_default_cntrs2 (int forKernel, int style)
+ {
+diff --git a/gprofng/libcollector/collector.c b/gprofng/libcollector/collector.c
+index 3a8f27a719d..2ff95e58fde 100644
+--- a/gprofng/libcollector/collector.c
++++ b/gprofng/libcollector/collector.c
+@@ -210,15 +210,10 @@ get_collector_interface ()
+ static void
+ collector_module_init (CollectorInterface *col_intf)
+ {
+-  int nmodules = 0;
+-
+   ModuleInitFunc next_init = (ModuleInitFunc) dlsym (RTLD_DEFAULT, "__collector_module_init");
+   if (next_init != NULL)
+-    {
+-      nmodules++;
+-      next_init (col_intf);
+-    }
+-  TprintfT (DBG_LT1, "collector_module_init: %d modules\n", nmodules);
++    next_init (col_intf);
++  TprintfT (DBG_LT1, "collector_module_init: %d modules\n", next_init ? 1 : 0);
+ }
+ 
+ /*   Routines concerned with general experiment start and stop */
+@@ -1783,7 +1778,7 @@ __collector_pause ()
+ }
+ 
+ void
+-__collector_pause_m (char *reason)
++__collector_pause_m (const char *reason)
+ {
+   hrtime_t now;
+   char xreason[MAXPATHLEN];
+@@ -2449,8 +2444,8 @@ __collector_dlog (int tflag, int level, char *format, ...)
+ 
+ static void (*__real__exit) (int status) = NULL; /* libc only: _exit */
+ static void (*__real__Exit) (int status) = NULL; /* libc only: _Exit */
+-void _exit () __attribute__ ((weak, alias ("__collector_exit")));
+-void _Exit () __attribute__ ((weak, alias ("__collector_Exit")));
++void _exit (int status) __attribute__ ((weak, alias ("__collector_exit")));
++void _Exit (int status) __attribute__ ((weak, alias ("__collector_Exit")));
+ 
+ void
+ __collector_exit (int status)
+diff --git a/gprofng/libcollector/collector.h b/gprofng/libcollector/collector.h
+index 07a03bdd17a..eda68a0e4f5 100644
+--- a/gprofng/libcollector/collector.h
++++ b/gprofng/libcollector/collector.h
+@@ -123,7 +123,7 @@ extern void __collector_terminate_expt ();
+ extern void __collector_terminate_hook ();
+ extern void __collector_sample (char *name);
+ extern void __collector_pause ();
+-extern void __collector_pause_m ();
++extern void __collector_pause_m (const char *reason);
+ extern void __collector_resume ();
+ extern int collector_sigemt_sigaction (const struct sigaction*,
+ 				       struct sigaction*);
+diff --git a/gprofng/libcollector/collectorAPI.c b/gprofng/libcollector/collectorAPI.c
+index 5fa6403ad49..449bbbaab65 100644
+--- a/gprofng/libcollector/collectorAPI.c
++++ b/gprofng/libcollector/collectorAPI.c
+@@ -26,16 +26,17 @@
+ #include "collectorAPI.h"
+ #include "gp-experiment.h"
+ 
+-static void *__real_collector_sample = NULL;
+-static void *__real_collector_pause = NULL;
+-static void *__real_collector_resume = NULL;
+-static void *__real_collector_terminate_expt = NULL;
+-static void *__real_collector_func_load = NULL;
+-static void *__real_collector_func_unload = NULL;
++static void (*__real_collector_sample)(const char *) = NULL;
++static void (*__real_collector_pause)() = NULL;
++static void (*__real_collector_resume)() = NULL;
++static void (*__real_collector_terminate_expt)() = NULL;
++static void (*__real_collector_func_load)(const char *, const char *,
++		const char *, void *, int, int, Lineno *) = NULL;
++static void (*__real_collector_func_unload)(void *) = NULL;
+ 
+ #define INIT_API        if (init_API == 0) collectorAPI_initAPI()
+ #define NULL_PTR(x)     (__real_##x == NULL)
+-#define CALL_REAL(x)    (*(void(*)())__real_##x)
++#define CALL_REAL(x)    (__real_##x)
+ #define CALL_IF_REAL(x) INIT_API; if (!NULL_PTR(x)) CALL_REAL(x)
+ 
+ static int init_API = 0;
+diff --git a/gprofng/libcollector/dispatcher.c b/gprofng/libcollector/dispatcher.c
+index 8b8ad77b5ee..f7cd46e7e6b 100644
+--- a/gprofng/libcollector/dispatcher.c
++++ b/gprofng/libcollector/dispatcher.c
+@@ -908,8 +908,9 @@ sigset (int sig, sighandler_t handler)
+ 
+ // map interposed symbol versions
+ static int
+-gprofng_timer_create (int (real_func) (), clockid_t clockid,
+-                      struct sigevent *sevp, timer_t *timerid)
++gprofng_timer_create (int (real_func) (clockid_t, struct sigevent *, timer_t *),
++		      clockid_t clockid,
++		      struct sigevent *sevp, timer_t *timerid)
+ {
+   // collector reserves SIGPROF
+   if (sevp == NULL || sevp->sigev_notify != SIGEV_SIGNAL ||
+@@ -1044,7 +1045,7 @@ __collector_thr_sigsetmask (int how, const sigset_t* iset, sigset_t* oset)
+ // map interposed symbol versions
+ 
+ static int
+-gprofng_pthread_sigmask (int (real_func) (),
++gprofng_pthread_sigmask (int (real_func) (int, const sigset_t *, sigset_t*),
+                          int how, const sigset_t *iset, sigset_t* oset)
+ {
+   sigset_t lsigset;
+@@ -1139,9 +1140,10 @@ collector_root (void *cargs)
+ // map interposed symbol versions
+ 
+ static int
+-gprofng_pthread_create (int (real_func) (), pthread_t *thread,
+-                        const pthread_attr_t *attr,
+-                        void *(*func)(void*), void *arg)
++gprofng_pthread_create (int (real_func) (pthread_t *, const pthread_attr_t *,
++					 void *(*)(void *), void *),
++			pthread_t *thread, const pthread_attr_t *attr,
++			void *(*func)(void*), void *arg)
+ {
+   TprintfT (DBG_LTT, "gprofng_pthread_create @%p\n", real_func);
+   if (dispatch_mode != DISPATCH_ON)
+@@ -1276,6 +1278,7 @@ __collector_ext_clone_pthread (int (*fn)(void *), void *child_stack, int flags,
+ }
+ 
+ // weak symbols:
+-int sigprocmask () __attribute__ ((weak, alias ("__collector_sigprocmask")));
+-int thr_sigsetmask () __attribute__ ((weak, alias ("__collector_thr_sigsetmask")));
++int sigprocmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_sigprocmask")));
++int thr_sigsetmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_thr_sigsetmask")));
+ int setitimer () __attribute__ ((weak, alias ("_setitimer")));
++
+diff --git a/gprofng/libcollector/iotrace.c b/gprofng/libcollector/iotrace.c
+index 18060864796..3deb441d9c7 100644
+--- a/gprofng/libcollector/iotrace.c
++++ b/gprofng/libcollector/iotrace.c
+@@ -1350,7 +1350,7 @@ mkstemp (char *template)
+   unsigned pktSize;
+   if (NULL_PTR (mkstemp))
+     init_io_intf ();
+-  if (CHCK_REENTRANCE (guard) || template == NULL)
++  if (CHCK_REENTRANCE (guard))
+     return CALL_REAL (mkstemp)(template);
+   PUSH_REENTRANCE (guard);
+   hrtime_t reqt = gethrtime ();
+@@ -1405,7 +1405,7 @@ mkstemps (char *template, int slen)
+   unsigned pktSize;
+   if (NULL_PTR (mkstemps))
+     init_io_intf ();
+-  if (CHCK_REENTRANCE (guard) || template == NULL)
++  if (CHCK_REENTRANCE (guard))
+     return CALL_REAL (mkstemps)(template, slen);
+   PUSH_REENTRANCE (guard);
+   hrtime_t reqt = gethrtime ();
+@@ -1485,7 +1485,7 @@ close (int fildes)
+ 
+ /*------------------------------------------------------------- fopen */
+ static FILE*
+-gprofng_fopen (FILE*(real_fopen) (), const char *filename, const char *mode)
++gprofng_fopen (FILE*(real_fopen) (const char *, const char *), const char *filename, const char *mode)
+ {
+   int *guard;
+   FILE *fp = NULL;
+@@ -1559,7 +1559,7 @@ DCL_FOPEN (fopen)
+ 
+ /*------------------------------------------------------------- fclose */
+ static int
+-gprofng_fclose (int(real_fclose) (), FILE *stream)
++gprofng_fclose (int(real_fclose) (FILE *), FILE *stream)
+ {
+   int *guard;
+   int stat;
+@@ -1645,7 +1645,7 @@ fflush (FILE *stream)
+ 
+ /*------------------------------------------------------------- fdopen */
+ static FILE*
+-gprofng_fdopen (FILE*(real_fdopen) (), int fildes, const char *mode)
++gprofng_fdopen (FILE*(real_fdopen) (int, const char *), int fildes, const char *mode)
+ {
+   int *guard;
+   FILE *fp = NULL;
+@@ -2957,7 +2957,7 @@ DCL_FGETPOS (fgetpos)
+ 
+ /*------------------------------------------------------------- fgetpos64 */
+ static int
+-gprofng_fgetpos64 (int(real_fgetpos64) (), FILE *stream, fpos64_t *pos)
++gprofng_fgetpos64 (int(real_fgetpos64) (FILE *, fpos64_t *), FILE *stream, fpos64_t *pos)
+ {
+   int *guard;
+   int ret;
+diff --git a/gprofng/libcollector/libcol_util.c b/gprofng/libcollector/libcol_util.c
+index 1e58cf491a1..baac15db5c4 100644
+--- a/gprofng/libcollector/libcol_util.c
++++ b/gprofng/libcollector/libcol_util.c
+@@ -1013,7 +1013,6 @@ __collector_open (const char *path, int oflag, ...)
+   mode_t mode = 0;
+ 
+   hrtime_t t_timeout = __collector_gethrtime () + 5 * ((hrtime_t) NANOSEC);
+-  int nretries = 0;
+   long long delay = 100; /* start at some small, arbitrary value */
+ 
+   /* get optional mode argument if it's expected/required */
+@@ -1058,7 +1057,6 @@ __collector_open (const char *path, int oflag, ...)
+       delay *= 2;
+       if (delay > 100000000)
+ 	delay = 100000000; /* cap at some large, arbitrary value */
+-      nretries++;
+     }
+   return fd;
+ }
+diff --git a/gprofng/libcollector/libcol_util.h b/gprofng/libcollector/libcol_util.h
+index c8ec83ff0d9..aa30db72bcc 100644
+--- a/gprofng/libcollector/libcol_util.h
++++ b/gprofng/libcollector/libcol_util.h
+@@ -81,12 +81,6 @@ extern int __collector_mutex_trylock (collector_mutex_t *mp);
+ #define __collector_mutex_init(xx) \
+   do { collector_mutex_t tmp=COLLECTOR_MUTEX_INITIALIZER; *(xx)=tmp; } while(0)
+ 
+-void __collector_sample (char *name);
+-void __collector_terminate_expt ();
+-void __collector_pause ();
+-void __collector_pause_m ();
+-void __collector_resume ();
+-
+ struct DT_lineno;
+ 
+ typedef enum
+diff --git a/gprofng/libcollector/linetrace.c b/gprofng/libcollector/linetrace.c
+index 67b2d7e9030..66844bc1337 100644
+--- a/gprofng/libcollector/linetrace.c
++++ b/gprofng/libcollector/linetrace.c
+@@ -1207,7 +1207,7 @@ __collector_vfork (void)
+ }
+ 
+ /*------------------------------------------------------------- execve */
+-int execve () __attribute__ ((weak, alias ("__collector_execve")));
++int execve (const char *, char *const [], char *const []) __attribute__ ((weak, alias ("__collector_execve")));
+ 
+ int
+ __collector_execve (const char* path, char *const argv[], char *const envp[])
+@@ -1237,7 +1237,7 @@ __collector_execve (const char* path, char *const argv[], char *const envp[])
+   return ret;
+ }
+ 
+-int execvp () __attribute__ ((weak, alias ("__collector_execvp")));
++int execvp (const char *, char *const []) __attribute__ ((weak, alias ("__collector_execvp")));
+ 
+ int
+ __collector_execvp (const char* file, char *const argv[])
+@@ -1269,7 +1269,7 @@ __collector_execvp (const char* file, char *const argv[])
+   return ret;
+ }
+ 
+-int execv () __attribute__ ((weak, alias ("__collector_execv")));
++int execv (const char *, char *const []) __attribute__ ((weak, alias ("__collector_execv")));
+ 
+ int
+ __collector_execv (const char* path, char *const argv[])
+@@ -1408,7 +1408,10 @@ __collector_execl (const char* path, const char *arg0, ...)
+ /*-------------------------------------------------------- posix_spawn */
+ // map interposed symbol versions
+ static int
+-gprofng_posix_spawn (int(real_posix_spawn) (),
++gprofng_posix_spawn (int(real_posix_spawn) (pid_t *, const char *,
++				const posix_spawn_file_actions_t *,
++				const posix_spawnattr_t *,
++				char *const [], char *const []),
+ 		     pid_t *pidp, const char *path,
+ 		     const posix_spawn_file_actions_t *file_actions,
+ 		     const posix_spawnattr_t *attrp,
+@@ -1466,7 +1469,10 @@ DCL_POSIX_SPAWN (posix_spawn)
+ 
+ /*-------------------------------------------------------- posix_spawnp */
+ static int
+-gprofng_posix_spawnp (int (real_posix_spawnp) (),
++gprofng_posix_spawnp (int (real_posix_spawnp) (pid_t *, const char *,
++				const posix_spawn_file_actions_t *,
++				const posix_spawnattr_t *,
++				char *const [], char *const []),
+                       pid_t *pidp, const char *path,
+                       const posix_spawn_file_actions_t *file_actions,
+                       const posix_spawnattr_t *attrp,
+@@ -1754,8 +1760,8 @@ __collector_clone (int (*fn)(void *), void *child_stack, int flags, void *arg,
+ }
+ 
+ /*-------------------------------------------------------------------- setuid */
+-int setuid () __attribute__ ((weak, alias ("__collector_setuid")));
+-int _setuid () __attribute__ ((weak, alias ("__collector_setuid")));
++int setuid (uid_t) __attribute__ ((weak, alias ("__collector_setuid")));
++int _setuid (uid_t) __attribute__ ((weak, alias ("__collector_setuid")));
+ 
+ int
+ __collector_setuid (uid_t ruid)
+@@ -1770,8 +1776,8 @@ __collector_setuid (uid_t ruid)
+ }
+ 
+ /*------------------------------------------------------------------- seteuid */
+-int seteuid () __attribute__ ((weak, alias ("__collector_seteuid")));
+-int _seteuid () __attribute__ ((weak, alias ("__collector_seteuid")));
++int seteuid (uid_t) __attribute__ ((weak, alias ("__collector_seteuid")));
++int _seteuid (uid_t) __attribute__ ((weak, alias ("__collector_seteuid")));
+ 
+ int
+ __collector_seteuid (uid_t euid)
+@@ -1786,8 +1792,8 @@ __collector_seteuid (uid_t euid)
+ }
+ 
+ /*------------------------------------------------------------------ setreuid */
+-int setreuid () __attribute__ ((weak, alias ("__collector_setreuid")));
+-int _setreuid () __attribute__ ((weak, alias ("__collector_setreuid")));
++int setreuid (uid_t, uid_t) __attribute__ ((weak, alias ("__collector_setreuid")));
++int _setreuid (uid_t, uid_t) __attribute__ ((weak, alias ("__collector_setreuid")));
+ 
+ int
+ __collector_setreuid (uid_t ruid, uid_t euid)
+@@ -1802,8 +1808,8 @@ __collector_setreuid (uid_t ruid, uid_t euid)
+ }
+ 
+ /*-------------------------------------------------------------------- setgid */
+-int setgid () __attribute__ ((weak, alias ("__collector_setgid")));
+-int _setgid () __attribute__ ((weak, alias ("__collector_setgid")));
++int setgid (gid_t) __attribute__ ((weak, alias ("__collector_setgid")));
++int _setgid (gid_t) __attribute__ ((weak, alias ("__collector_setgid")));
+ 
+ int
+ __collector_setgid (gid_t rgid)
+@@ -1818,8 +1824,8 @@ __collector_setgid (gid_t rgid)
+ }
+ 
+ /*------------------------------------------------------------------- setegid */
+-int setegid () __attribute__ ((weak, alias ("__collector_setegid")));
+-int _setegid () __attribute__ ((weak, alias ("__collector_setegid")));
++int setegid (gid_t) __attribute__ ((weak, alias ("__collector_setegid")));
++int _setegid (gid_t) __attribute__ ((weak, alias ("__collector_setegid")));
+ 
+ int
+ __collector_setegid (gid_t egid)
+@@ -1834,8 +1840,8 @@ __collector_setegid (gid_t egid)
+ }
+ 
+ /*------------------------------------------------------------------ setregid */
+-int setregid () __attribute__ ((weak, alias ("__collector_setregid")));
+-int _setregid () __attribute__ ((weak, alias ("__collector_setregid")));
++int setregid (gid_t, gid_t) __attribute__ ((weak, alias ("__collector_setregid")));
++int _setregid (gid_t, gid_t) __attribute__ ((weak, alias ("__collector_setregid")));
+ 
+ int
+ __collector_setregid (gid_t rgid, gid_t egid)
+diff --git a/gprofng/src/BaseMetricTreeNode.h b/gprofng/src/BaseMetricTreeNode.h
+index d73d244e27e..7698f9c6eaf 100644
+--- a/gprofng/src/BaseMetricTreeNode.h
++++ b/gprofng/src/BaseMetricTreeNode.h
+@@ -85,7 +85,6 @@ private:
+ 
+   BaseMetricTreeNode *root;     // root of tree
+   BaseMetricTreeNode *parent;   // my parent
+-  bool aggregation;             // value is based on children's values
+   char *name;           // bm->get_cmd() for metrics, unique string otherwise
+   char *uname;                  // user-visible text
+   char *unit;                   // see UNIT_* defines
+diff --git a/gprofng/src/Dbe.cc b/gprofng/src/Dbe.cc
+index 95daa727186..09b7f94eaa8 100644
+--- a/gprofng/src/Dbe.cc
++++ b/gprofng/src/Dbe.cc
+@@ -9591,14 +9591,12 @@ dbeGetTLDataRepVals (VMode view_mode, hrtime_t start_ts, hrtime_t delta,
+ 	}
+       if (sampleVals != NULL)
+ 	{
+-	  Sample* sample = (Sample*) packets->getObjValue (PROP_SMPLOBJ, packetIdx);
+-	  if (!sample || !sample->get_usage ())
+-	    sample = sample;
+-	  else
++	  Sample *sample = (Sample*) packets->getObjValue (PROP_SMPLOBJ, packetIdx);
++	  if (sample != NULL)
+ 	    {
+-	      PrUsage* prusage = sample->get_usage ();
+-	      Vector<long long> *mstateVals = prusage->getMstateValues ();
+-	      sampleVals->store (eventIdx, mstateVals);
++	      PrUsage *prusage = sample->get_usage ();
++	      if (prusage != NULL)
++		sampleVals->store (eventIdx, prusage->getMstateValues ());
+ 	    }
+ 	}
+     }
+diff --git a/gprofng/src/DbeSession.cc b/gprofng/src/DbeSession.cc
+index a6808d8d8f6..3649357bc79 100644
+--- a/gprofng/src/DbeSession.cc
++++ b/gprofng/src/DbeSession.cc
+@@ -1164,8 +1164,6 @@ DbeSession::open_experiment (Experiment *exp, char *path)
+   closedir (exp_dir);
+   exp_names->sort (dir_name_cmp);
+   Experiment **t_exp_list = new Experiment *[exp_names->size ()];
+-  int nsubexps = 0;
+-
+   for (int j = 0, jsz = exp_names->size (); j < jsz; j++)
+     {
+       t_exp_list[j] = NULL;
+@@ -1222,7 +1220,6 @@ DbeSession::open_experiment (Experiment *exp, char *path)
+ 	dexp->open (dpath);
+       append (dexp);
+       t_exp_list[j] = dexp;
+-      nsubexps++;
+       dexp->set_clock (exp->clock);
+ 
+       // DbeView add_experiment() is split into two parts
+diff --git a/gprofng/src/Disasm.cc b/gprofng/src/Disasm.cc
+index e41bf679292..19f2174d536 100644
+--- a/gprofng/src/Disasm.cc
++++ b/gprofng/src/Disasm.cc
+@@ -49,7 +49,6 @@ struct DisContext
+ };
+ 
+ static const int MAX_DISASM_STR     = 2048;
+-static const int MAX_INSTR_SIZE     = 8;
+ 
+ Disasm::Disasm (char *fname)
+ {
+diff --git a/gprofng/src/Experiment.cc b/gprofng/src/Experiment.cc
+index a1f78fc0cde..627a755c88c 100644
+--- a/gprofng/src/Experiment.cc
++++ b/gprofng/src/Experiment.cc
+@@ -1937,8 +1937,6 @@ private:
+   }
+ 
+   Experiment *exp;
+-  char *hostname;
+-  hrtime_t time, tstamp;
+ };
+ 
+ void
+diff --git a/gprofng/src/HashMap.h b/gprofng/src/HashMap.h
+index 918c0dc95f9..c5fdd345ba8 100644
+--- a/gprofng/src/HashMap.h
++++ b/gprofng/src/HashMap.h
+@@ -78,9 +78,8 @@ copy_key (uint64_t a)
+ }
+ 
+ template<> inline void
+-delete_key (uint64_t a)
++delete_key (uint64_t)
+ {
+-  a = a;
+ }
+ 
+ template<> inline int
+diff --git a/gprofng/src/IOActivity.h b/gprofng/src/IOActivity.h
+index cf462cf8d55..f3a22ada6b1 100644
+--- a/gprofng/src/IOActivity.h
++++ b/gprofng/src/IOActivity.h
+@@ -78,7 +78,6 @@ private:
+   Hist_data *hist_data_file_all;
+   Hist_data *hist_data_vfd_all;
+   Hist_data *hist_data_callstack_all;
+-  Hist_data *hist_data_callstack;
+ 
+   DbeView *dbev;
+ };
+diff --git a/gprofng/src/collctrl.cc b/gprofng/src/collctrl.cc
+index 029c0387f19..c0234130f00 100644
+--- a/gprofng/src/collctrl.cc
++++ b/gprofng/src/collctrl.cc
+@@ -880,9 +880,7 @@ Coll_Ctrl::set_clkprof (const char *string, char** warn)
+       double dval = strtod (string, &endchar);
+       if (*endchar == 'm' || *endchar == 0) /* user specified milliseconds */
+ 	dval = dval * 1000.;
+-      else if (*endchar == 'u') /* user specified microseconds */
+-	dval = dval;
+-      else
++      else if (*endchar != 'u')
+ 	return dbe_sprintf (GTXT ("Unrecognized clock-profiling interval `%s'\n"), string);
+       nclkprof_timer = (int) (dval + 0.5);
+     }
+@@ -2791,7 +2789,7 @@ Coll_Ctrl::get (char * control)
+     }
+   if (!strncmp (control, ipc_str_javaprof, len))
+     {
+-      if ((java_mode == 0))
++      if (java_mode == 0)
+ 	return strdup (ipc_str_off);
+       return strdup (ipc_str_on);
+     }
+@@ -2807,7 +2805,7 @@ Coll_Ctrl::get (char * control)
+     }
+   if (!strncmp (control, ipc_str_sample_sig, len))
+     {
+-      if ((sample_sig == 0))
++      if (sample_sig == 0)
+ 	return strdup (ipc_str_off);
+       char *str_signal = find_signal_name (sample_sig);
+       if (str_signal != NULL)
+@@ -2841,15 +2839,15 @@ Coll_Ctrl::get (char * control)
+     }
+   if (!strncmp (control, ipc_str_iotrace, len))
+     {
+-      if ((iotrace_enabled == 0))
++      if (iotrace_enabled == 0)
+ 	return strdup (ipc_str_off);
+       return strdup (ipc_str_on);
+     }
+   if (!strncmp (control, ipc_str_count, len))
+     {
+-      if ((count_enabled == 0))
++      if (count_enabled == 0)
+ 	return strdup (ipc_str_off);
+-      if ((count_enabled < 0))
++      if (count_enabled < 0)
+ 	return strdup ("on\nstatic");
+       return strdup (ipc_str_on);
+     }
+diff --git a/gprofng/src/collctrl.h b/gprofng/src/collctrl.h
+index a41647440ac..e2a8e450890 100644
+--- a/gprofng/src/collctrl.h
++++ b/gprofng/src/collctrl.h
+@@ -272,7 +272,6 @@ private:
+   char *node_name;      /* name of machine on which experiment is run */
+   long ncpus;           /* number of online CPUs */
+   int cpu_clk_freq;     /* chip clock (MHz.), as reported from processor_info */
+-  int cpc_cpuver;       /* chip version, as reported from libcpc */
+   long sys_resolution;  /* system clock resolution */
+   int sample_period;    /* period for sampling, seconds */
+   int sample_default;    /* if period for sampling set by default */
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index bb48eadb9f8..ebcdbca561f 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -40,12 +40,12 @@ struct tm;
+  * If you add any, please put it in the right place */
+ typedef struct CollectorUtilFuncs
+ {
+-  int (*access)();
++  int (*access)(const char *, int);
+   int (*atoi)(const char *nptr);
+   void *(*calloc)(size_t nelem, size_t elsize);
+   int (*clearenv)(void);
+   int (*close)(int);
+-  int (*closedir)();
++  int (*closedir)(DIR *);
+   int (*execv)(const char *path, char *const argv[]);
+   void (*exit)(int status);
+   int (*fclose)(FILE *stream);
+@@ -66,20 +66,20 @@ typedef struct CollectorUtilFuncs
+   off_t (*lseek)(int fd, off_t offset, int whence);
+   void *(*malloc)(size_t size);
+   void *(*memset)(void *s1, int c, size_t n);
+-  int (*mkdir)();
++  int (*mkdir)(const char *, mode_t);
+   time_t (*mktime)(struct tm *timeptr);
+   void *(*mmap)(void *, size_t, int, int, int, off_t);
+-  void *(*mmap64_)();
+-  int (*munmap)();
++  void *(*mmap64_)(void *, size_t, int, int, int, off_t);
++  int (*munmap)(void *, size_t);
+   int (*open)(const char *, int, ...);
+   int (*open_bare)(const char *, int, ...);
+-  DIR *(*opendir)();
++  DIR *(*opendir)(const char *);
+   int (*pclose)(FILE *stream);
+   FILE *(*popen)(const char *command, const char *mode);
+   int (*putenv)(char *string);
+-  ssize_t (*pwrite)();
+-  ssize_t (*pwrite64_)();
+-  ssize_t (*read)();
++  ssize_t (*pwrite)(int, const void *, size_t, off_t);
++  ssize_t (*pwrite64_)(int, const void *, size_t, off_t);
++  ssize_t (*read)(int, void *, size_t);
+   int (*setenv)(const char *name, const char *value, int overwrite);
+   int (*sigfillset)(sigset_t *set);
+   int (*sigprocmask)(int how, const sigset_t *set, sigset_t *oldset);
+@@ -112,7 +112,7 @@ typedef struct CollectorUtilFuncs
+   int (*unsetenv)(const char *name);
+   int (*vsnprintf)(char *str, size_t size, const char *format, va_list ap);
+   pid_t (*waitpid)(pid_t pid, int *stat_loc, int options);
+-  ssize_t (*write)();
++  ssize_t (*write)(int, void *, size_t);
+   double (*atof)();
+   void *n_a;
+ } CollectorUtilFuncs;
+diff --git a/gprofng/src/gp-display-src.cc b/gprofng/src/gp-display-src.cc
+index 200e6080d2e..24af375edf1 100644
+--- a/gprofng/src/gp-display-src.cc
++++ b/gprofng/src/gp-display-src.cc
+@@ -75,14 +75,6 @@ private:
+   bool v_opt;
+   int multiple;
+   char *str_compcom;
+-  bool hex_visible;
+-  int src_visible;
+-  int vis_src;
+-  int vis_dis;
+-  int threshold_src;
+-  int threshold_dis;
+-  int threshold;
+-  int vis_bits;
+ };
+ 
+ static int
+diff --git a/gprofng/src/gp-print.h b/gprofng/src/gp-print.h
+index 1b748ea60a3..1a8ad3b6c13 100644
+--- a/gprofng/src/gp-print.h
++++ b/gprofng/src/gp-print.h
+@@ -19,7 +19,7 @@
+    MA 02110-1301, USA.  */
+ 
+ #ifndef _GP_PRINT_H
+-#define _ER_PRINT_H
++#define _GP_PRINT_H
+ 
+ #include "Command.h"
+ #include "DbeApplication.h"
+diff --git a/gprofng/src/hwc_intel_icelake.h b/gprofng/src/hwc_intel_icelake.h
+index 46f4ac5005f..4fe2e26f63b 100644
+--- a/gprofng/src/hwc_intel_icelake.h
++++ b/gprofng/src/hwc_intel_icelake.h
+@@ -24,8 +24,10 @@
+ #define SH(val, n) (((unsigned long long) (val)) << n)
+ #define I(nm, event, umask, edge, cmask, inv, \
+ 	  offcore_rsp, ldlat, frontend, period, mtr) \
+-	  INIT_HWC(nm, mtr, SH(event, 0) | SH(umask, 8) | SH(edge, 18) \
+-		     | SH(cmask, 24) | SH(inv, 23), PERF_TYPE_RAW), \
++	  .use_perf_event_type = 1, .type = PERF_TYPE_RAW, \
++	  .name = (nm), .metric = (mtr), .reg_num = REGNO_ANY, \
++	  .config = SH(event, 0) | SH(umask, 8) | SH(edge, 18) | SH(cmask, 24) \
++		  | SH(inv, 23), \
+ 	  .config1 = SH(offcore_rsp, 0) | SH(ldlat, 0) | SH(frontend, 0), \
+ 	  .val = period
+ 
+diff --git a/gprofng/src/util.cc b/gprofng/src/util.cc
+index 201f7088b66..228140b61ae 100644
+--- a/gprofng/src/util.cc
++++ b/gprofng/src/util.cc
+@@ -741,17 +741,13 @@ get_relative_link (const char *path_from, const char *path_to)
+   s2 = canonical_path (s2);
+   long l = dbe_sstrlen (s1);
+   // try to find common directories
+-  int common_slashes = 0;
+   int last_common_slash = -1;
+   for (int i = 0; i < l; i++)
+     {
+-      if (s1[i] != s2[i]) break;
+-      if (s1[i] == 0) break;
++      if (s1[i] != s2[i] || s1[i] == 0)
++	break;
+       if (s1[i] == '/')
+-	{
+-	  common_slashes++;
+-	  last_common_slash = i;
+-	}
++	last_common_slash = i;
+     }
+   // find slashes in remaining path_to
+   int slashes = 0;
+-- 
+2.50.1
+
diff --git a/package/binutils/2.43.1/0006-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch b/package/binutils/2.43.1/0006-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch
new file mode 100644
index 0000000000..7c6ed290f9
--- /dev/null
+++ b/package/binutils/2.43.1/0006-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch
@@ -0,0 +1,619 @@
+From a5be89126b9bee78224be842e3086ce99dc045e6 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 16 Nov 2024 05:13:48 +0000
+Subject: [PATCH] gprofng: fix -std=gnu23 compatibility wrt unprototyped
+ functions
+
+C23 removes support for unprototyped functions. Fix function pointer types
+accordingly.
+
+This does not fix all instances, there's a few left as I commented on in
+PR32374 (e.g. setitimer which I have a local workaround for but it involves
+a glibc implementation detail; the Linaro precommit CI tester pointed that
+out too, so dropped that).
+
+ChangeLog:
+	PR gprofng/32374
+
+	* libcollector/collector.c (collector_sample): Fix prototype.
+	* libcollector/envmgmt.c (putenv): Ditto.
+	(_putenv): Ditto.
+	(__collector_putenv): Ditto.
+	(setenv): Ditto.
+	(_setenv): Ditto.
+	(__collector_setenv): Ditto.
+	(unsetenv): Ditto.
+	(_unsetenv): Ditto.
+	(__collector_unsetenv): Ditto.
+	* libcollector/jprofile.c (open_experiment): Ditto.
+	(__collector_jprofile_enable_synctrace): Ditto.
+	(jprof_find_asyncgetcalltrace): Ditto.
+	* libcollector/libcol_util.c (__collector_util_init): Ditto.
+	(ARCH): Ditto.
+	* libcollector/mmaptrace.c (collector_func_load): Ditto.
+	(collector_func_unload): Ditto.
+	* libcollector/unwind.c (__collector_ext_unwind_init): Ditto.
+	* src/collector_module.h: Ditto.
+
+Upstream: a2f774427e078f3da2c06bdea25f77a61979a695
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ gprofng/libcollector/collector.c   |  2 +-
+ gprofng/libcollector/dispatcher.c  |  1 -
+ gprofng/libcollector/envmgmt.c     | 24 ++++-----
+ gprofng/libcollector/jprofile.c    | 10 ++--
+ gprofng/libcollector/libcol_util.c | 84 +++++++++++++++---------------
+ gprofng/libcollector/mmaptrace.c   |  4 +-
+ gprofng/libcollector/unwind.c      |  2 +-
+ gprofng/src/collector_module.h     |  2 +-
+ 8 files changed, 64 insertions(+), 65 deletions(-)
+
+diff --git a/gprofng/libcollector/collector.c b/gprofng/libcollector/collector.c
+index 2ff95e58fde..3cab346e7dc 100644
+--- a/gprofng/libcollector/collector.c
++++ b/gprofng/libcollector/collector.c
+@@ -1578,7 +1578,7 @@ __collector_resume_experiment ()
+ }
+ 
+ /* Code to support Samples and Pause/Resume */
+-void collector_sample () __attribute__ ((weak, alias ("__collector_sample")));
++void collector_sample (char *name) __attribute__ ((weak, alias ("__collector_sample")));
+ void
+ __collector_sample (char *name)
+ {
+diff --git a/gprofng/libcollector/dispatcher.c b/gprofng/libcollector/dispatcher.c
+index f7cd46e7e6b..4eda18ec324 100644
+--- a/gprofng/libcollector/dispatcher.c
++++ b/gprofng/libcollector/dispatcher.c
+@@ -1281,4 +1281,3 @@ __collector_ext_clone_pthread (int (*fn)(void *), void *child_stack, int flags,
+ int sigprocmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_sigprocmask")));
+ int thr_sigsetmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_thr_sigsetmask")));
+ int setitimer () __attribute__ ((weak, alias ("_setitimer")));
+-
+diff --git a/gprofng/libcollector/envmgmt.c b/gprofng/libcollector/envmgmt.c
+index a399c0d0cb4..f2bf2c41bfb 100644
+--- a/gprofng/libcollector/envmgmt.c
++++ b/gprofng/libcollector/envmgmt.c
+@@ -685,8 +685,8 @@ __collector_env_update (char *envp[])
+ 
+ 
+ /*------------------------------------------------------------- putenv */
+-int putenv () __attribute__ ((weak, alias ("__collector_putenv")));
+-int _putenv () __attribute__ ((weak, alias ("__collector_putenv")));
++int putenv (char*) __attribute__ ((weak, alias ("__collector_putenv")));
++int _putenv (char*) __attribute__ ((weak, alias ("__collector_putenv")));
+ 
+ int
+ __collector_putenv (char * string)
+@@ -694,9 +694,9 @@ __collector_putenv (char * string)
+   if (CALL_UTIL (putenv) == __collector_putenv ||
+       CALL_UTIL (putenv) == NULL)
+     { // __collector_libc_funcs_init failed
+-      CALL_UTIL (putenv) = (int(*)())dlsym (RTLD_NEXT, "putenv");
++      CALL_UTIL (putenv) = (int(*)(char*))dlsym (RTLD_NEXT, "putenv");
+       if (CALL_UTIL (putenv) == NULL || CALL_UTIL (putenv) == __collector_putenv)
+-	  CALL_UTIL (putenv) = (int(*)())dlsym (RTLD_DEFAULT, "putenv");
++	  CALL_UTIL (putenv) = (int(*)(char*))dlsym (RTLD_DEFAULT, "putenv");
+       if (CALL_UTIL (putenv) == NULL || CALL_UTIL (putenv) == __collector_putenv)
+ 	{
+ 	  TprintfT (DBG_LT2, "__collector_putenv(): ERROR: no pointer found.\n");
+@@ -712,8 +712,8 @@ __collector_putenv (char * string)
+ }
+ 
+ /*------------------------------------------------------------- setenv */
+-int setenv () __attribute__ ((weak, alias ("__collector_setenv")));
+-int _setenv () __attribute__ ((weak, alias ("__collector_setenv")));
++int setenv (const char*, const char*, int) __attribute__ ((weak, alias ("__collector_setenv")));
++int _setenv (const char*, const char*, int) __attribute__ ((weak, alias ("__collector_setenv")));
+ 
+ int
+ __collector_setenv (const char *name, const char *value, int overwrite)
+@@ -721,9 +721,9 @@ __collector_setenv (const char *name, const char *value, int overwrite)
+   if (CALL_UTIL (setenv) == __collector_setenv ||
+       CALL_UTIL (setenv) == NULL)
+     { // __collector_libc_funcs_init failed
+-      CALL_UTIL (setenv) = (int(*)())dlsym (RTLD_NEXT, "setenv");
++      CALL_UTIL (setenv) = (int(*)(const char*, const char*, int))dlsym (RTLD_NEXT, "setenv");
+       if (CALL_UTIL (setenv) == NULL || CALL_UTIL (setenv) == __collector_setenv)
+-	CALL_UTIL (setenv) = (int(*)())dlsym (RTLD_DEFAULT, "setenv");
++	CALL_UTIL (setenv) = (int(*)(const char*, const char*, int))dlsym (RTLD_DEFAULT, "setenv");
+       if (CALL_UTIL (setenv) == NULL || CALL_UTIL (setenv) == __collector_setenv)
+ 	{
+ 	  TprintfT (DBG_LT2, "__collector_setenv(): ERROR: no pointer found.\n");
+@@ -758,8 +758,8 @@ __collector_setenv (const char *name, const char *value, int overwrite)
+ }
+ 
+ /*------------------------------------------------------------- unsetenv */
+-int unsetenv () __attribute__ ((weak, alias ("__collector_unsetenv")));
+-int _unsetenv () __attribute__ ((weak, alias ("__collector_unsetenv")));
++int unsetenv (const char*) __attribute__ ((weak, alias ("__collector_unsetenv")));
++int _unsetenv (const char*) __attribute__ ((weak, alias ("__collector_unsetenv")));
+ 
+ int
+ __collector_unsetenv (const char *name)
+@@ -767,9 +767,9 @@ __collector_unsetenv (const char *name)
+   if (CALL_UTIL (unsetenv) == __collector_unsetenv ||
+       CALL_UTIL (unsetenv) == NULL)
+     { // __collector_libc_funcs_init failed
+-      CALL_UTIL (unsetenv) = (int(*)())dlsym (RTLD_NEXT, "unsetenv");
++      CALL_UTIL (unsetenv) = (int(*)(const char*))dlsym (RTLD_NEXT, "unsetenv");
+       if (CALL_UTIL (unsetenv) == NULL || CALL_UTIL (unsetenv) == __collector_unsetenv)
+-	CALL_UTIL (unsetenv) = (int(*)())dlsym (RTLD_DEFAULT, "unsetenv");
++	CALL_UTIL (unsetenv) = (int(*)(const char*))dlsym (RTLD_DEFAULT, "unsetenv");
+       if (CALL_UTIL (unsetenv) == NULL || CALL_UTIL (unsetenv) == __collector_unsetenv)
+ 	{
+ 	  TprintfT (DBG_LT2, "__collector_unsetenv(): ERROR: no pointer found.\n");
+diff --git a/gprofng/libcollector/jprofile.c b/gprofng/libcollector/jprofile.c
+index cd498bed0a3..d8f2d049a84 100644
+--- a/gprofng/libcollector/jprofile.c
++++ b/gprofng/libcollector/jprofile.c
+@@ -99,8 +99,8 @@ static void rwrite (int fd, const void *buf, size_t nbyte);
+ static void addToDynamicArchive (const char* name, const unsigned char* class_data, int class_data_len);
+ static void (*AsyncGetCallTrace)(JVMPI_CallTrace*, jint, ucontext_t*) = NULL;
+ static void (*collector_heap_record)(int, int, void*) = NULL;
+-static void (*collector_jsync_begin)() = NULL;
+-static void (*collector_jsync_end)(hrtime_t, void *) = NULL;
++static void (*collector_jsync_begin)(void) = NULL;
++static void (*collector_jsync_end)(hrtime_t, void*) = NULL;
+ 
+ #define gethrtime collector_interface->getHiResTime
+ 
+@@ -224,7 +224,7 @@ open_experiment (const char *exp)
+       else if (__collector_strStartWith (args, "s:") == 0)
+ 	{
+ 	  java_sync_mode = 1;
+-	  collector_jsync_begin = (void(*)(hrtime_t, void *))dlsym (RTLD_DEFAULT, "__collector_jsync_begin");
++	  collector_jsync_begin = (void(*)(void))dlsym (RTLD_DEFAULT, "__collector_jsync_begin");
+ 	  collector_jsync_end = (void(*)(hrtime_t, void *))dlsym (RTLD_DEFAULT, "__collector_jsync_end");
+ 	}
+ #endif
+@@ -249,7 +249,7 @@ __collector_jprofile_enable_synctrace ()
+       return;
+     }
+   java_sync_mode = 1;
+-  collector_jsync_begin = (void(*)(hrtime_t, void *))dlsym (RTLD_DEFAULT, "__collector_jsync_begin");
++  collector_jsync_begin = (void(*)(void))dlsym (RTLD_DEFAULT, "__collector_jsync_begin");
+   collector_jsync_end = (void(*)(hrtime_t, void *))dlsym (RTLD_DEFAULT, "__collector_jsync_end");
+   TprintfT (DBG_LT1, "jprofile: turning on Java synctrace, and requesting events\n");
+ }
+@@ -1123,7 +1123,7 @@ jprof_find_asyncgetcalltrace ()
+ {
+   void *jvmhandle;
+   if (__collector_VM_ReadByteInstruction == NULL)
+-    __collector_VM_ReadByteInstruction = (int(*)()) dlsym (RTLD_DEFAULT, "Async_VM_ReadByteInstruction");
++    __collector_VM_ReadByteInstruction = (int(*)(unsigned char*)) dlsym (RTLD_DEFAULT, "Async_VM_ReadByteInstruction");
+ 
+   /* look for stack unwind function using default path */
+   AsyncGetCallTrace = (void (*)(JVMPI_CallTrace*, jint, ucontext_t*))
+diff --git a/gprofng/libcollector/libcol_util.c b/gprofng/libcollector/libcol_util.c
+index baac15db5c4..a73488e3f60 100644
+--- a/gprofng/libcollector/libcol_util.c
++++ b/gprofng/libcollector/libcol_util.c
+@@ -1114,7 +1114,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "munmap");
+   if (ptr)
+-    __collector_util_funcs.munmap = (int(*)())ptr;
++    __collector_util_funcs.munmap = (int(*)(void *, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT munmap: %s\n", dlerror ());
+@@ -1123,7 +1123,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "close");
+   if (ptr)
+-    __collector_util_funcs.close = (int(*)())ptr;
++    __collector_util_funcs.close = (int(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT close: %s\n", dlerror ());
+@@ -1158,7 +1158,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "close");
+   if (ptr)
+-    __collector_util_funcs.close = (int(*)())ptr;
++    __collector_util_funcs.close = (int(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT close: %s\n", dlerror ());
+@@ -1167,7 +1167,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "read");
+   if (ptr)
+-    __collector_util_funcs.read = (ssize_t (*)())ptr;
++    __collector_util_funcs.read = (ssize_t (*)(int, void*, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT read: %s\n", dlerror ());
+@@ -1176,7 +1176,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "write");
+   if (ptr)
+-    __collector_util_funcs.write = (ssize_t (*)())ptr;
++    __collector_util_funcs.write = (ssize_t (*)(int, void*, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT write: %s\n", dlerror ());
+@@ -1186,14 +1186,14 @@ __collector_util_init ()
+ #if ARCH(Intel) && WSIZE(32)
+   ptr = dlvsym (libc, "pwrite", "GLIBC_2.2"); // it is in /lib/libpthread.so.0
+   if (ptr)
+-    __collector_util_funcs.pwrite = (ssize_t (*)())ptr;
++    __collector_util_funcs.pwrite = (ssize_t (*)(int, void*, size_t, off_t))ptr;
+   else
+     {
+       Tprintf (DBG_LT0, "libcol_util: WARNING: dlvsym for %s@%s failed. Using dlsym() instead.", "pwrite", "GLIBC_2.2");
+ #endif /* ARCH(Intel) && WSIZE(32) */
+       ptr = dlsym (libc, "pwrite");
+       if (ptr)
+-	__collector_util_funcs.pwrite = (ssize_t (*)())ptr;
++	__collector_util_funcs.pwrite = (ssize_t (*)(int, const void*, size_t, off_t))ptr;
+       else
+ 	{
+ 	  CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT pwrite: %s\n", dlerror ());
+@@ -1213,7 +1213,7 @@ __collector_util_init ()
+ #endif /* ARCH(Intel) && WSIZE(32) */
+       ptr = dlsym (libc, "pwrite64");
+       if (ptr)
+-	__collector_util_funcs.pwrite64_ = (ssize_t (*)())ptr;
++	__collector_util_funcs.pwrite64_ = (ssize_t (*)(int, const void*, size_t, off_t))ptr;
+       else
+ 	__collector_util_funcs.pwrite64_ = __collector_util_funcs.pwrite;
+ #if ARCH(Intel) && WSIZE(32)
+@@ -1222,7 +1222,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "lseek");
+   if (ptr)
+-    __collector_util_funcs.lseek = (off_t (*)())ptr;
++    __collector_util_funcs.lseek = (off_t (*)(int, off_t, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT lseek: %s\n", dlerror ());
+@@ -1231,7 +1231,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "access");
+   if (ptr)
+-    __collector_util_funcs.access = (int(*)())ptr;
++    __collector_util_funcs.access = (int(*)(const char*, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT access: %s\n", dlerror ());
+@@ -1240,7 +1240,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "mkdir");
+   if (ptr)
+-    __collector_util_funcs.mkdir = (int(*)())ptr;
++    __collector_util_funcs.mkdir = (int(*)(const char*, mode_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT mkdir: %s\n", dlerror ());
+@@ -1249,7 +1249,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "opendir");
+   if (ptr)
+-    __collector_util_funcs.opendir = (DIR * (*)())ptr;
++    __collector_util_funcs.opendir = (DIR * (*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT opendir: %s\n", dlerror ());
+@@ -1258,7 +1258,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "closedir");
+   if (ptr)
+-    __collector_util_funcs.closedir = (int(*)())ptr;
++    __collector_util_funcs.closedir = (int(*)(DIR*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT closedir: %s\n", dlerror ());
+@@ -1267,7 +1267,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "execv");
+   if (ptr)
+-    __collector_util_funcs.execv = (int(*)())ptr;
++    __collector_util_funcs.execv = (int(*)(const char*, char* const*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT execv: %s\n", dlerror ());
+@@ -1276,7 +1276,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "exit");
+   if (ptr)
+-    __collector_util_funcs.exit = (void(*)())ptr;
++    __collector_util_funcs.exit = (void(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT exit: %s\n", dlerror ());
+@@ -1285,7 +1285,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "vfork");
+   if (ptr)
+-    __collector_util_funcs.vfork = (pid_t (*)())ptr;
++    __collector_util_funcs.vfork = (pid_t (*)(void))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT vfork: %s\n", dlerror ());
+@@ -1294,7 +1294,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "waitpid");
+   if (ptr)
+-    __collector_util_funcs.waitpid = (pid_t (*)())ptr;
++    __collector_util_funcs.waitpid = (pid_t (*)(pid_t, int*, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT waitpid: %s\n", dlerror ());
+@@ -1313,7 +1313,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "getcontext");
+   if (ptr)
+-    __collector_util_funcs.getcontext = (int(*)())ptr;
++    __collector_util_funcs.getcontext = (int(*)(ucontext_t*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT getcontext: %s\n", dlerror ());
+@@ -1331,7 +1331,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "putenv");
+   if (ptr)
+-    __collector_util_funcs.putenv = (int(*)())ptr;
++    __collector_util_funcs.putenv = (int(*)(char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT putenv: %s\n", dlerror ());
+@@ -1340,7 +1340,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "getenv");
+   if (ptr)
+-    __collector_util_funcs.getenv = (char*(*)())ptr;
++    __collector_util_funcs.getenv = (char*(*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT getenv: %s\n", dlerror ());
+@@ -1349,7 +1349,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "time");
+   if (ptr)
+-    __collector_util_funcs.time = (time_t (*)())ptr;
++    __collector_util_funcs.time = (time_t (*)(time_t*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT time: %s\n", dlerror ());
+@@ -1358,7 +1358,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "mktime");
+   if (ptr)
+-    __collector_util_funcs.mktime = (time_t (*)())ptr;
++    __collector_util_funcs.mktime = (time_t (*)(struct tm*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT mktime: %s\n", dlerror ());
+@@ -1372,7 +1372,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "gmtime_r");
+   if (ptr)
+-    __collector_util_funcs.gmtime_r = (struct tm * (*)())ptr;
++    __collector_util_funcs.gmtime_r = (struct tm * (*)(const time_t*, struct tm*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT gmtime_r: %s\n", dlerror ());
+@@ -1381,7 +1381,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strtol");
+   if (ptr)
+-    __collector_util_funcs.strtol = (long (*)())ptr;
++    __collector_util_funcs.strtol = (long (*)(const char*, char**, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strtol: %s\n", dlerror ());
+@@ -1390,7 +1390,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strtoll");
+   if (ptr)
+-    __collector_util_funcs.strtoll = (long long (*)())ptr;
++    __collector_util_funcs.strtoll = (long long (*)(const char*, char**, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strtoll: %s\n", dlerror ());
+@@ -1402,7 +1402,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "setenv");
+   if (ptr)
+-    __collector_util_funcs.setenv = (int(*)())ptr;
++    __collector_util_funcs.setenv = (int(*)(const char*, const char*, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT setenv: %s\n", dlerror ());
+@@ -1411,7 +1411,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "unsetenv");
+   if (ptr)
+-    __collector_util_funcs.unsetenv = (int(*)())ptr;
++    __collector_util_funcs.unsetenv = (int(*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT unsetenv: %s\n", dlerror ());
+@@ -1507,7 +1507,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "pclose");
+   if (ptr)
+-    __collector_util_funcs.pclose = (int(*)())ptr;
++    __collector_util_funcs.pclose = (int(*)(FILE*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT pclose: %s\n", dlerror ());
+@@ -1516,7 +1516,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "fgets");
+   if (ptr)
+-    __collector_util_funcs.fgets = (char*(*)())ptr;
++    __collector_util_funcs.fgets = (char*(*)(char*, int, FILE*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT fgets: %s\n", dlerror ());
+@@ -1543,7 +1543,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "vsnprintf");
+   if (ptr)
+-    __collector_util_funcs.vsnprintf = (int(*)())ptr;
++    __collector_util_funcs.vsnprintf = (int(*)(char*, size_t, const char*, ...))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT vsnprintf: %s\n", dlerror ());
+@@ -1552,7 +1552,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "atoi");
+   if (ptr)
+-    __collector_util_funcs.atoi = (int(*)())ptr;
++    __collector_util_funcs.atoi = (int(*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT atoi: %s\n", dlerror ());
+@@ -1561,7 +1561,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "calloc");
+   if (ptr)
+-    __collector_util_funcs.calloc = (void*(*)())ptr;
++    __collector_util_funcs.calloc = (void*(*)(size_t, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT calloc: %s\n", dlerror ());
+@@ -1571,7 +1571,7 @@ __collector_util_init ()
+   ptr = dlsym (libc, "free");
+   if (ptr)
+     {
+-      __collector_util_funcs.free = (void(*)())ptr;
++      __collector_util_funcs.free = (void(*)(void*))ptr;
+     }
+   else
+     {
+@@ -1581,7 +1581,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strdup");
+   if (ptr)
+-    __collector_util_funcs.libc_strdup = (char*(*)())ptr;
++    __collector_util_funcs.libc_strdup = (char*(*)(const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strdup: %s\n", dlerror ());
+@@ -1594,7 +1594,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strerror");
+   if (ptr)
+-    __collector_util_funcs.strerror = (char*(*)())ptr;
++    __collector_util_funcs.strerror = (char*(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strerror: %s\n", dlerror ());
+@@ -1602,7 +1602,7 @@ __collector_util_init ()
+     }
+   ptr = dlsym (libc, "strerror_r");
+   if (ptr)
+-    __collector_util_funcs.strerror_r = (int(*)())ptr;
++    __collector_util_funcs.strerror_r = (int(*)(int, char*, size_t))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strerror_r: %s\n", dlerror ());
+@@ -1610,7 +1610,7 @@ __collector_util_init ()
+     }
+   ptr = dlsym (libc, "strspn");
+   if (ptr)
+-    __collector_util_funcs.strspn = (size_t (*)())ptr;
++    __collector_util_funcs.strspn = (size_t (*)(const char*, const char*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strspn: %s\n", dlerror ());
+@@ -1619,7 +1619,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strtoul");
+   if (ptr)
+-    __collector_util_funcs.strtoul = (unsigned long int(*)())ptr;
++    __collector_util_funcs.strtoul = (unsigned long int(*)(const char*, char**, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strtoul: %s\n", dlerror ());
+@@ -1628,7 +1628,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "strtoull");
+   if (ptr)
+-    __collector_util_funcs.strtoull = (unsigned long long int(*)())ptr;
++    __collector_util_funcs.strtoull = (unsigned long long int(*)(const char*, char**, int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT strtoull: %s\n", dlerror ());
+@@ -1673,7 +1673,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "sysconf");
+   if (ptr)
+-    __collector_util_funcs.sysconf = (long(*)())ptr;
++    __collector_util_funcs.sysconf = (long(*)(int))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT sysconf: %s\n", dlerror ());
+@@ -1682,7 +1682,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "sigfillset");
+   if (ptr)
+-    __collector_util_funcs.sigfillset = (int(*)())ptr;
++    __collector_util_funcs.sigfillset = (int(*)(sigset_t*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT sigfillset: %s\n", dlerror ());
+@@ -1691,7 +1691,7 @@ __collector_util_init ()
+ 
+   ptr = dlsym (libc, "sigprocmask");
+   if (ptr)
+-    __collector_util_funcs.sigprocmask = (int(*)())ptr;
++    __collector_util_funcs.sigprocmask = (int(*)(int, const sigset_t*, sigset_t*))ptr;
+   else
+     {
+       CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT sigprocmask: %s\n", dlerror ());
+diff --git a/gprofng/libcollector/mmaptrace.c b/gprofng/libcollector/mmaptrace.c
+index f07f4d76513..2a6857ab58e 100644
+--- a/gprofng/libcollector/mmaptrace.c
++++ b/gprofng/libcollector/mmaptrace.c
+@@ -1209,7 +1209,7 @@ process_vsyscall_page ()
+ /*
+  * collector API for dynamic functions
+  */
+-void collector_func_load () __attribute__ ((weak, alias ("__collector_func_load")));
++void collector_func_load (char*, char*, char*, void*, int, int, DT_lineno *) __attribute__ ((weak, alias ("__collector_func_load")));
+ void
+ __collector_func_load (char *name, char *alias, char *sourcename,
+ 		       void *vaddr, int size, int lntsize, DT_lineno *lntable)
+@@ -1218,7 +1218,7 @@ __collector_func_load (char *name, char *alias, char *sourcename,
+ 			     vaddr, size, lntsize, lntable);
+ }
+ 
+-void collector_func_unload () __attribute__ ((weak, alias ("__collector_func_unload")));
++void collector_func_unload (void *vaddr) __attribute__ ((weak, alias ("__collector_func_unload")));
+ void
+ __collector_func_unload (void *vaddr)
+ {
+diff --git a/gprofng/libcollector/unwind.c b/gprofng/libcollector/unwind.c
+index 55fa2e9e9e7..e08afa165d1 100644
+--- a/gprofng/libcollector/unwind.c
++++ b/gprofng/libcollector/unwind.c
+@@ -421,7 +421,7 @@ __collector_ext_unwind_init (int record)
+   omp_no_walk = 1;
+ 
+   if (__collector_VM_ReadByteInstruction == NULL)
+-    __collector_VM_ReadByteInstruction = (int(*)()) dlsym (RTLD_DEFAULT, "Async_VM_ReadByteInstruction");
++    __collector_VM_ReadByteInstruction = (int(*)(unsigned char*)) dlsym (RTLD_DEFAULT, "Async_VM_ReadByteInstruction");
+ 
+ #if ARCH(SPARC)
+ #if WSIZE(64)
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index ebcdbca561f..fd888cd58dd 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -110,7 +110,7 @@ typedef struct CollectorUtilFuncs
+   long (*sysinfo)(int command, char *buf, long count);
+   time_t (*time)(time_t *tloc);
+   int (*unsetenv)(const char *name);
+-  int (*vsnprintf)(char *str, size_t size, const char *format, va_list ap);
++  int (*vsnprintf)(char *str, size_t size, const char *format, ...);
+   pid_t (*waitpid)(pid_t pid, int *stat_loc, int options);
+   ssize_t (*write)(int, void *, size_t);
+   double (*atof)();
+-- 
+2.50.1
+
diff --git a/package/binutils/2.43.1/0007-gprofng-fix-build-with-std-gnu23.patch b/package/binutils/2.43.1/0007-gprofng-fix-build-with-std-gnu23.patch
new file mode 100644
index 0000000000..fe03b4b5cf
--- /dev/null
+++ b/package/binutils/2.43.1/0007-gprofng-fix-build-with-std-gnu23.patch
@@ -0,0 +1,199 @@
+From 9ca25799ea0e92855d19adc46634e6dd0675a0b7 Mon Sep 17 00:00:00 2001
+From: Vladimir Mezentsev <vladimir.mezentsev@oracle.com>
+Date: Thu, 21 Nov 2024 14:48:20 -0800
+Subject: [PATCH] gprofng: fix build with -std=gnu23
+
+Fix function pointer types accordingly.
+Remove unused function pointers.
+
+gprofng/ChangeLog
+2024-11-21  Vladimir Mezentsev  <vladimir.mezentsev@oracle.com>
+
+	PR gprofng/32374
+	PR gprofng/32373
+	* common/cpuid.c: Define ATTRIBUTE_UNUSED if necessary.
+	* libcollector/libcol_util.c (sysinfo): Remove unused pointer.
+	* src/collector_module.h: Likewise.
+	* libcollector/dispatcher.c (setitimer): Fix prototype.
+	* libcollector/linetrace.c (system, grantpt, ptsname): Likewise.
+	* testsuite/gprofng.display/mttest/mttest.c (dump_arrays): Likewise.
+	* testsuite/gprofng.display/synprog/endcases.c (xinline_code,
+	s_inline_code): Likewise.
+	* testsuite/gprofng.display/synprog/inc_inline.h (ext_inline_code):
+	Likewise.
+	* testsuite/gprofng.display/synprog/synprog.c (doabort): Rename nullptr.
+
+Upstream: 4e943705e3e8a5a9448d087502bcb390a694ad02
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ gprofng/common/cpuid.c                                 |  2 ++
+ gprofng/libcollector/dispatcher.c                      |  2 +-
+ gprofng/libcollector/libcol_util.c                     |  9 ---------
+ gprofng/libcollector/linetrace.c                       | 10 +++++-----
+ gprofng/src/collector_module.h                         |  1 -
+ gprofng/testsuite/gprofng.display/mttest/mttest.c      |  2 +-
+ gprofng/testsuite/gprofng.display/synprog/endcases.c   |  4 ++--
+ gprofng/testsuite/gprofng.display/synprog/inc_inline.h |  2 +-
+ gprofng/testsuite/gprofng.display/synprog/synprog.c    |  4 ++--
+ 9 files changed, 14 insertions(+), 22 deletions(-)
+
+diff --git a/gprofng/common/cpuid.c b/gprofng/common/cpuid.c
+index 891d5471335..b4caef54f57 100644
+--- a/gprofng/common/cpuid.c
++++ b/gprofng/common/cpuid.c
+@@ -21,7 +21,9 @@
+ #if defined(__i386__) || defined(__x86_64)
+ #include <cpuid.h>  /* GCC-provided */
+ #elif defined(__aarch64__)
++#if !defined(ATTRIBUTE_UNUSED)
+ #define ATTRIBUTE_UNUSED __attribute__((unused))
++#endif
+ 
+ static inline uint_t __attribute_const__
+ __get_cpuid (unsigned int op ATTRIBUTE_UNUSED, unsigned int *eax,
+diff --git a/gprofng/libcollector/dispatcher.c b/gprofng/libcollector/dispatcher.c
+index 4eda18ec324..6f0364cc52c 100644
+--- a/gprofng/libcollector/dispatcher.c
++++ b/gprofng/libcollector/dispatcher.c
+@@ -1280,4 +1280,4 @@ __collector_ext_clone_pthread (int (*fn)(void *), void *child_stack, int flags,
+ // weak symbols:
+ int sigprocmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_sigprocmask")));
+ int thr_sigsetmask (int, const sigset_t*, sigset_t*) __attribute__ ((weak, alias ("__collector_thr_sigsetmask")));
+-int setitimer () __attribute__ ((weak, alias ("_setitimer")));
++__typeof(setitimer) setitimer __attribute__ ((weak, alias ("_setitimer")));
+diff --git a/gprofng/libcollector/libcol_util.c b/gprofng/libcollector/libcol_util.c
+index a73488e3f60..77dc886be22 100644
+--- a/gprofng/libcollector/libcol_util.c
++++ b/gprofng/libcollector/libcol_util.c
+@@ -1427,15 +1427,6 @@ __collector_util_init ()
+       err = COL_ERROR_UTIL_INIT;
+     }
+ 
+-  ptr = dlsym (libc, "sysinfo");
+-  if (ptr)
+-    __collector_util_funcs.sysinfo = (long (*)())ptr;
+-  else
+-    {
+-      CALL_UTIL (fprintf)(stderr, "collector_util_init COL_ERROR_UTIL_INIT sysinfo: %s\n", dlerror ());
+-      err = COL_ERROR_UTIL_INIT;
+-    }
+-
+   ptr = dlsym (libc, "clearenv");
+   if (ptr)
+     __collector_util_funcs.clearenv = (int(*)())ptr;
+diff --git a/gprofng/libcollector/linetrace.c b/gprofng/libcollector/linetrace.c
+index 66844bc1337..c81ae1a2272 100644
+--- a/gprofng/libcollector/linetrace.c
++++ b/gprofng/libcollector/linetrace.c
+@@ -1527,7 +1527,7 @@ DCL_FUNC_VER (DCL_POSIX_SPAWNP, posix_spawnp_2_2, posix_spawnp@GLIBC_2.2)
+ DCL_POSIX_SPAWNP (posix_spawnp)
+ 
+ /*------------------------------------------------------------- system */
+-int system () __attribute__ ((weak, alias ("__collector_system")));
++int system (const char *cmd) __attribute__ ((weak, alias ("__collector_system")));
+ 
+ int
+ __collector_system (const char *cmd)
+@@ -1582,10 +1582,10 @@ DCL_FUNC_VER (DCL_POPEN, popen_2_0, popen@GLIBC_2.0)
+ DCL_POPEN (popen)
+ 
+ /*------------------------------------------------------------- grantpt */
+-int grantpt () __attribute__ ((weak, alias ("__collector_grantpt")));
++int grantpt (int fildes) __attribute__ ((weak, alias ("__collector_grantpt")));
+ 
+ int
+-__collector_grantpt (const int fildes)
++__collector_grantpt (int fildes)
+ {
+   if (NULL_PTR (grantpt))
+     init_lineage_intf ();
+@@ -1607,10 +1607,10 @@ __collector_grantpt (const int fildes)
+ }
+ 
+ /*------------------------------------------------------------- ptsname */
+-char *ptsname () __attribute__ ((weak, alias ("__collector_ptsname")));
++char *ptsname (int fildes) __attribute__ ((weak, alias ("__collector_ptsname")));
+ 
+ char *
+-__collector_ptsname (const int fildes)
++__collector_ptsname (int fildes)
+ {
+   if (NULL_PTR (ptsname))
+     init_lineage_intf ();
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index fd888cd58dd..6640f12fa3c 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -107,7 +107,6 @@ typedef struct CollectorUtilFuncs
+   int (*symlink)(const char *s1, const char *s2);
+   int (*syscall)(int number, ...);
+   long (*sysconf)(int name);
+-  long (*sysinfo)(int command, char *buf, long count);
+   time_t (*time)(time_t *tloc);
+   int (*unsetenv)(const char *name);
+   int (*vsnprintf)(char *str, size_t size, const char *format, ...);
+diff --git a/gprofng/testsuite/gprofng.display/mttest/mttest.c b/gprofng/testsuite/gprofng.display/mttest/mttest.c
+index e0835c833e5..3db5b8d8e86 100644
+--- a/gprofng/testsuite/gprofng.display/mttest/mttest.c
++++ b/gprofng/testsuite/gprofng.display/mttest/mttest.c
+@@ -171,7 +171,7 @@ void computeJ (workStruct_t *x);
+ void computeK (workStruct_t *x);
+ void addone (workCtr_t *x);
+ void init_arrays (int strat);
+-void dump_arrays ();
++void dump_arrays (hrtime_t real, hrtime_t cpu, int case_index);
+ void *do_work (void *v);
+ void thread_work ();
+ void nothreads (Workblk *array, struct scripttab *k);
+diff --git a/gprofng/testsuite/gprofng.display/synprog/endcases.c b/gprofng/testsuite/gprofng.display/synprog/endcases.c
+index a6a1389658a..6f1c83b6859 100644
+--- a/gprofng/testsuite/gprofng.display/synprog/endcases.c
++++ b/gprofng/testsuite/gprofng.display/synprog/endcases.c
+@@ -40,8 +40,8 @@ static void s_inline_code (int);
+ void ext_inline_code (int);
+ 
+ #ifndef NO_INLINE
+-void xinline_code () __attribute__ ((always_inline));
+-void s_inline_code () __attribute__ ((always_inline));
++void xinline_code (int) __attribute__ ((always_inline));
++void s_inline_code (int) __attribute__ ((always_inline));
+ #endif
+ 
+ #include "inc_inline.h"
+diff --git a/gprofng/testsuite/gprofng.display/synprog/inc_inline.h b/gprofng/testsuite/gprofng.display/synprog/inc_inline.h
+index da42563c828..6600eacb66d 100644
+--- a/gprofng/testsuite/gprofng.display/synprog/inc_inline.h
++++ b/gprofng/testsuite/gprofng.display/synprog/inc_inline.h
+@@ -19,7 +19,7 @@
+    MA 02110-1301, USA.  */
+ 
+ #ifndef NO_INLINE
+-void ext_inline_code() __attribute__ ((always_inline));
++void ext_inline_code(int) __attribute__ ((always_inline));
+ #endif
+ 
+ void
+diff --git a/gprofng/testsuite/gprofng.display/synprog/synprog.c b/gprofng/testsuite/gprofng.display/synprog/synprog.c
+index cf1bc5b0909..05920dc7419 100644
+--- a/gprofng/testsuite/gprofng.display/synprog/synprog.c
++++ b/gprofng/testsuite/gprofng.display/synprog/synprog.c
+@@ -528,14 +528,14 @@ reapchildren ()
+ int
+ doabort (int k)
+ {
+-  char *nullptr = NULL;
++  char *p = NULL;
+   char c;
+ 
+   /* Log the event */
+   wlog ("start of doabort", NULL);
+ 
+   /* and dereference a NULL */
+-  c = *nullptr;
++  c = *p;
+ 
+   /* this should never be reached */
+   return (int) c;
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
