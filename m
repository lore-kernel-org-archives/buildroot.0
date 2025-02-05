Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685B9C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 316EF41954;
	Wed,  5 Feb 2025 10:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BuWn_7UhU7KK; Wed,  5 Feb 2025 10:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1685417BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1685417BE;
	Wed,  5 Feb 2025 10:04:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 299E312A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2095A40CB6
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUu2atBhBym9 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:04:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BD1440BEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BD1440BEC
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BD1440BEC
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:04:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-437a92d7b96so65091155e9.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 02:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738749848; x=1739354648;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HmdtyIXHquz4cXyMRO213+3d4nUZ7gw+hyHG+a0VpvY=;
 b=cR6u7L9yUlsf1InaiUUw/fNRQshERMzq7Wa/a0sgpyZlk0l9iiG+HX4yPsScRfMCfU
 VqwjwIFInOKAJ2VUElvXRlMb2rLyzHUMWY11IJsqt2xkAySzGb5fwycMz9uNlw0GUlCv
 lccdx4QS3lCO/1CGouEOy5jgclxaARB3Y44Z72BiR9hyckgYsnCl8OZXgbijIk/ItL0M
 x9YyTxSNxUzIakmvumXPGmbG96vVm03OuNJASQKEp9be0eBv5/5OpB4QKhPqJYFY1Yso
 PKlw4uLs+Dp85/YRLsy0/8Do5Y1AAV6DRBDpwZMO6R5kw1GFzqBG0lo3k4jRRCP+L/RE
 yrvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7M8dUS+xJ755KMyhcYDFZQbNGJa5N7SgqBvaURybEeMolkHKlu8Tf/QbwtAOYPUOn5z6KKHpN5C8=@buildroot.org
X-Gm-Message-State: AOJu0Yxjt8FLBYhBu30+FPz9yJOjM5c2AzopNGBjNrF4/EUVaTERJNRH
 9KeuPl2rBZgwEL0dpycnkTQvt3RFl3cjM5eCwhlhPV3wEZylYJZ4qDdijMy2hQ8=
X-Gm-Gg: ASbGncuQeXDAugN4rMlkRDy6SM6+BHYQKmtCUJwLFXbzoGTztwz2MSGHiBwcHvCoJId
 7g19dgw1Te7j15Abn/pr5FHeDj67QiKR+rwwZOv2TAhSlb/1iXWo2IBhrNZLRdcSVPc0iKqnRRZ
 kAhiSPirC4aW8fKRjM3nmLZAD0IXDBoYiy9rLIVECgLoizacaFhYCyUqTcaLTwn3+pLpqetI/a3
 S/aBPSfj/VKCDhgfTTKqf06P7zX6b0qVSc5R0RTjCaJz1zKjtyWAr9mQbx7uSHQV8Bdk1JDbwXX
 Dtn5NiKVYYcuik2vyK5tK5VmhBXfkwij6xcS9jtp4lY+wOzIEqslpqGY
X-Google-Smtp-Source: AGHT+IGFstzRepcGl75JOpsJIELZoZOLl1gAClMTei/ZDWnJw/MG3yXH0YFCn5fNZM2GRCA54Vmf/A==
X-Received: by 2002:a05:600c:5129:b0:436:f960:3428 with SMTP id
 5b1f17b1804b1-4390d56c1d8mr14955345e9.29.1738749848322; 
 Wed, 05 Feb 2025 02:04:08 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dac5a3e79sm4239044f8f.63.2025.02.05.02.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 02:04:08 -0800 (PST)
Message-ID: <2154a936-8a6c-4087-8f7a-1606601eb31f@smile.fr>
Date: Wed, 5 Feb 2025 11:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20250123213541.1737622-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20250123213541.1737622-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738749848; x=1739354648; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HmdtyIXHquz4cXyMRO213+3d4nUZ7gw+hyHG+a0VpvY=;
 b=bAx5/ULhx5CmfF5Z43JimL5QCdcWZ0YlR7fNFDZqyeZppgrGuQ8EV+16Cp2Hr++F6L
 PwsMpZU5UhvxrJVh27N6d/L5t3VLZKWEEjK0x4Xq2ZQD+pbzgWkDMPovZM26RTY0CCnL
 p5veoLGE7+/KFpXIfwdUmjULvC2G3Wvn4y1es=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=bAx5/ULh
Subject: Re: [Buildroot] [PATCH 1/1] utils/check-symbols: allow BR2_BROKEN
 to be unused
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAyMy8wMS8yMDI1IMOgIDIyOjM1LCBKdWxpZW4gT2xpdmFp
biBhIMOpY3JpdMKgOgo+IENvbW1pdCBbMV0gaW50cm9kdWNlZCB0aGUgQlIyX0JST0tFTiBoaWRk
ZW4gc3ltYm9sLiBUaGUgaW50ZW50IG9mCj4gdGhpcyBzeW1ib2wgaXMgdG8gdGVtcG9yYXJpbHkg
bWFyayBhIGNvbmZpZ3VyYXRpb24ga25vd24gdG8gYmUgYnJva2VuLgo+IFRoaXMgY29tbWl0IHdh
cyBhZGRlZCB0byBmaXggYW4gdW5kZWZpbmVkIHVzYWdlIG9mIHRoZSBzeW1ib2wsIGluIGEKPiBw
cmV2aW91cyBjb21taXQgWzJdLgo+IAo+IFdpdGggdGhpcyBzb21ld2hhdCBzcGVjaWFsIHN5bWJv
bCwgaXQgaXMgYWxzbyBwZXJmZWN0bHkgbm9ybWFsIHRvCj4gaGF2ZSBubyB1c2Ugb2YgaXQuCj4g
Cj4gUnVubmluZyB0aGUgY29tbWFuZCAidXRpbHMvY2hlY2stc3ltYm9scyIgaW4gYSBzdGF0ZSB0
aGVyZSBpcyBubyB1c2FnZQo+IG9mIHRoZSBCUjJfQlJPS0VOLCB0aGUgc2NyaXB0IGZhaWxzIHdp
dGggb3V0cHV0Ogo+IAo+ICAgICBDb25maWcuaW46MTU6IEJSMl9CUk9LRU4gZGVmaW5lZCBidXQg
bm90IHJlZmVyZW5jZWQKPiAKPiBUaGlzIGNvbW1pdCBhZGRzIGFuIGV4Y2VwdGlvbiBmb3IgdGhp
cyBzeW1ib2wsIGFsbG93aW5nIGl0IHRvIGJlCj4gdW51c2VkIGluIHRoZSB3aG9sZSBCdWlsZHJv
b3QgdHJlZS4KPiAKPiBGaXhlczoKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9i
dWlsZHJvb3QvLS9qb2JzLzg5MjU0MzMzODIKPiAKPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzJkZGM1ODA4Y2QxOWY1Nzc5MTc1NjZhZDgz
ZTJhMzgzNWQ2ZDQzYjkKPiBbMl0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVp
bGRyb290Ly0vY29tbWl0LzExYThjZGQyYmJiZDBlZjRhZGY2MDBlNDc5MmQ3NWY2ZjIxMjJlYzgK
ClRlc3RlZCBsb2NhbGx5IGJ5IHJlbW92aW5nIEJSMl9CUk9LRU4gZnJvbSBBUkMgZXh0ZXJuYWwg
dG9vbGNoYWluLgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9t
YWluCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4g
LS0tCj4gUGF0Y2ggdGVzdGVkIGluOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWls
ZHJvb3QvLS9qb2JzLzg5Mzc0NTgyNDMKPiAtLS0KPiAgdXRpbHMvY2hlY2tzeW1ib2xzbGliL2Jy
LnB5IHwgNCArKysrCj4gIHV0aWxzL2NoZWNrc3ltYm9sc2xpYi9kYi5weSB8IDIgKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdXRpbHMvY2hl
Y2tzeW1ib2xzbGliL2JyLnB5IGIvdXRpbHMvY2hlY2tzeW1ib2xzbGliL2JyLnB5Cj4gaW5kZXgg
ZjlkYzMzNmU2NC4uYTRjMWI4NGM1NiAxMDA2NDQKPiAtLS0gYS91dGlscy9jaGVja3N5bWJvbHNs
aWIvYnIucHkKPiArKysgYi91dGlscy9jaGVja3N5bWJvbHNsaWIvYnIucHkKPiBAQCAtNDUsNiAr
NDUsMTAgQEAgc3ltYm9sc19ub3RfZGVmaW5lZF9mb3JfZmFrZV92aXJ0dWFsX3BhY2thZ2VzID0g
Wwo+ICAgICAgJ0JSMl9QQUNLQUdFX1BST1ZJREVTX1RPT0xDSEFJTl9CVUlMRFJPT1QnLAo+ICAg
ICAgJ0JSMl9QQUNLQUdFX1BST1ZJREVTX1RPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVCcs
Cj4gIF0KPiArIyBDb25maWcuaW4KPiArc3ltYm9sc19wb3NzaWJseV91bnVzZWQgPSBbCj4gKyAg
ICAnQlIyX0JST0tFTicsCj4gK10KPiAgIyBmcy9jb21tb24ubWsKPiAgc3VmZml4ZXNfbm90X2Rl
ZmluZWRfZm9yX2FsbF9yb290ZnNfdHlwZXMgPSBbCj4gICAgICAnX0JaSVAyJywKPiBkaWZmIC0t
Z2l0IGEvdXRpbHMvY2hlY2tzeW1ib2xzbGliL2RiLnB5IGIvdXRpbHMvY2hlY2tzeW1ib2xzbGli
L2RiLnB5Cj4gaW5kZXggNzFiMWU5ZTgxNi4uY2IwZGZhNDc2ZiAxMDA2NDQKPiAtLS0gYS91dGls
cy9jaGVja3N5bWJvbHNsaWIvZGIucHkKPiArKysgYi91dGlscy9jaGVja3N5bWJvbHNsaWIvZGIu
cHkKPiBAQCAtMTU1LDYgKzE1NSw4IEBAIGNsYXNzIERCOgo+ICAgICAgICAgICAgICAgICAgY29u
dGludWUKPiAgICAgICAgICAgICAgaWYgbGVnYWN5X3VzYWdlIGluIGVudHJpZXM6Cj4gICAgICAg
ICAgICAgICAgICBjb250aW51ZQo+ICsgICAgICAgICAgICBpZiBzeW1ib2wgaW4gYnIuc3ltYm9s
c19wb3NzaWJseV91bnVzZWQ6Cj4gKyAgICAgICAgICAgICAgICBjb250aW51ZQo+ICAgICAgICAg
ICAgICBpZiBzeW1ib2wgaW4gYnIuc3ltYm9sc191c2VkX29ubHlfaW5fc291cmNlX2NvZGU6Cj4g
ICAgICAgICAgICAgICAgICBjb250aW51ZQo+ICAgICAgICAgICAgICBpZiBzeW1ib2wgaW4gYnIu
c3ltYm9sc191c2VkX29ubHlfZm9yX2hvc3RfdmFyaWFudDoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
