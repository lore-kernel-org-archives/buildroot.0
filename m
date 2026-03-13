Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844C0107BCE8
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3764760DF7;
	Fri, 13 Mar 2026 21:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuGY9I6-na-B; Fri, 13 Mar 2026 21:25:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41CF060DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773437154;
	bh=dUfM9k+Clu84aUMMtKUeV76gvKZl1RvFBWWhNcWsl4s=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Xyn3EPEfh+Y9VKntYoys2MSpxQ1xtXwC0Cw5onIOIsF57zXz8HkGPkgoUFCJmCky3
	 0ExF1OuEFLlkDCvEt7eHr3OOPKyp9Kcjq0IvoJUBeXXo/VdtgJyUb9zmkX6XmG4xMl
	 bcEkw/CgxFl4PMRCCnvCXJdgSjjseY8uE70dfJXt5reXLiokhx5hutu97q4Pq3BJH+
	 NuE+C71fexRFUmd/mn+L5RcAaFTv8qZh7T2qKBFljfI35uv5fqCnKjP9scZVYYM4NS
	 kc8cJNGiRxeodojawA491i5fJk7L4nJlMH11aMH3OGXgX+i72q7edN1hcxPfAQvX6j
	 mwy94gKLOg6Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41CF060DFA;
	Fri, 13 Mar 2026 21:25:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 448AB1AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 363EE405D8
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAMpRQuBWkKM for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:25:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28B594005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28B594005A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28B594005A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:25:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-483487335c2so25440765e9.2
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 14:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773437150; x=1774041950;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4MFTA/dceE9W2Wb894iWMlOg/bv7KHcBNq6WcTJt4vE=;
 b=EsSZF1tKJjZqYyIp/ZDdeWp9hSQDwq4cK6iH285zInABnUTvx/EqsiFerNenrRcsAP
 GQXcK6ms/Nr1mug4Jls614WUPGTbX/LlultPO1fbyybYWX0rkNdqpETH3wxRsl2V4mQh
 Jlu2Wc0BiUubuaFe0DaeMkGvvXrEvwO1WGlGpVuLfRLpeL5bbCrVWjaTasK1h69DJafk
 3HXIx/v6WGe2nhITFHJMZJXtCkMO3x8orWK1nhv39dgQqYO2r6uPegE67XWC+I6vRuiq
 QrhXia0+wjGTMaZlBqCkzs+0Zm5ERd7Cf2/YfA24UlUD+9sWQEyh7MYXRL7eK8Ilhqdm
 w/Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNhOY6u+lHgeWr/1r/STiXlhoCec1RWvrekXo+6EnWYRmq80A4bUTustl7KPDOwByj5M7+mti7nkw=@buildroot.org
X-Gm-Message-State: AOJu0YwEngfmyX4gMXDE3+0wPPJpKTqjchjpZ6R+7usGNZ+CbXQURXee
 hvuDzhE1QOThaWsUrrBZjvs8V54DKw4aRAKUkBc7fpofQ4EmrPmSAnjVh9SNQ2Xrn/o=
X-Gm-Gg: ATEYQzx8ROF8iK7uVWtSlbwIFHyaaAdCHr/hozXZ4oeXhyoaeDK5qVggvhFl373IJBH
 xoOx63ViMQpGgc4jmQpVTnBkd+z4oXUFK+06eW5+0PcyseSfr+8YCGKcI79WHwMYY2WI5RO2G9n
 FZGEeHPNVIeOW0vMRiWBmsM6h7kT0k2O/w+Xr2v6hMEtuGInfMaXrQ1fzXcVaJPir+ijqzKlmNQ
 /XkvGHInhEckz9mvwLz4oyH08cWHvxihtRi0bTOwSLEEtMSud8OzvvA4q8SoLGNdVyPp68bO24W
 gIo3CBJgrBkT1/2bv+KSBVl4vT1TJoYJRICXFeOH8G0i6a8TGvULxAA2cGGeXfholdAwrHXu/G8
 Zjr8fPEkXbc4D98U9CHeMi3fOxaoCSoNtDVhFSi53YdaflNJ/FYweTYtnoW7WQzRAa5uSrBK0vL
 4qJ4vNvc2ExEbA2toJh4mmd42N7ckiko3PiAoXPZ1lceomijsGoagiTY05lBOl71CZAWRPL0agC
 RNeahDKAuPVJuKpIGFnD/BGyVjO06rudBS+RFiMdaYcfa0PMRVuHJHZ2ImIE2KN4w==
X-Received: by 2002:a05:600c:8519:b0:485:5812:bb9e with SMTP id
 5b1f17b1804b1-4855812bbddmr85947375e9.0.1773437149815; 
 Fri, 13 Mar 2026 14:25:49 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541aa73dasm879412735e9.2.2026.03.13.14.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 14:25:49 -0700 (PDT)
Message-ID: <3497ed01-3aac-4f24-a9d1-ac68b88cb035@smile.fr>
Date: Fri, 13 Mar 2026 22:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1770155657.git.yann.morin.1998@free.fr>
 <7afd223643ad94c36adc4ff486197aba5f073d0d.1770155657.git.yann.morin.1998@free.fr>
Content-Language: fr
In-Reply-To: <7afd223643ad94c36adc4ff486197aba5f073d0d.1770155657.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773437150; x=1774041950; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4MFTA/dceE9W2Wb894iWMlOg/bv7KHcBNq6WcTJt4vE=;
 b=YsamN3jK7Zy5j5D+SYalZiO+QOTJ59cOHY1N32CPk4J5TZHxVf8Bx+c6dwjlScFD9M
 ui6lVJ2S1irKjYGBrrpwPh838qyW4ArYLZ2hrePP7V7acXLa1B2bnWVnzz/dT9YmeH6O
 1IkP4zWNgkT4hfD5+0FbakYAwxR5owLHlPXMg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=YsamN3jK
Subject: Re: [Buildroot] [PATCH 1/3 v4] support/br2-external: remove
 leftover trap
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

TGUgMDMvMDIvMjAyNiDDoCAyMjo1NCwgWWFubiBFLiBNT1JJTiB2aWEgYnVpbGRyb290IGEgw6lj
cml0wqA6Cj4gVGhlIHRyYXAgd2FzIGluaXRpYWxseSBpbnRyb2R1Y2VkIGluIGM1ZmE5MzA4ZWE0
ZSAoY29yZS9icjItZXh0ZXJuYWw6Cj4gcHJvcGVybHkgcmVwb3J0IHVuZXhwZWN0ZWQgZXJyb3Jz
KSwgaW4gMjAxNywgdG8gY2F0Y2ggYWxsIHVuZXhwZWN0ZWQKPiBlcnJvcnMsIGJhY2sgd2hlbiBh
IHNpbmdsZSBmaWxlIHdhcyBnZW5lcmF0ZWQsIGFuZCBlcnJvcnMgZW1pdHRlZCB0bwo+IHN0ZGVy
ci4KPiAKPiBTaW5jZSBjb21taXQgZDAyN2NkNzVkMDk4IChjb3JlOiBnZW5lcmF0ZSBhbGwgYnIy
LWV4dGVybmFsIGZpbGVzIGluCj4gb25lIGdvKSwgaW4gMjAxOSB0aGUgc2luZ2xlIG91dHB1dCBm
aWxlICdvZmlsZScgaXMgbm8gbG9uZ2VyIGNyZWF0ZWQsCj4gYXMgbXVsdGlwbGUgb3V0cHV0IGZp
bGVzIHdlcmUgdGhlbiBpbnRyb2R1Y2VkLCB3aGlsZSBtZXNzYWdlcyBmb3IKPiAqZXhwZWN0ZWQg
ZXJyb3JzKiB3ZXJlIHJlZGlyZWN0ZWQgdG8gYSBNYWtlZmlsZSB2YXJpYWJsZSBhc3NpZ25tZW50
Cj4gZW1pdHRlZCBvbiBzdGRvdXQsIGF0IHdoaWNoIHBvaW50IHRoZSBzY3JpcHQganVzdCBleGl0
cyAoaW4gZXJyb3IpOwo+IGV4cGVjdGVkIGZhaWx1cmVzIG9ubHkgb2NjdXIgaW4gZG9fdmFsaWRh
dGUoKS4KPiAKPiBVbmV4cGVjdGVkIGVycm9ycyBjYW4gb25seSBvY2N1ciBvbiBmYWlsdXJlIHRv
IGNyZWF0ZSwgb3Igd3JpdGUgdG8sCj4gb3V0cHV0IGZpbGVzLCBlaXRoZXIgJy5icjItZXh0ZXJu
YWwubWsnIGluIGRvX3ZhbGlkYXRlKCkgb3IgZG9fbWsoKSwKPiBvciBhbnkgb2YgdGhlIGtjb25m
aWcgZnJhZ21lbnRzIGluIGRvX2tjb25maWcoKS4gQ2F1c2UgZm9yIGZhaWx1cmUgdG8KPiBjcmVh
dGUgdGhvc2UgY2FuIG9ubHkgYmUgYSBuby1zcGFjZS1sZWZ0LW9uLWRldmljZSBjb25kaXRpb24s
IGFzIHRoZXkKPiBhcmUgY3JlYXRlZCBpbiBhIGRpcmVjdG9yeSB0aGF0IHdhcyBqdXN0IGNyZWF0
ZWQgYnkgdGhlIHNjcmlwdCBlYXJsaWVyCj4gaW4gbWFpbigpLCBhbmQgdGh1cyBoYXMgdGhlIG5l
Y2Vzc2FyeSBtb2RlOyBmYWlsdXJlIHRvIGNyZWF0ZSB0aGF0Cj4gZGlyZWN0b3J5IGlzIG5vdyBj
YXVnaHQgZXhwbGljaXRseS4KPiAKPiBBIHRyYXAgb24gRVJSIGlzIG5vdCBjYWxsZWQgd2hlbiB0
aGUgc2hlbGwgZXhpdHMgZXhwbGljaXRseSB3aXRoIGEgY2FsbAo+IHRvICdleGl0JywgdGh1cywg
b25seSBmYWlsdXJlcyB0byBjcmVhdGUgb3Igd3JpdGUgdG8gb3V0cHV0IGZpbGUgd291bGQKPiBi
ZSBjYXVnaHQuIEluIHRoYXQgY2FzZSwgd2UgYXJlIGJldHRlciBvZmYgbm90IHRyeWluZyB0byB3
cml0ZSB0byB0aG9zZQo+IGZpbGVzIGFueXdheTogZmFpbHVyZSB0byBjcmVhdGUgdGhlIGZpbGUg
d291bGQgYWxyZWFkeSBiZSByZXBvcnRlZCBieQo+IHRoZSBzaGVsbCBvbiBzdGRlcnIsIHdoaWxl
IGRpc2stZnVsbCB3b3VsZCBub3QgYWxsb3cgdG8gc3RvcmUgdGhlIG91dHB1dAo+IGFueXdheS4u
Lgo+IAo+IEluIGFueSBjYXNlLCB0aGUgc2NyaXB0IGV4aXRzIGluIGVycm9yLCB3aGljaCBpcyBn
b2luZyB0byBiZSBjYXVnaHQgYnkKPiB0aGUgY2FsbGVyLCB3aGljaCB3aWxsIHRlcm1pbmF0ZS4K
PiAKPiBTbywgZHJvcCB0aGUgdHJhcCBhbHRvZ2V0aGVyLgo+IAo+IEFzIGEgc2lkZSBlZmZlY3Qs
IHRoYXQgc3F1ZWxjaGVzIGEgc2hlbGxjaGVjayBlcnJvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZ
YW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KCkFwcGxpZWQgdG8gbWFzdGVy
LCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gLS0tCj4gTm90ZTogcmVtYWlu
aW5nIHNoZWxsY2hlY2sgZXJyb3JzIHdpbGwgYmUgYWRkcmVzc2VkIHNlcGFyYXRlbHkgaW4gdGhl
Cj4gZm9sbG93aW5nIHBhdGNoLgo+IC0tLQo+ICBzdXBwb3J0L3NjcmlwdHMvYnIyLWV4dGVybmFs
IHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRzL2JyMi1leHRlcm5hbCBiL3N1
cHBvcnQvc2NyaXB0cy9icjItZXh0ZXJuYWwKPiBpbmRleCA4YWVhNDc5ZDIwLi42ZDRmYzFhNzkx
IDEwMDc1NQo+IC0tLSBhL3N1cHBvcnQvc2NyaXB0cy9icjItZXh0ZXJuYWwKPiArKysgYi9zdXBw
b3J0L3NjcmlwdHMvYnIyLWV4dGVybmFsCj4gQEAgLTMwLDEwICszMCwxMCBAQCBtYWluKCkgewo+
ICAgICAgICAgIGVycm9yICJubyBvdXRwdXQgZGlyZWN0b3J5IHNwZWNpZmllZCAoLWQpXG4iCj4g
ICAgICBmaQo+ICAKPiAtICAgICMgVHJhcCBhbnkgdW5leHBlY3RlZCBlcnJvciB0byBnZW5lcmF0
ZSBhIG1lYW5pbmdmdWwgZXJyb3IgbWVzc2FnZQo+IC0gICAgdHJhcCAiZXJyb3IgJ3VuZXhwZWN0
ZWQgZXJyb3Igd2hpbGUgZ2VuZXJhdGluZyAke29maWxlfVxuJyIgRVJSCj4gKyAgICBpZiAhIG1r
ZGlyIC1wICIke291dHB1dGRpcn0iOyB0aGVuCj4gKyAgICAgICAgZXJyb3IgIkNhbm5vdCBjcmVh
dGUgb3V0cHV0IGRpcmVjdG9yeSAnJXMnXG4iICIke291dHB1dGRpcn0iCj4gKyAgICBmaQo+ICAK
PiAtICAgIG1rZGlyIC1wICIke291dHB1dGRpcn0iCj4gICAgICBkb192YWxpZGF0ZSAiJHtvdXRw
dXRkaXJ9IiAke0AvLzovIH0KPiAgICAgIGRvX21rICIke291dHB1dGRpcn0iCj4gICAgICBkb19r
Y29uZmlnICIke291dHB1dGRpcn0iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
