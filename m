Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58804CEDDA4
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 15:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16C9640698;
	Wed,  9 Oct 2024 15:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOGq1XaYFZ5n; Wed,  9 Oct 2024 15:19:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDD63406C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDD63406C6;
	Wed,  9 Oct 2024 15:19:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 724891BF396
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61AFE80539
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wswef0ZHiOxj for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 15:19:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6011B80531
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6011B80531
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6011B80531
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 15:19:28 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a3a3075af2so1668315ab.3
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 08:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728487167; x=1729091967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SkgsofaRlKP11xIY3PgFV9oNcjwFf5aMvy3EdrtRC3o=;
 b=gj4bKZY484cVQItZ8NGVjaIIj5NbwybUWhocUI3PkPB8CpFG67F6YhDrgyTmm+IbpO
 cMr1/bzmQjTGvRqcQDTZs00gZ2Qabnns//NAsBqTWzJf5QMA10ElQc73mNhT94EDte1c
 /7p+us1UExHr93OGa8+r5IEB6l8zfcC5BHWManwr1D9lpaYCoLhF6WrLMxF2PWBfq/wK
 QxNAO2kePtcF0fwZSM0Ke8qQGhVDttAA6PJ5CdcWn3ve1NjCv0LQsG2/aWN0cAanTYcX
 A/VfIta1zV8XMBIUu69OEpg7yghYN0YHilGPlFqY5H0cMtEPuJ3YSL5qLtT12wvFdFlM
 rL3A==
X-Gm-Message-State: AOJu0YzOg5uvGY/Dxr2u0dAC+vHZ34bUGVGpyr0ChXYAleTPFkGiqUqO
 6BGLDU/Yw8ACSXHlHZnCOFoUOcxnNCNCNs+HGp62s2+cAypDfZJb5WHwg6Bf
X-Google-Smtp-Source: AGHT+IHHPGofUmZzf6lEub9OvO7JHCerLzysh0AEBzMIL53HSFbwlXB2f5FoZQAjuZFX1WimH8ZLiw==
X-Received: by 2002:a05:6e02:1a07:b0:3a3:6b20:5e20 with SMTP id
 e9e14a558f8ab-3a397d0aecamr31962455ab.13.1728487167054; 
 Wed, 09 Oct 2024 08:19:27 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a37a7fd529sm23548605ab.22.2024.10.09.08.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:19:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 09:19:23 -0600
Message-Id: <20241009151923.3773324-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728487167; x=1729091967; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SkgsofaRlKP11xIY3PgFV9oNcjwFf5aMvy3EdrtRC3o=;
 b=NRzjSCUHN5p7ZvTGZ7//BxD6rPrKYhwk9UYgry/kERAWnmf0YDs7sB43MuTDdyGXAB
 b5Ic8HUSV2ufhX/S/0hELKESvDVAlhDMDs4PauZl9BCpitx1UyMSzUSGgFNZVfkD/ino
 5vnfQSmQwiSCPKnd+sXSg9G/kNIHghaaryCIa57uWJPGSrSkZsV8m7lxwcsS6TrXSwku
 BWGUhyk1uj0j8LR2Cy8Nynm7/m0H8g5G5XnPgavr+DeprhLQCA7n5ZWKKHO5RuG9XQe8
 lTsxuHontWTpt6U70xVp0dIN1JSuMgJAkq0zTxs+TtrZ6IEL7zat662fB7JhnLeL/TMe
 Dorg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NRzjSCUH
Subject: [Buildroot] [PATCH 1/1] package/python-aiohappyeyeballs: bump to
 version 2.4.3
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
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash | 4 ++--
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
index c7b956238f..85938c1084 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohappyeyeballs/json
-md5  3c9a696b2d2808a3a633743965415d4d  aiohappyeyeballs-2.4.0.tar.gz
-sha256  55a1714f084e63d49639800f95716da97a1f173d46a16dfcfda0016abb93b6b2  aiohappyeyeballs-2.4.0.tar.gz
+md5  dcc0ba52e3c350f4edc8a8475d1892d6  aiohappyeyeballs-2.4.3.tar.gz
+sha256  75cf88a15106a5002a8eb1dab212525c00d1f4c0fa96e551c9fbe6f09a621586  aiohappyeyeballs-2.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
index 0d6abdf65e..a531c4585f 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.0
+PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.3
 PYTHON_AIOHAPPYEYEBALLS_SOURCE = aiohappyeyeballs-$(PYTHON_AIOHAPPYEYEBALLS_VERSION).tar.gz
-PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/2d/f7/22bba300a16fd1cad99da1a23793fe43963ee326d012fdf852d0b4035955
+PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/bc/69/2f6d5a019bd02e920a3417689a89887b39ad1e350b562f9955693d900c40
 PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = pep517
 PYTHON_AIOHAPPYEYEBALLS_LICENSE = PSF-2.0
 PYTHON_AIOHAPPYEYEBALLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
