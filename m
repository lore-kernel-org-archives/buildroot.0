Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FEDEDEC1E
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 07:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C74811A0;
	Wed,  4 Mar 2026 07:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eFTZycxkYl2; Wed,  4 Mar 2026 07:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00183811A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772610180;
	bh=m4Jq3uZwQA6z0xQ90ZSUjmb0V8/no2UV/CpRhULiRiY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qCXZw9beYyZiDBvSXD5uauvkJK6022OA6y4ZK0iRnXbTUaVs0vGVICuNZX5DGDKSA
	 ata1FgUhDiDGuwIH7uW4Yl2qYxfv88gGf83qgkD41SdEwOFpgj1hY/Sk98sbT6Y+QN
	 ehqf86cU/nTb1ZsAcFuwCdZh+82xIr9rnCmTb1436XKfMsJwy/yY3rBgqGDoBYiyV7
	 eAydl8rFY+u6TzrSlJ9jkwDvLICCghMVZ5UPl+WGTCMIDaLFa5BH49aTUe3WD/ZgnL
	 anvl0wdRK6Z5KyY24vW3UcWvRxQ2jMr8gP5Lbj4IdDvHRKESJgO5sq5hX4YM9fblky
	 iN+0u5oiQuaAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00183811A4;
	Wed,  4 Mar 2026 07:42:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9045231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6660408F7
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJF12FKE4JAK for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 07:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED562405BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED562405BB
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED562405BB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:42:57 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-824ba8f0acaso3283920b3a.1
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 23:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772610176; x=1773214976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bwi/0OvspnaQ87EPQwqC0UMR/MkxbitHfSJ2nqTT8q8=;
 b=GrIN884qThz1TFf+l/oIByd54FDdO2QUn7N52xwRJa1s5VodYJv93u2g0+8EiBJesG
 1mE1+a0a+IT4TACCrjhU/4sLmuHfxtZSRFdY5VbTHwtyW94S3CnZ9tKzc7sDTtYHvPbh
 HNervWx5fKWgGDQQkbvxlcADaUB/3pruBZ/lY3DJQ2Y8ELorSf78jESDtBROImPUj1xk
 s93TyyRt/MuWVL6p5hGqNaiWqBkP0lLN6bhtbDylZN58r/rO0qjGR+8lV4Lc7XY+vqTx
 abK9b4gIktNrHNMSfS9+yQpW/OJfZNJjcYzo1u7B1nRBX2sJ0uZnfNHD538qGBCLikZm
 l8IQ==
X-Gm-Message-State: AOJu0Yxz3JrVhNRwGfSR9ikSyb94/B9Z665j82JFtsDpTwpzkKz3wpqy
 hawgBy0oGAJeLCtqfEaIrsB31X6I39wMl7nTIgn9fqKskJEAvU2kvOargMtShDdt
X-Gm-Gg: ATEYQzyOHCFtKh5kPOIDvAWRQDsbJAjMmBjIh+kKh6MLAtG3ofjEGxwjen6zs4L0n53
 0rc4QSRrVS3sDVVM0V0s2QlX0efjkPsKUuHc/I3N7pNKeNTedQODW9fIo5PqrEO892N3oSFfcrl
 FEQZG+NRxxTI457Djo9RmFEQLYf676nK/TOKHZvc44uA5XurQeCDbX+ZnWxlMIcfiJ9qJAKtUso
 jbwj9eEutB5Z5KMM1bFknbB7XlxZO7S0i8rdNiO6cPLnAskEBHIZ7FDZ8Gqrq5nUye+/s6y+2jM
 IOuxTfdDmmNzBV6DEbsKDob/0roYQffXNEq85Rt8//0Zioe4g6tSFWCsUjskhuIvSfyNscSRPkJ
 L3/pccFTpmmpL2dXVWyw/JOBDx1t1sRXzMc7egNm+dnQ7Dvfxh4A5vZN0eCjn4Q8CgCm+snTEbH
 zpqK1kXjytD1KiiOlSaox6cdjJaXGKwIbe0185T2nxFAUq
X-Received: by 2002:a05:6a21:32a4:b0:395:732:2c8f with SMTP id
 adf61e73a8af0-3982e27c095mr1124126637.65.1772610176173; 
 Tue, 03 Mar 2026 23:42:56 -0800 (PST)
Received: from fedora ([47.30.255.168]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c70fa82dd09sm16445826a12.28.2026.03.03.23.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 23:42:55 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 13:12:34 +0530
Message-ID: <20260304074234.15910-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772610176; x=1773214976; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bwi/0OvspnaQ87EPQwqC0UMR/MkxbitHfSJ2nqTT8q8=;
 b=ikyS2Jz93K5O74Xp24UzWf5ehE+7RThinkiidEx+M5/RqdBVaKlukUWAyFsvVs8p+0
 CRpMHBlwNnSJWB+tXWZ76ro5MBUEQM6fy+OH2F+x/gS7M71+aOwzX5IdMiTmJQ7F4Yhs
 ZPIg0GT1zSVqEDC4e0HJ1MexGcCz6E2iiqS4oi7HQOVwFhTela4U13yQzk4uyJC1JdP4
 O72TP5WyKDIKJxSxYavlyeJNvl8/S4IX7d9+QzcU1orUZs2EIRXrez7SejEKtAR6kS3q
 f+zK/7UIf/RisM4d8G5YJr9TYhDAu8OiJCHcDxRqKO/ardyxPchJR581/fb7UbSFZgXD
 f/5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ikyS2Jz9
Subject: [Buildroot] [PATCH] package/python3: remove nis and ossaudiodev
 modules
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
Cc: james.hilliard1@gmail.com, thomas.petazzoni@bootlin.com,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 maxime.ripard@free-electrons.com, Pablogsal@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These modules were dropped in Python 3.13 as per PEP 594.
The current version in Buildroot is 3.14.3.

- Remove the TODO and related config overrides in python3.mk.
- Remove BR2_PACKAGE_PYTHON3_OSSAUDIODEV from Config.in.
- Add BR2_PACKAGE_PYTHON3_OSSAUDIODEV to Config.in.legacy.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 Config.in.legacy           |  6 ++++++
 package/python3/Config.in  |  5 -----
 package/python3/python3.mk | 12 ++----------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a2a7b06a6d..9a9f83eb36 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
+	bool "python3 ossaudiodev module removed"
+	select BR2_LEGACY
+	help
+	  The ossaudiodev module was removed in Python 3.13.
+
 config BR2_PACKAGE_QEMU_TARGET_CRIS
 	bool "qemu cris support has been removed"
 	select BR2_LEGACY
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 423e5daabb..f9d3d3aaa2 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -76,11 +76,6 @@ config BR2_PACKAGE_PYTHON3_DECIMAL
 	help
 	  decimal module for Python3.
 
-config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
-	bool "ossaudiodev module"
-	help
-	  ossaudiodev module for Python3.
-
 config BR2_PACKAGE_PYTHON3_READLINE
 	bool "readline"
 	select BR2_PACKAGE_READLINE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a240349d3e..07cba7c02d 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -28,7 +28,6 @@ HOST_PYTHON3_CONF_OPTS += \
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
 # This is needed because libpython may be installed at the same time that
 # python is called.
-# TODO: nis and ossaudiodev modules will be dropped in 3.13: https://peps.python.org/pep-0594/
 HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
 	py_cv_module_unicodedata=yes \
@@ -38,9 +37,7 @@ HOST_PYTHON3_CONF_ENV += \
 	py_cv_module__codecs_jp=n/a \
 	py_cv_module__codecs_kr=n/a \
 	py_cv_module__codecs_tw=n/a \
-	py_cv_module__uuid=n/a \
-	py_cv_module_nis=n/a \
-	py_cv_module_ossaudiodev=n/a
+	py_cv_module__uuid=n/a
 
 PYTHON3_DEPENDENCIES = host-python3 libffi
 
@@ -176,17 +173,12 @@ else
 PYTHON3_CONF_ENV += py_cv_module__zstd=n/a
 endif
 
-ifneq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
-PYTHON3_CONF_ENV += py_cv_module_ossaudiodev=n/a
-endif
-
 PYTHON3_CONF_ENV += \
 	ac_cv_have_long_long_format=yes \
 	ac_cv_buggy_getaddrinfo=no \
 	ac_cv_file__dev_ptmx=yes \
 	ac_cv_file__dev_ptc=yes \
-	ac_cv_working_tzset=yes \
-	py_cv_module_nis=n/a
+	ac_cv_working_tzset=yes
 
 # GCC is always compliant with IEEE754
 ifeq ($(BR2_ENDIAN),"LITTLE")
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
