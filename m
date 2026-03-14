Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D5110706F7
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 18:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69C3982243;
	Sat, 14 Mar 2026 18:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6aEvYU7osA9S; Sat, 14 Mar 2026 18:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C85C8222F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773514277;
	bh=Sgyn5fZEH1IYwN3/PELDlwrfa4wSolLkLeRQFtkva18=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PeslLrb9XaF2Xh3SzPxjOa6ZgIighfhmYxPX8r0S8XGxj/OhAvIxRwdLnuo6z8/J6
	 eTqUMejCv1fHEnp0DddB7TVjWQ6KNwnwjQuhE6fs6VqgVOcG1iuDYi2JnN4PYun3r8
	 XARl22s48Tpb48THh+vh4MZJnwnuOuk0v/zZecRLbCHd/Vf/aAIpUfEmpLlHom6eno
	 Ck7QXQFaE0Eah6a8ISvPTT+X8PwPe48hlV8U/isVyG3uf1b0Ue73wqhPrUEaJF17ak
	 hVX1q3uxcqyrupHZqJyXLYOfrq06mN/aMzR0JzwQ3Z6/Fh8nFR5vHui9sqULkVfyhH
	 MR0Ijjs5Pcz0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C85C8222F;
	Sat, 14 Mar 2026 18:51:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0EE81B2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B21FA60ECB
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5ZrtkC9vs1w for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 18:51:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2F5260A82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2F5260A82
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2F5260A82
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:51:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B113BA4C1174
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 19:51:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36564)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1U4j-000000004PV-1dkM
 for buildroot@buildroot.org; Sat, 14 Mar 2026 18:51:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 19:51:01 +0100
Message-ID: <20260314185101.3226151-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314185101.3226151-1-bernd@kuhls.net>
References: <20260314185101.3226151-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773514261;
 bh=fed2OnoFAXvwSlW+XXCCO94pHvDQPVB0SCzgHcFXgtg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=e8E0Io0N7c+dmFewTRagNE/hqjuP4hEawutIgk1etGkqqYnDa56zKFN44iCyXyf6z
 54R18/mNYMHDWf5xSVM5F0/wKRTdR0suVRQW7KakmCX0vDUojyPLssB5VXVvHriCMl
 38FjqXZTUhlTREctJljzOqcehsVu1VTXVfz7gSp43XGurHPGrbqm9SbU98MPnrjA++
 nYFU1oRawxK53AuEe8F5qLIQ0C1D+bQmwh6YaWTQAfE/jLI4VrZ4hwYaigmlaMlE0G
 nlKG1P+sszwgLRcOkHgRtAD5j30FQ7hPBBLzjULkg76J1eaxB0wPfSkowNf5ZORJvC
 25Mle55YnP0oA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=e8E0Io0N
Subject: [Buildroot] [PATCH 2/2] package/iwd: bump version to 3.12
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

https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog?h=3.12

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 7ad2fb382d..67064e35eb 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  640bff22540e1714f71772a83123aff6f810b7eb9d7d6df1e10fb2695beb5115  iwd-3.10.tar.xz
+sha256  d89a5e45c7180170e19be828f9e944a768c593758094fc57a358d0e7c4cb1a49  iwd-3.12.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index a150a3048b..caecb62d64 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 3.10
+IWD_VERSION = 3.12
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
