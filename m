Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E250C83F3E
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 18:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 205F040345;
	Tue,  5 Sep 2023 18:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 205F040345
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16VJUXAAJups; Tue,  5 Sep 2023 18:08:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15FB140347;
	Tue,  5 Sep 2023 18:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15FB140347
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 060AD1BF318
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E07728136D
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E07728136D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lb-0gVfZi6Pd for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 18:06:32 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE7C48135D
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 18:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE7C48135D
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c0d0bf18d7so15990515ad.0
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 11:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693937191; x=1694541991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/pJDpX8D9ZacQJgcrrbpIRi+BoG8RsJRfmfa+upOsQk=;
 b=JZGe7wfSwmM8hP7XWJpPytt1bmGl1zesfPsL5TUoWCiQ8IMYyJWj5cNCCxr3LaUrrB
 lZgsjnKUzgzVLZ/qxkgMvsu08gt2O8/Ie5o0uHyTnHhCNLsY9oRZ29xIPHY8vsM1CEB2
 wIEcD5RkTN320/unaGq0ErTLMQ15KEjgy66ZEBRTTReQ4s3I+kM/3aDHMgomqOrtyBmt
 3logLlYeVJDCV4I4LkGF54pv7CgM2PEwPKjQ5pXZaXdQYTEFVP8Er0XqXYNj0uSDF6Fq
 V9WkGUArGVH6cvJTkPPKbuKkFNC24LY20jCsYbZjvPTb578bRiPEhq+FbXlUSKU2NBNv
 FyUQ==
X-Gm-Message-State: AOJu0Yzl4YZ1o4VDT9BDfe5/ktswnmotGDNk3nJ9pQWLtpfNn+O7W10u
 q/X6U3SD5MuMJj6gv7HTjI863oEVCLo=
X-Google-Smtp-Source: AGHT+IFkYhdgA0fEkf0nUymtcJL4B3S1U1WCby9GgtwL+9Y6G7OKwgV0mcQmESTk3uwk8NM51xWiXg==
X-Received: by 2002:a17:902:ec92:b0:1b7:e646:4cc4 with SMTP id
 x18-20020a170902ec9200b001b7e6464cc4mr13494203plg.28.1693937190912; 
 Tue, 05 Sep 2023 11:06:30 -0700 (PDT)
Received: from Adam-laptop.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 ix21-20020a170902f81500b001bba7aab826sm9658143plb.163.2023.09.05.11.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 11:06:30 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 12:06:09 -0600
Message-Id: <20230905180610.1610778-9-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905180610.1610778-1-aduskett@gmail.com>
References: <20230905180610.1610778-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693937191; x=1694541991; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/pJDpX8D9ZacQJgcrrbpIRi+BoG8RsJRfmfa+upOsQk=;
 b=GLMeiV75+mksih0tNy2PaaJxkax/sPzm/V11WpgmZFhk9DBPKOHj8H46de/APa60Cw
 Lzrlwh2oV83mtSDIALPOvlSlGTy6SKXW8V5cEJNEq+2BhpC3qnRGsjv8mHFOl+6jbyV5
 XPMP+dr20ZGgHhOe5K9jL1JrlQv5pUVHifgkweAt5etUqpF+2OpYrJGxN/upSZdED06Q
 wlm3jKEVOXoG1fHvaGaoJwHtbT9M+v0KEBFtmPOJsDKWLhWA1d9eN6Y2KUSXvydXFVSo
 2xrefkWQQVrUtLm7c1vr1MT3yoahc9GN+6TG9+M3O64If0mBTZzywjan33fjTpyMcs4K
 PPOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GLMeiV75
Subject: [Buildroot] [PATCH 09/10] package/php-xdebug: bump version to 3.2.2
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Adam Duskett <aduskett@gmail.comm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Adam Duskett <aduskett@gmail.comm>

Signed-off-by: Adam Duskett <aduskett@gmail.comm>
---
 package/php-xdebug/php-xdebug.hash | 2 +-
 package/php-xdebug/php-xdebug.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
index fa92ee82ed..2509e6e2ee 100644
--- a/package/php-xdebug/php-xdebug.hash
+++ b/package/php-xdebug/php-xdebug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7769b20eecdadf5fbe9f582512c10b394fb575b6f7a8c3a3a82db6883e0032b7  xdebug-3.2.0.tgz
+sha256  f48777371f90cbb315ea4ea082a1ede6765bcfb35d7d6356ab8f71fd6dfcc157  xdebug-3.2.2.tgz
 sha256  ef479ee1a3da3f933e0d046ca8cd0c14601f29b2c0c41cc60c9388546a4e0272  LICENSE
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index 9429d4afee..c5a1e10ebc 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_XDEBUG_VERSION = 3.2.0
+PHP_XDEBUG_VERSION = 3.2.2
 PHP_XDEBUG_SOURCE = xdebug-$(PHP_XDEBUG_VERSION).tgz
 PHP_XDEBUG_SITE = https://xdebug.org/files
 PHP_XDEBUG_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
