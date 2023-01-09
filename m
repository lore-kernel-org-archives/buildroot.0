Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1AEC54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 04:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6288160B0C;
	Mon,  9 Jan 2023 04:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6288160B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0zNapE-ZXG0; Mon,  9 Jan 2023 04:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E91A60A9D;
	Mon,  9 Jan 2023 04:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E91A60A9D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9546D1BF357
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7772540289
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7772540289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRw4qrqAAzPy for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 04:31:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8179940142
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8179940142
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 04:31:09 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id u8so4411126ilg.0
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 20:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LAD5kWYhi+bE+31brdzhpvylC2SE0HfL74GHNU3EGrQ=;
 b=zetfOd4EHQnKbDh2U2dVG79uamQy0xVHpyhNMN9IsqGNw5cPZS6n+2H3wgf8EOnDRw
 6LLtz5Ku4y9guNE4M85qVCSgZQyB6lDlRNYa06l1vG1eXXIX8iDSXFHt6f4sgZLaOdGh
 uY61C32JYMO20xJF/uJ882oP9YM51SJ54YtNhjsX8Nf9+1lDhqQJL/p1oO/TRdmmUMfp
 9+OO0m29zzCaES3E7dPIZZM3Dwuv3bohtYlMX+BCY2U5H2QL31deFEDweeO5SIkvkAa+
 BK4XkyQ3FSyeGjeVXov3H5Zlpig5S1PrOIvc/pZPKEcTiHjyxZEMI+zx78KmDVVPufY+
 GDNg==
X-Gm-Message-State: AFqh2kqZ0pv/Oaw4Zbope+ABUl/ssNOTLizJTBCTYnRMgkn91bKgVPqy
 ZgsGxEBt8OjXtu2PTZAqScdUDSl+S40yv3rV
X-Google-Smtp-Source: AMrXdXsMMvC9PgSXOB+zrFvDYCAGshVkvi+zWITOCKNl8Hzz1P9H9XIe0vAYyvnwpDVFH+anM9HKPw==
X-Received: by 2002:a92:b708:0:b0:303:9e8d:8455 with SMTP id
 k8-20020a92b708000000b003039e8d8455mr41858023ili.7.1673238668367; 
 Sun, 08 Jan 2023 20:31:08 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 u189-20020a0223c6000000b0039e5bec206esm2428493jau.131.2023.01.08.20.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:31:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 21:31:06 -0700
Message-Id: <20230109043106.2360714-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LAD5kWYhi+bE+31brdzhpvylC2SE0HfL74GHNU3EGrQ=;
 b=Eebs07NEb1RYfnvLQQsXNiEOdOaY47nAHjTo7bOhNUJLN42+qvwZjmT40KSXhY8nJx
 c2ZSWBBK9M+S0l3+n1KUPwlrYgJTjYuLJSGq7x6xGHmHLnj5EJy5l2+7k97XR6DWGHpW
 YLFTeIpeOZyQFp4WEvVHAYImwvBRFgUlmSOcLZqnTIYYwj1G16v5RM+rz8IWwEASZ6OM
 H0G24HCurhT7rRHotd0A0XeKIY0Kv7sLhrdWqPaqhquTaH3mO1FqduLXWpubn4qAAjna
 zCk6gnJO1Hm0HxOQV+BxyZeqXcfVlq+PiecHgEsBEZsSb8QTmpnNnWmD2JgTl7Gavlp1
 bA8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Eebs07NE
Subject: [Buildroot] [PATCH 1/1] package/python-keyring: bump to version
 23.13.1
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-keyring/python-keyring.hash | 4 ++--
 package/python-keyring/python-keyring.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index 791ee6563b..837743f5c2 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  edf0645c28f16884e2b121b2c51e0770  keyring-23.11.0.tar.gz
-sha256  ad192263e2cdd5f12875dedc2da13534359a7e760e77f8d04b50968a821c2361  keyring-23.11.0.tar.gz
+md5  a0640ab7525b4fe58061b5999cca5026  keyring-23.13.1.tar.gz
+sha256  ba2e15a9b35e21908d0aaf4e0a47acc52d6ae33444df0da2b49d41a46ef6d678  keyring-23.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index c1f124cb3e..766139f525 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 23.11.0
+PYTHON_KEYRING_VERSION = 23.13.1
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/1c/35/c22960f14f5e17384296b2f09da259f8b5244fb3831eccec71cf948a49c6
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/55/fe/282f4c205add8e8bb3a1635cbbac59d6def2e0891b145aa553a0e40dd2d0
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
