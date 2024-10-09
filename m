Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23FECEE322
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 15:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59A4340450;
	Wed,  9 Oct 2024 15:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kt13auhG3LqQ; Wed,  9 Oct 2024 15:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 256F440684
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 256F440684;
	Wed,  9 Oct 2024 15:50:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C3A41BF396
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A70540684
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uH4vmZyBfgHe for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 15:50:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F238A40450
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F238A40450
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F238A40450
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 15:50:46 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-8354599fd8aso21479139f.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 08:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728489046; x=1729093846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bY2HIkjrPtcB3b6A3lD9kLI6qog8Iw/UCv1T+XG3V4Y=;
 b=CTLnsz/M1cnab61TWSFdvo674Fey9cQzhrEJXNq50zZRD5WuU/4DLMuAqQNG5FyLxd
 Cew+sdO/VTxBTO0tvrJKL42Eq8I3oy6NU/vBw+lZCWHHUhwmQa7wVktlbwOyMCy2ByQ0
 64rPLd/pqSg5f8VR0m6TtVRPkF+yFELOcf+oKHUJilsHU/FXfCWchw1lunuqWAuLhbHO
 AvRfAqKS4M3RL3HRQZo4z+3+Lusu0rwYwrRRi2K+oioxk1jCyEXhPjQwGaAvZeFRUTcE
 GOYvf0ezD8stQ6WLNTXr6htKWolfQWhn3sn+ti1fU1FNOReVffA4isA/q8q953ldrW1l
 fdJw==
X-Gm-Message-State: AOJu0Yw5bI0JaCGGE9PFej8g4iHk/D2wJM6UHZVyfhEHTh451Fs+p+gm
 83DFZywwMrDc2ZGSboppcH2PxEzKKlRI4tJnVBqnV0l6EdA8DnLuABb2+PYd
X-Google-Smtp-Source: AGHT+IFeqayfsAuiBqOqJnzSTZBRFY6ltO6ZcUMP8nseMH6ig2VYUlDxoyXyPQZZBEmVWFE9MxsFLQ==
X-Received: by 2002:a05:6602:2dc2:b0:835:45f9:c2ee with SMTP id
 ca18e2360f4ac-83545fa002emr141301539f.4.1728489045649; 
 Wed, 09 Oct 2024 08:50:45 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83503aaa142sm219543139f.23.2024.10.09.08.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:50:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 09:50:37 -0600
Message-Id: <20241009155037.3779101-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728489046; x=1729093846; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bY2HIkjrPtcB3b6A3lD9kLI6qog8Iw/UCv1T+XG3V4Y=;
 b=Nuef8qAgIE98BxZOX+LLrGVyKb59Ye6PpA2GZsUcHBzfAZG3rgjmRtp4NNH8GjzgfA
 APa49HO6uUEIoCDtmpc5AjLNx95J+8Hp7l15veVCTKsVzQTTDFCsRBWpU+pAvbnbCD2l
 EElBbfr2I5iUahbT8pDtbheeX1l2tlqFNPR+g44sR6TtcYaQdWFIZ1ik6XEMbh20k+gK
 hvXkgNEDnVeymHO2gyr6iSu0JiBT7S/L+kc2VmZGPQna0ZjHp47XH7g7KGH1uVyCMCMs
 Dqeme3qemacIXB2x33fT0tUUooPhXIGEuU7CHytH01G5fytrQhflWjcPZ6LlE0C974Rz
 XpmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Nuef8qAg
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.35.36
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
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
index 747c38967f..18282e4b44 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  8856feaba5930bea34efe6ab74b185cb  boto3-1.35.27.tar.gz
-sha256  10d0fe15670b83a3f26572ab20d9152a064cee4c54b5ea9a1eeb1f0c3b807a7b  boto3-1.35.27.tar.gz
+md5  8533d8838eed90ea6cef60acc924e4a7  boto3-1.35.36.tar.gz
+sha256  586524b623e4fbbebe28b604c6205eb12f263cc4746bccb011562d07e217a4cb  boto3-1.35.36.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 95a3fbe602..a7acc88380 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.35.27
+PYTHON_BOTO3_VERSION = 1.35.36
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/01/0b/068d62d2ace3f34a5771c37817c55de2ee74f73c696d4c815b271b66cf12
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/33/9f/17536f9a1ab4c6ee454c782f27c9f0160558f70502fc55da62e456c47229
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
