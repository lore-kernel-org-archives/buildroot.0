Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FDCC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C40C82245;
	Sun, 31 Mar 2024 00:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOTVqD4gObCp; Sun, 31 Mar 2024 00:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3865982106
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3865982106;
	Sun, 31 Mar 2024 00:42:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C38C1BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58B4D8218F
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13TfPaMu8ekS for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:42:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06FBA82130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06FBA82130
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06FBA82130
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:42:13 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7c8bb3c2494so114550639f.0
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845732; x=1712450532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IA0I+8qxBnxbYs2gDs/miqYRyXPzYFdLqGSwFDNPCHU=;
 b=fmjPO+w9tsnvFFP/JUkTcVsZgfE+uK57JxHOe3RXKrr8u4/XFLfkatlXgHLR6IwUb0
 AOWOopZ5grNAhNlZwYAdsWzzsxw6riqwqO4ndR91eI6WkMjsSShLSWpG0pp5NbeqG93x
 XzEC4crNblb95wYoBRppkb+CJlaZrpeen1EM+4fCu0k1MRJAHfR+ushdKSp3hMSM7Wu2
 08CoFdR5vb2iHQ3i7376hdXirj5T+flln7vtj/4uz4rpFnfld2a/FTbV68bEed0LLZ2S
 CyqCrTWUdAN9v+72o25tUj5ZsCLiAoDPKkBzZ2iuI+NXyFD2m1f8yDjZdmp4NaXqTTpz
 84qg==
X-Gm-Message-State: AOJu0YwszUQ9hRrbT3UurNB//UOhyPHW2d3vL6jPc6BSv2Bq/d82psjV
 tYAJZPjTYQ+s8dbbc6w21fXfl7MCSQEK3XXPzxRNVZPfipXLQn1Yozqj5jiYkJs83Q==
X-Google-Smtp-Source: AGHT+IFMfnc79DawVgIN95shpDemFuA1TtEYvcUBa0F1/NNGEXgUyDIKIqiWAVT+5aHTfVyMtR7EvQ==
X-Received: by 2002:a05:6602:184:b0:7cf:7207:a6d2 with SMTP id
 m4-20020a056602018400b007cf7207a6d2mr3587057ioo.10.1711845732547; 
 Sat, 30 Mar 2024 17:42:12 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:42:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:32 -0600
Message-Id: <20240331004133.636618-17-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845732; x=1712450532; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IA0I+8qxBnxbYs2gDs/miqYRyXPzYFdLqGSwFDNPCHU=;
 b=WV3CTvaeQV5FknDo52HZZnPyQW2ZB81mIE16/OmFxlotWx5Vh1a1jxVm3WMSuSnbn0
 XCixaax8U0561JrhTqJpYIYP7AsLoO5FwY8lW3LeRiiAXxSWCV3OdDKaET4B3ifrWhC2
 01vzlnbnZIt0Pm9cMaz1HfwVEisk2DXC+FZbZBWsaBnj61WC8pu8PO3NmF9rVmoffEgb
 P0LhT2rl8V0NbqtOViJbbLmVer7KRtkhJP5fsEdRByeorrrdVh4YNiWs/jo5+DwqGqaL
 wiXB4xtyqETXMsmOlHRePpHSq9z7XACJmQTWCyrOC/XEulKUhBEWnHPcvxsYjJifMF/j
 100w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WV3CTvae
Subject: [Buildroot] [PATCH v9 17/18] package/python-setuptools: bump to
 version 69.2.0
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
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>, Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 7f13ac3896..123c9a1455 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  b82de45aaa6b9bb911226660212ebb83  setuptools-69.0.3.tar.gz
-sha256  be1af57fc409f93647f2e8e4573a142ed38724b8cdd389706a867bb4efcf1e78  setuptools-69.0.3.tar.gz
+md5  940ffdb3a2ce4f6a5ee80032aa115fc7  setuptools-69.2.0.tar.gz
+sha256  0ff4183f8f42cd8fa3acea16c45205521a4ef28f73c6391d8a25e92893134f2e  setuptools-69.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 0aea3c6cfa..afc7348eb2 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 69.0.3
+PYTHON_SETUPTOOLS_VERSION = 69.2.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/fc/c9/b146ca195403e0182a374e0ea4dbc69136bad3cd55bc293df496d625d0f7
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4d/5b/dc575711b6b8f2f866131a40d053e30e962e633b332acf7cd2c24843d83d
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
