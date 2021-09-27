Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D1AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:52:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C7260FD7
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46C7260FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E775140276;
	Mon, 27 Sep 2021 19:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9OpQfH22D8H; Mon, 27 Sep 2021 19:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E5EB40261;
	Mon, 27 Sep 2021 19:52:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6E241BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C360060ABD
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bKl2C_dLe3BK for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:51:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD76560AC1
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:51:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so1621431wmi.5
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AloUPttiSamrE22jQssIjNv4+hB8wKdHEiLYm12mIls=;
 b=FacmucV+GzmdIuFy2hYEWhaW3kZCXe6Ygfnn8o5brLW/99rgpu5sHSVnhJke+rf0GS
 9VbbfD2sDVgpNpYgKmnD6gCRcnuKJwVKhJl/VamIFbPZjsbTwAbqfZMDyuc2OdoqUf2N
 U0Fg1o6U6OrfomlrdaeN2K9kLZFztrtlrE5/DpVDVLVnHsJQ1o41PrD2KXP6Q0/Wb4O5
 9KY9bxwEgWWsPwXRbtIZU+9j+gG5mCxw+zDQV04IQXpNl7pK4q3KCVOYJdqKzOTwJKWb
 kEpKpoXuDef1zyp1lwLf5GGUXeS0HSmGCt8Pukkr/OaI4jrU6Feh/EUMqF3MoOyHM4LX
 73Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AloUPttiSamrE22jQssIjNv4+hB8wKdHEiLYm12mIls=;
 b=roRXiJKYFCI60ueflyfgHVxmXojnpVnv98KRN/US5X4RRgHqWrQgAcX+ZlWlndvtau
 7PIzcNLh9Ase0bMgExuovAJVFXbyWelEKfkkQIRV5dAq4piIFV+YwJGYcZc3vCgMvaru
 KA3Z7c3rueCONz5Ac0RDG3NZi6+auy/RkauCUHk29i5b6Dz0Htse45Tb7f1i8/VEnV4Z
 wcFYZwXzNO+7WmaYgpvMbjGVzaYr0r4HgwIkOgBxWF7CFKnNGZlUNrmXKTNqJnSXfd+l
 Eqf5cJTbLgYRouIOMsmSDrXlFdjuMGfSXqiXxv4NLurrT+qnZJa6W3qWWIz/GRi3y3MZ
 0+0w==
X-Gm-Message-State: AOAM532TVQmEbIhSsYGorK0Kzs3RqPahEIfdiefUbc+QYo0lKT1ZAbkV
 NgDZN9gExwXr26Mvu0DsyQI6EWPWO7c=
X-Google-Smtp-Source: ABdhPJyD89MabKSiu5Kake8+TMHnovalYzTS0pTkGOSWIc/NG5hoVCBwgv6yYRb26ytNLfjTkmYawg==
X-Received: by 2002:a1c:f703:: with SMTP id v3mr828912wmh.177.1632772305978;
 Mon, 27 Sep 2021 12:51:45 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:fc32:81cf:8e3a:84a0])
 by smtp.gmail.com with ESMTPSA id w23sm485359wmi.6.2021.09.27.12.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:51:45 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:51:27 +0300
Message-Id: <20210927195136.549542-3-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927195136.549542-1-asafka7@gmail.com>
References: <20210927195136.549542-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.18.48
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package doesn't support python2 anymore.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-boto3/Config.in         | 1 +
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/Config.in b/package/python-boto3/Config.in
index 67b1420388..1cb1ebfd12 100644
--- a/package/python-boto3/Config.in
+++ b/package/python-boto3/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BOTO3
 	bool "python-boto3"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_BOTOCORE # runtime
 	select BR2_PACKAGE_PYTHON_JMESPATH # runtime
 	select BR2_PACKAGE_PYTHON_S3TRANSFER # runtime
diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 6752a2cca0..e4d924e786 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  8cecdbf7ef6702837d7ddabaa3e39a89  boto3-1.16.50.tar.gz
-sha256  4d502a842b81fdac4b950d3b88a5b9067ce118213b122b20f4192003cb067986  boto3-1.16.50.tar.gz
+md5  0f37b054b9c14fe05a8194f85b122918  boto3-1.18.48.tar.gz
+sha256  7b45b224442c479de4bc6e6e9cb0557b642fc7a77edc8702e393ccaa2e0aa128  boto3-1.18.48.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index a5c2b6ab31..d1e01de855 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.16.50
+PYTHON_BOTO3_VERSION = 1.18.48
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/c8/c6/b4d9547a493ac2837f296f4a004dff6e7136cf6750d181769b8a61d63813
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/d4/1e/7d6bf1b92199121ec5c020868402b90ba1a4fef6941aafaff970a664d83a
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
