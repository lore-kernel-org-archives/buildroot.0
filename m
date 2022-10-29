Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A91C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 11:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70988408EB;
	Sat, 29 Oct 2022 11:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70988408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcndUk3Sw5tb; Sat, 29 Oct 2022 11:56:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB3E408C1;
	Sat, 29 Oct 2022 11:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EB3E408C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 210C11BF3B8
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 11:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09802408B2
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 11:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09802408B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LXmolyyFYBbw for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 11:56:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86B7D408B3
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86B7D408B3
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 11:56:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j15so9713600wrq.3
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 04:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=87KhheZM1rSzQ05ITn3RGTXLe+qFrhP00+2YNswhOKw=;
 b=kS1xEFPe7t06oRSfqdl5ElNuHAbZ3kc+gIQbjzJ2tTCyyjZXJqUMoUQ/MIN8hLMfNc
 05SFQB/+uYogCzwiXLsdPUbskyLF2gLNucg8pBXhUgotS/AYnzF1hjbi7D7xP2JXvtdS
 g0nv1tK+Um4c6QTwTB2ai7bo3lTixzSFAFjBEFcNMP/T4snVwriTl5IHWzIn+ncjRFXn
 8osWuaWwrnBO64P+KXND1BCfVyPOk/INYJdyzwfe5OMaHXzUMf3ZrEoxvc/th/TpUtQP
 GSNmw2DNe8gy4NzC9SWJauZUp2sFZm3W0QNJj6aWy7gqS82F36sIw0/t8bA1iwBhuj2r
 5eqg==
X-Gm-Message-State: ACrzQf2lz/1FYUoIVGFWqk6OD3ang13BzTkrSFCNfJeJauGxoMihCzpk
 HonsRGwT4hWaFoygZDvwErCf3q3j4fI=
X-Google-Smtp-Source: AMsMyM5inCbiSSlaXc0UG+acRP8PfcSwuHM58MD6oHq74JjisvOPEJQD4qCfUvVTqjRUf3pi251d9Q==
X-Received: by 2002:a5d:47c5:0:b0:22e:655e:f258 with SMTP id
 o5-20020a5d47c5000000b0022e655ef258mr2084464wrc.569.1667044562337; 
 Sat, 29 Oct 2022 04:56:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j31-20020a05600c1c1f00b003a8434530bbsm1497961wms.13.2022.10.29.04.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 04:56:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 13:55:55 +0200
Message-Id: <20221029115555.789814-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221029115555.789814-1-fontaine.fabrice@gmail.com>
References: <20221029115555.789814-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87KhheZM1rSzQ05ITn3RGTXLe+qFrhP00+2YNswhOKw=;
 b=qOJs7wPDb1H/ZCIZTd9BtLR++jNB/szPLI44tZ4jLilBHOZrOYgGV+VwWFT59eleBG
 KwNQRwT5/WXJ6YQ9NDzbuT5+v/7ICJ6ipnI6EAYy1PsieaNQgTAIJmuLWEgAgCA8zi2/
 uR0VFkszKP1SaGGrUmda2SqyoMQZyeFchLD9oV8ANkS0KyuwDh+WarxsNkaCmNaA0FCk
 DSkQvBxhGQS0C/R0euY3fIneIvv9ZB7EHrwukAsIf4anPzS27c6ibu7kqV67SmdqGj8L
 LDpE+HpiY4aCdNQa8a4bMvANcuhwwhKuEXCWmgBxFFG0IJqlktuJnY++sfeEndhi1MRu
 4FnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qOJs7wPD
Subject: [Buildroot] [PATCH 2/2] package/dahdi-tools: bump to version 3.2.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/asterisk/dahdi-tools/compare/v3.1.0...v3.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dahdi-tools/dahdi-tools.hash | 6 ++----
 package/dahdi-tools/dahdi-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/dahdi-tools/dahdi-tools.hash b/package/dahdi-tools/dahdi-tools.hash
index 72fa995c84..c119ff4ee1 100644
--- a/package/dahdi-tools/dahdi-tools.hash
+++ b/package/dahdi-tools/dahdi-tools.hash
@@ -1,7 +1,5 @@
-# sha1 from http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
-# sha256 locally computed
-sha1  fff6c8fdc72a66f81768e4f50bf55156f7cebbc4  dahdi-tools-3.1.0.tar.gz
-sha256  ea852ebd274ee1cc90ff5e4ac84261b0b787b1a74e8b76ad659bc9ec4f77e67e  dahdi-tools-3.1.0.tar.gz
+# From http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases/dahdi-tools-3.2.0.sha256
+sha256  2bc269887fcd42d2486572611934d713e603734cc658b3b517fc9f3bdea7262f  dahdi-tools-3.2.0.tar.gz
 
 # License files, locally computed
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
diff --git a/package/dahdi-tools/dahdi-tools.mk b/package/dahdi-tools/dahdi-tools.mk
index fc0c591ca8..7d4de645a2 100644
--- a/package/dahdi-tools/dahdi-tools.mk
+++ b/package/dahdi-tools/dahdi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAHDI_TOOLS_VERSION = 3.1.0
+DAHDI_TOOLS_VERSION = 3.2.0
 DAHDI_TOOLS_SITE = http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
 
 DAHDI_TOOLS_LICENSE = GPLv2, LGPLv2.1
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
