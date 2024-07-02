Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EE1C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 16:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70E8240C97;
	Tue,  2 Jul 2024 16:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yu_iDrwccPJN; Tue,  2 Jul 2024 16:22:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E19410BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E19410BA;
	Tue,  2 Jul 2024 16:22:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3591BF366
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1369980EDD
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92mZguvX49sZ for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 16:22:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFFDD80E8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFFDD80E8E
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFFDD80E8E
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 16:22:37 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2eabd22d3f4so43915141fa.1
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 09:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719937355; x=1720542155;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m/WpFzjxefgTKtlvznLTt89rEvfgpGpoRdTEJlaaXz4=;
 b=RHecT9uXnS+YIgsD8t+zbffsSDF0S6bXG5JuMfaZlfdQJyB2RfHYJL2DYE+s88pIMD
 Vo4LOgW6jwKC2YZMn+tCNT0ekdMrLquj5UKoZ9TI04cVwS28kGrTtI0EqZ3u2rFm0+BK
 H6o14nguFWk3kCNrtqf8BrV9PrrQDFsJec+uQnTJSR4AqPMKxv3ADwcEx1QQZjUhIboB
 MbvawQE26CXHBFZTUmVLVxTwrRbp1EYn+amKfdfhvBeGag7ijAkwaEJfJYj/VHBYN13w
 Pl54kT24Ly25xIJ1XKw+i9JQ0YQmggxLxkh4lSNXFr0lJ5e7NnCjMf07bGTjE4+qgHUl
 aEfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXepnlWMnAcL8EbxfJst8golzatlXkWTC7Hj/FxEh/T3SnR+EFVR/8bWkiFsfGQkgazwBIW30chqlC1571ucx6cFifKsX+c4Q==
X-Gm-Message-State: AOJu0Yzskbj7bkatazsZyQNhFYBLB4FFW7y7cxmou1KfwNaLSNeq9bWS
 Dllho2gw5YgMskRV3BUyGymLrbs5x2O/FIgt5Pi3ZsBifQaExZp5siBuJckzvXE=
X-Google-Smtp-Source: AGHT+IFViqgIwwS1zH8dP2hBhWw+qTNV8KEauhyul8mTk/1KhYsm2P14/tv4TWXLeQEVd/cYlPt/wg==
X-Received: by 2002:a2e:9217:0:b0:2ec:5b17:29a2 with SMTP id
 38308e7fff4ca-2ee5e6e0288mr51909671fa.32.1719937355322; 
 Tue, 02 Jul 2024 09:22:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257d9c7f18sm117856335e9.40.2024.07.02.09.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 09:22:34 -0700 (PDT)
Message-ID: <1c772538-f516-4bb6-a3b8-dffc095cb35c@mind.be>
Date: Tue, 2 Jul 2024 18:22:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20240629125521.976475-1-fiona.klute@gmx.de>
 <e710e75e-ddca-4d8f-8b62-2cbb2bdb78ed@mind.be>
 <63d7b817-713a-40ad-b6b7-40f5b9830d97@gmx.de>
 <0fda533c-e808-47cc-97ee-5d1b66046f93@mind.be>
 <1097e54c-e85e-439d-a9d4-461876184294@gmx.de>
Content-Language: en-GB
In-Reply-To: <1097e54c-e85e-439d-a9d4-461876184294@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719937355; x=1720542155; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m/WpFzjxefgTKtlvznLTt89rEvfgpGpoRdTEJlaaXz4=;
 b=Y46ef8GZM4pVm6obqu7KG+AP8ePixSxyfchKbU7UXND4bbNxgeZEhY1Ms8CnTn/wmG
 F1Eha7VkJTX55NrR2ZY9+3m8OJVk3kCdxrMJYKSDUJR5VFrFqhFuD/xIUv0G35pepQUG
 y5fdHBL8kv/XMdW4L26Ys1vocTieVXrQah46+4J0ewvog0QWxkY0c4ewSlD/fFGVOjTB
 59YjoXzZQPDGoCk2yJeMb3qhJCChpDxvPV+2xEEe78M2IiFYFMm82GiKEakO6He7NGzw
 giTCocfal78EeWoAeWQ9Cipr2VyBU9xjy9oWw6BDMju/SgBERfiVOzFssL8wkcAAii3w
 ObYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Y46ef8GZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-docker: bump version to
 7.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMi8wNy8yMDI0IDEzOjE3LCBGaW9uYSBLbHV0ZSB3cm90ZToKPiBBbSAwMS4wNy4yNCB1
bSAyMzozNSBzY2hyaWViIEFybm91dCBWYW5kZWNhcHBlbGxlOgo+PiBPbiAwMS8wNy8yMDI0IDIw
OjA3LCBGaW9uYSBLbHV0ZSB3cm90ZToKPj4+IEFtIDMwLjA2LjI0IHVtIDE2OjUyIHNjaHJpZWIg
QXJub3V0IFZhbmRlY2FwcGVsbGU6Cj4+Pj4KPj4+Pgo+Pj4+IE9uIDI5LzA2LzIwMjQgMTQ6NTUs
IEZpb25hIEtsdXRlIHZpYSBidWlsZHJvb3Qgd3JvdGU6CltzbmlwXQo+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGUrd2l3YUBnbXguZGU+Cj4+Pj4KPj4+PiDCoMKg
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4gU29tZXdoZXJlIGFsb25nIHRoZSBtYWlsIHBhdGgs
IHRoZSArd2l3YQo+Pj4+IHBhcnQgZ290IHN0cmlwcGVkIGZyb20gdGhlIEF1dGhvciB0YWcsIHNv
IEkgZml4ZWQgdGhhdC4KPj4+Cj4+PiBUaGFua3MgZm9yIG1lcmdpbmchIFRoZSBkaWZmZXJlbmNl
IHdhcyBhY3R1YWxseSBpbnRlbnRpb25hbDogTXkgbWFpbAo+Pj4gcHJvdmlkZXIgdW5mb3J0dW5h
dGVseSBkb2Vzbid0IGRlbGl2ZXIgbWFpbHMgd2l0aCBzdWJhZGRyZXNzaW5nLCBzbyBJCj4+PiB1
c2VkIGFuIGF1dGhvciBhZGRyZXNzIHdoZXJlIHBlb3BsZSBjYW4gYWN0dWFsbHkgcmVhY2ggbWUs
IGFuZCBhZGRlZCB0aGUKPj4+IHN1YmFkZHJlc3Mgc3BvbnNvciBhY2tub3dsZWRnbWVudCAoYXMg
c3VnZ2VzdGVkIGluIHRoZSBtYW51YWwpIG9ubHkgdG8KPj4+IHRoZSBzLW8tYiBsaW5lLgo+Pgo+
PiDCoMKgT2gsIGRhcm4sIHNvIHRoYXQgbWVhbnMgdGhhdCB0aGUgYXV0aG9yIGluZm9ybWF0aW9u
IHRoYXQgZ290IGNvbW1pdHRlZAo+PiBpcyB3cm9uZyBub3cuLi4gU29ycnkhIEknbGwgdHJ5IHRv
IGRvIGJldHRlciBpbiB0aGUgZnV0dXJlIHdoZW4gbWVyZ2luZwo+PiB5b3VyIHBhdGNoZXMuCj4+
Cj4+IMKgwqBJZiB0aGUgZ29hbCB3YXMgc3BvbnNvciBhY2tub3dsZWRnZW1lbnQsIHlvdSBjb3Vs
ZCBoYXZlIGRvbmUgaXQgbGlrZQo+PiB0aGlzOgo+Pgo+PiDCoMKgwqAgRmlvbmEgS2x1dGUgKFdp
d2EpIDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4gCj4gVGhhbmtzIGZvciB0aGUgaGludCEgV291bGQg
aXQgbWFrZSBzZW5zZSB0byBhZGQgdGhhdCB0byB0aGUgbWFudWFsCj4gKGRvY3MvbWFudWFsL2Nv
bnRyaWJ1dGUuYWRvYyk/IFRoZSAiU3VibWl0dGluZyBwYXRjaGVzIiBzZWN0aW9uCj4gY3VycmVu
dGx5IG1lbnRpb25zIG9ubHkgc3ViYWRkcmVzc2luZyBmb3Igc3BvbnNvciBhY2tub3dsZWRnZW1l
bnQuCgogIFRoYXQncyBhIGdyZWF0IGlkZWEsIHRoYW5rcyEKCiAgUmVnYXJkcywKICBBcm5vdXQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
