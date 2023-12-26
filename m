Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF2AC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 17:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 303A360EC5;
	Tue, 26 Dec 2023 17:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 303A360EC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GK4uqiE4xFi3; Tue, 26 Dec 2023 17:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83601605AD;
	Tue, 26 Dec 2023 17:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83601605AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6BF1BF2A5
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 17:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83F9D605AD
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 17:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83F9D605AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4FTKdIYU0kE for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 17:20:46 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CEDF600CB
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 17:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CEDF600CB
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33666fb9318so4434085f8f.2
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 09:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703611244; x=1704216044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aNoiJ2yhm3XudjCRs5NDsdpgVFIHL8Buz4pAqPMY64s=;
 b=PvB6xV5HkHdVd6GLlUq83ZKVT5q7jrCYKMmM2fUTYqdulvRJYZnxA5TBwpleeabCI8
 72cF0vio4idJOf+maxd3euOSrDHM8Mmwxt6L03804nVuH3Gq0fF73SbQbTeiynAGSsi1
 IzrmKNYRpeN3cqhktbxrYN3QdVXdduJEcUdtb7x1kKRuQSRspKIaNgWIBTc3MbsVf4Xy
 YAdXgCFnFz/bY7FcqcZ2BrT8xaubZ118RflXcqhOPJ9kWYnsdrmoFHUPuoUG0IFEoinI
 6OEARwuEOnZuoMCacSd9x9U/AeQeTyddSTzFGoN7qdfYNcqhmg3dfGr57LKjmNGMA8rM
 H+mw==
X-Gm-Message-State: AOJu0YwnGmxzn06bzutEkZuIE4OrthcPrdLhVEFXQa+o+Zc3g6bpj2MS
 4uJ/ufCs1qkjqPl024ZI3SZwrf9/Mtk=
X-Google-Smtp-Source: AGHT+IEtMRxXnrlVtY7xRJndvUxMIuABPr5ylkTIEf4CPekPST+64zFq7ZXTj2J0G58OY0bVsyyEcg==
X-Received: by 2002:adf:e30a:0:b0:336:78d9:24e3 with SMTP id
 b10-20020adfe30a000000b0033678d924e3mr5030189wrj.14.1703611244049; 
 Tue, 26 Dec 2023 09:20:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l11-20020a5d560b000000b0033680f7be5fsm13005924wrv.87.2023.12.26.09.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 09:20:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 18:20:41 +0100
Message-ID: <20231226172041.872046-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703611244; x=1704216044; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aNoiJ2yhm3XudjCRs5NDsdpgVFIHL8Buz4pAqPMY64s=;
 b=Le3fzMxi+QPXqN0sGTppc0LgPha7pHN0JTCO3EZplwGMPh3RC6p0LtHLLXtcJscKOC
 ORP8cPYViF3zaO1Jvi9Y1n730Eij1gYd9JPeZLJ5Yz43JDyOSk38Rk5oxQieIKPvwTCl
 aMxFHOhO1FXWkPIq7bUDW/YsyN4zCCAtHhafRmMfX9jHzjxjHzNUesg7o5SvoOmHq4bU
 VIExZ/ghLAlYEMWD9VSgHF7+LvKxQhyk7OVk10pNQvYY9cL/6lGsmQxAdgQY+CHJYV16
 AaEc0AVwsDjJbe3fc1F3J7cSnxOfipzBCC8PE0qxDp/QmnFChN+Hq9c9TUR6kZlIAKrm
 5ZKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Le3fzMxi
Subject: [Buildroot] [PATCH 1/1] package/minizip: bump to version 4.0.3
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

https://github.com/zlib-ng/minizip-ng/releases/tag/4.0.3
https://github.com/zlib-ng/minizip-ng/releases/tag/4.0.2
https://github.com/zlib-ng/minizip-ng/compare/4.0.1...4.0.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 5e00881ce3..b21a8490aa 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  63e47a2b4dbac0da501f43f4da74f118dfb3ef0dee0ffbbe89428271002260f8  minizip-4.0.1.tar.gz
+sha256  e39a736d4f55c22fa548e68225b2e92bc22aedd9ab90d002b0c5851e3a7bdace  minizip-4.0.3.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index d3e539d0e9..5a4d920369 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 4.0.1
+MINIZIP_VERSION = 4.0.3
 MINIZIP_SITE = $(call github,zlib-ng,minizip-ng,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
