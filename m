Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0548C00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EF0E60E53;
	Tue,  1 Aug 2023 21:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EF0E60E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eaOErEjZ4YT0; Tue,  1 Aug 2023 21:13:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73BA860E74;
	Tue,  1 Aug 2023 21:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73BA860E74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 236481BF860
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D33060017
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D33060017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_6K_9KxPEGF for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:12:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 698D260EF4
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 698D260EF4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 575DF83FFD; Tue,  1 Aug 2023 21:12:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 23:11:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e69a62fe08d704c753565b03119aaadea15b0b7
X-Git-Newrev: e039a7dfe5bb027be0a51f8326964adf89a8f8d6
X-Patchwork-Hint: ignore
Message-Id: <20230801211256.575DF83FFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: fix build with binutils >=
 2.41
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e039a7dfe5bb027be0a51f8326964adf89a8f8d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...05-Fixes-assembling-with-binutils-as-2.41.patch | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch b/package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch
new file mode 100644
index 0000000000..6c81971cbe
--- /dev/null
+++ b/package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch
@@ -0,0 +1,84 @@
+From effadce6c756247ea8bae32dc13bb3e6f464f0eb Mon Sep 17 00:00:00 2001
+From: =?utf8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
+Date: Sun, 16 Jul 2023 18:18:02 +0300
+Subject: [PATCH] avcodec/x86/mathops: clip constants used with shift
+ instructions within inline assembly
+
+Fixes assembling with binutils as >= 2.41
+
+Upstream: http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=effadce6c756247ea8bae32dc13bb3e6f464f0eb
+
+Bug reports for this change in binutils:
+https://fftrac-bg.ffmpeg.org/ticket/10405
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108941
+https://sourceware.org/bugzilla/show_bug.cgi?id=30578
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libavcodec/x86/mathops.h | 26 +++++++++++++++++++++++---
+ 1 file changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/libavcodec/x86/mathops.h b/libavcodec/x86/mathops.h
+index 6298f5ed19..ca7e2dffc1 100644
+--- a/libavcodec/x86/mathops.h
++++ b/libavcodec/x86/mathops.h
+@@ -35,12 +35,20 @@
+ static av_always_inline av_const int MULL(int a, int b, unsigned shift)
+ {
+     int rt, dummy;
++    if (__builtin_constant_p(shift))
+     __asm__ (
+         "imull %3               \n\t"
+         "shrdl %4, %%edx, %%eax \n\t"
+         :"=a"(rt), "=d"(dummy)
+-        :"a"(a), "rm"(b), "ci"((uint8_t)shift)
++        :"a"(a), "rm"(b), "i"(shift & 0x1F)
+     );
++    else
++        __asm__ (
++            "imull %3               \n\t"
++            "shrdl %4, %%edx, %%eax \n\t"
++            :"=a"(rt), "=d"(dummy)
++            :"a"(a), "rm"(b), "c"((uint8_t)shift)
++        );
+     return rt;
+ }
+ 
+@@ -113,19 +121,31 @@ __asm__ volatile(\
+ // avoid +32 for shift optimization (gcc should do that ...)
+ #define NEG_SSR32 NEG_SSR32
+ static inline  int32_t NEG_SSR32( int32_t a, int8_t s){
++    if (__builtin_constant_p(s))
+     __asm__ ("sarl %1, %0\n\t"
+          : "+r" (a)
+-         : "ic" ((uint8_t)(-s))
++         : "i" (-s & 0x1F)
+     );
++    else
++        __asm__ ("sarl %1, %0\n\t"
++               : "+r" (a)
++               : "c" ((uint8_t)(-s))
++        );
+     return a;
+ }
+ 
+ #define NEG_USR32 NEG_USR32
+ static inline uint32_t NEG_USR32(uint32_t a, int8_t s){
++    if (__builtin_constant_p(s))
+     __asm__ ("shrl %1, %0\n\t"
+          : "+r" (a)
+-         : "ic" ((uint8_t)(-s))
++         : "i" (-s & 0x1F)
+     );
++    else
++        __asm__ ("shrl %1, %0\n\t"
++               : "+r" (a)
++               : "c" ((uint8_t)(-s))
++        );
+     return a;
+ }
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
