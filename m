Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602C8C4167B
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 23:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00C7560C1A;
	Sat,  4 Nov 2023 23:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00C7560C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jl4fdmjfHwaS; Sat,  4 Nov 2023 23:56:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 461E060BFF;
	Sat,  4 Nov 2023 23:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 461E060BFF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8E061BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E3F281F23
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E3F281F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hIP_Ak5b-7kY for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 23:55:57 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71DD681F20
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 23:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71DD681F20
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7a92727934eso122604039f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 16:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699142156; x=1699746956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kkYdbwGi87KS54ki3OK6OE0BZzzjyXL1km7q1O4Yd2M=;
 b=lj+pYJ1bdlu4ZXvnH3YYx+pssTmXChsm0b3A7M8S+W8r8f+D/9nPKWQEH691JcUghK
 3XJdPvm/L+iIw62Gw1Qkws01U9QblaI015QWJmhWv2Vbw7WFBUbr0TOX5/EdYOElECtD
 8uoeB8a9bNhBrTd2Bzjm8FA5ho2EVs0t6J82MyBY6wU3WawJxifdhFh9avtjfUL+qXdy
 0+Ikdnh7UAUcVYaS80qfHUl17PxYzEyU03ZpmR8wn2JFkfNhg6SHvhFKFuEL8bafGgkT
 sthTwv8DS121LEOxuGQlPr20PhvxmL6KMiF67nP520RRulaFkrCufWA8Vcu+VyNCIM3v
 33Hw==
X-Gm-Message-State: AOJu0YwwmBh36Fo60vulAmvAECdw6eTlSZs1wZVMlzdTUND2exodDxNz
 yw0Emz+LJVH272r3hJ96vwbywdZ3bx8=
X-Google-Smtp-Source: AGHT+IFeBcbl1B8eGWdCNbfJDjckdeQnTGLLz83YQ+QXgTjLNhzgwvbhxcRDT6b48MAF4vcviq/tlQ==
X-Received: by 2002:a05:6602:3fc3:b0:7a9:9235:7813 with SMTP id
 fc3-20020a0566023fc300b007a992357813mr35463818iob.11.1699142155733; 
 Sat, 04 Nov 2023 16:55:55 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 cd13-20020a0566381a0d00b0045ae21e7291sm220203jab.32.2023.11.04.16.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 16:55:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 17:55:54 -0600
Message-Id: <20231104235554.2696561-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699142156; x=1699746956; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kkYdbwGi87KS54ki3OK6OE0BZzzjyXL1km7q1O4Yd2M=;
 b=lPgEfHLgkI9L0xlrICJ7ws6z9h9y+gMdl6yAjzOjT+sv3osIEcdAyURuxmBsRkAmhS
 uLZVMxSnB4HkmyV1Pkd081PKUD4yDEPfq3+AQ+8n8ckG33zOOCcXzOnAFhe+hDFs6kHV
 4YmqsdMgJi9f7FcC9Pl5kwc/8ADK2Ku/n+9Wcgy6XROtxdEQM0CYmGnZXSL/cmCWUCC1
 iDyBCZ6y/6RlKdcdSafc3U5qFroj/k0eoHa3SrgiajmQJ1MyD6vheiSdqfUOpqyv5fom
 nZiAadH8lq6OoVgB+fMjykAMP/JA6t8F1w2cyHxHVo2EUa62Y1NxcIB4YJqle0PhlEG7
 loUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lPgEfHLg
Subject: [Buildroot] [PATCH 1/1] package/python-alsaaudio: bump to version
 0.10.0
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
 package/python-alsaaudio/python-alsaaudio.hash | 4 ++--
 package/python-alsaaudio/python-alsaaudio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alsaaudio/python-alsaaudio.hash b/package/python-alsaaudio/python-alsaaudio.hash
index af3d0faad2..ab8b868b97 100644
--- a/package/python-alsaaudio/python-alsaaudio.hash
+++ b/package/python-alsaaudio/python-alsaaudio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyalsaaudio/json
-md5  5408be7d7017ae9272706acb4a543c2f  pyalsaaudio-0.9.2.tar.gz
-sha256  e74a66d6c7a6bcceb990df66d3ebc0fe382fc9d765f35f050f9d98c695304b36  pyalsaaudio-0.9.2.tar.gz
+md5  720b2e1a47a5fdb587ea1b4eabbd23e6  pyalsaaudio-0.10.0.tar.gz
+sha256  e21175500a2bd310ae3867e7991639defc1e2a5c92cf1b9f7083296b346738ab  pyalsaaudio-0.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ef6ba930f96986d78082e67c817ac617b9e833d60d5a0460f24c9c674a010935  LICENSE
diff --git a/package/python-alsaaudio/python-alsaaudio.mk b/package/python-alsaaudio/python-alsaaudio.mk
index 205bfdb86c..0692f4a8e9 100644
--- a/package/python-alsaaudio/python-alsaaudio.mk
+++ b/package/python-alsaaudio/python-alsaaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALSAAUDIO_VERSION = 0.9.2
+PYTHON_ALSAAUDIO_VERSION = 0.10.0
 PYTHON_ALSAAUDIO_SOURCE = pyalsaaudio-$(PYTHON_ALSAAUDIO_VERSION).tar.gz
-PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/a9/bd/24f576c07953671edfeba2545c3c92c46e97384f622957ecf95967c2b456
+PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/e5/f0/411140b1c2d8eea8531233f39103e7ebda560030493e298be6439ce36936
 PYTHON_ALSAAUDIO_SETUP_TYPE = setuptools
 PYTHON_ALSAAUDIO_LICENSE = Python-2.0
 PYTHON_ALSAAUDIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
