Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223A9C4345F
	for <buildroot@archiver.kernel.org>; Sun, 14 Apr 2024 06:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95806407AB;
	Sun, 14 Apr 2024 06:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36NaxTvWxjnn; Sun, 14 Apr 2024 06:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70841407AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70841407AE;
	Sun, 14 Apr 2024 06:28:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 259EB1BF842
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 06:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F6AE608A5
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 06:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxjgU5gQp8vf for <buildroot@lists.busybox.net>;
 Sun, 14 Apr 2024 06:28:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EE17606D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EE17606D0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EE17606D0
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 06:28:17 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5176f217b7bso3826784e87.0
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 23:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713076095; x=1713680895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=soj3uYdlJBqdEdJ120x3WYdVoKn8hq9ra5zP3YWXQQc=;
 b=aBX1ubW5cSJcPrJ5NllhOyz4oRWcaOOgmoVozzgEPBYtqHp09B1FtGADNbwGgWsFHA
 84DcVqpw++70Lg5gAXUuLf2VhUe2+VKWRLckt9mQc2tXPjZTqb962m8TnFOb9XjaxtBG
 kp2MNKjJHHFo6uBG63bMENV8dSVrhBj8eUE8QhTFgyULRqWafYxENzAng02sAaIvn8gv
 vt9pf/z8+vSnHnSKNs+tMSMJrsm/X3qnymz9XimlwNOjXPfgOguGWAo73ymmQeyeg7E6
 6w5p7xowrLdgvt9EW2uwEDZQwyVwNwWMTDsCegUkMpJ7Ttxfrwj5LYaPizjOM2cr6Yfg
 XdQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXiopTlpAjZwLKb7lrhMJebneB39f7/bYDHVaMeuLavW9HrN+aWAfAUbzu3VdDN/U+9kTxKYvK7nf7/wuBGnC04/eDCugXzg==
X-Gm-Message-State: AOJu0YwD8+gfoQxK3x4sAxtpcBfldrcWY83+j2WsfboEBqhHhy1qtt5G
 HqK22Bxfkt6UbY040WOIFMZ82HGI5QLzjvKY1g2bt1/7Fa/urVySP7AIagpPh0dm4Ir5GNEfP4L
 9ILQ=
X-Google-Smtp-Source: AGHT+IFaxNfCYZeETvq6KJkFTNunE5dTnN5VRR9ZfWKahpUxDRU9J0X4F9y2JiOqPr3SViucizkiWQ==
X-Received: by 2002:ac2:41d3:0:b0:516:d3de:88e with SMTP id
 d19-20020ac241d3000000b00516d3de088emr4375900lfi.49.1713076094385; 
 Sat, 13 Apr 2024 23:28:14 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 w12-20020a05651204cc00b00516d6925de5sm922907lfq.92.2024.04.13.23.28.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Apr 2024 23:28:13 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-518a56cdbcfso1499644e87.2
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 23:28:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV4TY0G7PzQhHiQjdA3TwmxHEecOLuO+lhK755VThcm84BKFEjapDzlpynTqCmX4CQb1aifuysrKZH0HGfDqvidkTvU5/TS1w==
X-Received: by 2002:a19:384c:0:b0:518:ac6f:3db9 with SMTP id
 d12-20020a19384c000000b00518ac6f3db9mr2072705lfj.30.1713076092098; Sat, 13
 Apr 2024 23:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240412132659.1168317-1-thomas.perale@mind.be>
 <20240412132659.1168317-4-thomas.perale@mind.be> <ZhmS9kRYj2AuqBln@landeda>
In-Reply-To: <ZhmS9kRYj2AuqBln@landeda>
Date: Sat, 13 Apr 2024 23:28:00 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rLxuogZYE9vuuwOh3-Rif1o=P6go9dAdYE4sjLp=gD=Q@mail.gmail.com>
Message-ID: <CA+h8R2rLxuogZYE9vuuwOh3-Rif1o=P6go9dAdYE4sjLp=gD=Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1713076095; x=1713680895; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=soj3uYdlJBqdEdJ120x3WYdVoKn8hq9ra5zP3YWXQQc=;
 b=sePkYqjFaGoVQ3Vm1jhg1s87WT+WT95vZ9Jr9IpEnhL6Bm2M0sO4Z024wHAX1VxxlT
 EwxUD8ZFc+0vEqC+f5wwwNBj+PYMImDKfX2C8ehxA2VYUPoypFDMS6CD/AkoNLvaxIIa
 LhU+U8Sc33P+/TYTImnOmMHAqk0KQYMNqiIhb2Tuh3bwtb5Rgb4qzXXeERlZGNw3MX+7
 kLCKgaPAZj8ySmV96e4IrJfGLH2jmFrNezcY91xPwo6Evku+ZcZIWWvsUJZ46jOn3psw
 UgizuTcCglkQKmLCi8n/jRvYIUYXgdgPbByfw0c4Lje3JuSQtBc4qLeGQE2AwBThLCDY
 +IbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=sePkYqjF
Subject: Re: [Buildroot] [PATCH 3/6] package/go: make host package a virtual
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgMTowMeKAr1BNIFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiBUaGFua3MgZm9yIHRoaXMgc2VyaWVz
LCBpdCByZWFsbHkgbG9va3MgZ29vZCEgOi0pCgpJIGFncmVlIHRoYXQgaXQgbG9va3MgZ29vZCAm
IGhhdmluZyB0aGUgZ28tYm9vdHN0cmFwIGJlbG93IHRoZSBnby8KcGFja2FnZSBpcyBuaWNlLgoK
SGF2ZW4ndCBmdWxseSByZXZpZXdlZCBpdCB5ZXQgYnV0IHdpbGwgdHJ5IGl0LgoKPiBJIGFueXdh
eSBoYXZlIGEgZmV3IGNvbW1lbnRzIGFuZCBxdWVzdGlvbnMsIHBsZWFzZSBzZWUgYmVsb3cuCj4K
Cj4gTm90IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCwgYnV0IHN0aWxsIHJlbGV2YW50IHRvIHRoZSBk
aXNjdXNzaW9uOiBpdAo+IHdvdWxkIGJlIGV2ZW4gYmV0dGVyIGlmIHdlIGNvdWxkIGFsc28gaGF2
ZSB0aGUgcG9zc2liaWxpdHkgdGhhdCB0aGUKPiBzdGFnZS0zIGhhcyB0aGUgb3B0aW9uIG9mIGJl
aW5nIGEgcHJlYnVpbHQgZ28uCgpVc2luZyBzdGFnZS0zIGFzIHByZS1idWlsdCBhbmQgaG9zdC1n
byBpdHNlbGYgYXMgY29tcGlsZWQgZnJvbSBzb3VyY2UKdXNpbmcgdGhlIHByZS1idWlsdCB0b29s
Y2hhaW4gYXMgdGhlIGJvb3RzdHJhcCBvbmUgaXMgaWRlYWwuCgpUaGlzIGlzIHNvIHRoYXQgd2Ug
Y2FuIGNvbnRyb2wgd2hpY2ggdmVyc2lvbiBvZiBHbyBpcyB1c2VkIGZvciB0aGUKYnVpbGQgZm9y
IHJlcHJvZHVjaWJpbGl0eS4KCk90aGVyd2lzZSBpZiB0aGUgbWFqb3IgdmVyc2lvbiBvZiBHbyBp
bnN0YWxsZWQgb24gdGhlIGhvc3QgbWFjaGluZSBpcwpkaWZmZXJlbnQsIGl0IG1pZ2h0IHByb2R1
Y2UgZGlmZmVyZW50IHJlc3VsdHMsIHBhcnRpY3VsYXJseSB3aGVuIHVzaW5nCmNnby4KCkJlc3Qg
cmVnYXJkcywKQ2hyaXN0aWFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
