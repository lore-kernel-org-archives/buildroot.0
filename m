Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACC8C6FD20
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 01:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0EEC4138D;
	Wed, 22 Mar 2023 01:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0EEC4138D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4WK4eoO6igsK; Wed, 22 Mar 2023 01:54:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C10408ED;
	Wed, 22 Mar 2023 01:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C10408ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAFDF1BF337
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94ED7408ED
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94ED7408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OsMGRKwJNiRb for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 01:54:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BC7C408EB
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BC7C408EB
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 01:54:03 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id d14so4958058ion.9
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 18:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679450042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lm443Lai4feSN/6+AkxUZNy0WwQxbHL1aCdC9xvwSmU=;
 b=ne9hTu2LQcq0f+T2JGZuRjrx5i4avqn5wkwH+wpTRSNz3JON51PQNBTpD5n4EE9nIi
 cf38yx03DvyoGM6O/itUBw+NqremjBDM/c9ZiiN30eR5Ku2C3ePdMf3fOUSsFHMxOLUY
 NGbDJTQE3uOY/d7YXonAm9604OtAnu8JSxNSTsrOyMOnkRPTaru0wUUfatrvZI/UCqgL
 EAz7f74V/IaU7o8Km3A5z2ejkvC2VXgviOH4NlJ1kznjcw18/myO0w71coegHDVMxb7t
 Rsg7dBoWdq5TKR1EXlFhs7UuiFxGaiwpsBF8LhiwtJdw3ZwLpwS47Njmke86GlbP1FN+
 ONLQ==
X-Gm-Message-State: AO0yUKVJnzu4lv4VROVm6tv9o+HBsQ1Q+SxlXlcGGRc3m1VhfQBpzwQS
 +NHCiz4FYsVjFBkyNZu63DJYsQKTYuPCMA==
X-Google-Smtp-Source: AK7set8SUYrva+tFleoIFoZMPsTlgikDtr/5qOjLSrE4Jew/xyoMRyZ8qtBJAkDJwE1a5LLyGW49Rg==
X-Received: by 2002:a5e:df01:0:b0:753:121f:72a8 with SMTP id
 f1-20020a5edf01000000b00753121f72a8mr3243453ioq.8.1679450042205; 
 Tue, 21 Mar 2023 18:54:02 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 ay24-20020a056638411800b00406633b7dddsm2589716jab.68.2023.03.21.18.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 18:54:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 19:54:00 -0600
Message-Id: <20230322015400.94485-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679450042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lm443Lai4feSN/6+AkxUZNy0WwQxbHL1aCdC9xvwSmU=;
 b=l/LwYPCHwgcJ5kctbgcI4dWDqkQte0cQSQCMftx2X4I4rHB1HwlXsRfPdjnOgKurxi
 zp5JZ5s427KWQM/gWBqWnVVlVWWzFsYmtb04g/GNH1nNu5x89d0MY/2k3gJOr0VAcRl4
 nBSGjwlmaizOqYGKaURH+KUsBWzEYq21iXtOD1vdNE6DLrmh0NbnDzgfIv8x4y9mR0RD
 2Tf5Sm3gsqP1R3zSe4qwMW+FD5ilU5TS8rRJ4ZrdqG/zlXtzEIwEpQ8b6Hf7Qa04/IKO
 Zor/3vrDKuhKxLzW8alFr4y9TWLXBRnGI+OstFBI1AlBwi1PrAOZMUHEq4p4gTS/eMoC
 IN3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l/LwYPCH
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.26.96
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
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
index eecc87ab2d..6b3947978e 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  e3777333a201a2511dd7c814782fe9f0  boto3-1.26.45.tar.gz
-sha256  cc7f652df93e1ce818413fd82ffd645d4f92a64fec67c72946212d3750eaa80f  boto3-1.26.45.tar.gz
+md5  0913e2ad8eb208bccb826b10c92ccb5c  boto3-1.26.96.tar.gz
+sha256  7017102c58b9984749bef3b9f476940593c311504354b9ee9dd7bb0b4657a77d  boto3-1.26.96.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 4d8fe58701..572954e81a 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.26.45
+PYTHON_BOTO3_VERSION = 1.26.96
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/f5/5d/62bfcda02d90699d41d5ff2573f88b5555354fb87308e8a3427fef3956c5
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/c2/9b/8e9124c3d0306ab2ee865e6adffcfcb0127bf0c327386d62d2c9db19b6ae
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
