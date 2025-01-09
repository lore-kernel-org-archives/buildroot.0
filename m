Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E32E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 17:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0362040811;
	Thu,  9 Jan 2025 17:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cV8U3uhFR8iC; Thu,  9 Jan 2025 17:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2BD4407E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2BD4407E4;
	Thu,  9 Jan 2025 17:03:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79E7C76C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 17:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6606D809F8
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 17:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgacPL1dE_4D for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 17:03:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 788B880899
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 788B880899
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 788B880899
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 17:03:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b1c1.dip0.t-ipconnect.de [84.161.177.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 32FC9A4C43A6
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 18:03:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58760)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tVvwM-000000007Ej-3pbG
 for buildroot@buildroot.org; Thu, 09 Jan 2025 17:03:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 18:03:25 +0100
Message-Id: <20250109170326.34279-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250109170326.34279-1-bernd@kuhls.net>
References: <20250109170326.34279-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1736442207;
 bh=YyyC+Vsh3QEyQTQOUbhgr9TI9wVgSQvGvjmm7oAtSaQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MVqj2RBjxKbl+RkErObMamA9CQpaWiZJ8sbDuI1GKdnUnAOPiGK8n1nNcmhxxlAXW
 FzvYXCYJKLpMVF6+F3sC6oiDK0KEec/+VVVSrvUTVx8AIXjY0adWNg4tBMwQ0qyDBi
 pQZfx56wlYEN93hcH0Ee25Zpsf+r/fv866P8M8Cf1lJYdgkmGCfXfH01TknNO904R+
 lBR6VTua8tkvnbAPwMFxxx55lJZyOKg9EZmyYo5rdxEr3fyypK755/t0hbnqwSmpap
 hz3DY54yrzvIi49OXMQzAmeTTfqSIhD1Ennf2quplTfUSsyT7Fia0xzyBxduYps3JX
 mfWUJHU7mohTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=MVqj2RBj
Subject: [Buildroot] [PATCH 2/3] package/kodi-peripheral-xarcade: bump
 version to 21.0.2-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 3ead10c479..833905b9a3 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  50e363e3bc02a1e0585294b08f920e077af5290203cd76aae02ac363ee98f3e5  kodi-peripheral-xarcade-21.0.1-Omega.tar.gz
+sha256  5f74b0493e0f17e297f271b0befd01406dcaae121305bc7cb9d0ece6200cc675  kodi-peripheral-xarcade-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index f3364e3520..a46c616323 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_XARCADE_VERSION = 21.0.1-Omega
+KODI_PERIPHERAL_XARCADE_VERSION = 21.0.2-Omega
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_XARCADE_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
