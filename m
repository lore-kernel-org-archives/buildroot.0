Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C967AC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 13:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81981831AE;
	Fri, 16 May 2025 13:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGX5v_P7PCaC; Fri, 16 May 2025 13:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFAC383CA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFAC383CA9;
	Fri, 16 May 2025 13:15:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF5171AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D02B360A76
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTLdQxGe32hr for <buildroot@buildroot.org>;
 Fri, 16 May 2025 13:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6C446090C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6C446090C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:15:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E69E821BF; Fri, 16 May 2025 13:15:30 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 15:12:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45439ae262aeb0cf720815c5a7b541467a39a60c
X-Git-Newrev: b473d99416e08cb174482c5428809cecf1c7bf9c
X-Patchwork-Hint: ignore
Message-Id: <20250516131530.9E69E821BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap: backport upstream patch to
 fix build on Xtensa
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b473d99416e08cb174482c5428809cecf1c7bf9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the bump of libcap to version 2.76 in commit
e2eb2ee58b9f70ebb83231537cca19bd28fa48de, the build started failing on
Xtensa. The bug was reported upstream at
https://bugzilla.kernel.org/show_bug.cgi?id=219915 and was
subsequently fixed by upstream commit:

  https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=6cdd8cd72ebcedd6b1b6c989a7e5722d5d87f35c

Which we backport in this commit.

Fixes:

  https://autobuild.buildroot.org/results/b9ff9258f407898eeee80dd8cc4dd1d777f44c06

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0002-Support-for-__xtensa__-architecture.patch | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/package/libcap/0002-Support-for-__xtensa__-architecture.patch b/package/libcap/0002-Support-for-__xtensa__-architecture.patch
new file mode 100644
index 0000000000..a81a1952aa
--- /dev/null
+++ b/package/libcap/0002-Support-for-__xtensa__-architecture.patch
@@ -0,0 +1,65 @@
+From 9421f4ff93c341482d3aa4a0cd57aba1978bdd62 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Sat, 19 Apr 2025 08:00:23 -0700
+Subject: [PATCH] Support for __xtensa__ architecture.
+
+It looks like __xtensa__ defines SA_RESTORER, but my read of the
+kernel code suggests that signal handling does not require it be
+set. Specifically, if the SA_RESTORER flag is not set, the kernel
+inserts a sys_rt_sigreturn call into the stack frame.
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+Upstream: 6cdd8cd72ebcedd6b1b6c989a7e5722d5d87f35c
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ psx/psx_calls.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/psx/psx_calls.c b/psx/psx_calls.c
+index 8195964..aff105f 100644
+--- a/psx/psx_calls.c
++++ b/psx/psx_calls.c
+@@ -49,7 +49,8 @@
+     || defined(__powerpc__) || defined(__s390__) || defined(__riscv) \
+     || defined(__alpha__) || defined(__hppa__) || defined(__sh__) \
+     || defined(__m68k__) || defined(__sparc__) || defined(__arc__) \
+-    || defined(__microblaze__) || defined(__or1k__)
++    || defined(__microblaze__) || defined(__or1k__) \
++    || defined(__xtensa__)
+ 
+ #undef _NSIG
+ #undef _NSIG_BPW
+@@ -69,8 +70,7 @@
+ #define _NSIG_WORDS  (_NSIG / _NSIG_BPW)
+ 
+ #if defined(__x86_64__) || defined(__i386__) \
+-    || defined(__arm__) \
+-    || defined(__powerpc__) \
++    || defined(__arm__) || defined(__powerpc__) \
+     || defined(__arc__)
+ /* field used */
+ #define SA_RESTORER  0x04000000
+@@ -78,8 +78,9 @@
+ 
+ #if defined(SA_RESTORER) \
+     || defined(__aarch64__) \
+-    || defined(__m68k__) || defined(__sh__) || defined(__sparc__) \
+-    || defined(__s390__) || defined(__sparc__)
++    || defined(__m68k__) || defined(__sh__) \
++    || defined(__s390__) || defined(__sparc__) \
++    || defined(__xtensa__)
+ /* field defined */
+ #define _HAS_SA_RESTORER   void *sa_restorer;
+ #else
+@@ -93,7 +94,7 @@ typedef struct {
+ #define sigset_t psx_sigset_t
+ 
+ struct psx_sigaction {
+-#if defined(__m68k__) || defined(__alpha__)
++#if defined(__m68k__) || defined(__alpha__) || defined(__xtensa__)
+     void *sa_handler;
+     sigset_t sa_mask;
+     unsigned long sa_flags;
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
