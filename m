Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CAAC021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 20:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F687803F9;
	Tue, 18 Feb 2025 20:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5QUaK_PWDXw; Tue, 18 Feb 2025 20:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 981A980BF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 981A980BF2;
	Tue, 18 Feb 2025 20:54:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6404C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96FDA4075F
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5roskSGcGfS for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 20:54:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E93774077D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E93774077D
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E93774077D
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:54:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38f29a1a93bso3909888f8f.1
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739912068; x=1740516868;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kIJ/GDJutjs41R6Cu5xb4XKWsRCiwNd0Muv2UJ56gns=;
 b=YINOmNwaFVB9QPDP7t5AINXAbU2zw4vySYnYxexMlMg+xTtmkwDlbfztoM/uEwp5WO
 D7BZInpz3mFck3QI4A7crRE+TCxUuj+58igWTeQgg7KuloyjDkUiiw2WdmzBYI7z0pyp
 vt6HSN+x0OZOBsuyJsw7b4xUgs/dt3zXQQyB4IzRnahEBH/voVsqCUuffIlmUKcYhnUi
 1g5dbmsvYMwuLsgKHd1O5OdHeLh1HfSdLpYWonWmroIq1KDTdpTTVufZz1YyrVFuG9IU
 9kBarxxDo0EaI5vBYLqaMDUuUyDIe8X0WtVgnDtMR/COPk+uDh8krxiPQVTgU6SbrBoO
 wD4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkyJiZ6AaAK77olMCUn1hwDWZfhjZAaVBN2RWNZj0fd4fY6iWUaXHhnQrIM1Acu1YLVvH2SmOGcx4=@buildroot.org
X-Gm-Message-State: AOJu0Yyfq/E/MspsC0rYngz1pP3FPx407e55QvAudiSOUvSgKHsgZRpm
 gY1QrBMdge6Fhjeuf3BC76JH4O9dtVP7X2abiaiISaJukwIZO9pg431t87Sw+w0=
X-Gm-Gg: ASbGncvnXvklbT5tMNuj6SjYsG7tz+x9+SJI5NfJrKu9daOduKIi9gKS/aV5Ow3MjpS
 85k6OxWcS7Af27VUZevvd9UtmcD9wOBo3Ece0ZH39Ut/YenrjC4tB4XBwy1RPZBbZnt9UYG/J5+
 ChRwyBL7w/F09sKmn6PkW5cqP0v4IXl5ANkjQ1Kj/12ob2xzkOaUYKWj8d6U4n+9gYBLNci28Y1
 VTpz1rwk+85TL0L3c09mbNgRuJ52tvi9leOtmgm4tj9S5aVydDMTtlSWFRolgv85nSEpvlmJn8F
 GHYrNXmXRYOoc49UfIvVDaIauiz+ZCOSKiOSYq7hDdu5Qp56T/hjsxf13Cfhc9grMSGY7I6lbFu
 yR7MSE/YlksKy1gbuqtv51cuEMp/nEEmFvJyahDgMeVk4Hw==
X-Google-Smtp-Source: AGHT+IG/S5UYmylP4+sEGNXQux9qsAk8aFjcRMCme3rBlyAiI7rGFJrz1qULhtgtLVp6BW96sI9oXQ==
X-Received: by 2002:a05:6000:1fa5:b0:38d:d69e:1314 with SMTP id
 ffacd0b85a97d-38f58781302mr817537f8f.9.1739912067681; 
 Tue, 18 Feb 2025 12:54:27 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258cccdesm15954276f8f.26.2025.02.18.12.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 12:54:27 -0800 (PST)
Message-ID: <6c2beafc-8e15-48c7-b74c-085ed502510d@mind.be>
Date: Tue, 18 Feb 2025 21:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>, buildroot@buildroot.org
References: <20250214112140.1862254-1-sairon@sairon.cz>
 <20250214112140.1862254-3-sairon@sairon.cz>
Content-Language: en-GB
In-Reply-To: <20250214112140.1862254-3-sairon@sairon.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739912068; x=1740516868; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kIJ/GDJutjs41R6Cu5xb4XKWsRCiwNd0Muv2UJ56gns=;
 b=IX9SSLGNDSZCHJ/oB2+NYx/0VqQTfhIfnU1WSDf341o1my3+9QtpeYeVk2jH9hZZrU
 qKsd9D+tqtmFjSE9ty7Z8ucHdIKSXui1AgC5fDWG/w5r9uofA1IbLOKZW6h8YaEvqtYi
 PsRlSUejv1hrFoHxCVLeJXZorUmg0VD7cmpH88BKssTqbmOevGkqaQxHQ+QkxsT+XfKO
 HwnTRfUeWELkQFMQ4ZsVEXys8/bfcroq7m+Pwg6MWt9ikRT9hm8Qy2jL0nJyNl0knhOY
 KgtGexxi9EGWso9K+dSBg0ooOzly8/shtu7tvl33qRWciJcL4P95Cbr4QdjUDKaO8uam
 A+FA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IX9SSLGN
Subject: Re: [Buildroot] [v2 2/3] fs/erofs: add config options for dedupe,
 fragments and ztailpacking
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

CgpPbiAxNC8wMi8yMDI1IDEyOjIxLCBKYW4gxIxlcm3DoWsgd3JvdGU6Cj4gQWRkIEtjb25maWcg
dG9nZ2xlcyBmb3IgYSBmZXcgbW9yZSBleHRlbmRlZCBvcHRpb25zIHRoYXQgYXJlIHVzZWZ1bCBm
b3IKPiByZWR1Y2luZyBzaXplIGFuZCBpbXByb3ZpbmcgcGVyZm9ybWFuY2Ugb2YgRVJPRlMgaW1h
Z2VzLiBEZXNjcmlwdGlvbnMgb2YgdGhlCj4gY29uZmlnIG9wdGlvbnMgd2VyZSB0YWtlbiBmcm9t
IHRoZSBlcm9mcy11dGlscyBtYW5wYWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiDEjGVybcOh
ayA8c2Fpcm9uQHNhaXJvbi5jej4KPiAtLS0KPiAgIGZzL2Vyb2ZzL0NvbmZpZy5pbiB8IDI4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIGZzL2Vyb2ZzL2Vyb2ZzLm1rICB8IDE2ICsr
KysrKysrKysrKysrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9mcy9lcm9mcy9Db25maWcuaW4gYi9mcy9lcm9mcy9Db25maWcuaW4KPiBp
bmRleCAyMDQxYTAwMzRlLi5mZWM4ZWZhMTVlIDEwMDY0NAo+IC0tLSBhL2ZzL2Vyb2ZzL0NvbmZp
Zy5pbgo+ICsrKyBiL2ZzL2Vyb2ZzL0NvbmZpZy5pbgo+IEBAIC01OCw2ICs1OCwzNCBAQCBjb25m
aWcgQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFpNQV9MRVZFTAo+ICAgCj4gICBlbmRpZiAjIEJS
Ml9UQVJHRVRfUk9PVEZTX0VST0ZTX0xaTUEKPiAgIAo+ICtjb25maWcgQlIyX1RBUkdFVF9ST09U
RlNfRVJPRlNfREVEVVBFCj4gKwlib29sICJlbmFibGUgZGF0YSBkZWR1cGxpY2F0aW9uIgo+ICsJ
ZGVwZW5kcyBvbiAhQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTk9ORQo+ICsJaGVscAo+ICsJIEVu
YWJsZSBnbG9iYWwgY29tcHJlc3NlZCBkYXRhIGRlZHVwbGljYXRpb24gdG8gcmVkdWNlIEZTIGlt
YWdlCj4gKwkgc2l6ZS4gSW50cm9kdWNlZCBpbiBMaW51eCA2LjEuCgogIEluZGVudGF0aW9uIHdh
cyB3cm9uZyBoZXJlICh0d28gc3BhY2VzOyBzZWUgY2hlY2stcGFja2FnZSkuCgo+ICsKPiArY29u
ZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0ZSQUdNRU5UUwo+ICsJYm9vbCAiZW5hYmxlIGZy
YWdtZW50cyBwYWNraW5nIgo+ICsJaGVscAo+ICsJICBQYWNrIHRoZSB0YWlsIHBhcnQgKHBjbHVz
dGVyKSBvZiBjb21wcmVzc2VkIGZpbGVzLCBvciBlbnRpcmUKPiArCSAgZmlsZXMsIGludG8gYSBz
cGVjaWFsIGlub2RlIGZvciBzbWFsbGVyIGltYWdlIHNpemUuCj4gKwkgIEludHJvZHVjZWQgaW4g
TGludXggNi4xLgo+ICsKPiArY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0FMTF9GUkFH
TUVOVFMKPiArCWJvb2wgImVuYWJsZSBmcmFnbWVudHMgcGFja2luZyIKPiArCWhlbHAKPiArCSAg
Rm9yY2VseSByZWNvcmQgdGhlIHdob2xlIGZpbGVzIGludG8gYSBzcGVjaWFsIGlub2RlIGZvcgo+
ICsJICBiZXR0ZXIgY29tcHJlc3Npb24uIGZpbGVzLCBpbnRvIGEgc3BlY2lhbCBpbm9kZSBmb3Ig
c21hbGxlcgo+ICsJICBpbWFnZSBzaXplLiBJbnRyb2R1Y2VkIGluIExpbnV4IDYuMS4KCiAgU29t
ZXRoaW5nIHdlbnQgd3Jvbmcgd2l0aCB0aGUgaGVscCB0ZXh0IGhlcmUuCgogIEkgZml4ZWQgdGhv
c2UgdHdvIGFuZCBhcHBsaWVkIHRoZSBzZXJpZXMgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2Fy
ZHMsCiAgQXJub3V0Cgo+ICsKPiArY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX1pUQUlM
UEFDS0lORwo+ICsJYm9vbCAiZW5hYmxlIHp0YWlscGFja2luZyIKPiArCWhlbHAKPiArCSAgUGFj
ayB0aGUgdGFpbCBwYXJ0IChwY2x1c3Rlcikgb2YgY29tcHJlc3NlZCBmaWxlcyBpbnRvIGl0cwo+
ICsJICBtZXRhZGF0YSB0byBzYXZlIG1vcmUgc3BhY2UgYW5kIHRoZSB0YWlsIHBhcnQgSS9PLiBJ
bnRyb2R1Y2VkCj4gKwkgIGluIExpbnV4IDUuMTcuCj4gKwo+ICAgY29uZmlnIEJSMl9UQVJHRVRf
Uk9PVEZTX0VST0ZTX1BDTFVTVEVSU0laRQo+ICAgCWludCAicGNsdXN0ZXIgc2l6ZSIKPiAgIAlk
ZWZhdWx0IDAKPiBkaWZmIC0tZ2l0IGEvZnMvZXJvZnMvZXJvZnMubWsgYi9mcy9lcm9mcy9lcm9m
cy5tawo+IGluZGV4IGU4ZDMwYmFjZTguLjNiNjRjYjFjNmUgMTAwNjQ0Cj4gLS0tIGEvZnMvZXJv
ZnMvZXJvZnMubWsKPiArKysgYi9mcy9lcm9mcy9lcm9mcy5tawo+IEBAIC0yMiw2ICsyMiwyMiBA
QCBpZm5lcSAoJChCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19QQ0xVU1RFUlNJWkUpLDApCj4gICBS
T09URlNfRVJPRlNfQVJHUyArPSAtQyQoc3RyaXAgJChCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19Q
Q0xVU1RFUlNJWkUpKQo+ICAgZW5kaWYKPiAgIAo+ICtpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZT
X0VST0ZTX0RFRFVQRSkseSkKPiArUk9PVEZTX0VST0ZTX0FSR1MgKz0gLUVkZWR1cGUKPiArZW5k
aWYKPiArCj4gK2lmZXEgKCQoQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfRlJBR01FTlRTKSx5KQo+
ICtST09URlNfRVJPRlNfQVJHUyArPSAtRWZyYWdtZW50cwo+ICtlbmRpZgo+ICsKPiAraWZlcSAo
JChCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19BTExfRlJBR01FTlRTKSx5KQo+ICtST09URlNfRVJP
RlNfQVJHUyArPSAtRWFsbC1mcmFnbWVudHMKPiArZW5kaWYKPiArCj4gK2lmZXEgKCQoQlIyX1RB
UkdFVF9ST09URlNfRVJPRlNfWlRBSUxQQUNLSU5HKSx5KQo+ICtST09URlNfRVJPRlNfQVJHUyAr
PSAtRXp0YWlscGFja2luZwo+ICtlbmRpZgo+ICsKPiAgIGRlZmluZSBST09URlNfRVJPRlNfQ01E
Cj4gICAJJChIT1NUX0RJUikvYmluL21rZnMuZXJvZnMgJChST09URlNfRVJPRlNfQVJHUykgJEAg
JChUQVJHRVRfRElSKQo+ICAgZW5kZWYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
