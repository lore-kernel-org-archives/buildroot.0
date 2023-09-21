Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF30E7D0A7
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 20:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F96883CA8;
	Thu, 21 Sep 2023 20:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F96883CA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ZwM_yKBWhC6; Thu, 21 Sep 2023 20:10:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2CC883C9D;
	Thu, 21 Sep 2023 20:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2CC883C9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0251BF2B8
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6377F600C9
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6377F600C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ra13GYKmASRP for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 20:10:40 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73256613C9
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 20:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73256613C9
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2bffa8578feso23329821fa.2
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 13:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695327038; x=1695931838;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H/MweD0et7B2839TP4e5WNFgAafks3KunV9PRTEPako=;
 b=OCK794e77PjJoUUleS5fHf1/iLaL7MnNKzRBtLYSzxBWAmIy3Y7wTLVq4+uyzX5SgC
 U8FtXi0Hk7fmHfiO2m3Qw5SRyZrOSc2zUEeWzM+6rm92gg1No4c1+EF/FegN3VM3mp20
 4CH4iQEnEgBaeNTKxgWmjkD21JXjCW61VTa6kxgnm6z7A9wURwn4tzWO8eeXWxf9iSKM
 rqPIb8yeRzwwFDaTk7DBejq3nMca4DRVIKq5n4BNtcQurrnFb2h2F2qHpROO+KT4bUrO
 uj9Yohc2xkYm/Tb9QLbuV8DP82DMWhghEXQV/z14ZbKYS81YdK1X2IktAJYHN1dS3T6F
 9kQw==
X-Gm-Message-State: AOJu0Yz8TwWJiUQ+1xPE4OmxWsUDsS2vkvGQ/8gsVyUTdsHj1kxENgfk
 2597spXhGNfWVaaNFFEnyCRsOw==
X-Google-Smtp-Source: AGHT+IHPkg0Cw1rCxmuOe4rQWHMtSwN4iC/1pSM0NoBCIb43gefrdFGd+RzDWrfoUfNUPT+E1byTdw==
X-Received: by 2002:ac2:5b1d:0:b0:503:1746:6882 with SMTP id
 v29-20020ac25b1d000000b0050317466882mr5982509lfn.37.1695327038223; 
 Thu, 21 Sep 2023 13:10:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 k10-20020aa7c38a000000b00530cf354746sm1281772edq.48.2023.09.21.13.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 13:10:37 -0700 (PDT)
Message-ID: <903bb436-381e-96cf-cfd7-f3edd40505b7@mind.be>
Date: Thu, 21 Sep 2023 22:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20230917202539.365838-1-giulio.benetti@benettiengineering.com>
 <20230918081559.1025134-1-giulio.benetti@benettiengineering.com>
 <983c8224-7628-6b66-6f32-a29d398e17f8@mind.be>
 <6cc2bc56-81a3-49c4-81fb-9912c6bacf42@benettiengineering.com>
In-Reply-To: <6cc2bc56-81a3-49c4-81fb-9912c6bacf42@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695327038; x=1695931838; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H/MweD0et7B2839TP4e5WNFgAafks3KunV9PRTEPako=;
 b=gvtgWLW7EtJxhMatGIekDjlzszxnVd4s+VIfUOAMLkdEFieQfIxhgXBh/f6HJtNJOB
 mwvJ9TjK3lvUMxfVC7tndgptx66Czv1C6qGETHixwbsFmGDK6b7mXiKj9s0WSEDy5lzv
 0aVTpbmJgDS9XMkZ6/LDg4ltvrf91Ztlfyeam+fX2jzDllqQExJKQWkHn8LlC/90qjBT
 1ZjG3VHSr8xn7RzaWi8V/WpdBFcoaSB01Vzeizj5TYkeavhvfcN7REZ8oeGAw6si4OBy
 +WjYq/eeOfdMhbzQzJiUHh8ZrPerM4dYZO82Xp6yZzCaN1450kgnpERTvGCUnBunYVcp
 FZcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gvtgWLW7
Subject: Re: [Buildroot] [PATCH v2] package/apache: add option
 BR2_PACKAGE_APACHE_UTILS_ONLY
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jim Reinhart <jimr@tekvox.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMS8wOS8yMDIzIDIxOjI0LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIaSBBcm5vdXQs
Cj4gCj4gT24gMjEvMDkvMjMgMjA6NTgsIEFybm91dCBWYW5kZWNhcHBlbGxlIHZpYSBidWlsZHJv
b3Qgd3JvdGU6Cj4+IMKgwqBIaSBHaXVsaW8KPj4KPj4gT24gMTgvMDkvMjAyMyAxMDoxNSwgR2l1
bGlvIEJlbmV0dGkgd3JvdGU6CltzbmlwXQo+Pj4gK8KgwqDCoCAtLXdpdGgtc3RhdGljLWh0ZGln
ZXN0IFwKPj4+ICvCoMKgwqAgLS13aXRoLXN0YXRpYy1odHBhc3N3ZAo+Pgo+PiDCoMKgVGhpcyBz
b3VuZHMgbGlrZSB0aGV5J3JlIGxpbmtlZCBzdGF0aWNhbGx5PyBJcyB0aGVyZSBhIHJlYXNvbiB0
byBkbyB0aGF0IAo+PiAob3RoZXIgdGhhbiB0aGF0IHlvdSBoYXZlIHRvIGluc3RhbGwgdGhlIHNo
YXJlZCBsaWIgdG8gdGFyZ2V0LCBvZiBjb3Vyc2UpPwo+IAo+IEkgd2FzIGN1cmlvdXMgYWJvdXQg
dGhpcyB0b28gYW5kIHNvIEkndmUgdHJpZWQgdG8gZ2l2ZSBhOgo+ICQgZmlsZSBodGRpZ2VzdAo+
IGFuZCBzYW1lIHRvIGh0cGFzc3dkIGFuZCB0aGV5IHR1cm5lZCBvdXQgdG8gYmUgc2hhcmVkIGxp
bmtlZCBiaW5hcmllcywKPiBzbyB0aGF0IC0td2l0aC1zdGF0aWMtKiBvcHRpb24gaXMgcHJldHR5
IGFtYmlndW91cy4KCiAgV2VsbCwgbG9va2luZyBhdCB0aGUgY29uZmlndXJlIHNjcmlwdCwgaXQg
bG9va3MgbGlrZSBpdCBfZG9lc18gZ2V0IGxpbmtlZCB3aXRoIAotc3RhdGljIGlmIHRoYXQgb3B0
aW9uIGlzIGVuYWJsZWQuIE9mIGNvdXJzZSwgLXN0YXRpYyBkb2Vzbid0IG1lYW4gdGhhdCBpdCdz
IG5vdCAKbGlua2VkIGR5bmFtaWNhbGx5IGF0IGFsbCAtIGlmIHRoZXJlIGFyZSBzb21lIGxpYnJh
cmllcyBmb3Igd2hpY2ggbm8gc3RhdGljIAp2YXJpYW50IGlzIGF2YWlsYWJsZSAod2hpY2ggaXMg
dGhlIGNhc2UgaWYgQlIyX1NIQVJFRF9MSUJTPXkpLCB0aGVuIHRob3NlIGFyZSAKc3RpbGwgbGlu
a2VkIGR5bmFtaWNhbGx5LgoKICBBRkFJQ1MgdGhlcmUgc2hvdWxkIGJlIG5vIHJlYXNvbiB0byBw
YXNzIHRoZXNlIHR3byBvcHRpb25zLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBJJ20gZ29p
bmcgdG8gc2VuZCBWMyB3aXRoIHlvdXIgc3VnZ2VzdGlvbnMuCj4gCj4gVGhhbmsgeW91IHZlcnkg
bXVjaC4KPiBCZXN0IHJlZ2FyZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
