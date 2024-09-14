Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF34C021AC
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 19:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCF4480B92;
	Sat, 14 Sep 2024 19:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a73KtOZvoZvS; Sat, 14 Sep 2024 19:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C39D380B2C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C39D380B2C;
	Sat, 14 Sep 2024 19:51:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 344D41BF2AA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2187C40735
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzNHZmWMa26H for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 19:51:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACE9F40731
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACE9F40731
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACE9F40731
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 19:51:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3780c8d689aso2455147f8f.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726343486; x=1726948286;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m8SnXQDTkSBtyBGdOo9u3fnrVDdO4M57qzE0gPrVxGY=;
 b=sCxRAIX0w/T8VVQS4971RIAGNGZ2u8G20UELowD8N3ujCQPiKM8Ojn6Hmvhc8ZEO1V
 9FxWiaZ/zjk/4zFsxMno9qLRHvGpRqf6reDQYwVRGAUGUaowP/EXQo2P7FKFCpju8z+A
 W9fapGVjFI1FuJzqlnxHFw5rUFG5XMIBfH/w1AhS69IpSke8vC2mDK80kr+LTmGA8tv+
 zJWla2xKQy4UJKwsxbdZ4T+0kPiiF2OJeYuBk6BAnHAqc7lhKGfr+569GMCUjV+vWgph
 NhjJqZttQ4MDkO7zkMvAZQAVEgtAggENcwiylov+acKuMfRMEkIIKEB5yABbKtJ9Ns1B
 8dWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBD1NDysM3+8ZKnGhrsJSamsxwlhKqLmHZLmJ5dri4nIqP2rfB7Ix4I69IK22xDQkv/qocu6VaRGY=@buildroot.org
X-Gm-Message-State: AOJu0YyY9o8Z0/LlinKupFrlOWFEe1CvNQNiNiHNnlwBA0XgYMv5DiXY
 Q52MdqM8c729ZRjLcFUlizXuipKFsuqVBPBDvgolX0gls65QA+k3NKEHT7g2lOPKArhLSLlMja6
 l3LU=
X-Google-Smtp-Source: AGHT+IHsGeatMMNwtEB7r3uXVe0s6Ikgv7yfXUThq4ZW3M1i8j65J0vhtorzIkCdorIJWdnwDXXxNw==
X-Received: by 2002:a05:600c:4fc2:b0:42c:af2a:dcf4 with SMTP id
 5b1f17b1804b1-42cdb56ae3dmr68317445e9.27.1726343485838; 
 Sat, 14 Sep 2024 12:51:25 -0700 (PDT)
Received: from ?IPV6:2a02:61:a2::9b5? ([2a02:61:a2::9b5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e78044dfsm2677761f8f.94.2024.09.14.12.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2024 12:51:25 -0700 (PDT)
Message-ID: <1456288c-ea8a-401d-bdec-c51d4fbdf09d@mind.be>
Date: Sat, 14 Sep 2024 21:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Andreas_D=C3=BCring?= <brpi@duering-andreas.de>,
 buildroot@buildroot.org
References: <20240914201937.567067fd@devuanPc.fritz.box>
Content-Language: en-GB
In-Reply-To: <20240914201937.567067fd@devuanPc.fritz.box>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726343486; x=1726948286; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m8SnXQDTkSBtyBGdOo9u3fnrVDdO4M57qzE0gPrVxGY=;
 b=asNcNcINtwhDe/3DZq7eliOA4LN53r3z1h5n/48h3esxtN+oOnxH6RV1WLqm3xVJOI
 cGkN/yD3M4H3s6jxPrJem8vnOsxT0e3H4wjK70MhjJOBYSQubBApwIoCjlUKdK7rEebb
 MpS84zk/fssy2ctYbMkuaBSNSYDe2OiEyE3Xuy3Yr0EmSqAS+NytjpiAOLM1i8yHDwEM
 cy0xG7iSl3y5AZwYTA1g/q2injBlCpxGR94kLfvw0OHQDKKuOJTHuDH+JwP407u6oCab
 JHhb9iBpM4uN74kYax6YkL1UDqMrnJTiDrsdi5eecdmgwOu8t2qUVMci6RneA7jsKF47
 RG1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=asNcNcIN
Subject: Re: [Buildroot] Buildroot does not use ccache for compiling Linux
 kernel?
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

CgpPbiAxNC8wOS8yMDI0IDIwOjE5LCBBbmRyZWFzIETDvHJpbmcgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBIZWxsbywKPiAKPiBJIGFtIGN1cnJlbnRseSBleHBlcmltZW50aW5nIHdpdGggYnVpbGRp
bmcgYSBtaW5pbWFsIGltYWdlIGZvciBteQo+IFJhc3BiZXJyeSBQaS4KPiAKPiBEdXJpbmcgdGhp
cyBwcm9jZXNzLCBJIHJlYWxpemVkIHRoYXQgY2NhY2hlLCBhbHRob3VnaCBlbmFibGVkLCBpcyBu
b3QKPiB1c2VkIGZvciBjb21waWxpbmcgdGhlIExpbnV4IGtlcm5lbC4KCiAgVGhhdCBpcyB2ZXJ5
IHdlaXJkLCBiZWNhdXNlIGNjYWNoZSBpcyBhZGRlZCBieSB0aGUgdG9vbGNoYWluIHdyYXBwZXIu
IEl0IGNhbiAKb25seSBiZSBkaXNhYmxlZCBieSBzZXR0aW5nIEJSMl9VU0VfQ0NBQ0hFPTAgaW4g
dGhlIGVudmlyb25tZW50IChvciBvbiB0aGUgbWFrZSAKY29tbWFuZCBsaW5lKS4KCiAgSG93IGRp
ZCB5b3UgZGV0ZXJtaW5lIHRoYXQgaXQgZG9lc24ndCB1c2UgY2NhY2hlPwoKPiBJIHRoaW5rIHRo
aXMgaXMgYmVjYXVzZSBvZiB0aGUKPiByZWNpcGUgaW4gbGludXgvbGludXgubWs6Cj4gCj4gTElO
VVhfTUFLRV9GTEFHUyA9IFwKPiAgICAgICAgICBIT1NUQ0M9IiQoSE9TVENDKSAkKHN1YnN0IC1J
LywtaXN5c3RlbSAvLCQoc3Vic3QgLUkgLywtaXN5c3RlbSAvLCQoSE9TVF9DRkxBR1MpKSkgJChI
T1NUX0xERkxBR1MpIiBcCgogIFdlIGV4cGxpY2l0bHkgZG9uJ3QgdXNlIGNjYWNoZSBoZXJlIChI
T1NUQ0MgZG9lc24ndCB1c2UgdGhlIHdyYXBwZXIsIHNvIGl0IApuZWVkcyB0byBiZSBhZGRlZCBl
eHBsaWNpdGx5IHRoZXJlKS4gU2VlIGNvbW1pdCA3MWEzMWIyMyBmb3IgYW4gZXhwbGFuYXRpb24g
d2h5LgoKPiAgICAgICAgICBBUkNIPSQoS0VSTkVMX0FSQ0gpIFwKPiAgICAgICAgICBJTlNUQUxM
X01PRF9QQVRIPSQoVEFSR0VUX0RJUikgXAo+ICAgICAgICAgIENST1NTX0NPTVBJTEU9IiQoVEFS
R0VUX0NST1NTKSIgXAo+ICAgICAgICAgIFdFUlJPUj0wIFwKPiAgICAgICAgICBSRUdFTkVSQVRF
X1BBUlNFUlM9MSBcCj4gICAgICAgICAgREVQTU9EPSQoSE9TVF9ESVIpL3NiaW4vZGVwbW9kCj4g
Cj4gCj4gVGhlIGxpbnV4IGtlcm5lbCBzZWVtcyB0byBhc3NlbWJsZSB0aGUgY29tcGlsZXIgdXNp
bmcgVEFSR0VUX0NST1NTLAo+IGUuZy4KPiBDQyA9ICQoVEFSR0VUX0NST1NTKWdjYwo+IAo+IEFz
IGEgdmVyeSBjcnVkZSBzb2x1dGlvbiwgSSBjaGFuZ2VkIHRoZSBjb3JyZXNwb25kaW5nIGxpbmUg
dG8KPiAgICAgICAgICBDUk9TU19DT01QSUxFPSJjY2FjaGUgJChUQVJHRVRfQ1JPU1MpIgoKICBU
aGlzIGlzIHdoYXQgd2UgaGFkIG9yaWdpbmFsbHksIGJ1dCBpdCB3YXMgcmVtb3ZlZCBpbiBjb21t
aXQgNTQ2YTY5ZGI2NmFiIApiZWNhdXNlIGl0IGlzIG5vdyBkb25lIGJ5IHRoZSB3cmFwcGVyLgoK
ICBSZWdhcmRzLAogIEFybm91dAoKPiBidXQgdGhpcyBpcyBwcm9iYWJseSBub3QgdGhlIG9wdGlt
YWwgc29sdXRpb24uIChJIGRpZG4ndCBjYXJlZnVsbHkKPiBjaGVjayB3aGVyZSBlbHNlIENST1NT
X0NPTVBJTEUgaXMgdXNlZCkuCj4gCj4gSWYgdGhpcyBpcyBhIGtub3duIGxpbWl0YXRpb24/IFNo
b3VsZCB0aGlzIGJlIGFkZGVkIHRvIHRoZQo+IGRvY3VtZW50YXRpb24/Cj4gaHR0cHM6Ly9idWls
ZHJvb3Qub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjY2NhY2hlCj4gKCJUaGlzIHdp
bGwgYXV0b21hdGljYWxseSBidWlsZCBjY2FjaGUgYW5kIHVzZSBpdCBmb3IgZXZlcnkgaG9zdCBh
bmQKPiB0YXJnZXQgY29tcGlsYXRpb24uIikKPiAKPiBXaXRoIGJlc3QgcmVnYXJkcywKPiBBbmRy
ZWFzCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
