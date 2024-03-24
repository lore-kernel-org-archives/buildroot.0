Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BF9C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 18:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4B46405C6;
	Sun, 24 Mar 2024 18:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQOI3bRpZyE6; Sun, 24 Mar 2024 18:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BD13405C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BD13405C7;
	Sun, 24 Mar 2024 18:15:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10B381BF364
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B1C681B69
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WT32wI2P79ia for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 18:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E19081B26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E19081B26
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E19081B26
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 18:15:12 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-341c7c8adf3so621812f8f.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 11:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711304111; x=1711908911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=659V9nedt4E0uiauju4KgP9ZVXWZxcKjocRh2HMcDo4=;
 b=oaDtNilqcL9OnQSZF8gfkyhxVIKnCao3a1yFpn3NfatMyFvkxSEdBOqQ0/4801JvJs
 Wgb1EZ8GwVyoWeZbn144T/YPF+vVFLwlwJQGPtrnDKJMSHxSMJr818ScdzVqxgEbIOHe
 ZbrFIZ4IkQU/nkHcF471a/Xpt29Ws0fSa5WdeMKbfmCHLUVkINhTDpZNDOX9xaRbV1bN
 v6A+EOhUHL8TKhP05LVEIZoll7kN6856U5oxaeJ78rYvBJyQb9RgoiDygEGQqyQRjVOo
 S79+WPudcve0CpQcYoq+L8ltM0yj5EQF9ts7Ocv5tiUS+vsBI5ihDUhU7/Tply4joKSd
 yYHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRAiUtEOLBiYnp7W97ScIB8kaKD82J9kZbE7wkbdTqwqBeOe8Pzf7Hy2GIocyLIaZ512eb44YDgsMsJZUx3s1ipkH0Ebv1Dw==
X-Gm-Message-State: AOJu0YwcYc7vJ9PWYqEtd8idu6eeot0HT8sCHC508m8WwRxCnWujZvzg
 ZQeE4M+Qe/fwDY9a/zQ05dIK1FosCLEclBfGbn+7Y0wRI3xu5CinAYUr/FvON8Q=
X-Google-Smtp-Source: AGHT+IFI/vaRNeVjd4Qt1DipTVYQ3XVOTGDOoB+FNbewYfcVawaTv7JzcbK+EDU/epefnNt/GO7DXQ==
X-Received: by 2002:a05:6000:232:b0:341:b9d2:82e0 with SMTP id
 l18-20020a056000023200b00341b9d282e0mr3137359wrz.20.1711304110764; 
 Sun, 24 Mar 2024 11:15:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bo4-20020a056000068400b00341b749ab8bsm4921239wrb.69.2024.03.24.11.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 11:15:10 -0700 (PDT)
Message-ID: <9e900cc9-83cb-48d6-a305-06543f1b41e7@mind.be>
Date: Sun, 24 Mar 2024 19:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>
References: <20240316084335.20839-1-bernd@kuhls.net>
 <20240316084335.20839-2-bernd@kuhls.net>
 <113740e8-230d-4ab3-bb9f-12e1bb66cd85@mind.be>
 <0c44fe3f-e87e-42fe-bbab-743fee1306a3@mind.be> <87v85bh6ax.fsf@48ers.dk>
In-Reply-To: <87v85bh6ax.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711304111; x=1711908911; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=659V9nedt4E0uiauju4KgP9ZVXWZxcKjocRh2HMcDo4=;
 b=NA3ZzswC59lo2JEpgOk2sjLAzSrTmX7n7j+06EnOF6R8VA78R4w3xbj3sXPebBAqmu
 8CN+Ed3ZL0FMj9eFGLG8jK+yapklBBVlfXgBx9WoaU+Mtx7V4lTU644Ei7cIxomkcJGo
 vf3/qY5+4ddCyLoWMaEYNivcoO9+ePeML5CmIG6Jf4wjXAqF4kQqu1XMyPvlrqRAjtxD
 wUtSrQsucCmtluS2eXY6pjiLukQGJRJ0JL4QEVrwtwzySqfRgO4GmvoS9nlMVTfk8jek
 32boOHOQuMwr2RYrUSPeuhPbhTbuVs+r1RC4GukBwPN2c5uWicSgkOIJlGqzbojYhuMl
 25+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NA3ZzswC
Subject: Re: [Buildroot] [PATCH 2/5] package/busybox: disable tc to fix
 build with kernel >= 6.8
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNC8wMy8yMDI0IDE4OjQ1LCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4+Pj4+PiAiQXJu
b3V0IiA9PSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdyaXRlczoKPiAK
PiAgID4gT24gMTYvMDMvMjAyNCAyMDoyNSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4g
ICA+Pgo+ICAgPj4KPiAgID4+IE9uIDE2LzAzLzIwMjQgMDk6NDMsIEJlcm5kIEt1aGxzIHdyb3Rl
Ogo+ICAgPj4+IEZvciBkZXRhaWxzIHNlZSBodHRwczovL2J1Z3MuYnVzeWJveC5uZXQvc2hvd19i
dWcuY2dpP2lkPTE1OTM0Cj4gICA+Pgo+ICAgPj4gwqBJJ20gYSBiaXQgYWZyYWlkIHRvIGFwcGx5
IHRoaXMuIEhvcGVmdWxseSB0aGUgaXNzdWUgd2lsbCBiZSBmaXhlZAo+ICAgPj4gYXQgc29tZSBw
b2ludCBpbiBidXN5Ym94OyB0aGVuLCB3ZSBzaG91bGQgcHJvYmFibHkgcmV2ZXJ0IHRoaXMgcGF0
Y2gKPiAgID4+ICh0aG91Z2ggaG9uZXN0bHkgSSBkb24ndCBrbm93IHdoYXQgdGMgaXMgZG9pbmcg
aW4gdGhlIG1pbmltYWwKPiAgID4+IGNvbmZpZy4uLikuCj4gCj4gCj4gICA+IMKgSSBkaWRuJ3Qg
YXBwbHkgdGhpcyBvbmUgbm9yIHRoZSBmb2xsb3dpbmcgdHdvLiBJJ20gaG9waW5nIHRoZSBvdGhl
cgo+ICAgPiBtYWludGFpbmVycyBjYW4gcGlwZSB1cCB3aXRoIGlkZWFzIG9mIGhvdyB0byBiZXN0
IGRlYWwgd2l0aCB0aGlzPwo+IAo+IEkgYWxzbyBkb24ndCB0aGluayBoYXZpbmcgdGMgZW5hYmxl
ZCBieSBkZWZhdWx0IG1ha2VzIGEgbG90IG9mCgogIEdvb2QgcG9pbnQhIEknbGwgYXBwbHkgdGhp
cyBhZnRlciBhbGwgdGhlbiwgd2l0aCBhbiB1cGRhdGVkIGNvbW1pdCBsb2cuCgogIFJlZ2FyZHMs
CiAgQXJub3V0Cgo+IHNlbnNlLiBOb3RpY2UgdGhhdCBVd2UgcmVjZW50bHkgcG9zdGVkIGEgcGF0
Y2ggdXBzdHJlYW0gdG8gZml4IHRoZSBidWlsZAo+IGlzc3VlOgo+IAo+IGh0dHA6Ly9saXN0cy5i
dXN5Ym94Lm5ldC9waXBlcm1haWwvYnVzeWJveC8yMDI0LU1hcmNoLzA5MDY3OC5odG1sCj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
