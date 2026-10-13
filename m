Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB69CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2A1660751;
	Tue, 13 Oct 2026 09:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOkYfwR5DVmz; Tue, 13 Oct 2026 09:43:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A87F460794
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884595;
	b=YlA2KfCmzDbtNNnVJtV/uYab9eele3bwk2CEDn8kdLIBwLtFulvh+5yLR2JrSg6nhXLk
	 wyxxrpZ32xV2wo+nZ4LOOoUrx4eHVM6ZfcUSdxfJhnw7mAG0RkdiKtDbIxQP5B0mXhIpv
	 R4GNOACVZSTrFSZ8Pef5tmMHzizobnCsP/4z6JVmpUi43BNre+d5wUkvi73bvvihVf2Y/
	 gxnk1VIxZ/ZClX/H5n/ERXVjQle8fJEV385+4YhfoUkB2R9YDJuMv4aXA3KR/g/S9cDqq
	 IDFMaP2Lw4UA2qcsunFt+L4aJNo8CcmYK0L4YSbwRQwzHj7L01LaUQP8YFzi8k+jDKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884595;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=7iSNq1Giffbbs0ZklbUk2JlACMMk+6uKEBywQG5vIUc=;
	b=HegUaoL4e+ADoc8VN5ZSj/JFa2mHGWlD3973akRt+CE6RSGb8k6s4Pnm4rcBCFCzTtpD
	 jOFLJ0RF+etcwMpWDnBfhk+m4wWhh+o+V3BwVuWKsSIK0mv4fi5b0fio3+9AMgaZcAt3t
	 R81+JadJvMBc8TRKv8vTGAjI0FKzXci4WeF8dXNN7XD+xKyOZJOttTrYCvZ3VZjW1SMkP
	 3JbiMlODz+IIrdAC4g3n5L7vTl4EgVxg9ddu1/G0vIuDC7WzWppgRShaqP9WAvceA7ly4
	 ThVVQQGUYBrJuW2pFyIHlSJaDhJWNKPEXAuXMe2OPhWMx+a5pixdq+zHq1MGi5zQ8ug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884595;
	bh=7iSNq1Giffbbs0ZklbUk2JlACMMk+6uKEBywQG5vIUc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ltRYKwSh297CYrljOecfMfX1bmLZm4FsCdh7OaSsK2T5Qp4hf9g6oyHgXleN1lbsl
	 TiPA6djULwiBYrw4gBfKzS2UpAUNoLYt7K8oh5KLDT0RfxIMv5QraO7AHchJr1RuOY
	 tEOWisfE6Y522qwYCBloojTROLBQKksy17IVmI2E/MozwJTTRaCHuANxY+LpXyh63d
	 GOuk9Tl7LaW5iqconW07UZt/jIAmM95vC/5vbbOLU3PFw801Uo5zfnSTdylV57ycZQ
	 mlyA+/mffJ0vEpLzbN9sGEiJS8BfrdxP5K77qsRSxtPdpiHsvauVoIj7dBYEq8liHc
	 MzReOUqem6bTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A87F460794;
	Tue, 13 Oct 2026 09:43:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97C5D75
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DB7680C72
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7SMm9WKI0VF for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 65BDF80C8F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884584;
 b=GJvYiO5fdsS6jYwhnAGd8mLeAGakdP2M0VzoI8L3wQTsMBQjVxzVh9rvU8Yh13TVWjcm
 +Y0rW4gUwf1+69eqL6n05pdhjIFBUTnLpzJq+tVQXdwtdvfH74s4W1GJTlXRWPr6q6vZM
 A6E+muF5TUU2XIau/e6378KPa8657FlO20d3Ny9nv4HP83zWCWPGa7yphw0Hx4w+j59yU
 7RPYXPJcsXgNdsBaFmQgg/GWaNukxjKoBev7RzsM+94e2WPytCi231v4MCFo6123ps5tm
 nBh8ThRu/fiSAO7rI4e3pKt3kg5b5yOMrTWsTo5lIEDexLGWFfkt+G60ITdBeJfbSdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884584;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=HOZnuUQDbB8Y5ZjL/TTYqHvvWu+/9wAlxvOO0+4Ghfc=;
 b=s9mhxq3NuNq9ngmwu9hv+idgMOTwL20a328vm0tQlSsB2xUvVYjY/Cmgpal4vanFx0Iw
 WiYmvQbKyrP+urlhwHRjFEEYA+6X2w2DrqLu3fzz27SO0ojOkuqZUkwzU0ypTbC1xjd4Z
 +O110s0xaF4nP7oeSoKcj0Sex98s6SaPwwZZni1qd9pBa889Dspg7Lmqtg2TV0sQDhX0M
 hVY0ylw4yZYyorTgMQL2jmSgZgYq0cRpL23R9NQTL7iizcmUQbL/BB7Mujjjf9CFK5K+g
 BOETd6mYAWyiyIA82tJA654YQeKtHLEAiHHN6ncSEXAHFyz3JJ6ROJTfsbOS2R91V4A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="KN/9PVDX"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=KN/9PVDX
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65BDF80C8F
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a0e1b0681bso19839755e9.3
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884582; x=1792489382; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HOZnuUQDbB8Y5ZjL/TTYqHvvWu+/9wAlxvOO0+4Ghfc=;
 b=KN/9PVDXFRK4YSubPlTBx/Ly/WuuleK+GVAjwVA3GuZHo9+yuoeS7+ltzEb8vqNE2J
 t/EfccfjO5fpAFRsRfYGxfp/yg621I0wc/ykyQmgCAuNSn+0N1bc2odYHmbUDRJlE7To
 xKDZQgEDymYoYb+cBbjonajC4a/2I+T52S65r55iuACXJdZQO45Tf+FFWXOfQohIWmu0
 iaZCh9fJQX5ZfRXw6L6b1qDjD3oEvb7CJPU0WDJp2vm1ugJcWQp73Qxqq12UZ7gecG8+
 2kFGgNZBhJQg0X4VBRKiM6zzwWQurLtNfyOyTeIWM9aEkM27C9qTCJMP4pgN/IxqDn8z
 636g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884582; x=1792489382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HOZnuUQDbB8Y5ZjL/TTYqHvvWu+/9wAlxvOO0+4Ghfc=;
 b=cpcI5gnfOhvEQMx4OQAgtk37NtO4FLQMishz+AyAIjdWw2cBl6prRh4gmbac9z9/Vr
 pcv9vmmi6o6vXwCt4vU4Vppc7Tyd+YUtZglYgR8X6VJ2Kx8ibcd52Jtrc7XWT3xD7Ewi
 LvZnnKcof15RUzvTxEWhm1uzFRG4bIiuD/m7G7kak4Gs0JjRGmpjwQUAjxaogSWAIaTo
 SLWu1un2DbEnmIfeUg68iXBlFw5onqkWMifWtunlv+5n0ctjnszFAiARZfFP5ncop8jI
 0s82SJybfNMYyqZyMNR+4ZIJiAeuYThqlDGaVit/OLemYjJ8iBG7XISOoIIHkGfjl/qN
 RVlw==
X-Gm-Message-State: AFq9FYLbFTMBGJ3mB/3i+5LBIaKlRCTwh2h2fdysuByLbWSBZEb5jEmZ
 mE40I7G4BauQ8fJ95gSm8gWaN6hbJXBioVjpErWaBO7deWCaA3T4STlOsdSp7Q==
X-Gm-Gg: AYBFou3kY3UXKHXbdzfsR7CgFGQtVnrO6dV6tbAnGJScBsAZoD256yeFEjsWP7hgX2G
 ZDxvrgCxFH0KObJm2vhcxXtHMYp4xFa6K7N3Lvp6yFwQDWl+VIYifYKsR/T7Sk3vynoOq2NPzCH
 /7QzCja7yY2dYpk8SBATF8+RYF8kAPXAu69tPP1k0KxHEzbitZh15yjXqmmeMa0IHLmKpJbigNU
 m0YJ/5TAcmNj7GhZQGlSxNQnlaG6McxgGd1hq5eQn+kkUxMr6My02MnDgk5whr94u+3r1sQ8+ek
 OcftXJi5vLZCw1eL3mzhAqX9dzrFLcNnGi/lwsXTAKJMKNi42p5k3SETx8nraLnnX/QPrSo55Fn
 aSVIcPMUU8bKMuLAleZzhETiHxTLhpuhDqqhuAsgqgQTMd3Wk9sX8NXoX01AibHk6CcUq8RHOg4
 NlP61h6ao6TIIjl3nEyUC8DrErxu5xMuGjlWhhMauKN+BcWjcXDdlgXbDFTb91yMkehXHu4K/Qt
 /32sa2uaGNIVslooG6ZkBl4IrUc/6a0p9NvvLbbe6Z0PVbWSxw=
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id
 5b1f17b1804b1-4a193fd0a16mr120024685e9.6.1791884581871; 
 Tue, 13 Oct 2026 02:43:01 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:43:01 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:46 +0200
Message-ID: <20261013094252.96761-8-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 08/14] package/perl-math-prime-util: bump to
 version 0.75
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

diff LICENSE: update copyright years
see https://metacpan.org/release/DANAJ/Math-Prime-Util-0.75/diff/DANAJ/Math-Prime-Util-0.73#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-math-prime-util/perl-math-prime-util.hash | 8 ++++----
 package/perl-math-prime-util/perl-math-prime-util.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-math-prime-util/perl-math-prime-util.hash b/package/perl-math-prime-util/perl-math-prime-util.hash
index e28cfe542..8e4317af1 100644
--- a/package/perl-math-prime-util/perl-math-prime-util.hash
+++ b/package/perl-math-prime-util/perl-math-prime-util.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  26496630990db586dfede6551de79cbe  Math-Prime-Util-0.73.tar.gz
-sha256  4afa6dd8cdb97499bd4eca6925861812c29d9f5a0f1ac27ad9d2d9c9b5602894  Math-Prime-Util-0.73.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  785a9d5f637212f9cd67d1ea5b8cac23  Math-Prime-Util-0.75.tar.gz
+sha256  85c17cbeb5927d71f024a2e1f197bff61e1ca6da249053e1683b62c894bb8881  Math-Prime-Util-0.75.tar.gz
 
 # computed by scancpan
-sha256  475b5f12062de0e197fb8cfa44eef3b032342d097752868e72c1239fe52a8942  LICENSE
+sha256  5d13a9e146c0103e53c1e23275cd181b03720a1d29006b0148dc4e6bfb9ba9ea  LICENSE
diff --git a/package/perl-math-prime-util/perl-math-prime-util.mk b/package/perl-math-prime-util/perl-math-prime-util.mk
index 5781fe75d..4c8118c4c 100644
--- a/package/perl-math-prime-util/perl-math-prime-util.mk
+++ b/package/perl-math-prime-util/perl-math-prime-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MATH_PRIME_UTIL_VERSION = 0.73
+PERL_MATH_PRIME_UTIL_VERSION = 0.75
 PERL_MATH_PRIME_UTIL_SOURCE = Math-Prime-Util-$(PERL_MATH_PRIME_UTIL_VERSION).tar.gz
 PERL_MATH_PRIME_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DANAJ
 PERL_MATH_PRIME_UTIL_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
