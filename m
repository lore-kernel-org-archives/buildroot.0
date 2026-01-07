Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2722D0D16E
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B882560AB6;
	Wed,  7 Jan 2026 20:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfyIm94DLNHx; Wed,  7 Jan 2026 20:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCE9A60AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816041;
	bh=hsLwDZ3lmz+YUyrYw/9VM7ZsMabmyJk/bJJyZR/FzmA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=XNMiYPGV7jubZBtH73CtCbvRDwSlMYiszlDxBrgeJ6MwxcGGHJHjpOa17qApIDAdP
	 OiqGGDe+ajOTYVZjUZlUEEVh5zc1mhRUV3NxOANf1HviHpq8ZEvct6cuSy9lp0NvsQ
	 k9/je5oXAE7cEC5ayX/FeMQOhnwnB76902re/E+YrmnHob8OgQEAtbQRK/U4wYkDnQ
	 8MvFYLAgyArjz5mF+fMkrj0uIraRBBuSlTmW6frnPRwPVmnfS5jyTdVebvN8X+6YhU
	 SdwWwaeHrmQPVU9CxAxuRVuYLsC0U3p62POEOlUZ9qP0k3N2kkcCDTw4n+rH6zo+DK
	 Tz8gj97QmvReg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCE9A60AD8;
	Wed,  7 Jan 2026 20:00:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0363A9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29A2082322
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6-nj-7pUsVO for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 128878231A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 128878231A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 128878231A
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:31 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so21704285e9.3
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816030; x=1768420830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aJW8zXZhjYAYfj556l1ifxHR1RRAxbb14Uk/axmKjJ0=;
 b=C/qwTTA7PrP4OKp+eRD1kXUoaDchye8AzQFkA6vMnKCtqIuS6M+1H0YgR0yRkQiVG4
 1cj++sQqYroFnZyy4CJ6XYvWS8Ftm1D91xdYuU9WHTMZuz/UdhHiWQDDz5dvIt3lQMqm
 EejZpIVAy2V4Ltbw1nctOVrhacs1SQqDVN+GjSPrUkz115sETWoZe7fH6qespCeo3NPp
 nfAnGosgQye93Et1Ec5U6uzVkc/laAD2o14LjIFJMsn+xGBPVxhk3d8p8fPXufrQHHF2
 jaTDrTXRd9n0ZMKgRoHCbtKk5pWkVCfcFamqew2h2g0a2CmZnT/5nO6V/vJnJrO17REj
 99uA==
X-Gm-Message-State: AOJu0Ywg0qdAeB21+G/QP79RtKjTL0k/rrHYQHmKS4n9P9gko+nyGfEg
 ZkmsL8Wcfw9xBiRPtngxD3MJJjftsSiXs89r9N5/gue05MU8SuXoHBJ4qEr4GRoxNgHSPpyFzRH
 bNivm1g==
X-Gm-Gg: AY/fxX7eBbll5Jdit216OMcBKrJ1NZr+VN7j+fKiknccBjnYkGpZUNrPDL+44DV0c6U
 oSziuUGMHQUK12gJZr5r7keLWDO8U4AoTDI/HBqvgYFhsM60/Gh9e9HdQjLvuSYTiTjSdrRO/+P
 107I9dxHxgPlTEgTzsfDT7n7L2HYoHjNPKKOFpExSJ3LNfTwXyiQ38+WXtKyNhhDDWSbD4HjEmv
 ZaD0H8ZNW6VaZETtBxixyVicQ0fwNM5gaIYMQAVrT1hQT4uSC7Dibmp/OKJNrZWEBU5508fMGM2
 W6dEUD8g5JVOn/S3a1WY7Pf87h3GlsJGOe5tQ6CSayUP+xv4PRhe+dPHTMjXEqkmkMlIk/VjgU9
 TMG4nLisHjoWw5J1259s2kig2LoM+UbLPWDGhsi//Da9Zr9Q1OGo1zuijFgkvfbXQ5AwE2vlDFr
 Rn8EKaYDfFiitVAk18dK0hNWlbSzeaXTU/Bdw=
X-Google-Smtp-Source: AGHT+IEc1O1lltqRbG7DO8oTB+SfqJcRU9Q9YClb9nLa0HTuOqDJD/wR7rdoDjGMu7ekSPX2YHSQrw==
X-Received: by 2002:a05:600c:8b57:b0:47d:586e:2fea with SMTP id
 5b1f17b1804b1-47d84b182a7mr46222565e9.15.1767816029632; 
 Wed, 07 Jan 2026 12:00:29 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:29 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 21:00:03 +0100
Message-ID: <20260107200004.665611-16-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816030; x=1768420830; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aJW8zXZhjYAYfj556l1ifxHR1RRAxbb14Uk/axmKjJ0=;
 b=Atx0SCzShpU1igPeKf5tL7Oszveuo2FisrDxNdP/BjdXjCQrxs9p6YXS7FGvo1rqhH
 Y+VVkwWqE6pS9d33pCKlnpkK/sO5/RjOQ5dr+wbjuGB4zIeIbFc6gGjgp6CsfomgLO1t
 YoX1Zev+zgZbmITDWegAUXfax0LthExtTd5LUurNs1k4qew39WUzqup+tdUEw/X213Nl
 xfbo+SNObjIqifYOKwx/XR3egvxxDEBgOWYwpAAlLu7SqYAp9eFFaI3kh7+ZwzQ/JZmj
 t6RIBMfVPZxjRjJi184Roazaxe63aWPJldEzS7jPD7edzwFqV8rIPcgrdqObp7Z/VajX
 iW8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Atx0SCzS
Subject: [Buildroot] [PATCH 16/16] package/perl-type-tiny: bump to version
 2.010001
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

diff LICENSE: update copyright years
    see https://metacpan.org/release/TOBYINK/Type-Tiny-2.010001/diff/TOBYINK/Type-Tiny-2.006000#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-type-tiny/perl-type-tiny.hash | 6 +++---
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index 5c97fbf96..9c4e1431e 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  afc902c6b56ab6320492cd09c689a940  Type-Tiny-2.006000.tar.gz
-sha256  4c685ebbba5145dc02944c305e8e82759811032a55e6da270a751b63b76500ea  Type-Tiny-2.006000.tar.gz
+md5  d2b1edaf0e2ba8a0e17dc5e0eadd92c1  Type-Tiny-2.010001.tar.gz
+sha256  cd583e4983039f35052d490f0c4439124ba667d4f09c4e3aec47de5200f9921a  Type-Tiny-2.010001.tar.gz
 
 # computed by scancpan
-sha256  80067f577fa565f34f833e302cac68ea1435f3863885540f94071ccd6d5e900d  LICENSE
+sha256  ca1cc40b3da7bebb1b0368764650ad38ac603b31a25fbc5b6f9fb217cc6fa1e8  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index a4c9cd267..b7077fb99 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 2.006000
+PERL_TYPE_TINY_VERSION = 2.010001
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
