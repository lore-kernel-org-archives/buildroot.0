Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252C6C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C55BB40520;
	Thu,  3 Nov 2022 21:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C55BB40520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9uVU2o1BA7p; Thu,  3 Nov 2022 21:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AB8C40BF2;
	Thu,  3 Nov 2022 21:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AB8C40BF2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 429881BF8B4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B29A61051
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B29A61051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBlPtgGy_Va6 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:07:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0627861023
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0627861023
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:07:22 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id 7so1706883ilg.11
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 14:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o7ljRWZbPAxd5AgdpjwJesWMrqBpnfNKO5XFQ9S7oSc=;
 b=LnbRpW8AfiEkL/ekjn7paR5bTI5Y/cQ6ItugoeBOVBWUjWPdSBlyXcGhymg/GdeJcj
 /STma2q7LUHtkfZFiF32m21oZKpKN5gASN1SVcjweQp4ABLvoFplNx9/P09Ow/3fXOPI
 8lGWzqURdE7VMm1Z14OwhgvOHrCFTosmooyUF1RhRzuNmECndYvf30g4L2a8ML0oUkVt
 RpOW4IwvKDSysBeO+8OOx4SfNXATxcxdR4j/xWFriXCet8oC8CaCo9+U3T0PChL+5dFo
 Aaki01B14zvP3XMEPHs4b0qBUuuySew+vJymjq8D5H4MfXmLBqoSSFWQU6v2r3MBGOTb
 U1Rg==
X-Gm-Message-State: ACrzQf0hEO4RabJv63JXg4kKDmcRNab37LWuFgJv6+iuFImRQIzl/HZ4
 G808RBf+4Mi0syIx5D2An+NpHSfGMwi2BfzQ
X-Google-Smtp-Source: AMsMyM4LEVGEJvv9Ir9kRQz0n0YuIgWgvzyjSrcoEDneyFHy24cXiTkaMJgKPdIDSNMUJdfZ92A1ug==
X-Received: by 2002:a05:6e02:152e:b0:2f9:e082:7fc7 with SMTP id
 i14-20020a056e02152e00b002f9e0827fc7mr18156160ilu.167.1667509641779; 
 Thu, 03 Nov 2022 14:07:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 l14-20020a0566022dce00b006afe1d84207sm751692iow.25.2022.11.03.14.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:07:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 15:07:17 -0600
Message-Id: <20221103210719.3477688-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o7ljRWZbPAxd5AgdpjwJesWMrqBpnfNKO5XFQ9S7oSc=;
 b=XAPC2InGj82p5IIlLZ9fFx51/a4PUR8WnUvrIBWcxIxzVNi2h2pdPkDgLEfFDgSzqd
 PrCwhvOTSSwxAOMdMPR9gFRyxyW9WNLptVyLPy77rdKoWKxojEGhT+1B+toZrGo5MHCp
 7Pmm7LhGXKDVfuTM9f8AuO0B9CSo/t1zoKiBXZrIiwcLiRN4aocDzqem55VCQQgsnpr+
 xUjuWcycyMfP1T4kCDl9UujHs0g/j8FRDn1c9pel1mCLX4Rx6UWJL2wVIOgYVjtWDmLr
 g+4m0ugJnf9UfcaTcoF8P99V35CGKB61B3BL/uLmdCqlNrK2Xdt33fihdvzQaC2tOF4v
 qDqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XAPC2InG
Subject: [Buildroot] [PATCH 1/3] package/python-pytz: enable host python
 package
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is required by host-python-babel.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytz/python-pytz.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index d606750699..e697a444ca 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -12,3 +12,4 @@ PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
