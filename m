Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2C4C87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 09:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF1460EF9;
	Sun, 10 Aug 2025 09:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hx93xr74cWnc; Sun, 10 Aug 2025 09:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F83060EF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F83060EF3;
	Sun, 10 Aug 2025 09:16:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CB9D138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 09:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42E074080F
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 09:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X94-oJ8-lrHZ for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 09:16:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.41;
 helo=mail-ej1-f41.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BBEEF400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBEEF400B5
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBEEF400B5
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 09:16:43 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-af96fba3b37so646918366b.3
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 02:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754817402; x=1755422202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i6qiG3hw2Ey8SW4CYOHUwmzIzVrvOzAvb6DDd0GmNDI=;
 b=BF0LWKEaLskdQhZuo4Ha/Oq0HIm34lcXp4HS7MACn8cUqUrqmYkaiQ6agYQhF7V70x
 jzZZDOq68lUqJLy1yMak1CSg9nQc+6QP16C82qZKD/dPiZJsEyjeY6zxNsGw6XAOdtyv
 EwHY6StSsRGltfUkww6pUd38hxtXzPnBzAZHl5CO6z2CUPF2gGg2BbyvAUjRT0JjuA5V
 JqCD9M+Pk9Caltj/x9MGazUlM982xdZHE3kxLVItM4KbPG79DGKSpNuYBM7NuqKDzz0z
 v/TheUj6AP6BfOt2keuVmxPPjnKy5HKJik1OrmwvEGUTlUmW9j792gJdk0aZC86Imfs1
 TXTQ==
X-Gm-Message-State: AOJu0YyDQcgKkKiECi3zVhNLLuy56r6K8j/z+vRKgTHpMJwJFxUwTFAa
 o1xm7e6R39MysACQpoQeaefCgLXKjP/T/P5Cxw4+vdOJEbTeRci//PAL
X-Gm-Gg: ASbGncssLfUAvh0CunDdOAhK4oduRP/bIoeY46+EMrx6xMh2RCWhFWIHHl1I5l2XM1x
 7SKxxpljdiFgp/GGpziv8ldKgI2lAI/+X8vmdxhDedQarEsJ8cF3zRzdJmgg8hCAErVIP3qCHVb
 yzr3kWbgVerf2cFThH/iXHnc6B5MZv3kQk1ZBDg4CgVFHAWUF9O/1D84Z2Y27ECYDgNtmSdWE97
 v7GOaSEYXyBOzQMW9D0lK0Ayg58z63napliH5w8qBoZ4GFDNDy6J3883UL0AfauCn4Cc8z0Vxsu
 OpqSYjks+eaI7ypSSqC/6o90Qjr0IIkz+xfIA2gBC+EDWIZxQTKqz/R32uc5j+nw/7h8QIxkXxh
 Q5Ly5+YrARA7TGbauSBLy2da+9arPOZBkgYz4+zQzRLVUUu0p3Q8w
X-Google-Smtp-Source: AGHT+IH5QAxmdrjlKR/j4HATOe1w92GvPmvOFaahg16UaBDMZe409Pp1NDj5LiR6O0lOffYufEgzig==
X-Received: by 2002:a17:907:86a6:b0:af9:1122:6af0 with SMTP id
 a640c23a62f3a-af9c647ef7bmr905461866b.30.1754817401374; 
 Sun, 10 Aug 2025 02:16:41 -0700 (PDT)
Received: from tpx1 (ltea-047-064-113-075.pools.arcor-ip.net. [47.64.113.75])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0df10asm1812451266b.59.2025.08.10.02.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 02:16:41 -0700 (PDT)
Date: Sun, 10 Aug 2025 11:16:39 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Cyril Bur <cyrilbur@gmail.com>
Message-ID: <20250810111639.4e36b8e7@tpx1>
In-Reply-To: <20250805151814.1114414-10-alex.bennee@linaro.org>
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
 <20250805151814.1114414-10-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: Re: [Buildroot] [PATCH v4 9/9] package/kvm-unit-tests: allow
 kvmtool to be used
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

QW0gVHVlLCAgNSBBdWcgMjAyNSAxNjoxODoxMSArMDEwMApzY2hyaWViIEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz46Cgo+IEZvciBzb21lIHRhcmdldHMgbGF1bmNoaW5nIHRl
c3RzIHdpdGgga3ZtdG9vbCBpcyBhbiBvcHRpb24gd2hpY2ggbWFrZXMKPiBmb3IgYW4gZXZlbiBz
bWFsbGVyIHRlc3QgaW1hZ2UuIENyZWF0ZSBhIG5ldyBzeW1ib2wgd2hpY2ggY2FuIGJlCj4gZXhw
YW5kZWQgd2l0aCBhZGRpdGlvbmFsIHRhcmdldHMgdGhhdCB3aWxsIGFsbG93IHRoZSBza2lwcGlu
ZyBvZiB0aGUKPiBzZWxlY3Rpb24gb2YgUUVNVSBpZiBub3QgbmVlZGVkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPiAtLS0KPiAgcGFj
a2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gICAgICAgICB8IDkgKysrKysrKy0tCj4gIHBh
Y2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsgfCA3ICsrKysrKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiBiL3BhY2thZ2Uva3ZtLXVu
aXQtdGVzdHMvQ29uZmlnLmluCj4gaW5kZXggYjg5ZjAxM2YyYS4uODBlYmM1MDBjNiAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2Uv
a3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCj4gQEAgLTEzLDYgKzEzLDExIEBAIGNvbmZpZyBCUjJf
UEFDS0FHRV9LVk1fVU5JVF9URVNUU19BUkNIX1NVUFBPUlRTCj4gIAlkZWZhdWx0IHkgaWYgQlIy
X3Bvd2VycGM2NCB8fCBCUjJfcG93ZXJwYzY0bGUKPiAgCWRlZmF1bHQgeSBpZiBCUjJfczM5MHgK
PiAgCj4gKyMgU29tZSBhcmNoaXRlY3R1cmVzIGNhbiB1c2Uga3ZtdG9vbCBpbnN0ZWFkIG9mIFFF
TVUgdG8gbGF1bmNoIHRoZSB0ZXN0cwo+ICtjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVT
VFNfQ0FOX1VTRV9LVk1UT09MCj4gKwlib29sCj4gKwlkZWZhdWx0IHkgaWYgQlIyX2FhcmNoNjQg
JiYgQlIyX1BBQ0tBR0VfS1ZNVE9PTAo+ICsKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0tWTV9VTklU
X1RFU1RTCj4gIAlib29sICJrdm0tdW5pdC10ZXN0cyIKPiAgCWRlcGVuZHMgb24gQlIyX0hPU1RB
UkNIID0gIng4Nl82NCIgfHwgIUJSMl94ODZfNjQKPiBAQCAtMjIsOCArMjcsOCBAQCBjb25maWcg
QlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFMKPiAgCWRlcGVuZHMgb24gKEJSMl9QQUNLQUdFX0dM
SUJDX1VUSUxTIHx8IFwKPiAgCQkgICAgQlIyX1VDTElCQ19JTlNUQUxMX1VUSUxTIHx8IFwKPiAg
CQkgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9MSUJDX1VUSUxTX0NPUFkpICMgcnVudGltZSBn
ZXRjb25mCj4gLQlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVQo+IC0Jc2VsZWN0IEJSMl9QQUNLQUdF
X1FFTVVfU1lTVEVNICMgcnVudGltZSBmb3IgcWVtdS1zeXN0ZW0tJEFSQ0gKPiArCXNlbGVjdCBC
UjJfUEFDS0FHRV9RRU1VIGlmICFCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUU19DQU5fVVNFX0tW
TVRPT0wKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTSBpZiAhQlIyX1BBQ0tBR0Vf
S1ZNX1VOSVRfVEVTVFNfQ0FOX1VTRV9LVk1UT09MICMgcnVudGltZSBmb3IgcWVtdS1zeXN0ZW0t
JEFSQ0gKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9DT1JFVVRJTFMgIyBydW50aW1lIGZvciB0aW1l
b3V0Cj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfQkFTSCAjIHJ1bnRpbWUKPiAgCXNlbGVjdCBCUjJf
UEFDS0FHRV9OTUFQCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVu
aXQtdGVzdHMubWsgYi9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCj4g
aW5kZXggZWZjM2M4NTlhYS4uY2Y5OTVmZjU0ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2t2bS11
bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCj4gKysrIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0
cy9rdm0tdW5pdC10ZXN0cy5tawo+IEBAIC00MCw2ICs0MCwxMyBAQCBLVk1fVU5JVF9URVNUU19D
T05GX09QVFMgPVwKPiAgCS0tcHJvY2Vzc29yPSIkKEdDQ19UQVJHRVRfQ1BVKSIgXAo+ICAJLS1l
bmRpYW49IiQoS1ZNX1VOSVRfVEVTVFNfRU5ESUFOKSIKPiAgCj4gKyMgVGhlIGRlZmF1bHQgcnVu
bmVyIGlzIFFFTVUgYnV0IGt2bXRvb2wgY2FuIGFsc28gYmUgdXNlZAo+ICtpZmVxICgkKEJSMl9Q
QUNLQUdFX1FFTVVfU1lTVEVNKSx5KQo+ICtLVk1fVU5JVF9URVNUU19DT05GX09QVFMgKz0gLS10
YXJnZXQ9cWVtdQo+ICtlbHNlIGlmZXEgKCQoQlIyX1BBQ0tBR0VfS1ZNVE9PTCkseSkKPiArS1ZN
X1VOSVRfVEVTVFNfQ09ORl9PUFRTICs9IC0tdGFyZ2V0PWt2bXRvb2wKPiArZW5kaWYKPiArCj4g
IGlmZXEgKCQoQlIyX0FSTTY0X1BBR0VfU0laRV80SykseSkKPiAgS1ZNX1VOSVRfVEVTVFNfQ09O
Rl9PUFRTICs9IC0tcGFnZS1zaXplPTRrCj4gIGVsc2UgaWZlcSAoJChCUjJfQVJNNjRfUEFHRV9T
SVpFXzE2SykseSkKClJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8aHV0aEB0dXhmYW1pbHkub3Jn
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
