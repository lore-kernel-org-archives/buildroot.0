Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE91C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 08:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B787184815;
	Thu,  4 Jul 2024 08:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kuxoe-izqL_a; Thu,  4 Jul 2024 08:58:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E3928484E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E3928484E;
	Thu,  4 Jul 2024 08:58:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24C851BF2B7
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 08:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F7DB413EC
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 08:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9jTSB0zSYGR for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 08:58:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9DF6410DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9DF6410DB
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9DF6410DB
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 08:58:21 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42562a984d3so2580885e9.3
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 01:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720083499; x=1720688299;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Oi1rMSkCxK724nzf+jbeGpK6/Tv/HUgNqQ326o/JP8=;
 b=tvOHB7sAfGiINYqjzqQVmgOeLVfulEG3tAHkFbgeHTOokd7XBuS27sFOXz7oPm8WkW
 s/daaMtm0vAAaW/YHWMppHQUAHy/nM1+XCMlCN4pc/Df7TJW2RjNjtCsdEu+Kid5MhOr
 vL3NjKxC/fq4Fioow33/yGm/zzfPuF01a4CJIWFCRJoyh60Mi7bo2QfEbHITRqGZcaGM
 MbxtuHFh8d/zEI1lLwjDfAtVyeOoZrrBjUWIE1fo+c/FDdMk5xB+TRF5+QFmmtjXgDTS
 E5QlCnbDmt8tUiDGH1r9vaZheCbBIA0bORIaaGOKmFfFythnqmOPBD8PPx5CveqReaNX
 a3qQ==
X-Gm-Message-State: AOJu0Ywno+5vKgZA98ivXHwldLc6gw0HYFwPqCakuEkSo4Y3fKS+Y6tK
 YilYzviO+X5LjPYOOahR8owI2FKMyOBiQIDIDpwXS2d6sSjNQXse3WeVywmZxpLZymRZlmHaL9e
 G
X-Google-Smtp-Source: AGHT+IHoKZKj/vCgMImdXqEknH5k3UP23AbLMgKFv1ImKw3074SsmpsBUDvWT7yUeDc/Ut+byrLnAQ==
X-Received: by 2002:a05:600c:3b90:b0:425:65c5:79b4 with SMTP id
 5b1f17b1804b1-4264a3f55f6mr6839035e9.26.1720083499470; 
 Thu, 04 Jul 2024 01:58:19 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1dda06sm15292935e9.17.2024.07.04.01.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 01:58:19 -0700 (PDT)
Message-ID: <b554de6c-fbfd-4fce-a887-bb1ec2cadc87@mind.be>
Date: Thu, 4 Jul 2024 10:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240702165708.3796162-1-fiona.klute@gmx.de>
 <20240702165708.3796162-2-fiona.klute@gmx.de> <ZoRf7pXimhw4wh-s@landeda>
 <8fe270a0-708f-49f8-972e-221e99f23f08@mind.be>
 <c53f5d9b-2402-4759-ba38-ebc639c11f29@gmx.de>
 <8b5aaedd-ed7f-47c9-8632-9fd901351e11@mind.be>
 <8839b2c6-f3f7-45e2-a92a-6ab5a64f55f8@gmx.de>
Content-Language: en-GB
In-Reply-To: <8839b2c6-f3f7-45e2-a92a-6ab5a64f55f8@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720083499; x=1720688299; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Oi1rMSkCxK724nzf+jbeGpK6/Tv/HUgNqQ326o/JP8=;
 b=QSmvCjv6/fTUvB8CCh00Mxa9yPA4wjvJvtQDT+TnHrrsMxWlTFOekiQ2s3QZzyn8aX
 1jAx14soBGdLTAjMlKoG1U9BQoIEkGMWrm1f/6moBVmlkZoGuWqHJw1t8lNjjkuVv9xL
 //EeGMBiuXRn595Af6G3fX0oXOAbcVgL6wc344uwSMIMqunxKAcD6LbA4inYLs8nPFUE
 s7knN7yqIPE0jiyZHdDJLtHOl52cXPWDZnj/LkLsJdHPBU2htjTnCQD/W+bIop/E9Uds
 G3O0pDpn/y6AN0hZacr1eSePo23M139foeOtCLp286gjIucFOZqHF6evn1BMIek8sBMz
 HQCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QSmvCjv6
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

CgpPbiAwNC8wNy8yMDI0IDEwOjIxLCBGaW9uYSBLbHV0ZSB3cm90ZToKPiBBbSAwNC4wNy4yNCB1
bSAxMDowMCBzY2hyaWViIEFybm91dCBWYW5kZWNhcHBlbGxlOgo+PiBPbiAwMy8wNy8yMDI0IDE3
OjQ2LCBGaW9uYSBLbHV0ZSB3cm90ZToKPj4+IEFtIDAzLjA3LjI0IHVtIDA5OjAxIHNjaHJpZWIg
QXJub3V0IFZhbmRlY2FwcGVsbGU6Cj4+Pj4gT24gMDIvMDcvMjAyNCAyMjoxNSwgWWFubiBFLiBN
T1JJTiB3cm90ZToKPj4+Pj4gRmlvbmEsIEFsbCwKPj4+Pj4KPj4+Pj4gT24gMjAyNC0wNy0wMiAx
ODo1NyArMDIwMCwgRmlvbmEgS2x1dGUgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4+Pj4+
PiBGcm9tOiAiRmlvbmEgS2x1dGUgKFdJV0EpIiA8ZmlvbmEua2x1dGVAZ214LmRlPgo+Pj4+Pj4K
Pj4+Pj4+IFRoZSBwcmV2aW91c2x5IHVzZWQgImtpbGxhbGwgc3NoZCIgc3RvcHBlZCBhbGwgaW5z
dGFuY2VzIG9mIHNzaGQuIFdpdGgKPj4+Pj4+IE9wZW5TU0ggYmVmb3JlIDkuOCB0aGF0IG1lYW50
IG5vdCBvbmx5IHRoZSBsaXN0ZW5pbmcgc2VydmVyLCBidXQgYWxzbwo+Pj4+Pj4gaW5zdGFuY2Vz
IHNlcnZpbmcgY3VycmVudGx5IG9wZW4gc2Vzc2lvbnMsIHBvc3NpYmx5IGluY2x1ZGluZyB0aGUg
b25lCj4+Pj4+PiB1c2VkIHRvIHNlbmQgdGhlIHJlc3RhcnQgY29tbWFuZCwgcHJldmVudGluZyBp
dCBmcm9tIGNvbXBsZXRpbmcgdGhlCj4+Pj4+PiAic3RhcnQiIHBhcnQgb2YgInJlc3RhcnQiIGFu
ZCBsZWF2aW5nIHRoZSBzeXN0ZW0gdW5yZWFjaGFibGUgb3ZlciBTU0guCj4+Pj4+Pgo+Pj4+Pj4g
SW5zdGVhZCwgdXNlIHRoZSBQSUQgZmlsZSB0aGF0IHNzaGQgY3JlYXRlcyBieSBkZWZhdWx0IHRv
IHRhcmdldCBvbmx5Cj4+Pj4+PiB0aGUgbGlzdGVuaW5nIHNlcnZlci4gVGhpcyBsZWF2ZXMgYW55
IG9wZW4gU1NIIHNlc3Npb25zIHVuYWZmZWN0ZWQuCj4+Pj4+Cj4+Pj4+IFJhdGhlciB0aGFuIHBs
YXkgd2l0aCB0aGUgUElEIG91cnNlbHZlcywgY2FuIHdlIHVzZSBzdGFydC1zdG9wLWRhZW1vbgo+
Pj4+PiBpbnN0ZWFkPyBDdXJyZW50bHksIHdlIHJ1biBzc2hkIGFuZCBpdCBkYWVtb25pc2VzIGFs
bCBieSBpdHNlbGYsIGJ1dCBpZgo+Pj4+PiB3ZSBwYXNzIC1ELCB0aGVuIHN0YXJ0LXN0b3AtZGFl
bW9uIHdpbGwgYmUgYWJsZSB0byBkbyB0aGF0LCBhbmQgaGFuZGxlCj4+Pj4+IHRoZSBQSUQgZmls
ZSBhdXRvbWF0aWNhbGx5IGZvciB1cy4KPj4+Pgo+Pj4+IMKgwqBOb3RlIHRoYXQgdGhlcmUncyBh
IGxpdHRsZSBkaXNhZHZhbnRhZ2Ugb2YgdGhhdDogd2hlbiBzc2hkIGRhZW1vbml6ZXMKPj4+PiBi
eSBpdHNlbGYsIGl0IHdpbGwgb25seSByZXR1cm4gYWZ0ZXIgdGhlIHJlYWwgZGFlbW9uIGhhcyBz
dGFydGVkCj4+Pj4gbGlzdGVuaW5nLiBJZiBzdGFydC1zdG9wLWRhZW1vbiBkb2VzIHRoZSBkYWVt
b25pc2F0aW9uLCBpdCB3aWxsIHJldHVybgo+Pj4+IGltbWVkaWF0ZWx5Lgo+Pj4KPj4+IEkgbG9v
a2VkIGNsb3NlciBhdCBzdGFydC1zdG9wLWRhZW1vbiwgYW5kIHRoZXJlJ3MgYSBzb2x1dGlvbiB0
aGF0IGF2b2lkcwo+Pj4gdGhhdCBwcm9ibGVtIGFuZCBzaW1wbGlmaWVzIHRoZSBpbml0IHNjcmlw
dCwgdG9vOiBkb24ndCB1c2UgIi1EIiBmb3IKPj4+IHNzaGQuIHN0YXJ0LXN0b3AtZGFlbW9uIGV4
cGVjdHMgdGhlIGRhZW1vbiB0byB3cml0ZSBpdHMgb3duIFBJRCBmaWxlIGFuZAo+Pj4gcHV0IGl0
c2VsZiBpbnRvIHRoZSBiYWNrZ3JvdW5kLCBvcHRpb25zIHRvIGhhbmRsZSBhIHNlcnZpY2UgdGhh
dCBkb2Vzbid0Cj4+PiBhcmUgZGVzY3JpYmVkIGFzIGZhbGxiYWNrcyBpbiB0aGUgbWFuIHBhZ2Uu
Cj4+Pgo+Pj4gSSd2ZSB0ZXN0ZWQgaXQsIGFuZCBsZXR0aW5nIHN0YXJ0LXN0b3AtZGFlbW9uIG1h
bmFnZSBzc2hkIHRoYXQgd2F5IHdvcmtzCj4+PiBwZXJmZWN0bHkgZmluZS4gSSBhbHNvIGZvdW5k
IGl0IGhhcyBhIGJ1aWx0LWluIG9wdGlvbiAoLS1yZXRyeSkgdG8gYXZvaWQKPj4KPj4gwqDCoERv
ZXMgdGhlIC0tcmV0cnkgb3B0aW9uIGV4aXN0IGluIGJ1c3lib3gncyB2ZXJzaW9uPwo+IAo+IEdv
b2QgcXVlc3Rpb24uIEl0IHdvcmtlZCBpbiBteSB0ZXN0cywgYnV0IGFmdGVyIGNoZWNraW5nIHRo
ZSBCdXN5Ym94Cj4gY29kZSB0aGUgYW5zd2VyIGlzICJub3QgcmVhbGx5Ii4gV2l0aAo+IENPTkZJ
R19GRUFUVVJFX1NUQVJUX1NUT1BfREFFTU9OX0ZBTkNZPXkgKHRoZSBkZWZhdWx0KSB0aGUgY29k
ZSBhY2NlcHRzCj4gdGhlIG9wdGlvbiB3aXRob3V0IGVycm9yLCBidXQgZG9lc24ndCBhY3R1YWxs
eSB1c2UgaXQgKHNlZW1zIGxpa2UgYmFkCj4gZGVzaWduIHRvIG1lKS4gU28gSSBndWVzcyBJIGdv
dCBsdWNreSBpbiB0aGUgc2Vuc2UgdGhhdCBzc2hkIHN0b3BzIGZhc3QKPiBlbm91Z2ggdGhhdCB0
aGVyZSB3YXMgbm8gY29uZmxpY3Qgd2l0aCBzdGFydGluZyBpdCByaWdodCBhZnRlciB3aGVuIEkK
PiB0ZXN0ZWQgdGhlIHJlc3RhcnQgY29tbWFuZC4gU28gSSBndWVzcyBJJ2xsIG5lZWQgYSB3YWl0
IGxvb3AgYWZ0ZXIgYWxsLiA6LSgKPiAKPiBBbm90aGVyIHJlbGF0ZWQgcXVlc3Rpb246IEkgdXNl
ZCB0aGUgbG9uZyBvcHRpb25zIGJlY2F1c2UgaW4gbXkgb3Bpbmlvbgo+IGl0IG1ha2VzIHRoZSBz
Y3JpcHQgZWFzaWVyIHRvIHJlYWQuIEhvd2V2ZXIsIEkgbm90aWNlZCB0aGF0IHRoaXMgd291bGQK
PiBicmVhayBpZiBzb21lb25lIHdlcmUgdG8gc2V0Cj4gQ09ORklHX0ZFQVRVUkVfU1RBUlRfU1RP
UF9EQUVNT05fTE9OR19PUFRJT05TPW4gKGRlZmF1bHQgaXMgeSkuIEkgZ3Vlc3MKPiB0aGF0IG1l
YW5zIEkgc2hvdWxkIHN0aWNrIHRvIHRoZSBzaG9ydCBvcHRpb25zPwoKICBObywgZm9yIGFsbCBv
ZiB0aGUgQnVpbGRyb290LXN1cHBsaWVkIHNjcmlwdHMsIHdlIGNhbiBhc3N1bWUgdGhhdCB0aGUg
CkJ1aWxkcm9vdC1kZWZhdWx0IGJ1c3lib3ggKGFuZCB1Q2xpYmMgYW5kIC4uLikgb3B0aW9ucyBh
cmUgdHVybmVkIG9uLgoKICBJZiB0aGVyZSBpcyBzb21lIG9wdGlvbiB0aGF0IHdlIG5lZWQgdHVy
bmVkIG9uIGZvciBzb21lIHNwZWNpZmljIHRoaW5nLCB3ZSAKdHlwaWNhbGx5IHVwZGF0ZSBvdXIg
ZGVmYXVsdCBidXN5Ym94IGNvbmZpZyB0byBoYXZlIGl0IGVuYWJsZWQuCgogIFBlb3BsZSB3aG8g
dXNlIGEgY3VzdG9tIGJ1c3lib3ggY29uZmlnIGFyZSByZXNwb25zaWJsZSBmb3IgbWFraW5nIHN1
cmUgdGhhdCAKYWxsIHRoZSBzY3JpcHRzIHN0aWxsIHdvcmssIGFuZCBpZiBub3QsIGFkYXB0IHRo
ZSBzY3JpcHRzIGFjY29yZGluZ2x5IChpbiBhbiAKb3ZlcmxheSkuCgogIE9mIGNvdXJzZSwgYWxs
IG9mIHRoZSBhYm92ZSBpcyBlbnRpcmVseSB1bmRvY3VtZW50ZWQuIEZlZWwgZnJlZSB0byB1cGRh
dGUgdGhlIApkb2N1bWVudGF0aW9uIHRvIGV4cGxhaW4gdGhpcyEKCiAgUmVnYXJkcywKICBBcm5v
dXQKCj4gCj4gQmVzdCByZWdhcmRzLAo+IEZpb25hCj4gCj4+IMKgwqBSZWdhcmRzLAo+PiDCoMKg
QXJub3V0Cj4+Cj4+PiAiaGFzIHRoZSBzZXJ2aWNlIHJlYWxseSBzdG9wcGVkIiBsb29wcy4gSSds
bCBzZW5kIHRoZSByZWZhY3RvcmVkIHBhdGNoCj4+PiBzZXQgaW4gYSBmZXcgbWludXRlcy4KPj4+
Cj4+PiBUaGFua3MgZm9yIHRoZSByZXZpZXchCj4+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4gRmlv
bmEKPj4+Cj4+Pj4gwqDCoEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBpbXBvcnRhbnQgZW5vdWdoIHRv
IG5vdCBkYWVtb25pc2Ugd2l0aAo+Pj4+IHN0YXJ0LXN0b3AtZGFlbW9uIC0gaWYgeW91IG5lZWQg
ZmluZS1ncmFpbiBjb250cm9sIGJ5IHRoZSBpbml0IHN5c3RlbQo+Pj4+IHlvdSBzaG91bGQgdXNl
IGEgcHJvcGVyIGluaXQgc3lzdGVtLiBCdXQgaXQncyBpbXBvcnRhbnQgdG8gYmUgYXdhcmUgb2YK
Pj4+PiB0aGUgaW1wbGllZCBsaW1pdGF0aW9ucy4KPj4+Pgo+Pj4+IMKgwqBSZWdhcmRzLAo+Pj4+
IMKgwqBBcm5vdXQKPj4+Pgo+Pj4+Pgo+Pj4+PiBSZWdhcmRzLAo+Pj4+PiBZYW5uIEUuIE1PUklO
Lgo+Pj4+Pgo+Pj4+Pj4gV2l0aCBPcGVuU1NIIDkuOCBvcGVuIHNlc3Npb25zIGFyZSBoYW5kbGVk
IGJ5IHRoZSBzZXBhcmF0ZQo+Pj4+Pj4gc3NoZC1zZXNzaW9uIGJpbmFyeSBzbyBraWxsYWxsIGRv
ZXMgbm90IGhpdCB0aGVtIGFueSBtb3JlLCBidXQKPj4+Pj4+IGEgdGFyZ2V0ZWQgImtpbGwiIGNv
bW1hbmQgaXMgc3RpbGwgZGVzaXJhYmxlLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZp
b25hIEtsdXRlIChXSVdBKSA8ZmlvbmEua2x1dGVAZ214LmRlPgo+Pj4+Pj4gLS0tCj4+Pj4+IFst
LVNOSVAtLV0KPj4+Pj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zc2gvUzUwc3NoZCBiL3Bh
Y2thZ2Uvb3BlbnNzaC9TNTBzc2hkCj4+Pj4+PiBpbmRleCAyMmRhNDFkMWNhLi5mMWZmOWRmZWMx
IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvcGFja2FnZS9vcGVuc3NoL1M1MHNzaGQKPj4+Pj4+ICsrKyBi
L3BhY2thZ2Uvb3BlbnNzaC9TNTBzc2hkCj4+Pj4+PiBAQCAtMyw2ICszLDggQEAKPj4+Pj4+IMKg
ICMgc3NoZMKgwqDCoMKgwqDCoMKgIFN0YXJ0cyBzc2hkLgo+Pj4+Pj4gwqAgIwo+Pj4+Pj4KPj4+
Pj4+ICtQSURGSUxFPSIvdmFyL3J1bi9zc2hkLnBpZCIKPj4+Pj4+ICsKPj4+Pj4+IMKgICMgTWFr
ZSBzdXJlIHRoZSBzc2gta2V5Z2VuIHByb2dhbSBleGlzdHMKPj4+Pj4+IMKgIFsgLWYgL3Vzci9i
aW4vc3NoLWtleWdlbiBdIHx8IGV4aXQgMAo+Pj4+Pj4KPj4+Pj4+IEBAIC0xNCwxNSArMTYsMjUg
QEAgc3RhcnQoKSB7Cj4+Pj4+Pgo+Pj4+Pj4gwqDCoMKgwqDCoCBwcmludGYgIlN0YXJ0aW5nIHNz
aGQ6ICIKPj4+Pj4+IMKgwqDCoMKgwqAgL3Vzci9zYmluL3NzaGQKPj4+Pj4+IC3CoMKgwqAgdG91
Y2ggL3Zhci9sb2NrL3NzaGQKPj4+Pj4+IMKgwqDCoMKgwqAgZWNobyAiT0siCj4+Pj4+PiDCoCB9
Cj4+Pj4+PiArCj4+Pj4+PiDCoCBzdG9wKCkgewo+Pj4+Pj4gwqDCoMKgwqDCoCBwcmludGYgIlN0
b3BwaW5nIHNzaGQ6ICIKPj4+Pj4+IC3CoMKgwqAga2lsbGFsbCBzc2hkCj4+Pj4+PiAtwqDCoMKg
IHJtIC1mIC92YXIvbG9jay9zc2hkCj4+Pj4+PiArwqDCoMKgIHBpZD0iJCggY2F0ICIke1BJREZJ
TEV9IiAyPi9kZXYvbnVsbCB8fCB0cnVlICkiCj4+Pj4+PiArwqDCoMKgIGlmIFsgLXogIiR7cGlk
fSIgXTsgdGhlbgo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGVjaG8gIkVSUk9SOiBub3QgcnVubmlu
ZyIKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMQo+Pj4+Pj4gK8KgwqDCoCBmaQo+Pj4+
Pj4gK8KgwqDCoCBraWxsICIke3BpZH0iCj4+Pj4+PiArwqDCoMKgICMgU1NIRCBkZWxldGVzIGl0
cyBQSUQgZmlsZSB3aGVuIGV4aXRpbmcsIHdhaXQgZm9yIGl0IHRvCj4+Pj4+PiArwqDCoMKgICMg
ZGlzYXBwZWFyLgo+Pj4+Pj4gK8KgwqDCoCB3aGlsZSBbIC1mICIke1BJREZJTEV9IiBdOyBkbwo+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNsZWVwIDAuMQo+Pj4+Pj4gK8KgwqDCoCBkb25lCj4+Pj4+
PiDCoMKgwqDCoMKgIGVjaG8gIk9LIgo+Pj4+Pj4gwqAgfQo+Pj4+Pj4gKwo+Pj4+Pj4gwqAgcmVz
dGFydCgpIHsKPj4+Pj4+IMKgwqDCoMKgwqAgc3RvcAo+Pj4+Pj4gwqDCoMKgwqDCoCBzdGFydAo+
Pj4+Pj4gQEAgLTQ0LDQgKzU2LDMgQEAgY2FzZSAiJDEiIGluCj4+Pj4+PiDCoCBlc2FjCj4+Pj4+
Pgo+Pj4+Pj4gwqAgZXhpdCAkPwo+Pj4+Pj4gLQo+Pj4+Pj4gLS0gCj4+Pj4+PiAyLjQ1LjIKPj4+
Pj4+Cj4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+Pj4+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4+Pj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPj4+Pj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
