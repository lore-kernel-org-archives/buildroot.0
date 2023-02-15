Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DDAC636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4462B4179C;
	Wed, 15 Feb 2023 21:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4462B4179C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2yQnJ68_iNA; Wed, 15 Feb 2023 21:35:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BCF241798;
	Wed, 15 Feb 2023 21:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BCF241798
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 246201BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09E2260B09
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09E2260B09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qVhPFp1cJYWd for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:35:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E49D760AD1
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E49D760AD1
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:35:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id l2so105353wry.0
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 13:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qvEL40417DfaG+UvfgkL2mhHR4Q/Xj5k38C5vlSldGc=;
 b=eE3vuJ85MzJmz4t/PUrBrEEqTfxqhbOsDxHPxQ0rxer4Y9RNvsQl9JDwHebqTkL3Kl
 uSV0N0jefxCwVNW/QW6yBX75/t6bOsU1kdzzo3kulFT6YZEldTjd4I3wib+w1ySViGVd
 Ui5uWUcrh6etlzeB+DSCBgWPnxHWkyxQDiprvqo4dpYEJHpyeCMLXMTx6qtUFFDraSH1
 jlyc6bUsvxP3FUKH5zGOZ0QtjWrv61aI3FryrCfCKM1UDsnlO/phXsk3ckhu7WqCUMAX
 7KjkwU06RwOut4ndLyQkDZd/U+UXogpA/f6hxkkXQnPrMhFvyxXStrDweiozWuy/MMxL
 quAw==
X-Gm-Message-State: AO0yUKWMdsTt2aABR4LHbCAAzV6PzZw60x1sRsq3z+SwOLQlnG0AH924
 XAeotUQh2uwqQw0QNWQE8cvnSQ==
X-Google-Smtp-Source: AK7set8oqiBLF+wiPmTsfIjZb5UmX9jXLJAb5ozP56GmdDX7fV1RzZCmA43iaJ4HrBvpj7zkmXlC7A==
X-Received: by 2002:a5d:484d:0:b0:2c5:48ad:d352 with SMTP id
 n13-20020a5d484d000000b002c548add352mr3093093wrs.14.1676496936393; 
 Wed, 15 Feb 2023 13:35:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b002c54bf0e9f7sm13631525wrr.117.2023.02.15.13.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 13:35:34 -0800 (PST)
Message-ID: <09f2453a-b72a-211b-230e-f09ae0a53385@mind.be>
Date: Wed, 15 Feb 2023 22:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: AndreiCherniaev <cherniaev.andrei@kairo.space>, buildroot@buildroot.org
References: <20230109050525.1560963-1-cherniaev.andrei@kairo.space>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230109050525.1560963-1-cherniaev.andrei@kairo.space>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qvEL40417DfaG+UvfgkL2mhHR4Q/Xj5k38C5vlSldGc=;
 b=Q2+PsqbtIReWSGkJlKVhMex9tj8Z3IWHexDId0XJo5PjNd/XHTTI1kdXKHgtgB8uKw
 mpAfP5EzuAbzQ0GLiZaTn40ipG8LDntTaYAvE0p1Su1luTycwMYz00SZ3JF4ew8Bhpjk
 gxsTHqMYKngDGErJncll5aMJRntTG95JZO5i5Q6NC8lQmebBvga3aWsT1sSiGN6qqvio
 LoBi40qsFheU+dL8D+y9PhhxtE3fOIEgw30vXmB+XfqQVls9wNvjFvwkjUInwFDSn/n9
 9zi9o8ktkgzEccAEBxCkPHVMcNgPgwoQWWZrRkiV1DBA/ylriN9FFIhMiawptfRaEBcG
 45ow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q2+Psqbt
Subject: Re: [Buildroot] [PATCH] Makefile: add good message when user try
 make O=$PWD -C path/to/buildroot without cd /tmp/build
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
Cc: AndreiCherniaev <dungeonlords789@yandex.ru>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBBbmRyZWksCgpPbiAwOS8wMS8yMDIzIDA2OjA1LCBBbmRyZWlDaGVybmlhZXYgd3JvdGU6
Cj4gRnJvbTogQW5kcmVpQ2hlcm5pYWV2IDxkdW5nZW9ubG9yZHM3ODlAeWFuZGV4LnJ1Pgo+IAo+
IGh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1sCj4gVGhl
cmUgaXMgIjguNS7CoEJ1aWxkaW5nIG91dC1vZi10cmVlIi4gVGhlcmUgaXMgZXhhbXBsZSBvZiB1
c2luZwo+ICQgY2QgL3RtcC9idWlsZDsgbWFrZSBPPSRQV0QgLUMgcGF0aC90by9idWlsZHJvb3QK
PiBidXQgd2hlbiB1c2VyIGlnbm9yZSBjZCAvdG1wL2J1aWxkOyB0aGVyZSBpcyBtZXNzYWdlCj4g
ImVycm9yIFBsZWFzZSBjb25maWd1cmUgQnVpbGRyb290IGZpcnN0IChlLmcuICJtYWtlIG1lbnVj
b25maWciKSIKPiBidXQgdGhpcyBtZXNzYWdlIGlzIG5vdCBjb3JyZWN0LiBJIHN1Z2dlc3QgYSBu
ZXcgbWVzc2FnZSBpbiB0aGlzIGNhc2UuIFRoaXMgaXMgbWVzc2FnZSBmcm9tIG15IFBDOgo+ICJl
cnJvciBQbGVhc2UgZ28gdG8geW91ciBvdXRwdXQgZGlyZWN0b3J5IGZpcnN0IChlLmcuICJjZCAv
aG9tZS91c2VybmFtZS9Eb3dubG9hZHMvbXlHaXQvYnVpbGRyb290X09fYnVnL09fZm9sZGVyOyBt
YWtlIG1lbnVjb25maWciKSIKCiAgVGhhdCBkb2Vzbid0IHJlYWxseSBhZGRyZXNzIHRoZSBwcm9i
bGVtIC0gSSB0aGluayB0aGUgcmVhbCBwcm9ibGVtIGlzIHRoYXQgdGhlIApleGFtcGxlIGRvZXNu
J3QgbWFrZSBpdCBjbGVhciB5b3UgbmVlZCB0byBydW4gbWVudWNvbmZpZyAob3IgYW5vdGhlciBj
b25maWcpIGFzIAp0aGUgZmlyc3QgJ21ha2UnIGludm9jYXRpb24uCgogIFNvIGluc3RlYWQsIEkg
dXBkYXRlZCB0aGUgbWFudWFsIHRvIGFkZCAibWVudWNvbmZpZyIgaW4gdGhlIHR3byBleGFtcGxl
cyBnaXZlbiAKZm9yIG91dC1vZi10cmVlIGJ1aWxkcy4gSSBiZWxpZXZlIHRoYXQgd2l0aCB0aGF0
LCB0aGUgImUuZy4gbWFrZSBtZW51Y29uZmlnIiBpbiAKdGhlIGVycm9yIGlzIHN1ZmZpY2llbnRs
eSBjbGVhci4gSXQncyBvYnZpb3VzIHRoYXQgeW91IG5lZWQgdG8gcmVwZWF0IHRoZSBPPS4uLiAK
SU1ITy4KCiAgVGhhbmsgeW91IGZvciB0aGUgcmVwb3J0IGhvd2V2ZXIhCgogIFJlZ2FyZHMsCiAg
QXJub3V0Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJlaUNoZXJuaWFldiA8ZHVuZ2VvbmxvcmRz
Nzg5QHlhbmRleC5ydT4KPiAtLS0KPiAgIE1ha2VmaWxlIHwgNiArKysrKy0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
TWFrZWZpbGUgYi9NYWtlZmlsZQo+IGluZGV4IDg4ZjkwY2QyZmEuLjE3NmJlMTJhYzQgMTAwNjQ0
Cj4gLS0tIGEvTWFrZWZpbGUKPiArKysgYi9NYWtlZmlsZQo+IEBAIC05NDUsNyArOTQ1LDExIEBA
IGVsc2UgIyBpZmVxICgkKEJSMl9IQVZFX0RPVF9DT05GSUcpLHkpCj4gICAjIEFsc28gZm9yICdh
bGwnIHdlIGVycm9yIG91dCBhbmQgYXNrIHRoZSB1c2VyIHRvIGNvbmZpZ3VyZSBmaXJzdC4KPiAg
IC5QSE9OWTogbGludXggdG9vbGNoYWluCj4gICBsaW51eCB0b29sY2hhaW4gYWxsOiBvdXRwdXRt
YWtlZmlsZQo+IC0JJChlcnJvciBQbGVhc2UgY29uZmlndXJlIEJ1aWxkcm9vdCBmaXJzdCAoZS5n
LiAibWFrZSBtZW51Y29uZmlnIikpCj4gKwlpZmVxICgkKE5FRURfV1JBUFBFUikseSkgICMgaWZl
cSAoIiQob3JpZ2luIE8pIiwgImNvbW1hbmQgbGluZSIpICMgTyA6PSAkKENVUkRJUikvb3V0cHV0
Cj4gKwkJJChlcnJvciBQbGVhc2UgZ28gdG8geW91ciBvdXRwdXQgZGlyZWN0b3J5IGZpcnN0IChl
LmcuICJjZCAkKE8pOyBtYWtlIG1lbnVjb25maWciKSkKPiArCWVsc2UKPiArCQkkKGVycm9yIFBs
ZWFzZSBjb25maWd1cmUgQnVpbGRyb290IGZpcnN0IChlLmcuICJtYWtlIG1lbnVjb25maWciKSkK
PiArCWVuZGlmCj4gICAJQGV4aXQgMQo+ICAgCj4gICBlbmRpZiAjIGlmZXEgKCQoQlIyX0hBVkVf
RE9UX0NPTkZJRykseSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
