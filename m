Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FC2C87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 09:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 348E340D9A;
	Sun, 10 Aug 2025 09:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71f4OUN-wFW2; Sun, 10 Aug 2025 09:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 592D840D93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 592D840D93;
	Sun, 10 Aug 2025 09:15:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 668F7138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 09:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57DDF810E8
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 09:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qOH1a3UT67f for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 09:15:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.48;
 helo=mail-ed1-f48.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50F18810C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50F18810C8
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50F18810C8
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 09:15:30 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-61580eb7995so7224454a12.0
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 02:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754817328; x=1755422128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o6G17EZYH07gDQJbKs9hMXOLzbZ4TXxrUrlR8hk1oiA=;
 b=CXTNvWutiHnKvp8By/Nu9hxWVx3bT/HKF+ub+jKxzYdt0YFDyM/tMYThi7dAgrkCWC
 A2C4e8vNC/UVaMv7iLAJerDyBJA710NyqQC9RE8MuSIsGRFd9J9C8vvDJp24lPZP7YTm
 ELRvICRDAWAojOS8ZipN0ZwHFmx95StmAM6caOUM1vKGqVGaGGw7OMs9w5BDoeSH/ss+
 OXz/HZuhKW0SChzMgBtjR7IQgVihU7tj+MxeYt5ShS1SGJGx96hAj5ft1JPbgsAbctK+
 rvX3z3Twj3K8DyZZIgMdtwOllZ05fNsYWc2HlMCYWCYTBlE7PsmiK+QxbcAMTCD8tico
 DwcA==
X-Gm-Message-State: AOJu0Ywh0oqJPU3zqpn2BaDWibSisipzJj69d7u4hMyXLEnqZV7ztmj9
 z+TgQnPhGFaXnFj9Vc7Zj7mqu7YQUyWRLCFfW4ttcPD7n71UuTVRxa9c
X-Gm-Gg: ASbGnct1P9hPaExt1pWOmVT2go67d7eiONmjkqgSyw2VnCE4CNlcZBJKKxjjN4oSnqy
 2+M3CLz31jckebGS1fhSNlrTY7eW5gLw2T39Jplk/KRwTwWP3T4eLBwqbD2fGXlVOOkAN2UZShU
 YzwNAxNYJHfk507WTab1uzY9eL1Ft0IcPYrs86KwWQ2mYZ/KlXnubG6lZzCik0kRMEVcpKkIQxH
 p9Yve91eLVp16RTmjFz3V3nr7HhXGpLD0lOg/6x9F5ymkpC1Fxj45J2UcYJkEc5W10FSax8hQWF
 H7LPP44A+EGYxUeyWtKMHCJs1Xlyj2Dhjnr1Zd4rtMF1/JGkFNLbeiN56UfsZpWajNdFZBvGtLv
 H447qMdKA5nfDtjUdmq5+zsF3xul0YBnMCssqOdSwTxbohAIjq60lJRcoSnbSKLY=
X-Google-Smtp-Source: AGHT+IG7a/oiXYB17b89M8SpPM0/WiktbtH6cOtKzoHCN146Oym4CPjD92Hp3Iwtu43k8CQFMRxMgQ==
X-Received: by 2002:a17:907:3ccb:b0:af1:69e3:c074 with SMTP id
 a640c23a62f3a-af9a3c9c1ddmr1382725866b.8.1754817327997; 
 Sun, 10 Aug 2025 02:15:27 -0700 (PDT)
Received: from tpx1 (ltea-047-064-113-075.pools.arcor-ip.net. [47.64.113.75])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91dfd4b31sm1784811766b.85.2025.08.10.02.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 02:15:27 -0700 (PDT)
Date: Sun, 10 Aug 2025 11:15:25 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Cyril Bur <cyrilbur@gmail.com>
Message-ID: <20250810111525.387a0433@tpx1>
In-Reply-To: <20250805151814.1114414-4-alex.bennee@linaro.org>
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
 <20250805151814.1114414-4-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: Re: [Buildroot] [PATCH v4 3/9] package/kvm-unit-tests: update
 dependencies
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gVHVlLCAgNSBBdWcgMjAyNSAxNjoxODowNSArMDEwMApzY2hyaWViIEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz46Cgo+IFRvIHJ1biB0aGUgdGVzdHMgd2UgbmVlZCBhIHN5
c3RlbSBRRU1VLCB0aW1lb3V0LCBnZXRjb25mIGFuZCBubWFwLW5jYXQKPiBzbyB1cGRhdGUgdGhl
IHNlbGVjdC9kZXBlbmRzIGZvciB0aGVtLiBBcyB3ZSBuZWVkIGF0IGxlYXN0IEdDQyA4IHdlCj4g
Y2FuIGRyb3AgdGhlIHNwZWNpZmljIHJlcXVpcmVtZW50IGZvciBvbGQgeDg2LTY0IHRlc3RzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4K
PiAKPiAtLS0KPiB2Mgo+ICAgLSByZW1vdmUgb2xkIGdjYyBub3RlcyBhcyB3ZSBuZWVkIGF0IGxl
YXN0IDggYW55d2F5Cj4gICAtIHNlbGVjdCBRRU1VIGFuZCBvdGhlciBydW50aW1lIGRlcHMKPiAg
IC0gbWVudGlvbiB0aGUgcnVudGltZSBkZXBzCj4gICAtIGFkZCBzdXBwb3J0IGZvciBnZXRjb25m
IGZyb20gZXh0ZXJuYWwgdG9vbGNoYWluCj4gICAtIHVwZGF0ZSBjb21tZW50IGZhbGxiYWNrCj4g
LS0tCj4gIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluIHwgMjQgKysrKysrKysrKysr
KysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5p
biBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCj4gaW5kZXggNzUzODM2MWRmNC4u
Yjg5ZjAxM2YyYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5p
bgo+ICsrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCj4gQEAgLTE1LDEyICsx
NSwxOSBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUwo+
ICAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTCj4gIAlib29sICJrdm0tdW5p
dC10ZXN0cyIKPiAtCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQVJDSF9T
VVBQT1JUUwo+IC0JIyBvbiBpMzg2IGFuZCB4ODYtNjQsIF9fYnVpbHRpbl9yZWFjaGFibGUgaXMg
dXNlZCwgc28gd2UgbmVlZAo+IC0JIyBnY2MgNC41IGF0IGxlYXN0LiBvbiBpMzg2LCB3ZSB1c2Ug
dGhlIHRhcmdldCBnY2MsIHdoaWxlIG9uCj4gLQkjIHg4Ni02NCB3ZSB1c2UgdGhlIGhvc3QgZ2Nj
IChzZWUgLm1rIGZpbGUgZm9yIGRldGFpbHMpCj4gLQlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5f
R0NDX0FUX0xFQVNUXzRfNSB8fCAhQlIyX2kzODYKPiAgCWRlcGVuZHMgb24gQlIyX0hPU1RBUkNI
ID0gIng4Nl82NCIgfHwgIUJSMl94ODZfNjQKCkkgdGhpbmsgeW91IHNob3VsZCBrZWVwIHRoZSBz
ZWNvbmQgcGFydCBvZiB0aGUgY29tbWVudCAoIm9uIGkzODYsIHdlIHVzZQp0aGUgdGFyZ2V0IGdj
YyAuLi4iKSBzaW5jZSB0aGF0IHdhcyBhYm91dCB0aGUgc2Vjb25kICJkZXBlbmRzIiBsaW5lIGhl
cmUKdGhhdCB5b3UgZGlkIG5vdCByZW1vdmU/Cgo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9L
Vk1fVU5JVF9URVNUU19BUkNIX1NVUFBPUlRTCj4gKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5f
R0NDX0FUX0xFQVNUXzggIyBxZW11Cj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1FFTVVfQVJD
SF9TVVBQT1JUU19UQVJHRVQKPiArCWRlcGVuZHMgb24gKEJSMl9QQUNLQUdFX0dMSUJDX1VUSUxT
IHx8IFwKPiArCQkgICAgQlIyX1VDTElCQ19JTlNUQUxMX1VUSUxTIHx8IFwKPiArCQkgICAgQlIy
X1RPT0xDSEFJTl9FWFRFUk5BTF9MSUJDX1VUSUxTX0NPUFkpICMgcnVudGltZSBnZXRjb25mCj4g
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1FFTVVfU1lT
VEVNICMgcnVudGltZSBmb3IgcWVtdS1zeXN0ZW0tJEFSQ0gKPiArCXNlbGVjdCBCUjJfUEFDS0FH
RV9DT1JFVVRJTFMgIyBydW50aW1lIGZvciB0aW1lb3V0Cj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
QkFTSCAjIHJ1bnRpbWUKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9OTUFQCj4gKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfTk1BUF9OQ0FUICMgcnVudGltZSBmb3IgbmNhdAo+ICAJc2VsZWN0IEJSMl9IT1NU
QVJDSF9ORUVEU19JQTMyX0NPTVBJTEVSIGlmIEJSMl94ODZfNjQKPiAgCWhlbHAKPiAgCSAga3Zt
LXVuaXQtdGVzdHMgaXMgYSBwcm9qZWN0IGFzIG9sZCBhcyBLVk0uIEFzIGl0cyBuYW1lCj4gQEAg
LTQwLDYgKzQ3LDkgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTCj4gIAo+ICAJ
ICBodHRwOi8vd3d3LmxpbnV4LWt2bS5vcmcvcGFnZS9LVk0tdW5pdC10ZXN0cwo+ICAKPiAtY29t
bWVudCAia3ZtLXVuaXQtdGVzdHMgbmVlZHMgYSB0b29sY2hhaW4gdy8gZ2NjID49IDQuNSIKPiAr
Y29tbWVudCAia3ZtLXVuaXQtdGVzdHMgbmVlZHMgYSB0b29sY2hhaW4gdy8gdXRpbHMgYW5kIGdj
YyA+PSA4Igo+ICAJZGVwZW5kcyBvbiBCUjJfaTM4Ngo+IC0JZGVwZW5kcyBvbiAhQlIyX1RPT0xD
SEFJTl9HQ0NfQVRfTEVBU1RfNF81Cj4gKwlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0dDQ19B
VF9MRUFTVF84Cj4gKwlkZXBlbmRzIG9uICEoQlIyX1BBQ0tBR0VfR0xJQkNfVVRJTFMgfHwgXAo+
ICsJCUJSMl9VQ0xJQkNfSU5TVEFMTF9VVElMUyB8fCBcCj4gKwkJQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTF9MSUJDX1VUSUxTX0NPUFkpCgpTaG91bGQgdGhlIEJSMl9QQUNLQUdFX1FFTVVfQVJDSF9T
VVBQT1JUU19UQVJHRVQgbm93IGJlIGluY2x1ZGVkIGhlcmUsIHRvbz8KCiBUaG9tYXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
