Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14493C5478C
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 13:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE53D81E92;
	Fri, 23 Feb 2024 13:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4POd6S3rhidA; Fri, 23 Feb 2024 13:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C64F382000
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C64F382000;
	Fri, 23 Feb 2024 13:19:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 858261BF2BC
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 13:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72CA060870
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 13:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1q1UVlRp-OA for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 13:19:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27DBB6086F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27DBB6086F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27DBB6086F
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 13:18:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-412895f726dso2370855e9.3
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 05:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708694338; x=1709299138;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4jUkYvfngaDF8wCOrEEcL3RAycoWNMNHVDZ5Urv0ZqY=;
 b=aChB4xDadZhXN82D1MNMcLpD+LefqQbCWpmP7AQ+0v+uJ7TX6oiiyDWTbJ0hoN222w
 Yuz1ZzhG8XwEHiWF8L71lKzeKAqYChTzFcgw9KNMbXN75lwH1js3GD8QRhub7DpnHKVE
 LfuOGmrsL+muNFiIZK42ko/BA1AFnqToflfy6hiUUGh10PUEaHeJ/ePtBZz5xu2V9Q6C
 Jd9D7GzI3SEH60Gjxf2Oob4whJwCFO62PeFStm1wXMpgEd0A9/k7wZ16Z6muOrQ22yMk
 8bpoUm9ZrYD8e0GtSLVDNNNCB87zKeKxVgIVVSYEpu2xVCNvAveP6qeUPHdyvnrrBQDO
 3kFw==
X-Gm-Message-State: AOJu0YxXQpkQOpOMh2VjhgCgF0/RMu7PGIkbXlAAnzFABe8ZfUWeF4Tn
 f2q9ZWyI5TCPzv2Zo3qHzRXaa6Z2oSRJOFKHnZwgzsmUmsmhfiGNSqRiJeyqk2g=
X-Google-Smtp-Source: AGHT+IFWuALc4qUJUNG8nh5foynue3mdaf/6KjKo0YcQem0CJU11nI2JeJUYPnmLdnj2JQBwiYAc9w==
X-Received: by 2002:a05:600c:1c88:b0:412:7721:ba87 with SMTP id
 k8-20020a05600c1c8800b004127721ba87mr1194383wms.31.1708694337626; 
 Fri, 23 Feb 2024 05:18:57 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 p29-20020a05600c1d9d00b00411a6ce0f99sm2421651wms.24.2024.02.23.05.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 05:18:57 -0800 (PST)
Message-ID: <6fbbc25d-8502-453e-9b57-1145244e29d9@smile.fr>
Date: Fri, 23 Feb 2024 14:18:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
 <20240222101617.18422-15-dario.binacchi@amarulasolutions.com>
 <62b63f26-4e2e-4538-a422-bc7f7e131fb9@smile.fr>
 <CABGWkvrYGNUC0mAeNBGSm9FY8=kfq+FGKawuM1AuPzzjDsbUOA@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CABGWkvrYGNUC0mAeNBGSm9FY8=kfq+FGKawuM1AuPzzjDsbUOA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708694338; x=1709299138;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4jUkYvfngaDF8wCOrEEcL3RAycoWNMNHVDZ5Urv0ZqY=;
 b=YJ0LvimWEI/8lBk40hGzLcFVj2iDDmIE5375z+AUEnoXi1SiuucaWJe8GuXwBnWivN
 96myDN6c5gODcyLPUYE+bCbaYlebSxO4T1yIZQwcxzcmDTgBt8gCZ72p6VviT05QrEYO
 RTIHex9PxuZnVMbYlj6Zye68fgdGmZDmOzDJZQEuvXVY64eah+ozvOytO9HYj/cxh+Eg
 PLhj7MI8KhWXNJ6/zq4k4zBeo8GVUJOKnnnmKpk8EL1djc+8SVQ+kw4snAabA/Phep//
 92sTSybezQuk3HiV3s1O0pw2LUyBbBgP4CX3usSKQGVQiHMWfJxJrMxutdoveBeJ/KdN
 R6zw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=YJ0LvimW
Subject: Re: [Buildroot] [PATCH v5 14/16] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgpMZSAyMy8wMi8yMDI0IMOgIDEyOjEyLCBEYXJpbyBCaW5hY2NoaSBhIMOpY3Jp
dMKgOgo+IEhpIFJvbWFpbiwKPiAKPiBPbiBUaHUsIEZlYiAyMiwgMjAyNCBhdCAxMTo0OeKAr1BN
IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPj4KPj4gSGVsbG8g
RGFyaW8sCj4+Cj4+IExlIDIyLzAyLzIwMjQgw6AgMTE6MTYsIERhcmlvIEJpbmFjY2hpIGEgw6lj
cml0IDoKPj4+IFJlY2VudCB2ZXJzaW9ucyBvZiBVLUJvb3QgYXJlIGNhcGFibGUgb2YgYnVpbGRp
bmcgdGlib290My5iaW4gdXNpbmcKPj4+IEJpbm1hbi4gSW4gdGhpcyBjYXNlLCBsZXQncyBjb3B5
IGl0IHRvIHRoZSBiaW5hcmllcyBkaXJlY3RvcnkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGFy
aW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+Pj4KPj4+
IC0tLQo+Pj4KPj4+IENoYW5nZXMgaW4gdjU6Cj4+PiAtIFJlcGxhY2UgdGlib290My0qLSQoVElf
SzNfUjVfTE9BREVSX1NFQ1RZUEUpLSouYmluIHdpdGgKPj4+ICAgdGlib290My0kKFRJX0szX1I1
X0xPQURFUl9TT0MpLSQoVElfSzNfUjVfTE9BREVSX1NFQ1RZUEUpLSouYmluCj4+Pgo+Pj4gQWRk
ZWQgaW4gdjQKPj4+Cj4+PiAgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1r
IHwgNCArKysrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsgYi9ib290
L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPj4+IGluZGV4IGZkYjA1OGYzYjcy
YS4uZTBjNGM5MmJkNGNjIDEwMDY0NAo+Pj4gLS0tIGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGkt
azMtcjUtbG9hZGVyLm1rCj4+PiArKysgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1s
b2FkZXIubWsKPj4+IEBAIC03MCw4ICs3MCwxMiBAQCBkZWZpbmUgVElfSzNfUjVfTE9BREVSX0JV
SUxEX0NNRFMKPj4+ICAgICAgICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAkKFRJX0szX1I1X0xP
QURFUl9NQUtFKSAtQyAkKEBEKSAkKFRJX0szX1I1X0xPQURFUl9NQUtFX09QVFMpCj4+PiAgZW5k
ZWYKPj4+Cj4+PiArVElfSzNfUjVfTE9BREVSX1NFQ1RZUEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIy
X1BBQ0tBR0VfVElfSzNfU0VDVFlQRSkpCj4+PiArVElfSzNfUjVfTE9BREVSX1NPQyA9ICQoY2Fs
bCBxc3RyaXAsJChCUjJfUEFDS0FHRV9USV9LM19TT0MpKQo+Pj4gKwo+Pj4gIGRlZmluZSBUSV9L
M19SNV9MT0FERVJfSU5TVEFMTF9JTUFHRVNfQ01EUwo+Pj4gICAgICAgY3AgJChARCkvc3BsL3Ut
Ym9vdC1zcGwuYmluICQoQklOQVJJRVNfRElSKS9yNS11LWJvb3Qtc3BsLmJpbgo+Pj4gKyAgICAg
ZmluZCAkKEBEKSAtbmFtZSAidGlib290My0kKFRJX0szX1I1X0xPQURFUl9TT0MpLSQoVElfSzNf
UjVfTE9BREVSX1NFQ1RZUEUpLSouYmluIiAtdHlwZSBmIC1leGVjIGNwIHt9ICQoQklOQVJJRVNf
RElSKS90aWJvb3QzLmJpbiBcOwo+Pgo+PiBJIGRvbid0IHRoaW5rICJmaW5kIiBpcyBuZWVkZWQg
aGVyZSBzaW5jZSB3ZSBzaG91bGQgY29weSBvbmx5IG9uZSBmaWxlIHRvCj4+ICQoQklOQVJJRVNf
RElSKS90aWJvb3QzLmJpbgo+IAo+IENhbiBpdCBiZSBvaz8KPiAKPiAtICAgICAgIGZpbmQgJChA
RCkgLW5hbWUKPiAidGlib290My0kKFRJX0szX1I1X0xPQURFUl9TT0MpLSQoVElfSzNfUjVfTE9B
REVSX1NFQ1RZUEUpLSouYmluIgo+IC10eXBlIGYgLWV4ZWMgY3Age30gJChCSU5BUklFU19ESVIp
L3RpYm9vdDMuYmluIFw7Cj4gKyAgICAgICBjcCAkKEBEKS90aWJvb3QzLSQoVElfSzNfUjVfTE9B
REVSX1NPQyktJChUSV9LM19SNV9MT0FERVJfU0VDVFlQRSktKi5iaW4KPiAkKEJJTkFSSUVTX0RJ
UikvdGlib290My5iaW4KPiAKPiBJIHRlc3RlZCBpdCBhbmQgSXQgd29ya3MuCgpMb29rcyBnb29k
LCB0aGFua3MhCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gVGhhbmtzIGFuZCBSZWdhcmRz
LAo+IERhcmlvCj4gCj4+Cj4+Cj4+Cj4+PiAgZW5kZWYKPj4+Cj4+PiAgJChldmFsICQoa2NvbmZp
Zy1wYWNrYWdlKSkKPj4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
