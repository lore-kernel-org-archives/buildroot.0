Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCBEC3271F
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 07:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A836C8133A;
	Fri,  5 Jul 2024 07:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIp4-rWjV02M; Fri,  5 Jul 2024 07:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CE5480E80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CE5480E80;
	Fri,  5 Jul 2024 07:39:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6F11BF28C
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 07:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75A7640692
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 07:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xQTJr4KGFv3 for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 07:39:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 531034068F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 531034068F
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 531034068F
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 07:39:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-367aa05bf9dso221645f8f.3
 for <buildroot@buildroot.org>; Fri, 05 Jul 2024 00:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720165156; x=1720769956;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N1D7JoGCxZXOBPpA8wFZLKEbqaSnHuel00oHFcFl2XA=;
 b=ZecitppQe7bA812hd6i8/AAgAp3hedD3R4mT5Y+/sdyy6LqjjPthfRv6sh39KK8c9R
 qNXKeMcXazJRFhLYRyKTgLNvh2jAbCa1144tk1cKnoRDVNeSPluCXZJrRZNhr3x/6FYe
 LFHhZmjR5OVFOM24bvc+Cn0hBmgGOCVX2ysulPZo32zmT3QZIz+Y6/ymhDyPltVQ9UZF
 LRE/3CLTyxNKTMeeDkntFG0mpU/xyXUNrzmhsVN+A0J2eieh1eswkRSMQOTG52Ifw2+G
 hOlzHM5NAeDYgdBLGon129vRp+MUkKjWChr9+XGEwdIfSPYrDcydqUiJpJQUU0bYbQ8L
 bTqQ==
X-Gm-Message-State: AOJu0YwbPLCNuvNaM2sj4aStulyNHBCfXXA0ZDCRof137fSlk5XckLcD
 QqNJngi+DgYw/2k7WQyY8WMikMQgBnfFHi6koXdcOw2Yzvy/XY4yOCWw8WDAyNMLbhkzQL3jTPg
 F
X-Google-Smtp-Source: AGHT+IFHDqUJ1kUFw1DwJrd62/xGIeRC3zfTvtaXRmCvLBXXXO5a8GQd38jL2eL07u/H16wabW8C1g==
X-Received: by 2002:adf:e50f:0:b0:367:9224:9620 with SMTP id
 ffacd0b85a97d-3679dd3114dmr2576391f8f.3.1720165155897; 
 Fri, 05 Jul 2024 00:39:15 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3679976da15sm3921995f8f.94.2024.07.05.00.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 00:39:15 -0700 (PDT)
Message-ID: <6d02d2d5-e71e-45b3-a447-e81521085e7a@mind.be>
Date: Fri, 5 Jul 2024 09:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240702165708.3796162-1-fiona.klute@gmx.de>
 <20240702165708.3796162-2-fiona.klute@gmx.de> <ZoRf7pXimhw4wh-s@landeda>
 <8fe270a0-708f-49f8-972e-221e99f23f08@mind.be>
 <c53f5d9b-2402-4759-ba38-ebc639c11f29@gmx.de>
 <8b5aaedd-ed7f-47c9-8632-9fd901351e11@mind.be>
 <8839b2c6-f3f7-45e2-a92a-6ab5a64f55f8@gmx.de>
 <b554de6c-fbfd-4fce-a887-bb1ec2cadc87@mind.be>
 <3e46a7cc-215f-41b7-b65c-d4c812c13351@gmx.de>
Content-Language: en-GB
In-Reply-To: <3e46a7cc-215f-41b7-b65c-d4c812c13351@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720165156; x=1720769956; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N1D7JoGCxZXOBPpA8wFZLKEbqaSnHuel00oHFcFl2XA=;
 b=X0xy045/O5Y3gfSkpPvl9ZHLIbXBvBfHMWMYeX0vJlkPREJgWys7WunxQULNBlkRnu
 UP/gRw3hp0UNF9HdLyfzrD+bfcIv974DG+Wrik0Q1oN4zAbIgE5lY+8DLuhq8yHn1DCI
 OtGfonl4IItK330tOwl2RkWCO1xdgYGiJpKe3KU9nUX0mEblelaeufUK12okb7MRsM8J
 XkrZUFgqwy7c6Xq2+Pf/LBDDtd4kkM0XFUTDg6RHgdQPKnsEkL+kNw00T3HxNMJsO60B
 Z3Th/7zlj5Trc+eZE42D9W6GEvvT4WeM5WYGJ8gj0igIdOb5lo6Uc30v8mlCRcXe8/8f
 llKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X0xy045/
Subject: Re: [Buildroot] [PATCH v2 1/4] package/openssh: don't kill open
 sessions on restart
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNC8wNy8yMDI0IDEyOjI1LCBGaW9uYSBLbHV0ZSB3cm90ZToKPiBBbSAwNC4wNy4yNCB1
bSAxMDo1OCBzY2hyaWViIEFybm91dCBWYW5kZWNhcHBlbGxlOgo+PiBPbiAwNC8wNy8yMDI0IDEw
OjIxLCBGaW9uYSBLbHV0ZSB3cm90ZToKPj4+IEFtIDA0LjA3LjI0IHVtIDEwOjAwIHNjaHJpZWIg
QXJub3V0IFZhbmRlY2FwcGVsbGU6Cj4+Pj4gT24gMDMvMDcvMjAyNCAxNzo0NiwgRmlvbmEgS2x1
dGUgd3JvdGU6CltzbmlwXQo+Pj4gQW5vdGhlciByZWxhdGVkIHF1ZXN0aW9uOiBJIHVzZWQgdGhl
IGxvbmcgb3B0aW9ucyBiZWNhdXNlIGluIG15IG9waW5pb24KPj4+IGl0IG1ha2VzIHRoZSBzY3Jp
cHQgZWFzaWVyIHRvIHJlYWQuIEhvd2V2ZXIsIEkgbm90aWNlZCB0aGF0IHRoaXMgd291bGQKPj4+
IGJyZWFrIGlmIHNvbWVvbmUgd2VyZSB0byBzZXQKPj4+IENPTkZJR19GRUFUVVJFX1NUQVJUX1NU
T1BfREFFTU9OX0xPTkdfT1BUSU9OUz1uIChkZWZhdWx0IGlzIHkpLiBJIGd1ZXNzCj4+PiB0aGF0
IG1lYW5zIEkgc2hvdWxkIHN0aWNrIHRvIHRoZSBzaG9ydCBvcHRpb25zPwo+Pgo+PiDCoMKgTm8s
IGZvciBhbGwgb2YgdGhlIEJ1aWxkcm9vdC1zdXBwbGllZCBzY3JpcHRzLCB3ZSBjYW4gYXNzdW1l
IHRoYXQgdGhlCj4+IEJ1aWxkcm9vdC1kZWZhdWx0IGJ1c3lib3ggKGFuZCB1Q2xpYmMgYW5kIC4u
Likgb3B0aW9ucyBhcmUgdHVybmVkIG9uLgo+Pgo+PiDCoMKgSWYgdGhlcmUgaXMgc29tZSBvcHRp
b24gdGhhdCB3ZSBuZWVkIHR1cm5lZCBvbiBmb3Igc29tZSBzcGVjaWZpYwo+PiB0aGluZywgd2Ug
dHlwaWNhbGx5IHVwZGF0ZSBvdXIgZGVmYXVsdCBidXN5Ym94IGNvbmZpZyB0byBoYXZlIGl0IGVu
YWJsZWQuCj4+Cj4+IMKgwqBQZW9wbGUgd2hvIHVzZSBhIGN1c3RvbSBidXN5Ym94IGNvbmZpZyBh
cmUgcmVzcG9uc2libGUgZm9yIG1ha2luZyBzdXJlCj4+IHRoYXQgYWxsIHRoZSBzY3JpcHRzIHN0
aWxsIHdvcmssIGFuZCBpZiBub3QsIGFkYXB0IHRoZSBzY3JpcHRzCj4+IGFjY29yZGluZ2x5IChp
biBhbiBvdmVybGF5KS4KPj4KPj4gwqDCoE9mIGNvdXJzZSwgYWxsIG9mIHRoZSBhYm92ZSBpcyBl
bnRpcmVseSB1bmRvY3VtZW50ZWQuIEZlZWwgZnJlZSB0bwo+PiB1cGRhdGUgdGhlIGRvY3VtZW50
YXRpb24gdG8gZXhwbGFpbiB0aGlzIQo+IAo+IFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uISBX
aGVyZSB3b3VsZCBiZSB0aGUgcmlnaHQgcGxhY2UgdG8gYWRkIHRoYXQ/Cj4gVGhlIEJ1c3lib3gg
c2VjdGlvbiBpbiAiQ2hhcHRlciA3LiBDb25maWd1cmF0aW9uIG9mIG90aGVyIGNvbXBvbmVudHMi
LAo+ICIxOC41LiBUaGUgU05OZm9vIHN0YXJ0IHNjcmlwdCIsIG9yIHNvbWV3aGVyZSBlbHNlPwoK
ICBIbSwgbm8sIEkgZG9uJ3QgdGhpbmsgc28uIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRv
IGFkZCBhIG5ldyBzZWN0aW9uIAoiSW50ZWdyYXRpb24gcHJpbmNpcGxlcyIgdW5kZXIgIjEwLiBJ
bnRlZ3JhdGlvbiB0b3BpY3MiLgoKPiBJIHNlZSB0aGF0IHBhY2thZ2UvYnVzeWJveC9idXN5Ym94
LmNvbmZpZyBhbmQKPiBwYWNrYWdlL2J1c3lib3gvYnVzeWJveC1taW5pbWFsLmNvbmZpZyBib3Ro
IHNldAo+IENPTkZJR19GRUFUVVJFX1NUQVJUX1NUT1BfREFFTU9OX0xPTkdfT1BUSU9OUz15LCBz
byBJJ3ZlIHNlbmQgYSB2NCB0aGF0Cj4gYXZvaWRzIC0tcmV0cnkgYnV0IG90aGVyd2lzZSBrZWVw
cyB0aGUgbG9uZyBvcHRpb25zLgoKICBPaCwgcmlnaHQsIEkgZm9yZ290IHRvIGFuc3dlcjogSSdt
IGFsc28gYSBmYW4gb2YgdXNpbmcgbG9uZyBvcHRpb25zIGFzIG11Y2ggYXMgCnBvc3NpYmxlIGlu
IHNjcmlwdHMsIGV4Y2VwdCBmb3Igc29tZSB2ZXJ5IHdlbGwta25vd24gb25lcyAobGlrZSBybSAt
ZikuIEl0J3Mgbm90IApob3cgdGhpbmdzIGN1cnJlbnRseSBhcmUgaW4gQnVpbGRyb290LCBidXQg
SSBmZWVsIHRoYXQgdGhhdCBpcyBhICJydWxlIiB3ZSBjYW4gCmJyZWFrLgoKICBSZWdhcmRzLAog
IEFybm91dAoKW3NuaXBdCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
