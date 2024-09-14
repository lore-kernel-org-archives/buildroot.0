Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA90C021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3D1C60600;
	Sat, 14 Sep 2024 22:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qegx9alrAMTR; Sat, 14 Sep 2024 22:46:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0DA7607DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0DA7607DD;
	Sat, 14 Sep 2024 22:46:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79BBD1BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6954080965
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQA14hFbca90 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 72D20808A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72D20808A3
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72D20808A3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:46:30 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a08ca8d45aso11084545ab.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726353989; x=1726958789;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Js/dZrGuGAhOCUAmyvWjKSuwcQqhyITgi1EuPAd1rSg=;
 b=JcPpranbrBUV3ZM7U1XssdHuGAUgdzF1OCDDjC3zTRLTRw+x1m026mMpgpMkfsvU9k
 qIU1EoL1lkCl6j/MooDjU4WVugdTuWDCoJJu3hmB/p0+3f3kIbdoEYdVDq7nV26hHpuS
 lqXPZKR2szt76OT8NCteq1dKQAL1a1CFJVaB+2iTtsihQ07KBatnsd7s2SpyPcj6Tjp+
 AhS1bexpiCoW9/+wjJxUPsaRHPM2OnZ3Hr6b+CheKBr5HC8DHeJ3UFi83EbsN6hc1PvT
 b4w16zMOMi+vxvPyWCxxSJAM/vyJ5RPbpt1ViRkwVDLMbgwUPrmD6B4wg2tbvSBb5Df7
 5xHw==
X-Gm-Message-State: AOJu0Yw80S4mo1UoWLfiAKaW9zGq34OSWK0UdPTVD7nv672tBtx6XxGA
 Tp2bVvSHSQLKZgBZS3W4K8NxKLHKpeW4FKs/pIlLwXac+mN8ZWTsAHMl0Q==
X-Google-Smtp-Source: AGHT+IGRJTybcra+0TES6+3hGZUVQY0XizVASoxGjoRrrYUEygP9PQeDUF6BtT49N+D6ulwUxDtguQ==
X-Received: by 2002:a05:6e02:1caf:b0:3a0:933d:d307 with SMTP id
 e9e14a558f8ab-3a0933dd365mr40494075ab.8.1726353989141; 
 Sat, 14 Sep 2024 15:46:29 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed56fafsm609359173.156.2024.09.14.15.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:46:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:46:26 -0600
Message-Id: <20240914224626.1365661-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726353989; x=1726958789; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Js/dZrGuGAhOCUAmyvWjKSuwcQqhyITgi1EuPAd1rSg=;
 b=UfYjKc8SnpkUa9brdc2Xw0g5nAlrFyaKlrMaJfpLr4wS1bk5V3scykoTFjqKCyhVQ6
 uHuUB4BYtYs6RarE5ga1PrsT8h5bYKV2zrO1g3Z2ZazWB54cAfpA7RSdjM5aKWeeJcmf
 gxeYN1AhV7wqjKKjgkcbb8Mko+dVryaZDmAUsr+DOthqXBdwmJjm4E/SgoSCw8sHDOFa
 AZxoE4uLidP8KhaZg8X28qnTL+a99vNA1dTtQ10/RpYUNu8zdHPmHdtLODO6Py0/4yVs
 n09fm5elrylyzjAc0KotR0im8m8bNb9+Mq9bn+0tzXVm77VbRqwHR0UpWMNzxXEtBYJx
 Gj0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UfYjKc8S
Subject: [Buildroot] [PATCH 1/1] package/python-cachetools: bump to version
 5.5.0
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

License hash changed due to year update:
https://github.com/tkem/cachetools/commit/d56683461f42d72a53d52e7dd3bee11b5fbb2b52

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cachetools/python-cachetools.hash | 6 +++---
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 7b6b939191..fb16cb492b 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  5317c13b69c4021e925a2fbbc199bcc9  cachetools-5.3.2.tar.gz
-sha256  086ee420196f7b2ab9ca2db2520aca326318b68fe5ba8bc4d49cca91add450f2  cachetools-5.3.2.tar.gz
+md5  d589387a314eed031e97348a73b8cf91  cachetools-5.5.0.tar.gz
+sha256  2cc24fb4cbe39633fb7badd9db9ca6295d766d9c2995f245725a46715d050f2a  cachetools-5.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  76260c1370a7d41d5fac71a27d781f3add5d7249adfbbfa930846d2d9e47dbd5  LICENSE
+sha256  2f4d2ff05f05c5da3879f40292b7600332d775dc7ed320d43dd42f3cd7d92c9b  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index c841e0761f..38a2313d59 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 5.3.2
+PYTHON_CACHETOOLS_VERSION = 5.5.0
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/10/21/1b6880557742c49d5b0c4dcf0cf544b441509246cdd71182e0847ac859d5
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/c3/38/a0f315319737ecf45b4319a8cd1f3a908e29d9277b46942263292115eee7
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
