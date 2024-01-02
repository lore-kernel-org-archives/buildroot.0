Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ECBC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00A3B60FB6;
	Tue,  2 Jan 2024 22:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00A3B60FB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r4D5xiC1ka1k; Tue,  2 Jan 2024 22:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5087960FA6;
	Tue,  2 Jan 2024 22:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5087960FA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2AAE1BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBD3460FA6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBD3460FA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iYouyMAhSOWz for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:44:24 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B159860F3B
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B159860F3B
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so56594655e9.1
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 14:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704235461; x=1704840261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I06k/Eudpis9IuCrW/5UGqajG+NIiViwEQzU9hGFiw0=;
 b=Ej05pHOsaEEnr7RRIOB7El5IxaV4LxLKSatZ88O2E47mm9fn3nTFvMk0swRq7TkhhG
 mvWgj+PqIRCohFzcVVxvctw9yncYYjsQd1wZwe10VoA5I8pMGWoNbMXNSshSzTy148Tr
 AXy0VWHvfpGDnUertBR+lcuof4ju2BRVXhunb/yEbrPZyn8mrejXSThOFO3DqFfS9KRZ
 KynMFGEwOT6rgdXV7Bby9k/GF5uJ1cOwwsO3eAwfn3qR3ZWTBh4NCXojO0s3B06F76jc
 BpALxOzIrK5YyEyB9M/2JhAgceihrqs6qKgwpgOen76gUi8yrBBRoM/WdiBPnNh/hiBw
 ug1A==
X-Gm-Message-State: AOJu0YwPwMrInH/Y+IpsGgvue2Mr+NsldD+2rh8TqYnK1jmurrmsQTWo
 o5FhDyEeq0iFek9p+ffAVIr9Ygan86c=
X-Google-Smtp-Source: AGHT+IENvopovlWTI9izwFAZz/UvVZkio5ZnDAfQRFY6AhFL3mBUrTx9lL+w98GC31KRNgXANZF9Cw==
X-Received: by 2002:a7b:c407:0:b0:40d:3f5f:a12d with SMTP id
 k7-20020a7bc407000000b0040d3f5fa12dmr44280wmi.51.1704235460724; 
 Tue, 02 Jan 2024 14:44:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b9-20020a05600c4e0900b0040d725a9967sm361487wmq.11.2024.01.02.14.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 14:44:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 23:44:16 +0100
Message-ID: <20240102224416.2529022-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704235461; x=1704840261; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I06k/Eudpis9IuCrW/5UGqajG+NIiViwEQzU9hGFiw0=;
 b=FEdkUz3Ug9rEGYsaL9yljIALnfTMR/YgEgRRFN4rvdriTm5dQv6rtI53o+xOL6m24g
 Y9iov1gxyyupg7HkFL/XUIh1paoRozsubygyMY+uXYW2qOe/lSrMs2KCYFyP4RwyChei
 jdEJNBuO1KwippbuPNM2q5eHpgnzlHFNdDXZEFmhtH6CGZOPbapimVSbwXOqYLsYqcfq
 LYPxSHXiWu3Ax3/veFg1LI1zXVvmuFZZhGaGGUeieFZZSXSQAYQiVapirQYkUCncdiLD
 NZ/jFgZmfXPjoq+FaMjk2rvUdnJ0Ju36wkH4GMjxEFOMNGozVAX8T3w/VocNQ/QxV9FJ
 LFug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FEdkUz3U
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.4.1
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/postgis/postgis/blob/3.4.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 812d2dc017..2d2676d0d6 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  aee9b60a6c884d354164b3096c4657f324454186607f859d1ce05d899798af9d  postgis-3.4.0.tar.gz
+sha256  fef6a141213d0ff27bf45b33b849cc396c22ddb1ffc6fed435469c9e891fc81d  postgis-3.4.1.tar.gz
 sha256  2a3bde0a77224496ea6d8efa686da7e29ab0dd6b1a8f90ba12beaf7ae28e878a  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 2fb98245a3..cdb905e79f 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.4.0
+POSTGIS_VERSION = 3.4.1
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
