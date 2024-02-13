Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BF5C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1567A8219D;
	Tue, 13 Feb 2024 21:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GOeh_cujZULv; Tue, 13 Feb 2024 21:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D7D482211
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D7D482211;
	Tue, 13 Feb 2024 21:15:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 882DE1BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75F01407A8
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kre43rggDjZf for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 20223400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20223400DC
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20223400DC
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:33 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7bb5fda069bso231609939f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858932; x=1708463732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yaIqm6kVHKvConFX0REfyqocoWWwy2hemOMMVDZVWO0=;
 b=Rv94JE0I6r0kDq5rxaidpfwr+cvxs6RLXyWm4kac0Ktf26Iya1/KoyZqDCzVy937h/
 DY+D4D1c6ekEX6lnqmMbuhHDuHAo9SUdMnATgYqlPASHzyO2xDoOVpOR1fP1COWFR7Xb
 PCVuexA+lPM+gQ/sG2aCR6uOTFV5HZl2HsbveU2BFyg5zj2y7FZmFhqf6fa/2Lnvj3nP
 /sq0Mnx5SxjaT8t6mCsQrt1Fh8OX3OSJD9dXJFRlMfeqqQMrRK9GS3kHL/qE67vWSMDw
 s3KBUhjvfnlOxZ7ds9mwGE5dKvO8oDSnWnI7Yl5AGwTRSo3iAZHo7A8ecoxwlKAh+8W/
 AC8w==
X-Gm-Message-State: AOJu0YyhAopD3P9PWQdjap9tf8YPvf3XJtZmdPVWMZz8zH3UzqX9FxcY
 sbLh5yOHT9kd99kFHR+AhzfxGktEDiXSYar0VEkAtENZcz86TLocC7CG2cr44m2aNA==
X-Google-Smtp-Source: AGHT+IGvg7XZi1hCfWEk59JzmnhelZADDBx68PGAdrTrMe7/gtS1YhUgIL+GPyGcsN9BtVcY3eCrWQ==
X-Received: by 2002:a5e:d904:0:b0:7c0:3736:c0de with SMTP id
 n4-20020a5ed904000000b007c03736c0demr1018086iop.10.1707858931814; 
 Tue, 13 Feb 2024 13:15:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ8WL5pWxOBGrgBxG/64g+Nmu02Ro67WCS0pHa09bByj+a2kAl69BBP0g4se4jHRrH16snat6+E58sk3PvhVRfGYS5fxt6Fuo0Iega/AQxFvYeKAUXagbRaQ0WeQsammpjjrcmafX/ogwR4i1t1DpERMDokBFGJQCx7A8WGwnsb/LY8Qhkv2Gd9P4UYWmUmtabTkW77qwmILG6AVjivDfqCBDAJwO4ka0dMg2DA5uUbXBNYUA1dc/fW1wDt61vd1HpSAusY3nEO/G2tPfotCt1fLPrqgrj1d3O8QjapFW+8olUBIGS7MDWyEicBm9tBfi5SpnIjuCb3jC1Tv3s9/6CHgoUaag/zLrq/QZMCXDktAwQFiuTB7CFn41+GBQv9BAo0e0Uk0kUDjsXelLBAMQ88yd5znObKLuSCcT3XRTzgPQ4uXN8L37IvoUtdWYsdgBlptHY+B6RoTxJX0MCnvBHVzyTBMqvBINFUAz6gHIfYXI5L/CAhM0QQt/vFcJmI0V08NrMnXWmWrCd6WTXXVysoL9b107Rf59fZjfD30wC5tJ+WoOC52JAS3QcIc4zZIn2GwdA25T3UyigsTwLTV59sY4vtMA75+9yOcNix8cd6PJcSuJpYKVZ6vZOKGKR6FTg5ovPhRGyP5xsgEUb9yCku4Rbgm6XSt+UHKoVZukAIB+LJWjtco+nswQ9oSGi/j8I9Q+JPxPg0XcPR6m1/ZOMNmFYytRLDa9ckmCfi8WNqXgb+lqhog==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:14:50 -0700
Message-Id: <20240213211512.3918044-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858932; x=1708463732; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yaIqm6kVHKvConFX0REfyqocoWWwy2hemOMMVDZVWO0=;
 b=fOozsL4e9luFjNJXB3Oq28dQPkMROp5t23620PqxLMGKwqOZs0xtKOTwKBD6duKUAC
 wm9pqcbw+99YX/FBXMCl7/dBRFqWKPQTQx8NGX/klfmVh014vjSxx60rmeQaiXHO/yW5
 IUSRMvskNOnNkcfQrgUyTZZRO3fYAJUfYfMFEegQoMOX2Z5lkL/a5o6Unx8OCL9U2wJL
 JBGWLtmkGyTzf25to68IdI9spygHm/mwxqJrVo5GAo6c2vTxEeosYJ+MNr8vXyinCPaj
 C07d0DvMxD0fDBNIox/J+xKUez5hMP/MnNbbNoofs0zbmXbyNenPueq0BE9A8Ut4Cflj
 COrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fOozsL4e
Subject: [Buildroot] [PATCH v8 04/26] package/python-setuptools: revert to
 last version with functional --build-option
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A recent change in setuptools accidentially broke the ability to
pass build_ext args via the --build-option config setting.

Lets downgrade to the last working version for now.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 7f13ac3896..9c971eec11 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  b82de45aaa6b9bb911226660212ebb83  setuptools-69.0.3.tar.gz
-sha256  be1af57fc409f93647f2e8e4573a142ed38724b8cdd389706a867bb4efcf1e78  setuptools-69.0.3.tar.gz
+md5  d967ca2ba7f46db887daee2d5c9bd6a2  setuptools-68.2.2.tar.gz
+sha256  4ac1475276d2f1c48684874089fefcd83bd7162ddaafb81fac866ba0db282a87  setuptools-68.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 0aea3c6cfa..f26f427ccc 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 69.0.3
+PYTHON_SETUPTOOLS_VERSION = 68.2.2
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/fc/c9/b146ca195403e0182a374e0ea4dbc69136bad3cd55bc293df496d625d0f7
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/cc/93f7213b2ab5ed383f98ce8020e632ef256b406b8569606c3f160ed8e1c9
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
