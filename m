Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE79CD0D16F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE9E882360;
	Wed,  7 Jan 2026 20:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8U_euxUnuoHb; Wed,  7 Jan 2026 20:00:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1DA58220A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816036;
	bh=SOnnF96jvUxMYEwem7uVzbSvvAzM0mV/355CJ1qiEmM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=cZeyRpWSreesv7ctzEtVjRg5VydjY+cPg7QDNbdwI4MVUyjUwxkTS8x4/Xz+rZ4md
	 ey30dph9J8vReW00Y+44McBHiyIBVxMDJ5Bo11kSlEttyEvW6cHTClyzQcMOQ3T7tJ
	 OITTo0ygRqmdTX/Sk3g75q6Sr092EJdZTgvSgG/TbuhZq3WECd2RomLnFbdwvXz/jR
	 FaidfW7yE/MFKs7YnponkrPTpZPM9Q63DSxbSfoRRL9eshu7o6hsaQ4t3u1vWycR7h
	 UcFLrpb3hkOHj246FuA4r7pFJBeR897PtWcLl3fXgTsBbgWLHM2ED9WRvCaJY2p8Gd
	 wyc3JqQKEPntA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1DA58220A;
	Wed,  7 Jan 2026 20:00:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F21B9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 347DA82322
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42PJ4BAxJC-Q for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40F3382311
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40F3382311
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40F3382311
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so26263485e9.2
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816027; x=1768420827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LWD53hgNvevyH9w8FMlLGN/l0y0RcDDp9GbAvJcL2os=;
 b=AcHSUJctmDziLl5HYBn8paYnUa8/0z3gaRhrV+6T1nCvnmsrirn8HLFdqd5C2GgK2X
 UiCpY0ittgWEjwPZ53xSYWx2d+FkNLoBaR5VkhgrE64X1ZrMRSMECfW0khX6y0cy1Hsm
 72UpP0fAry+V4dMvu8qB3DKmA0QbsrngREuZJ/cS1nkeETwO1cHcZBORMFMZHANzcyuN
 0EVKj7p+cf+vdXakyCa/mcXMH3H1mM/G3/b/EutMcQMyJuBKpz8YGleGN8ai+Wr9cpTn
 El8BPBzWZy6ofAptO8eGZAsh0AoD4g8IpEu5lfsJ+sg+8LvXY+nWakUgC+6FlIWE6tu1
 fAYQ==
X-Gm-Message-State: AOJu0YwbU941f8/nvjjMDeIJzkzzGTOLuPSOD44CvEtddk1EVGOyMK4A
 oz0p4OFfjivCGCKUpTeemZUJEV9u8Zf8WzpHmsO7A3Y5di+ZCw8Ig7cFAMjYcF8E84Vt/4Fm5rq
 9LzA7cw==
X-Gm-Gg: AY/fxX460dmEIyaWTyxEpRVmGWi3fcgUxChNFv/4c+fYbBRV0xnBhiezNPfGg4GRiKc
 /9naCAbIjfQUiXgwXgGF7Spvv2fZTylfWEoNIkKsktNATxCdFTOBfeu/ugQBIqVKyROLNTFBIs4
 gKj1R5q3c3GV7vgwqZTkU7mTKWnvj9rg964p4sg9ugWuHmeKNpvzuSUppfJlyGvFDhmU9Xai/Ur
 10rDEM7rAs0RilgS6ofVX5PSITagGQnEytnYa8MHddQOHsGxVqXlhnkpG2tLYcYMZIe/ofSWXOb
 ES8YxHTWpmCIsqVvLCGpDEfwsSMV90ZDA7BQM2SGwuCkkjIETBwUSN5ZDpp21JlWwOglxeUB5OP
 ml5tj17nA2X/Qwjk0+tObFcWbwOsN/P0TsjU7of5yhn9Xr1tm7PDxmekY/zShqr2m5ittnN83tM
 lTQrSlI/5ecjBPBVaImhiQHLGW06QS5u23wo0=
X-Google-Smtp-Source: AGHT+IGJT5yjdrcWGugCGeIeKRVeEDv6qd7FD1pbL1pl3ASz3fyWI3KSFVu3xkz9IA09vsDU0QI5yw==
X-Received: by 2002:a05:600c:1f13:b0:477:98f7:2aec with SMTP id
 5b1f17b1804b1-47d84b086d7mr43127635e9.3.1767816026961; 
 Wed, 07 Jan 2026 12:00:26 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:26 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 20:59:59 +0100
Message-ID: <20260107200004.665611-12-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816027; x=1768420827; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWD53hgNvevyH9w8FMlLGN/l0y0RcDDp9GbAvJcL2os=;
 b=bT8DrOylZt5co4C14QAifil6Fn51xytLJNINMiZARrjEL39PSfBGDMOQpRqY+2pt9Y
 OusRNtUP4MY6axzbR5KdyYZTwokIkA7eRYEnCwBy9iMVmSPZ7ERL7uhPDpiL4agZ0QaF
 4o7aFkCN+BT5zcErTw4BXQZXL3Zcr4wFng3xIMm0qWA40U5khXSmLYvSvi6C78K4Mk/c
 m8glGK8M+QIkQUg1x3vXPphChBMQP0vy1lZw+9DU9XoRRo8moCpjRLw9siWaWLG8dXZ2
 Cmo6CL8NGGUwxwdxrwFG6k52HqgcR7i5cQhRUiz5y3zdCMeA4ONR9Ar5wQ90HHiWjCTe
 CuVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=bT8DrOyl
Subject: [Buildroot] [PATCH 12/16] package/perl-http-message: bump to
 version 7.01
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
    see https://metacpan.org/release/OALDERS/HTTP-Message-7.01/diff/OALDERS/HTTP-Message-7.00#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-message/perl-http-message.hash | 6 +++---
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index f733a5c91..aec6102ac 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  01b29ce55d79a774420bc768bb905354  HTTP-Message-7.00.tar.gz
-sha256  5afa95eb6ed1c632e81656201a2738e2c1bc6cbfae2f6d82728e2bb0b519c1dc  HTTP-Message-7.00.tar.gz
+md5  fc958d64205edb2c76e1673424523932  HTTP-Message-7.01.tar.gz
+sha256  82b79ce680251045c244ee059626fecbf98270bed1467f0175ff5ea91071437e  HTTP-Message-7.01.tar.gz
 
 # computed by scancpan
-sha256  553ecefc0ed6d4152809da8516960b9a12352c1c0d7d289ac4ab06d0bd0e67bb  LICENSE
+sha256  ad83c994e0d5899c09dcab1a45da14380f8f99afacbf383f759c05f8b8e21e60  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 6dfe61edf..13d6b458c 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 7.00
+PERL_HTTP_MESSAGE_VERSION = 7.01
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
