Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0E0C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 20:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03C7F81F9B;
	Wed, 15 Feb 2023 20:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03C7F81F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DuEFqjAnvcwX; Wed, 15 Feb 2023 20:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32F5581F8E;
	Wed, 15 Feb 2023 20:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32F5581F8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BDFD1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55AD081F8E
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55AD081F8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bcvfs3tjpWn4 for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 20:23:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AE3181F6D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AE3181F6D
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 20:23:16 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso2534742wmp.3
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 12:23:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mRVKuXxN81QXAjjKzNEHx18yNng+rzDX9QtYboPXpM8=;
 b=II50yE1YRkM9YX4HqbxRLaH9b/LN6gUgmNxMM59gJvEcUjOkZHPePPplTsqqqqh+pQ
 qdwgST5pAjcQx3trybILQAhxJ5DLh9YNsgqXFZXfmgSEtxpXutHi/8GW5d4vqxMCe9YG
 g3K9Fb8mqFFJO9jzPhFTEU12snFpd+t0VNcd2Py2IQhdlz7BEznP/lxaS6lYTu/4p325
 zl7G8zlAc24Ol9OAAPsIMFqmmD+qYCx0Xf5f/Wc+NeRPFRllVqqEhFapznHUayS315Hy
 7wwxvi9bWHcR22Tlfh4f5s+N+/2FIdYQaSB82/FmtmsLZRgle42CZG2+02sWSxtI1D1X
 ZJgQ==
X-Gm-Message-State: AO0yUKV/rov/S4v8Q+d1K4njIJQiREaafL3Ci6AwoPWTXKanvGdJvkg2
 CYyr+A5F16ztTejGln2zj7dJpfbxDQxzp0lr
X-Google-Smtp-Source: AK7set+JAOLpsHiuxMYej3gOYyxcmMRG6LDVh5Ot3wX+5v4rlobQtTWbD+MCl5jH3X1OLaJj+/9uhA==
X-Received: by 2002:a05:600c:90a:b0:3df:50eb:7cd9 with SMTP id
 m10-20020a05600c090a00b003df50eb7cd9mr3100496wmp.14.1676492595107; 
 Wed, 15 Feb 2023 12:23:15 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c2e8800b003dc3f195abesm2952540wmn.39.2023.02.15.12.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:23:14 -0800 (PST)
Message-ID: <40f6ba58-7cda-d062-960f-17ada0c85b24@mind.be>
Date: Wed, 15 Feb 2023 21:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Cem Sezer <cps@microplex.com>, buildroot@buildroot.org
References: <CACw=RXJvPxp4-z1JkH33ZBpGNEo37hQXnZTfyyeqVGiqXbYEqw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CACw=RXJvPxp4-z1JkH33ZBpGNEo37hQXnZTfyyeqVGiqXbYEqw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mRVKuXxN81QXAjjKzNEHx18yNng+rzDX9QtYboPXpM8=;
 b=NmGWZk30L9v4fNOCFczautjfTQbJCsV/Sq6IGLOYZlOMJX/yJaibDDoBwxne5h2+IW
 DGfz+FrBeLG2i4KrhfUwrKYofGbYJ0mOo6yKIUoH6gozrYdTcac3h7oE0sY1OExl8JAP
 M3NwU5Gdg51YAUgNg7C/cbR5qW+zIWe6MqmRN0UvPRVLwUMcreFphatjhuSKSN501ydn
 rvMZDRg7D/YRdLqWWbMiIkYrx2rqu0ILb1dCvXXlLwhzZGTg5FHbTdMu4X6N8QHxGNjq
 6DQGl3YCyLp0Uuc1/2cryjyQQNSZsf68bJkWsYYiyotRc/jtopCxVZLvfPTwCuAvY54/
 fu8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NmGWZk30
Subject: Re: [Buildroot] Having trouble getting a simple cmake based custom
 package to work
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNS8wMi8yMDIzIDAxOjEwLCBDZW0gU2V6ZXIgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gSSdt
IGxvb2tpbmcgdG8gY29udGludWUgdGhpcyB0aHJlYWQgYXMgSSBoYXZlIHRoZSBleGFjdCBzYW1l
IHByb2JsZW0uCj4gCj4gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJv
b3QvMjAyMC1BdWd1c3QvNTkxMjUwLmh0bWwgCj4gPGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9w
aXBlcm1haWwvYnVpbGRyb290LzIwMjAtQXVndXN0LzU5MTI1MC5odG1sPgo+IAo+IFRoZSBsYXRl
c3QgZW50cnkgaW4gdGhlIHRocmVhZCBpcyB0aGUgZm9sbG93aW5nLCBkaXNjdXNzaW5nIHRoZSBl
cnJvciBtZXNzYWdlIAo+ICIvTm8gcnVsZSB0byBtYWtlIHRhcmdldCAnaW5zdGFsbC9mYXN0Jzog
L2lzIHdoZXJlIEknbSBzdHVjayBhdMKgdGhlIG1vbWVudDoKPiAKPj4vSG93ZXZlciwgd2hlbiBp
dCBpcyAvPi90cnlpbmcgdG8gaW5zdGFsbCBteSBwYWNrYWdlIEkgaGF2ZSBhIG5ldyBlcnJvci4g
VGhlIHN5c3RlbSBzZWVtcyB0byBiZSAvPi9sb29raW5nIGZvciBhIGluc3RhbGwvZmFzdCB0YXJn
ZXQsIHdoaWNoIHRoZSBNYWtlZmlsIGRvZXMgbm90IGhhdmUuIC8KPiBJIGhhdmUgbm8gaWRlYSBv
biB0aGF0IHByb2JsZW0uICBNYXliZSByZWFkIHRoZSBDTWFrZSBkb2NzIGFnYWluPwo+IAo+IGh0
dHBzOi8vY21ha2Uub3JnL2NtYWtlL2hlbHAvbGF0ZXN0L2NvbW1hbmQvaW5zdGFsbC5odG1sICA8
aHR0cHM6Ly9jbWFrZS5vcmcvY21ha2UvaGVscC9sYXRlc3QvY29tbWFuZC9pbnN0YWxsLmh0bWw+
Cj4gCj4gR3JlZXRzCj4gQWxleAo+IAo+IEkgYW0gc3RpbGwgbmV3IHRvIGNtYWtlLCBidXQgSSd2
ZSBiZWVuIGhhdmluZyB0cm91YmxlIGdldHRpbmcgYSBiYXNpYyAKPiBoZWxsb3dvcmxkwqAoaW4g
QykgY21ha2UgcGFja2FnZSB0byB3b3JrLiBJIGxvb2tlZCBhdCB0aGF0IGxpbmsgYWJvdmUgZm9y
IHRoZSAKPiBjbWFrZSBkb2NzLCBidXQgYW0gdW5mYW1pbGlhciB3aXRoIHdoYXQgSSBuZWVkIHRv
IGRvIGhlcmUuIE15IENNYWtlTGlzdHMudHh0IAo+IHJpZ2h0IG5vdyBpcyBqdXN0IHRoZSBmb2xs
b3dpbmc6Cj4gCj4gY21ha2VfbWluaW11bV9yZXF1aXJlZChWRVJTSU9OIDMuMS4wKQo+IAo+IHBy
b2plY3QoaGVsbG93b3JsZF9jX2NtYWtlIExBTkdVQUdFUyBDKQo+IAo+IHNldChTT1VSQ0VTIG1h
aW4uYykKPiAKPiBhZGRfZXhlY3V0YWJsZSgke1BST0pFQ1RfTkFNRX0gJHtTT1VSQ0VTfSkKCiAg
U2luY2UgdGhlcmUgaXMgbm8gaW5zdGFsbGF0aW9uIHJ1bGUgaW4gdGhlIENNYWtlTGlzdHMudHh0
LCB0aGUgaW5zdGFsbC9mYXN0IAp0YXJnZXQgaXMgbm90IGdvaW5nIHRvIGJlIGdlbmVyYXRlZC4g
VGhlIGxpbmsgYWJvdmUgdG8gdGhlIGNtYWtlIGRvY3VtZW50YXRpb24gCmV4cGxhaW5zIGhvdyB0
byBhZGQgYW4gaW5zdGFsbGF0aW9uIHJ1bGUuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IAo+
IEFueSBwb2ludGVycyBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uIHdvdWxkIGJlIGFwcHJlY2lhdGVk
LiBQZXJoYXBzIHRoaXMgaXMgbW9yZSAKPiBvZiBhIGNtYWtlIHF1ZXN0aW9uIHRoYW4gYSBidWls
ZHJvb3QgcXVlc3Rpb24sIGJ1dCB0eWluZyB0aGUgdHdvIHRvZ2V0aGVyIGhhcyAKPiBiZWVuIGNv
bmZ1c2luZywgYW5kIEknbSBzdXJlIGl0IG11c3QgYmUgc29tZXRoaW5nIHNpbXBsZS7CoFRoYW5r
cyBpbiBhZHZhbmNlLAo+IAo+IENlbQo+IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
