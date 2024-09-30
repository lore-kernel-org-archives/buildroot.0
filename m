Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FC1CEB2CB
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 23:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 862D280E11;
	Mon, 30 Sep 2024 23:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqK8lUVMKncV; Mon, 30 Sep 2024 23:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB2D80E17
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EB2D80E17;
	Mon, 30 Sep 2024 23:00:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DA3D1BF34F
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 23:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3938C402E6
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 23:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdofjP8g2d9m for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 23:00:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FCBF402DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FCBF402DB
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FCBF402DB
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 23:00:18 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83255877364so294423239f.1
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 16:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727737218; x=1728342018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BoS5MrbXz1cq9qv3phW9zRTI/Zk+CHnz2S7xYUxKV6s=;
 b=DpboCjgqeF8JpTzYIFdnIhgoLUACYDaNVwuCDYVnxF+DILUt1P8XeE1Fx6pzql27AS
 HFP1DRdqt6+b3hOsMmfOr+EVdZBwBwsQ8vsm/LZRk8y44BdArU7JpLfZU37enDVDCHuY
 FRsziFI8D1K2mmYJ9neXcnc2t4oxVsGPE8TN/Xk1TDI+laIQGJFO9DyszNO4YBU0mkca
 yXDiYTwKnZd0ALW1NZsqK35m0OVwsU9sYm5PUtvh5hc72Sx2kzALQ4YuHOLoAR9PZd4p
 BJdJ9fO//IXeM8X8uV1Z2Daz2X75WhX8DqCYdInKsQnVX0gh+bRpTQyWRBKkfzC1eSdc
 8KgA==
X-Gm-Message-State: AOJu0YzpF3tmVcB+zSIju7JPNsD2RxFbmpaGy0bkJq4vHkHlyOwN4uim
 oAcfDByzbEsbazWJJcy1vgd2opfxOdmpTAmd/tg+P5vOzh1VCTsTOz6Jjg==
X-Google-Smtp-Source: AGHT+IFL0+6awJkUKCiYcZhTEeGskg+Mi1AUxmw8o3FlC2cujW6K4WZwD9VQRf+Irc7fjyCma1Z0/A==
X-Received: by 2002:a05:6602:3425:b0:82a:a693:2736 with SMTP id
 ca18e2360f4ac-834931d1801mr1017144939f.9.1727737217606; 
 Mon, 30 Sep 2024 16:00:17 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-834936f67d3sm248561739f.33.2024.09.30.16.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 16:00:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Sep 2024 17:00:15 -0600
Message-Id: <20240930230015.1210276-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727737218; x=1728342018; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BoS5MrbXz1cq9qv3phW9zRTI/Zk+CHnz2S7xYUxKV6s=;
 b=Zd6+EYTKHlEOtOxNnMLfpomo966AGsgtc6pqYdgfePPb/Szt3OUJ8kZ8yzZMpEBul4
 my/bzPILWj7ueoCzOV8stnfo6UzDdd2MVqDTveVYcEod9NyruphXFrkKxckbpHAq27Ss
 szFI/GwvFrf50Wk28FT7J55rKgU4oRQk8VGEIDZEp/6rNEddpw+FdjOCvH1nz0yoYBy6
 HV6VTlLFFLFDjHqKwSc/o8Cf+t/Z483eoKEhzHxpW7ULwKIefClvnfnwgUVApI/iEhFQ
 MS690OLJnWLolkwsZsQOJvMfygjf+hbavA5V7hnfVRdQSp3zL6JpV5El+ORCqDpYVzoU
 LMAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zd6+EYTK
Subject: [Buildroot] [PATCH 1/1] package/python-pysmb: bump to version 1.2.10
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
 package/python-pysmb/python-pysmb.hash | 2 +-
 package/python-pysmb/python-pysmb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pysmb/python-pysmb.hash b/package/python-pysmb/python-pysmb.hash
index 87b1edf595..cc4f553106 100644
--- a/package/python-pysmb/python-pysmb.hash
+++ b/package/python-pysmb/python-pysmb.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  30558c11ba141e9ad26e5edb1b85b94813a335ed5c0fe11df8046942b0c7e813  pysmb-1.2.9.tar.gz
+sha256  a3897153177d4a88bd4086ed07890f0b4d1d8d1c99866392edc2ce744ce9c3f1  pysmb-1.2.10.tar.gz
 sha256  8c487d5c10f024e44a9cf1df21d1fd28a80bd2dfddd9f1dcd109a47d721f497f  LICENSE
diff --git a/package/python-pysmb/python-pysmb.mk b/package/python-pysmb/python-pysmb.mk
index 394a9d806c..b4d010e1b0 100644
--- a/package/python-pysmb/python-pysmb.mk
+++ b/package/python-pysmb/python-pysmb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYSMB_VERSION = 1.2.9
+PYTHON_PYSMB_VERSION = 1.2.10
 PYTHON_PYSMB_SOURCE = pysmb-$(PYTHON_PYSMB_VERSION).tar.gz
 PYTHON_PYSMB_SITE = https://miketeo.net/files/Projects/pysmb
 PYTHON_PYSMB_LICENSE = Libpng
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
