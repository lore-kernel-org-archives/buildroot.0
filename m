Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD27C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:49:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18EAB61027
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18EAB61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE36980E2B;
	Mon, 18 Oct 2021 21:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uue3V2_JjYH; Mon, 18 Oct 2021 21:49:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 070A480E25;
	Mon, 18 Oct 2021 21:49:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 95FC41BF36A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 924A960787
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4xkOClugdcR for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 21:49:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF16760779
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:49:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k7so43683435wrd.13
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 14:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3AFrjSQ8TFvUrDOOwVYQRO9T2XG5Ohqbk4iSQK6V7U=;
 b=N2/ihydRe56I9+3wiPqMK0ZekRXxvPzvR9MLjKsDUTMAPFa5bQGC9vyjcp9N1Ppjgp
 e3a8iOlzMpsy5dTAaV9yY5vFDe6BSOyFSAT3vi6mKbxLbA7eXP+rMFEvy6uMYBBTWso9
 2l43pWP38gyN4w91JbkwiHAPxBhbPu6t4putB3hz33fGddMG9+phW6Rtmk5DU/GPMkVG
 9oqh8IAGrAwWVplEt1UEEAYBUfooaXJyFqltnUwPZzsUYfHsNnRtv9NVPW7P9T6l3QeE
 /bK8wF0nGZWiDtaSKvBsfyumGKbUNC3+105bbfhiaEB0xThubAOJ6rC/0XszTtdkeF58
 Fo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3AFrjSQ8TFvUrDOOwVYQRO9T2XG5Ohqbk4iSQK6V7U=;
 b=kmymUuWUto9yafcvp2j8Iw/Tbp+wOKW4khoPnHf31rFs7NdBxFjPdJyBK0SBv5F9Cl
 TRD9lTuAkLC5JIYO5GgHZrsKb0NN9E8IohMaE/X5euTjLJRuoJC8mOyJoHT+jA9y8vs1
 qEaiE1MTLExviMyrElcVxPr5UE//6gIHAXeIhWxiLD6I5NFYDCJL4NviW9QIeiQ5yaAz
 URwwKhbxN1LiFzw/sSZqXcweMWu6wU6+0NHsUZs3J+xcGOg1oOkpuexbamntCIu44DWF
 2n5r3cf4T5JNX9vIPtwpcOfabNKtICFzDgmcPoG3qUp4LS2DGKgOvhDJMTOaF18imOqW
 szRQ==
X-Gm-Message-State: AOAM530UeiHQAlce6eoa3fm9Gc6XZe69s4Inl5gqJ9SKlx4g6Ox8uEu6
 ItsayR+geL/Q2Tr8LWe5oXn+q931VSo=
X-Google-Smtp-Source: ABdhPJzf01l1kRrkAGqsWWq7IBEZen16lIzNBitSd6IdJvhON8CX4YYpRR9+RYkzHzqJ39ItUNi8Kg==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr39438769wrt.334.1634593756352; 
 Mon, 18 Oct 2021 14:49:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id u15sm591539wmq.12.2021.10.18.14.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 14:48:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 23:46:40 +0200
Message-Id: <20211018214640.1514683-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/smcroute: don't override
 dependencies
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Don't override SMCROUTE_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/smcroute/smcroute.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 96da0dc346..913647e7bf 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -13,7 +13,7 @@ SMCROUTE_CPE_ID_VENDOR = troglobit
 SMCROUTE_CONF_OPTS = --enable-mrdisc
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-SMCROUTE_DEPENDENCIES = libcap
+SMCROUTE_DEPENDENCIES += libcap
 SMCROUTE_CONF_OPTS += --with-libcap
 else
 SMCROUTE_CONF_OPTS += --without-libcap
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
