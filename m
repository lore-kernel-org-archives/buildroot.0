Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B153C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:25:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C64460F21
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C64460F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08F24814B8;
	Mon, 11 Oct 2021 20:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yE6J1Js8dIUc; Mon, 11 Oct 2021 20:25:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B910814BB;
	Mon, 11 Oct 2021 20:25:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1609B1BF279
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12480402D7
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FMp58tbVt2IZ for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 20:25:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91902402A2
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 20:25:00 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g8so72297300edt.7
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 13:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DQi1xQLbbIcZHC/w+UnLM9V+0PJ1eGK4lhl8zISlHhU=;
 b=SVEMz9+eKhZ72ETigSkuGu1XcijF23w3zheVR2+V+9gFRV6nt8bUc3iGE1W0K7zxP5
 4HDdnk+QKFEEoRgibj8V7K66UX7n6q/sTZXKWNtNiOOiPkWssoBB9YHMQqRyw4yVUSIR
 fukXDXwoFXT7W11bKlCKjVksEbkRog3S2aCwcBWiwItarUQouG/rnCRKPgyKh8TOh0C8
 HoNqRmbp1QeKjBqhgh26qN4Jd2Ib0mDGVmGjvd892Gs93o/JsoZRrP+Gn12wQRliNUHt
 eTvstVSjS+vmoO8R5bdcYjrSL8zDeOJir7VadWjR+lsIGMn7qUg/KtwFZRBmPwDj2yhs
 zRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DQi1xQLbbIcZHC/w+UnLM9V+0PJ1eGK4lhl8zISlHhU=;
 b=XLkw8ZS8oR9yKsaXiS+OTZls51XI7RO6rvkaj7PxF+r9q5egP44wrwqxp8sGHgLRHa
 RjRjsubIlhe83E2tz2ZJvIKJEs5a/cz/WjzrbZteQ+jbkyWFrD3vPRNEp49JCQ2yITOL
 KCVw9/3s5jSPKEz90zmsz5wrL7KtWl4Ei4s5xVomzLeaAUGJkuTI9sUvUfrVtOy3jIrR
 0KHIv1XM5/a/X7lYXGc1/+/jowxFr8oyKf6yxwsvK6Zo7kxhm6oOemAO/j3jpVc5q/je
 bbcX2dpPwx7sJvNdGgLKZmOuTiFIRL7Dq5EKl9oxS/pfpr/zMV3Qxjt+any1C+cTDFEn
 trMw==
X-Gm-Message-State: AOAM532V5WTx+NZnWXaccgk7n9NiJ337wJzOYOr3tvYCZcwAoQDHVqRu
 NO4LGCnO5Xio1KO0I5xb0gdjPQ==
X-Google-Smtp-Source: ABdhPJybah7x7QLociW7fYC+OuC2StsDY5sN1YcE29FSIy+3ggW3Ou3YX5OxqI0RARqZSUyR6wdMVQ==
X-Received: by 2002:a17:906:1510:: with SMTP id
 b16mr29105101ejd.332.1633983898651; 
 Mon, 11 Oct 2021 13:24:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p10sm3959977ejf.45.2021.10.11.13.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 13:24:58 -0700 (PDT)
Message-ID: <59c215b4-63e2-ba22-285f-0fb4032111b8@mind.be>
Date: Mon, 11 Oct 2021 22:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?Q?Esa=c3=afe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
 <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
 <1819f3c3-52db-7e21-8d42-f5c2ae434f33@gmail.com>
 <CA+eej5ObHKKx4x=uOYRDF1npRR4kqnucWByTtNkbS40A+1y-GA@mail.gmail.com>
 <fe8b5e30-6cb7-161d-6e6e-cdddadcbbe01@gmail.com>
 <CA+eej5M-SbCseCpknXdMboR7Lz+A94BNHMBZd2WJkcbDD6pZAg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CA+eej5M-SbCseCpknXdMboR7Lz+A94BNHMBZd2WJkcbDD6pZAg@mail.gmail.com>
Subject: Re: [Buildroot] error when i build buidroot
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBFc2FpZSwKCiAgUGxlYXNlIGRvbid0IHRvcC1wb3N0LCBidXQgcmVwbHkgaW5saW5lIGxp
a2UgSSBkbyBiZWxvdy4gTm90ZSB0aGF0IHRoaXMgCnJlcXVpcmVzIGNvbmZpZ3VyaW5nIHlvdXIg
bWFpbGVyIHRvIHF1b3RlIHJlcGxpZXMgcHJvcGVybHkgKGkuZS4gcHV0ID4gbWFya2VycyAKaW4g
ZnJvbnQgb2YgZWFjaCBsaW5lKS4KCgpPbiAxMS8xMC8yMDIxIDEyOjIwLCBFc2HDr2UgTGVkb3V4
IE5KT05HU1NJIEtPVUFNIHdyb3RlOgo+IGkgaGF2ZSB0cmllZAo+IGdpdCBjbG9uZSBnaXQ6Ly9n
aXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QgPGh0dHA6Ly9naXQuYnVpbGRyb290Lm5ldC9idWls
ZHJvb3Q+Cj4gbWFrZSBxZW11X3g4Nl82NF9kZWZjb25maWcKPiBtYWtlCj4gCj4gaSBoYXZlIHR5
cGUgaXQgb24gRG9jdW1lbnRzIGZvbGRlciB0aGF0IGhhcyBleHQ0IGZpbGUgc3lzdGVtCgogIEFz
IEpvYWNoaW0gYXNrZWQsIGNhbiB5b3UgcHJvdmlkZSB0aGUgb3V0cHV0IG9mCgogICAgIHB3ZAoK
YW5kCgogICAgIGZpbmRtbnQKCnNvIHdlIGNhbiBzZWUgaWYgdGhlIGZpbGVzeXN0ZW0gcmVhbGx5
IGlzIGV4dDQsIG9yIGl0IGhhcyBzb21lIHdlaXJkIG1vdW50IApvcHRpb24sIG9yIGFueXRoaW5n
IGVsc2UgdGhhdCBjb3VsZCBleHBsYWluIHRoZSBpc3N1ZT8KCiAgWW91IGNhbiBhbHNvIHRyeToK
CiAgICAgdG91Y2ggZm9vCiAgICAgY2htb2QgNjY2IGZvbwoKaW4gdGhlIGJ1aWxkcm9vdCBkaXJl
Y3RvcnkuIElmIHRoYXQgZ2l2ZXMgYW4gZXJyb3IsIHRoZXJlIGlzIHJlYWxseSBzb21ldGhpbmcg
Cndyb25nIHdpdGggeW91ciBPUy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gCj4gc3RpbGwg
bm93IGkgaGF2ZSB0aGUgc2FtZSBlcnJvcgo+IAo+IExlwqBkaW0uIDEwIG9jdC4gMjAyMSDDoMKg
MjE6NTcsIEpvYWNoaW0gV2liZXJnIDx0cm9nbG9iaXRAZ21haWwuY29tIAo+IDxtYWlsdG86dHJv
Z2xvYml0QGdtYWlsLmNvbT4+IGEgw6ljcml0wqA6Cj4gCj4gICAgIEhpLAo+IAo+ICAgICBPbiAx
MC8xMC8yMSA2OjUyIFBNLCBFc2HDr2UgTGVkb3V4IE5KT05HU1NJIEtPVUFNIHdyb3RlOgo+ICAg
ICAgPiBubyBmaWxlc3lzdGVtIGhhcyBiZWVuIGNvbmZpZ3VyZWQgLi4uCj4gICAgICA+IEknbSBq
dXN0IHRyeWluZyB0aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uCj4gCj4gICAgIFRoaXMgaXMgZmlu
ZS7CoCBJIHRoaW5rIHlvdSd2ZSBnb3Qgc29tZXRoaW5nIHJlYWxseSB3cm9uZyB3aXRoIHlvdXIK
PiAgICAgS2FsaSBMaW51eCBob3N0IHN5c3RlbS4KPiAKPiAgICAgID4gc2hvdWxkIGkgY29uZmln
dXJlIGZpbGUgc3lzdGVtIGZvciBteSBidWlsZHJvb3QgPz8KPiAKPiAgICAgTm8sIHdlIG1lYW4g
dGhlIGZpbGUgc3lzdGVtIHlvdSBhcmUgdXNpbmcgZm9yIGJ1aWxkaW5nIEJ1aWxkcm9vdCBvbiwK
PiAgICAgaW4geW91ciBLYWxpIExpbnV4IGluc3RhbGwuwqAgVGhlIHJzeW5jIGVycm9yIGxvb2tz
IGFzIGlmIHlvdXIgZGlzawo+ICAgICBwYXJ0aXRpb24gaXMgYSBub24tbmF0aXZlIExpbnV4IGZp
bGUgc3lzdGVtLCBsaWtlIEZBVCwgd2hpY2ggZG9lcwo+ICAgICBub3Qgc3VwcG9ydCB0aGUgb3Bl
cmF0aW9ucyByc3luYyB0cmllcyB0byBwZXJmb3JtLgo+IAo+ICAgICBIb3cgaGF2ZSB5b3Ugc2V0
IHVwIHlvdXIgS2FsaSBMaW51eD/CoCBEbyB5b3UgaGF2ZSB0aGUgYnVpbGRyb290IGdpdAo+ICAg
ICBzb3VyY2VzIGNoZWNrZWQgb3V0IHRvIHlvdXIgaG9tZSBkaXJlY3Rvcnkgb3Igc29tZSBvdGhl
ciBkaXJlY3RvcnksCj4gICAgIHBlcmhhcHMgc2hhcmVkIHdpdGggV2luZG93cz/CoCBJZiBzbywg
SSdkIGRlZmluaXRlbHkgYXZvaWQgdGhhdC4gWW91Cj4gICAgIGNhbiBjaGVjayB0aGUgZmlsZXN5
c3RlbSBvZiB5b3VyIGJ1aWxkIGRpcmVjdG9yeSBieSBjb21wYXJpbmcgdGhlCj4gICAgIG91dHB1
dCBvZgo+IAo+ICAgICAgwqAgwqBwd2QKPiAKPiAgICAgd2l0aCB0aGUgb3V0cHV0IGZyb20KPiAK
PiAgICAgIMKgIMKgZmluZG1udAo+IAo+ICAgICBPbiBteSBzeXN0ZW0gSSBoYXZlIGV4dDQgaW4g
dGhlIEZTVFlQRSBjb2x1bW4gZm9yIG15IGhvbWUgZGlyZWN0b3J5LAo+ICAgICB3aGljaCBpcyBp
biB0aGUgLyBUQVJHRVQuCj4gCj4gICAgIEkgZmluaXNoZWQgbXkgaW5zdGFsbCBvZiBLYWxpIGlu
IG15IG93biBWTS7CoCBJdCBjcmFzaGVkIGJhZGx5IGJlZm9yZQo+ICAgICBJIGdhdmUgaXQgZW5v
dWdoIGRpc2sgKDQwIEdpQikgYW5kIFJBTSAoNCBHaUIpLsKgIFRoYXQncyBhbm90aGVyIHRoaW5n
Cj4gICAgIHRoYXQgbWlnaHQgaGF2ZSBtZXNzZWQgdXAgeW91ciBidWlsZCB0cmVlLgo+IAo+ICAg
ICAgPiB0aGUgZXJyb3IgcGVyc2lzdHMgZXZlbiBpZiBpIGNvbXBpbGUgaXQgYXMgbm9ybWFsIHVz
ZXIKPiAKPiAgICAgV2VsbCB0aGF0J3MgZ29vZCB0byBrbm93LCBhdCBsZWFzdCBpdCdzIGNvbnNp
c3RlbnQuwqAgSnVzdCBiZXdhcmUKPiAgICAgdGhhdCBpZiB5b3UgcmV1c2UgdGhlIHNhbWUgc291
cmNlIHRyZWUsIGhhdmluZyBzd2l0Y2hlZCB0byBhbm90aGVyCj4gICAgIHVzZXIsIGEgbG90IG9m
IGZpbGVzIG1heSBzdGlsbCBoYXZlIHJvb3QgYXMgdGhlIG93bmVyLCB3aGljaCBtYXkKPiAgICAg
Z2l2ZSB5b3Ugb3RoZXIgcHJvYmxlbXMuwqAgRWl0aGVyIGBzdWRvIGNob3duIC1SIHVzZXI6dXNl
ciAuYCBmcm9tCj4gICAgIGluc2lkZSB0aGUgQnVpbGRyb290IHNvdXJjZSB0cmVlLCBvciBjaGVj
ayBvdXQgYSBuZXcgdHJlZS4KPiAKPiAgICAgQmVzdCByZWdhcmRzCj4gICAgICDCoC9Kb2FjaGlt
Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
