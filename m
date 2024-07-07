Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754A4C3DA41
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 21:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33AA040298;
	Sun,  7 Jul 2024 21:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEINCjzXWfDu; Sun,  7 Jul 2024 21:08:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB11340172
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB11340172;
	Sun,  7 Jul 2024 21:08:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E42D51BF3EA
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 21:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0940400AC
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 21:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtHWFz0zr7_n for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 21:08:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79A9E4004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79A9E4004A
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79A9E4004A
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 21:08:54 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7f684af6af1so115945939f.2
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 14:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720386533; x=1720991333;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=unDKOIx7i7d1diTdImGHjEVr0RmWjL3azG91swXOxHA=;
 b=WcgswAvmd+mG/AxSZz960UKzHqux5nlYCZ9s8w3AG1k5AsoJL7IJ09jU64pE/caM5x
 fyRuMUvYCkjOOmr0qnmfnh3Uta8rRhUtb8Ek9NwIauE94aHd8h+RaobOyfFvj6+7A/+V
 lhpBpuwybXiaHOzbx3SHjHC7mgX4/eN72fxGyVTfoHnqjhOKg7CcVYv5q+bkBDZ9uTZ4
 sh3JBfvpbQMOFQN2jnU8dDGp5wJdS7+qeR+ksz/7D2mdCwkmM4FyVSLL8TvK/AT841Pf
 ftbtw7isqP+PC22M2kqKXcyOz/iXR3Hs6wtwbPZtJvYy5VAyjIbQxktTpaLOJ1COWiq7
 t76A==
X-Gm-Message-State: AOJu0YxRYdH6Wilqy8zEsD50qbfUx16AZWnYdorrUb0Ld0bIBtm4fkKB
 dI+RsL6C3jHx3MXFfQ9+6K20AtsViabJ7g9FoRimxUJpmSr0J3nzQF+sBjjL
X-Google-Smtp-Source: AGHT+IEIUCUyQPUgpsYZZHYNo2kFw8PXHtYfug3RcW+9P4G6lHmweBvx6+OuYLozVaeL4LFgZ5ek/w==
X-Received: by 2002:a5e:8606:0:b0:7f6:83da:dd12 with SMTP id
 ca18e2360f4ac-7f683dae12fmr756450039f.11.1720386533251; 
 Sun, 07 Jul 2024 14:08:53 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c099a64d2asm629581173.27.2024.07.07.14.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 14:08:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 15:08:51 -0600
Message-Id: <20240707210851.2276498-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720386533; x=1720991333; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=unDKOIx7i7d1diTdImGHjEVr0RmWjL3azG91swXOxHA=;
 b=Fl4a8zGvLJE+w8orWt4MQmqvQViEgQQpbDpVzSn5OeoeHi5hNRqp88B4LnDC5uerIM
 dVk+4KBoSKVCO/ChDAHzckZFEPb4qfGTwlk3zQO7LVQU//y5iUo3IAJb+8jjC4dz58NE
 SLc1KeF7jTl0Tw6U7WLPz4AfPWnj6r5acxK2fQk8u8K4uGFFHYZ8HW1DliqYa3XgYO2M
 4kSWLlMbymEeJgUFc1TNErpsAaW83yk2gNM3oHAEu4baRoisY53MPelUvz4/oG+Q4y6i
 u56ycZPCac3A1ENybGXEDtUVRNyA5QlpWrqWGsY02ZE3GepRALoxgbgRwEeDXpJoel/d
 Uyog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Fl4a8zGv
Subject: [Buildroot] [PATCH 1/1] package/python-pyparsing: bump to version
 3.1.2
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index 4514e2d402..d029ebda2d 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  bb8c8c6b8015ca5887ae2c37917ee82e  pyparsing-3.1.1.tar.gz
-sha256  ede28a1a32462f5a9705e07aea48001a08f7cf81a021585011deba701581a0db  pyparsing-3.1.1.tar.gz
+md5  2bfafdb2d02d19ca4a3dfd02a9dbdfa7  pyparsing-3.1.2.tar.gz
+sha256  a1bac0ce561155ecc3ed78ca94d3c9378656ad4c94c1270de543f621420f94ad  pyparsing-3.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 0538c8df0a..b7cbbd4262 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.1.1
+PYTHON_PYPARSING_VERSION = 3.1.2
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/37/fe/65c989f70bd630b589adfbbcd6ed238af22319e90f059946c26b4835e44b
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/46/3a/31fd28064d016a2182584d579e033ec95b809d8e220e74c4af6f0f2e8842
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
