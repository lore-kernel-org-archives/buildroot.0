Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60839CC6B2A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 14:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17D4980E44;
	Wed, 14 Oct 2026 14:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRVxtF4OlVRM; Wed, 14 Oct 2026 14:20:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1D18380E31
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791987607;
	b=HmfvnA6bJF/Uktxs7ewqpEgcwgPmi0cNb7qm02s/o9T9YDdIji1Qgo2If4vs+SdCsBcf
	 WWNAzqWjfO1K7GCQG2tUVFBP5F2tLSn6xSdPbYixak8kCV0I34ISgnqnkf/kucjABz6Vp
	 04ylwvukyiLoSS78tNzoyQE1Kx6jXxVcfVlPkvfS3WqxwPl2s6rIR67xZ004jlXPQyG3i
	 5b/fNM9xI2T4RrQ54ZQYFmpErnYQQ0yIh3yBfOstAU4D9mwcM+Z8hFQcgqguIKhqMZiKY
	 sdKthOo284Rjc/9a8GLXMF6M6bwWq3W5de9yMaDy7nC62COrrwN2TO8Y20E+fQ+Eqhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791987607;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uAi0EG0GBrhwaNIEBEAK0wjBcn0vSCp5J9kau3p4MKY=;
	b=rFQs21NWw439otSVzB0j/XnUQfQ3TWjlqaODxv2YTm1BUO4+sXIyjVId3+lAdawO7unL
	 y50xQk9USgcBrIHwbbLWMIeQpjZnpHVz9VcRMkWvoyXPUG8ksmGUaD8h6RcsbrzO44QP0
	 6sC01yd3DW3USiP7uEh/SaWYIbCkuPshPbVMCr4gv04ADnyzxWD0j3TdGkb1r+Rl34Wfv
	 TkbiqXtDLYrSeTiF+bv+y9p5jgrAmxSNPA2v5xiZ4Y7yfS37RyqY+crBzkkYuy3L1uAEX
	 DL2rxgfl4C32/B18m7LkiIgK8w1Ml9Memiz/lKZWyw1brv2p6yCgOAIxPAHFOCpEugw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791987607;
	bh=uAi0EG0GBrhwaNIEBEAK0wjBcn0vSCp5J9kau3p4MKY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Qk1Y5iwPttgL+Rtc+/QtDkIFGHovs+wFDpB+ZG3yTmEF8UxZJBg2FF59SXBmMu8iY
	 7xhk7xkUstbIPI1zoBex4LOh2hNUtjo7SKUNSAwbQ5a7X0Et5YOld14r6/xBgbNNzh
	 z+Y8FxYM1VtCUzDZTucriC4aTig9NM75bystQqzcwIAaXJUw5bBkGQX6wKZx71UMIY
	 0ckY/DyY8gq5xG6WyuQ7Vje862qlPlorPO9RTjOUqqBa+jrXMCN5kCtzMwtLLQ8Fum
	 W9OembJz8WtuF8Ngq1z/bUQN/Ppu4uiVxe6V7kq8/Tgys2oSOe6L3DGENs75K2pe2/
	 vlQzBsjnAvBdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D18380E31;
	Wed, 14 Oct 2026 14:20:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AD982A8
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97D6C60818
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKByJqZ9PpQj for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 14:20:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 20D1E607C3
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791987603;
 b=I9iVS2aFhy4DtWjnMEgoq6WWuKr2aU626xfMU1I3I4V4s3ydy/2DxMJk0RNKlASQldd8
 Vavv55RUJ4tnSnCnbYrS+Q0EqGwlUUuAU5IOfrVbSa5XlGrR91QTNuahfF/HE1SyjE8Dk
 M54lxZQi7BAAeVmpPDWxpJzdKjL0Ij4C27rHl88Pid0Ui3G2pmYbunFG4cqQbT9RwLtJm
 fwWmtuVBee1zinv/Y7lXMH3qavDp/uapNn0743gdKXMlGCDVTU69Fx1EIvForXYgCNMG6
 IdEV/2gIyjqLSbPAd74n0a0Fm/Ccj5P9Ms59tm0HrKuTg8iE6ZI+vpTD+TDY8s+mgaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791987603;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=6ewmdmIgXkPn33q7LU02n1NmgrxyfKCmA9xGhiC1oTA=;
 b=bHX307uAOmZxCc0GETg6y6+4O5w8kyEJoIAkx0d5W+buPQjl+Dn/08hKI4urEiTJg2oa
 /b5ZpAIggHNgf2x4COxuH1yV43uNJXBKmnE2vdateNDOcWv95mhqoZJPoHu439fP0HnaY
 F4IPbRG0gbQzRpchjl5L7MLUTRpAkdyFOI456d3JcDjA17SP6F2VswjlbajBAHTR37zL+
 4H1H55UOR2TBh78AQSqwQ7Z1ZM9fNKT80jypljAERYdXIjyhNgDw/okpTjcCTLFAsBiIC
 nXbxv5If/0A1s7tAve0JnuBYDEuIHAgAn/+6wZiWThyKYJtNG+1NKIavolpLKL8wrQQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=O17zW+9G; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=O17zW+9G
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20D1E607C3
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:20:01 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c2e8c710847so520133466b.0
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1791987599; x=1792592399; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6ewmdmIgXkPn33q7LU02n1NmgrxyfKCmA9xGhiC1oTA=;
 b=O17zW+9GQJqxUpHFWniG4E9I5nN/t+rtxGv4dOBWfhUJLMpv4JcGsfVCE6kpBvM6Rt
 +0KGugj6AabTRGaJ0xr7dzsj/BVxsKpnB48Q4zrVwKwDrbEf9hjqWvbqdC288xRpmP5a
 QDPXH8od5Co+R8Wq13c4R85NerfeVUYeA/rpqE4A+fAtB1JdyL5aKxd3X69X7TZJ12Ee
 51FSocMEmG2p34B1btfnCAVBykdLC3oIEdj2FG25l+hrocegF8Bk1EtinOKiYJi3yGei
 9hLbuFq/Q/YvwhsdNlK9JGF9MvQY2QXC3oVCc6vUQdklzqL3JhdRRW6NUrOd53+hZQUW
 l3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791987599; x=1792592399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6ewmdmIgXkPn33q7LU02n1NmgrxyfKCmA9xGhiC1oTA=;
 b=1I3iGRxeScYVLjvGMYS2+1DzYf7ahDEXq9Tycg7UCGa+iShZAjRdmK4OnGwC9t8RgH
 LY/r1SCBzPAGTWDlS2sxKtpL41xY6RU9Bb4dAsKIPQWpyYLOMalRmSD1va4toBtD2ce4
 nQUSzv16Yg93q26SSC50QD2rrCihYZ0CmhstFkRMW6w4E6cv7GBdbcJWygDmwdaUDiJP
 kI2bklCxWlztq3lvWQCbbk5Kgp24UZ+Qw5NSeq/1h5wps0br8FVg2HrJUu3mwBwD5kLq
 O2oPmojnTCUoizlPbMJlo/TRsrgsliP4Lb4gEnSoNO+fDNA4DgA6lZiOTtzQu+hPV1i5
 ct8g==
X-Gm-Message-State: AFq9FYJJ5h2jux2+cfvP3NZ60hg2L4fJzZVIbZFFRK66xhiPJFlBW4LB
 47oyMf+se+BbNk+1EBDb3FfPNInkGoeXAJ6C//oY742uN0iK+AhutEMdtkxfKQ==
X-Gm-Gg: AYBFou0JBE5lYCBWJTxdE0CheAv5iJs9K+UWpcK6UG0amN6YllHKywr6JZ5pGrYkHMS
 nzgybgH6aAqBe6ZVPhpjRsA/jcw/xPMTawlrUSDHQm6VJFj1EMCAlNyPXK0RX9NrMJaOPCjvotE
 bixz9kOUxdFerHHtmV9fVsetcM0x5T7WJ1uyKOBIkfJK/HI1Ed8TUfRSnAwqOJ+1DKHFYYwlXy8
 LegNTrdA9kB+tcChbmiExn1GznViXmZH4X0cUsB+U6cBYClWllkG+odglJUKxwae4NI8YDQAbZh
 Eq7ADyd6mVcQxOwCv2K6DF46k7VDGGtblpGEaLvWSfhb2PHTs+OSdJthj0pmP9zUUtCSILVGig2
 i9R9JbewlKxZpgLSjHsc4LBAHp73AnUUP9ug17wJjD5S0OFl+/kZoHdDLXKsJbY1YOnk+DLK5Nl
 o1BIN+/5I6wmq6MrBCP5nikbnLWzPrmw9o7Ykto5yt/kiS+LTawisCLSSLnwmEvuHCB4mBTnz9C
 hkUOvImfZyV3NmJPH0HtWe+lEz3jmsaPzFA2A5kaawZHOY=
X-Received: by 2002:a17:907:7fa0:b0:c29:4490:50d6 with SMTP id
 a640c23a62f3a-c31aa022de1mr1436522966b.47.1791987599281; 
 Wed, 14 Oct 2026 07:19:59 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31a9a3ae9fsm703301866b.26.2026.10.14.07.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 07:19:58 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 16:19:57 +0200
Message-Id: <20261014141957.4171446-2-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014141957.4171446-1-yegorslists@gmail.com>
References: <20261014141957.4171446-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/shairport-sync: bump to version 5.6
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Release notes:
https://github.com/mikebrady/shairport-sync/releases/tag/5.6

This version adds support for Mbed TLS 4.x.

Classic AirPlay now needs an ALAC decoder to be selected. FFmpeg is
enabled by default, and the bundled Hammerton decoder, which older
versions always used, is now optional. Use FFmpeg if it is available
and fall back to the Hammerton decoder otherwise, so that existing
configurations keep building.

AirPlay 2 support now needs plistutil on the host, so depend on
host-libplist.

The LICENSES file now also lists the bundled FFTConvolver (MIT) and
pair_ap (MIT, BSD-3-Clause) code, and other copyright notices were
updated.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 package/shairport-sync/shairport-sync.hash |  4 ++--
 package/shairport-sync/shairport-sync.mk   | 16 +++++++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index dc7c7eee5b..1eafe03b53 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a1242d100b61fe1fffbbf706e919ed51d6a341c9fb8293fb42046e32ae2b3338  shairport-sync-4.3.7.tar.gz
-sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
+sha256  20271e220e859b8f60a707597187564d3bda7dbf69dd61aa1357ec1656285246  shairport-sync-5.6.tar.gz
+sha256  5ffb12379c3293e48010d0ed04185940e107b54e48b520d58d847da53a153c33  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index a792e461ef..7fd1a23eb3 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 4.3.7
+SHAIRPORT_SYNC_VERSION = 5.6
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
@@ -54,13 +54,23 @@ SHAIRPORT_SYNC_CONF_OPTS += --without-convolution
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_AIRPLAY2),y)
-# host-vim needed for xxd
-SHAIRPORT_SYNC_DEPENDENCIES += libplist libsodium libgcrypt ffmpeg util-linux host-vim
+# host-libplist needed for plistutil, host-vim needed for xxd
+SHAIRPORT_SYNC_DEPENDENCIES += libplist libsodium libgcrypt ffmpeg util-linux \
+	host-libplist host-vim
 SHAIRPORT_SYNC_CONF_OPTS += --with-airplay-2
 else
 SHAIRPORT_SYNC_CONF_OPTS += --without-airplay-2
 endif
 
+# Classic AirPlay needs an ALAC decoder: FFmpeg if available, otherwise
+# the bundled Hammerton decoder (always built in before 5.6).
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+SHAIRPORT_SYNC_DEPENDENCIES += ffmpeg
+SHAIRPORT_SYNC_CONF_OPTS += --with-ffmpeg --without-hammerton
+else
+SHAIRPORT_SYNC_CONF_OPTS += --without-ffmpeg --with-hammerton
+endif
+
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_DBUS),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libglib2
 SHAIRPORT_SYNC_CONF_OPTS += --with-dbus-interface --with-mpris-interface
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
