Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE61C87FC9
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 10:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B1D340D48;
	Mon, 28 Jul 2025 10:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEHWv4JQFUtp; Mon, 28 Jul 2025 10:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 548BC40D09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 548BC40D09;
	Mon, 28 Jul 2025 10:30:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB0B31BE
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 10:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCFD940D09
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 10:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dQ5Wu8z4oNm for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 10:30:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF1BA40D04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF1BA40D04
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF1BA40D04
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 10:30:14 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b783ea502eso967326f8f.1
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 03:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753698612; x=1754303412;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VVODQX2O8x/+S4VxjXYZUmBVHC1xlXIIpvqq4/F/jQY=;
 b=Hq4uKuPle+I9XQPOtwS5BE8Vd2hSMYkMGpiCRE00fNXXP1eHMvTY6DZtJ19jNnC1Hm
 ycf19Xi5hzlehQMSRnhGDpwD0mJzi3BK3jlux55AezLO2FVkMDeYob/P3Ir+uwWXEWAJ
 pEmD8rmhwx5XCRKb/+ue3X/7XuWsVD7q13fIjqtYsy+JcYslW3YmNCSzmnel5JmEnrW6
 syZyRGLRjxqWglDCDKsO9zMt9fdrtZKbSmpA+MM87uUmY9NI8wBmMzMY28bgRSBuIwsm
 dA5PWSBUoDRe1De+78OUdpsV8pnfGkIaeIu0MDhHEe+1KKmpPa09k7yk+qgAnYZudINU
 kr4A==
X-Gm-Message-State: AOJu0YwBZxU3QudEzwZGlDFHS0uU0HOi0Jq80g7ATvvD5shlOCWApHcx
 vBr3J7ycahWXV05pDHtuGal1pQiwnBAw8hTEG1yAWc9XddKx/7TtE4ZP4pNQxq+Z3cJgItdK/bY
 iimna
X-Gm-Gg: ASbGnctjnqOKhgc5WCU+mX5co71HKDtDdRT29eT9BTCmRjAnNmczq4hkk9tDB+Hg0uL
 U8AQXeadxrQFrMAUFDI8grQ8nQcbiOizPRK1FnjsCzwtbNDM4AmE2F9V0yANEQU1B6azWR1c1HL
 l3faHwbXN5wziWLoW5hF0cmSdSZnfTrBTA11W8exfYKsW4beoziMfONwSPYuVPakStCOps5rAl0
 k+EdxhkHUESDX+BsspoU1wycrNYWaMjmxjyD1YV09BmwMqgmGGR6CL7c4igctyDu8fvQ38Gmfig
 ucITf1vJBgpxH9wQHC+9ZonUNexkeou83luskcHRfUe82BRFWgDy6BkUlza5x4hVQ9dFhgXmt45
 Ui+EHxnaVmRuBYF/wt37JeVwM4cOFOkhbXwV7iYV8eRSVpRINsDaReuYvtq5hkFm1nedzW96ZDb
 oJAwPJQsWCgv0kCw==
X-Google-Smtp-Source: AGHT+IGDVTq2I0VBNnaezIbar7bEVuFWbBI7vbIbib6GajZ3+D/4ItWyPmmcl4rVHF2Qdfi7H/ZMvw==
X-Received: by 2002:a05:6000:2387:b0:3a6:d95e:f37c with SMTP id
 ffacd0b85a97d-3b7765e5c66mr8510564f8f.2.1753698612137; 
 Mon, 28 Jul 2025 03:30:12 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b7887285e1sm3071203f8f.65.2025.07.28.03.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 03:30:11 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 28 Jul 2025 12:29:56 +0200
Message-ID: <20250728102956.81525-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753698612; x=1754303412; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VVODQX2O8x/+S4VxjXYZUmBVHC1xlXIIpvqq4/F/jQY=;
 b=h9CfA2JHXGVfJmOg6j0HXgkZ/E+cg6Z2Ks5CsR99H1WUmZ2BeNJnjNhYVibp+fMkmN
 ItRk37k1L7ZJ1DV7qihNlSwf38VU8bqHFOQ+Hgwwh7pSF+GKlfAHs+TJp67L65amjfaF
 E2VTbTqZU7YTE+Vo6RM1ocXPVtaK5vMzn9TU40ZEUy/W/haNo8LsCtrqV4Y6KkvryFRW
 g6ifVHu5jukqhcs6lk6P+1mDmg2jweK4ZCkvO8tOOf4DkLQ5OaDYIiBnN/GfdYp7EoWm
 20HfKSG063ZHu8VJYd2TiDsfTId3y1nXH82RGtC+h+OnCGsnwSR7+/3iQyU57lDIKIaQ
 f+bA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=h9CfA2JH
Subject: [Buildroot] [PATCH] package/rust: add CPE_ID_VENDOR
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This gives a proper cpe-id string to the Rust buildroot package

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 22f3ca1455..d1298f5d3c 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -11,6 +11,7 @@ RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
 RUST_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+RUST_CPE_ID_VENDOR = "rust-lang"
 
 HOST_RUST_PROVIDES = host-rustc
 
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
