Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139ADC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 15:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D237405E7;
	Sat, 10 Dec 2022 15:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D237405E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VojmhjnfuaOe; Sat, 10 Dec 2022 15:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 577164085C;
	Sat, 10 Dec 2022 15:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 577164085C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD4FC1BF5A4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 15:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A221180C10
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 15:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A221180C10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kBlyGWINcZ3i for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 15:49:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD4D680C0A
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD4D680C0A
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 15:49:28 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id n63so3610978iod.7
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 07:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mTJDMdK0Uk3666coqrvF59XH2J7BEmvVSFdDNn+Q8hs=;
 b=yQwo4rVfVKdVM0vYkZD6FBpxP3yhjCNmTZmVPBaT+wYEO2cFuKIyjzTB9uqEXIWrrZ
 xiFs3Q5U2HL08uOpEsCZRRNOByAZmmItCwppRojMZ4DYZk4ChDzR5+wbaBOVmS38aVNS
 43R0e4Zdaw/XhPwsdC5mIGVfB7it8ZMQqI1SnxZ3olPB9C4mPtPEm7TFUMDQIMCh/x1O
 kyGe9qeNr5q2JcSIzql0gZXaK/AX3Ezl7teRsa4qX5sY/njm0ZvTv8Pc6nufDQB+mobH
 HVtH5OszSdZyaFIqZq0afszKDBAkp+5VuWvp4lEjosuggGwv7NZaWa0Wip4q9j/wv/Zr
 wdeQ==
X-Gm-Message-State: ANoB5pnAtjijtei+AKhOC1FS1ITSa37JAcb41GR54kq66scLITu2zqVT
 8tyOl7ELXUYPKTTPpdj3OqQlFj2AW1pc2Q==
X-Google-Smtp-Source: AA0mqf44LbAIawKWI2IaBE1gMFngbjv2qD5aBKpk9h8QjTODGyyt9OZOdmLos8OButHFzXm+Q6zKiw==
X-Received: by 2002:a6b:3c12:0:b0:6d2:5d6b:d33a with SMTP id
 k18-20020a6b3c12000000b006d25d6bd33amr7987573iob.1.1670687367582; 
 Sat, 10 Dec 2022 07:49:27 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 v12-20020a02b08c000000b0038a33579cf1sm1507789jah.109.2022.12.10.07.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 07:49:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 08:49:19 -0700
Message-Id: <20221210154919.2385511-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mTJDMdK0Uk3666coqrvF59XH2J7BEmvVSFdDNn+Q8hs=;
 b=jC1+hF0JtjNnSkeTtGHGn+St+NH5+gVxdU4H9Y53ilGolYoEJ3BGfTtfn+iGZAV2Qn
 Lj2uDBlLcIMyVnOhKi8dbg3fh0GOCjO9fZnhG9w02z9pCZx3jdI+48J+diioJPH139k2
 6tJoQH/xzYIlVV9rhDWqMMZynHYmXpOLyTLrtV+fBms9toXwH4D87gRGergw/ZCHbIk0
 MG9a4WpQwl9eHkoZui0RRSi/3uNh6Qz9v/N6M48k7WcVrOzwHkPQ8riHkVWwgqR5P5pT
 9Lcr8bJTPzo2ZJl8GRTSjAyIcu3izVsgH4gT9JUMuQerB4fAdIHnBDPC/wESEkwCP0un
 7JiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jC1+hF0J
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.26.27
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
index 347acde9b2..60fd07681c 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  17f5f946d79da139fa9fd9b014fe0d99  boto3-1.26.0.tar.gz
-sha256  8f0e4eb5c26f927c09bc03302d38156af578b816f1e4f8ca4f0f734d134b9d4f  boto3-1.26.0.tar.gz
+md5  9d5447419233a259b3ade6fb86d86cb6  boto3-1.26.27.tar.gz
+sha256  255a7565226c21c5d500f69aabb977e1ac07dbaf576f4428d00558e8e508a23b  boto3-1.26.27.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 03dc32a08b..e40ac92f09 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.26.0
+PYTHON_BOTO3_VERSION = 1.26.27
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/77/18/91af4ff58b26d03af8bf8e0759c4087b77032bdc54199d750905080c669a
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/62/7b/7cdcb980d9d90c910a6abec2cdee0ff6aa7a3d8afea4044ffd968d5c107c
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
