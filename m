Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991C6E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 19:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 579B64018B;
	Fri,  6 Sep 2024 19:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbuXZk2iOfGY; Fri,  6 Sep 2024 19:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E07C401D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E07C401D5;
	Fri,  6 Sep 2024 19:02:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C8E481BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B69F46062F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WIsigejb1R07 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C589660604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C589660604
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C589660604
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:02:21 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-82a205810ccso101804539f.2
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 12:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725649340; x=1726254140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NRToI3jhl1vV4qiYXiBvj6NeMzEvqL9M86nslpp0RrU=;
 b=At5CwFwME0Niga+jMMNg8MDI6SyX+rteUTeX/AckTfvEjJZpmS1eIm+m0mW6Oq65ZG
 liWhQNV3DTIZBD5G5OqgWXaYLU54ZfCPdX/RnIQ0I3Apb2j/Owc960WLiUZ4fddtmPyD
 NrQ9OU2MOloQnWdOD6qNFlgAceQrsskloUAbUZMLkNqX4bTU44bJdhssWoNa4GgKYAUE
 1lWsDkDBNYhWouSvbVc2aBDdWrlVNIrQ4i5mwqoTMIuH4kc46TFilJWCn/tXSVswoBeo
 VXtbPkG45WnderWS7pwN93/RM/xcOpd9n4GeD7Y76EmRt4DzWZPKOMIqMAVgqotMOHnG
 EVLA==
X-Gm-Message-State: AOJu0YzsRWSUPsiu4DXOCwIuYK4Ew1O1CL4RXPwKcZrPUM+cAcH/bESi
 +0x/Y8J/5CHzvwY7Kqd2flzKiA0KCfo3mPbnv2JHUFw5oLl9kxYRpCAJZA==
X-Google-Smtp-Source: AGHT+IFbCkGiWx3zTSpr7ZRccq6NPz64byUzfOcFsWq7r6u4Az908+q/roe0l01wxfoiZ4QN7QEopg==
X-Received: by 2002:a05:6e02:2141:b0:39b:3b8f:d181 with SMTP id
 e9e14a558f8ab-3a04f0cb52dmr40250765ab.16.1725649340543; 
 Fri, 06 Sep 2024 12:02:20 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39f6b33d6c9sm22329155ab.2.2024.09.06.12.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 12:02:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 13:02:18 -0600
Message-Id: <20240906190218.1506674-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725649340; x=1726254140; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NRToI3jhl1vV4qiYXiBvj6NeMzEvqL9M86nslpp0RrU=;
 b=fI3BnFxf72pv5NKfopfeQdldws6E2lK+l6M5PxevZe4dndGm0GwmPoVxqr9j+bkqYW
 KCDyCs20g4nXMxIXOR1fQE+0vJaolGqGR53mIEBQgsAMwdqqwHg/ziX3T80DfdDWEHp4
 4h1Gb+8WhbR1jIvaLKjvlrB8ySAgeyapHwbnMsQHY3vbSpP8u96sep5fJ4AQs1+1WUCl
 s3ffQwtJm5off0UsHjog5x0XEETOfUiCpr3IYAfDBE8f7BLQAPdlmEzPz7B4YzOT4/MX
 1ODIV+jpbieM7iS568LKk2MFwCnKqqSOKZrghq0Uu2XSf5Uf0gpKJy7L6aQ3kVUdnYz9
 tuPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fI3BnFxf
Subject: [Buildroot] [PATCH 1/1] package/python-tomlkit: bump to version
 0.13.2
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
 package/python-tomlkit/python-tomlkit.hash | 4 ++--
 package/python-tomlkit/python-tomlkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomlkit/python-tomlkit.hash b/package/python-tomlkit/python-tomlkit.hash
index 8c6d3c2377..21e61dd5fc 100644
--- a/package/python-tomlkit/python-tomlkit.hash
+++ b/package/python-tomlkit/python-tomlkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomlkit/json
-md5  e182df9625d617692a9ae035266634fe  tomlkit-0.12.4.tar.gz
-sha256  7ca1cfc12232806517a8515047ba66a19369e71edf2439d0f5824f91032b6cc3  tomlkit-0.12.4.tar.gz
+md5  0db1a3750c64b141720f05430df9b433  tomlkit-0.13.2.tar.gz
+sha256  fff5fe59a87295b278abd31bec92c15d9bc4a06885ab12bcea52c71119392e79  tomlkit-0.13.2.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f9b460ba719da6626add264d3782f275a4ff7aab677beda08b330911e23adb  LICENSE
diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
index ad82719ee2..99b974da5d 100644
--- a/package/python-tomlkit/python-tomlkit.mk
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLKIT_VERSION = 0.12.4
+PYTHON_TOMLKIT_VERSION = 0.13.2
 PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
-PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/7d/49/4c0764898ee67618996148bdba4534a422c5e698b4dbf4001f7c6f930797
+PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/b1/09/a439bec5888f00a54b8b9f05fa94d7f901d6735ef4e55dcec9bc37b5d8fa
 PYTHON_TOMLKIT_SETUP_TYPE = pep517
 PYTHON_TOMLKIT_LICENSE = MIT
 PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
