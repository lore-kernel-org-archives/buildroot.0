Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B33DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:58:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D66C560F5A
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D66C560F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B9240570;
	Sat,  9 Oct 2021 20:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5l1Omovsr1y; Sat,  9 Oct 2021 20:58:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E5304056B;
	Sat,  9 Oct 2021 20:58:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63A971BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 540B9826BF
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9WrWWCZ91kn for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 829E78239A
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:45 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id e7so6797352pgk.2
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n+duvzd4dIUxZf0lRnqWRmv55MkiANQk+NTep1hcex0=;
 b=msoSTUist5IDCidBG4RUcT2S3S1bG7ELt5+vrF7LtY9zgWKzH0Tee/KeEGoDiMJ584
 bLTqw9whRyGsyvcmquYOTJvsp64juFgWoGxl3dJvOQm8im4twaETxJ/KaVcujjeXCiQ0
 5KSO2GWc9L0Ig9RWq3q+cspmkB0pq/O1/DOb1Y8hV7FpnIGZkEKL3MULHPHaP+yIsrVq
 JDOvQfHlbYfZivHd2TU7xy9mGgQn/K8Q1n9zPUcPV2GCMykA9cLAyhsyjT9Zmim196QU
 F6U9E4ALlFdx6co9dbNqlQCNeztBYei71ETcPCwOnWW1/Y29F1vU/I79lItVY3f/pblc
 xOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n+duvzd4dIUxZf0lRnqWRmv55MkiANQk+NTep1hcex0=;
 b=wueXCmrNKHoriyUq43QJZbgKpunX9op3OG6hIg5/HpZ1guwFu+03RrnDgJZdBXci3t
 x+vg0t6Cb2uHxb8pBXNN/ukgB44FdMvGPoBA1qZrJgxG12J96wbgmoCMle45j+ry1v3P
 ZCIJB1JRKlviQuGtgClnUqDQY9d866KktCAttKpuMU6Q6U2zDbB86WH6KP5On18K7Blo
 dC8tTgsCWPtCpUkUb3f0tHWVKcz/p0apaAzC1ePAcA/v2yGxqvl5jaBBBC6W+Jeg3/BU
 bCVXTAffc+wxWnrV6FhvcpBDS2fsRA/5mYKtui64x6s0aA1PXDt/SPO76Mp3KGV+N1eI
 Tqqw==
X-Gm-Message-State: AOAM531so4gEaHKywdufGUZymdvZk9V1rvPcI/mVdVtOHcIzCQx4kKR4
 r7E8vIbDdI4t7w9oVJ7P8xK9AV7GpdXafw==
X-Google-Smtp-Source: ABdhPJxML8tSwzrnyoHOz9/jyHt4T4Ig6/6EpgMOLwxTXSPx1j7r2PuMAZlXGgb/ExIhnrgLi8Lh9Q==
X-Received: by 2002:a05:6a00:2449:b0:44c:2221:8c38 with SMTP id
 d9-20020a056a00244900b0044c22218c38mr17386253pfj.74.1633812944853; 
 Sat, 09 Oct 2021 13:55:44 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:44 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:20 -0700
Message-Id: <20211009205523.3137859-18-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 17/20] package/python-django-enumfields: bump to
 version 2.1.1
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
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
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
