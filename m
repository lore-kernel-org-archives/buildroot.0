Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD93C87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 17:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70BEE40A93;
	Sun, 10 Aug 2025 17:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTYh9IuHiJzV; Sun, 10 Aug 2025 17:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70DDD40A88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70DDD40A88;
	Sun, 10 Aug 2025 17:35:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BDEA138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D75540A7E
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ciGCsMo-TMD for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 17:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EFCC540A4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFCC540A4C
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFCC540A4C
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:35:14 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b790dbb112so2226656f8f.3
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 10:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754847313; x=1755452113;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VQwbLdKRhNCk7+5XBN1mQrSuzlIOi1gWJb5C2OLxKrI=;
 b=KScRnie1qUd5atoS2VOTQU5hc1yka0G5C823/fojxSByZuPMDjjrOMRXVz/MXRfptM
 koESoTkIjaSj5yalcKzjyhgrqRTFCt3khpBSXoUJlIU0wV05MlARIsmPnMTFKpVvNBoK
 FYRax7GMyGVLhbgTBuU0Xg5eKL7uHtlyTXbxdUfFKRXYmUEbxX7errNOFEzVDgLJkq6o
 Tijlt9BR+2LDfgn7+UEz5jvhbosbgFSoRgOhvvv41IXAgfRK+N4lk8T9j6VlImZDeLi9
 FmuZV6VJo7s/uJl65qy6JKLi2mXKOqf0AtcBf7TOanqeggEltqecd9TQhKdlQidWn5NV
 vL1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSh2uoWCQOeG1XAldxNoSvEKWvOSFYzIWRbzdXnkonxeJTRw02TvA3xDAlr4VHXu3BOsJpzEjqSjU=@buildroot.org
X-Gm-Message-State: AOJu0YzC4Mm65WKTM2/yBl/n/FGZUQ4SAlw1pMn8WYyD1CkD3mOTw4Ot
 z773Myo8hznQ2hTFK0PD8Hq9Q3HQIuQDB2jkjPh8YoiNAf2+q7mHR+fQ4xJwEor6oz61pc1gBpE
 FPi4W
X-Gm-Gg: ASbGncu9q7n7HFHIu6CwsGDYAEbcfQuiazgPZ3LJp+M/UKr3ilUmVxW9BZcd3K/7HUm
 CNnGILRK3dh4VgbW1MYta+scoxWebzen8muqwr9sZFaPlrOCtT06kKMhn9NnTi9GgyIrbirR6+u
 0MpLpya2Z4Uub4wE6xan30Zv9N+6/7SWdFBLWYZnvxp+akBBPXh6yI6dt8qU5jsmbvHFX7oIPEh
 tS8CEJBp2aSRfsaTPGpMHB7sz0wVKY8OIoF63lrRQmyIKzvA1TgWIjzqhm/MD5vCGCMNxZQFZPH
 3nz/S4678yqWuivYM1VssPy/dzl60elHRBKQOBgCBAdMwfCA0JVxblvuJ0Vbtzk1WoHLzQyh/Pa
 kzrRmsnzIwBm5Eq750MBi0E6BfoZUJKeCFBGV5l4vqashQgIPSyP9sr3RyDbHwKo+1U/dVqu+wo
 OtJ6AwOM4WhPoy2acvfC5bqNukLmNs8SOwNeBVdMm68oL2r1Puxhcvl2MOJpROietNoY43u/M=
X-Google-Smtp-Source: AGHT+IGawxvLBq6gAHmws/ITdB5tmRuVGdGBtqVeZZXcYz8VdfpnGTI0We7SSNLKm04NlqMfHK/j+Q==
X-Received: by 2002:a5d:64cb:0:b0:3b7:9c79:32be with SMTP id
 ffacd0b85a97d-3b900b551f6mr8170097f8f.45.1754847312625; 
 Sun, 10 Aug 2025 10:35:12 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45923c34af8sm322698785e9.24.2025.08.10.10.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 10:35:12 -0700 (PDT)
Message-ID: <9359f9ca-43ac-489a-8c0b-b711042ac244@smile.fr>
Date: Sun, 10 Aug 2025 19:35:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250726093105.692181-1-thomas.perale@mind.be>
Content-Language: fr
In-Reply-To: <20250726093105.692181-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754847313; x=1755452113; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VQwbLdKRhNCk7+5XBN1mQrSuzlIOi1gWJb5C2OLxKrI=;
 b=Z4en1bCeNHdgEKqagR9isWMudxepRQNf0JzGJdioKQ9a2FyCMWM54D6K5uXxfvFw6n
 w7NnN7DINlNQxbuUf3TjerV8jLxGvH+Y2Y9TEl8QKzdkhQOx0lYiyvig1ujTDuBeC6gL
 UQ5XBzLxO6U6AG0+SPJtnXvn6aQ6QhiGFSZyE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Z4en1bCe
Subject: Re: [Buildroot] [PATCH] package/ghostscript: fix xlib dependency
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAyNi8wNy8yMDI1IMOgIDExOjMxLCBUaG9tYXMgUGVyYWxl
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBTaW5jZSB0aGUgcGFja2FnZSBidW1wIHRvIHYx
MC4wNS4wIHRoZSB4bGliIGxpYnJhcmllcyBkZXRlY3Rpb24gaGFzIGJlZW4KPiBpbXByb3ZlZCB0
byBlcnJvciBtaXNzaW5nIHggbGlicmFyaWVzIChzZWUgWzJdKS4KPiAKPiBUaGUgZm9sbG93aW5n
IGVycm9yIGlzIGhhcHBlbmluZyBvbiB0aGUgYXV0b2J1aWxkZXIgd2hlbiBidWlsZGluZwo+IGdo
b3N0c2NyaXB0IHdpdGggeGxpYl9saWJYMTE6Cj4gCj4gYGBgCj4gY2hlY2tpbmcgZm9yIFhPcGVu
RGlzcGxheSBpbiAtbFgxMS4uLiB5ZXMKPiBjaGVja2luZyBmb3IgWGRiZVF1ZXJ5RXh0ZW5zaW9u
IGluIC1sWGV4dC4uLiB5ZXMKPiBjaGVja2luZyBmb3IgWHRBcHBDcmVhdGVTaGVsbCBpbiAtbFh0
Li4uIG5vCj4gY29uZmlndXJlOiBlcnJvcjogWDExIGxpYnJhcmllcyAobGliWDExLCBsaWJYdCwg
bGliWGV4dCkgbm90IGF2YWlsYWJsZSwgZWl0aGVyIGluc3RhbGwgdGhlbSwgb3IgcmVydW4gY29u
ZmlndXJlIHdpdGggIi0td2l0aG91dC14Igo+IG1ha2U6ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJp
Yy5tazoyNjM6IC9ob21lL2J1aWxkcm9vdC9pbnN0YW5jZS0wL291dHB1dC0xL2J1aWxkL2dob3N0
c2NyaXB0LTEwLjA1LjEvLnN0YW1wX2NvbmZpZ3VyZWRdIEVycm9yIDEKPiBgYGAKPiAKPiBUaGlz
IGVycm9yIGNhbiBiZSByZXByb2R1Y2VkIHdpdGggdGhlIGZvbGxvd2luZyBjb25maWc6Cj4gCj4g
YGBgCj4gY2F0IDw8RU9GID4uY29uZmlnCj4gQlIyX2FybT15Cj4gQlIyX2NvcnRleF9hNz15Cj4g
QlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElO
PXkKPiBCUjJfUEFDS0FHRV9YT1JHNz15Cj4gQlIyX1BBQ0tBR0VfWExJQl9MSUJYMTE9eQo+IEJS
Ml9QQUNLQUdFX0dIT1NUU0NSSVBUPXkKPiBFT0YKPiBtYWtlIG9sZGRlZmNvbmZpZwo+IG1ha2UK
PiBgYGAKPiAKPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSB4bGliIGRlcGVuZGVuY2llcyBvZiB0aGUg
Z2hvc3RzY3JpcHQgcGFja2FnZSB0bwo+IGNvcnJlY3RseSBidWlsZCB3aXRoIFggc3VwcG9ydDoK
PiAKPiAtIFRoZSAnWHRBcHBDcmVhdGVTaGVsbCcgZnVuY3Rpb24gaXMgcHJvdmlkZWQgYnkgdGhl
IHBhY2thZ2UKPiAgICd4bGliX2xpYlh0Jy4KPiAtIFRoZSAnWGRiZVF1ZXJ5RXh0ZW5zaW9uJyBm
dW5jdGlvbiBpcyBwcm92aWRlZCBieSB0aGUgcGFja2FnZQo+ICAgJ3hsaWJfbGliWGV4dCcuCj4g
Cj4gVGhleSBib3RoIHNlbGVjdCB0aGUgJ3hsaWJfbGliWDExJyBwYWNrYWdlLgo+IAo+IFsxXSA5
YWJmNjYyY2ZkIHBhY2thZ2UvZ2hvc3RzY3JpcHQ6IHNlY3VyaXR5IGJ1bXAgdG8gdmVyc2lvbiAx
MC4wNS4wCj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9BcnRpZmV4U29mdHdhcmUvZ2hvc3RwZGwv
Y29tbWl0LzM3ZWVkZTMxZTEyODE0ZmFlNjk3NDRlNzg0MmE1NjQwMDA0ZTVhNjUKPiAKPiBGaXhl
czogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzQ1ZC80NWQwNDE0ZjM0
MWZlYjIzNTQ0NzhiMTQ1Mzk2ZmUxMzdmOWNjNmE2Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBl
cmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4K
CkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAtLS0KPiAgcGFja2FnZS9naG9zdHNjcmlwdC9naG9z
dHNjcmlwdC5tayB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dob3N0c2NyaXB0L2dob3N0
c2NyaXB0Lm1rIGIvcGFja2FnZS9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC5tawo+IGluZGV4IDBk
ZGNiOTUwZmYuLmM5ZDEzZjU1NDUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9naG9zdHNjcmlwdC9n
aG9zdHNjcmlwdC5tawo+ICsrKyBiL3BhY2thZ2UvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQubWsK
PiBAQCAtODUsOCArODUsOCBAQCBlbHNlCj4gIEdIT1NUU0NSSVBUX0NPTkZfT1BUUyArPSAtLWRp
c2FibGUtY3Vwcwo+ICBlbmRpZgo+ICAKPiAtaWZlcSAoJChCUjJfUEFDS0FHRV9YTElCX0xJQlgx
MSkseSkKPiAtR0hPU1RTQ1JJUFRfREVQRU5ERU5DSUVTICs9IHhsaWJfbGliWDExCj4gK2lmZXEg
KCQoQlIyX1BBQ0tBR0VfWExJQl9MSUJYVCkkKEJSMl9QQUNLQUdFX1hMSUJfTElCWEVYVCkseXkp
Cj4gK0dIT1NUU0NSSVBUX0RFUEVOREVOQ0lFUyArPSB4bGliX2xpYlh0IHhsaWJfbGliWGV4dAo+
ICBHSE9TVFNDUklQVF9DT05GX09QVFMgKz0gLS13aXRoLXgKPiAgZWxzZQo+ICBHSE9TVFNDUklQ
VF9DT05GX09QVFMgKz0gLS13aXRob3V0LXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
