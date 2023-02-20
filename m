Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3B0C636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 13:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6631640133;
	Mon, 20 Feb 2023 13:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6631640133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YXO_QXYHX64w; Mon, 20 Feb 2023 13:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88AE340591;
	Mon, 20 Feb 2023 13:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88AE340591
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 417A01BF3A8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 13:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A95760E19
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 13:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A95760E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8RCvu4k7Zv0 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 13:15:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E175560E4C
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E175560E4C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 13:15:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t15so1276532wrz.7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 05:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qpeTOku2KugoSLZDfVeeu0txOmaKYhcZkQvGA+5pqK0=;
 b=vR2x+m6LyOTMRXcxjechiKc80wogX8Bdx0erPLpCejJL8uBV9m1X0k7EA7i+CFG9T4
 TI7BYukUoWF1Ff0S3Kkalvi8BrxmnP4/XvIR6B/cFe7u7nyYV+Q8fIvPbCX3ZyRSIqqL
 9X9utboxHxYoQvVBu5qP+Av2E/JCWKh101LUNuzvUqdke1NhVv1lTdoB/18vK9+041W8
 4Q1d3ipHsdNYD+p5PZE6jvSgCOVGFP7WgZmhe97EJhdT6F6Nk3Wdvvh88BV5WVIMa/Zn
 3t9VAUSBweW82BKmLRG0xjIxTm1APD+Ni50CYBRqMwX273/Hb4HMC4c1B6FrRXBBNbOs
 QJ9g==
X-Gm-Message-State: AO0yUKUs4jHHJ2x6558ClAi+MkNXBaYhQ1rX/p3AZHQc5BCiuOf9hH5B
 QuPSTmOn1g0haBNBf+fV25486xTX5NU=
X-Google-Smtp-Source: AK7set+IxA5a00KKQEEBsoTTF33obIaBiUF54UyeIQOEBFqewInFP+E7/BKMVlUeITARIZa5HpaeUg==
X-Received: by 2002:a5d:4e49:0:b0:2c3:e4f5:18c with SMTP id
 r9-20020a5d4e49000000b002c3e4f5018cmr934342wrt.30.1676898930751; 
 Mon, 20 Feb 2023 05:15:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e4-20020a5d5004000000b002c5706f7c6dsm12137907wrt.94.2023.02.20.05.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 05:15:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 14:15:25 +0100
Message-Id: <20230220131525.1783413-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qpeTOku2KugoSLZDfVeeu0txOmaKYhcZkQvGA+5pqK0=;
 b=F5PKnEEnxAKajb8N7p8BXapih7qqn/29ylXsG872wxR11lU2adQ/baxDMfvMwt0nub
 y+YeRZExu+J5+GHJ/4YQKOlhEqC2Ff8iBe1iAqwEKD+3aa41d9dP91LQwyjMOKVZ0RLM
 lBzQzdyC/vOB/IHgJIHDcm2wHNzeFdChU85O12cFnZJTJlv0KP5nvdRm8ru4KHterFAC
 MXiO/nxfVMuOnIFpY/huBva9Y4cCRwJbmrsXVwSC3ANS8bj41ZnmpKN7wHbV7ONmn+oo
 arKbof72cAnUcVZ+KVbwCLq873VNHEwnsLN/dZ/9vW9UcK7W74tCX7PLdkSf+zcDLKDu
 QDTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F5PKnEEn
Subject: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 version 4.1.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-23969 and CVE-2023-24580

https://docs.djangoproject.com/en/dev/releases/4.1.6
https://docs.djangoproject.com/en/dev/releases/4.1.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 1d3035bb98..cb03b33bfe 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  6b6a47d7478ead15b0a0835841c433dc  Django-4.1.5.tar.gz
-sha256  ff56ebd7ead0fd5dbe06fe157b0024a7aaea2e0593bb3785fb594cf94dad58ef  Django-4.1.5.tar.gz
+md5  626f96c63ddfab24bab90d80c87a7aad  Django-4.1.7.tar.gz
+sha256  44f714b81c5f190d9d2ddad01a532fe502fa01c4cb8faf1d081f4264ed15dcd8  Django-4.1.7.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index e08de68954..e8c91cf51f 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.1.5
+PYTHON_DJANGO_VERSION = 4.1.7
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/41/c8/b3c469353f9d1b7f0e99b45520582b891da02cd87408bc867affa6e039a3
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/9f/a7/07939866241b7e8f8d3bf164b7d6ad428163723e29dd472700f8ab0e5fd5
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
