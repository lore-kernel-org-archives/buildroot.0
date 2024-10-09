Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2307FCEE33B
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 17:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA23A40795;
	Wed,  9 Oct 2024 17:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZtZhc9C0UgXR; Wed,  9 Oct 2024 17:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C4B64079F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C4B64079F;
	Wed,  9 Oct 2024 17:56:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4AE81BF3E8
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2EA9812DD
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1tjaBK_QQgk for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 17:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0DFE80DFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0DFE80DFC
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0DFE80DFC
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 17:56:05 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-83541f580b6so3393639f.0
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 10:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728496564; x=1729101364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e9cmRYK9Q6Yoy4xgtWfCZJN5nEEcF4L0Gw2zEuf366s=;
 b=Dw87EdMFnFkLGq9b+FrlEXyJRMhVMoWMUJ0/L72AEIL0OsgYVFAMYIH78F9pZhSKfx
 GfvoWPUNUeu0rCGLDf2JAbRIUoCZyEFS3zJ/wxdbHMrJS2UGNeklQWohK53X9hRJ42+S
 XArp1mB54rp4Zw7l62wO+zoFLYXBIk2E7XqfYTNcMZgAMgL9uzdyMAi5r3MefSepnjjM
 L54JpLw3hmFiXJuBJc6wc087RukQUayjFAnMkfFDRC5BOtfm3rye1AJ/6Ep3NrjPAJLU
 UlWO0hipofH+MOAdlhuIAZv6dMiCfy2FHuwlM76K00Sfdf0n1OpKAHVTc5OR6Vu9say3
 vaHw==
X-Gm-Message-State: AOJu0YxaT4N7HacTHt35pxWWB3p0+Q9375T3viZlIgWRKYsMqe63+JTP
 UMq+5Btv7+dqaNAx3ZD0yl2TjsfHdzdkToRTxWsRr31fYeYQX801R3HbHows
X-Google-Smtp-Source: AGHT+IEny1FmugtZk2ZQO++OMM2v25jMV2BTxOCWttlikSQSwKhS2e3xIXvDkctDcDClj5JdB/gOnw==
X-Received: by 2002:a05:6602:1554:b0:82d:d07:daaa with SMTP id
 ca18e2360f4ac-8353d47e54amr358617839f.4.1728496564189; 
 Wed, 09 Oct 2024 10:56:04 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db72eb114asm1989041173.123.2024.10.09.10.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 10:56:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 11:55:55 -0600
Message-Id: <20241009175555.3867233-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728496564; x=1729101364; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e9cmRYK9Q6Yoy4xgtWfCZJN5nEEcF4L0Gw2zEuf366s=;
 b=KPyHjuAgMqQ5/ifWKMAzTsv5wkW4t7JALbQ/+SZidjEvyAE5BdEKQje+t5Hviv6FV8
 hsUF5lNWa3nRYCHGGlD5LbrRfqYlrBKh1GSNXNQLiUJuB6nAVOqECL/bVr4TFGvKOP1S
 wzeTrcsRKVPXktCN7kSeWIAUt1KEH3Ht8W7p6feol5OL0fiLXKRCe/3eDdHOu42tfpiu
 Ws12R6H7rBiLLmiFLPlkEvMJCsHzYt0fpJ5/JJFFB5ebDGwAVVdUefqbHK43kaxYuzor
 cAQmT0HCf0W39085OcPTG8oTLGwbZKMyx7CjjheAHu7EpM/t8+2h/yCHNosXsRrbPyA7
 rw8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KPyHjuAg
Subject: [Buildroot] [PATCH 1/1] package/python-scapy: bump to version 2.6.0
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
 package/python-scapy/python-scapy.hash | 4 ++--
 package/python-scapy/python-scapy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scapy/python-scapy.hash b/package/python-scapy/python-scapy.hash
index 7b21e6cb30..3ab7eb9386 100644
--- a/package/python-scapy/python-scapy.hash
+++ b/package/python-scapy/python-scapy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scapy/json
-md5  f546b1c82c2c98e0dae1a436219dd042  scapy-2.5.0.tar.gz
-sha256  5b260c2b754fd8d409ba83ee7aee294ecdbb2c235f9f78fe90bc11cb6e5debc2  scapy-2.5.0.tar.gz
+md5  0fb44b6db8fbb76c0648c9c161067c15  scapy-2.6.0.tar.gz
+sha256  c8f7eb54511c2fab502128ccf18e2e4b98e1f6af6e02ae15b84ad3039143ba3b  scapy-2.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
index a2c6cc6872..8c3cae3348 100644
--- a/package/python-scapy/python-scapy.mk
+++ b/package/python-scapy/python-scapy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCAPY_VERSION = 2.5.0
+PYTHON_SCAPY_VERSION = 2.6.0
 PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
-PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/67/a1/2a60d5b6f0fed297dd0c0311c887d5e8a30ba1250506585b897e5a662f4c
+PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/70/ca/17cc6ee0dbf342193732312f14bfc879dd162570287fd9f65ac1eb8a9c5f
 PYTHON_SCAPY_SETUP_TYPE = setuptools
 PYTHON_SCAPY_LICENSE = GPL-2.0
 PYTHON_SCAPY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
