Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDA6C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 17:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C56B80BC4;
	Sun, 28 Apr 2024 17:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmNb1V8N4yIj; Sun, 28 Apr 2024 17:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7485B81F9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7485B81F9A;
	Sun, 28 Apr 2024 17:23:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6161BF8B4
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 17:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11A9680BC4
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 17:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9KvcBLZbhcn for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 17:23:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5D6D81F9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5D6D81F9A
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5D6D81F9A
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 17:23:18 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2de2f5ca076so41520181fa.0
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 10:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714324996; x=1714929796;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fkoXTv3A+bqBS5z8tbKDvZ8hEYiZa+ffq3D/GuFJCb4=;
 b=YvFv345CDRNY6soCXqOtdMiuchCdUVME0GwNomHwqIlxjQ8ElJjaIhAyASOEfNwl/1
 YevcadWKGPKBAHdYye53yn0aIhOWKm1lyrNqq1J9eIjWgVKCZfvsIXBrBq/5V4oScjfW
 j0Uhf01qjfa3K0ny5Rsv6AADoTxv+28XSJclrT4Gerjo2qiGNK+iTl4mHf7jFWouayAB
 6iAjdOBUDf+PgChFrh6wz81M45LwYy0odjz2amTt10ex8wFA06ogdkGti3ZFtZdV5orb
 sxb7WZB5jDn7w+MPLcOM1fR2DxflZdsSpqVGOWiGD3KdC3KrYgND9unj+ZwkoyUVovAJ
 uJyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6orG/qB9fNE0JOhV1lrxrhTxdVVeRDSMBrNdDyepZcWyqvwLIezVqIy5GMyyOYk2DF1IEAPLyvO4bgRV93YMdL+S4dPAKvQ==
X-Gm-Message-State: AOJu0YzEomxRP5F9mnKYj6DBqwIip2MBT7XvXr+CYpuodZ4AAznO7VAt
 7BQrDAPBsN7f7o+1vwECKaFY0J1flhxX9MtHk/wVoO8T9Vurx+ahbtfqYP19fJU=
X-Google-Smtp-Source: AGHT+IEGOOPeHrmwMCxkcrr6hmWyuP9RZJDcZMFhU8wudaVHGB0UmptcNcRPEXMEl4FEWxZWuei9BA==
X-Received: by 2002:a2e:8204:0:b0:2df:54fc:56d9 with SMTP id
 w4-20020a2e8204000000b002df54fc56d9mr4531761ljg.26.1714324996145; 
 Sun, 28 Apr 2024 10:23:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c348400b0041bcb898984sm6682758wmq.31.2024.04.28.10.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 10:23:15 -0700 (PDT)
Message-ID: <f49f7c39-60b7-45d1-8f61-999147cd75a1@mind.be>
Date: Sun, 28 Apr 2024 19:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christopher Hunt <huntchr@gmail.com>, buildroot@buildroot.org
References: <8A84B636-FF5F-4B7A-8771-D4D299F8784F@gmail.com>
Content-Language: en-GB
In-Reply-To: <8A84B636-FF5F-4B7A-8771-D4D299F8784F@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714324996; x=1714929796; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fkoXTv3A+bqBS5z8tbKDvZ8hEYiZa+ffq3D/GuFJCb4=;
 b=BaAYYgX2UgiUiFZv+9BwEV/dtpGmH37wamVuUei1E4DHtett+RIED68ITTGN1FHiAO
 wUSZ9y0LVXzkoaPdsBNpP/Gel7iid7S572Wtjqn+gdpbKaYk7lgw2PWx07mjqdvthROW
 6+A8skLaQZxuM62HgoesUvkZ7hx24ibOIfNRixamfXLCQL78SeR9Ir51v1afrqlD44fc
 r75Vp83RzzJvn4vracqErHlh+gPtjGIqZ9y9wvo6Sr1bVRrUtdJUYMYuEggLNMA4oK5l
 ldIUM8KChKfMC6LMf4E/xmtVo3HENdSJoOhrJhR4wWXrSiXTJ8XK+zmEIyXjArdhdCP3
 Q/Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BaAYYgX2
Subject: Re: [Buildroot] Custom DTS declaration
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC8wNC8yMDI0IDA5OjQwLCBDaHJpc3RvcGhlciBIdW50IHdyb3RlOgo+IEhpIHRoZXJl
LAo+IAo+IEnigJltIHNvbWV3aGF0IGNvbmZ1c2VkIGFib3V0IHRoZSBkZXZpY2UtdHJlZSB0aGF0
IEkgY2FuIHZpZXcgZnJvbSB0aGUgTGludXggQ0xJIAo+IHZzIHdoYXQgSeKAmW0gc3VwcGx5aW5n
IHRvIGJ1aWxkcm9vdC4KPiAKPiBJZiBJIGxvb2sgYXQgL3Byb2MvZGV2aWNlLXRyZWUvbW9kZWwg
dGhlbiBJIHNlZSAiTWljcm9jaGlwIFNBTUE1RDI3IFdMU09NMSBFS+KAnS4gCj4gSG93ZXZlciwg
bXnCoGJvYXJkL2N1cHJvdXMvZ3cvbGludXgvZHRzL2F0OTEtc2FtYTVkMjdfd2xzb20xX2N1cHJv
dXNfZ3cuZHRzIAo+IGRlY2xhcmVzLCAiTWljcm9jaGlwIFNBTUE1RDI3IFdMU09NMSBDdXByb3Vz
IEdhdGV3YXnigJ0uIEnigJltIGRlY2xhcmluZyB0aGUgdXNlIG9mIAo+IHRoYXQgRFRTIHZpYcKg
Y29uZmlncy9taWNyb2NoaXBfc2FtYTVkMjdfd2xzb20xX2N1cHJvdXNfZ3dfZGVmY29uZmlnIHdp
dGg6Cj4gCj4gQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImF0OTEtc2FtYTVkMjdf
d2xzb20xX2N1cHJvdXNfZ3figJ0KPiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSD0i
Ym9hcmQvY3Vwcm91cy9ndy9saW51eC9kdHMvYXQ5MS1zYW1hNWQyN193bHNvbTFfY3Vwcm91c19n
dy5kdHMiCgogIFdoZW4gc3BlY2lmaWVkIGxpa2UgdGhpcywgeW91IHdpbGwgYnVpbGQgMiB2ZXJz
aW9ucyBvZiB0aGUgRFRCOgotIG9uZSBmcm9tIHRoZSBrZXJuZWwgc291cmNlcywgYXJjaC9hcm0v
Ym9vdC9kdHMvc2FtYTVkMjdfd2xzb20xX2N1cHJvdXNfZ3cuZHRzCi0gb25lIGZyb20gdGhlIEJ1
aWxkcm9vdCBzb3VyY2UsCiAgIGJvYXJkL2N1cHJvdXMvZ3cvbGludXgvZHRzL2F0OTEtc2FtYTVk
Mjdfd2xzb20xX2N1cHJvdXNfZ3cuZHRzCgpUaGV5IGRvbid0IGhhdmUgdGhlIHNhbWUgYmFzZW5h
bWUsIHNvIHlvdSdsbCBnZXQgdHdvIERUQnMgaW4gb3V0cHV0L2ltYWdlcy4gTXkgCmd1ZXNzIGlz
IHRoYXQgeW91IGJvb3RlZCB3aXRoIHNhbWE1ZDI3X3dsc29tMV9jdXByb3VzX2d3Li5kdGIgcmF0
aGVyIHRoYW4KYXQ5MS1zYW1hNWQyN193bHNvbTFfY3Vwcm91c19ndy5kdGIKCiAgUmVnYXJkcywK
ICBBcm5vdXQKCj4gCj4gVWJvb3QgaXMgY29uZmlndXJlZCB0byB1c2UgaXRzIG93biBEVFMgd2l0
aCB0aGUgbmFtZSBvZiAiTWljcm9jaGlwIFNBTUE1RDI3IAo+IFdMU09NMSBFS+KAnSwgc28gaXQg
Y291bGQgYmUgdGhhdCwgb3IgaXQgY291bGQganVzdCBiZSB0aGF0IEnigJl2ZSBub3QgZGVjbGFy
ZWQgbXkgCj4gY3VzdG9tIExpbnV4IERUUyBjb3JyZWN0bHkuCj4gCj4gQW55dGhpbmcgb2J2aW91
cz8KPiAKPiBGdWxsIHJlcG8gaGVyZTogaHR0cHM6Ly9naXRodWIuY29tL2N1cHJvdXMtYXUvYnVp
bGRyb290L3RyZWUvMjAyMi4wNS54IAo+IDxodHRwczovL2dpdGh1Yi5jb20vY3Vwcm91cy1hdS9i
dWlsZHJvb3QvdHJlZS8yMDIyLjA1Lng+Cj4gCj4gVGhhbmtzIGZvciBhbnkgaGVscC4KPiAKPiBD
aGVlcnMsCj4gLUMKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
