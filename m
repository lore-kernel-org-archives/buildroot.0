Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFA1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 23:00:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ABD46101D
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 23:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3ABD46101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D4783267;
	Thu, 14 Oct 2021 23:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fNoRlsv_ZRIR; Thu, 14 Oct 2021 23:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7472683336;
	Thu, 14 Oct 2021 23:00:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 205521BF292
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F2C1606A9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TcgG_sq4Nwag for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:59:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49C736067A
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:59:01 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id l6so5159752plh.9
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 15:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n+duvzd4dIUxZf0lRnqWRmv55MkiANQk+NTep1hcex0=;
 b=kAVIqXcnxy49FZ7V+4zDCu1Fff8XijORbH7f1MFt4hRkEE/n21OAWwSbV5NbCbEVs8
 08RyHZoiv/LDoGtwGBELR9UvCwGyFSiRsHia2Nyq6ZdhTyaD5b164A7YExabbxN0Yam/
 Ul6CseG3qJ0/oPfWclx+OH9cnycs3/OZmNdN3rs5xTqAaPCae639aTRbTI68UYxwivLy
 +2tj0MdDGCLpVRGkRyy1PpWrQ+OcI0nQmVc86YwYU9al3LqTrIjaGUJ57kIdjtLqjQB/
 IbtaO76WajVkkpsABW42aa1laz6QuX9omjShZk5LV6vpeVVM7vrmr7WohBoREO09Ttxz
 s13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n+duvzd4dIUxZf0lRnqWRmv55MkiANQk+NTep1hcex0=;
 b=jNDf4EUtk0zk+OOreJFRmffCKpRw1B6230J9xx9BNCil7Gr8jqmg9/iBbuKjxlmYEu
 Y8EL86blsAPcrS7FybgSdDNCvDz1VylCwHFWBCO0T6KXL8532YuDtzauK80A6s05TGpN
 /kmfNHbDehf2MxHFSDQF3bmwPndoRr9g0oI4Jgn7ZQaAXfh/gQmZMW/Noj+EJU/zAXSg
 uFhfK0HSL9OA6bnqu8ept+voOXI/xQhH+4yd9fikclPWCJduCySIWEFDQM5Gf8z9CGrS
 VS0gGlDCamApFNvfD6QoKEp0EuD9CVZrN2lVlG+sQCoVIj5Q1FydXc+XXnWyZi9toqut
 aNew==
X-Gm-Message-State: AOAM531x+v9G5jnar6r4lzNafkhI7lQvgyQ4DK6ZlvehLU85oD3nVHpu
 hyA9YV4yEorczlh9TqElw1UB9Z2rpHc=
X-Google-Smtp-Source: ABdhPJx34QZvsWfc+Zbaiof1w39bRabw7s16Btb5iJxWI4p8n6cE8UIW+bGvFlAGSQZFCdL6jmTFOQ==
X-Received: by 2002:a17:90b:1b0b:: with SMTP id
 nu11mr9011073pjb.103.1634252340643; 
 Thu, 14 Oct 2021 15:59:00 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id w19sm10171319pjy.9.2021.10.14.15.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:59:00 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 15:58:47 -0700
Message-Id: <20211014225849.832479-10-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014225849.832479-1-aduskett@gmail.com>
References: <20211014225849.832479-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 09/11] package/python-django-enumfields: bump
 to version
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../python-django-enumfields/python-django-enumfields.hash  | 6 +++---
 .../python-django-enumfields/python-django-enumfields.mk    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-django-enumfields/python-django-enumfields.hash b/package/python-django-enumfields/python-django-enumfields.hash
index 84eb028e65..352fa8d907 100644
--- a/package/python-django-enumfields/python-django-enumfields.hash
+++ b/package/python-django-enumfields/python-django-enumfields.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django-enumfields/json
-md5	c9725a2c31ca2949d111815742335279  django-enumfields-1.0.0.tar.gz
-sha256	5b0e2dd5973337717ca6bd5a7d9e167e6ae01203c160d4761b88837c4678f219  django-enumfields-1.0.0.tar.gz
+md5	 e06bcaecd583ee40e30d556bfcbf0d66  django-enumfields-2.1.1.tar.gz
+sha256  f64841732a9c343f5071220e0abcf5f51c9472c06e3c33d7c6a7ec27b6087561  django-enumfields-2.1.1.tar.gz
 # Locally computed sha256 checksums
-sha256	5548de8c163dc57bd0a4f5772f1509f2c04f1390251c98ebf060c9d52a223f57  LICENSE
+sha256  75b9c8c2514f22d66070ffc975c4d3132de01e0cc7b3a9662731bcb46cd2a042  LICENSE
diff --git a/package/python-django-enumfields/python-django-enumfields.mk b/package/python-django-enumfields/python-django-enumfields.mk
index 0121bd1173..20abb5bf6a 100644
--- a/package/python-django-enumfields/python-django-enumfields.mk
+++ b/package/python-django-enumfields/python-django-enumfields.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_ENUMFIELDS_VERSION = 1.0.0
+PYTHON_DJANGO_ENUMFIELDS_VERSION = 2.1.1
 PYTHON_DJANGO_ENUMFIELDS_SOURCE = django-enumfields-$(PYTHON_DJANGO_ENUMFIELDS_VERSION).tar.gz
-PYTHON_DJANGO_ENUMFIELDS_SITE = https://files.pythonhosted.org/packages/b7/56/3f4e8d8ef6d5577a1b75b3cfae6dff819afd030e3a519a326ec7a7a0b74f
+PYTHON_DJANGO_ENUMFIELDS_SITE = https://files.pythonhosted.org/packages/24/a8/aaf2b5ddb697c9bcab53c32cfebe11e536502e07c30646b4756e7214b685
 PYTHON_DJANGO_ENUMFIELDS_SETUP_TYPE = setuptools
 PYTHON_DJANGO_ENUMFIELDS_LICENSE = MIT
 PYTHON_DJANGO_ENUMFIELDS_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
