Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262AEC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A98C541704;
	Mon,  5 Jun 2023 07:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A98C541704
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1u3swUv_G6F; Mon,  5 Jun 2023 07:29:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84347416AE;
	Mon,  5 Jun 2023 07:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84347416AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3294C1BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19D20821FA
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19D20821FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0y6mDyTeBJZM for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:29:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E31C5821F7
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E31C5821F7
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:29:41 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-77865f63473so2852239f.3
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 00:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685950180; x=1688542180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PZW/g0rD2DFksfWm5ScJESuSjer16zCJfeEf45zLUbo=;
 b=ZgBwo0Mak9DgpyrKRX7ZkzrmflzUF5fWNucjJreEaPPbzSWxjHvinDT07fiP/QYKVO
 JYpoA3mnacbbXQNDgdoRfyDK4NJmgbO17Af1CuE2yFCoApK5SwEhKSIhkeDNSKg+qI46
 BvPQgJrwatvsy7H7FW7+tMbF6pJn0BEMgju44DDcFpjrO7FoP84ZfJ6rQ1GyuDemaZih
 xz5odr6/b9n0lZ0gSL6OwrREes8XG0Sjy5mdVUjrZugC5F4VLDTn1mFxyy6Zlx17FbkR
 9pfwpAVKXivsa1IS+Vn/EN5+hKKnKpnZ9L94YdJfJF7DFuj/pNhyeri156mxkO7mexSb
 baNA==
X-Gm-Message-State: AC+VfDxrN4c3qf7Y9+GjFd/MD3AVof7EYbc3P7vdmN5I8qyMPRWyzOJu
 H/Z8D/y+EIjFIUaY7s1T93dncTmvKizurg==
X-Google-Smtp-Source: ACHHUZ7+/M1UNtvduOJEoXo4rW8MFw4NOCFHA6mhZFkWsbYe4dsz965c2ZJPdylENzaiegZRtMYy/Q==
X-Received: by 2002:a05:6602:4284:b0:76c:8877:861d with SMTP id
 cd4-20020a056602428400b0076c8877861dmr7986809iob.1.1685950180630; 
 Mon, 05 Jun 2023 00:29:40 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 c6-20020a5ea806000000b00760ed8349e6sm2360198ioa.7.2023.06.05.00.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:29:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 01:29:37 -0600
Message-Id: <20230605072937.1885915-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685950180; x=1688542180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PZW/g0rD2DFksfWm5ScJESuSjer16zCJfeEf45zLUbo=;
 b=Yky4Id+YgQEVAFtaYLv44XC+Fz5y1Tq4vNRihyQFLCTzoc0iU88hE4WUB6wP4e3hfQ
 rEbL+k7mGb6VHcDfZWTf6F2bPNDiQ+MaRAwjvHaEWUNi09Puoszw2/LZ+4VkmraVpXYA
 CGzwUhihplTmQ3yplUFyGj8bLhUfeu/K10G7nX/h4odCcGpVpYhwewPveUAV49LLHfDc
 qZrYk4D2Fa2q0wtbi61gw4IXfQ7MrME++CNaUuRF8+sQj+8tlTICtYUnryjnMHXiRiaP
 BYEV4cfQmOewMauF2Ub2BsJM72tWFBDewdUwvGtbpuAn6N9/a+2Fi/jNf5gvwvvvoJBK
 VBmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Yky4Id+Y
Subject: [Buildroot] [PATCH 1/1] package/python-selenium: bump to version
 4.9.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-selenium/python-selenium.hash | 4 ++--
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index d462abc62b..03a9683a21 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/selenium/json
-md5  e9054eb95920bb2a1d594090f0773f61  selenium-4.8.0.tar.gz
-sha256  fee36724d6cf0b18c73781bb8ec7be4a35ab1e2564e64e64e64da75e50e052af  selenium-4.8.0.tar.gz
+md5  02404033a10b2b29aa098f50503c0a1a  selenium-4.9.1.tar.gz
+sha256  3444f4376321530c36ce8355b6b357d8cf4a7d588ce5cf772183465930bbed0e  selenium-4.9.1.tar.gz
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index 6dbea6fb7e..d59a16a57d 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.8.0
+PYTHON_SELENIUM_VERSION = 4.9.1
 PYTHON_SELENIUM_SOURCE = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE = https://files.pythonhosted.org/packages/2e/3d/492cf1a6823c48369328572c6bc63b7a957ba25c0009ee6bdb507cd9a6a4
+PYTHON_SELENIUM_SITE = https://files.pythonhosted.org/packages/fd/e2/0e5bee6762a7bf7852b47a79c5b12f9e526e6962958dbb9719fa490ba24c
 PYTHON_SELENIUM_SETUP_TYPE = setuptools
 PYTHON_SELENIUM_LICENSE = Apache-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
