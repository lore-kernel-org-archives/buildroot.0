Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73D5E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 15:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AED0B81E5D;
	Mon, 23 Dec 2024 15:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5PfC-3PP950; Mon, 23 Dec 2024 15:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB62F81E4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB62F81E4F;
	Mon, 23 Dec 2024 15:37:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8BCF757
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8A584126D
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWUTuk2QUaBh for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 15:37:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8BBAF40F4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BBAF40F4E
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BBAF40F4E
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:37:05 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-844ce213af6so157737939f.1
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:37:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734968224; x=1735573024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c5lZL3V8g0vWJ4oBDp8Le58nsMIJjLruVMTQN0lRz9k=;
 b=MrbNylwfe69ztFvzFgR6B11uhvJa/KbRtJl/bFIm4jF6xA6B4CG5W4CjsBewaNQ2xw
 ZYObjQ5BfO5rrgcFf3qfuChsZ7ktkI9u9iMsqNIyj8njPZ7Ig0w3pMdaD2CLG0XyWUY0
 PzOW5XGbByajZaKnAsI1ZxqmFo8NolSrClY9BRTEPqwZuthnUpvFK05QY+P4UYqfLEpM
 cqxsx3jmnxnuKULYeteoOllfbrKI2QGrm0l2Rz+pDA56HhtwLYNu76c2jCozEt1BcKbL
 PYsOIWXK/aic0mSMKfy1FxqHCYFdcJTO6iNxJEa9lvLfZChm0FDztdxY+qvsHDcN97+L
 gG5w==
X-Gm-Message-State: AOJu0YyCANmTMOJZJDWPln/P55fCB6bRSJzM7f/XzM0n29mGsaIP8/NU
 7uCjhtAZHd5eGcqkwM4E0lNXuUmouHKND0wZjtNIcuxgNTZct1Zjkvl2drhlhM0=
X-Gm-Gg: ASbGnctn3w5F5ausUMQKLAyyRMI7lXC47tklazSpsTdfCnQYRh/sIGLcLt1tOUYcan7
 Zg8GleXuxLmQRASO2ay6xG2/mcxtGwskQGAJiqZZ8UmKvLQu0nZ6qnhd2cQd9KaXXVkWwopOefY
 /XvhU76lBg0/hfEZdh6vYwKUd48ZIuMSsXm8Ed6DFUVDE6Dsv1E2srK5EZcDMx5lRKrvetloxFV
 Q+koth64Q5n4AuSmqwUBIKSYUWhSb604tv2pLFD1aL3jF4uPWhSHS9G0tO81ngcN6qhuDauyQt3
 AyTuAXq5TsQ05j+qhSK8s2B4uC0Fg0JxXw==
X-Google-Smtp-Source: AGHT+IHPYTnsy5+BLxA8MlY50ESv/q1qXtTic+ixgNbxRcvqaXU4BpqC6v4LTYcksEO0MEUq5zbqHg==
X-Received: by 2002:a05:6e02:2408:b0:3a7:8ee6:cd6e with SMTP id
 e9e14a558f8ab-3c2d26813eamr125440425ab.8.1734968223811; 
 Mon, 23 Dec 2024 07:37:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0e3f36333sm24307265ab.63.2024.12.23.07.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 07:37:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 08:37:01 -0700
Message-Id: <20241223153701.1838975-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734968224; x=1735573024; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c5lZL3V8g0vWJ4oBDp8Le58nsMIJjLruVMTQN0lRz9k=;
 b=NSYQQhNmClkFiZsEpnCEnTyWHJoNxfrvVOwBKDq73V6jNOSYoDpgYWyviQMknVFo14
 9558c32pT92uTSVdxUvPN2gk3rH4nP9GdXBX/MFgzD2BDC0CMTWxk5y66bdon6SnzqGU
 Vvg6FfTAsP7yasgwaTfFROhbPr0VombszIZhVPYGDU5qDJgM30RlseVkK9Gg+lQTk2v7
 WjirNUhB88p6G8qdH9pa0g5QAVzgkPVoI77uE8gLXAJEbzpMoGLZMT0BdnjIGPSR7wQa
 ODAbGvDsMtL7Tw3rrolvw41UZZNPE6la/TgyPsGvE6AkW2Cehs0mjAFHoHPdqryTb066
 GngA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NSYQQhNm
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.35.86
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index c274da5540..783a056312 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  ec76b10d3c22a3ff81420a3d443c3492  boto3-1.35.57.tar.gz
-sha256  db58348849a5af061f0f5ec9c3b699da5221ca83354059fdccb798e3ddb6b62a  boto3-1.35.57.tar.gz
+md5  5f616b5314958f132a674ee7e68608f2  boto3-1.35.86.tar.gz
+sha256  d61476fdd5a5388503b72c897083310d2329ce088593c4332b571a860be5d155  boto3-1.35.86.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index d0984f9f24..c8df598b46 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.35.57
+PYTHON_BOTO3_VERSION = 1.35.86
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/c5/73/fb880ce301129a7116ff47b1aab1ca7427c7d63a163676701abc168309eb
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/b7/23/0fe81184d4c3c4f640288dce790c705a76263c1aa688f684ef1dbe9d4f7d
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
