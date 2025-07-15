Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EDFC83F27
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 22:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10329611CC;
	Tue, 15 Jul 2025 22:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTmoryMghcXo; Tue, 15 Jul 2025 22:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 434E160E1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 434E160E1A;
	Tue, 15 Jul 2025 22:17:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A80ABDCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9929040FD8
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSnv5wfTwn3j for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 22:17:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0C6540C66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0C6540C66
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0C6540C66
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:16:59 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3df3891e28fso17692595ab.3
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 15:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752617818; x=1753222618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/945NngToAPkx3wwkJOgFdZMAPa/HWIlfg5/SEaLp3I=;
 b=u6Fb7+OQRiiRiCiDjoe/FTsY3zjPjqBLSs+NWhkheTtsIktvvVZWiivOsCpxKH1b4A
 GwcWfSlneH51vT1428PRn5G1IcQJkf6GowGULckTvyHdhjI+x6Spum0JzYAW7Au/yB+z
 0E67Zeu3GyLEVD6gfAzvIdp2+UbKPepO1Zu0GcoaFTVCbCS6492Toyp5syFQmeEIsm35
 h2byxfMBRONt2Ir1QTPhMrKNC9QawTbG5XFom5p3ZzMxYAMs5SsPwyHLHGP2/bt7cnjC
 4gHKDSw4WXItDdfM92AKSAu/RukFS3oXgEnjtuyOhLeogQ7tOSqP34L8BkbquFUxiz3/
 s/nQ==
X-Gm-Message-State: AOJu0YzNU8yvXM/n+Mi+EF74qXrxCVVGpgdtRQaO9jz+v38ncmKM4AiK
 7FT3AIkHqIKPht7qQj3Rh4jJPK0pyBn6/oWBQDy3EfiAHrfeEgDljHKxrFBqz5gNr2U=
X-Gm-Gg: ASbGncupvDCaFdhcLjeXYEwfFTR4hZQuj5k1ztrdQgZKpAYWi1e/caHVP0ajwBWjidt
 P+Ngl417VUcHPJSSgwKjg0XMN1E9xaAx84uN6pXKF01XI/6HBKWjNdxzOd8t0K9UZtJk66fUWYw
 g1YIRQ15fstN/qonw5nJbtMHWozp8ZqZCk7wwrxRjeIdTBwLudIcX63CBliUup4joQv6IpKRrxl
 eO2E6Ry6DuGcF8FPMOQsswBiqLzz41x048IUSS6pho60s5kPuu4qpmT6a/JTHqtmqt87C7F+1DR
 oOth64z4AK0TD8FiJidDv0PzxXEEyQ1Iqn/4k3/FrC9PeEJJ9yN9pSZ+rLBQvHhtWZ/Ntt6DQ1N
 6dvaQZH9LP2VKPyJKfzJRuWVcXNFlwzol5LxB2NJmq+8MCtoQOU5MNZk7Nmu9OZpPeNuHGypuMM
 iq3qzIygbOLP2mmYr08A==
X-Google-Smtp-Source: AGHT+IFza+BuOPUaLOHa3dnezAYptN/tMU5E1Kqx8dtEVsZG0wtBMgjQeoOuSWoQHqqGK5V9MnHNLA==
X-Received: by 2002:a05:6e02:12cb:b0:3dc:8b29:30b1 with SMTP id
 e9e14a558f8ab-3e282e29b82mr4458285ab.14.1752617818400; 
 Tue, 15 Jul 2025 15:16:58 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-236-108.hlrn.qwest.net.
 [71.218.236.108]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e24625c59dsm40171205ab.65.2025.07.15.15.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:16:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 16:16:56 -0600
Message-Id: <20250715221656.729769-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752617818; x=1753222618; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/945NngToAPkx3wwkJOgFdZMAPa/HWIlfg5/SEaLp3I=;
 b=PtwoaWzWjrIt0MPNIzn9Zh2yOrJwo+2x8hT+D2NDs5TJIiKIcShEltHrfSrd/4UqLj
 tH33h59N6gOzHxO3OSVniMh4oeibt5J/5xzwkmIz2Ne2jqpttVbkoxzqKoV7w4+S1mLO
 nUdRjA8bj4zSL30i5dmWr7o7pPG0Tsriv1EpBHubUuVXEOtWL5bMqo+StOkG6Mym+OXC
 105yMfW/AO0M5SSutUS5eTdQty/nO5HJ83C0MgHbD+pl2i23r7h7sdJ6QyrZldexl4Ac
 kUCe1yCOePVBvUYlxbco2FXedl4p9d3PyICqaXHMffaceHjcbyOKEwTrvsAw99/hUWW4
 xgnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PtwoaWzW
Subject: [Buildroot] [PATCH 1/1] package/python-aerich: bump to version 0.9.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aerich/python-aerich.hash | 4 ++--
 package/python-aerich/python-aerich.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
index bdbea8f66c..6e44c241f3 100644
--- a/package/python-aerich/python-aerich.hash
+++ b/package/python-aerich/python-aerich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aerich/json
-md5  031a5946dcf816e8059459204eb63b65  aerich-0.9.0.tar.gz
-sha256  37c7ca71e947e7de3aa0e778cb193fc1faebf9136a0f1108b52b902918b85acc  aerich-0.9.0.tar.gz
+md5  4d647c8f3829782f5770b7b120832f63  aerich-0.9.1.tar.gz
+sha256  629afbef5902635c41f410dd05def984c02e05e62d8a2020210a29a4aae19001  aerich-0.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index 6c6cea2dfe..c7417f3179 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AERICH_VERSION = 0.9.0
+PYTHON_AERICH_VERSION = 0.9.1
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
-PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/2f/4b/1facb78fea47f790040035b94fdcc31630fabe1bda49ebc7a4f374da1757
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/a5/98/75c6e3053a14a14ffe86e2435698b960abe0bf03c114e67f966d92ff19e7
 PYTHON_AERICH_SETUP_TYPE = poetry
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
