Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEC7CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 16:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24D6F40F6A;
	Wed,  6 May 2026 16:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MO9KUKS1sbNc; Wed,  6 May 2026 16:35:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E1BD40F6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778085338;
	bh=WxKJ9zQunOfiJr+VstLsc8BP2XUhPoF81hhnjvV1nfE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HpG2AVjuaef4svoZ/qY5xEtF5UFQVr/J6DjKOjGA8nhci3g9PvLzSR5aVQfPgcfKQ
	 K/QcS3alEzyt35XFP4PeXy6DlEPXhAcYgZgk4CCtfsXg+5GRT7m3Y1npzFwxu10wPo
	 RqejRXuMWUhGfoHdl/eYR9zVKa0j5wlPx8mRA8qYh/s6749W0PbhkKdnccuD1f4Gyu
	 5jzGdw4wigzpzH2HCMOudv7w0RkAi6K2RfVeha5qwAOevA0kkVHlclnjEwPMslNVRb
	 v3WucXW/JzefnBtIv/yXY68duFah56GmgvTuhaOlecesw/8ALERJ1yDmfkELJjLZM/
	 RDCVXPN3ugGtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E1BD40F6B;
	Wed,  6 May 2026 16:35:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FAB7317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61A8240F6B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfJjC293dksD for <buildroot@buildroot.org>;
 Wed,  6 May 2026 16:35:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D8A240F6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D8A240F6A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D8A240F6A
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:35:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20B2FA4C20EC;
 Wed,  6 May 2026 18:31:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51906)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKf9y-000000002XI-2zie;
 Wed, 06 May 2026 16:31:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 18:31:31 +0200
Message-ID: <20260506163136.1330722-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506163136.1330722-1-bernd@kuhls.net>
References: <20260506163136.1330722-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778085117;
 bh=uRVyEuXsoiJroTTC5Od+bzyC6BzvZdJHU3oYM0554qQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pSBS5lyHMC6o5tjCWSsRjdEDSeCH7+uUO8w1NZYe6AtjtcdcFGq5wXNq8qY1GYNEO
 VZDidt7xr45k9Ic7VJNKfJANopoTV9AgilJWr+0RqQd4jvZq51RMfFlC6mFFsw7/dS
 ukGdedU/RiJN89tk2BS+6xeW5HOJ47XIV1rNX63I7aC8M9yLcp6J1Y0biHXeJJMIXv
 7P/EU471pyxZpHnivwqBXtVRbbXvyu6ZaP8lq4c/JyagWBbS99fX3jAiOfmOQDnGlT
 xtkKmefrhjbidLLA8TOsu+C229qDEEl7zj63P8+aE7rD2kjhm9/t0LWqlXvnKjF/x1
 gSV2AZ44zjfCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pSBS5lyH
Subject: [Buildroot] [PATCH v5 18/22]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 16 version
 selection
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch allows to use an external toolchain based on gcc 16.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../toolchain-external-custom/Config.in.options              | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 9ca024f5b8..f69e09ecf0 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -46,6 +46,11 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_16
+	bool "16.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_15
 	bool "15.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
