Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4619C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F1576FB17;
	Sun, 18 Sep 2022 09:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F1576FB17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OHQGQo8FYj26; Sun, 18 Sep 2022 09:35:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CF386FB0C;
	Sun, 18 Sep 2022 09:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CF386FB0C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BFE91BF97F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 767B981429
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 767B981429
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVDHP7CE0fKH for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D81B81413
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D81B81413
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DD94847C4; Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 10:55:05 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: dc33bac56dcbf2a2bdd1c3eb43d9de72aab9bd1a
X-Git-Newrev: b7da201bb2c98cda3ab9feaf271ae7fc98337f50
X-Patchwork-Hint: ignore
Message-Id: <20220918093346.4DD94847C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/gcc: 11.3.0: fix
 glibc crash on G4 ppc cpus
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b7da201bb2c98cda3ab9feaf271ae7fc98337f50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

gcc 11.3.0 contains a backported patch [1] that introduce
a regression for old powerpc cpus like the powerpc 7400 (G4).

The glibc crash the init process due to a wrong asm machine
directive (.machine).

Run /sbin/init as init process
init[1]: segfault (11) at 7369693e nip 6f6e08 lr 6f6a68 code 1 in libc.so.6[690000+18f000]
init[1]: code: 280a000c 41c1ffe0 811edb80 554a103a 7d48502e 7d4a4214 7d4903a6 4e800420
init[1]: code: 2c08007a 4bffffbc 89290000 5529103a <7d2a482e> 2c090000 41c2ff78 7fe4fb78
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

Backport two patches from the gcc-11 stable branch (the upcoming gcc
11.4.0).

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=3cb53c10831be59d967d9dce8e7980fee4703500

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/2976071284

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b42c6b24755170a8eb015b3ea0b25e6d91e037cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gcc/11.3.0/0005-rs6000-Improve-.machine.patch  | 120 +++++++++++++++++++++
 ...ot-use-rs6000_cpu-for-.machine-ppc-and-pp.patch |  68 ++++++++++++
 2 files changed, 188 insertions(+)

diff --git a/package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch b/package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch
new file mode 100644
index 0000000000..6107900736
--- /dev/null
+++ b/package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch
@@ -0,0 +1,120 @@
+From ca2c3a7d3db7a699c358d3408f820396dd536fc8 Mon Sep 17 00:00:00 2001
+From: Segher Boessenkool <segher@kernel.crashing.org>
+Date: Tue, 1 Mar 2022 17:04:29 +0000
+Subject: [PATCH 5/6] rs6000: Improve .machine
+
+This adds more correct .machine for most older CPUs.  It should be
+conservative in the sense that everything we handled before we handle at
+least as well now.  This does not yet revamp the server CPU handling, it
+is too risky at this point in time.
+
+Tested on powerpc64-linux {-m32,-m64}.  Also manually tested with all
+-mcpu=, and the output of that passed through the GNU assembler.
+
+2022-03-04  Segher Boessenkool  <segher@kernel.crashing.org>
+
+	* config/rs6000/rs6000.c (rs6000_machine_from_flags): Restructure a
+	bit.  Handle most older CPUs.
+
+(cherry picked from commit 77eccbf39ed55297802bb66dff5f62507a7239e3)
+(cherry picked from commit fc7e603edc67c66a14f893f3b5a0a34e7d26f77c)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/rs6000/rs6000.c | 81 +++++++++++++++++++++++++-------------
+ 1 file changed, 54 insertions(+), 27 deletions(-)
+
+diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
+index 0421dc7adb3..0a55c979c36 100644
+--- a/gcc/config/rs6000/rs6000.c
++++ b/gcc/config/rs6000/rs6000.c
+@@ -5742,33 +5742,60 @@ const char *rs6000_machine;
+ const char *
+ rs6000_machine_from_flags (void)
+ {
+-  /* For some CPUs, the machine cannot be determined by ISA flags.  We have to
+-     check them first.  */
+-  switch (rs6000_cpu)
+-    {
+-    case PROCESSOR_PPC8540:
+-    case PROCESSOR_PPC8548:
+-      return "e500";
+-
+-    case PROCESSOR_PPCE300C2:
+-    case PROCESSOR_PPCE300C3:
+-      return "e300";
+-
+-    case PROCESSOR_PPCE500MC:
+-      return "e500mc";
+-
+-    case PROCESSOR_PPCE500MC64:
+-      return "e500mc64";
+-
+-    case PROCESSOR_PPCE5500:
+-      return "e5500";
+-
+-    case PROCESSOR_PPCE6500:
+-      return "e6500";
+-
+-    default:
+-      break;
+-    }
++  /* e300 and e500 */
++  if (rs6000_cpu == PROCESSOR_PPCE300C2 || rs6000_cpu == PROCESSOR_PPCE300C3)
++    return "e300";
++  if (rs6000_cpu == PROCESSOR_PPC8540 || rs6000_cpu == PROCESSOR_PPC8548)
++    return "e500";
++  if (rs6000_cpu == PROCESSOR_PPCE500MC)
++    return "e500mc";
++  if (rs6000_cpu == PROCESSOR_PPCE500MC64)
++    return "e500mc64";
++  if (rs6000_cpu == PROCESSOR_PPCE5500)
++    return "e5500";
++  if (rs6000_cpu == PROCESSOR_PPCE6500)
++    return "e6500";
++
++  /* 400 series */
++  if (rs6000_cpu == PROCESSOR_PPC403)
++    return "\"403\"";
++  if (rs6000_cpu == PROCESSOR_PPC405)
++    return "\"405\"";
++  if (rs6000_cpu == PROCESSOR_PPC440)
++    return "\"440\"";
++  if (rs6000_cpu == PROCESSOR_PPC476)
++    return "\"476\"";
++
++  /* A2 */
++  if (rs6000_cpu == PROCESSOR_PPCA2)
++    return "a2";
++
++  /* Cell BE */
++  if (rs6000_cpu == PROCESSOR_CELL)
++    return "cell";
++
++  /* Titan */
++  if (rs6000_cpu == PROCESSOR_TITAN)
++    return "titan";
++
++  /* 500 series and 800 series */
++  if (rs6000_cpu == PROCESSOR_MPCCORE)
++    return "\"821\"";
++
++  /* 600 series and 700 series, "classic" */
++  if (rs6000_cpu == PROCESSOR_PPC601 || rs6000_cpu == PROCESSOR_PPC603
++      || rs6000_cpu == PROCESSOR_PPC604 || rs6000_cpu == PROCESSOR_PPC604e
++      || rs6000_cpu == PROCESSOR_PPC750 || rs6000_cpu == PROCESSOR_POWERPC)
++    return "ppc";
++
++  /* Classic with AltiVec, "G4" */
++  if (rs6000_cpu == PROCESSOR_PPC7400 || rs6000_cpu == PROCESSOR_PPC7450)
++    return "\"7450\"";
++
++  /* The older 64-bit CPUs */
++  if (rs6000_cpu == PROCESSOR_PPC620 || rs6000_cpu == PROCESSOR_PPC630
++      || rs6000_cpu == PROCESSOR_RS64A || rs6000_cpu == PROCESSOR_POWERPC64)
++    return "ppc64";
+ 
+   HOST_WIDE_INT flags = rs6000_isa_flags;
+ 
+-- 
+2.34.3
+
diff --git a/package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch b/package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch
new file mode 100644
index 0000000000..d2335cd689
--- /dev/null
+++ b/package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch
@@ -0,0 +1,68 @@
+From 6de33ed642f119f1e2543095dd56e4a94f97c27f Mon Sep 17 00:00:00 2001
+From: Segher Boessenkool <segher@kernel.crashing.org>
+Date: Fri, 11 Mar 2022 21:15:18 +0000
+Subject: [PATCH 6/6] rs6000: Do not use rs6000_cpu for .machine ppc and ppc64
+ (PR104829)
+
+Fixes: 77eccbf39ed5
+
+rs6000.h has
+  #define PROCESSOR_POWERPC   PROCESSOR_PPC604
+  #define PROCESSOR_POWERPC64 PROCESSOR_RS64A
+which means that if you use things like  -mcpu=powerpc -mvsx  it will no
+longer work after my latest .machine patch.  This causes GCC build errors
+in some cases, not a good idea (even if the errors are actually
+pre-existing: using -mvsx with a machine that does not have VSX cannot
+work properly).
+
+2022-03-11  Segher Boessenkool  <segher@kernel.crashing.org>
+
+	PR target/104829
+	* config/rs6000/rs6000.c (rs6000_machine_from_flags): Don't output
+	"ppc" and "ppc64" based on rs6000_cpu.
+
+(cherry picked from commit 80fcc4b6afee72443bef551064826b3b4b6785e6)
+(cherry picked from commit d87e0e297b1cba73a0c055d2a3e9267d288f435a)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/rs6000/rs6000.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
+index 0a55c979c36..7e5cdd34840 100644
+--- a/gcc/config/rs6000/rs6000.c
++++ b/gcc/config/rs6000/rs6000.c
+@@ -5782,20 +5782,28 @@ rs6000_machine_from_flags (void)
+   if (rs6000_cpu == PROCESSOR_MPCCORE)
+     return "\"821\"";
+ 
++#if 0
++  /* This (and ppc64 below) are disabled here (for now at least) because
++     PROCESSOR_POWERPC, PROCESSOR_POWERPC64, and PROCESSOR_COMMON
++     are #define'd as some of these.  Untangling that is a job for later.  */
++
+   /* 600 series and 700 series, "classic" */
+   if (rs6000_cpu == PROCESSOR_PPC601 || rs6000_cpu == PROCESSOR_PPC603
+       || rs6000_cpu == PROCESSOR_PPC604 || rs6000_cpu == PROCESSOR_PPC604e
+-      || rs6000_cpu == PROCESSOR_PPC750 || rs6000_cpu == PROCESSOR_POWERPC)
++      || rs6000_cpu == PROCESSOR_PPC750)
+     return "ppc";
++#endif
+ 
+   /* Classic with AltiVec, "G4" */
+   if (rs6000_cpu == PROCESSOR_PPC7400 || rs6000_cpu == PROCESSOR_PPC7450)
+     return "\"7450\"";
+ 
++#if 0
+   /* The older 64-bit CPUs */
+   if (rs6000_cpu == PROCESSOR_PPC620 || rs6000_cpu == PROCESSOR_PPC630
+-      || rs6000_cpu == PROCESSOR_RS64A || rs6000_cpu == PROCESSOR_POWERPC64)
++      || rs6000_cpu == PROCESSOR_RS64A)
+     return "ppc64";
++#endif
+ 
+   HOST_WIDE_INT flags = rs6000_isa_flags;
+ 
+-- 
+2.34.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
