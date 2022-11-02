Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3165C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64F0B416E2;
	Wed,  2 Nov 2022 19:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64F0B416E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8qowHwYYumUX; Wed,  2 Nov 2022 19:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34355416CC;
	Wed,  2 Nov 2022 19:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34355416CC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 224F51BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEC1760AB5
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEC1760AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j93UPRjMr53x for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:55:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED31660881
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED31660881
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:55:47 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id n191so15921682iod.13
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xs7yLQK5IL/YRPIvhNk1IHPzalv1NraiJP8OQv8jCd4=;
 b=gM680WU3FhSEbfNOu/8Kh316nL7MbiCaeDwMYsrr9HyusifiyEDA+YHPR+1UXv5Ae7
 JYgpyQLUNJRYKdHU1EJOfj81RDuaVHS78sNkbfysCRPuw1skKqiODiMg/OTZ8YOTjBL4
 uYU/9QV6mcHJ9ExgFmqHi8qOgTb47h9cvjHOYiErdD4GLKTQpqdsGfzmL09abw01nXlo
 H3WbRVAnOxO+AbF2iONTt+JNOSgcjvFF5NvHszPfWUK7QRb50zCzJsVd+FexPGphNwbY
 NYdIXZM+Z2KmU6QvCOxfjoe4YITJbez4nDloLycBHJlEb0XaV5uzhe1sHh8BcACcxZXe
 1SVQ==
X-Gm-Message-State: ACrzQf3ZanRbsdGFLWO2/IoJRyxwYkazQ+3tLdWNQSNXlT1loJT4Gkn3
 xr8u1KnIMNgREo7+idm9WFKWNy5HYp5GuQ==
X-Google-Smtp-Source: AMsMyM51fdxRZD3NMKNepoDLcW4pdmkZzJX49NdmoRWRzhTeBLhv7RXAJbEK0EJ0UYj0GA5X7K/Utw==
X-Received: by 2002:a05:6638:430f:b0:371:667:72a1 with SMTP id
 bt15-20020a056638430f00b00371066772a1mr17008578jab.74.1667418946741; 
 Wed, 02 Nov 2022 12:55:46 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f3-20020a056e0204c300b002ff63c88824sm4760437ils.75.2022.11.02.12.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:55:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:55:44 -0600
Message-Id: <20221102195544.1035113-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xs7yLQK5IL/YRPIvhNk1IHPzalv1NraiJP8OQv8jCd4=;
 b=dXoyb5QxHrDxlWS6H8rIkYmT2eqM38QAe8u180F8n6+kn51wWh/x9a1G8+wq7VKt5b
 lt6TBfG44w+PvsbJy3QnIpottUZuy6rYMus3wn1T4FZcGKeQDtSOjkxJLoSHlG7mAucn
 KF4Isnddvwj31rUsYd4fhTEvnLwkEgcMnrIKtXb0Wn0zKyyGGY1sr4lU37pIhifMnV8f
 GyHUfUYBZNWY4N1m0vsBQHW6c2FahtZ9oVHZk8tLX/XLY/Tm99++ZytqWnpIvAj+dJUx
 15cJ9/ihCZ4r+eVvQrxv9ShiHW05o+655D749K//Ejx5vLFQpVKP18X/5z8mnOimCTpv
 ozcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dXoyb5Qx
Subject: [Buildroot] [PATCH 1/1] package/python-django: bump to version 4.1.3
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
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 72adc30bb1..b9ae8a1da1 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  75ec07b3e00c79fd6e67fbee53786b7a  Django-4.0.8.tar.gz
-sha256  07e6433f263c3839939cfabeb6d7557841e0419e47759a7b7d37f6d44d40adcb  Django-4.0.8.tar.gz
+md5  60c54c37ecf9e5e635ee6bb07a13a9fa  Django-4.1.3.tar.gz
+sha256  678bbfc8604eb246ed54e2063f0765f13b321a50526bdc8cb1f943eda7fa31f1  Django-4.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 567d590f77..c90caa9635 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.0.8
+PYTHON_DJANGO_VERSION = 4.1.3
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/1a/de/08d8a349ed0e3e1999eb86ae0347cc9eaf634cd65f1eb80b9387ac1dbe3c
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d0/ab/33f9c2bd4cf7ff2d319131eca7231247f962f781ebc8a012ebe02582244a
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
