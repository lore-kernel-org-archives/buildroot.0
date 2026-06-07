Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE670CD8C8C
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 13:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D34061B4F;
	Sun,  7 Jun 2026 13:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t88Ol7Cj3T3I; Sun,  7 Jun 2026 13:02:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB0161553
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780837351;
	bh=FU5eYRFCGJGPztlUPorKzwkEZDFvuRR+4ZYIGs8ZSRI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MraZX9sy2ja+Yg7t1Hl6n++dWumS2uhZMIAIdPHLQHP/al8pjODVTskjeCVBYDI3v
	 p8hClYCY9jepQEGbseZw1a8EAHyXdrjWfhatTNMM3xrJKWkYtFSlQ7AV4ivp7v99eC
	 8fup3jcnLz7BbQjhhw1rdN/43kQlOl8A21ixQINbPzpBnsUx3eTjYpsFmKCDObc8B7
	 zdFkZ3Y1JZNIsmdX9pMm2oVEJRyekR5Ero4QQadTTPqTqX1jrbYTh1nxNfs1Xd3rki
	 w8ZxSyXNTqhJwQsXH82UpXVqaOqq0vtdq5aMY1bz7mI3PB2e5m5xuHLLiqW/nRFVCu
	 R8ayd8otX6E1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EB0161553;
	Sun,  7 Jun 2026 13:02:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04BB32C1
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E95FE40343
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6KRYRHnqEX3 for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 13:02:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0176140566
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0176140566
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0176140566
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 488903EC3E;
 Sun,  7 Jun 2026 13:02:24 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Sun,  7 Jun 2026 15:02:13 +0200
Message-Id: <20260607130219.1350128-3-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Score: -100
X-GND-Cause: dmFkZTFRhqEs39owfTS3yyHnWJ9Lt6x7FS6vqley54cUFmXidi7Nahg4IrVlTdJMEidAxH+FASgZ/AxkT13KWb9/Ttf5J5tMzsZ34UQTck2FdVAPLWCeNkKbFC3wMnkZw0jdR+kvqX3lGN9TDUPfS4pIiUZCeGYfGHLfJszX8SG8O6KZE1VCLudMmgy03Fz7/CQ4hxVAnPtfbpCth1B+Iauprajr2w6Iggy0WSqPlSxB3O0olInk4V5liPapM+pd+Gw/xhRi30sKSVGkDTCxR8yw6IBF1wz0TQek4yXYyhzQnDqoY5QzF7AXG4kHN8IDKMkO6qi7gK5HUm2wa7RgYFzFuOH/qDQzgHKbwv0toj5SiUV1NwBDCF1CW9+orUsLGG3cTINNH2RKHdYjxa5VKiVJxMeEzfOSXZDmu2IPZANInzBgPTar37aVX4V9DBf1ZtLm1cmIO0At3hXOz42HlIknbRi8BBvSpBDjPMqBIBh1lzPOCjKHhq/v0dVI+wc2zqXx6EVq48IQP/inH4McbLbddYpqqhZNqLvrbvVOnKC35NQ6Fn+BMjm6T8UVVYgr13hQyM4lBqPi2zagAwBKkbZ/fUlAT4d3H1OdsR6hfkbmZtJ3BKQKjHJonKsU/2v5l7ykimvNtdZApKW6v9gnlFLH6eVgHbeUHszavrIs0xrJV0JNew
X-GND-State: clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780837345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/FNt4WKwm2qln9clxqG2OpgyccYxRNEzKSlkoLu+4OY=;
 b=aYmWoJKe3Bgc/sAUNPMlxLdDHJpZKyJlEiq83iKtLdNSkuD1g8trAziL3Shd6jRH6popz9
 jvZlSBtu5A1fluYQY8IdAgq+2xw6spk+NFcM2MqoHzWkI3LqNbYDpr8qOQ9M0nDIcNwkML
 tv4TMJz1tcYF/wUJocgyWcKqKVMX3aJuGa5n+GTaGgz1w/5r88nbkMyzfZ82Tn31RXSxPK
 79VJw1sNcuEV+Vn0P3J782uCiPP8GjuP4W754fX9Y4XaQ4QIbYdE/NZRlRc+gSIkG1V3qr
 2OHQxng0ytxIge56r0ggNASLE+1Nh9zurDgRH70u/wuucSoxFhuB7jEkSAI6Yg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=aYmWoJKe
Subject: [Buildroot] [PATCH v2 2/8] package/pkg-meson.mk: restrict ColdFire
 b_staticpic workaround to 5208
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

b_staticpic was disabled for the whole ColdFire family in commit
e70fefa3b89d ("package/pkg-meson.mk: disable staticpic on Coldfire")
to work around a build failure: on ColdFire a -fPIC function whose body
exceeds the 16-bit PC-relative branch range cannot be assembled. The
only ColdFire core supported at the time (5208, a V2 / ISA_A core) has
no 32-bit PC-relative branch, so the assembler cannot widen the branch
and cannot fall back to an absolute jump under -fPIC ("Tried to convert
PC relative branch to absolute jump", see GCC PR 101971, closed as
invalid for exactly this reason).

This limitation only affects the ColdFire V2/V3 cores (ISA_A / ISA_A+).
The V4 and V4e cores (ISA_B / ISA_C, such as the MCF5441x) gained the
32-bit bra.l / bsr.l instructions and build position-independent code
without any issue, as verified with both gcc 14.3.0 and gcc 15.2.0.

Restrict the workaround to BR2_m68k_cf5208 so that newer ColdFire cores
keep b_staticpic enabled, which is required to link static internal
libraries into shared libraries (for example girepository-internals
into libgirepository in libglib2).

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes since v1:
 - New patch in v2: replaces the per-package b_staticpic override
   that was in the v1 libglib2 patch, restricted to the 5208
   (GCC PR 101971) instead of the whole ColdFire family.

 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index f2efbae2eb..a8400db974 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -164,7 +164,7 @@ define $(2)_CONFIGURE_CMDS
 		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf \
 		-Db_pie=false \
-		-Db_staticpic=$(if $(BR2_m68k_cf),false,true) \
+		-Db_staticpic=$(if $(BR2_m68k_cf5208),false,true) \
 		-Dstrip=false \
 		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
 		-Dbuild.cmake_prefix_path=$$(HOST_DIR)/lib/cmake \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
