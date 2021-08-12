Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E362BC4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 13:41:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9D9A61077
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 13:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9D9A61077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0AC480D3A;
	Thu, 12 Aug 2021 13:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dTBG600qvR9n; Thu, 12 Aug 2021 13:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 462A880D3C;
	Thu, 12 Aug 2021 13:41:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 944351BF3A9
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 13:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 911174032A
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 13:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pl1eGfnb8Yd0 for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 13:41:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D153401BE
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 13:41:33 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id b15so11619450ejg.10
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 06:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uEBHHhxb8x4n4bempf3LuikE52lqDz9HVUUdRHzPRGg=;
 b=fYpEEqyXz7hv9kZ7Wrzf1VFBdpRv7XjKn6pt8/WqpH2QyqwD1aLYrL2U+SMWpQOjvz
 SjMsUFppcXxdTqHrzTHbi5mOkVX/CiTPmouXRpnAKtMbqeGMJrxNX3WhRtmcdVd/au5e
 LxiW83OSOnc7EN8yOQZ8LWxlyT/NdsEINgk6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uEBHHhxb8x4n4bempf3LuikE52lqDz9HVUUdRHzPRGg=;
 b=aop/cbEUgWG1T/FCDlODLsSSO3IyHpo4m7XMHQF/ZM8e45L1GyH6feo4K287wxZXvU
 U8RO6R9SenIFLR3a1j9j4RDWkV+lga1eloLHQq4pRPGhkOzG6uMfjMr+53zC5p916tfE
 IoVP4H00/wArAHvTXBhypz6KVcYgaAfeQePq51tfQi6vw/V6CcBBuhlA2cVA1VraIjw2
 gXCc+99f5FXfirUlI8l4CSppvzDipn7RTGZyMRDzOsfN9zKaInoZvhzgreoe6g5Cd1PD
 eTzPGeXOvdp32SBAgVLmJzeJgRwfbRsu2eDSxnUiLLLrUPMppkWHS4iJtY5W5+ABylPl
 ljww==
X-Gm-Message-State: AOAM533CgCTIHaPVE5xq5yruEMVSwsviGTNqgbxJf/jR/itV9k0wU3JP
 U5R1ZK2Nv4uIl/09wUr/Kgbzgxrn5ZWszw==
X-Google-Smtp-Source: ABdhPJyd3cQzcWRy6kYwd925whTYFP4TM8A+VdBaXTw7ZlL5WyuHw9gkrkS3yO1soNS2SfBlU2llgw==
X-Received: by 2002:a17:906:a195:: with SMTP id
 s21mr3769222ejy.181.1628775692012; 
 Thu, 12 Aug 2021 06:41:32 -0700 (PDT)
Received: from localhost.localdomain ([37.160.45.80])
 by smtp.gmail.com with ESMTPSA id ck17sm652221edb.88.2021.08.12.06.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 06:41:31 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 15:41:28 +0200
Message-Id: <20210812134128.863664-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version 8.3.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 562cb2c1a2..fb1ec53a00 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  21c03274a9f59b9c00419852a8faebe7  Pillow-8.2.0.tar.gz
-sha256	a787ab10d7bb5494e5f76536ac460741788f1fbce851068d73a87ca7c35fc3e1  Pillow-8.2.0.tar.gz
+md5  e42fc66e41b5309436a573af49cec47c  Pillow-8.3.1.tar.gz
+sha256	2cac53839bfc5cece8fdbe7f084d5e3ee61e1303cccc86511d351adcb9e2c792  Pillow-8.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256	5bb11d96b393a698df70018069a986248021f286344c437a13f299c3daf1dfd4  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 42607e0bbd..a55a937c11 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 8.2.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/21/23/af6bac2a601be6670064a817273d4190b79df6f74d8012926a39bc7aa77f
+PYTHON_PILLOW_VERSION = 8.3.1
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/8f/7d/1e9c2d8989c209edfd10f878da1af956059a1caab498e5bc34fa11b83f71
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
