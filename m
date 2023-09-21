Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08A8E7D0A6
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 20:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 891B483CE7;
	Thu, 21 Sep 2023 20:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 891B483CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6rN977udtKTu; Thu, 21 Sep 2023 20:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C35CC83C81;
	Thu, 21 Sep 2023 20:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C35CC83C81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E3EB1BF98E
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64A8740141
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64A8740141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v381pspw4r6a for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 20:03:06 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D0D44010F
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 20:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D0D44010F
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-401da71b83cso14305475e9.2
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 13:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695326584; x=1695931384;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E35pi5LSpw1m3G4lwlSf5D6pI9J3G4Hh/7YQIr4iv1w=;
 b=OL0Ar+N4lKiNekzWGFe3a5xejaL04rXdhg+w/2HoYVo2vqj2k6W6UNnokGR+WAl58c
 LPeE1J9RHVYiVaem4ZAaPPcpAWM4VvcrghL1EasaxyIeDh37KWpxwJAdSH4ReRv7NJy8
 tU6Wsq5bTElj6VWn2z9NP/X/BU0R4xrankZC/ag1qwbb9fumKK60HKuFXBhPiJedHCTr
 bXY9UR2nsukCbZx2XJQVgLkKRFYkStdH++e9tDHFF8dsmCby3vOfXac7GDJqpUbExs4d
 /jI2XefOwWWTu3V4T0xew+sHubzw80Mk++YpgS2dBIqtBxv5S+cn6cGwQ2WWROfWw80+
 g1Zg==
X-Gm-Message-State: AOJu0Ywy3F0XFeDlb1grwI28/ew95onDvYf8Fmg4/KVbbBIIYz/kZDMB
 Ks73giXawk0a2fAdIDc2BqzGkEz/GtkEGaPrWVM=
X-Google-Smtp-Source: AGHT+IGD2Snqo1bY0f9oRNF8Dlc3HKCl1me9IXKtORL9M4oYyLC5HRrnkUr9Q11K0TFamSnPloSvvw==
X-Received: by 2002:a5d:5946:0:b0:316:f25c:d0c0 with SMTP id
 e6-20020a5d5946000000b00316f25cd0c0mr5700079wri.16.1695326583772; 
 Thu, 21 Sep 2023 13:03:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a170906594d00b009a1b857e3a5sm1532028ejr.54.2023.09.21.13.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 13:03:03 -0700 (PDT)
Message-ID: <0aa203a3-721e-c564-2c20-68baf6572d9b@mind.be>
Date: Thu, 21 Sep 2023 22:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Charles Hardin <ckhardin@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230822195726.0f691945@windsurf>
 <4EEF27B4-2C4A-427E-91A3-EBA5A63A1AFB@gmail.com>
In-Reply-To: <4EEF27B4-2C4A-427E-91A3-EBA5A63A1AFB@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695326584; x=1695931384; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E35pi5LSpw1m3G4lwlSf5D6pI9J3G4Hh/7YQIr4iv1w=;
 b=hJYCV8ZlOu9zO4E2rlXDRJYtMrHiXTv+cKfaJYXucJLW6kgF3/PnT3jLJBXTDAXDrz
 GUGwPKLs4da//f9Ss60nWwT7TB8VsLmEDGAMtGCVRHP3T5dEQafwjti05BBAZBMSdBAd
 dLc+5T3roLLai/hPbbBFnZmzOuv0pdB1N2n+HdGXqCRGkqsVI1k9mQDv3gtmJfo3iHVM
 LaC2Ia9K3rR24QUp4Zr6nNrVNwNSbX4+XNV/uUsp8iGBXk3gsR2MKZ9170s/59cCaS+L
 3FTJTEUFrDydl4Vq2L/mW6lrAeIHJKHA+JGbACGn9Mu6m8Ye96MRA5A16vYs7PXELZmK
 9YAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hJYCV8Zl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pykwalify: add required
 package for zephyr cmake
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
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMi8wOC8yMDIzIDIwOjAyLCBDaGFybGVzIEhhcmRpbiB3cm90ZToKPiBUaG9tYXMsCj4g
Cj4+IE9uIEF1ZyAyMiwgMjAyMywgYXQgMTA6NTcgQU0sIFRob21hcyBQZXRhenpvbmkgPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Pgo+PiDvu79IZWxsbyBDaGFybGVzLAo+
Pgo+Pj4gT24gTW9uLCAyMSBBdWcgMjAyMyAxNjo0NToyMyAtMDcwMAo+Pj4gQ2hhcmxlcyBIYXJk
aW4gPGNraGFyZGluQGdtYWlsLmNvbT4gd3JvdGU6CltzbmlwXQo+Pj4gU28sIHdlIGhhdmUgdmFy
aW91cyBSVE9TIE1DVXMgdGhhdCBhcmUgaG9va2VkIHVwIGludG8gbGludXggY29udHJvbGxlcnMs
Cj4+PiBhbmQgdGhpcyBpcyBqdXN0IGEgc2ltcGxlIGhvb2sgc28gdGhhdCB0aGUgc2FtZSBTREsg
Y2FuIGJlIGhhbmRsZWQgdG8gYnVpbGQKPj4+IGJvdGggZmlybXdhcmUgZm9yIHNvbWV0aGluZyBs
aWtlIGFuIFNUTTMyIGFuZCBhIFJhc3BiZXJyeS1waQo+Pgo+PiBJZiBJIHJlcGhyYXNlIHRoaXM6
IHlvdSB3YW50IHRvIHVzZSBCdWlsZHJvb3QgdG8gYnVpbGQgdGhlIFplcGh5cgo+PiBmaXJtd2Fy
ZSBmb3IgeW91ciBTVE0zMiBtaWNyby1jb250cm9sbGVyLCBhbG9uZ3NpZGUgd2l0aCB0aGUgTGlu
dXgKPj4gc3lzdGVtIHJ1bm5pbmcgb24gdGhlIFJhc3BiZXJyeVBpPwo+Pgo+IAo+IFllcywgYW5k
IHdlIGFyZSBkb2luZyB0aGlzIHRvZGF5IHdpdGggdGhlc2UgcGF0Y2hlcy4KCiAgSG9uZXN0bHks
IEkgZG9uJ3Qga25vdyBpZiB3ZSB3YW50IHRvIGdvIGluIHRoaXMgZGlyZWN0aW9uLiBJZiBaZXBo
eXIgZG9lc24ndCAKZ2l2ZSB5b3UgdGhlIHBvc3NpYmlsaXR5IHRvIGRvICJmcm9tIHNjcmF0Y2gi
IGJ1aWxkcywgdGhlbiBpbiB0aGlzIGRheSBhbmQgYWdlIAppdCdzIG1vcmUgYXBwcm9wcmlhdGUg
dG8gY3JlYXRlIGEgY29udGFpbmVyIGltYWdlIGZvciB5b3VyIGJ1aWxkIGVudmlyb25tZW50IApJ
TUhPLiBUaGVyZSdzIHNvbWV0aGluZyB0byBiZSBzYWlkIGZvciBpbmNsdWRpbmcgaG9zdCBwYWNr
YWdlcyB0aGF0IGFyZSBsaWtlbHkgCnRvIGJlIHVzZWQgaW4gcG9zdC1idWlsZC9wb3N0LWltYWdl
IHNjcmlwdHMsIGJ1dCBmb3IgYnVpbGRpbmcgYSBjb21wbGV0ZWx5IApkaWZmZXJlbnQgT1MsIHRo
YXQgaXMgZ29pbmcgYSBsaXR0bGUgZmFyIElNSE8uCgogIFNwZWNpZmljYWxseSBmb3IgUHl0aG9u
IHBhY2thZ2VzLCBJIGFsc28gdGhpbmsgaXQncyBtdWNoIG1vcmUgYXBwcm9wcmlhdGUgdG8gCnVz
ZSBwb2V0cnkgdG8gY29udHJvbCB0aGVtIGZvciB0aGUgaG9zdC4gVGhhdCB3YXkgd2UganVzdCBo
YXZlIHRvIHByb3ZpZGUgCmhvc3QtcHl0aG9uLXBvZXRyeSwgYW5kIHRoZSBwb3N0LWJ1aWxkL3Bv
c3QtaW1hZ2Ugc2NyaXB0cyBjYW4gdGFrZSBjYXJlIG9mIAppbnN0YWxsaW5nIGFsbCB0aGUgbmVl
ZGVkIHB5dGhvbiB0b29scyBhdCB0aGUgZXhhY3QgdmVyc2lvbiB5b3UgbmVlZCwgY29udHJvbGxl
ZCAKYnkgYSBsb2NrIGZpbGUuCgogIEluIG15IG9waW5pb24sIGV2ZW4gaW5jbHVkaW5nIHRob3Nl
IGFybS1ub25lLWVhYmkgZXRjLiBjb21waWxlcnMgaW4gQnVpbGRyb290IAp3YXMgZ29pbmcgYSBi
aXQgdG9vIGZhciBhbHJlYWR5LiBCdXQgSSBndWVzcyB0aGF0IHRoYXQgc2hpcCBoYXMgc2FpbGVk
IDotKQoKCiAgUmVnYXJkcywKICBBcm5vdXQKCgpbc25pcF0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
