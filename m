Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F0BECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 21:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41FA180BD0;
	Wed, 21 Sep 2022 21:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41FA180BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tPboTiepv2rl; Wed, 21 Sep 2022 21:38:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F4E580B92;
	Wed, 21 Sep 2022 21:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F4E580B92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE1B71BF25B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEA5541624
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEA5541624
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pNFN0jF5IMCM for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 21:38:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E7304161B
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E7304161B
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 21:38:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id y5so12362637wrh.3
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 14:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=OHa5lLh3nCqqfvM5TJLgCRsdzqJZEXDY5vniUxIO4Gg=;
 b=UghXQYTP8fhGkeLbqNUvYLhDwwWxkBZeYuRCgUE+0QtYl0oicT4WZC+/jzucFerdnz
 QT6h41m6mYASxigcViZFpq/BBb4JygRFy7+ZUOUUHXa4DKTSf4ifZsu0yo/bQJS5suf7
 QqsTUw2YLXzuq2R1PBYB32vyJkK01zL54dYHv4mBRJKpx12+4OL7vaGZuiOaUQcyFwoj
 5Pk+cqZ1OAfr9DtlmHJvJk0LDCnRSRk1Gdo7K453WaCD/mowoQGvSqXm6/3OZ3zFZmU6
 sLxiGZALF47by6v30dMihwjAxIHHSAV5boZz3WO4jeISk0ZmFRx71yv7njkmySA500+F
 28ew==
X-Gm-Message-State: ACrzQf1cWIq3ZfpKj34sWGhcYMS8Wszq+pPIzBHrSAlKd7AzV/Hgbo2K
 oyuiFZ6CcXWN3bJ/FIwzuASPHtf/y50=
X-Google-Smtp-Source: AMsMyM5dul84TyKEpFz3lWEJyeH6/NF1Dw+e9HLOGAOkmwFuevzVJXAPKb/Uon7x3IEafVSymY1vCg==
X-Received: by 2002:adf:c713:0:b0:22a:3670:b08d with SMTP id
 k19-20020adfc713000000b0022a3670b08dmr91704wrg.175.1663796319954; 
 Wed, 21 Sep 2022 14:38:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c059400b003b4a33a7d08sm4041362wmd.9.2022.09.21.14.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 14:38:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 23:38:35 +0200
Message-Id: <20220921213835.373860-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=OHa5lLh3nCqqfvM5TJLgCRsdzqJZEXDY5vniUxIO4Gg=;
 b=oIR3xFMgAhLIy1Or1qW/ZbtMAEcHvBVf3rugm+QNanXphIKCLVdUIFPN7u69HH+GKU
 KlAnldEK+ttAgM4QvxKXmDQ0MpPr9M5Ptoi57j+cE7QtP8tk/KbaMJfWSAU/k/rp50P4
 YgMGONNsKqX3d7FhxxzfzqtafHBVYNgK4TX0c1d4r2AG2mw5D4ih4D35yzveBrm7eHum
 MSOGKD327akr/zNT6MXovaME17qq9p0RVFrG1avKRKeX8O4Tat980XEQY/pVmWeS+gDd
 ZQ9Sf7G4FwEbJKLQ2vWoWn8AEpUF8vO2e7CcCXZ1+ijxgpauJDJgVFbN6AWC8Fc2BDnR
 Rs2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oIR3xFMg
Subject: [Buildroot] [PATCH 1/1] package/xtables-addons: bump to version 3.21
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v3.21 (2022-06-13)

    xt_ECHO: support flowi6_to_flowi_common starting Linux 5.10.121

v3.20 (2022-04-10)

    Support for Linux 5.17

v3.19 (2022-02-01)

    bumped minimum supported kernel version from 4.15 to 4.16
    xt_condition: make mutex per-net
    xt_ipp2p: add IPv6 support
    xt_ECHO, xt_TARPIT: do not build IPv6 parts if kernel has IPv6 build-time disabled

v3.18 (2021-03-11)

    xt_pknock: fix a build failure on ARM 32-bit

https://fossies.org/linux/privat/xtables-addons-3.21.tar.xz/xtables-addons-3.21/doc/changelog.rst

Fixes:
 - http://autobuild.buildroot.org/results/b8f5f65cec1bd5c859f4a1fae4508900df362add

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xtables-addons/xtables-addons.hash | 2 +-
 package/xtables-addons/xtables-addons.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index a103fa3b52..0d2434eeb1 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2a640535f209ec59467b8c8b4343b446801a21a112a3fc189818d6e2697f5cf1  xtables-addons-3.17.tar.xz
+sha256  2e09ac129a14f5e9c23b115ebcdfff4aa84e2aeba1268dbdf39b2d752bd71e19  xtables-addons-3.21.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index b3d1bf2d44..83cc3266c4 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 3.17
+XTABLES_ADDONS_VERSION = 3.21
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = https://inai.de/files/xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
