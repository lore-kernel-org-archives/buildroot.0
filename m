Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4556CC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB3B4185D;
	Sat, 23 Jul 2022 21:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDB3B4185D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdCt338SAPuK; Sat, 23 Jul 2022 21:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ADAA417B8;
	Sat, 23 Jul 2022 21:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ADAA417B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAEE01BF419
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4AF184BA1
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4AF184BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9wUO02I84aI for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:49:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5B4D813B4
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5B4D813B4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:49:35 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso4270547wmq.3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dQ0eVLRnYWOzG5tspuS3nzeq+iKGhmIgOHquD3F6YWI=;
 b=PzY8doWtRqP2JZrg6bUUBzQ2H8KZEwbKfqB6c+xJomVtoNzgGYozGVPT8o5SOj+MUi
 Ay+JkgZOPSlAZNnYBlXnDcyp9wYCJA74YxqB43TeIkYW6L0jpHLKyOPLM7finzB/5LLQ
 M0n+J22jABSLR+AJITFsmFmZqbBw0o7H5w0SiKccxSWkutKmKKJo5Dd0XHTe8dnKwVl6
 FFEybpxfDcMaOU/TWJfRM5UtOzr7r9cLGza209Q3PYhhG6pFgRbFxdHgIEeOq03Bv32S
 yDC21ssv9bKomAShZF1b8gh7yTVRdRiv394MAEYnw2hhsXXWZDEn3X1PA3ZBgKQsfHYv
 8QjA==
X-Gm-Message-State: AJIora8Dal8N7eDuT9Dk0nsEspjWIajTQMLDW6s51TCyhTQHAyTVatdL
 7zMhA4VM+5eAqQbmw92u/wTW3g==
X-Google-Smtp-Source: AGRyM1u+GCtU+rNPR96BskdCqx7P2o19CDHP4mx6MftbLEkASh3JKmg8tY6rmitYZy/eUvJ/I5V0yw==
X-Received: by 2002:a05:600c:2196:b0:3a2:feff:4c42 with SMTP id
 e22-20020a05600c219600b003a2feff4c42mr3835792wme.163.1658612973620; 
 Sat, 23 Jul 2022 14:49:33 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 a9-20020adfeec9000000b0021dfacfdf0dsm8154074wrp.33.2022.07.23.14.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 14:49:33 -0700 (PDT)
Message-ID: <abb8fd7f-faf7-1c30-25b8-53c374980e98@mind.be>
Date: Sat, 23 Jul 2022 23:49:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>,
 Conrad Ratschan <conrad.ratschan@rockwellcollins.com>,
 buildroot@buildroot.org
References: <20210226160937.16082-1-conrad.ratschan@rockwellcollins.com>
 <20210226160937.16082-4-conrad.ratschan@rockwellcollins.com>
 <84e423c7-3d69-9168-00f2-ff0c3b6ef480@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <84e423c7-3d69-9168-00f2-ff0c3b6ef480@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dQ0eVLRnYWOzG5tspuS3nzeq+iKGhmIgOHquD3F6YWI=;
 b=eYdIa0pVz1fZ9mBRqqS8Ri/eIABm3A3kBl5GhJb+nR69PiKNnwIQgDdx2VRForZLYq
 /bhDKDesbNuwCG8JzqRLCkvrxiQuJAsXpgkHPJ7pzKa94O2FdL7iSREYFOjIoCg2w4Nl
 9Goh2JGkX+Mjzj3seJrZgEGB7zSRvlAfx3FrvoGeE1olzT2991Qmv8yh7lx4XLd5a4Ah
 cboRilLl7wGGrj62xHrBgaI71i87xRnARBFetVqLBH4RPAcrZJcgK9yZkPAjl1WJ12Gy
 D9a19pqhQJYZErMTOPRDyxkl6rWHHjWUtoM6Yxh3GLOFE74WOmgBaEpI4q3AGaeqG4EV
 H3sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eYdIa0pV
Subject: Re: [Buildroot] [PATCH 4/4] package/python-diffoscope: Add as new
 package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMy8wNy8yMDIyIDIyOjI4LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGkgQ29ucmFkLAo+
IAo+IExlIDI2LzAyLzIwMjEgw6AgMTc6MDksIENvbnJhZCBSYXRzY2hhbiBhIMOpY3JpdMKgOgpb
c25pcF0KPj4gK0hPU1RfUFlUSE9OX0RJRkZPU0NPUEVfRExfU1VCRElSID0gcHl0aG9uLWRpZmZv
c2NvcGUKPj4gK0hPU1RfUFlUSE9OX0RJRkZPU0NPUEVfTkVFRFNfSE9TVF9QWVRIT04gPSBweXRo
b24zCj4+ICtIT1NUX1BZVEhPTl9ESUZGT1NDT1BFX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9u
LWxpYmFyY2hpdmUtYyBob3N0LXB5dGhvbi1tYWdpYwo+IAo+IFN0aWxsLCB0aGUgZGVwZW5kZW5j
eSBzZWVtcyBzaG9ydCBoZXJlLgo+IAo+IFRvIGVhc2UgQnVpbGRyb290IHBhY2thZ2luZywgeW91
IGNhbiBnZXQgc29tZSBoaW50IGZyb20gb3RoZXIgTGludXggRGlzdHJpYnV0aW9uCj4gcGFja2Fn
aW5nIChEZWJpYW4gWzFdLCBGZWRvcmEgWzJdLCBBcmNobGludXggWzNdIG9yIGV2ZW4gWW9jdG8g
WzRdKS4KPiAKPiBUaGUgbGlzdCBvZiBvcHRpb25hbCBkZXBlbmRlbmN5IG9mIGRpZmZvc2NvcGUg
aXMgaHVnZSBhbmQgaWYgd2UgY29tcGFyZSB3aXRoIHRoZQo+IFlvY3RvIHBhY2thZ2luZyBzb21l
IHJ1bnRpbWUgZGVwZW5kZW5jaWVzIGFyZSBtaXNzaW5nIChiaW51dGlscyB2aW0KPiBzcXVhc2hm
cy10b29scyBweXRob24zLXJwbSkKPiAKPiBTbyBhdCBsZWFzdCB3ZSBjYW4gYnVpbGQgZGlmZm9z
Y29wZSBidXQgYSBsaW1pdGVkIChsaWdodCkgdmVyc2lvbiB3aXRoCj4gQnVpbGRyb290LgoKICBJ
dCBsb29rcyBsaWtlIHRoZSBsaWdodCB2ZXJzaW9uIGlzIG5vdCBnb2luZyB0byBiZSB2ZXJ5IHVz
ZWZ1bCwgc28gdW5sZXNzIAp0aGVyZSdzIGEgdmVyeSBnb29kIHJlYXNvbiB0byBidWlsZCBpdCBp
biBidWlsZHJvb3QsIEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gcmVseSAKb24gdGhlIGRpc3Ryby1p
bnN0YWxsZWQgcGFja2FnZS4KCiAgQWxzbywgaXQncyByZWFsbHkgYSBkZWJ1ZyB0b29sLCBub3Qg
c29tZXRoaW5nIHRoYXQgaXMgZXZlciBnb2luZyB0byBiZSBuZWVkZWQgCmR1cmluZyB0aGUgYnVp
bGQuIE1heWJlIHlvdSB3YW50IENJIG5vdCB0byBqdXN0IGZhaWwgaWYgdGhlIGJ1aWxkIGlzIG5v
dCAKcmVwcm9kdWNpYmxlLCBidXQgYWxzbwoKICBUaGVyZWZvcmUsIEkgbWFya2VkIHRoaXMgc2Vy
aWVzIGFzIFJlamVjdGVkLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiBGb3IgYSBmdWxsIHZlcnNp
b24sIHlvdSBoYXZlIHRvIHVzZSB0aGUgb25lIGZyb20geW91ciBidWlsZCBtYWNoaW5lLgo+IAo+
IEZvciBleGFtcGxlLCBvbmx5IHRoZSBhdXRvYnVpbGRlciBzY3JpcHQgdXNlIGRpZmZvc2NvcGUg
YnV0IHRoZSBvbmUgaW5zdGFsbGVkIG9uCj4gdGhlIGJ1aWxkIG1hY2hpbmUuCj4gCj4gSXQgd291
bGQgYmUgZ3JlYXQgaWYgd2UgY2FuIGhhdmUgYSB0ZXN0IGNhc2UgZm9yIHRoaXMgcGFja2FnZS4K
PiAKPiBbMV0KPiBodHRwczovL3NhbHNhLmRlYmlhbi5vcmcvcmVwcm9kdWNpYmxlLWJ1aWxkcy9k
aWZmb3Njb3BlLy0vYmxvYi9tYXN0ZXIvZGViaWFuL2NvbnRyb2wKPiAKPiBbMl0gaHR0cHM6Ly9z
cmMuZmVkb3JhcHJvamVjdC5vcmcvcnBtcy9kaWZmb3Njb3BlL2Jsb2IvcmF3aGlkZS9mL2RpZmZv
c2NvcGUuc3BlYwo+IAo+IFszXQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hcmNobGludXgvc3ZudG9n
aXQtY29tbXVuaXR5L2Jsb2IvcGFja2FnZXMvZGlmZm9zY29wZS90cnVuay9QS0dCVUlMRAo+IAo+
IFs0XQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvb3BlbmVtYmVkZGVkLWNvcmUv
YmxvYi9jMmNmOTU2ODgxYzNiNjkxNjkxZjUwYjAwYjBkNjkzMGQ4YWJlYTZmL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlmZm9zY29wZV8yMTguYmIKPiAKPiBCZXN0IHJlZ2FyZHMs
Cj4gUm9tYWluCj4gCj4gCj4+ICsKPj4gKyQoZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2thZ2UpKQo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
