Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB1BE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88A48606D0;
	Sat, 11 Jan 2025 16:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFt7HxCCZP-0; Sat, 11 Jan 2025 16:29:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A204D60E0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A204D60E0A;
	Sat, 11 Jan 2025 16:29:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AAD58942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9925B8355F
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MClIso3I2XLi for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A8A7830AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A8A7830AB
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A8A7830AB
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:29:16 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-844eb33827eso97379839f.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736612955; x=1737217755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2XWNb7DLvJ46i89dR9q5XVk8Cs7yYgLKkPKNEL3GPF4=;
 b=G9+bm6vUkGYup/W7Fd7OY4Ve0OoQ1gTYWtUKGKiQS6JygD1WZxHPsG32jznlenriLz
 TBhOhWg35xMlzN6wE6/iDM5pSd1jM/9FIcxxNAUEr8WrqVhLOc68FO2zQCuyDdkFoowx
 j4Fq92pdmnEjPOM+tsmmUT6ACfOIJqJY6N8KrwtMf8GC6UU7C2pWxvxMiOd7pY3p69Qo
 aNAc08VsZg5sFnL/kAioR6moshhK2cY6NLboSTZ725fUGmSafOJedhbEsiu6MySSvqwu
 jb3h/Dwc+hYofI55uJlFx7uBg9s+uNZlEqQWVtYOOvAOv0Yw9fH9VTtTpFZBt4QUXErY
 AgPg==
X-Gm-Message-State: AOJu0YxBLkcQv+6ohK1+G8ZkPxFvhBUabrSfVrYlQnRm/0jr1Iax9AWg
 JHJfxrZInRquI79eMarDmFeDvOzJtTXVBz90H5aWIxE0HN70BxJ4CjP/xOQZYyU=
X-Gm-Gg: ASbGncvu3SRRgrJyAmjowKiG4MEDMaq4zPCSDlEfmAYiBm0KR1gMTuDj3mXl26OBYZq
 NDbcQpjIqi7CrK9IfNxf/dEek1WpmttS5lBpNyvcM7oq9xnL8/Ay8zASftN/ysV6QVUhVRHHINp
 8ivLpxR9Ar1iHk6C/eVea0Uz4fpTx0f9BAoabNFQ1KTjfhIhsxq0NjVAhNwhI73+O8VP58bjGKA
 eXZlZHhyPWMN/fwqdODX8X2iYYoz2xa92l4npmqyk1uk+c548pbv3HEJpphmxvsZAplXSnbquFT
 qjyHZWfjVTQwQHVvz1C5efeX2dXjHjY=
X-Google-Smtp-Source: AGHT+IHLo75WV76ndGnDo8BGn8aio3IPRHht5yy3TH3V2qmMEL1XloHFQKNfBwJs12uQgG5S17KJWw==
X-Received: by 2002:a05:6602:7211:b0:83e:5860:5189 with SMTP id
 ca18e2360f4ac-84ce018a2a1mr1195321439f.10.1736612955290; 
 Sat, 11 Jan 2025 08:29:15 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea2a29fc8csm937740173.128.2025.01.11.08.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:29:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 09:29:13 -0700
Message-Id: <20250111162913.2883216-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736612955; x=1737217755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2XWNb7DLvJ46i89dR9q5XVk8Cs7yYgLKkPKNEL3GPF4=;
 b=Txwof7qSoSM9dmIAkFHD4U0zUOSqwrMmmwjG0SwUW+CjScQHmks/YUB+uJP/zp4mNF
 9vIl34Ae1CUTBdJCzhU3KfgklXuvs4wa4mXblqoHhopdAACczfeddaT/gXoysu9iNdlT
 leKaRpcgFgkcBTeRZ56Br+h0bBBbbLf6OujK+2eCj5Pm20jdi+rY1hJkx5x51RvcHyKS
 VfSNCU+SJJKvMYtQoSv7QCuurrsh6M42XovCBqpaY2UjALgIrGY+f1HZRaUhBMDUExn+
 SHr7f/WQVTK+8OakjVA4r96CZJKVJILEutwtzRh3laXzDM6wko2ZVEi5w4SpBWtNIP88
 JWqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Txwof7qS
Subject: [Buildroot] [PATCH 1/1] package/python-pyusb: bump to version 1.3.1
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyusb/python-pyusb.hash | 4 ++--
 package/python-pyusb/python-pyusb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyusb/python-pyusb.hash b/package/python-pyusb/python-pyusb.hash
index f08b212b3e..286cb3e209 100644
--- a/package/python-pyusb/python-pyusb.hash
+++ b/package/python-pyusb/python-pyusb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyusb/json
-md5  880008dff32dac8f58076b4e534492d9  pyusb-1.2.1.tar.gz
-sha256  a4cc7404a203144754164b8b40994e2849fde1cfff06b08492f12fff9d9de7b9  pyusb-1.2.1.tar.gz
+md5  d510d4480f0c3b64bdd32ebdcf033133  pyusb-1.3.1.tar.gz
+sha256  3af070b607467c1c164f49d5b0caabe8ac78dbed9298d703a8dbf9df4052d17e  pyusb-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  03e39fdcee9c18f2f9d0c3500a993ddeac050695eb81070ea41347587c76a7fe  LICENSE
diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
index 2f4f9581b6..7f4c9724f2 100644
--- a/package/python-pyusb/python-pyusb.mk
+++ b/package/python-pyusb/python-pyusb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUSB_VERSION = 1.2.1
+PYTHON_PYUSB_VERSION = 1.3.1
 PYTHON_PYUSB_SOURCE = pyusb-$(PYTHON_PYUSB_VERSION).tar.gz
-PYTHON_PYUSB_SITE = https://files.pythonhosted.org/packages/d9/6e/433a5614132576289b8643fe598dd5d51b16e130fd591564be952e15bb45
+PYTHON_PYUSB_SITE = https://files.pythonhosted.org/packages/00/6b/ce3727395e52b7b76dfcf0c665e37d223b680b9becc60710d4bc08b7b7cb
 PYTHON_PYUSB_LICENSE = BSD-3-Clause
 PYTHON_PYUSB_LICENSE_FILES = LICENSE
 PYTHON_PYUSB_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
