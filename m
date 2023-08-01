Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD137C00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 20:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1309581492;
	Tue,  1 Aug 2023 20:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1309581492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QaQ3iuLUrtYp; Tue,  1 Aug 2023 20:21:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B6B8146B;
	Tue,  1 Aug 2023 20:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B6B8146B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5744F1BF97F
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30F8560B35
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30F8560B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABwj_WVk4RM7 for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 20:21:45 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E80B60B31
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 20:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E80B60B31
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C237A4C00F1;
 Tue,  1 Aug 2023 22:21:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48442)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQvsD-00065H-07;
 Tue, 01 Aug 2023 22:21:41 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  1 Aug 2023 22:21:37 +0200
Message-Id: <20230801202141.2957846-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690921301;
 bh=us3EmiQbugOHR4aRCB91kCYQqxNNcl4Y5YMMUcyMEP4=;
 h=From:To:Cc:Subject:Date:From;
 b=pHUrxZZkig1AX/K9B0GTG4Nl2k/x9ptKkK7HJu+/zwM1nXe+U24wqmmkaPuYDLQue
 uvpcaLPzl10g+Y4HPjuRo955jIg8VaptixkkdX5lXStY3AObfnPjwbvgNnKKpfqw/t
 wPI49t1RVLVssFxKPfr0Nwp2GWV76EnqO+EuldNzOZQKbIT+LsxYo/maroXu58eO/s
 h/Nn1x0bvnWTRwjuatdkkmAzXC1/NYeDG2q1GpzZgiChtTlUNe27vYo2AgDTsdAIx8
 nzd2kaABlkU8xe4GOf1bIaWDvHULf3HwMLjDG7sGIYWlxIdRJ1yMWDggBqknwK//kJ
 cL9LtbClA503Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=pHUrxZZk
Subject: [Buildroot] [PATCH 1/4] package/ffmpeg: fix build with binutils >=
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...xes-assembling-with-binutils-as-2.41.patch | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch

diff --git a/package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch b/package/ffmpeg/0005-Fixes-assembling-with-binutils-as-2.41.patch
new file mode 100644
index 0000000000..9a898d67d2
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
