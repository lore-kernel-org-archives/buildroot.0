Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B80FCD0BE
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 06:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5969340C6A;
	Wed, 18 Mar 2026 06:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAb_Toi88hOd; Wed, 18 Mar 2026 06:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51ECF40C5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773814468;
	bh=8iA64ZJAC7fgaSp8KnxYDKxiHok/l+532HqgSlKyvJ0=;
	h=References:In-Reply-To:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=lbhiQfpyh2jr/9swHnE11jNW+zH0QwAQz9ivYuuDiLixtNSZ7ZSJTdbYXDGAAZzbo
	 FrLYl9jziFHEfCP/GUhKaRadESX685Rb0YsHUU3Kdgzw4gmgML1nOukGyCpDLn6KN5
	 C1NVtMoFJ3GtRaVw3aK39AvWF1AEYaVifMZv5q3urcUX5yfFP44fKAZHYQQJkg+rE1
	 b3q3btm/+6QlOHpghzb9Tsn4VC4ak0RIj5UQyRzKs7MD7e/o5Dxq8DFB8NEb/nmGlR
	 OBGJJoko3NZ228rPF1wlW9RaxdTBkQ1hei8LTYqEFh6ISHm1s+UKIfPG0b5gXFDyuC
	 XSneJwnFyBHAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51ECF40C5A;
	Wed, 18 Mar 2026 06:14:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6695D1B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 06:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C4EA83DC7
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 06:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3copCiH4J6A for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 06:14:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 242B483D9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 242B483D9B
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 242B483D9B
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 06:14:25 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5a278e0f7f6so1016901e87.0
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 23:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773814463; x=1774419263;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rV1u+E7svOC1+i6UEjZMOsMkTC2RS1ZDF3Dt3TfjxYE=;
 b=fhBud9FW0HK4hgRjcA1LjvYKK3nKkh2vXLOC5i+UbizqgpM5KCqflyfGVSGUXFax5m
 2z8jpmGYPO9MiyhRHkXnpgHYQkqm4BEKSHE8iseADc0DDyzZaM5RW1tvx12/YO5fXd/G
 n6w3iRigUbxJa+/JdFjc2ByZGQ/d3zV2Hn+31pwTboI8YUcnzjn3r7DbK/UCULJRWRMb
 79zI9pwDbESJ12nQKLxmt1wJo9worF7GDpbw0OdrinHT3n6Oi+hLmuyFfTU65XLEp/Z3
 40oB/FT3rHYHuyIXQsD4AE92EGlt9P8DSZ6PSJJA8jkpCkY9fBG5QPRbLehOA/257xbe
 HYaw==
X-Gm-Message-State: AOJu0YxEyl4PdSv/svRUU7aCP11uDGuU9dm1OFDjdw7IismuZuguBb8u
 z0owc+A1Q0vhwRgMGMxobfBCjFPV67f2HMAh0v+KgJCDeos4mlV8XB4o/Em/lOipzUIyNp6I1VQ
 uXlcz7BcpHw==
X-Gm-Gg: ATEYQzyNblE3EuCGsVVI/Fxdr5eFd+VN9CtwYw4rUYCJ8N4b9Bhv3Y2OB0F2HAeDKgv
 zAk4Qm9iWYKxihI61zLJ66KVjmA4IAh35/AlX/hzxoG/65qROCdXJuvzoK751qTMDVBMgtYXoXu
 +0HZ7zUOOhLQlqCEn3kqu+TcnthX0qQYo1uXl7O1Zh2WnCnv4TJLD+Ws2NzRKQeULFubycMAbif
 JmC9C52sA90JMo3x7VZo4YlxSsYApq9BEltwgB4wqzEnXUBz/Z5+iwBKjLhNuoD26l48wcpI5wq
 bfhmkD2YhE5IbF54ydhU25M1w/WrLrClffae6WCXLed/ahbesoyOnYUPECXpetkeR6di2CYh5sn
 R/IBNR8i45hOcnfTfICGo8R/8rFrobQvH2BFZG2ThlOwe7dNfeY53a0/ITmX/EBO7YbxaznFbOL
 0XoLuW3X0Ek5saxp6tJfnD0d+1qXET+630ioF6FBzBhLrD5S63NUW6+iQ5agKUbswlqQ==
X-Received: by 2002:a05:6512:33cc:b0:5a2:7b95:af0 with SMTP id
 2adb3069b0e04-5a27b950bd2mr209471e87.25.1773814463249; 
 Tue, 17 Mar 2026 23:14:23 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a279c27444sm318552e87.2.2026.03.17.23.14.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 23:14:22 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-38bda6da51cso1921751fa.3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 23:14:22 -0700 (PDT)
X-Received: by 2002:a05:6512:15a5:b0:5a1:3437:84a2 with SMTP id
 2adb3069b0e04-5a2796a69c1mr995584e87.23.1773814461394; Tue, 17 Mar 2026
 23:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260314230517.4160-1-christian@aperture.us>
In-Reply-To: <20260314230517.4160-1-christian@aperture.us>
Date: Tue, 17 Mar 2026 23:14:08 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pwVXFuwypxSipO0MVQK0Bpoo_PunWUu49kZSqZGfh-Lw@mail.gmail.com>
X-Gm-Features: AaiRm50_5nP6nlTBVaq7z7GZI1MMJPO8uJURD6qHFREhGAzvVJwFoEZ6ZY-BXeY
Message-ID: <CA+h8R2pwVXFuwypxSipO0MVQK0Bpoo_PunWUu49kZSqZGfh-Lw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1773814463; x=1774419263; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rV1u+E7svOC1+i6UEjZMOsMkTC2RS1ZDF3Dt3TfjxYE=;
 b=cN7zQqdrZfdzDoLsfQoqLud90+/Lq1gB3JMJ9G8J12qcnsq01dEh9RqUyQNV9gU7jG
 TOG6Q2RP2H5zeY6KXE33n6P3jWDyomJ6WqL0eAEl3nS9EKZeDphpKHFgcgvmU61T7JPi
 4twTkl0xd8kyUxHeZYvljeIjwnENSeBh4fpoALm9ZeFZFrvYtaffZ5nPMySlaZeZzJNR
 hXeJixPCrO9miNKZJu8Bpyxtt35Q8jdvQ+Na/TF9ziCKHymSLx/KS1rBPlTJETfyupJ2
 1KP4ShIiBhfE3oUIoR1Y2j44jtH8f8VBb1rXCQGyAWsx64iBjW+uBpPy3J0F83aWY6l/
 e/9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=cN7zQqdr
Subject: Re: [Buildroot] [PATCH v1 1/1] package/rtl8812au-aircrack-ng: fix
 build with Linux 6.19
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKVGhlcmUncyBub3cgYSBkZXByZWNhdGlvbiBtZXNzYWdlIGluIHRoZSBhaXJjcmFj
ay1uZyByZXBvOgoKaHR0cHM6Ly9naXRodWIuY29tL2FpcmNyYWNrLW5nL3J0bDg4MTJhdT90YWI9
cmVhZG1lLW92LWZpbGUjdGhlc2UtZHJpdmVycy1pcy1kZXByZWNhdGVkCgpNYXliZSB3ZSBzaG91
bGQgZHJvcCB0aGUgcGFja2FnZSBhbmQgaW5zdGVhZCBzdXBwb3J0IHRoaXMgb25lPwoKaHR0cHM6
Ly9naXRodWIuY29tL2x3ZmluZ2VyL3J0dzg4CgpPbiBTYXQsIE1hciAxNCwgMjAyNiBhdCA0OjA1
4oCvUE0gQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4K
PiBBZGQgbG9jYWwgcGF0Y2ggcGVuZGluZyB1cHN0cmVhbSB0byBmaXggYnVpbGQgZmFpbHVyZSB3
aXRoIExpbnV4IDYuMTkuCj4KPiBVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2FpcmNyYWNr
LW5nL3J0bDg4MTJhdS9wdWxsLzEyNTQKPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGV3
YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+Cj4gLS0tCj4gIC4uLi8wMDA0LWZpeC1idWlsZC1m
b3Ita2VybmVsLTYuMTkucGF0Y2ggICAgICB8IDM3ICsrKysrKysrKysrKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvcnRsODgxMmF1LWFpcmNyYWNrLW5nLzAwMDQtZml4LWJ1aWxkLWZvci1rZXJuZWwtNi4xOS5w
YXRjaAoKQmVzdCByZWdhcmRzLApDaHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
