Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42943C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:59:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A98F61090
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A98F61090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00B3A606A9;
	Thu, 14 Oct 2021 22:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uAKBGOErxE2J; Thu, 14 Oct 2021 22:59:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50C956067F;
	Thu, 14 Oct 2021 22:59:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2192F1BF37B
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 119C840589
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZiA7qrrYeWaL for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:58:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A0C540581
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:58:56 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id o133so6742248pfg.7
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 15:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=En0KmrppT23qEN37qHwykE7axgiUxNg1oAtpbvcPvas=;
 b=OpnlpPfgKQFkDTzFf1XkH2XRNISJyPiSUZy0m33xmpldC9vq77RuUq74dS4FMO4O7z
 dwGQExSmQW5js+mjiUgQwnQzpd0GerOjJpi9kLePbjANfPV0zpAWnsxKD8owxA/jAnVt
 7OiyxeYzZbdxpzGu3pzJLPEzN48jK1YBUGZfydJ3w9axPBsa8qQ2KM0iyzf4J5RjIZ9P
 ON43el31ItgwU28Qu0xfudPBwrMMCADUTKD9/Qrxl7+PE4wA2dU0J0iuqAxeAjaIw8Mx
 ZOEzey2zboTXJtLqJv0cqpK+hIhLYrIwlytJ8yA4TajajM3VvPxuhkeEZgShNWUs+2Kn
 BDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=En0KmrppT23qEN37qHwykE7axgiUxNg1oAtpbvcPvas=;
 b=wDqikxhcoJmf8R0YIkH3t4nvsTczlctzwuQIH/aRiiys+kwWUBCewcSJve5marW8NK
 HdDwlTRfxD7MRzL8NMDADdtUf71b8+yOYbnv8PX19ra0AG5PeTEtNrzLbDsFRrQmfCVi
 OJvnEQli6jHP1u3qKixSIuEvqtKw4Dz58QD0Rx4rrv3kyxkcVvj+ruq0a9A+ADsUTl2N
 sqXFfzeBU1+LAiX2QYSJGAwnqvIY45O4Drn4fjoIGscd7HCHeg685sWyly1SqQ6qwxOq
 +b/6WKg2xNp7d6Bwe3GWkpWHnIyIiY2CQ1bBvA+SWjfdaXeQlzw7zTcVkmF8CznU/m9G
 306A==
X-Gm-Message-State: AOAM530HHr6ZCjBMOCpmpKTu04cBslFd2jINOqrQOLQ269nsAgUUtSnt
 fiW7AvP/Qs6aHL4W6N9xnyjOMwCCOd8=
X-Google-Smtp-Source: ABdhPJzh8IYlgZDB6Vj+Rf/4kPuNxoPS/ptqqovuzrPDa67KBDDGKuBgj4QoVcwoxbp2kCQXqmu4iQ==
X-Received: by 2002:a05:6a00:248a:b0:44c:ecc5:a165 with SMTP id
 c10-20020a056a00248a00b0044cecc5a165mr7649561pfv.43.1634252335641; 
 Thu, 14 Oct 2021 15:58:55 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id w19sm10171319pjy.9.2021.10.14.15.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:58:55 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 15:58:42 -0700
Message-Id: <20211014225849.832479-5-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014225849.832479-1-aduskett@gmail.com>
References: <20211014225849.832479-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 04/11] package/python-watchdog: bump to
 version 2.1.6
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
 package/python-watchdog/python-watchdog.hash | 11 +++++------
 package/python-watchdog/python-watchdog.mk   |  4 ++--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 701c7991a5..3b633f9156 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,7 +1,6 @@
-# md5, sha256 from https://pypi.python.org/pypi/watchdog/json
-md5	7cdc103f607e72fc32c206301a72d1b2  watchdog-0.9.0.tar.gz
-sha256	965f658d0732de3188211932aeb0bb457587f04f63ab4c1e33eab878e9de961d  watchdog-0.9.0.tar.gz
-
-# Hash for license files
-sha256  14e636faf5889138a1bb7a8498ccbb0266aee31d2dc475201a10448e56ed3d96  COPYING
+# md5, sha256 from https://pypi.org/pypi/watchdog/json
+md5  6aac660b0f3358c63658806a0579b832  watchdog-2.1.6.tar.gz
+sha256  a36e75df6c767cbf46f61a91c70b3ba71811dfa0aca4a324d9407a06a8b7a2e7  watchdog-2.1.6.tar.gz
+# Locally computed sha256 checksums
+sha256  02c8760f988a76e92a9d6cb525456a86f7b0fd1953870dd491de5955cb974d41  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 44929a65ac..2dafef97e1 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 0.9.0
+PYTHON_WATCHDOG_VERSION = 2.1.6
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://pypi.python.org/packages/bb/e3/5a55d48a29300160779f0a0d2776d17c1b762a2039b36de528b093b87d5b
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/e8/a8/fc4edd7d768361b00ea850e5310211d157df6b5a1db6148dd434e787d898
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
