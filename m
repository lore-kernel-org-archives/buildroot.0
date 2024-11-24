Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBCAE66894
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 10:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C22542DED;
	Sun, 24 Nov 2024 10:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7wtVEKR7MJU; Sun, 24 Nov 2024 10:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5823142DF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5823142DF8;
	Sun, 24 Nov 2024 10:50:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A86A31
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BD4D61528
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oguudbvLDPVC for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 10:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F955610BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F955610BB
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F955610BB
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:15 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-432d9bb168cso25445795e9.1
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 02:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732445413; x=1733050213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b79jZNCV138JmFk16+bk8YHdCsUjOEtEPL/IjDQgo+8=;
 b=d8FBKia+QkJ/2kb5gr1B+QJH3BmFpWITz+W4600X/tInMuBy9EDHb0MSPlW3Et2w6S
 vsk7FwWQEafaZVtcydA2wZCkTOSEmKScQzX2P8YpqqmFZlxXli2pla2Vgmf/kKuHeDBe
 kfy8fNRPjw+JjvfhSW17LJFCcnsMkgsY23eRdNa/F1WlolJ5pOa8Db8SY+FsOeq/h+Z+
 rVeBGRG6TrtqUCrrkI7GpkpMdr6Q+lg6j4tfSh1WvaAVtDx3BCM3hCs+O4ppD+wii1Gr
 CMsHVNTLLFQgcdW56uRZWeYkandPhL80O8ESbadp5VyTdFAH3FuFG3ugks6GVD/IDJtw
 2vRw==
X-Gm-Message-State: AOJu0Yw7xmhzg1pD/GdnB/URNxbQmLdmpgaiZzRXypxQiQVKazYaPwOA
 fUqiWmLtYXSaBSX9r9tSTDyM8MjRDR5/bnrWsANbQkkY8QRt+q76TZq6168J
X-Gm-Gg: ASbGncvXlxmgJg2YAO//pvK6hi7vUhFZB+HsrfkmdDipUlMeHJR+lvfjKV4Kj5ECGYs
 v4WfXagO8sWzNY3owaSjuyLMc4ymDomWEI1lGIg3XlMu1fd/zZN1C70VnbAM6UHpL1AhzS0Js+D
 ZUEIe/dGnvvIr0AxeYKSieZSId4kHvWxdU+5f7dR+6QgbLlCAzrlF+M5RoYzcj5qxmW4x2esEYB
 3hKigdRpcptL8WQIeOEDRIbyZVNssa+QXrOUKVJKteq6FRUxpZkaH1Z
X-Google-Smtp-Source: AGHT+IFVnv1bVTCxAPWhoUQGCT1R+g5gk/QQXB1aBSYeU40zO20YYx6pr/KOl9G/WrjB7Ckj5ZOX/w==
X-Received: by 2002:a05:600c:5105:b0:431:15f1:421d with SMTP id
 5b1f17b1804b1-433c5ceeb38mr112024735e9.16.1732445413201; 
 Sun, 24 Nov 2024 02:50:13 -0800 (PST)
Received: from localhost.localdomain ([2a02:8070:2483:7e00::478])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde110cfsm88665515e9.11.2024.11.24.02.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 02:50:12 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Nov 2024 11:49:07 +0000
Message-ID: <20241124114907.16924-5-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241124114907.16924-1-raphael.pavlidis@gmail.com>
References: <20241124114907.16924-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732445413; x=1733050213; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b79jZNCV138JmFk16+bk8YHdCsUjOEtEPL/IjDQgo+8=;
 b=MK01aks8dvVXyKXwsfXcoC2XgWNtZbIXe0h6/6UyAh9VOvS4ofk/sGpvhiwFkq3g3/
 8tfhHYAaoWZCH6yz+6vvjVnEGF1XojkE4GysO1ropmPMKFkRMFQzTKyeaMfuVtkvciyM
 AXZsSTCRzVvDUtwzJ0LwwhjSQE5UM5AU1e2xZAYlwsCWaOf3DpqrePtYfC51QEbXDtda
 rrNnNFTCX1N/UKI5n2Sv3SfHtaEcj/NXFtnLJnsI5irbbuIMmKQrdINBcZ70CvLylHos
 zhWIBYhI9Ccd17vZYN34Q9kvxFhjPuohUZkKCZZmmuprJ0qruNdmVE1SM3uvov7bZ/yN
 ep8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MK01aks8
Subject: [Buildroot] [PATCH 4/4] package/sway: bump to version 1.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/swaywm/sway/releases/tag/1.10
https://github.com/swaywm/sway/releases/tag/1.9
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/sway/sway.hash | 6 ++++--
 package/sway/sway.mk   | 8 +-------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/sway/sway.hash b/package/sway/sway.hash
index 86b6581f1c..379180b0de 100644
--- a/package/sway/sway.hash
+++ b/package/sway/sway.hash
@@ -1,3 +1,5 @@
-# Locally computed, tarball verified with GPG signature
-sha256  73f08fd2cf7948e8af900709efe44eae412ae11c5773960e25c9aa09f73bad41  sway-1.8.1.tar.gz
+# Locally calculated after checking pgp signature
+# https://github.com/swaywm/sway/releases/download/1.10/sway-1.10.tar.gz.sig
+# with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
+sha256  7472a7f11150212e0bed0bd0af9f591c9caac9f9ea87c35486e475a21f5ce81f  sway-1.10.tar.gz
 sha256  bd35722bff46327f5eded1d211207277bbe043d2a22048b282c42ef801593b8b  LICENSE
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 0aad9de712..74614b0c7f 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWAY_VERSION = 1.8.1
+SWAY_VERSION = 1.10
 SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
 SWAY_LICENSE = MIT
 SWAY_LICENSE_FILES = LICENSE
@@ -16,12 +16,6 @@ SWAY_CONF_OPTS = \
 	-Dman-pages=disabled \
 	-Dsd-bus-provider=libsystemd
 
-ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
-SWAY_CONF_OPTS += -Dxwayland=enabled
-else
-SWAY_CONF_OPTS += -Dxwayland=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
 SWAY_CONF_OPTS += -Dgdk-pixbuf=enabled
 SWAY_DEPENDENCIES += gdk-pixbuf
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
