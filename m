Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74B3E77180
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 07:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABB75845CA;
	Fri, 13 Dec 2024 07:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RDvDt12Zcov; Fri, 13 Dec 2024 07:40:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A48A6845D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A48A6845D8;
	Fri, 13 Dec 2024 07:40:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5F6CECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 07:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4A996143E
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 07:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjTHJt2dUAwg for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 07:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F31A61431
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F31A61431
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F31A61431
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 07:40:43 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa6a92f863cso282413166b.1
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 23:40:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734075641; x=1734680441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CiolPgeSJS8+fHaEwd3sAtfVszhN75mmyHVGEqHKGwI=;
 b=tsyFdRKQVQv+PXTL8Hn8el5gtpPNExYzpZcrgCiR5AJnTFuxTHCRLbc2BhcLz0rJMG
 k3BbQsTGP6szJC5UV70sZLMZj7pg1J9q+S1dx7Nm97NqkBce+VL8eelFKpDtec2WWe8l
 B28wvWUqJLFbMsjlsk7UhfjJarNvF7VR/r5N3MGdYA6jJf1bb07i2tLUPyGLCA4x/Kxt
 PV+nszPXchLocsGzeu8IiuDVx0vbKPeTrpu+YS8eDLqi0yU041COtKFDdeD+hBLhiDWV
 ECXGiPPnfo2fysRRkB6xs9QwrvboYEdyBl4y7wo/6evjlfI0c//tFENGDhaR8+ICNrEK
 oA2g==
X-Gm-Message-State: AOJu0Ywj9kXIf4v+RY9jXPUIhJn3nABtkNufLvFKQ9QReIHBwTAMOWHn
 i7Vw+sIRxeTFYCe5C+IJ0EehJe5YKs7BNzBhWgFqOvSjlN7ckDtoQDIBqw==
X-Gm-Gg: ASbGncuOuf7ZtsTt55yyquTta7X7gDFeZRIsGipNKDiQPa8PCz/rXJfwV68fe8mbvur
 bLEsx4WOPC+2JPGn94TgNorFju8uzUXufYP5IaopYYu47eghjUiXskErifYmqybbphGAutMcSHw
 REVgkPd1heDtGRNqBX/cCW9tN2RXr544zUQ3nfMRaOT82CJ7og5GU+amzhaFDMPRgnL8nINNS/g
 wtAXik/4kl0awbziI2kjWL+bMPSOt3pX6w4+M7BYdgFlBGP8qsljNKRH5KM66ms87awc2LzRw5l
 +mhwS1a6pE1z3/I7+Kpyi4rDBYaReduu3tFIZQ==
X-Google-Smtp-Source: AGHT+IEk67H5bYkDXGS4uZKEIqHTfTPFZsnkpBSruN975BZLsVgGIBlg4lMLCFyrlx9FhbnwTwE0lg==
X-Received: by 2002:a17:906:7953:b0:aa6:8676:3b3d with SMTP id
 a640c23a62f3a-aab779b051amr189403966b.29.1734075640721; 
 Thu, 12 Dec 2024 23:40:40 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6590f5457sm879362166b.195.2024.12.12.23.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 23:40:39 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 08:40:31 +0100
Message-Id: <20241213074031.2674579-3-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213074031.2674579-1-yegorslists@googlemail.com>
References: <20241213074031.2674579-1-yegorslists@googlemail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1734075641; x=1734680441; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CiolPgeSJS8+fHaEwd3sAtfVszhN75mmyHVGEqHKGwI=;
 b=IH3iQWKojEffemppyoQlNTG+TFSePCnxDFWJ7S34ctYqFP3RwOG6ZLR5CGZJshaOqF
 iYJ5Bu0GnRKqrcDGLB2QSbyqC/FenqcpEKgJrqUQPEUrz18Cnw44p5A6u0LbkRv7rrrG
 +e0iPIlvW0ehEQqzA5VCpuwz0ZAh7DgO+5bSr4pvkWREvmVZNAzHiEqTHLNWl/MmQJkL
 fL4keLYH/WXwW9/+RpBJCWHlDoCqiU9FmdJg/mhxG3wHSz0T9+NqLBdbpQWBw7jUKSIg
 lVm8Z+Za+1A77W/Nz53pCv+LpQqiSLjlC7CGsPsVZzwdSTZQYRU9mYVRmEEQwdzDOlTE
 +1uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IH3iQWKo
Subject: [Buildroot] [PATCH 3/3] package/python-daemon: bump to version 3.1.2
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Change PYTHON_DAEMON_SOURCE as package's download name has changed
from python-daemon to python_daemon.

Fixes:
https://autobuild.buildroot.org/results/be73c9a41b3ad3dea8a924ab98f6fe804e6808fa/
https://autobuild.buildroot.org/results/4cb684c6e8758b728d54ea367d1f279b2065bd83/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-daemon/python-daemon.hash | 4 ++--
 package/python-daemon/python-daemon.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-daemon/python-daemon.hash b/package/python-daemon/python-daemon.hash
index 695b8fb9b3..f2834279ce 100644
--- a/package/python-daemon/python-daemon.hash
+++ b/package/python-daemon/python-daemon.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/python-daemon/json
-md5  4c369b8c6d3de956d8f9dfb2c872c284  python-daemon-3.0.1.tar.gz
-sha256  6c57452372f7eaff40934a1c03ad1826bf5e793558e87fef49131e6464b4dae5  python-daemon-3.0.1.tar.gz
+md5  d42ee28735506ea1cb51c348530d6d94  python_daemon-3.1.2.tar.gz
+sha256  f7b04335adc473de877f5117e26d5f1142f4c9f7cd765408f0877757be5afbf4  python_daemon-3.1.2.tar.gz
 # Locally computed sha256
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.ASF-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL-3
diff --git a/package/python-daemon/python-daemon.mk b/package/python-daemon/python-daemon.mk
index f4d4205a31..ef380bfe3b 100644
--- a/package/python-daemon/python-daemon.mk
+++ b/package/python-daemon/python-daemon.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_DAEMON_VERSION = 3.0.1
-PYTHON_DAEMON_SITE = https://files.pythonhosted.org/packages/84/50/97b81327fccbb70eb99f3c95bd05a0c9d7f13fb3f4cfd975885110d1205a
+PYTHON_DAEMON_VERSION = 3.1.2
+PYTHON_DAEMON_SOURCE = python_daemon-$(PYTHON_DAEMON_VERSION).tar.gz
+PYTHON_DAEMON_SITE = https://files.pythonhosted.org/packages/3d/37/4f10e37bdabc058a32989da2daf29e57dc59dbc5395497f3d36d5f5e2694
 PYTHON_DAEMON_LICENSE = Apache-2.0 (library), GPL-3.0+ (test, build)
 PYTHON_DAEMON_LICENSE_FILES = LICENSE.ASF-2 LICENSE.GPL-3
 PYTHON_DAEMON_SETUP_TYPE = setuptools
-PYTHON_DAEMON_DEPENDENCIES = host-python-docutils
+PYTHON_DAEMON_DEPENDENCIES = host-python-changelog-chug host-python-docutils
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
