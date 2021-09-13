Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF01C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:09:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10E6C60FA0
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10E6C60FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AACE860704;
	Mon, 13 Sep 2021 13:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZsR__fje_ih; Mon, 13 Sep 2021 13:09:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A04460596;
	Mon, 13 Sep 2021 13:09:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9187A1BF378
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81B40401E6
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoPfPBSe5by2 for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 13:09:21 +0000 (UTC)
X-Greylist: delayed 00:09:52 by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8961D401D7
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 13:09:21 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7101E4023A
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 12:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1631537967; bh=me9StGB8V25/QmXXBecQCTlgBIlQ2XaF69bB5yvMkMQ=;
 h=From:To:Cc:Subject:Date:From;
 b=FDJazSX4ctD8MaO6g5loLyOmanojKD7eRjJFYsVyJ/EwviNavJLHPEOe9CFJXhOuY
 H/TLt4SURs6pFcPosCm84WbzgBtKUHmcEOELvHOjt4zVZzq/Dsql0Mv9nl5bLyBkOc
 SCdulKj2IPy2v+kwxzg9fDuLklWyybRZYW7Tajty3ajFeyGCJvlKuqP7qDNYOI7FOy
 IKP3Uh83QF2zDz0fREtQFAFfBHX3BkLJiQvifBbz9QA0lkbr2ysEIfX/WsEl9UaxcV
 DOd4uhJsP4+NilmQu2ulSQtmIrjVaScEJrOF3vL8dp9of8v7YyAgmGR/RHu4PoW6Lb
 Dp839BtOnFmjQ==
Received: from ru20arcgnu3.internal.synopsys.com
 (ru20arcgnu3.internal.synopsys.com [10.121.9.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 9E33BA005C;
 Mon, 13 Sep 2021 12:59:25 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 15:59:11 +0300
Message-Id: <20210913125911.52199-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Subject: [Buildroot] [PATCH] package/ntp: Fix building with glibc 2.34+
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Alexey Brodkin via buildroot <buildroot@lists.buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, arc-buildroot@synopsys.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On attempt to build ntp with glibc 2.34 the following error happens:
-------------------------------->8------------------------------
In file included from .../output/host/lib/gcc/i586-buildroot-linux-gnu/10.3.0/include-fixed/pthread.h:42,
                 from work_thread.c:13:
work_thread.c:45:57: error: missing binary operator before token "("
   45 | #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
      |                                                         ^~~~~~~~~~~~~~~~~
-------------------------------->8------------------------------

That's because starting from glibc 2.34 PTHREAD_STACK_MIN gets determined
dynamically in runtime via sysconf(), see [1].

Original fix proposed by Khem Raj in OpenEmbedded, see [2].

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=5d98a7dae955bafa6740c26eaba9c86060ae0344
[2] https://github.com/openembedded/meta-openembedded/commit/7055c764c83150f9310ce04bcfb19330460582fc

Suggested-by: Artem Panfilov <artemp@synopsys.com>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 ...ntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch

diff --git a/package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch b/package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
new file mode 100644
index 0000000000..da03ad4aac
--- /dev/null
+++ b/package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
@@ -0,0 +1,33 @@
+From 082a504cfcc046c3d8adaae1164268bc94e5108a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 31 Jul 2021 10:51:41 -0700
+Subject: [PATCH] libntp: Do not use PTHREAD_STACK_MIN on glibc
+
+In glibc 2.34+ PTHREAD_STACK_MIN is not a compile-time constant which
+could mean different stack sizes at runtime on different architectures
+and it also causes compile failure. Default glibc thread stack size
+or 64Kb set by ntp should be good in glibc these days.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Copied from https://github.com/openembedded/meta-openembedded/blob/master/meta-networking/recipes-support/ntp/ntp/0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch]
+Signed-off-by: Alexey Brodkin <abrokdin@synopsys.com>
+---
+ libntp/work_thread.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libntp/work_thread.c b/libntp/work_thread.c
+index 03a5647..3ddd751 100644
+--- a/libntp/work_thread.c
++++ b/libntp/work_thread.c
+@@ -41,7 +41,7 @@
+ #ifndef THREAD_MINSTACKSIZE
+ # define THREAD_MINSTACKSIZE	(64U * 1024)
+ #endif
+-#ifndef __sun
++#if !defined(__sun) && !defined(__GLIBC__)
+ #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
+ # undef THREAD_MINSTACKSIZE
+ # define THREAD_MINSTACKSIZE PTHREAD_STACK_MIN
+-- 
+2.32.0
+
-- 
2.16.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
