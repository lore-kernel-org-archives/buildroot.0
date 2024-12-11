Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC34E77180
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 16:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92B3840928;
	Wed, 11 Dec 2024 16:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HS1rOmqTmve; Wed, 11 Dec 2024 16:15:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 505B641319
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 505B641319;
	Wed, 11 Dec 2024 16:15:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED4D4ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 16:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA7764131A
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 16:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8j2YrHXgD2t for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 16:15:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76D5D41343
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76D5D41343
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76D5D41343
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 16:15:54 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-434f3d934fcso25201265e9.3
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 08:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733933752; x=1734538552;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uYN8iyszhmm5ec/rrHXPphW1NaXHR08xds4FPPaCxRQ=;
 b=fEojIq0L4vTyIXhG58oJJ7/u1FTVlnuEU69xPl3zGA//0PlTWefhUvxrtmJs/kFZ8L
 H6juvB97a89THNiRLIg1w32nx0ELhhi21Ts/+ztjH1czIBCQWjnsbh/WLpcp558QRamr
 tn9MbbPcx0k4Ex7CjUMn6klThhKplm5XevP++BA2XscvyZd8SpwHCU3e13l+iyWBB3SH
 jvYfRarUHhg6FbPA7hMlX1nLAZFYG7OHHr64q7coBeTGp+wXg+KWvmyZvqdxh/8VLbjy
 KTK6VcozacIbHLbNjNbRHFx6aPC9YA1rlkuYPv000jYvEYw1mh/Uzyl7ohbFCooh+ofl
 40Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW7FiFyZUxcBdemft5QtgYWge6IHU5ste5XEdqXqUC1Mhpyk3CwUXBxW1xLM30Cz/e6jKdUHchFng=@buildroot.org
X-Gm-Message-State: AOJu0YzUlh0N16NXw64U0rSPQji7veshqi42vTDR0IEYmKlVIURyUVfD
 4PyvHKj4kUqw+ZnnKjoPzEo7jObD3Xr9Gl1Z7uzIsBoxQqaobSD8bzvsnxWUwCBokgvUnlL+gYn
 2SJmqPg==
X-Gm-Gg: ASbGncuPuC2IcSSSCP2vzdxUfBxtmzBadkl+/+V9J+/CBDHPOGex7P9TGG8EtdVq8MT
 i74bvJPdkQnXH94Z/0lNTqdenks85bjylIVcwA+1kGm+qIIFIV2IzWQNHXP4kK8fXacP8WrcEaJ
 +Xa1Uw5Fn5UQ/v7SxfVBpgOsK1Llm44xR+5J18KZzW3YMKQQwH/zUXrU9svdceV2yHimlckI5zX
 tKfQMxZ7joJUmsoYJNymNQm+7F4pLmVVWvRzayLcxkzkvWhm1dw4VDs+Y/1aqBaRHdDMTaCpdNV
 0t0OO8E8MT1FHcK/mq7i5fYb/e1e9els3FWeDI/uUw==
X-Google-Smtp-Source: AGHT+IF8Ul3r9bSupZR31nGM3th06ATVqWvE45OcsZRc2uKFYJvhaf871o8Y6Oq2qETv04P7F9RFsw==
X-Received: by 2002:a05:600c:4fd3:b0:434:f7f0:1880 with SMTP id
 5b1f17b1804b1-4361c4425c7mr21360715e9.32.1733933752416; 
 Wed, 11 Dec 2024 08:15:52 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da0980ddsm226018255e9.0.2024.12.11.08.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 08:15:52 -0800 (PST)
Message-ID: <ce903bf8-7a5e-48ab-ae6a-5bc9713553cd@smile.fr>
Date: Wed, 11 Dec 2024 17:15:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241117123839.536725-1-ju.o@free.fr>
 <dc1ed8f5-0852-4c94-9081-65c4d711049d@smile.fr>
Content-Language: en-US
In-Reply-To: <dc1ed8f5-0852-4c94-9081-65c4d711049d@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733933752; x=1734538552; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uYN8iyszhmm5ec/rrHXPphW1NaXHR08xds4FPPaCxRQ=;
 b=YgDoWCqGbKAs++6sczjq8GwPjUnSOgdhnNesTYElMzMsv3/77Hs9ol5AFbP++orm0y
 R8IL8qnYyjnOGToMxos3D/3YmL+Qs+1d5xWqRLRJJk0LF+OpFB7cGK1hSboRC5Vrbf9t
 gTe2obr/KTxC6wI0pyyrGaMgTThWpXQTBj8n8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=YgDoWCqG
Subject: Re: [Buildroot] [PATCH next 1/1] package/octave: update _SITE to
 use BR2_GNU_MIRROR
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

TGUgMTEvMTIvMjAyNCDDoCAxNDo1NywgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gSGVsbG8g
SnVsaWVuLCBBbGwsCj4gCj4gTGUgMTcvMTEvMjAyNCDDoCAxMzozOCwgSnVsaWVuIE9saXZhaW4g
YSDDqWNyaXTCoDoKPj4gVGhlIG9jdGF2ZSBwYWNrYWdlIGlzIGRpc3RyaWJ1dGVkIG9uIHRoZSBH
TlUgcHJvamVjdCBzZXJ2ZXJzLiBTZWUgWzFdCj4+IGFuZCBbMl0uIEJ1aWxkcm9vdCBoYXMgdGhl
IEJSMl9HTlVfTUlSUk9SIGNvbmZpZ3VyYXRpb24gd2hpY2ggY2FuCj4+IGJlIHVzZWQgZm9yIHRo
YXQgcHVycG9zZS4gU2VlIFszXS4KPj4KPj4gRm9yIGNvbnNpc3RlbmN5IHdpdGggYWxsIG90aGVy
IEdOVSBwYWNrYWdlcywgdGhpcyBjb21taXQgdXBkYXRlcwo+PiB0aGUgX1NJVEUgdG8gdXNlIEJS
Ml9HTlVfTUlSUk9SLgo+Pgo+PiBbMV0gaHR0cHM6Ly93d3cub2N0YXZlLm9yZy9kb3dubG9hZAo+
PiBbMl0gaHR0cHM6Ly93d3cuZ251Lm9yZy9wcmVwL2Z0cC5odG1sCj4+IFszXSBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjQuMDguMi9Db25maWcu
aW4jTDI4Ngo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZy
Pgo+PiAtLS0KPj4gIHBhY2thZ2Uvb2N0YXZlL29jdGF2ZS5tayB8IDIgKy0KPj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9vY3RhdmUvb2N0YXZlLm1rIGIvcGFja2FnZS9vY3RhdmUvb2N0YXZlLm1rCj4+IGlu
ZGV4IDJlMmZlMGY5ODkuLjM0ZDkyODhjNzUgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2Uvb2N0YXZl
L29jdGF2ZS5tawo+PiArKysgYi9wYWNrYWdlL29jdGF2ZS9vY3RhdmUubWsKPj4gQEAgLTUsNyAr
NSw3IEBACj4+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+PiAgCj4+ICBPQ1RBVkVfVkVSU0lP
TiA9IDkuMi4wCj4+IC1PQ1RBVkVfU0lURSA9IGh0dHBzOi8vZnRwLmdudS5vcmcvZ251L29jdGF2
ZQo+PiArT0NUQVZFX1NJVEUgPSAkKEJSMl9HTlVfTUlSUk9SKS9vY3RhdmUKPiAKPiBBY3R1YWxs
eSBvdXIgQlIyX0dOVV9NSVJST1IgZGVmYXVsdCB2YWx1ZSB1c2VzIGh0dHAgImh0dHA6Ly9mdHBt
aXJyb3IuZ251Lm9yZyIuCj4gU28sIGhlcmUgeW91IHJlcGxhY2UgYW4gaHR0cHMgdXJsIGJ5IGh0
dHAgb25lLgo+IAo+IE1heWJlIGl0J3MgdGltZSB0byB1cGRhdGUgQlIyX0dOVV9NSVJST1IgdG8g
aHR0cHM/CgpJIG1lcmdlZCB5b3VyIHBhdGNoIGRvaW5nIHNvIFsxXQoKWzFdCmh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8wZjlkYTM5MzRiOWZjMTQy
NWRiNDk1MjZhYjc3MzVhNjAxYWMxZWRiCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVz
dCByZWdhcmRzLApSb21haW4KCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAKPiAKPj4g
IE9DVEFWRV9TT1VSQ0UgPSBvY3RhdmUtJChPQ1RBVkVfVkVSU0lPTikudGFyLmx6Cj4+ICBPQ1RB
VkVfTElDRU5TRSA9IEdQTC0zLjArCj4+ICBPQ1RBVkVfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
