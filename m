Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9F5E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFEB780AB0;
	Sat, 11 Jan 2025 18:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WvM_6oM8fagI; Sat, 11 Jan 2025 18:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1BB580C5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1BB580C5D;
	Sat, 11 Jan 2025 18:34:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BACC6942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96B8D4018D
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRaupEE2rPAf for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:34:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72A3E40017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72A3E40017
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72A3E40017
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:34:15 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a9cee9d741so20858865ab.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:34:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736620454; x=1737225254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=66pGKSqXRQG6VVoOveBMu4+QSL9R5oNpT1CxGwH3nx8=;
 b=f/VXta6VB1o5llCXIXoSMq1enFeg+4saEDWIwgbNbRpdd8SljnaZmV+9aphE9+UY+o
 IMwAMGdhIcQkJkreWRzi9IUcWXvQcX9nehqRhPYBzPgfWLrwuMk7gJBIQkMYzlrjELsm
 HsE+Yt/KGCX6ZuMCHIF0Vrf51ivi/ug8fh0IbI3Z5icW0DIao5KiBEMxPb0HpUa35hvo
 Pq/tpRVpJq4Vqau0c7J18a6Gjdq5AWpCW9LZZgchUsgjJIrS3H09/ZemmTpJQMjTyCob
 bAiygAwXtMuragozdwkTJA8nQ4udoWb9IL8FsEXIEXeagjyxiupQA5nC/NnzUkjMWqIb
 Gjgw==
X-Gm-Message-State: AOJu0YwP6E5WqOFheBqrHqVbd8aCKKr/9BLBVxASSayTS9YL1pVyIdZT
 gTboaPY3ZVDAOXAQLw4ZOwcz8tbUif9TCnZESY5FVafeI3Nq2V6OyfIZ6EFwfa8=
X-Gm-Gg: ASbGncsIc1JJxvYMjYbwQcepw4W/9G4tSazYfN89XucfIYExACZHLo+JJZqJvrYWxi/
 Iovzo5lLYHr51Em0Ml5yh5Fv5aJCTnqsqOronnZEvpuDsF9yFvk/jvzgH60aQIRqjyxeL9b/Uwf
 +jHMeXm4PK1pOYRGZK9vWFCOUrvxGg+JWBivqpZ/RzWXiPNpP75IaNcn4jkHlBId8NjMC2DUCsc
 o9vQo93f31NEjYRd5lS9/UugvP1mZk+tdWW4tjbyEUzkQUDx7AMi9K1lcOJqlKnkvUKGnWHhZ7O
 w1DCj9nD3iVaq0v0z16y27I6+Naams8=
X-Google-Smtp-Source: AGHT+IFWVmiQaR5jDPAjdCdTyrNYszXhrdmbPzytv8Mke6af96hF5/emFuOx3p0IrelLQC64vxVMlw==
X-Received: by 2002:a05:6e02:16c7:b0:3a7:88f2:cfa9 with SMTP id
 e9e14a558f8ab-3ce3a8883d6mr105964575ab.11.1736620454045; 
 Sat, 11 Jan 2025 10:34:14 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5fa2d2sm1664285173.30.2025.01.11.10.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:34:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:34:12 -0700
Message-Id: <20250111183412.2938580-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736620454; x=1737225254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=66pGKSqXRQG6VVoOveBMu4+QSL9R5oNpT1CxGwH3nx8=;
 b=jTSw8OpuqxrtzEUYa7qvzvzfDNrvdvx6xK2VMXlw6kvJaqq+VTTxMf36GPu9TXjISb
 fPONsFM1jIjFDw+caAOEKp90DU7NZbDm3I5l0SKr3ShtwzmZJC11TyTM2mKbAfmeMjZA
 7w5mpkjFc5RF7cAg8COVlOE6531ewreO35Mwn2NmzXL/wtuhScVYFiW3MSE2+kCTUXH3
 OaxMPPPBlx8qVJYTxVRzav41UxSA2Bh8+CuPtay/EDnSKHUlxPRQymISNl671OO+GjRs
 NBql190WO1TvBfpUJ/v8PJjTKOSgsjZCuQdyXBXNBKv7t9/7gBpqe1dOcevE2o3YF60k
 hZXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jTSw8Opu
Subject: [Buildroot] [PATCH 1/1] package/python-trio: bump to version 0.28.0
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
 package/python-trio/python-trio.hash | 4 ++--
 package/python-trio/python-trio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
index 35de5d6c3b..0dd367a236 100644
--- a/package/python-trio/python-trio.hash
+++ b/package/python-trio/python-trio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/trio/json
-md5  81c1aa4eefa98e1b2895a85369211d24  trio-0.27.0.tar.gz
-sha256  1dcc95ab1726b2da054afea8fd761af74bad79bd52381b84eae408e983c76831  trio-0.27.0.tar.gz
+md5  e6d930a02a7ddf370083b9c9efa39e85  trio-0.28.0.tar.gz
+sha256  4e547896fe9e8a5658e54e4c7c5fa1db748cbbbaa7c965e7d40505b928c73c05  trio-0.28.0.tar.gz
 # Locally computed sha256 checksums
 sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
index dace4eec9e..f298619fe4 100644
--- a/package/python-trio/python-trio.mk
+++ b/package/python-trio/python-trio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_VERSION = 0.27.0
+PYTHON_TRIO_VERSION = 0.28.0
 PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
-PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/17/d1/a83dee5be404da7afe5a71783a33b8907bacb935a6dc8c69ab785e4a3eed
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/b3/73/57efab729506a8d4b89814f1e356ec8f3369de0ed4fd7e7616974d09646d
 PYTHON_TRIO_SETUP_TYPE = setuptools
 PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
 PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
