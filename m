Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F5ECD4F54
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 16:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD6D884D89;
	Thu, 28 May 2026 16:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhW8Qn1fuheC; Thu, 28 May 2026 16:26:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A625684D83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779985587;
	bh=g15Nqh1g6WSdtfHOcyEiEdcIiJgmRjh+VKLj4ucqM5k=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sd9/PrN8jfxC5JTzgg3Z4MWNkOswyEZ4dwCyPboLcskb17PIfaKrZz/MZ96tCdtU2
	 0Bk4a778UEmzStTcObvMfcm3SwLjg952Za1YSjc84HBdnbqEwZ3uRMAubkoFXyEHhP
	 RQMT18RBIwucRvWm2u7tNZrJxrpCe5BQUbVBHJreGjp++7aeLQkLx1InCoXex4JS9W
	 4Ay59q5aIzvwUJZGlgihINwV5XOzG0S1ImCOR708NITLKUpnVjvdll0qGRj73dx5qG
	 Fbolwqw9auaO+vR52oIkpMU5pnyf7JvqSjiZ6Kdh91+JOYt8664PT5TZqsFq0xkGcv
	 11cvkaLaNQZRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A625684D83;
	Thu, 28 May 2026 16:26:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4645288
 for <buildroot@buildroot.org>; Thu, 28 May 2026 16:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D129C412A4
 for <buildroot@buildroot.org>; Thu, 28 May 2026 16:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1VpJZVJwZe4 for <buildroot@buildroot.org>;
 Thu, 28 May 2026 16:26:26 +0000 (UTC)
X-Greylist: delayed 1200 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 28 May 2026 16:26:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6CCD440EBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CCD440EBD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.74.219;
 helo=8.mo575.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 8.mo575.mail-out.ovh.net (8.mo575.mail-out.ovh.net
 [46.105.74.219])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CCD440EBD
 for <buildroot@buildroot.org>; Thu, 28 May 2026 16:26:23 +0000 (UTC)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.110.43.241])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4gR9rp3nsQz5vfd
 for <buildroot@buildroot.org>; Thu, 28 May 2026 15:48:58 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-r7h7k (unknown [10.110.188.207])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 59D86C220F;
 Thu, 28 May 2026 15:48:58 +0000 (UTC)
Received: from armadeus.com ([37.59.142.111])
 by ghost-submission-7d8d68f679-r7h7k with ESMTPSA
 id +JYfDupjGGreAioAyNhEQA
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 28 May 2026 15:48:58 +0000
X-OVh-ClientIp: 92.148.202.169
Message-ID: <7a78ce63-6abb-4614-96ed-5a9fa311da8f@armadeus.com>
Date: Thu, 28 May 2026 17:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot Notifications <buildroot.notifications@gmail.com>,
 buildroot@buildroot.org
References: <6a166262.03c7beee.7ac76.c19c@mx.google.com>
Content-Language: en-US
From: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Autocrypt: addr=sebastien.szymanski@armadeus.com; keydata=
 xsBNBFNfZLEBCACv1lqSePHJNpRgcnER+3emy+Arjz84zFax3XkogjY/e3ZneihIgWrVKe5M
 ql16pX4KTkzNgMUKz4bG/XwT3kjcrXshxFLlg7KrHMl287C+W+QOUjnjVeRi/su+SPmjz8VD
 yr11h+ZkVLAWhS+uQJ93jy1NwG8M4t1kBLAVHHD5Vw4FJ+3ouaVYIp1X1Cr8bVKQw33Q1aTd
 ro0kMBb96B9vNu7ciJZ3gvlaBzUEKOgNnq9KaywuLnqrqr4HUIn5JuxZjCjJzt9kTAKcTfp2
 cJM8qpp+2FF5qtbkse9fZ6M64qozgOPr9Tk4Amf9fZEUQ6UNw14mmBZuXSzoHe75gI7TABEB
 AAHNN1PDqWJhc3RpZW4gU1pZTUFOU0tJIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
 LmNvbT7CwJAEEwEIADoCGyMHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgBYhBJwGygpYm/1C
 /GCmwbCaKeiBMmTiBQJdhIHLAAoJELCaKeiBMmTixXIH/2W3kbzRG0UF81jtRRnp0H83rjDT
 v0H+8fgFMRL/7HCJ1QPArkfRJlM2wlJkN+ChP09CCarYfUEHfRCHlTb7At6Yyrz1jziD7ZwX
 8IWHYRXnZkY5eZc5DsiUgq6JH49kt+GPzK8UVP9MTa6zkBpPCUf7LzZ4pD3FihdkT52BU3gI
 d9P49fSI0TYySlb/VKn815aOhvwEr7+Dh3mZUjSh7saofbRmVUOr7p+R3MvvGI19/IJZjeOE
 ZWliODDOt6HnBOtoGSXMcNIFF6snH52D5N5gY88njZjTwhgGGUBix1bsgf/EY0v4R5itZBXB
 B/Ze4Tm++YHaB75hZK6PQu/YRv7OwE0EU19ksQEIALo7jhXddrXBTRu5SAjelV53jyHBJTX/
 vN4nL/VbbW/saca+NJjDSxx5DBmotZbQdWIyZiSIjU/xnTREvtDrl6ZeSsKWd7ZqiuiY4fSR
 zwuQp9rd0yqRuxesrWeyJB1zCSdEvLyKASERt+nxkOA+IzJ4y1qLtvnWr+SL1AXgTMw+Tkyw
 KIDCRWHTIYas11ldGj82gOIpYeXnapeNLHfT4EQwg0NeWYHynJxAQWiX5aPlw0uSpAQSsBXQ
 FIe3fpoveMSnXK+PG2BBOzexYv7r4S70a6sF9sgTTPpfKqUaqqC+u1+bUX6alTAKhGKJywaF
 6ViqLlgY8PfwohSyAlqlTRMAEQEAAcLAdgQYAQgAIAIbDBYhBJwGygpYm/1C/GCmwbCaKeiB
 MmTiBQJdhIHSAAoJELCaKeiBMmTitU8IAK7NQM3fEwaF5XaKtepYWsVka44CD8A9e4r7NVK9
 ugirKvXirIxBSDmN/Db862NmVpITsZ6ERNSNZLm/7k55N+TexKYiFZeU7G92TEfAM6qPElvx
 DLEcrkNMq9r08YZeUloacsq31AL5fK4LW+xdvXudkdiKRMJsdTpmff3x5kIziGOHjwFP9wve
 ZgEH52gpbRsP8Whx/Z2lNX/BBRmFM8OnEXFsjjqDzYThdxTq85wGPpkgvvUGyPNRD7TpbB1C
 pajOUUkPxgj5LKt77HD1afeZNudWhgcdkbtT5PMQTT0WY6wvMEj9S1+bGPeXRGWLYB7gHQ+L
 JNoSD7Kz6Y9qnKo=
In-Reply-To: <6a166262.03c7beee.7ac76.c19c@mx.google.com>
x-ovh-tracer-id: 7199566955668100813
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEDylRQuO0PReNSJNnzoRddL4WVm9ZL61ar5H0pJfaIEOMYAPrkveaqDUJukR9dwyXV/k8n85OisIZkj/JBUpo7DIr6GrlL6Mcua4R7tbdQLZsRtt3J5eLWjNtOlhnUnm7zQvvkLt1bRPuVJUmLpeDhND9pixGNK8UYJGeR5FjR0lcobyjElwOvpRX+74ZoVvCQMIsws/PjaS0s2mconsEuqJIFR7WEdDCjgNAff8HecORyJA7l6EptfhrejhLkWMsrYUNA97pHnzVPz4ALP7LU/TNqahuJkf3i6duO8PVbpGkd5T/BYwZOW71cxUA6ZCfgDvuUMQwikhIy89a9TRQwhBLe2D2uzwjcB7GjMQdBPgwsiERQrY9J3Yhf+4gMK29QSxrvT3GLLYmCmIHOmuYiRON4z6jzKBiJLtnbi/isfMZx14B4rdWl1aLU3WwC9dpp7gEhJjadxY59eIwvj02NYdB2a3zKIM2HrUkM4LtWIWG/xGpAN2v6zbE6dwVMPEKjnbRkftMZoKGExu7jIuUP71r9QnFLjs1co43Jl0s3unPC5IaN0+OcxrKEFLEEIWR9bb9sv3FVUsWEJYD90u/DwzqPOoDstuLb+8OIX+rvsU563I1TzaAZ0p2b29MPlDIU9ptyM9qg3GvxRIXuzPBiYQUYj3TYZ/Yu2a+aW8QTMg
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=dekG4UTf2yfC1zhGLTwqlkIn0vlzfBvNitG914QtlWY=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1779983338; v=1;
 b=Al/PXjvRE4D9oMqu4Pu4e4Pcw1U2p7MKHR0ZdTxB5TpGsvU2grCIzPqkifQyUTRFZ/qgmJeG
 QH6mhMHr7RG2UlL29Ts8sxivUWUJDVnDEi7Up8C9s0queUzey2x4j+2cOUROCKIzD7qd8+7QZhw
 n1Cg9SH9dJCJCDFEfvxt+g3yEY74W8LSIdH6k9XL+e6UDjCeHKPWMUyL+ZDFNBy6oimRvDnaXTI
 +flG7SYbQ+4Eyi/rJgGC8mgH/a4ajXZfvOi/CrfoN0hnAeEeh11eQpqQP7tvWzYVD2Fw8paMyU6
 z5rKr7rhdqTpV2izfrkbzE6dKLJDOL0V6mPNJYDCrrdaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=Al/PXjvR
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-111S0058ed4e6e0-1c52-4408-9878-bdb4477fbfb9,
 6EFC05AAA153AB5D2A4F3C959A063608AD99B318)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-05-26
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiA1LzI3LzI2IDU6MTcgQU0sIEJ1aWxkcm9vdCBOb3RpZmljYXRpb25zIHdyb3Rl
Ogo+IAo+IAo+IENsYXNzaWZpY2F0aW9uIG9mIGZhaWx1cmVzIGJ5IHJlYXNvbiBmb3IgMjAyNS4w
Mi54Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiAKLi4uPiAgICAgICAgICAgICAgICBsaWJtb2RidXMtMy4xLjExIHwgMQpsaWJtb2RidXMgZmFp
bHMgdG8gYnVpbGQgb24gMjAyNS4wMi54IHNpbmNlIEZlYnJ1YXJ5IFsxXSBiZWNhdXNlIHRoZSAK
cGFja2FnZSB3YXMgcmVwYWNrZWQgWzJdWzNdIGFuZCB0aHVzIHRoZSBoYXNoIGhhdmUgY2hhbmdl
ZC4KQ2FuIGNvbW1pdCBhN2RiMWRiMDgxNmQgKCJwYWNrYWdlL2xpYm1vZGJ1czogYnVtcCB2ZXJz
aW9uIHRvIDMuMS4xMiIpIGJlIApiYWNrcG9ydGVkIHRvIGZpeCB0aGUgaXNzdWUgPwoKUmVnYXJk
cywKClsxXSBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0Lz9yZWFzb249bGlibW9kYnVz
LTMuMS4xMQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL3N0ZXBoYW5lL2xpYm1vZGJ1cy9pc3N1ZXMv
ODQwI2lzc3VlY29tbWVudC0zOTA1MDcwNDk3ClszXSBodHRwczovL2dpdGh1Yi5jb20vc3RlcGhh
bmUvbGlibW9kYnVzL2lzc3Vlcy84MjkjaXNzdWVjb21tZW50LTM4OTg0OTQzNTMKCi0tIApTw6li
YXN0aWVuIFN6eW1hbnNraSwgQXJtYWRldXMgU3lzdGVtcwpTb2Z0d2FyZSBlbmdpbmVlcgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
