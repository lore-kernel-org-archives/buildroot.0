Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDD6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 14:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 951F2823F6;
	Wed, 20 Jul 2022 14:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 951F2823F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPexk1gu8eO8; Wed, 20 Jul 2022 14:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFDF98239A;
	Wed, 20 Jul 2022 14:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFDF98239A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDF5C1BF5A6
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 14:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC0E581A50
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 14:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC0E581A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LqdwfeOKgta6 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 14:47:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 888918198A
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 888918198A
 for <buildroot@busybox.net>; Wed, 20 Jul 2022 14:47:38 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 6197F440F2F;
 Wed, 20 Jul 2022 17:47:08 +0300 (IDT)
To: buildroot@busybox.net
Date: Wed, 20 Jul 2022 17:47:17 +0300
Message-Id: <3aa0ac234bc829d21b0a2c3fcafa0bf3a19cb210.1658328437.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1658328428;
 bh=CDfCO5H4pDzZQPxKMvefcxT4FydfTEK1S18MpF0tfTM=;
 h=From:To:Cc:Subject:Date:From;
 b=G7mAVRlQCcUshPFRUjfeTobhu5hGsO1H8f8NMmUQxemg90UZjlRfLuY1TGll2Fv3k
 j8G07brtK0Q6vQxpPkuXJtVPN2DKEmJk8ZBOamZ8E9D2W2OIVBP7pdVdtTukpYu9hG
 DhxTgyFmMxPi9pfkfZCgC8iKExkeWjSSAirRV8jom69wlLpC0dH+trzm3qnXoJT1Mv
 8i+1T3O6o1elHI6t3AOkr+6uogq8aEG3UVC2GdAbsEmPQ2/KapjtvFxmKlan22ol8y
 YkGohtpuEynDoolTJPZZ3vEFWo4z50bpXIdT70RZPZW/JmbJgpeE4CrLspwHBupFV+
 piuU84jTHhdvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=G7mAVRlQ
Subject: [Buildroot] [PATCH] package/zeromq: force detection of more features
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ZeroMQ added SO_PRIORITY in version 4.3.4, SO_BINDTODEVICE in 4.2.3, and
O_CLOEXEC since before 2.1.11. Checks for these feature are incompatible
with cross compilation. Linux supports SO_PRIORITY, and SO_BINDTODEVICE
since before 2.6. O_CLOEXEC is supported since 2.6.23. Keep them always
enabled.

Cc: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/zeromq/zeromq.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index c22f69ec66c1..452c5f429171 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -17,7 +17,10 @@ ZEROMQ_CPE_ID_PRODUCT = libzmq
 # SOCK_CLOEXEC, since linux v2.6.27.
 # Note: the flag TCP_KEEPALIVE is NOT available so we do not include it.
 ZEROMQ_CONF_ENV = libzmq_cv_sock_cloexec=yes \
+	libzmq_cv_o_cloexec=yes \
 	libzmq_cv_so_keepalive=yes \
+	libzmq_cv_so_priority=yes \
+	libzmq_cv_so_bindtodevice=yes \
 	libzmq_cv_tcp_keepcnt=yes \
 	libzmq_cv_tcp_keepidle=yes \
 	libzmq_cv_tcp_keepintvl=yes
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
