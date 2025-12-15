Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734FFD5B876
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AC9581E45;
	Mon, 15 Dec 2025 22:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fpgjbT9U-1W; Mon, 15 Dec 2025 22:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 875EB8191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839534;
	bh=pKik6Z4Ntf8wYa/lctaTPFkzs9XiPBbAKzJEFOXoAM4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iipzo8YAZZ53xTfJTRJ4BRacmooERIkhAn9aQHXK7sl/og4PWtJpYgJxOht0StYth
	 ukTBSDBMIUc+dkAMWBJU2p/My9fQgO6JJrEJXSSGYZUdCKI6YLQgYUF4oSACf1Cp21
	 sRjr0G/XURhtG3wPYWJ8trN5VOtY+aWzRVHZNPqBORCHjnj4i1enwMNSqiHursPTCz
	 CPGoO4r45wyxTUOsh17Z9iLnbAdrDTZn+6GkzuMNgQUU+42HpTXuPcQTW1nZ53cAin
	 VLtbcX/dtq3RjKn/rqcRocyiiYUeXASKALFlgbuWN9Y2d20ygtDEjeqbQ+Ifo8kKp0
	 +5aysGKK0q4eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 875EB8191E;
	Mon, 15 Dec 2025 22:58:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37331151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C2D140B12
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x9AfsYGYnuFN for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:58:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E48040951
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E48040951
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E48040951
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:58:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D6D02C19D27
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:58:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 40BB760664;
 Mon, 15 Dec 2025 22:58:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BDFF9119429FB; Mon, 15 Dec 2025 23:58:45 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Mon, 15 Dec 2025 23:58:36 +0100
Message-ID: <20251215225837.1257574-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215225837.1257574-1-thomas.petazzoni@bootlin.com>
References: <20251215225837.1257574-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765839526; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=qXCFwK+yQ4Ft+QAs6h77niC5hR0s5TujeN0tlWa34OA=;
 b=NTXFG05vChlYFeOxRHf8XWVew7IMj0dxGTENVZSwh60Nu+xLc24k1ihPDp0/CJ1aE8dsai
 g6J09mfx4w+3p9qo0TqHeVaOa98gJ2l29fha2WgnglALbMdjwa/vJhtFEBRW01f8+t4Qds
 sEWU6Q+oFs7HUzlaEaF5ZysHG38bcom2GXfJQP7+58i89oprwH/wjqgSywHS7+pU2OdjDI
 ldxLudLpCwPGBFwgbJzJX5k0HI5cQwRrHHYIDooZhwYYR/bRTFX0WOBesJttpdl7hcB05B
 ADlSppIglMpvKqw2CG1VLb8a4neNy3gD2wkMzINM1grMsxldeXqitacc3s2+hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=NTXFG05v
Subject: [Buildroot] [PATCH 2/2] package/sway: properly propagate wlroots
 dependencies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 00fb3a57cbaedb8df43f75f0e891423c1ef7d8c6 added a wlroots ->
libgbm dependency, but forgot to propagate it to package/sway.

Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sway/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 1f4b497af3..1e4c8bfd3e 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_SWAY
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
 	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
+	depends on BR2_PACKAGE_HAS_LIBGBM # wlroots
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, pango
 	depends on BR2_USE_WCHAR # pango
@@ -53,11 +54,12 @@ config BR2_PACKAGE_SWAY_SWAYNAG
 
 endif # BR2_PACKAGE_SWAY
 
-comment "sway needs systemd, udev, EGL and OpenGL ES support"
+comment "sway needs systemd, udev, EGL, OpenGL ES and GBM support"
 	depends on !BR2_PACKAGE_SYSTEMD || \
 		!BR2_PACKAGE_HAS_UDEV || \
 		!BR2_PACKAGE_HAS_LIBEGL || \
-		!BR2_PACKAGE_HAS_LIBGLES
+		!BR2_PACKAGE_HAS_LIBGLES || \
+		!BR2_PACKAGE_HAS_LIBGBM
 
 comment "sway needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
