Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2C5CA9ED5
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 06:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F982605F4;
	Mon, 12 Oct 2026 06:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cimtCqn-JILc; Mon, 12 Oct 2026 06:25:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 298ED605FC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791786352;
	b=ED9hTsV6gvlE+jmW0oE31tsondLd9I2qS37fZjCXpUL3mOZczXedABorp/w4LRUwO0FC
	 RGPWiYHPmTr8HEHEPoFOjhWJec93Rp1X0BeFqLfSeQl7btGWB9UcqwD/q65/XeT//KE9r
	 d7I6MbPnEMpvc303f22T9ih6uQN9Q/Hj5Rsh3DvmzZWh3/2HAmXnnW1mb96La/mdrpNUD
	 7DvAw22jymOAc+D1+XpjSxQdxWcJAp4WR6pvaqzXi4Qlv5HkbTHQSiWN65ItBUfJ5cEjp
	 VcIIBdWmm1P5AWWwC0tFX2YFMMMCm2MiQMW/1gmJje7rHg7zBTOOyqkCy/DE+OWpvVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791786352;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=orup0bvxO3WIAPIGXVtToAYhznpEz0X6hHAhfCiz1ZI=;
	b=gWz2V92o5mWiIlf/C//OSfWdHzE/e2aKtsa/PXEFk1FbB62ozL10aYj+benorNpNkhTN
	 5L7Auz9ZPoxoc3yDbAVQ4hcj4yFI7+t0JajpsDkzq24HaYptrUkAzM9Q8MtVQvIeFl/r8
	 2A2gGuxkPIDk/wXrIYqLTwfQ5usC7Hj94BeyGh5frSnHIF+rVQEB09jlbYrQvNm74jKfh
	 t/YZSEedW3n4WzzxzgSG7PaOcTdp8VCDux5ln4BMGdS5BO0CpvlSCcWRfDC+UTh+EML64
	 2rVg0r6FEzCjRkgAJxBFuD8ysZMEGIqq3fvqcEXNr6YSuLzb2uLXKm8/Y+t4FWzQv2w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791786352;
	bh=orup0bvxO3WIAPIGXVtToAYhznpEz0X6hHAhfCiz1ZI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sD7SoYXLFS5t5I71nLJk0s6Ck5DqLzZH4jaru1xckpeCd++bg53KhRIMmk3SJtrHk
	 D/tGkkGR4eFJuxr1+EcqVK6bLMs0cN/7qdwUsG6y5BwYgPBAEBZVuEBk4eak093MGH
	 Ykjd9rjDP/eJsqRD1BmPRR9CVHVnRicvY1HQNYxwk7XmNTnuLs6e8kyF4quPIag7PX
	 Hqg7v3U6SVdQjLIR5+dWc7qy5KbkqpRYN9Kj9Yrc5ZHs049BXv5aXvYM+h46Iovv3R
	 8VE2S1gvNOOG95crZ4miBXutJ6oAjPwVb9E1s6mhTNZG6k0BOkIFXE5HdIkkB71LSH
	 WCiq2ujMvUlxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 298ED605FC;
	Mon, 12 Oct 2026 06:25:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C37A39CF
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4C9580CF0
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6O0wgT7uGKH for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 06:25:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 974E680CF8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791786348;
 b=TCT8oVjl495plM5wEpvdFfdZ3NQmeeVt5rGVaRRHExWbvuN5QKlUjSFD5YQOq0F0tgE9
 HBCPwRKEi7QvX4SVWrAa272tS1uYG+okmMhPIPhxIDfD8cpOv5Qyh89vq8rz1Fg36+oZk
 ozf+kLEenYYR1LCaP8uCNq7eWA3usZLd5z07I9D4G1QuSuGPn718FiXblYLpk+rQDB0FP
 swjMa18v6SJq4sdHoBlkatv7nfRgq74BoksOwHZWue7iTEZOCwxOXO+KwaACiTmvU6dt1
 mIE6Or42aR9e+Xu1Pjvvrq46Y+LbM1MiX+sXCNyakn7baS+Y0f4CO0Gwuk+ubVvE8gQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791786348;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=YL5GufU1f7xPl3eiQr1DGtoombxUb+Da1kMf7M5qBCs=;
 b=lkMZYPMzYAfjYXWRQQPPszrd7Hj/ZjccXZ8hEhcd9Q+udfSz/tkZWAlbx7EM4cLTTGx7
 vx/spgp5dfIO1Vg0mZGhDK3pGnPA7Ygl3eo2pzCQF2E4tY/8nWtsZpifndPBPNE43+JK4
 jERb5O/Wyfj9z4LnLY4pmyI78hMMkvYm6PrXgtHz5Dy2hyzFkHyNcRAENo4jj4c3B54g2
 mB6pGgyoipJMUnKs3LjTwSc0iwFe9SlsnyiKTSkQyXlUZ+pAmaeMtABb5G3eW1BlwLq/y
 LL0Yj6ZXY4M4uZDJgPGTLHmnDUF1IHpcBIDp9CP+hr8c/ey0IuEicxQA3qoLfQs8+/w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=C9HDTVas; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=C9HDTVas
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 974E680CF8
 for <buildroot@busybox.net>; Mon, 12 Oct 2026 06:25:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so12479615e9.0
 for <buildroot@busybox.net>; Sun, 11 Oct 2026 23:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791786345; x=1792391145; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YL5GufU1f7xPl3eiQr1DGtoombxUb+Da1kMf7M5qBCs=;
 b=C9HDTVasjQ6EfU4s/DLUrbM7LGzSyt1FYz6lJmNXB0p1FfChtZ7selMbH646DyYQgb
 mSOl5AA5fdTa5nnhXsai7QMQYqex//cJLX2S8tdCYLkmVwFNgq/E1UCwHkk5nnmY7fGS
 ZMK4w7u60kYq0XxMSrNRj5dj2V0q2tvsN5qBmCUuZrh0IAsqnoaGzLzRWaY60Z6N52+I
 0HWsztcR99nnyT77mjCVshLApvmGwsRSeBVM0/tHJE+JU1sn6sBRwE0ay3ANn5+AdNzX
 WzMyE+gquvO6qr5R9HXgY8WNvHfb2QbrAoTcV56VRVp0DyDICCsUijqyz/QgyouiUk3P
 WdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791786345; x=1792391145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YL5GufU1f7xPl3eiQr1DGtoombxUb+Da1kMf7M5qBCs=;
 b=hiiDqTDEFEGHvGEssr5Mks1JQeU8iS1xK3XjH8dZqGyw/Maz03c7m2IiviGb9ucqdJ
 xOugmY90X/TapXT2ww6axouV1ksP7ghVwK0FXm50VxYiHJ10k0R+UKIOpfSGh6Szfg2v
 co2PVwRvkuI1uIxPJ6eYDDFFEwGtWncu6aANGWhSBZyzVOc8586PkYXNDiAQlszQfI9k
 WDnJ++LtL3b/DNnA0c6TkLmikCg+cncYVaCm/KByu+bXlFCbXQM66coQdJmOfS5gQe+c
 4+14HlRnUc2Elb26cG9ipIUKsp0Z/2URIEpmIXlqeIWpi+qEWyEui+ByoAmrmaNxv88T
 q2uA==
X-Gm-Message-State: AFq9FYLe5rnIRdtDZsFQT/EHziPXrCcNAHdLRtjFtRMNXakfM6hTJNRz
 Pws1hDdRYQtzb64BlHk3d4+c2NU2IOGf0TYAlau+2cK75bambS/QQ1Xrot8SoQ==
X-Gm-Gg: AYBFou0+oz9if9+G47Uv8KU+uiFJZ3vcRzOQ54NChttW0hiXrRs0B/Us9WiRHONnWWs
 TGCl6xipy18wVwnz50c68qXxHV6ri81BbQx9tGs5+oD0P8XoFxyYQ+ce4V4S9HFgz2jn0LGYM7O
 E7XmAMVJopDJasKV9oheMt3veGZ9wS06OBQyOLvm1t+nMQzpv5eGoP8l0kRulTnGzpE1cOSQ5Vl
 TdnfzlTIBG3W5lOia5tM0EQnJxZT+CSiAf/rshTzmz98wxROjnix88Bt+5Vw7y7HUydnYvRcMDj
 UcBbUqMc7gqqGWTDDhOfTOfxquCrPSbyzI43Juim3K/9GKjsvP4YVZb7Njiag6ceCd+a96y3h7D
 9fuOQkl6K7iEkWR83+r9VsnGugg9rQIwV7rt7xiyZlbffP6MJQrJ26kOr0My9hXJqUG4uYmsFlT
 MmXOM8s9vEuQp+RY2nLvBStxtAXWWnYa2PdDBuOZj/21jy/DKoyLQ+5qIN1VsrplzMJr0U/k2mq
 gXMjLxm9yhDw7iPuWqL3JbFDy5Pk/7gUluxlc5r
X-Received: by 2002:a05:600c:3e05:b0:4a0:2391:6540 with SMTP id
 5b1f17b1804b1-4a18e4cdbd0mr145432295e9.25.1791786345172; 
 Sun, 11 Oct 2026 23:25:45 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm421486625e9.4.2026.10.11.23.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 23:25:44 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 12 Oct 2026 08:25:28 +0200
Message-ID: <20261012062536.78874-3-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012062536.78874-1-francois.perrad.86@gmail.com>
References: <20261012062536.78874-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 03/10] package/perl-http-message: bump to
 version 7.04
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index aec6102ac..32dcc186c 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  fc958d64205edb2c76e1673424523932  HTTP-Message-7.01.tar.gz
-sha256  82b79ce680251045c244ee059626fecbf98270bed1467f0175ff5ea91071437e  HTTP-Message-7.01.tar.gz
+md5  1c3e66237697af8227a790ea8d71c57f  HTTP-Message-7.04.tar.gz
+sha256  699f3350dbb7bd8fdc9f3b013b0c91b7c059783708443e39bc395fa33352f006  HTTP-Message-7.04.tar.gz
 
 # computed by scancpan
 sha256  ad83c994e0d5899c09dcab1a45da14380f8f99afacbf383f759c05f8b8e21e60  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 13d6b458c..566995b45 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 7.01
+PERL_HTTP_MESSAGE_VERSION = 7.04
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
