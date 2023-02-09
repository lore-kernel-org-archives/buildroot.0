Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52643C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 17:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7C5261005;
	Thu,  9 Feb 2023 17:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7C5261005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M86FxtilYdgW; Thu,  9 Feb 2023 17:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E9DB60F86;
	Thu,  9 Feb 2023 17:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E9DB60F86
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62CAB1BF348
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 17:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49B54821BD
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 17:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49B54821BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QY32hElpg3GT for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 17:20:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADC99821DF
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADC99821DF
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 17:20:07 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id n2so1802234pfo.3
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 09:20:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aMkTaNFX8kMmL9zVaCWZk4eNKsFfP229WeQua1rFuSg=;
 b=fOyc45i1kr4QchCE0Zl75toqkN7lGMf6oBN7VnGs2Oz1aMpKo4p6IQGAYly9aP1SRx
 FjKGFTWaWhSsL6oB1YwJD8eHVS9ounlUk2yWDvSXXD4CSdpstkz2JiXcviO6z2Kh70mf
 LAhSbKzNg4cim5Hm3cydlViSpuhIUmgT4YsUqyQsXnZeG771nP2HRq1HUbwUje2C4cO/
 U31uWLpT98TgvJn/tjnirqxYAGIUQ7cEfO3VR26oNPNKQh6mEhkOh91/HtE6mkbwuWph
 DSblH3OHBOKVXXWbBSwU/I94bZkiXm1GaJD6bOzAHUsjUIg/gWyjUkjg8luXkbw08YnC
 y8Eg==
X-Gm-Message-State: AO0yUKXGrQ/Pv1UEIA75kstTSo2FEnRReWxpFMXsymdPl/LFn/sl1cfM
 BqKb4T6GHtwE9RQsJRI9dZZ+ake46AY=
X-Google-Smtp-Source: AK7set921ybdXb3xjrc8NadZ/RDDoKigpv7jMSSKGDjwBOzaviwgCKilJWl+Y96JBJ5IHdbnwJGGJQ==
X-Received: by 2002:a62:16c7:0:b0:5a8:5424:d139 with SMTP id
 190-20020a6216c7000000b005a85424d139mr2658261pfw.20.1675963207018; 
 Thu, 09 Feb 2023 09:20:07 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 c4-20020aa781c4000000b005905d2fe760sm1691122pfn.155.2023.02.09.09.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 09:20:06 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Nicholas Sielicki <sielicki@yandex.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Date: Fri, 10 Feb 2023 01:20:02 +0800
Message-Id: <20230209172002.1442869-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aMkTaNFX8kMmL9zVaCWZk4eNKsFfP229WeQua1rFuSg=;
 b=XBPcl57Eqs4lWQb5l7VDuGJ0//aTHTT6Qq4xADJMoO1iWJ31oJeQ0EhahOTVOO/z99
 env+Qj9Otrj9xS2Og+7pz+/o5zrgnu/XF2ClN6I8y3749semFEku259l+doXwPW+6NzF
 /4TRr8A5LAiYIlSbwSiHTX/oU9eDZ5cjdmb269gReCDx8AXWUnI3xDtZ6hUAHRBgQrOp
 WNylf+vp+Pek3kYb/pqZeEkElx3wQAOSZkaDNR/bCJ12LGf1KWAKjXM9S3J1nyrUgGdC
 syH+x9RosXux+fdDg0j9UrGQ31CECcrHC7f948lUg0cvBfWK7H5UwD95zecdsQijzor1
 v7Lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XBPcl57E
Subject: [Buildroot] [PATCH] board/intel: galileo: Enable Linux kernel root
 file system on NFS
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
Cc: Bin Meng <bmeng@tinylab.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bin Meng <bmeng@tinylab.org>

Update linux-3.14.config for Galileo to enable Linux kernel root
file system on NFS.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 board/intel/galileo/linux-3.14.config | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/board/intel/galileo/linux-3.14.config b/board/intel/galileo/linux-3.14.config
index e7aa9cf232..c658afb88e 100644
--- a/board/intel/galileo/linux-3.14.config
+++ b/board/intel/galileo/linux-3.14.config
@@ -154,9 +154,9 @@ CONFIG_TUN=y
 # CONFIG_NET_VENDOR_SILAN is not set
 # CONFIG_NET_VENDOR_SIS is not set
 # CONFIG_NET_VENDOR_SMSC is not set
-CONFIG_STMMAC_ETH=m
+CONFIG_STMMAC_ETH=y
 # CONFIG_STMMAC_PLATFORM is not set
-CONFIG_STMMAC_PCI=m
+CONFIG_STMMAC_PCI=y
 # CONFIG_NET_VENDOR_SUN is not set
 # CONFIG_NET_VENDOR_TEHUTI is not set
 # CONFIG_NET_VENDOR_TI is not set
@@ -306,3 +306,6 @@ CONFIG_SECURITY=y
 CONFIG_SECURITY_NETWORK=y
 # CONFIG_VIRTUALIZATION is not set
 CONFIG_CRC_T10DIF=y
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
+CONFIG_IP_PNP=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
