Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F80C4167B
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 16:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63EA541E44;
	Sat, 11 Nov 2023 16:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63EA541E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZdpWnRQeJeRA; Sat, 11 Nov 2023 16:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1DB341D98;
	Sat, 11 Nov 2023 16:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1DB341D98
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 060881BF38A
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 16:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D13D840C2D
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 16:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D13D840C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dJe2-JxNRS02 for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 16:31:05 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CBD940C96
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 16:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CBD940C96
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40a4848c6e1so9503235e9.1
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 08:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699720263; x=1700325063;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pgl+tAbopx5YMjmvwgd6xGWThX6baK8wr4oA1fkSVEE=;
 b=JXEg62ITm7s5X3e3wJta46pUC95PCU/9HA27zy5LOsbIaQt/216teJFa348s5xLRuZ
 +bYFIo9bAU89VM85j6EqG5Aux+1eadDiDVXQNUFDAvth0d8MvYlYXmyqlsW/KljkHsdV
 XlGeXC+O9nstI1hoNQ8GjSD9FyzUfIeBlwVI/IDdlollyyHU1PGLNc8l1/Yq817qZD+b
 IdAy7H2DFO1e+eetglaQZv8wPF7e5t5o6TmlnZKYN9o/C/UMai/WXceZJIJCC+yBQ36o
 +s20GgwKd2DM/2o2N3Mfza4DRD832i++qeY2vcg2JvoUgVKeE7eP+sxG+72uZT974na9
 Qa9Q==
X-Gm-Message-State: AOJu0YxGnFrv0J25dN1388OzSfB88ZsVwMzAFe30zEhT41I+H5gfGzaw
 qgn6j+FvlYB7/iwKsm3rzpN+cQ==
X-Google-Smtp-Source: AGHT+IGJ/IR2baBK5snhwUwzhwIXiczomnFTWFqaaURTOUT3mMVJltrqV1SGvoEhXcmzWlyS9gZVWQ==
X-Received: by 2002:a05:600c:19c8:b0:401:73b2:f043 with SMTP id
 u8-20020a05600c19c800b0040173b2f043mr1918475wmq.1.1699720262587; 
 Sat, 11 Nov 2023 08:31:02 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 fl23-20020a05600c0b9700b0040a45fffd27sm4945931wmb.10.2023.11.11.08.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Nov 2023 08:31:02 -0800 (PST)
Message-ID: <6a805941-0594-416e-8f15-7e8562c6b9d6@smile.fr>
Date: Sat, 11 Nov 2023 17:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20231103000650.195673-1-adam.duskett@amarulasolutions.com>
 <20231103000650.195673-2-adam.duskett@amarulasolutions.com>
 <20231103211611.0dc93419@windsurf>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20231103211611.0dc93419@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1699720263; x=1700325063;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pgl+tAbopx5YMjmvwgd6xGWThX6baK8wr4oA1fkSVEE=;
 b=SQacs2mttTX8J8TBdI684sVrn/Xy6SxLx2h38slnPqxAOMRXebfMcU2FCBf+BHyYzP
 oHo5V+6r8GubRTpScad7snygMGjZAzueLCi8Am0BuWEWDO8t5e7B4jRpJU2qqyvYLDP2
 o8iFVv4yo4YtbdH7LQrizzH+ScLT21vJKwIySFYmWayqy73sqo3/KSnKumXUihbDzrOk
 6zTcNfDBcW5Ynmp9RzdLT+Zuptcaw1zgIYg7t9GazXjmQuPH9KiM8vUJzmhPcRiP/ods
 UMb7D5u6jPMPa8KHUxoIliX+TqMZtYYYZ9iBuZwlYZZPy3oIVIMrU/rYhpRXrMtnb38Y
 Ia5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=SQacs2mt
Subject: Re: [Buildroot] [PATCH] package/nodejs: bump version to 20.9.0
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
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAwMy8xMS8yMDIzIMOgIDIxOjE2LCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWls
ZHJvb3QgYSDDqWNyaXTCoDoKPiBPbiBUaHUsICAyIE5vdiAyMDIzIDE4OjA2OjUwIC0wNjAwCj4g
QWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+
IAo+PiAtIFJlZmFjdG9yIDAwMDEtYWRkLXFlbXUtd3JhcHBlci1zdXBwb3J0LnBhdGNoIGZvciAy
MC45LjAKPj4KPj4gLSBOb2RlSlMgbm93IHJlcXVpcmVzIEdDQyAxMC4xIGhlYWRlci4gSG93ZXZl
ciwgYXMgdGhlcmUgaXMgbm8KPj4gICBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8xMF8xLCB3
ZSByb3VuZCB1cCB0byBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8xMS4KPj4KPj4gLSBEcm9w
IHRoZSAtLXdpdGhvdXQtZHRyYWNlIGFuZCAtLXdpdGhvdXQtZXR3IGNvbmZpZyBvcHRpb25zIGFz
IHRoZXkgbm8gbG9uZ2VyCj4+ICAgZXhpc3QuCj4+Cj4+IC0gVXBkYXRlIHN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3Rfbm9kZWpzLnB5IHRvIHVzZQo+PiAgIEJSMl9UT09MQ0hBSU5f
RVhURVJOQUxfQk9PVExJTiwgb3RoZXJ3aXNlIHRoZSB0ZXN0IGZhaWxzIGFzIHRoZQo+PiAgIGdj
YyB2ZXJzaW9uIHNlbGVjdGVkIHdpbGwgYmUgNy4KPj4KPj4gLSBVcGRhdGUgdGhlIGhhc2ggZmls
ZSBmb3IgTElDRU5TRS50eHQgZHVlIHRvIG51bWVyb3VzIGNoYW5nZXMsIHN1Y2gKPj4gICBhcyB0
aGUgYWRkaXRpb24gb2YgbmV3IGxpYnJhcmllcyBhbmQgdXBkYXRlZCBkYXRlcy4gTm8gbmV3IGxp
Y2Vuc2UKPj4gICB0eXBlcyBhcmUgYWRkZWQuCj4+Cj4+IFRlc3RlZCB3aXRoOiAuL3N1cHBvcnQv
dGVzdGluZy9ydW4tdGVzdHMgdGVzdHMucGFja2FnZS50ZXN0X25vZGVqcwo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25zLmNvbT4K
Pj4gLS0tCj4+ICBwYWNrYWdlL25vZGVqcy9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAg
fCAgOCArLS0KPj4gIC4uLi8wMDAxLWFkZC1xZW11LXdyYXBwZXItc3VwcG9ydC5wYXRjaCAgICAg
ICB8IDUxICsrKysrKysrKysrKy0tLS0tLS0KPj4gIC4uLnVsZXMtY2pzLWxvYWRlci5qcy1hZGp1
c3QtZGVmYXVsdC1wYS5wYXRjaCB8ICAyICstCj4+ICBwYWNrYWdlL25vZGVqcy9ub2RlanMtc3Jj
L25vZGVqcy1zcmMubWsgICAgICAgfCAgNCAtLQo+PiAgcGFja2FnZS9ub2RlanMvbm9kZWpzLmhh
c2ggICAgICAgICAgICAgICAgICAgIHwgMTUgKysrLS0tCj4+ICBwYWNrYWdlL25vZGVqcy9ub2Rl
anMubWsgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+PiAgc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9ub2RlanMucHkgIHwgIDMgKysKPj4gIDcgZmlsZXMgY2hhbmdlZCwg
NTAgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCj4gCj4gQXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcy4KClRoZSBUZXN0Tm9kZUpTQmFzaWMgZmFpbCBpbiBnaXRsYWIgc2luY2UgaG9zdC1n
Y2MgaXMgMTAuMi4xCgokIGdjYyAtLXZlcnNpb24KZ2NjIChEZWJpYW4gMTAuMi4xLTYpIDEwLjIu
MSAyMDIxMDExMAoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
am9icy81NDY0OTMwMDY2CgpJdCBzZWVtcyB3ZSBzaG91bGQgcmVhbGx5IHRyeSB0byBkb3duZ3Jh
ZGUgdG8gX0FUX0xFQVNUXzEwIGFzIHN1Z2dlc3RlZCBieQpBcm5vdXQgYW5kIFlhbm4uCgpBbHNv
IHRoZSBwYWNrYWdlL25vZGVqcy9Db25maWcuaW4uaG9zdCBkb2Vzbid0IHNlZW1zIHVwZGF0ZWQg
YnkgdGhpcyB2ZXJzaW9uCmJ1bXAgKEkgY2FuIHN0aWxsIHNlbGVjdCBCUjJfUEFDS0FHRV9IT1NU
X05PREVKUykuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gVGhvbWFzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
