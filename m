Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BC8C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60BA981119;
	Tue,  2 Jul 2024 19:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qv6Y5Hgpc9VH; Tue,  2 Jul 2024 19:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44D0A810F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44D0A810F5;
	Tue,  2 Jul 2024 19:30:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEB491BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A409D404DA
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9e25ekUOj4c1 for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:30:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32EB140162
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32EB140162
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32EB140162
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:30:07 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4256742f67fso33320995e9.3
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719948606; x=1720553406;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lhoVhapqo4EO3Gh5tfvnHXkx195M2djSD5yW0lvCGqI=;
 b=j668xYeqFlrw8BtNwCnwGqdAfZ5TLIfEK59DrS7HffKKg4R9tHnOOwNyWi4a6MSR0T
 /romaVwGX6P40W8VkTzG9NyZ7z6nqest3emUHdXa0kDxdaFH2g117RyRo1NwssTr7E5J
 +KkbpitgF3c8zM1A0cVij8V7nTGkGtYNnKVow/+rz+56kaVzGXkJ8G5wkIAXm2CBdRyl
 gfKavxK9kTwZX6VBK6DQTdyL3a7sq563mpZWdx/qwnIaK83nzQiWcTsRwnThBdi8Zcy+
 1yCq/aqSlws1Q9bOf2pOLNDIJx/JaLHaDzpBx1wCULtD0rVvGMFqkHNP8JWdG8KYFB0l
 6YeQ==
X-Gm-Message-State: AOJu0YwyZ1URqNK/aCAr5eAzwgr44xt7pcj8qBpy6MFd1FoI0q9P5Sm7
 q50jk9lqNU5h3J2n2IIx+HIB2OV6gRUnidZ0Mq5i7ESujSUiVsUrO46CR4Huo8s=
X-Google-Smtp-Source: AGHT+IHe6iGBFbhf2igxytlrsFF4EiSK03lV9SRMOY1CvEKl/HAuFRtSwzvm0RGrYXnX/ftYqz66Ug==
X-Received: by 2002:a05:600c:3204:b0:421:f4da:f4b with SMTP id
 5b1f17b1804b1-4257a0282b9mr48158725e9.40.1719948606103; 
 Tue, 02 Jul 2024 12:30:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a1046f2sm13960236f8f.112.2024.07.02.12.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 12:30:05 -0700 (PDT)
Message-ID: <9e634ca2-9481-45bb-a424-b6dc809eb625@mind.be>
Date: Tue, 2 Jul 2024 21:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nevo Hed <nhed+buildroot@starry.com>,
 Niklas Yann Wettengel <niyawe@niyawe.de>
References: <20240702123615.1028278-2-niyawe@niyawe.de>
 <CABGDZCn0UoL6pxwjg2Xw1NpC1SFUQK5uvfRdnc4nfRKercVS8w@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CABGDZCn0UoL6pxwjg2Xw1NpC1SFUQK5uvfRdnc4nfRKercVS8w@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719948606; x=1720553406; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lhoVhapqo4EO3Gh5tfvnHXkx195M2djSD5yW0lvCGqI=;
 b=JpfPnZbepTuJU0L8rSsbLNSZusDOHHDVQBBMvWL20QBwtYabO8c8IAtfqiF2phPnA3
 qE7fnZn5up/W7LDbtpruBdS4LMRD8aoEIsuGnZv51CtZ4EWzvLfTvpnZOcdpcwVp/yBQ
 iGKds5YQrEjoNtmf+FIqdBSM6GdkkvDnMgZXJirch0QLvCWlCQEZgK4YmngpM6a2rGyM
 oxow6vhgbbaf7cONQgWs4Wn2jW3quPhHK//1dUNp/atud60v6/jw0WLzfn25gLf7NBlL
 F0q7WOGYPnXdUkmtfOaVBQJZU9KL+D6LDnGFv6HROWGzBoyT/woLiVZbaHJ9rYI3uh/N
 hnxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JpfPnZbe
Subject: Re: [Buildroot] [PATCH 1/1] packages/openssh: install sshd-session
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

CgpPbiAwMi8wNy8yMDI0IDE3OjUzLCBOZXZvIEhlZCB2aWEgYnVpbGRyb290IHdyb3RlOgo+ICsx
IC0gSSBjYW1lIGhlcmUgdG8gc3VnZ2VzdCB0aGUgc2FtZSBwYXRjaAoKICBUaGUgcHJvcGVyIHdh
eSB0byBzYXkgdGhpcyBpcyBieSByZXBseWluZyB3aXRoCgpUZXN0ZWQtYnk6IE5ldm8gSGVkIDxu
aGVkK2J1aWxkcm9vdEBzdGFycnkuY29tPgoKaW4gdGhlIGJvZHkgb2YgdGhlIHJlcGx5LiBQYXRj
aHdvcmsgcGlja3MgdGhhdCB1cCBhbmQgYWRkcyBpdCB0byB0aGUgY29tbWl0IAptZXNzYWdlLCBz
byB5b3UncmUgY3JlZGl0ZWQgZm9yIHRoYXQgZWZmb3J0LgoKICBJJ3ZlIG5vdyBkb25lIHRoYXQg
bWFudWFsbHksIGJ1dCBzaW5jZSBJIHdhc24ndCBzdXJlIGlmIHlvdSBhY3R1YWxseSB0ZXN0ZWQg
Cml0LCBJIGdhdmUgaXQgYSBSZXZpZXdlZC1ieSBpbnN0ZWFkIG9mIGEgVGVzdGVkLWJ5LgoKICBS
ZWdhcmRzLAogIEFybm91dAoKPiAKPiBPbiBUdWUsIEp1bCAyLCAyMDI0IGF0IDg6MzbigK9BTSBO
aWtsYXMgWWFubiBXZXR0ZW5nZWwgPG5peWF3ZUBuaXlhd2UuZGUgCj4gPG1haWx0bzpuaXlhd2VA
bml5YXdlLmRlPj4gd3JvdGU6Cj4gCj4gICAgIEluIE9wZW5TU0ggOS44IHRoZSBzZXJ2ZXIgaXMg
c3BsaXQgaW50byB0d28gcHJvY2Vzc2VzOiBzc2hkIGFuZAo+ICAgICBzc2hkLXNlc3Npb24gd2hp
Y2ggcmVzdWx0cyBpbiB0aGUgZm9sbG93aW5nIGVycm9yLCB3aGVuIHRyeWluZwo+ICAgICB0byBz
dGFydCBzc2hkOgo+IAo+ICAgICBTdGFydGluZyBzc2hkOiAvdXNyL2xpYmV4ZWMvc3NoZC1zZXNz
aW9uIGRvZXMgbm90IGV4aXN0IG9yIGlzIG5vdCBleGVjdXRhYmxlCj4gCj4gICAgIFRoaXMgcGF0
Y2ggaW5zdGFsbHMgdGhlIHNzaGQtc2Vzc2lvbiBiaW5hcnkKPiAKPiAgICAgU2lnbmVkLW9mZi1i
eTogTmlrbGFzIFlhbm4gV2V0dGVuZ2VsIDxuaXlhd2VAbml5YXdlLmRlCj4gICAgIDxtYWlsdG86
bml5YXdlQG5peWF3ZS5kZT4+Cj4gICAgIC0tLQo+ICAgICAgwqBwYWNrYWdlL29wZW5zc2gvb3Bl
bnNzaC5tayA8aHR0cDovL29wZW5zc2gubWs+IHwgMSArCj4gICAgICDCoDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+IAo+ICAgICBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc3NoL29w
ZW5zc2gubWsgPGh0dHA6Ly9vcGVuc3NoLm1rPgo+ICAgICBiL3BhY2thZ2Uvb3BlbnNzaC9vcGVu
c3NoLm1rIDxodHRwOi8vb3BlbnNzaC5taz4KPiAgICAgaW5kZXggNmQ4NDZmNjRkZi4uNzA2NWMz
YWU0ZiAxMDA2NDQKPiAgICAgLS0tIGEvcGFja2FnZS9vcGVuc3NoL29wZW5zc2gubWsgPGh0dHA6
Ly9vcGVuc3NoLm1rPgo+ICAgICArKysgYi9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tayA8aHR0
cDovL29wZW5zc2gubWs+Cj4gICAgIEBAIC0xMTcsNiArMTE3LDcgQEAgZW5kaWYKPiAgICAgIMKg
aWZlcSAoJChCUjJfUEFDS0FHRV9PUEVOU1NIX1NFUlZFUikseSkKPiAgICAgIMKgZGVmaW5lIE9Q
RU5TU0hfSU5TVEFMTF9TRVJWRVJfUFJPR1JBTVMKPiAgICAgIMKgIMKgIMKgIMKgICQoSU5TVEFM
TCkgLUQgLW0gMDc1NSAkKEBEKS9zc2hkICQoVEFSR0VUX0RJUikvdXNyL3NiaW4vc3NoZAo+ICAg
ICArwqAgwqAgwqAgwqAkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChARCkvc3NoZC1zZXNzaW9uCj4g
ICAgICQoVEFSR0VUX0RJUikvdXNyL2xpYmV4ZWMvc3NoZC1zZXNzaW9uCj4gICAgICDCoCDCoCDC
oCDCoCAkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChARCkvc2Z0cC1zZXJ2ZXIKPiAgICAgJChUQVJH
RVRfRElSKS91c3IvbGliZXhlYy9zZnRwLXNlcnZlcgo+ICAgICAgwqBlbmRlZgo+ICAgICAgwqBP
UEVOU1NIX1BPU1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0gT1BFTlNTSF9JTlNUQUxMX1NFUlZF
Ul9QUk9HUkFNUwo+ICAgICAtLSAKPiAgICAgMi40NS4yCj4gCj4gICAgIF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gICAgIGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiAgICAgYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcgPG1haWx0bzpidWlsZHJvb3RAYnVp
bGRyb290Lm9yZz4KPiAgICAgaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cj4gICAgIDxodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3Q+Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
