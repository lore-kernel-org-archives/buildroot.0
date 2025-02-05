Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0ACC02197
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 08:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B247683A54;
	Wed,  5 Feb 2025 08:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OPY3ZMAiKTa; Wed,  5 Feb 2025 08:03:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A747B83A47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A747B83A47;
	Wed,  5 Feb 2025 08:03:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 011CECD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDFA141800
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVH9RgKKvN2r for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 08:03:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B0B041610
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B0B041610
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B0B041610
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:03:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38db570a639so153312f8f.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 00:03:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738742602; x=1739347402;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wOGGnVluCa9e89+uzeqkb2t8ZJWWg5z/Ps6yQXa6VbI=;
 b=mrwPJkBXXUwExMT7DtCFZXGtiZEIHmjy1DJXdUn5ei5lRA0vSKiOGo42L1/eG9FUGA
 mrIb8voe60wjpzw3xCejtjCcExzcjM1MBD5JbyzgY7CG39j9TzqLsv4XKkO1Wm7279KN
 3VAUwUsBNAgDra3WTVNx/e379u4wttX1dPOKhuyBHQKnpYjUns5miT/Ow84n43bdQAS3
 ZNU7nOoZUT5nOC2YgmnQ1PPxVu9kNUHM5FQJuN283x4APJdkxfiDD3qvd22Z8Jn9esO8
 NXBp+yEyll6S4GNdR7j3tIf9bzahBqeCCuUEIuOwxWRqCxTcddS/Xo0+mKcGSbJMsf8P
 XvPA==
X-Gm-Message-State: AOJu0YyfqG0zmmBi1Xx61pDcTW8fJGLQWff6RDmW3VAqGzRLIg+9K4Tp
 Q6qWLmddM3JSllBLO2CydQ+dFvH0gjoBnONMq/YCbkpp6NvEVAm/8GKEZNpqulE=
X-Gm-Gg: ASbGncvbfzDWYMDenyFEPfrqkpeOwyWUgDssQqRNKIdQIa2zFHoaWrXe1agA9OFl9YO
 od4uTfj90B7tA+xyjvp61iK2PBHbBWnWoEK7ktkK6b7sSi1qFeLqPIY/ls7hhoenPcTqSnZzfFp
 FXIN2BPwTTsnEsFdOZYr87mhgIKntg1RQL//GsdZjIBigVY927LdyVhubMjdV350iCNeFG26Fo1
 +Wro3t0j8DFrvVL4OolX8dpKlzZeq0OlwsQchoyJlTOT83Lw8likDKN8hCMKFZ7RRM98RUE3v/F
 8f57VSc8kLKc39pI4gZt4xQQPJazdEgihubW1fNnn2jBJsE=
X-Google-Smtp-Source: AGHT+IHVKigejJGFBVbc/CtISraqwAcI9d0/027nGU0d4sgsR0Iu21do7SXofNmibw+wcvWoLIYnVQ==
X-Received: by 2002:a5d:4ec8:0:b0:38d:b090:a0b5 with SMTP id
 ffacd0b85a97d-38db090a2ddmr2247862f8f.17.1738742601556; 
 Wed, 05 Feb 2025 00:03:21 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf40asm17855639f8f.83.2025.02.05.00.03.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 00:03:21 -0800 (PST)
Message-ID: <527da78c-270f-4ec6-8a6e-1210456517a5@mind.be>
Date: Wed, 5 Feb 2025 09:03:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, Fiona Klute <fiona.klute@gmx.de>
Cc: Buildroot Mailing List <buildroot@buildroot.org>, yann.morin@orange.com,
 Thomas Perale <thomas.perale@mind.be>
References: <20250204143227.1233163-1-fiona.klute@gmx.de>
 <CA+h8R2odWOyS=7=9LGGkBGHYENiLHtkj76_L2Zvq_PHOFYs9sA@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CA+h8R2odWOyS=7=9LGGkBGHYENiLHtkj76_L2Zvq_PHOFYs9sA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738742602; x=1739347402; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wOGGnVluCa9e89+uzeqkb2t8ZJWWg5z/Ps6yQXa6VbI=;
 b=Xrz0VsX0uC9kVaYwWWlTljBjaCZG3s6exDsAIJs5U0vq7hSjEwtN3ZK4+lK4kQH0xw
 dFSJuwps/kNbVSaUiD1D6QQFLBAM3py1+OLMAUj3a7w0qHZqJciY6mGkY/FpB0aDzyNW
 kR3V0Esyu5b7wUxwNMd+WlAPLP9gHJTCWLyAvDLAeuJ/qTjKYWACAJHs1meA6IPtgcMf
 650u+W0Rk/yQPtLcZMNxdsvW/3Qcm7EEWhPN9w5TehKmkfP8qmzKfwl6TTebC1rHDuYN
 Yn/DuzqTtMM7R9dUuydbnwFN5RP8jEIEM3C9PcXefZrBMvZEEE6BbnQEoVAPjLThzSZ6
 N2AQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xrz0VsX0
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix build with
 toolchain without Gold linker
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNC8wMi8yMDI1IDIyOjIzLCBDaHJpc3RpYW4gU3Rld2FydCB3cm90ZToKPiBIaSBGaW9u
YSwgWWFubiwgYWxsLAo+IAo+IAo+IAo+IE9uIFR1ZSwgRmViIDQsIDIwMjUsIDY6MzLigK9BTSBG
aW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRlIAo+IDxtYWlsdG86ZmlvbmEua2x1dGVAZ214
LmRlPj4gd3JvdGU6Cj4gCj4gICAgIEZyb206ICJGaW9uYSBLbHV0ZSAoV0lXQSkiIDxmaW9uYS5r
bHV0ZUBnbXguZGUgPG1haWx0bzpmaW9uYS5rbHV0ZUBnbXguZGU+Pgo+IAo+ICAgICBHbyBmb3Jj
ZXMgdXNlIG9mIHRoZSBHb2xkIGxpbmtlciBvbiBhYXJjaDY0IGR1ZSB0byBhIGJ1ZyBpbiBCRkQg
KHRoZQo+ICAgICBkZWZhdWx0IEdOVSBsaW5rZXIpIHRoYXQgaXMgZml4ZWQgaW4gQmludXRpbHMg
Pj0gMi40MSBbMV0uIEFsbAo+ICAgICB0b29sY2hhaW5zIHByb3ZpZGVkIGJ5IEJ1aWxkcm9vdCBo
YXZlIHRoZSBmaXgsIGFuZCBub25lIG9mIHRoZW0KPiAgICAgcHJvdmlkZSBHb2xkLCBzbyB0aGUg
Zm9yY2VkIHNldHRpbmcgYnJlYWtzIGR5bmFtaWMgbGlua2luZyBpbgo+ICAgICBCdWlsZHJvb3Qu
IFNldCBFWFRMREZMQUdTIHRvIHVzZSBCRkQgaW5zdGVhZC4KPiAKPiAgICAgQWRkaXRpb25hbGx5
IGRpc2FibGUgUElFIG9uIG11c2wgdG8gZml4ICJyZWFkLW9ubHkgc2VnbWVudCBoYXMgZHluYW1p
Ywo+ICAgICByZWxvY2F0aW9ucyIgZXJyb3JzIGR1cmluZyBsaW5raW5nIFsyXS4KPiAKPiAgICAg
WzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vaXNzdWVzLzIyMDQwIDxodHRwczovL2dp
dGh1Yi5jb20vZ29sYW5nL2dvLwo+ICAgICBpc3N1ZXMvMjIwNDA+Cj4gICAgIFsyXSBodHRwczov
L2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy8xNzg0NyA8aHR0cHM6Ly9naXRodWIuY29tL2dv
bGFuZy9nby8KPiAgICAgaXNzdWVzLzE3ODQ3Pgo+IAo+ICAgICBTaWduZWQtb2ZmLWJ5OiBGaW9u
YSBLbHV0ZSAoV0lXQSkgPGZpb25hLmtsdXRlQGdteC5kZQo+ICAgICA8bWFpbHRvOmZpb25hLmts
dXRlQGdteC5kZT4+Cj4gICAgIC0tLQo+ICAgICBUaGlzIHBhdGNoIHJlcXVpcmVzIFlhbm4gRS4g
TW9yaW4ncyBwYXRjaCB0aGF0IGludHJvZHVjZXMKPiAgICAgUEFDS0FHRV9FWFRMREZMQUdTOgo+
ICAgICBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290Lwo+ICAg
ICBwYXRjaC84NzZmM2E3YmI2YTIzNzUxOTNmYzhmMDZhYjg1NmQyNDQ5ZjgzNzI3LjE2OTk1NDc5
OTMuZ2l0Lnlhbm4ubW9yaW5Ab3JhbmdlLmNvbS8gPGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvODc2ZjNhN2JiNmEyMzc1MTkzZmM4ZjA2YWI4NTZk
MjQ0OWY4MzcyNy4xNjk5NTQ3OTkzLmdpdC55YW5uLm1vcmluQG9yYW5nZS5jb20vPgo+IAo+ICAg
ICBCYXNlZCBvbiB0aGUgbGlua2VkIGlzc3VlIHRoZSAtLW5vLXBpZSBsaW5rZXIgZmxhZyBzaG91
bGQgYmUgbmVlZGVkCj4gICAgIG9ubHkgZm9yIG11c2wsIGJ1dCBJJ2QgYmUgZ3JhdGVmdWwgaWYg
YW55b25lIGNvdWxkIHRlc3Qgd2l0aCBnbGliYy4KPiAKPiAgICAgIMKgcGFja2FnZS9jb250YWlu
ZXJkL2NvbnRhaW5lcmQubWsgPGh0dHA6Ly9jb250YWluZXJkLm1rPiB8IDE0ICsrKysrKysrKysr
KysrCj4gICAgICDCoDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4gCj4gICAgIGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5tayA8aHR0cDovL2NvbnRh
aW5lcmQubWs+IGIvCj4gICAgIHBhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLm1rIDxodHRw
Oi8vY29udGFpbmVyZC5taz4KPiAgICAgaW5kZXggZWUwN2MyMjQ5NS4uY2I2NDhmODdhOSAxMDA2
NDQKPiAgICAgLS0tIGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQubWsgPGh0dHA6Ly9j
b250YWluZXJkLm1rPgo+ICAgICArKysgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5t
ayA8aHR0cDovL2NvbnRhaW5lcmQubWs+Cj4gICAgIEBAIC00OSw2ICs0OSwyMCBAQCBpZm5lcSAo
JChCUjJfUEFDS0FHRV9DT05UQUlORVJEX0NSSSkseSkKPiAgICAgIMKgQ09OVEFJTkVSRF9UQUdT
ICs9IG5vX2NyaQo+ICAgICAgwqBlbmRpZgo+IAo+ICAgICAraWZlcSAoJChCUjJfYWFyY2g2NCks
eSkKPiAgICAgKyMgR28gZm9yY2VzIHVzZSBvZiB0aGUgR29sZCBsaW5rZXIgb24gYWFyY2g2NCBk
dWUgdG8gYSBidWcgaW4gQkZEIHRoYXQKPiAgICAgKyMgaXMgZml4ZWQgaW4gQmludXRpbHMgPj0g
Mi40MSAoc28gYWxsIHZlcnNpb25zIHByb3ZpZGVkIGJ5Cj4gICAgICsjIEJ1aWxkcm9vdCkuIEZv
cmNpbmcgR29sZCB3aWxsIGJyZWFrIHdpdGggdG9vbGNoYWlucyB0aGF0IGRvbid0Cj4gICAgICsj
IHByb3ZpZGUgaXQsIHNvIG92ZXJyaWRlIHRoZSBmbGFnIGFuZCB1c2UgQkZELgo+ICAgICArIyBT
ZWU6IGh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vaXNzdWVzLzIyMDQwIDxodHRwczovL2dp
dGh1Yi5jb20vCj4gICAgIGdvbGFuZy9nby9pc3N1ZXMvMjIwNDA+Cj4gICAgICtDT05UQUlORVJE
X0VYVExERkxBR1MgKz0gLWZ1c2UtbGQ9YmZkCj4gICAgICtpZmVxICgkKEJSMl9UT09MQ0hBSU5f
VVNFU19NVVNMKSx5KQo+ICAgICArIyBHbyBleGUgYnVpbGQgd2l0aCBQSUUgZG9lc24ndCB3b3Jr
IHdpdGggbXVzbC4KPiAgICAgKyMgU2VlOiBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lz
c3Vlcy8xNzg0NyA8aHR0cHM6Ly9naXRodWIuY29tLwo+ICAgICBnb2xhbmcvZ28vaXNzdWVzLzE3
ODQ3Pgo+ICAgICArQ09OVEFJTkVSRF9FWFRMREZMQUdTICs9IC1XbCwtLW5vLXBpZQo+ICAgICAr
ZW5kaWYKPiAgICAgK2VuZGlmCj4gICAgICsKPiAgICAgIMKgZGVmaW5lIENPTlRBSU5FUkRfSU5T
VEFMTF9JTklUX1NZU1RFTUQKPiAgICAgIMKgIMKgIMKgIMKgICQoSU5TVEFMTCkgLUQgLW0gMDY0
NCAkKEBEKS9jb250YWluZXJkLnNlcnZpY2UgXAo+ICAgICAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgJChUQVJHRVRfRElSKS91c3IvbGliL3N5c3RlbWQvc3lzdGVtL2NvbnRhaW5lcmQuc2Vydmlj
ZQo+ICAgICAtLSAKPiAgICAgMi40Ny4yCj4gCj4gCj4gCj4gVGhpcyBsb29rcyBnb29kIHRvIG1l
LiBCdXQgc2hvdWxkbid0IHdlIGFwcGx5IHRoaXMgbW9yZSBnZW5lcmFsbHkgdG8gZ28tc3JjIGFu
ZCAKPiBnby1iaW4/IEl0J3MgdHJ1ZSBmb3IgYWxsIEdvIHBhY2thZ2VzIHRoYXQgd2Ugc2hvdWxk
IHBhc3MgdGhlc2UgZmxhZ3MgcmlnaHQ/IFdoeSAKPiBzcGVjaWZpY2FsbHkgY29udGFpbmVyZD8K
CiAgWWVzIEkgYWdyZWUgLSB0aGlzIHBhdGNoIChhbmQgWWFubidzIGluZnJhc3RydWN0dXJlIHBh
dGNoIHRoYXQgdGhpcyBwYXRjaCAKZGVwZW5kcyBvbikgc2hvdWxkIGJlIGluIHBrZy1nb2xhbmcg
aW5zdGVhZCBvZiBhbiBpbmRpdmlkdWFsIHBhY2thZ2UuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
