Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFDAC32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 20:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A77F360BDA;
	Sat, 24 Sep 2022 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A77F360BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nldXJ8E7zo_n; Sat, 24 Sep 2022 20:52:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A53A6607D1;
	Sat, 24 Sep 2022 20:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A53A6607D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E93B71BF28D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 20:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDB4440136
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDB4440136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cMPmMRrNpAK for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 20:52:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F71340123
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F71340123
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 20:52:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso1676133wmq.2
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 13:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=eWn0jScurp6TmWzJMVVefJTSheFUo5cZj36emLlZfjk=;
 b=VE/PXpXCzP3aPb1CKiBBXEKMRbxWBIgjFoMIWEue8QS0iJ6hm2TxqvGBWX4LThrZ5F
 SEIIusWDPF96RZFD2ldogui1VvNuFGaEdTag8xjgeXB1QNYArsu/w/L1aZHUHr4l/5Vq
 N/F2WkrZvovlpeS6KwL5/BzqG0FKapO+g9PQRaH0jEhQW6rvh8A+2UDCFY71uJynmLoh
 WD/TrmuBf8AkCu6IS8OIRcTuKF6wjs017VcxMCG/x4pjEEVJiP8V9jvTvHBPtTFqXdNc
 tZJmaJIrk/8zbw4kgBxEy90GaA+dIwAtSwdAW0in7dh2IGoVbNmZnlnSqUZFI74DUzXP
 Saqg==
X-Gm-Message-State: ACrzQf3G3CdtkGfNbHvJQil6R5Sr0UUztUhKgfL7mPdvJ108yuH0P0F7
 pStf9i272PEyXiq51KZ+huxwKaCjxLg=
X-Google-Smtp-Source: AMsMyM6nI93E0Hgh+qn9f4NubeCLEAdcdqxhFor/mUcrZrBjjCgWroHTwjqkUl0ddBZxYoFhxm4YuA==
X-Received: by 2002:a05:600c:4793:b0:3b4:7276:1c5e with SMTP id
 k19-20020a05600c479300b003b472761c5emr17245906wmo.118.1664052718271; 
 Sat, 24 Sep 2022 13:51:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n39-20020a05600c3ba700b003a540fef440sm6715091wms.1.2022.09.24.13.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 13:51:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 22:51:48 +0200
Message-Id: <20220924205148.20621-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=eWn0jScurp6TmWzJMVVefJTSheFUo5cZj36emLlZfjk=;
 b=EYVQkudgNlFUAA8mK8yfRTroL+v6ZgBnbjd2oILvgSHYclQsGLZM/gWJvemdgIv1Os
 1opR6/yMVrXhKZ50USpsDnYek3KqLSDbj8APGSR/j5A1LSovOU15y8WdjLicaeHmosO/
 gWHhxDKn4SOoDCiSPGMhU4IDJriynO4bD1W3lPVopXMJmN6P40ICY9S/NWNqfHsTJ5lk
 xkm7jqQQlptA2/0NgLvtWGYOtW+VcCP+uE1T90eGH6gfRh277sfkrzEx9zIkKzStSqq3
 5NKWpxcW3fYlbcDSIoJ3bp1EIMwU++5pGfbL+91t4d+y11YaSPuQt0M9FUDa/9jGMvMG
 q30Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EYVQkudg
Subject: [Buildroot] [PATCH 1/1] package/forge: add FORGE_CPE_ID_VENDOR
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
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:digitalbazaar:forge is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adigitalbazaar%3Aforge

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/forge/forge.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/forge/forge.mk b/package/forge/forge.mk
index 9a811b4929..0b81295a15 100644
--- a/package/forge/forge.mk
+++ b/package/forge/forge.mk
@@ -9,6 +9,7 @@ FORGE_SITE = https://registry.npmjs.org/node-forge/-
 FORGE_SOURCE = node-forge-$(FORGE_VERSION).tgz
 FORGE_LICENSE = BSD-3-Clause, GPL-2.0, vendored dependencies licenses probably not listed
 FORGE_LICENSE_FILES = LICENSE
+FORGE_CPE_ID_VENDOR = digitalbazaar
 
 # Install .min.js as .js
 define FORGE_INSTALL_TARGET_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
