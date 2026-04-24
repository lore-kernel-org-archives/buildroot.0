Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AD1FED3CD
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F3DB427FA;
	Fri, 24 Apr 2026 13:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmvYpYDRGHv4; Fri, 24 Apr 2026 13:36:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BEBD427FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777037771;
	bh=sewubHCZc/QpC0LPdTkBHUFr3kgvlXGUtiUmYd7LBck=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZW4WAi0y7Dbnc6ARX1wTe/fFjqIU01lQnjC2x2QWIsBlPXb2qSY+MnNMQyIdjrKbq
	 oU3UW2iRywRkH1Z8hqF2qyktTkPvoLFLcqOTx8ml7yZYmzex64fgM7NsXpxWSH1nyP
	 6X3rUzxBY/9+QmCU4DKa4O3HEKArwGdet73YFbQq3bo5gQd8qL9OWLhbHDjoPzHyns
	 IZ/h2tV9kOj9YqLEFNGEgjyYFHig/qT1zQ0mJmACywayajSjGgQRqQrCf8y2NV1gyF
	 lpdJe+hvmt6HukJQP7ivE1XQV5BmWYU8Zdvl9reT/cO2kQnADNJg/IHDnr6mseDEwq
	 uB7b0/7xkudPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BEBD427FE;
	Fri, 24 Apr 2026 13:36:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D5DC724D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE2CC427EC
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZxhyiz8DklG for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:36:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C037427F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C037427F6
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C037427F6
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id F158F5834F0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:23:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 628363EC29;
 Fri, 24 Apr 2026 13:23:32 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 15:23:17 +0200
Message-Id: <20260424132326.825570-3-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Score: -100
X-GND-Cause: dmFkZTGTJ1hdEHfyIcX5k2JHGvQQzHgXocBueP6kzQ3PiO/QZPC2ZIbWos5Z/nBj+MNBUL6MxmPYi+CleSCkc3eF0q+zojS7XiQ0tRWeJ9sJTycu0tvaFaDe/0E7skwEzhHvE12DvsnHGm7ZBShzcHG0JImqeNvniTYvCpYkyWcJzBGbf684OOqsjoB9SoSWN/MejtPXP8EYC0FMHQCqaqK4lSjVECJMLrfhjizD9JSRHw6maluNA2H+8z2LH6STAgl2WvQ/7bYBIAqI1+5oIjDXgeJOanWJCHO9dj1fax29HojsaAabzQXmHeE8gAa/fBYFngk6l8UKsW92hkjl3zEw2kXXTjZzRq467KXaUoRW1krZBVrquMfRrJdAPkLF+86ygCL4FgOf1rkKPlxCJ5b7/+FmKGoREXdVbcaJny2HdyjyHhalU8pxPfk+H7XThmYLHHnFRgTkaz25oshj0G0Wht2L1cTMlP/6nKvWpRAoMHJP5rJMGDhAGk1gwE7KZrykufKT1OagqNXxiKOIntKcOq4yPdifm5xIb6D3spOAspFdh/jqKBEQ9gu9HCvUHbn1feYIJLZUyTz6xgW1lLDccK4R0Ec4JIpyVOW4lDUYnLy4NevjFVJAyTjwkgKLkS4Z98UjZhf9SAzf7uzPB1hrJd0kGo8lVnRsdZMU6249Lj843w
X-GND-State: clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1777037013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/XSw5oD7kPANsNgZdDQ5DyhHBb1F2pJvf2NxroHi+Tw=;
 b=GRtmbGJmZTDDP+V64MYr5sK1mgQ4wHMIiOATcs9lth1iA8k/4/RpoGhD26tKPSVNPjQPch
 MEarEg8ZVJuqgFNRcAFl5Wpv3oqJv/1/l3fUNauLSEpqosj1LG3XybE4QbVnmkW08QhOMa
 Fz0TNdX3CrbhSVeKcHsxK+RVLIATmyg5sPh8w9o+2PU6FAYB9LqU0Ry2sPWHEjyVsxszn1
 /oUR3xALLvZuIOKR9FArUhC9Z36l6lNgMhVFVCGGEummGRKoOdVaaSpwfZziTR796zK5cb
 XLz9/Tu8Y8IzaplaQay4Mh02qXs+kM6cekHI17Ar/8s33GXyCtVapl3ro/ytjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=GRtmbGJm
Subject: [Buildroot] [PATCH 02/11] package/gcc: force --with-arch=cf on m68k
 MCF5441x
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On m68k ColdFire V4e (MCF5441x) with BR2_USE_MMU selected, the
host-gcc build fails during the multilib pass because the compiler
cannot disambiguate between m68k and cf variants. It needs to be
configured explicitly with --with-arch=cf.

The natural place to wire this would be BR2_GCC_TARGET_ARCH="cf" in
arch/Config.in.m68k (as was attempted in an earlier v1 submission
[1], see the v1 review at [2]). That mechanism is however also
consumed by the external toolchain infrastructure: when
BR2_GCC_TARGET_ARCH is non-empty,
toolchain/toolchain-external/pkg-toolchain-external.mk unconditionally
adds -march=$(GCC_TARGET_ARCH) to TOOLCHAIN_EXTERNAL_CFLAGS and bakes
it into the toolchain wrapper as the default BR_ARCH.

This is fine as long as the value is a valid -march= argument, but
gcc m68k only accepts 68000/68010/68020/68030/68040/68060/cpu32/isaa
/isaaplus/isab/isac on the command line; "cf" is a valid --with-arch
value for configure, but not a valid -march. The result is that an
external toolchain user selecting BR2_m68k_cf5441x gets the wrapper
injecting -march=cf on every compile, which immediately fails with
"unrecognized argument in option '-march=cf'". This was confirmed by
consuming a Buildroot-generated cf5441x toolchain as external.

Instead, add the --with-arch=cf configure argument via Buildroot's
gcc packaging Makefile (package/gcc/gcc.mk), gated on
BR2_m68k_cf5441x. Only the internal host-gcc configure step picks
it up; BR2_GCC_TARGET_ARCH remains unset, so the external toolchain
infrastructure is untouched and external toolchain users are not
affected by this patch.

[1] https://lore.kernel.org/buildroot/20230629053130.3976-1-jeanmichel.hautbois@yoseli.org/
[2] https://lore.kernel.org/buildroot/20230704052449.GM2510@scaer/

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 package/gcc/gcc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ea96286c32..270a0638d9 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -220,6 +220,10 @@ endif
 ifneq ($(GCC_TARGET_ARCH),)
 HOST_GCC_COMMON_CONF_OPTS += --with-arch="$(GCC_TARGET_ARCH)"
 endif
+
+ifeq ($(BR2_m68k_cf5441x),y)
+HOST_GCC_COMMON_CONF_OPTS += --with-arch=cf
+endif
 ifneq ($(GCC_TARGET_ABI),)
 HOST_GCC_COMMON_CONF_OPTS += --with-abi="$(GCC_TARGET_ABI)"
 endif
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
