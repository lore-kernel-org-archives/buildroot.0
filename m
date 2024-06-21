Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A83C2BA18
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 07:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB2B181BE3;
	Sun, 23 Jun 2024 07:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uG-ZZxDfgB5G; Sun, 23 Jun 2024 07:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA1481776
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA1481776;
	Sun, 23 Jun 2024 07:40:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF0141BF59E
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 07:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6EF1607E2
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 07:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ako5lZGD2RWV for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 07:40:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EF15607E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF15607E0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EF15607E0
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 07:40:46 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-364c9ec17d1so1993823f8f.0
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 00:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719128444; x=1719733244;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YGZTbdyXofknrUpHZOW1wpXghwvFI1JV6uWH5QuSF/c=;
 b=EPgK74Ot5ttjzBM6ZQ6+TappVAKdJ63z5ewUG7FrO/FEl6HMiTovy0qDsyUyer2L3t
 B59gTGHcfSd8/2XjaWFAlu34/ajOIcmOpLpBjjcbD3edKdzBMq/Q1WR0o67wN76m3BPZ
 XF65bZWxyOFXb6ujRLpnsERhP6pHAUHsAaB0fNqJW5bi+vISCXBGH7YdQwz6DImo8CuD
 4xOnePNlF5fV07VYIPJQtqGiFJMnUCKHtKU225I50mLe9aBH0o8Rf4g427lq2iUn1y0/
 l3UEo18ivY3cN06hF4+VPFbORSYjPqqr26doNxQD8QSptatmgT0+QkPWLupzf//Qit6R
 X6Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY5XjaHDkvzppLLiOdTwiuWbsANirnBgp1MSFZ4GcJRgrVqOw++XBMNYqqkL4yVh0vAxA/i46qXeO6XqesPxougptx4YrESQ==
X-Gm-Message-State: AOJu0YzMderh9QW0icdYcJB8NVTS3dXLJwHd1sfIdHyMGoG79Omed6+u
 pdDIX0Y3VO5yOUpnarYU63NEFdXDo3sJLlgpowEXekg1hDVAj1C8BREmIzQeMvv47T7lZa9BBQ3
 M
X-Google-Smtp-Source: AGHT+IFGFeK8C8EKxUtvNRCOtOhEposKYfM45iiapmFjUFOeXxY7iWUc6wH/UNMlKv9MZVhFF3tikg==
X-Received: by 2002:a5d:6c6c:0:b0:366:eb00:9dd6 with SMTP id
 ffacd0b85a97d-366eb009e3cmr892612f8f.1.1719128444007; 
 Sun, 23 Jun 2024 00:40:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a8c789esm6683167f8f.91.2024.06.23.00.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jun 2024 00:40:43 -0700 (PDT)
Message-ID: <223aba39-7d41-4bf2-bf8b-665870a45af8@mind.be>
Date: Fri, 21 Jun 2024 23:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240528082356.215363-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240528082356.215363-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719128444; x=1719733244; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YGZTbdyXofknrUpHZOW1wpXghwvFI1JV6uWH5QuSF/c=;
 b=DpnuXTMJWxgMDH0memcSnC9CVft0AWbQ4ItIVF9vHUAgDI/Vag0lEYdw9z6ofouerq
 VAD5nqSHIOSCj88sFt0KvaHLAQBzlOAelAzbpulefMv0wqMVVSw2qghBQINffFq1VG+Q
 FGwCc+g+cigBAyCx+29JWfMhJPFk6Fm8GGBYQBDzR/UinGvQTU3LZprN0/rXsQULd5Sl
 OgYvPFKNTQ0wEEkziENusUz2td2ns9j1nm39aVY7lm8fANV1FowsVat0WLPRHPoELafb
 qVr8MN9yMSqEHnIBRq+faZfq2qBCwKXlkITfx7HdyXDy21yZLnmLHWxGoWUbSmJ1O3b6
 u85A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DpnuXTMJ
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: fix build failure with
 gcc 11.x
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
Cc: linux-amarula@amarulasolutions.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyOC8wNS8yMDI0IDEwOjIzLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiBUaGUgcGF0Y2gg
Zml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZToKPiAKPiBvdXRwdXQvaG9zdC9iaW4vYXJt
LWJ1aWxkcm9vdC1saW51eC11Y2xpYmNnbnVlYWJpaGYtZ2NjIC1EX0xBUkdFRklMRV9TT1VSQ0Ug
LURfTEFSR0VGSUxFNjRfU09VUkNFCj4gLURfRklMRV9PRkZTRVRfQklUUz02NCAgLU9zIC1nMCAg
LXBpcGUgLVduby1lcnJvcj1mb3JtYXQtdHJ1bmNhdGlvbiAtV2FsbCAtV2V4dHJhIC1XcG9pbnRl
ci1hcml0aAo+IC1XdW5pbml0aWFsaXplZCAtV3NpZ24tY29tcGFyZSAtV2Zvcm1hdC1zZWN1cml0
eSAtV3NpemVvZi1wb2ludGVyLW1lbWFjY2VzcyAtV25vLXBvaW50ZXItc2lnbgo+IC1Xbm8tdW51
c2VkLXBhcmFtZXRlciAtV25vLXVudXNlZC1yZXN1bHQgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCAt
V21pc2xlYWRpbmctaW5kZW50YXRpb24KPiAtZm5vLXN0cmljdC1hbGlhc2luZyAtRF9GT1JUSUZZ
X1NPVVJDRT0yIC1mdHJhcHYgLWZ6ZXJvLWNhbGwtdXNlZC1yZWdzPXVzZWQgLWZuby1idWlsdGlu
LW1lbXNldAo+IC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAgIC1mUElDIC1JLiAtSS4uIC1JLiAt
SS4vLi4gLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UKPiAtRF9GSUxF
X09GRlNFVF9CSVRTPTY0IC1EX1hPUEVOX1NPVVJDRT02MDAgLURfQlNEX1NPVVJDRSAtRF9ERUZB
VUxUX1NPVVJDRSAtRF9HTlVfU09VUkNFCj4gLURIQVZFX0NPTkZJR19IIC1jIHBvcnQtYWl4LmMK
PiBzaGEyLmM6IEluIGZ1bmN0aW9uIOKAmFNIQTI1NkluaXTigJk6Cj4gc2hhMi5jOjM2MDoxOiBz
b3JyeSwgdW5pbXBsZW1lbnRlZDog4oCYLWZ6ZXJvLWNhbGwtdXNlZC1yZWdz4oCZIG5vdCBzdXBw
b3J0ZWQgb24gdGhpcyB0YXJnZXQKPiAgICAzNjAgfCB9Cj4gICAgICAgIHwgXgo+IG1ha2VbM106
ICoqKiBbTWFrZWZpbGU6MTA2OiBzaGEyLm9dIEVycm9yIDEKPiBtYWtlWzNdOiAqKiogV2FpdGlu
ZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgo+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6MTk5OiBv
cGVuYnNkLWNvbXBhdC9saWJvcGVuYnNkLWNvbXBhdC5hXSBFcnJvciAyCj4gCj4gVGhpcyBjb21t
aXQgYXBwbGllcyBhbiB1cHN0cmVhbSBwYXRjaCB0aGF0IGltcHJvdmVzIHRoZSBkZXRlY3Rpb24g
b2YKPiAtZnplcm8tY2FsbC11c2VkLXJlZ3M9dXNlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CgogIEFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgLi4u
dGVjdGlvbi1vZi1memVyby1jYWxsLXVzZWQtcmVncy11c2VkLnBhdGNoIHwgMzIgKysrKysrKysr
KysrKysrKysrKwo+ICAgcGFja2FnZS9vcGVuc3NoL29wZW5zc2gubWsgICAgICAgICAgICAgICAg
ICAgIHwgIDMgKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvb3BlbnNzaC8wMDAxLUltcHJvdmUtZGV0ZWN0aW9uLW9m
LWZ6ZXJvLWNhbGwtdXNlZC1yZWdzLXVzZWQucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9vcGVuc3NoLzAwMDEtSW1wcm92ZS1kZXRlY3Rpb24tb2YtZnplcm8tY2FsbC11c2VkLXJlZ3Mt
dXNlZC5wYXRjaCBiL3BhY2thZ2Uvb3BlbnNzaC8wMDAxLUltcHJvdmUtZGV0ZWN0aW9uLW9mLWZ6
ZXJvLWNhbGwtdXNlZC1yZWdzLXVzZWQucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uMWI5MWIxNWE3OTgzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Bh
Y2thZ2Uvb3BlbnNzaC8wMDAxLUltcHJvdmUtZGV0ZWN0aW9uLW9mLWZ6ZXJvLWNhbGwtdXNlZC1y
ZWdzLXVzZWQucGF0Y2gKPiBAQCAtMCwwICsxLDMyIEBACj4gK0Zyb20gZjkxOTNmMDNkYjAwMjlm
YzljMzFmYmRiNWM2NmEyNzM3NDQ2YmQ4ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJv
bTogRGFycmVuIFR1Y2tlciA8ZHR1Y2tlckBkdHVja2VyLm5ldD4KPiArRGF0ZTogTW9uLCAyNSBN
YXIgMjAyNCAwOToyODowMiArMTEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIEltcHJvdmUgZGV0ZWN0
aW9uIG9mIC1memVyby1jYWxsLXVzZWQtcmVncz11c2VkLgo+ICsKPiArU2hvdWxkIGJldHRlciBk
ZXRlY3QgcHJvYmxlbXMgd2l0aCBnY2MgMTMgb24gbTY4ay4gIGJ6IzM2NzMgZnJvbSBDb2xpbgo+
ICtXYXRzb24gdmlhIGJ6IzM2NzMgYW5kIGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hv
d19idWcuY2dpP2lkPTExMDkzNAo+ICsKPiArU2lnbmVkLW9mZi1ieTogRGFycmVuIFR1Y2tlciA8
ZHR1Y2tlckBkdHVja2VyLm5ldD4KPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
c3NoL29wZW5zc2gtcG9ydGFibGUvY29tbWl0L2Y5MTkzZjAzZGIwMDI5ZmM5YzMxZmJkYjVjNjZh
MjczNzQ0NmJkOGYKPiArLS0tCj4gKyBtNC9vcGVuc3NoLm00IHwgMyArKysKPiArIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiArCj4gK2RpZmYgLS1naXQgYS9tNC9vcGVuc3NoLm00
IGIvbTQvb3BlbnNzaC5tNAo+ICtpbmRleCAwMzNkZjUwMWMzZDguLjE3NmE4ZDFjOTI4MiAxMDA2
NDQKPiArLS0tIGEvbTQvb3BlbnNzaC5tNAo+ICsrKysgYi9tNC9vcGVuc3NoLm00Cj4gK0BAIC0y
MCw3ICsyMCwxMCBAQCBjaGFyICpmMihjaGFyICpzLCAuLi4pIHsKPiArIAl2YV9lbmQoYXJncyk7
Cj4gKyAJcmV0dXJuIHN0cmR1cChyZXQpOwo+ICsgfQo+ICsraW50IGk7Cj4gKytkb3VibGUgZDsK
PiArIGNvbnN0IGNoYXIgKmYzKGludCBzKSB7Cj4gKysJaSA9IChpbnQpZDsKPiArIAlyZXR1cm4g
cyA/ICJnb29kIiA6ICJnb29kZXIiOwo+ICsgfQo+ICsgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIg
Kiphcmd2KSB7Cj4gKy0tCj4gKzIuNDMuMAo+ICsKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVu
c3NoL29wZW5zc2gubWsgYi9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tawo+IGluZGV4IGQ3ZjRk
YjU5Y2EzZC4uNWE1NjhkNWZkMTc0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvb3BlbnNzaC9vcGVu
c3NoLm1rCj4gKysrIGIvcGFja2FnZS9vcGVuc3NoL29wZW5zc2gubWsKPiBAQCAtMTMsNiArMTMs
OSBAQCBPUEVOU1NIX1NJVEUgPSBodHRwOi8vZnRwLm9wZW5ic2Qub3JnL3B1Yi9PcGVuQlNEL09w
ZW5TU0gvcG9ydGFibGUKPiAgIE9QRU5TU0hfTElDRU5TRSA9IEJTRC0zLUNsYXVzZSwgQlNELTIt
Q2xhdXNlLCBQdWJsaWMgRG9tYWluCj4gICBPUEVOU1NIX0xJQ0VOU0VfRklMRVMgPSBMSUNFTkNF
Cj4gICAKPiArIyAwMDAxLUltcHJvdmUtZGV0ZWN0aW9uLW9mLWZ6ZXJvLWNhbGwtdXNlZC1yZWdz
LXVzZWQucGF0Y2gKPiArT1BFTlNTSF9BVVRPUkVDT05GID0gWUVTCj4gKwo+ICAgT1BFTlNTSF9D
T05GX0VOViA9IFwKPiAgIAlMRD0iJChUQVJHRVRfQ0MpIiBcCj4gICAJTERGTEFHUz0iJChUQVJH
RVRfQ0ZMQUdTKSIgXApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
