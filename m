Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0317DD0D170
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCC4740A7B;
	Wed,  7 Jan 2026 20:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvwaxjGAxO-8; Wed,  7 Jan 2026 20:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB76840A51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816035;
	bh=PEouMCalTcd9vXpwHwSbwlU/HiZPphQuzoXXbLSyO5g=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=k2ih5QwudLeDcbItdlhQb+elLrfnfU+JLb2bEz0vIWjKR0hMj/+1Bkl6R1O4vw9CK
	 zpmTCu90hXIQcorVt8N3Jcmxm9GdTvun1fWe4tyuKDdWOUiw+RLgjiwCTIrxwFGnuj
	 PNCFegPVeUQQrllGxyGD3NXkCBLGDLwxO15tSB/v44X4QW3r05P2lxa/8sl18tX4Qs
	 H1YtloTJ6aXp1SyntjSMSeNoR4NJt4TU7g2oNstMKxYcKLKp/qgPc8ulOARxMAbJrA
	 P4VOeHNBgv0QwhBpFvG43k7CCKT9K6ONQ2Dr/t7LX2gUXgILnlFyPGQ52TEvWRJ34O
	 8KwJBNNP+akJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB76840A51;
	Wed,  7 Jan 2026 20:00:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DD7225B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB71F8231A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WA2npIMSISpd for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4F978231F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4F978231F
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4F978231F
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477632d9326so15173165e9.1
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816027; x=1768420827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9DdZxTBIM300T+uIoyLR4/VjRi322MN++mN0oBTxouI=;
 b=xO9dk81J36oryoP6EwbqgFgPd0I6wXp8IOJ9LMuPtL9cUr+5XVr5VVqlxn1JWui/3S
 wQnyS0/gBkjYfv5ENGlSeKik56eHZvBqyiS/43mqcjnWJMPitgpgOaeZX2jP/cvxlJX/
 BwOKj4zWdVtSKd7mplLZq2zItEzC0/s/tQe0uS5ae00Il8rfmUkVlPq4n7ZhPzDCnMa+
 IWE314gNIPM86hl/h8DD7Que6D8p3wgPY+9GKiIhBQPQnBT0sZtdvqP78IRzHIt3SEdj
 O4wraYV9dkf0cieIcEQZag4MvTx0hnlgmjg1QL/7HvSg1bREbdPNkOxeOQvjiKneLMpL
 4Z7A==
X-Gm-Message-State: AOJu0YwfWtOX00yld0LRxnQBrAODTzlmxB6RgipIkmpD5wO/Fv8Qpvro
 GzNM9BydTd0TzKA47W7n7dfVg/eOqZKh5Iv53icpvFFzmHScDXKQ/ivl6XSkyt78A69qgYB8t1Y
 pQ+QTUQ==
X-Gm-Gg: AY/fxX6gXn0RbSgMSydYaDxod4LYrKQGgB8SHyVrn05xWUHvM1UfiRW/NICX7Ep3xMc
 OPNkXTZrT+zdvB1pVZhPzwAYzhc1Nt908LJCKfxFAYHcPNwmeTO7q0DjaYiFBAeDZSb5swxFo5D
 o0GAQH3OTAypZvEYYaDKQuvJwLro8q9TEBoSz30Sbi1CW4yNXgUDXELjRnZrm3V9dS5JGXSnh3/
 lA4Al9GLkhFgtsTLROJxyw6n+POauCGigePyBZ7iA46FYzaq5/1w950s0inEpjrR3t+VNIpv67I
 3h5sIgqz1UuSWszG5N5ioFR6GYqBN8mB9afZATGumjgnmm8z7gBJuyZNxI7NwOlBJJgp1qndlzF
 harMMFXgqbnZsZw6i5KpZR1nUydf+to1gwIQ2ZMGU83Ux5DwoTH4H4akRoq8/aO5UrKq2d0GhYH
 HqTe9PoMRDtbzENge9DFHukq15UM66yjRJJ8Q=
X-Google-Smtp-Source: AGHT+IHvUnp92MqE82S75qI3SpnDk3TdUQ3nUN2rwClAVtnnG+9VnLoRKzeX/2AVVK6Qy/NIaBknGQ==
X-Received: by 2002:a05:600c:630f:b0:477:7a87:48d1 with SMTP id
 5b1f17b1804b1-47d84b3b4d7mr44851745e9.30.1767816026323; 
 Wed, 07 Jan 2026 12:00:26 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:26 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 20:59:58 +0100
Message-ID: <20260107200004.665611-11-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816027; x=1768420827; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9DdZxTBIM300T+uIoyLR4/VjRi322MN++mN0oBTxouI=;
 b=QHffovRTWPsx1B3MmswsYb4YBiURLezovDcZ8GVsiWVqK3yoGl05BTGgzxbdLxnLxI
 rGsBZ6b93bhcb14RQY4eMyf6vu/p8y+Mn0CbQjFTQ9o5vXJdVj93Okck0IBuEO2GZQ/K
 rrNAtaGuzK3EV6ZwTnXFG6EiLjR5H/NYoRD5ozVsLBQT5RF/ozZ9GsBdmgFaXVpR6ji1
 oaNYO7LQ6JPfx5vrrJz1DVOn5ZMFtebgYX/MMsgGhRZ141sgc47kTldTjB9MYjpwsHvP
 1lux/BuaS+PkycFiNTNe5l3wJaqweVJK7A7OdfgMHE8W87JIoXeHeJRoo1Dvz6WgcVlz
 /ptA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=QHffovRT
Subject: [Buildroot] [PATCH 11/16] package/perl-extutils-installpaths: bump
 to version 0.015
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff LICENSE: minor cleanup
    see https://metacpan.org/release/LEONT/ExtUtils-InstallPaths-0.015/diff/LEONT/ExtUtils-InstallPaths-0.014#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-extutils-installpaths.hash                         | 6 +++---
 .../perl-extutils-installpaths.mk                           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
index 9838345b6..6bb98325b 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  34fb12d1b245e44142846c72905beffc  ExtUtils-InstallPaths-0.014.tar.gz
-sha256  ae65d20cc3c7e14b3cd790915c84510f82dfb37a4c9b88aa74b2e843af417d01  ExtUtils-InstallPaths-0.014.tar.gz
+md5  70f17a346e92560b5f5692119edbb161  ExtUtils-InstallPaths-0.015.tar.gz
+sha256  7d64eb2dfa87ead010cdf55c8a1bdfde50b7b5852d7cb8cf2304f55bea2eb007  ExtUtils-InstallPaths-0.015.tar.gz
 
 # computed by scancpan
-sha256  bddd4809100e5b59fa3b029b2cd303d6384cff751c3898d53827777181a9aabd  LICENSE
+sha256  78b39d4fa3804c0fa0f1e85eb7397e8023d5589d4f15e942586eb83c5ac586e5  LICENSE
diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
index 31727194d..16cb77c17 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.014
+PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.015
 PERL_EXTUTILS_INSTALLPATHS_SOURCE = ExtUtils-InstallPaths-$(PERL_EXTUTILS_INSTALLPATHS_VERSION).tar.gz
 PERL_EXTUTILS_INSTALLPATHS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_EXTUTILS_INSTALLPATHS_DEPENDENCIES = host-perl-extutils-config
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
