Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0BBC0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 20:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B60BF60656;
	Sun,  9 Feb 2025 20:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pX9RmFHUr5AQ; Sun,  9 Feb 2025 20:42:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7533607C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7533607C1;
	Sun,  9 Feb 2025 20:42:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 153BD199
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0369B405DE
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqBAlMdC2UFg for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 20:42:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0C474060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0C474060E
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0C474060E
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:42:48 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436284cdbe0so5500125e9.3
 for <buildroot@buildroot.org>; Sun, 09 Feb 2025 12:42:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739133767; x=1739738567;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:sender:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FD5CFeviGjuEdcvQWVxXY80uQR+Y/svHe4G2iJtQYeA=;
 b=B6GrEKXUpAeucUc2TOgPQ3riWUshfyhIpDAfQ+TeXho4q25aB9YMBoVdFVDMaXthS/
 BFzbgCiYTOMAljHSnlt8qf3DT4Co8i7TvaEP8nzo9da7GgmjK24yu9L9wia3vya4pztn
 yFwWxqsNaKPwD6GM6BS5t2aIASskhl9hkaMnZWGBfM+xVymd05Menqts1KAZA9/ZIKvN
 lxxGE0P8/sQlGFsZFCgt5FPnfniMLo6QOgHCyEYSoMS7jDK/UZvG3y2fsh3rEC+WsdfV
 8JQRnICyeMds9AZy1IRfliM3nP96DsDf8UKT+q2iI7iNsWq4opetSjZWSjILNnykyLaO
 HXlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh75r3XvJBcONV/cJ1CwidhtG22obZAxFCba5/iBK68RuIXUuhf3fWbFHAHeSe1LVkyEmgI67JwEY=@buildroot.org
X-Gm-Message-State: AOJu0Yz3nPG3eSmeGi0FNJkUtF3ld9d0m1x4/XZtJuDdEquc69W0bcsi
 tsHr89m5B04pN+MGvRAcsOh77jWJNEQWAZf3tFRH/1rTWnf7+DRV
X-Gm-Gg: ASbGncs32nFTZJimbipEwkAFmkuGn25T2WhyPUNqSrnXu39cSL9IW5AhZoE9UmrmJvF
 tJMSC4REd+P1e8Gl40ik9uIoV8YTEIcSil48a8JYsu2BBJBOmW4IjHGrlcR2xdg6TYX78Xs4kYR
 zUcS3L5l+jf1pAj/hv8Wd6zF7YLn/KtUXONYyLY1l5PCdCdxO3gPWcC3CDHcOV8R37FCRj04U45
 qIUOZaDcUEmcxwt2Dud5nAMGMQuukXawL5Ntb56xR0qZNsakgUYDxJlTFaT2RWeQqo9qw5aVUYq
 1S/dqqBENDKtO99vdu2lTis=
X-Google-Smtp-Source: AGHT+IFTnWW/sjJAUk5UsZ95PRY8/L2f85QMkXEH6+AWGAXhrQ7QsUgrWcwe6MLN6HPgZ0I+1OOV2g==
X-Received: by 2002:a05:600c:3502:b0:436:1b94:2deb with SMTP id
 5b1f17b1804b1-439249d17fdmr37323725e9.5.1739133766510; 
 Sun, 09 Feb 2025 12:42:46 -0800 (PST)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4394328fcb8sm15126915e9.32.2025.02.09.12.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Feb 2025 12:42:45 -0800 (PST)
Mime-Version: 1.0
Date: Sun, 09 Feb 2025 21:42:45 +0100
Message-Id: <D7O7GU8R97TT.2XO33MP52YU46@gmail.com>
To: "Romain Naour" <romain.naour@smile.fr>, <buildroot@buildroot.org>
Cc: "Mahyar Koshkouei" <mahyar.koshkouei@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250204173456.201056-1-gael.portay+rtone@gmail.com>
 <20250204173456.201056-3-gael.portay+rtone@gmail.com>
 <1d789bef-093d-402f-99be-5fda01b2f80c@smile.fr>
In-Reply-To: <1d789bef-093d-402f-99be-5fda01b2f80c@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739133767; x=1739738567; darn=buildroot.org;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:sender:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FD5CFeviGjuEdcvQWVxXY80uQR+Y/svHe4G2iJtQYeA=;
 b=OpJQuiWtnNVEBn6QmQB+06ofyZ/HymgiG4hCyc0U2TI3UP2Rzf6aNUgHAX+/4EOZEF
 ZKuvaKTd0tLbECvETeeWcBqhQmV6tApY3eQ1819BVUDvn0S88V8p04gew5Hqvpg4hsRn
 4byOA+WUI62XqKxjoXdkdSWc3kBOAC1OaC0iv0cL91VWV9ZMVPgmFzhFoWXwuvub5Ss5
 mCWk306RD+38iaD4uN8dNJHLCA6J80sQyk5VtVOPlVnOOyu+cVnHBG0G1v8JCfa7pD5i
 RlC2WBHoHsVyE6B0csZCf4TzDwJ3U9VblO7fY//Jmyl3b7TyOin2RhmcFC1WDrg6c2Eb
 MYGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OpJQuiWt
Subject: Re: [Buildroot] [PATCH v4 2/2] package/rpi-userland: package is
 deprecated
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkIEZlYiA1LCAyMDI1IGF0IDk6NDcgQU0gQ0VULCBSb21haW4gTmFvdXIgd3JvdGU6Cj4g
SGVsbG8gR2HDq2wsIEFsbCwKPgo+IExlIDA0LzAyLzIwMjUgw6AgMTg6MzQsIEdhw6tsIFBPUlRB
WSBhIMOpY3JpdMKgOgo+PiBUaGUgcGFja2FnZSBycGktdXNlcmxhbmQgaGFzIGJlZW4gbWFya2Vk
IGFzIGFuY2llbnQgYW5kIGRlcHJlY2F0ZWRbMV0uCj4+IAo+PiBUaGlzIGFkZHMgdGhlIG1lc3Nh
Z2UgaW4gaXRzIGhlbHAuCj4+IAo+PiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlw
aS91c2VybGFuZC9jb21taXQvOTZhNzMzNGFlOWQ1ZmM5ZGI3YWM5MmU1OTg1MjM3N2RmNjNmMTg0
OAo+PiAKPgo+IFdpdGggcnBpLXV0aWxzIHBhY2thZ2UgZW5hYmxlZCwgd2Ugc2hvdWxkIGF2b2lk
IGFueSBjb25mbGljdCB3aXRoIHRoaXMgcGFja2FnZS4KPiBUaGV5IHNob3VsZCBub3QgYmUgZW5h
YmxlZCBhdCB0aGUgc2FtZSB0aW1lIGlmIHRoZXkgcHJvdmlkZSB0aGUgc2FtZSBiaW5hcmllcyBl
dGMuCj4KPiBNYXliZSBpdCB3b3VsZCBiZSBlYXNpZXIgaWYgcnBpLXVzZXJsYW5kIGNhbiBiZSBy
ZW1vdmVkPwo+CgpJbmRlZWQuIElmIEkgY2FuIHJlcGxhY2UgaXQgZW50aXJlbGx5LCBJIHdpbGwg
cmVtb3ZlIHRoYXQgcGFja2FnZS4KCkkgc3RpbGwgaGF2ZSBzb21lIHdvcmsgdG8gZG8gZm9yIHRo
ZSBHTCBwYXJ0IChjaGVjayBpZiBJIGNhbiBydW4KbWVzYTNkL3ZjNCBvbiBSYXNwYmVycnkgUGkg
MS9aZXJvL1plcm8gVywgd2l0aCB0aGUgbGFjayBvZiBuZW9uKS4KCkJ5IHRoZSB3YXksIHdoYXQg
c2hvdWxkIEkgZG8gdG8gZHJvcCB0aGUgcGFja2FnZT8KIC0gZHJvcCB0aGUgcGFja2FnZT8KIC0g
bW92ZSBpdCB0byBsZWdhY3k/CgpUaGFua3MuCgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPgoK
UmVnYXJkcywKR2HDq2wKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
