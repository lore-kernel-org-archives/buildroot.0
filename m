Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63079C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 06:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B4DD60E47;
	Sat, 25 Nov 2023 06:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B4DD60E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6t01pNBM0b6; Sat, 25 Nov 2023 06:46:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4632B60AF6;
	Sat, 25 Nov 2023 06:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4632B60AF6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF2FA1BF861
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4F4582216
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4F4582216
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tjG8Rdo5cm48 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 06:46:35 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9C3682213
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 06:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9C3682213
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7b37dbf896eso39728339f.1
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 22:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700894794; x=1701499594;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BafvFkdtgFlp7dKwtAP1txCDobrPy3zuITMtZ84y2Zk=;
 b=gYU98AZ+JCfebakGUKtbJge4UJaPGHTLszRnCA2vb+O9hgIAdlK8OgtK8qIFhFPIb7
 g9EpmJouTdR4W4PTQX9KIFF+RjX8VL0hoC3kqxc7OT+8KEwYxKCZNZvYDk1tlvNRaoOG
 3mDDZxMK7CugrJ2aZvB9hDWthZ5GhvqG1qQwROD1rB0JAtU7r+YBlLqL1cW6YdDm9QmX
 gyk0j5AFZkWi0NafWwHsdCm+kflgoRoZOiNJq5FGG4+uA2B72qj0t9/M+FNtrNIhd4iF
 lJdGgeaw1D1ppEPFhSMI3U8Jx08vAcZ5KQDE1UnDr+WfnIFzhgyinF6kznsbQCuTb/ea
 z2pQ==
X-Gm-Message-State: AOJu0Yx70S2bDyrcLWHSARepiT2Pmd+SuQr9L23qPPghl+oq1Q55H56z
 r1IGnMVyPRfIPkwHTKoWh2k7RsSfq3I=
X-Google-Smtp-Source: AGHT+IGSNeDIxOiYOW54m0fkHlt3FfopXSZRtcagMJujo4TtqDEUImmIhovIz/clC3D6u4nHW7kQ0Q==
X-Received: by 2002:a05:6602:3fcc:b0:7b3:52d5:4209 with SMTP id
 fc12-20020a0566023fcc00b007b352d54209mr811559iob.17.1700894794420; 
 Fri, 24 Nov 2023 22:46:34 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 fa14-20020a056638618e00b00466917fbfc4sm1162113jab.71.2023.11.24.22.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 22:46:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 23:46:31 -0700
Message-Id: <20231125064631.824099-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700894794; x=1701499594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BafvFkdtgFlp7dKwtAP1txCDobrPy3zuITMtZ84y2Zk=;
 b=I38sMbOEKenZMUBD5cbBN/tgOT9dSdPlU+XSiOohFDsdOkQuFwoRQQZT8qH1Ub0b7/
 6ZT4jJcW497jQJCZbrqgUiufHH4pR6FRWD0bZ35FIV3kXD9F2t23jE0Tp4eCRzcWJUN3
 zfosPZ7pN7jvgGxWqwaRE2zb3HkOd9xIM86dPaq/TKyZDD5OubhtZ6mEadaPhkLLBc4/
 wSko7Xae1AzL/ED+GhyPGspoEixrBbw2rf3nVap3sE7/z1cjXaJBxzy5xuG6XIr7q4PM
 AMZGmw737zB/i0Sm5E6VoNoizRdPCd86CfC4Tln/eyJkRae/92hBREB12PcGP9AlcxpR
 hTvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I38sMbOE
Subject: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 4.4.0
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
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index 7cdd93dd93..fa24c1ec66 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  d11b196cebb45a38caa56e850f4a60d9  pycares-4.3.0.tar.gz
-sha256  c542696f6dac978e9d99192384745a65f80a7d9450501151e4a7563e06010d45  pycares-4.3.0.tar.gz
+md5  ff4e54e91e32484b189b1e28758ec8c7  pycares-4.4.0.tar.gz
+sha256  f47579d508f2f56eddd16ce72045782ad3b1b3b678098699e2b6a1b30733e1c2  pycares-4.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index b1c7dcef50..fe6916445d 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 4.3.0
+PYTHON_PYCARES_VERSION = 4.4.0
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/01/50/e3015e6e03a3cf64113f509e8b86b71af37169b59ccedfcb182f3d031329
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/1b/8f/daf60bbc06f4a3cd1cfb0ab807057151287df6f5c78f2e0d298acc9193ac
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
