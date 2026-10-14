Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82913CC6B2E
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 21:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23FD9608E4;
	Wed, 14 Oct 2026 21:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhY-ECp1xlEC; Wed, 14 Oct 2026 21:42:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A92BC608D9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792014136;
	b=OJTELz/xa4iE1a8X4KwpoCjk7ApXB5zVZ3ogdw3hXZjyYpRuGtiAyv7EyNjjcs6FLhd/
	 4a5G9SUL9f9zDHv4tvp0km+3OiO6jDE/XZ3sqUy/w3c7FmSzHtejKRMugdKaiTxGMdlZJ
	 pz3U1mT1PwLGFS4LGsiRDYmkFDTBwoc34YK08ahaNlaQAWdx5j7wG/G0IToxZkmidrKyW
	 yLeHU5LPSfQKGMD5be0fj++KAtOKRc/7NCvgL6gw6io81TsnvNWjAO1SvEHbW8JgZ0FeE
	 bn04mgEe5dH6KemdSAdJ8cwG+owZxxLZQCZVxs6sDa5tstNQlrMVePH4t9iiAg8sQWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792014136;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=toresx5J1nZ1kKt7373PzyHQNEJQJhKaKga+DY2PAk8=;
	b=qNUa5FcrYUKI0pNHxVyOqDNdcVvkDatbUDxayjq4SG9Ph9YZfJeKbXxxUWYyjUo+DcUJ
	 x2ABkeEaQszZgYFsnKpHrYH0hKSQWbLKiS0qcw3OI/bkviVswOeuwmJdt3gSS0/aOwijQ
	 1O2RpdFKLzMQY1L2eNQHeYinao2NGRk3x7N28TyVucRwb2NKKU78NmSK/ocGeHdXcKD58
	 tWQCV89oD+jOdzJR/aGBrJjcOAbMfmOHkOK/TmauGja++amKC3ZOL/pB5bEo7GVJ23maf
	 JiTGMxvuYT1C2DyraO3m7wcnuSj/j4fRJXRuQUfvrgm5lcPPZg5wQV6uU8AjZZvAfNw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792014136;
	bh=toresx5J1nZ1kKt7373PzyHQNEJQJhKaKga+DY2PAk8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ArbHzpkEiLvm7spH5bTPIWfReprUMYwvnQJv5AU3nwoRLDiuehqF1heexQhOitYEc
	 w3RRVnlXlVdzviP33INb0gRUKZGN9broIVSvbMs0zsVc9jdWs7nqgF9ZonsK335Lga
	 cPEDO7m5bQpB6nrlguBiI8CQIzhYH/IovdBQkN6Ck91IgO/tEA3OCcUUk+SvfNafQD
	 WP1vQFMVu+jSWZ/2Nr/BVZcu0fXmv7rV6/TOuzF6NJIH0snqsjSpvd1dMe0kpVEb4r
	 kRMbq3jPUgGvSnOUT5v0pdMdewYOxhmp7AnWJCKrwZQlY+ORwgkqw9O8DR2Migqi3z
	 pHLt/DkfVIKwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A92BC608D9;
	Wed, 14 Oct 2026 21:42:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 509262AC
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36AC180E26
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zM1wLZX6xlWl for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 21:42:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9D3DC80E24
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792014133;
 b=dSExhAcEWOOkszTn/DbIgg9dnLjLLelm0tqFc0bCiHsqyHlegDYyeZjxP1sDDPXQ+3ac
 552kqSZZpGiXRfhAVM3MGWz0SpioSL4DN5MupEm4/aTfUnXKP4db8W+HLKvueO3N9DcG9
 p9rQUVl0T+xngdQ+T1UTiUxqMKc71PTo6OXIHWQXO1EkW7WSvl5MbymEJTxymkLvHZw47
 pBR9o3fMD7i0XdgwAsibK1jqF2VatCl1KV0bEC1ITSZG5x0wI/R+6g0ANACzhuf+4xhkN
 q9xNiSfwKbgMtmIusaf8pwX+RL6n8/bVWPEPpR+P3WhUL21AyOcxI3x4zhq/zRl5PMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792014133;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=goX/EqGNLCrRcuwEOLkZrnTCVBooxQnGqPd6ACE56ro=;
 b=CwW3uozSl7u2WXT8jnlPvMGhIbXr5yKSfETbwxkuEyat+82v0TUZYTSYFH+k0Zfqh/Yu
 VlTHBaYmf8tXYGPsGjBx2zXOqrgbBmoKWhig5CP8hHNIfWpB+FAuOvFcgXIsthumRbj/B
 FjAXvUgLQnknsy+LwuhKnHFsBE2MoSlFiqViljUoVdpPhD7oayABBG+YisvKLiqsCMOtV
 3qPTiWj3TqiktnyR5bkT+/b/MhJ4evYppIjZdcUxXCaQ+zCT8lmdxSpJO0QgPnc4dswOG
 P6OiRu29tJ3+GL+hGlxh0SkWGpUNFeaO/yr2ftWQMA+vFtmfIcLOmjrunDTNvxPbAYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QxFQbN6V; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D3DC80E24
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:42:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5E5DD4E41239
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:42:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2D30D60368;
 Wed, 14 Oct 2026 21:42:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 657DA10328930; 
 Wed, 14 Oct 2026 23:42:06 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Wed, 14 Oct 2026 23:41:56 +0200
Message-ID: <20261014214158.535942-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014214158.535942-1-thomas.petazzoni@bootlin.com>
References: <20261014214158.535942-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/podman: propagate missing
 dependency inherited from shadow
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

BR2_PACKAGE_PODMAN selects BR2_PACKAGE_SHADOW, but forgot to propagate
its !BR2_STATIC_LIBS dependency. This commit fixes this inconsistency.

We also propagate it to the only reverse dependency of podman, which
is mender-update-modules.

Fixes: ebbaac08e3f462bf023c12077f739ed1c0543eb2 ("package/podman: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-update-modules/Config.in | 6 ++++--
 package/podman/Config.in                | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index cf2929dc69..4c60aece14 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -136,6 +136,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # podman
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # podman
 	depends on BR2_USE_WCHAR  # podman
+	depends on !BR2_STATIC_LIBS # podman
 	select BR2_PACKAGE_JQ # runtime
 	select BR2_PACKAGE_PODMAN
 	help
@@ -151,7 +152,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/podman
 
-comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
+comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
@@ -160,7 +161,8 @@ comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR
+		|| !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS
 
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT
 	bool "reboot"
diff --git a/package/podman/Config.in b/package/podman/Config.in
index a8c625c5b1..2f20f77507 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_PODMAN
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # shadow
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon
 	depends on BR2_USE_WCHAR  # conmon
+	depends on !BR2_STATIC_LIBS # shadow
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_CA_CERTIFICATES  # runtime
 	select BR2_PACKAGE_CGROUPFS_V2_MOUNT if !BR2_PACKAGE_CGROUPFS_MOUNT && !BR2_INIT_SYSTEMD  # runtime
@@ -89,7 +90,7 @@ endchoice
 
 endif
 
-comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
+comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
@@ -98,4 +99,5 @@ comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR
+		|| !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
