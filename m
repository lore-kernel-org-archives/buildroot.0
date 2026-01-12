Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E9DD25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3528614B9;
	Mon, 12 Jan 2026 08:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWd8isYjtXzP; Mon, 12 Jan 2026 08:18:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEEC6614D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205890;
	bh=Ok/tHEXW83LZ4PeDOF4jDqqydWrWmSAfaOu8mslIxEE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RdY7jkFa5SvY06sk9KgAoJc6hq1JYeKWl5A9I73jc9aEGzjtfolta80Nd/46idXU6
	 oF2fCfGsMjS2xRVW18K+PRUfQIItNCgwdGrFOtMBZR36JBF0T9sBCBM66U7+4QZnV2
	 RUTwlptmxQ4vKBRiPdREdOKcH4bZRJ95zYFLSag0bCXWh0SYMegYicMqj5puyJYTAT
	 Ka8p1m7AIrTspEmlHBpPAAdga0T/8TBa7U/7Ygz9H6/n1T1iNW2atjwY9u5LlL/ox5
	 AGbjuvvmnY/QCZsm5eU5Z6DZQOTuaH0fYDMfTEOBzrrFe6W+8B/PMQ940qABk1uQ7F
	 ALfZz9e6o37jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEEC6614D2;
	Mon, 12 Jan 2026 08:18:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE4C312E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B088A4031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJdu8JrDGH4o for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:18:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B12BB4013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B12BB4013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B12BB4013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3DFF0A4C3EE8
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuV-000000003M6-32YH
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:53 +0100
Message-ID: <20260112080419.2516889-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205141;
 bh=1+6aQEUlxiEoO4FyW5AsWXfIbM4wXV7OfEaxXC8+U8M=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=u04HZTpqT2JmxlVpvFxnZOkkZ+resx1sQ1wAEzoLCO2APZUJiAe5K+NGcUIocZgnx
 oM1/P1OIHrlSwiXe8ch/XyU4hleS+7dyuNPSVBUEzNUv/lEcvf6r+pvGoc62rQNuIv
 DsczsxP/ZeaRTwZAzKa5AIaCJO1+ELLnuH3+Jkcb2dG5wK8jhz70EKWauEMp6n7LvE
 FP4zaSmgRz4T556MEuB3pJO5KWHxq0kBEE5Ou1duhO6+54IHg4dXXp+ifVJ/CsLJK6
 A5Q/ghxuuMMWr9DqgBY2yY8euJqsmgEdyT3/1LM9udt8o5ZOTK4tUH+KOwCNvUF33g
 5vdZpgPS78RWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=u04HZTpq
Subject: [Buildroot] [PATCH 018/104] package/x11r7/xapp_xgamma: bump version
 to 1.0.8
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

https://lists.x.org/archives/xorg-announce/2025-July/003620.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xgamma/xapp_xgamma.hash | 6 +++---
 package/x11r7/xapp_xgamma/xapp_xgamma.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.hash b/package/x11r7/xapp_xgamma/xapp_xgamma.hash
index 17efe0a975..675f624f14 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.hash
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003267.html
-sha256  1c79dae85a8953a15f4fe5c2895a033307b43b8613456c87ec47b374b113bc8f  xgamma-1.0.7.tar.xz
-sha512  9eeee9b537dcae9e4d153774eb632a6a5e8dd32bebadc9bbd897a773e5b56f76848f32a1699b8c921d3094760c42b5083365d853b89ab31fd85c7a0d46feeceb  xgamma-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-July/003620.html
+sha256  98f9f69e53a11c354a6637ea5c3d7699ceb5c5b1f8ad6f0a14d9931e5a10d079  xgamma-1.0.8.tar.xz
+sha512  edaa33fc18a9eb9e3bf5395ca0f6196778d0f8d8007e94ed53fc26de236bda51ee06a3eb8d0543a9e4367d3a350e7571664032e963001b7b6d525c27a3b3e8b6  xgamma-1.0.8.tar.xz
 # Locally computed
 sha256  78d354d348feaaab8d67a220e84137ec24fece04af4dface2e67132c72e216a2  COPYING
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
index f2e9e91efb..487da4398e 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XGAMMA_VERSION = 1.0.7
+XAPP_XGAMMA_VERSION = 1.0.8
 XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.xz
 XAPP_XGAMMA_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XGAMMA_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
