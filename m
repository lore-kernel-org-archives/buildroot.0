Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A1BE6FE41
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5465C60640;
	Fri,  6 Sep 2024 18:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLDjzVMBkKDF; Fri,  6 Sep 2024 18:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54B2460657
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54B2460657;
	Fri,  6 Sep 2024 18:09:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D96F1BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC93C84110
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEws62zTsm0n for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:09:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01C2F8410F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01C2F8410F
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01C2F8410F
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:09:23 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-82a1b84e6e1so97716739f.3
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 11:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725646163; x=1726250963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UaADZRzQKk0xjhkUhdOS6t2AkjcVMkXkZ8KibIMAQ2Y=;
 b=AGEb8uS/72CBefh89b89NG09gCCiAxstBJqebbo8rgtZolTCgc7JzZvUIy4n1JuABb
 28HI0dCcHQ3v5v3dFYRZ7LleP8v3szTCiCCNljUgYAvJAJ27sxYi/6AyBY+9WZ9e1lK8
 jr2tw/A8Frasguns2ORQdchvm1qceAqgkyXJ8KmDFXjXAckyvs6Jq00STtNHdPHD8Wha
 uRat2yGOKsh5zkbogZayXCdHjs19r6WsEClaz8yhBsKtabaMiMw4FWmKsOfojSADJpDI
 mpWxulsiuayGn6Z1eDEhZggLudmSW0jb74vn7YBOrhlfGe8Vyif8xR/XaZZSuzs/pLFU
 Yv7w==
X-Gm-Message-State: AOJu0YyFgANRgI+yv9AH6tlOrEYpjRq65LrBIyNaJCltuU1pSDYsw8NB
 gUq0+6Rq0t6gTU90AoNQ5pd+SCMoozePQpA+QZS8hnU7qFH5ANiRuuNAVg==
X-Google-Smtp-Source: AGHT+IGaO0iYZlZE+A4Rpe4YfQ+PAhTKbEmRk7/Y0XSOIF7OjKNzoSnPpcsuMLM5QAjIwbOvEXJCVw==
X-Received: by 2002:a05:6602:2cc2:b0:7f9:1b3b:8465 with SMTP id
 ca18e2360f4ac-82a9621464cmr353301239f.11.1725646162622; 
 Fri, 06 Sep 2024 11:09:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ced2ee84c4sm4157920173.164.2024.09.06.11.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 11:09:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 12:09:19 -0600
Message-Id: <20240906180919.3987486-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725646163; x=1726250963; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UaADZRzQKk0xjhkUhdOS6t2AkjcVMkXkZ8KibIMAQ2Y=;
 b=X0rjrbSH6P5azRISiMIAwz16vVZEWDbidIfuMjSvK/zv1y1WDGx+u5k4OZPOomH45W
 KiS15JZY06uOV5Dt2toZJhphxC3ltS3rC0KOA1WT5ZaBlHHE8vKAm+zd0kFHWV2FTa11
 2yVJQcoZOtncQw7UHIB2lbd3N9G0qUBFpBbd42X0FK4al7+H2o/j0SNc+/nFiSWmqn9H
 edc4gOYY96XcXPcq88V6jikU2ms4Aikl+WV2HGEDeu1i+kxUM+j3iTx9OywDqVjofmHP
 bV6wTPUlzw3HwMvdy9ipBmnq0xt/PxZl3gN6qI2cnOZAtCa4u7tgI1SZ1358nq0T+dsj
 U/vA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=X0rjrbSH
Subject: [Buildroot] [PATCH 1/1] package/python-starlette: bump to version
 0.38.4
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
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index f04aaea7c0..b5ba43c061 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  b0ba8178dd4bf2cdff53c8702212be52  starlette-0.37.2.tar.gz
-sha256  9af890290133b79fc3db55474ade20f6220a364a0402e0b556e7cd5e1e093823  starlette-0.37.2.tar.gz
+md5  7861ee7609e649508792a4ece854406b  starlette-0.38.4.tar.gz
+sha256  53a7439060304a208fea17ed407e998f46da5e5d9b1addfea3040094512a6379  starlette-0.38.4.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index af2c2d4ac7..1a2b7532f7 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.37.2
+PYTHON_STARLETTE_VERSION = 0.38.4
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/61/b5/6bceb93ff20bd7ca36e6f7c540581abb18f53130fabb30ba526e26fd819b
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/b4/9c/d85721508122ae927aa7064e10a3f47f8dabcd4fd162222afcecd0d8d7b7
 PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
