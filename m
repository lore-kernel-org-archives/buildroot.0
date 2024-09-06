Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8814E6FE41
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F41840151;
	Fri,  6 Sep 2024 18:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id npPq50quwsYg; Fri,  6 Sep 2024 18:51:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1919D4018B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1919D4018B;
	Fri,  6 Sep 2024 18:51:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3554D1BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21FEE4018B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlpeBKdDPNFP for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:51:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE49A40151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE49A40151
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE49A40151
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:51:02 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82a1abff760so96922739f.0
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 11:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725648661; x=1726253461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hkh9e87QQsHanh/ebAQ+6S1wMtw7I0zXxta2xBFNmUY=;
 b=lJnJlBGd0ZCK32mvTueFXYGfRKEcc/OsBvLrG7qJSy31FoSYBiUNJXIFp46raW6U+u
 5zmqdI89oetH0GyILFWrAPEUvrLuiwjobV6LSM1p2c8HaD1MkXUSeyLdfG4TyFfnA9wd
 A4+7Jp4EeGxWNjBINYvtEf2kFFE4kH0ON0Lz/AoxdY+BZWlu1poUDgsVXEjV6QjbVVRR
 lfXP+RNGPGiNQho98ByA38Plubj/39qJoSyIAv9ABSI1thnKTEdXwN7Ac0s7fThBH1Tp
 EWGXGLJGfJlml7aP7y1dg0DYISLXfrbBwXvCyB+3SIQudUcAMj4DTp7EWWHSZXYBH29/
 dxlQ==
X-Gm-Message-State: AOJu0Yx85+UPW/RESkZRr+rZ03DZfdo+zzBmt+C78r1poRXVS7onClU4
 C0HK3Bcd+xZHPE19KFIFP49eJBdTy9W8Nkp3zDDLycPV1570+xLD4nBabw==
X-Google-Smtp-Source: AGHT+IFj6MjRgCq0FA6q1ouuBijQLx1A539qzdkLTkbELGNBo2ud45iE8g5OCbeBlD76YIX7YyHeeA==
X-Received: by 2002:a05:6602:620b:b0:82a:3bc7:bd83 with SMTP id
 ca18e2360f4ac-82a9a4fa8f7mr281300539f.15.1725648660784; 
 Fri, 06 Sep 2024 11:51:00 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82a1a412f07sm477475939f.15.2024.09.06.11.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 11:51:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 12:50:59 -0600
Message-Id: <20240906185059.1263571-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725648661; x=1726253461; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hkh9e87QQsHanh/ebAQ+6S1wMtw7I0zXxta2xBFNmUY=;
 b=H7Sq5DC3xZ3usxS48s/BWCbHaz7+bRXyc6EUYWz7SCRx3Zchz2VRFsH52NwNBgV2YD
 vetU6RmJx6IAbWSJCDw58c8025YWjHugkfkvRBoJxy+bosjaKH/9P9DwQ/V/T4FUtbdT
 0L57B/2jzqza05chE5UJz1Z5E70+J9RjwTLn34C7+nLQR7rwLelUPGhf3bwz4O4vMODr
 0HHRNN6OEH+v1f5wAk/1nFsqNNcCm0yBH8U9zvr1v1JcMNjxC04MLarABjA9gn2Gn2Sf
 PxnePRrZmNzwZ50k6vPW5S+zSs2sKsUAkxrWDzth++/FPOTP7oPqG0v8DzR0mYUF30xb
 nICg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H7Sq5DC3
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.7.2
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 7c8f352de4..6727fbc571 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  3bdc2a574cbfd10ec6dddf38c3f26598  pymodbus-3.7.0.tar.gz
-sha256  5c772babaa61a65ff908293faa668aedcd9d9e10f4bcf5c77a8fe51a6fd9ed47  pymodbus-3.7.0.tar.gz
+md5  1e1cc27f4a7911a8554190156a441089  pymodbus-3.7.2.tar.gz
+sha256  6cc63a14c8cca83f5b6d9dae3319565061bd49503ee7282df681201c16357eef  pymodbus-3.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 6a7c384cf6..ab8f72fb8c 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.7.0
+PYTHON_PYMODBUS_VERSION = 3.7.2
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/cc/83/de0c3596f17ac4833f591e96cafee7ae6109d846d607387b48f88d66759a
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/a2/f1/10be9b46fa9389271eeec8cb022680ff701ef97bcdd47d0e4a1fa464c057
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
