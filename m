Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF57E6F07D
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 18:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B49AC403AA;
	Fri,  1 Nov 2024 18:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhI_p4lU8LGJ; Fri,  1 Nov 2024 18:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6322A403AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6322A403AC;
	Fri,  1 Nov 2024 18:13:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1B4B979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC05A605F7
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8bPaAsD1Sv1 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 18:13:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3058605E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3058605E5
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3058605E5
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:13:46 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a6ababaaa9so6895375ab.1
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 11:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730484826; x=1731089626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6x8ALIszJRmDvzvudpartv6URvl0kIrHuHiK9bIQS/I=;
 b=pfIK8RVaq+D8mP5GkD/8j8ZoS+a4+cmtz+fqQBx7HiY+XW7dSWrNc4HmupUlSjCI/x
 cJ7IQRczPUY7DEebBwvl8iA/8l7i9dVwL/x52FYMIuvFyZRoFBV9Wbk0ie/Rx+vbReRE
 eYNB8/amp5Q3C3o4PAMrODymYCWd5GDU8/LXyQ6uWy0KwiKx5vc3Kng/GOWz0V/vYgIe
 ommMcARuQWOM743xp0WORwgtlV9V9C65MkjVvItPFJYgz05Jw+js97Kiz84xlqUbuKJb
 /VU3nNdg17v/rO1sZlC9AflRdI9RFXJ1hLbkSRHviIqOuGzdSySmsCmUxNx0f70d1ipl
 o6HQ==
X-Gm-Message-State: AOJu0YwMnigUSudpevs1tjDw88DdH2J7ruAe//+EqkHBAitQGB6tqVCm
 a+5wEe9eV2AelC9mPc1UUt0DhGI2VdDdaC7iwXxI2/+uJ7McCP5Zz7AZZg==
X-Google-Smtp-Source: AGHT+IF+nKYzLfp/6hy47kY7Inr0/8CoBkN9880cHTLYsJPmCVXwWefcK3oHAkIhaVt6afnqDbz2Ag==
X-Received: by 2002:a92:c24e:0:b0:3a6:af20:944c with SMTP id
 e9e14a558f8ab-3a6af2095bemr49819435ab.9.1730484825518; 
 Fri, 01 Nov 2024 11:13:45 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048be9c1sm849071173.46.2024.11.01.11.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 11:13:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 12:13:44 -0600
Message-Id: <20241101181344.1040948-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730484826; x=1731089626; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6x8ALIszJRmDvzvudpartv6URvl0kIrHuHiK9bIQS/I=;
 b=F0UaendbwSlIKfGzW7vU0fbMPIpBtinauj6WSiO4gUKV5l8UEo0qGAjKr4DSTsnqo2
 pfVlngwzeIZgx6inrYTFDNKNFc7FyrKhYIRacjgEqrUpElgXxtBUBYXTkkzRWrVdgrJn
 jZqcqlKjeag/psxmLIK1DazsHrQ9fMl+Vgqs8wXyJpOAbr0qdUvF0lu5t1Bn4krjSLvI
 0/C6JcyIi//VQNeFS6s+KfpiZ+43FcVlZmF6RsDVC+JzRrPThFl+FnLadcGoaokQBlPf
 PLSQYuez5suv1uoxTXXVAeQH98aUXp99RulWhvRAtYaQCdC7x9oKBuyAdRGolbXGoMKP
 o/Xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F0Uaendb
Subject: [Buildroot] [PATCH 1/1] package/python-multipart: bump to version
 0.0.17
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-multipart/python-multipart.hash | 4 ++--
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index 3437f58da0..d68be9e0e3 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-multipart/json
-md5  bdcec8f36709ac1206769c2114f7dfd0  python_multipart-0.0.12.tar.gz
-sha256  045e1f98d719c1ce085ed7f7e1ef9d8ccc8c02ba02b5566d5f7521410ced58cb  python_multipart-0.0.12.tar.gz
+md5  7051f07d9645d3f2e72c0a889329057b  python_multipart-0.0.17.tar.gz
+sha256  41330d831cae6e2f22902704ead2826ea038d0419530eadff3ea80175aec5538  python_multipart-0.0.17.tar.gz
 # Locally computed sha256 checksums
 sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 97e717cd33..1f8d581d68 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.12
+PYTHON_MULTIPART_VERSION = 0.0.17
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/16/6e/7ecfe1366b9270f7f475c76fcfa28812493a6a1abd489b2433851a444f4f
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/40/22/edea41c2d4a22e666c0c7db7acdcbf7bc8c1c1f7d3b3ca246ec982fec612
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
