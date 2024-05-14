Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607CBC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 15:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BD8F81B8A;
	Tue, 14 May 2024 15:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjilMduuN9ok; Tue, 14 May 2024 15:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AD5E822BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AD5E822BC;
	Tue, 14 May 2024 15:42:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B96E1BF4DB
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 15:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC35E822BC
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 15:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kHITS_JC2_Q for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 15:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECDA181B8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECDA181B8A
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECDA181B8A
 for <buildroot@buildroot.org>; Tue, 14 May 2024 15:42:53 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7e1b5173ddcso239931239f.1
 for <buildroot@buildroot.org>; Tue, 14 May 2024 08:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715701373; x=1716306173;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eTMq5YT8m7UePQZ8zE2gQPw0f944XpHu5N9TsNgAmk4=;
 b=kWAJvwVLS7X9smxIdxLceFW9HS+kpybZJigww3PDOZkfzBeahWIhIERNoVlu43XY4j
 UvkMhjvoE8rZYbEO7zgpNVmgpQ5b2UdQIQu17OOx7VuUlNtKGQHcLIpVCMuiaRu1QRjI
 MoWc5aQRbWF/O4Wu27cTDtN/hMeU/KAAMU0VrKLjFl2Epk0/0op1nciIB3cVTKWDO41R
 vA5ahpsC4BFSDT6Qjhs9CF6tuyOqgvNkoDuOytzYELCl50V8478WPpQhM2SXMZKSxBQg
 xL4GVnWkOf276mTDbP6IEIjkUX/pFjaqHQH4PG7fMjqMRwtWYc689K8jDcQsu7z2qQNP
 tbKQ==
X-Gm-Message-State: AOJu0Yxz1Nyj5BjhhtfgZ1CBEorP2WvnAxxqYwqWEXvrZrEwgqS51jph
 F7Wy4c/HoXBFfAfgPa044XsvfGwNtkIdtMvfMx6r/9IJ0iLKWp81q78TQw==
X-Google-Smtp-Source: AGHT+IFdRgRacgvcxzaDHtuOm5WrGnscdVAGiDiongDZTI5rJK1YKawMoHJBRf6dSvPMrs5Uvq+ypg==
X-Received: by 2002:a6b:5007:0:b0:7e1:acdd:962e with SMTP id
 ca18e2360f4ac-7e1b51c81dbmr1551900239f.12.1715701372738; 
 Tue, 14 May 2024 08:42:52 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-489375c250fsm3124914173.101.2024.05.14.08.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 08:42:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 09:42:50 -0600
Message-Id: <20240514154250.1453970-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715701373; x=1716306173; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eTMq5YT8m7UePQZ8zE2gQPw0f944XpHu5N9TsNgAmk4=;
 b=bi5YcJVP/4zNQYtQsWN4lBnm8fEgXNEMrQPiaZaVCDtconAdwz6d8hbJ6zvuTConP9
 vVmDmljvBKyYYpV3qnGQ5vyrcEKjcMgh6Go2AtttRaFfg9LLPsAa8A9jOYpmIECjhmcV
 Vzlr+my49x8D1ws/Shr+t++7RhazwkOovz4uQSJ1KXD+C7ZqKx3vsfxqECKAhUgRderp
 Gy90DEQcsUKYmkNu0vOt2UhWsW6vUkhfbVvFyzddN/AOvoV9cPMyrgMZBIuA7Mgtz9QD
 ajoN89K2GMIfZ8RGacqFHrq03i76TQvDoRnwLYk7uI3AmEu85G6ZTVD6zauX9qfqOP3c
 wqDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bi5YcJVP
Subject: [Buildroot] [PATCH 1/1] package/python-ml-dtypes: skip dependency
 check
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package pins overly strict numpy dependency versions apparently
for compatibility reasons that don't appear relevant to buildroot.

This package also appears to pin an overly strict setuptools version
for unclear reasons.

See:
https://github.com/jax-ml/ml_dtypes/blob/v0.3.2/pyproject.toml#L51-L55

To fix this lets just set the --skip-dependency-check build option and
ignore the build dependency version mismatches since they don't appear
to cause any build issues.

This error was introduced when we migrated setuptools to pep517 in
8937db8dd595e0988751e5dbb568e870b07b39cc.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ml-dtypes/python-ml-dtypes.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk b/package/python-ml-dtypes/python-ml-dtypes.mk
index 676137ecf1..8097265078 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.mk
+++ b/package/python-ml-dtypes/python-ml-dtypes.mk
@@ -10,6 +10,7 @@ PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/39/7d/8d85fcba86
 PYTHON_ML_DTYPES_LICENSE = Apache-2.0
 PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
 PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
+PYTHON_ML_DTYPES_BUILD_OPTS = --skip-dependency-check
 
 PYTHON_ML_DTYPES_DEPENDENCIES = \
 	host-python-numpy \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
