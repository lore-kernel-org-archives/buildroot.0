Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAEBC433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:50:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC116124A
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CC116124A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04FAB401A3;
	Sat,  6 Nov 2021 10:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCOHrxDZsKrp; Sat,  6 Nov 2021 10:50:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84CD04022B;
	Sat,  6 Nov 2021 10:50:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 845A41BF95F
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8135640092
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B356o3mMM1Vs for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:50:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97D2A40038
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:50:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 03B4188F71; Sat,  6 Nov 2021 10:46:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 6 Nov 2021 11:49:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db725c7afb0abb198e623a354a2ec6aecfa0b3e6
X-Git-Newrev: 35870e2078f16139d67c56480c8efa949ab7ab5e
X-Patchwork-Hint: ignore
Message-Id: <20211106104624.03B4188F71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: fix host gdb-11.1 compile
 with simulator enabled and glibc >= 2.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=35870e2078f16139d67c56480c8efa949ab7ab5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add upstream patch to avoid host gdb-11.1 compile failure with simulator
  enabled and glibc >= 2.34

Fixes:

  targ-map.c:412:17: error: initializer element is not constant
    412 |   { "SIGSTKSZ", SIGSTKSZ, TARGET_SIGSTKSZ },
        |                 ^~~~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch | 110 +++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/package/gdb/11.1/0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch b/package/gdb/11.1/0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch
new file mode 100644
index 0000000000..d969d98831
--- /dev/null
+++ b/package/gdb/11.1/0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch
@@ -0,0 +1,110 @@
+From 7b3df9b8938357c2b0dcf2624e599a76fc4edc02 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Sun, 3 Oct 2021 12:02:53 -0400
+Subject: [PATCH] sim: filter out SIGSTKSZ [PR sim/28302]
+
+We map target signals to host signals so we can propagate signals
+between the host & simulated worlds.  That means we need to know
+the symbolic names & values of all signals that might be sent.
+
+The tools that generate that list use signal.h and include all
+symbols that start with "SIG" so as to automatically include any
+new symbols that the C library might add.  Unfortunately, this
+also picks up "SIGSTKSZ" which is not actually a signal itself,
+but a signal related setting -- it's the size of the stack when
+a signal is handled.
+
+By itself this doesn't super matter as we will never see a signal
+with that same value (since the range of valid signals tend to be
+way less than 1024, and the size of the default signal stack will
+never be that small).  But with recent glibc changes that make this
+into a dynamic value instead of a compile-time constant, some users
+see build failures when building the sim.
+
+As suggested by Adam Sampson, update our scripts to ignore this
+symbol to simplify everything and avoid the build failure.
+
+Bug: https://sourceware.org/PR28302
+
+[Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=39d53d04357606a15efd400147fa7369d71baf2c]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ sim/bfin/linux-targ-map.h | 5 +----
+ sim/common/gennltvals.py  | 6 ++++--
+ sim/common/nltvals.def    | 1 -
+ 3 files changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/sim/bfin/linux-targ-map.h b/sim/bfin/linux-targ-map.h
+index e9c8c8f..0340ed5 100644
+--- a/sim/bfin/linux-targ-map.h
++++ b/sim/bfin/linux-targ-map.h
+@@ -30,6 +30,7 @@ echo
+ # XXX: nothing uses this ?
+ echo '#include <signal.h>' | \
+ bfin-uclinux-gcc -E -dD -P - | \
++grep -v SIGSTKSZ | \
+ sed -r -n \
+     -e '1istatic CB_TARGET_DEFS_MAP cb_linux_signal_map[] = {' \
+     -e '$i\ \ { 0, -1, -1 }\n};' \
+@@ -1987,10 +1988,6 @@ static CB_TARGET_DEFS_MAP cb_linux_signal_map[] =
+ #ifdef SIG_SETMASK
+ # define TARGET_LINUX_SIG_SETMASK 2
+   { "SIG_SETMASK", SIG_SETMASK, TARGET_LINUX_SIG_SETMASK },
+-#endif
+-#ifdef SIGSTKSZ
+-# define TARGET_LINUX_SIGSTKSZ 8192
+-  { "SIGSTKSZ", SIGSTKSZ, TARGET_LINUX_SIGSTKSZ },
+ #endif
+   { 0, -1, -1 }
+ };
+diff --git a/sim/common/gennltvals.py b/sim/common/gennltvals.py
+index b3e558d..bd4d7e9 100755
+--- a/sim/common/gennltvals.py
++++ b/sim/common/gennltvals.py
+@@ -67,6 +67,7 @@ FILE_HEADER = f"""\
+ def gentvals(output: TextIO, cpp: str, srctype: str, srcdir: Path,
+              headers: Iterable[str],
+              pattern: str,
++             filter: str = r'^$',
+              target: str = None):
+     """Extract constants from the specified files using a regular expression.
+ 
+@@ -94,12 +95,13 @@ def gentvals(output: TextIO, cpp: str, srctype: str, srcdir: Path,
+     srcfile = ''.join(f'#include <{x}>\n' for x in headers)
+     syms = set()
+     define_pattern = re.compile(r'^#\s*define\s+(' + pattern + ')')
++    filter_pattern = re.compile(filter)
+     for header in headers:
+         with open(srcdir / header, 'r', encoding='utf-8') as fp:
+             data = fp.read()
+         for line in data.splitlines():
+             m = define_pattern.match(line)
+-            if m:
++            if m and not filter_pattern.search(line):
+                 syms.add(m.group(1))
+     for sym in sorted(syms):
+         srcfile += f'#ifdef {sym}\nDEFVAL {{ "{sym}", {sym} }},\n#endif\n'
+@@ -129,7 +131,7 @@ def gen_common(output: TextIO, newlib: Path, cpp: str):
+              ('errno.h', 'sys/errno.h'), 'E[A-Z0-9]*')
+ 
+     gentvals(output, cpp, 'signal', newlib / 'newlib/libc/include',
+-             ('signal.h', 'sys/signal.h'), r'SIG[A-Z0-9]*')
++             ('signal.h', 'sys/signal.h'), r'SIG[A-Z0-9]*', filter=r'SIGSTKSZ')
+ 
+     gentvals(output, cpp, 'open', newlib / 'newlib/libc/include',
+              ('fcntl.h', 'sys/fcntl.h', 'sys/_default_fcntl.h'), r'O_[A-Z0-9]*')
+diff --git a/sim/common/nltvals.def b/sim/common/nltvals.def
+index 8ae8839..8bc6ae5 100644
+--- a/sim/common/nltvals.def
++++ b/sim/common/nltvals.def
+@@ -116,7 +116,6 @@
+  { "SIGPROF", 27 },
+  { "SIGQUIT", 3 },
+  { "SIGSEGV", 11 },
+- { "SIGSTKSZ", 8192 },
+  { "SIGSTOP", 17 },
+  { "SIGSYS", 12 },
+  { "SIGTERM", 15 },
+-- 
+2.33.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
