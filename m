Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22014C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 18:05:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E93261175
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 18:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E93261175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 208F0607EB;
	Thu,  7 Oct 2021 18:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hgbegN7c_yOK; Thu,  7 Oct 2021 18:05:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B1AA60807;
	Thu,  7 Oct 2021 18:05:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8230F1BF870
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 18:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7163640A59
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 18:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7PdIMzbf3q_n for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 18:05:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1B8A40A31
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 18:05:23 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id p68so7762160iof.6
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 11:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lQ53qD48FHHHHOtQG19CMfzc9rhOkp+LXLnDQtYGJVY=;
 b=kbNk3pFtwudtyKYaP7DNMlHHp8cFSwMmCHIzQeCy2eNi+prEeexLkVypYH7bd5zbkI
 o8C6/4z67Y9FpG3GdTfSBuTKH1rb/Ta9fXreL95PfIW+KYEpVXBH4W9ZcM7c5zRLITGO
 cOL2Q8wbxwe1ImjdHM79ExK/y3/67G57utbDPKp41r8ZPRcIB6ka5L/NngOiYW8KwJ08
 f7J64Qul56Sol6vOHaKEJ2sMmqav8Ox5hESp6PDFgbdcoG1zBBjY54CPsEDOjwZOy1vQ
 xwPg1o8N8rcyP5RPwnTOEr5+zymN7adCHGegcKBTBj+y3GTA3yX+3j0BiaGqhMbOt5ts
 2KgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lQ53qD48FHHHHOtQG19CMfzc9rhOkp+LXLnDQtYGJVY=;
 b=oKwWlJiX5Sv8PF9rzi7OnoDvxML0lHkwJ8bEekICgR9e/mHKfq7YhIPim0ebUJSeP8
 8rKpT/S5mOkJ9d/fefACRnrqnag2my6IjqJAC47LTlUL5w3I5zEyhE2XGbY+Zk4UEuVT
 1aQr4yeKyXL6U4W6jFk1GdpahvDy7gPa3gSsvLh2CsUOYqX/gKnYnzz15zQ0ppKBjQfO
 YLOjDlvcuJjzKDD5kYZzgzpAnIhnJGnBbji1snZMi3iQMtnXnJD9dxhuZZJYfUGC2jSh
 9wYjSxp4g926vQ0cPQwK+tYhlYtXKC5GzcmlvgaGOfiS6FTifO6d6DXhL/5oTGv4ZanN
 qQGg==
X-Gm-Message-State: AOAM5324s0PQIKhIruaA7w2wDs4zlIhASmCNwp6a9J1xRxAWXZji8Rm5
 b4nQZ0CV85wkInqdtrDQvvSEEOTOvB8=
X-Google-Smtp-Source: ABdhPJy6dTm/tSFxtLmWlZCa+IXznAZw/pXXdvunFTUuh5JEuOfZCnTItBo/WWwcMe2c4Qf6RkVHWg==
X-Received: by 2002:a5d:9813:: with SMTP id a19mr4249348iol.74.1633629922647; 
 Thu, 07 Oct 2021 11:05:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id v17sm25648ilh.67.2021.10.07.11.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 11:05:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 12:05:20 -0600
Message-Id: <20211007180520.3237005-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-serial-asyncio: bump to
 version 0.6
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash change due to date update:
https://github.com/pyserial/pyserial-asyncio/commit/0fbea23c7b445e6bbb7491511b3064fd5793ca0a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-serial-asyncio/python-serial-asyncio.hash | 6 +++---
 package/python-serial-asyncio/python-serial-asyncio.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-serial-asyncio/python-serial-asyncio.hash b/package/python-serial-asyncio/python-serial-asyncio.hash
index f5d1d9e485..ccbdda89be 100644
--- a/package/python-serial-asyncio/python-serial-asyncio.hash
+++ b/package/python-serial-asyncio/python-serial-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyserial-asyncio/json
-md5  64d15bfb20982b2129b02070321f49f3  pyserial-asyncio-0.5.tar.gz
-sha256  1641e5433a866eeaf6464b3ab88b741e7a89dd8cd0f851b3343b15f425138d33  pyserial-asyncio-0.5.tar.gz
+md5  409f32a35a3b530e6b2224e2a5b367da  pyserial-asyncio-0.6.tar.gz
+sha256  b6032923e05e9d75ec17a5af9a98429c46d2839adfaf80604d52e0faacd7a32f  pyserial-asyncio-0.6.tar.gz
 # Locally computed sha256 checksums
-sha256  ebc84abdbdec7f9fa6962612c110123897db47b79529d5ae41191ef584b88f2c  LICENSE.txt
+sha256  64f3e548f0300d43c5af90b667150a9c57a4307c0f75fe741f76d0419905224a  LICENSE.txt
diff --git a/package/python-serial-asyncio/python-serial-asyncio.mk b/package/python-serial-asyncio/python-serial-asyncio.mk
index bc95f2c44a..6ee215a81c 100644
--- a/package/python-serial-asyncio/python-serial-asyncio.mk
+++ b/package/python-serial-asyncio/python-serial-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERIAL_ASYNCIO_VERSION = 0.5
+PYTHON_SERIAL_ASYNCIO_VERSION = 0.6
 PYTHON_SERIAL_ASYNCIO_SOURCE = pyserial-asyncio-$(PYTHON_SERIAL_ASYNCIO_VERSION).tar.gz
-PYTHON_SERIAL_ASYNCIO_SITE = https://files.pythonhosted.org/packages/e1/97/8dd1bf656796668ed4bd86058c815b130303a00a7b70cf79758e4918814a
+PYTHON_SERIAL_ASYNCIO_SITE = https://files.pythonhosted.org/packages/4a/9a/8477699dcbc1882ea51dcff4d3c25aa3f2063ed8f7d7a849fd8f610506b6
 PYTHON_SERIAL_ASYNCIO_LICENSE = BSD-3-Clause
 PYTHON_SERIAL_ASYNCIO_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_ASYNCIO_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
