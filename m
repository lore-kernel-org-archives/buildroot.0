Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835AEC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EE0E80C11;
	Wed,  1 May 2024 21:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5VYM59mNLDl; Wed,  1 May 2024 21:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F38A80D44
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F38A80D44;
	Wed,  1 May 2024 21:30:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 244781BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D2FD4074B
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pvUejdTFn92 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:29:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B07840747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B07840747
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B07840747
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:29:58 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34dc129accaso905756f8f.0
 for <buildroot@buildroot.org>; Wed, 01 May 2024 14:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714598996; x=1715203796;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qUwDwHmwAc3ESJejTokIYV2FCZVyHZJi9MrED8Qwyc4=;
 b=bVSnBO/0lx6yI3jJ9afL5VTTWP87zVgXzQSgC9RDtPlopFJ8CSldTyOwiKTNQYogpH
 8Q9xuzwL5UGoneQcVxM9FGWx1VK6spoqqMStwDM11sy8ed7/f9eTJh7uimnRbSjlWejj
 2XPYy9UR6tlo2itKY5Hb+tvFcp1Li0069KVM9lN4rwhIxyXmzoSFST+L0OxNQ45hA1qm
 p5Twcr6CdHTEnc0gmwMq9F48UTiuIgXhkHtmgViWoACy3/svTvLaq6s3Tql5rLXjz/4I
 Xppv2Odoqig4cvW5qXH75CrZHNfJ4VYN06WL6MojVzLKRrMnFnX45xToKs+5YVl/e6pm
 /32w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx03pFa0cqOakx7PksD+gEr9urssHU/4YNvZpent1F2uqr6h4kMZW9oCau6omkxpN+P8p+/GVRt4oJsjaQ2X7DRvTn8Z8yHw==
X-Gm-Message-State: AOJu0YyKknlgnilag5oAiU1OQgW/YOu7b5uKtXkjSsbpZICIfWt4MMLH
 Bu9NIjiRzjb9QRYKigqq/UC08303S4UwChnS/oJxfECFnK1W4767aYOi2QSA4eM=
X-Google-Smtp-Source: AGHT+IFg6jc0xaGnXtbysos3BARu6ta5ar0y+5Mozxh8TvY3TBh4f5pfYhY8uxY1WeK55hRNJ7UCKw==
X-Received: by 2002:a05:6000:12c1:b0:347:2055:f49e with SMTP id
 l1-20020a05600012c100b003472055f49emr110660wrx.33.1714598996249; 
 Wed, 01 May 2024 14:29:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 d18-20020adffbd2000000b0034ca136f0e9sm11976548wrs.88.2024.05.01.14.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 14:29:55 -0700 (PDT)
Message-ID: <a9ecc973-af89-412b-88fe-76448628774c@smile.fr>
Date: Wed, 1 May 2024 23:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240415124616.3817152-1-dario.binacchi@amarulasolutions.com>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240415124616.3817152-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714598996; x=1715203796;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qUwDwHmwAc3ESJejTokIYV2FCZVyHZJi9MrED8Qwyc4=;
 b=og3orXnPCrgnToZq9OCjkls7Jy1O/uYfBMW9paj5E0SNvWAcIR8zPXXKEWbh4KRFwZ
 UxstntWrqZbOwLGQ3sn5qjXn/e5epnHxg12C4XRWAWumQc+MZ3DyxSpLwovFpPwZ5SVv
 hVUTx+zqejEVEzUpB+2zbiL1u+xj1XYSrVd09DIu4ZgE1yMv2Puiy1xWEJOYjj6A0WMw
 wOTDmZMugaVYaCKhJ7W5w+T7VzHpqRHNPD8tBRP31IlBJJIs1OVuH8hI5t2dV14lrfB5
 dRWYyxgGscAqrUlAeej6QN7V2JEzc5XZObEIZRPXEgTLkE5aw1DdrAGXftouG+2JoHNn
 2YTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=og3orXnP
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk_defconfig: reorder
 defconfig
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sIEFsbCwKCkxlIDE1LzA0LzIwMjQgw6AgMTQ6NDYsIERhcmlvIEJpbmFjY2hp
IGEgw6ljcml0wqA6Cj4gVGhlIHBhdGNoIGRvZXNuJ3QgaW50cm9kdWNlIGFueSBmdW5jdGlvbmFs
IGNoYW5nZXMgYnV0IHJlb3JnYW5pemVzIHRoZQo+IGNvZGUgdG8gcHJldmVudCB0aGUgZXhlY3V0
aW9uIG9mIHRoZSBjb21tYW5kczoKPiAKPiBtYWtlIHRpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+IG1h
a2Ugc2F2ZWRlZmNvbmZpZwo+IAo+IGZyb20gc2hvd2luZyBhIGNoYW5nZSBpbiB0aGUgZGVmY29u
ZmlnLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBh
bWFydWxhc29sdXRpb25zLmNvbT4KPiAtLS0KPiAgY29uZmlncy90aV9hbTYyeF9za19kZWZjb25m
aWcgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZyBiL2NvbmZp
Z3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gaW5kZXggNWM3Yjk3YjNiMGIxLi40MDUwMTY4MTg0
MzggMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPiArKysgYi9j
b25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+IEBAIC0zLDggKzMsOCBAQCBCUjJfUEFDS0FH
RV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfNj15Cj4gIEJSMl9HTE9CQUxfUEFUQ0hfRElS
PSJib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzIgo+ICBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tf
SEFTSEVTPXkKPiAgQlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0iYm9hcmQvdGkvY29tbW9u
L2FtNnh4L3Bvc3QtYnVpbGQuc2giCj4gLUJSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFRfQVJH
Uz0iLWMgdHR5UzIsMTE1MjAwbjggLWQgazMtYW02MjUtc2suZHRiIC1sIGFtNjJ4LXNrLWJ1aWxk
cm9vdCAtciAvZGV2L21tY2JsazFwMiAteCBlYXJseWNvbj1uczE2NTUwYSxtbWlvMzIsMHgwMjgw
MDAwMCIKPiAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dl
bmltYWdlLnNoIgo+ICtCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUX0FSR1M9Ii1jIHR0eVMy
LDExNTIwMG44IC1kIGszLWFtNjI1LXNrLmR0YiAtbCBhbTYyeC1zay1idWlsZHJvb3QgLXIgL2Rl
di9tbWNibGsxcDIgLXggZWFybHljb249bnMxNjU1MGEsbW1pbzMyLDB4MDI4MDAwMDAiCj4gIEJS
Ml9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvdGkvYW02Mngtc2svZ2Vu
aW1hZ2UuY2ZnIgo+ICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9DVVNU
T01fVkVSU0lPTj15CgpkZWZjb25maWcgaW4gQnVpbGRyb290IGFyZSBub3QgYWx3YXlzIGdlbmVy
YXRlZCBieSBzYXZlZGVmY29uZmlnLCBzb21lIG9mIHRoZW0KY29udGFpbnMgY29tbWVudHMuCgpB
cHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
