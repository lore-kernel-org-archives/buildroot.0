Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC405E6FE31
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 16:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FCFE840E0;
	Fri,  6 Sep 2024 16:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9voOWjO4b2_U; Fri,  6 Sep 2024 16:54:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ADFA840F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ADFA840F7;
	Fri,  6 Sep 2024 16:54:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB8A91BF97A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 16:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A57E840F7
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 16:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_X9jqTPcxOu for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 16:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 269CE840E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 269CE840E0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 269CE840E0
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 16:54:25 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-39f540795afso7929815ab.0
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 09:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725641665; x=1726246465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WQxzx5BiSVIUbm4LURlevMkziGKq76a6Dqe+qiEvvjA=;
 b=ffwIp36crrPLki5GzXDc+vUaQ0+D27dz2YT2FsQLj9GD29FUihv2bvCnPkaw8y2yQ4
 Rf0YGx3ywxHBFaztKsCNAnB+GLG2r5fgMFEP9sVZ/UZexZkQodKiXVOL6jC1fWSvsB9J
 8MU8YZwGyPBJ7OWUeotUu16Hl7A5hJpuieCM3KnU4JJuIqnmEuT+qiLF0qPOJBkddVoQ
 pJEdqez1bhKmNNn53IsgU3txSQLK0ZpznItxb6MHp8GQE8fltlx05OcLGbNf4MTtfZfS
 bvwtlcKN5arQoArvCsitZkmhBHNjGHcBcFRpAKArKkmv2GhZr4xwg/sk/Q2z3RsV2RVU
 vhSw==
X-Gm-Message-State: AOJu0YwloUbl3s6yL2fsMlYdvDMr0Eiezh9zzulcZUdkJjyxw0nq7/pQ
 KzT5Dqzllqf3o+L+0NdSdwd33+r5ofr5SWTncKncbqoznIcGyk8R0X1bBw==
X-Google-Smtp-Source: AGHT+IE+hf69EI0DBkmw75wyLvcF/HPCSPSgU88sIotVqxbIpbfqu3FAxKonHEiuYOD2RxrMb2cB+A==
X-Received: by 2002:a05:6e02:1564:b0:39b:640e:c5e6 with SMTP id
 e9e14a558f8ab-3a04f0cb538mr40300175ab.17.1725641664866; 
 Fri, 06 Sep 2024 09:54:24 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39f70b570bfsm17480735ab.34.2024.09.06.09.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 09:54:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 10:54:22 -0600
Message-Id: <20240906165422.1296850-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725641665; x=1726246465; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WQxzx5BiSVIUbm4LURlevMkziGKq76a6Dqe+qiEvvjA=;
 b=FPsGLNwL6y4usoHoMKOWxyzJCHtFPcjvM9rX5kS9u1Ehe04KIis7/EkR02QT3y9W10
 dw49p+sq9cKevNBJ9S+eI9hpk1RjoIvwJSjK/9Y1orZl+DRupTlPqRgLD5EDfiSRSFry
 +M4ZAg35mzfR7V8v0ZH5ve1rftShbCJzCnGXOfkCV9gWrnriYQGcZ/YGyN5+tTGd/Jgn
 KvkktjqcaqxFDnihV07zEw2MghqjP0qBjF4Kxl+uW0bM/AeCtPZWV+IDHhjrvkq9Hyyu
 Cz/s7jr5V8Zd8Qv7nvXleqiMWje+E8QULFfZNYkvQ2+zR9POUrM9JAQJzminm4jxzY99
 58rQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FPsGLNwL
Subject: [Buildroot] [PATCH 1/1] package/python-betterproto: bump to version
 2.0.0b7
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

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-betterproto/Config.in               | 1 +
 package/python-betterproto/python-betterproto.hash | 4 ++--
 package/python-betterproto/python-betterproto.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-betterproto/Config.in b/package/python-betterproto/Config.in
index 8548fd43ba..927fb6d2d6 100644
--- a/package/python-betterproto/Config.in
+++ b/package/python-betterproto/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_BETTERPROTO
 	bool "python-betterproto"
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_GRPCLIB # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  A better Protobuf / gRPC generator & library.
 
diff --git a/package/python-betterproto/python-betterproto.hash b/package/python-betterproto/python-betterproto.hash
index 8d23d2ae56..2eed9a490d 100644
--- a/package/python-betterproto/python-betterproto.hash
+++ b/package/python-betterproto/python-betterproto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/betterproto/json
-md5  bd4192c2997959100097479c34ff87e6  betterproto-2.0.0b6.tar.gz
-sha256  720ae92697000f6fcf049c69267d957f0871654c8b0d7458906607685daee784  betterproto-2.0.0b6.tar.gz
+md5  de9a12d1943dfa266dc3cf489cd3c6fa  betterproto-2.0.0b7.tar.gz
+sha256  1b1458ca5278d519bcd62556a4c236f998a91d503f0f71c67b0b954747052af2  betterproto-2.0.0b7.tar.gz
 # Locally computed sha256 checksums
 sha256  a5b8df75467e4b57a308a94cce5fdae84808a83ee6cd5af7e175c6b9784a753f  LICENSE.md
diff --git a/package/python-betterproto/python-betterproto.mk b/package/python-betterproto/python-betterproto.mk
index 37f72f8166..70eb403f6e 100644
--- a/package/python-betterproto/python-betterproto.mk
+++ b/package/python-betterproto/python-betterproto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BETTERPROTO_VERSION = 2.0.0b6
+PYTHON_BETTERPROTO_VERSION = 2.0.0b7
 PYTHON_BETTERPROTO_SOURCE = betterproto-$(PYTHON_BETTERPROTO_VERSION).tar.gz
-PYTHON_BETTERPROTO_SITE = https://files.pythonhosted.org/packages/45/43/4c44efd75f2ef48a16b458c2fe2cff7aa74bab8fcadf2653bb5110a87f97
+PYTHON_BETTERPROTO_SITE = https://files.pythonhosted.org/packages/4e/94/930a1368fbed92adc897a9a1fae282e3f9d608547dbf805034ca549f381a
 PYTHON_BETTERPROTO_SETUP_TYPE = pep517
 PYTHON_BETTERPROTO_LICENSE = MIT
 PYTHON_BETTERPROTO_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
