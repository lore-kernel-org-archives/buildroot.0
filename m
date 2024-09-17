Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EE1CAC59F
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 20:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46B8D81173;
	Tue, 17 Sep 2024 20:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-dwwUY0NuP7; Tue, 17 Sep 2024 20:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59A928145A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59A928145A;
	Tue, 17 Sep 2024 20:40:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 182911BF2C3
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 146EB60E18
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4LNuYJ7W4ulh for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 20:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 284706079E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 284706079E
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 284706079E
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 20:40:55 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82ab349320fso216747739f.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 13:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726605654; x=1727210454;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ftBzCAIvpkb1w38aZ3hnjtgz8Q7b013TS+cmzUr8RIY=;
 b=PmMgcTovnXbIF6TEwdt241JceuLmwsvdgRty4uqZVcImNhkRh4DVzj6vCrrRO0BoNy
 78aZrH2l79XiAa0Q+9/Hf97kKEPBAmt2g15JADo76dkiiJm3eo938IWm3qujeJd46qZK
 AxksFPgNK7lYl8/B1wfl9GHnLZPve8eJzVA9AtF/GwvbJgLDTua3lQUWHKQXnC9fjyqY
 dnLpAEao+YJt6G57AUn6fU9yPq9C7LHPBTiolEWLVTGZ8Pu4Ad2+q0ZJ4VqTyMiWprOF
 nouzgDOJoCtz8wXR8aqzcX+7CNU9GQ/GJBvrTxgLy51eYbdo748saUPlhkdBjVbXNIpI
 Vx2w==
X-Gm-Message-State: AOJu0Yy9roS72r90WDL4x/JLZh6dLygrP85ynYzLatXVEfiXkNRze9aF
 TxNP9YzxqJuq6cz9IKx0kKz7zONmw2u8inC5WbgOwXAkaECRHaSxQqG3yw==
X-Google-Smtp-Source: AGHT+IFWuieI2ws0QMMqtU+QMx/a33MmxiwMkWZLkcdyrUKfIK1ak3qeyUDRtBZFUMFl7lyuyMnHkg==
X-Received: by 2002:a05:6602:6c10:b0:82a:a489:ed93 with SMTP id
 ca18e2360f4ac-82d1f94a7f1mr1996915939f.10.1726605653796; 
 Tue, 17 Sep 2024 13:40:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-831e9697887sm29593939f.1.2024.09.17.13.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 13:40:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 14:40:52 -0600
Message-Id: <20240917204052.4025154-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726605654; x=1727210454; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ftBzCAIvpkb1w38aZ3hnjtgz8Q7b013TS+cmzUr8RIY=;
 b=By1/che9Rt16i46kawk9F91jqrkqBrp8gzjX/BtxY6yfi7wb73ZI6gj/G1CG7iXRnN
 VEmfIsDVrHiLyYD2TKAfzZbgimqmGHsy46Wp801QJlRvkp1zF9GdaMfFV7eqdMiocHax
 akNr4//WlaydnkJ29M2vUcLussWDwrUwTRPIhzn/JBQT/GtE/4A4HL4vfDBZZ+s+G7Gh
 cVrbRqHDfjn+vuhosVCT/+FA2cdWYN7ubtRPnZto9/PpMVRglJTTc7KPIuHlBI2a+e1S
 583HOYCpivenGoHcV5rh8t92+Y0RNTtMF/Km1GBK5qIHwk9sSMJK1Cp87bpE0+ngm/oE
 QfPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=By1/che9
Subject: [Buildroot] [PATCH 1/1] package/python-pure-eval: bump to version
 0.2.3
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
 package/python-pure-eval/python-pure-eval.hash | 4 ++--
 package/python-pure-eval/python-pure-eval.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pure-eval/python-pure-eval.hash b/package/python-pure-eval/python-pure-eval.hash
index 5bf5dcb749..24c6d15ad6 100644
--- a/package/python-pure-eval/python-pure-eval.hash
+++ b/package/python-pure-eval/python-pure-eval.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pure_eval/json
-md5  212fd27ca2c58d9effddec69748d738a  pure_eval-0.2.2.tar.gz
-sha256  2b45320af6dfaa1750f543d714b6d1c520a1688dec6fd24d339063ce0aaa9ac3  pure_eval-0.2.2.tar.gz
+md5  d545186f2c899d9dd273c03d71b7ffb7  pure_eval-0.2.3.tar.gz
+sha256  5f4e983f40564c576c7c8635ae88db5956bb2229d7e9237d03b3c0b0190eaf42  pure_eval-0.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-pure-eval/python-pure-eval.mk b/package/python-pure-eval/python-pure-eval.mk
index f139ea270f..721640eabd 100644
--- a/package/python-pure-eval/python-pure-eval.mk
+++ b/package/python-pure-eval/python-pure-eval.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PURE_EVAL_VERSION = 0.2.2
+PYTHON_PURE_EVAL_VERSION = 0.2.3
 PYTHON_PURE_EVAL_SOURCE = pure_eval-$(PYTHON_PURE_EVAL_VERSION).tar.gz
-PYTHON_PURE_EVAL_SITE = https://files.pythonhosted.org/packages/97/5a/0bc937c25d3ce4e0a74335222aee05455d6afa2888032185f8ab50cdf6fd
+PYTHON_PURE_EVAL_SITE = https://files.pythonhosted.org/packages/cd/05/0a34433a064256a578f1783a10da6df098ceaa4a57bbeaa96a6c0352786b
 PYTHON_PURE_EVAL_SETUP_TYPE = setuptools
 PYTHON_PURE_EVAL_LICENSE = MIT
 PYTHON_PURE_EVAL_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
