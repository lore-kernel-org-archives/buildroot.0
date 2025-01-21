Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69569C0218B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 22:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1429C612BF;
	Tue, 21 Jan 2025 22:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTOq00dythZy; Tue, 21 Jan 2025 22:10:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 182EB612BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 182EB612BE;
	Tue, 21 Jan 2025 22:10:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85145D7
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63DD884FC8
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M47DYVXQ89qn for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 22:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 73C6A84FC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73C6A84FC7
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73C6A84FC7
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:10:23 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-844e9b8b0b9so474633139f.0
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 14:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737497422; x=1738102222;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nqsfUqIqouS5YPEzIuvZqvls8UL82axS+IuH3oMedBM=;
 b=Hl4JPZt8RB15ulaXBlDKl/mgE0JybNj+ImBv9bdR3kCwvxN4/bdlvPnLKeahaUW153
 HW398Vc5EZyajLCRWjHvOJEWj2UPMyX0H30Cs2Uz6xJf8gkPydTmJzouUY3rYFi81G9P
 nvtnzOrIaTTWS7MD5s7JaPQww+k/95wnroUKAR6PHvyuGaQN2Dk+e8znLABUJRuD7gYt
 2sWAj9DXH4mbhyoF3Tn1atKSHMg8LWdWk2oJjkHF7oPE8iwPQAtVzRzimFhxGoOyQM71
 jKpMoqnZ+QofDudCygCiLF/OuDKNW95J6ogYxp6FF1KBxvaBW6Hi5WE2zwIv3VD9hH4C
 kBEw==
X-Gm-Message-State: AOJu0YwOuw4uVD8WlEqe+WotEtT4+ggY1faWngzwXp+lgpHEbkT9wbpL
 RSl87B6uYp42LFzrMvcLwaGM5iv57MBHJyhhlrdSBMQ+4IJCiYzcW1WjfmPX
X-Gm-Gg: ASbGncvghkSTjSv0jAfkM5D+r/IoDqfWL3jMDZM0qKSZVXR15EQWJqpR3zi/wJAgcQ+
 YfQQyplTgy+AuU+vL8z99GJ+VgdhciQ2i6b1hgQBXMtoWwriA0si+OMfPQae1fUpd0FAY2rgHem
 NNrXM4la2S9lFxIun1XCf9V1akDoanZvWj3pAB/ONvw3bJ7moYtctWsZy+WwDyQ/9G5xlUG97xQ
 +f3e9nEhFU/WkoXWE8ANtyT3NrDuXlK1sKoNl7dhcc288g5x4ZyGExkt45ScuuROowGefUoI+Qn
 owp3luaGaiTof9uHbIKLabUSYvImcamAeV91LUioDOpt
X-Google-Smtp-Source: AGHT+IHBUadHHA2TMC9RL6Yy1ydM9FWGEQPFnkm1q7RBldO5YAhBJJ4mTqSlJZknHVFPEFoNEEvvIw==
X-Received: by 2002:a6b:780d:0:b0:84f:5547:8398 with SMTP id
 ca18e2360f4ac-851b64fa7e3mr1326059439f.11.1737497422057; 
 Tue, 21 Jan 2025 14:10:22 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea75496d34sm3522539173.68.2025.01.21.14.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 14:10:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jan 2025 15:10:20 -0700
Message-Id: <20250121221020.3119899-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737497422; x=1738102222; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nqsfUqIqouS5YPEzIuvZqvls8UL82axS+IuH3oMedBM=;
 b=S0ZLlj58ZrAAU276TfgL9TIoO9fWsF8hOvjs+KnzAUYY1apvG1kK14fAE2rkjAEiSH
 weEs0/Rfm5LHeIqhRvxXc6b5jLA1S3+pCKVI22heUaBUlx4Aln1WClOl/m3c9xWFd1En
 NTn2C1a+Ch//+FeOTV6yHjMRScafp4N8UK7cEl8V7APPkXN9QYtD7OIqOsbq0a84IOpk
 2+7uvuSLWJUnIaxTGDqjYGsQwtoB+kFE31Om0Zs5ibgPIeHT7uA7uyTEXlF1BZU6OhSj
 fnHAF/lVio17XsGYNBSbmkgKdLVl1kX6uV/TOmSXMkJUogCTEb+6Lu9ErvQFEYTsifba
 Zzfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S0ZLlj58
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version 1.36.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 9285b3d7ca..4036519183 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  07aaafa117a4a0ed4025296a85018276  boto3-1.35.97.tar.gz
-sha256  7d398f66a11e67777c189d1f58c0a75d9d60f98d0ee51b8817e828930bf19e4e  boto3-1.35.97.tar.gz
+md5  a8f7a881ac754a889490c65cad7aa97b  boto3-1.36.3.tar.gz
+sha256  53a5307f6a3526ee2f8590e3c45efa504a3ea4532c1bfe4926c0c19bf188d141  boto3-1.36.3.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 11fa34bf6c..3d8a7852ea 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.35.97
+PYTHON_BOTO3_VERSION = 1.36.3
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/b0/0b/be51ba3bf22832bc918b4059ca182877681b02a45627c51d70efbbf1991d
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/07/12/b9ad4c3dd6e6044243d08bae076795e41357651683f4fad99d5828c4291c
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
