Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9A0C4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 22:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF8E140140;
	Sat,  9 Dec 2023 22:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF8E140140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJ8vKCgIUz3D; Sat,  9 Dec 2023 22:00:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB5D340993;
	Sat,  9 Dec 2023 22:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB5D340993
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A785D1BF263
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 22:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80A5D60F7D
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 22:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80A5D60F7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vYEsnFr87GT4 for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 22:00:18 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2756560F2D
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 22:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2756560F2D
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a1f6433bc1eso404516266b.1
 for <buildroot@buildroot.org>; Sat, 09 Dec 2023 14:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702159216; x=1702764016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iuoG9jEq93ozSiiIEbim3NNx/Hac3PANt+dfbKyqiLI=;
 b=tlUkH+Q0gpBX4yKuYyGU9QT9Y2kglo0EjVC7cgpKHU9rYftv1gxh22IWPYvg4iBvfT
 h6D3CSy9TxPIOURybZiF26E70fdNbgwC8HLhEb3Tt9drV8wdKZuHkXp2VxHnFscz374E
 HABplWx6Q3JTdvIU5sCmLgBDklhePIugiGeWMmVrakIt4HQDdv6E3i2iwmc5qc4DtDPm
 9XQZmRFJq1le/QhO3cbMKc0JZUJBGommsmoGT5oJ55uX/bLpL2f58JdYndtWfesq/EMS
 /+RH45nv3Xk6xGkn4xeTu6YF23B54XcXPaBvFMViiWnfjrG78hpkIp70qWzScTCVL8e1
 1SAg==
X-Gm-Message-State: AOJu0YycjbOkemiVSGJcq82wUM+vDDfJS0IUnby/R04TbpathHkDuQUQ
 TISSCmYKJKF57WWpzv2QZiGm5Se8L32FJn6JpMfLzk9gPEUqGA13x9Q=
X-Google-Smtp-Source: AGHT+IHYeKrQfRu7bWafwWNgAkwFgbGPXlkdijYMDESZM7AmSwWIzDGFsumjvWTIuDFYBlkfqEmTJJ1811IeqoymuVc=
X-Received: by 2002:a17:906:33cc:b0:a1d:b99b:7809 with SMTP id
 w12-20020a17090633cc00b00a1db99b7809mr3109560eja.33.1702159216094; Sat, 09
 Dec 2023 14:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20231209101043.1839458-1-michael@amarulasolutions.com>
 <ZXS2WPiQ2xRVnpKz@landeda>
In-Reply-To: <ZXS2WPiQ2xRVnpKz@landeda>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 9 Dec 2023 23:00:05 +0100
Message-ID: <CAOf5uwkjRX9DTas=T4O2SBL10LZEVcyfuq2HOPSKPr27qX3NJA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702159216; x=1702764016;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iuoG9jEq93ozSiiIEbim3NNx/Hac3PANt+dfbKyqiLI=;
 b=ggkq3aT7DOnZnc3LCaclBEH9zojX7n2kySLVuit5qYZk1Vk2USZtp51APNFb/PgAAd
 Ev+SIVLLuVdpdP8Ajvr/BJLeUQ6KIqBKqCL5hcbrpyACH5zGC6br5/71Aq++u1iYOG6q
 8pzpjrJJo0axjB589vH/X/nTX8qqRK9L8CQwg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ggkq3aT7
Subject: Re: [Buildroot] [PATCH] linux: Add helping kernel gdb functions
 compilation
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubgoKT24gU2F0LCBEZWMgOSwgMjAyMyBhdCA3OjQ34oCvUE0gWWFubiBFLiBNT1JJTiA8
eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gTWljaGFlbCwgQWxsLAo+Cj4gT24g
MjAyMy0xMi0wOSAxMToxMCArMDEwMCwgTWljaGFlbCBUcmltYXJjaGkgc3Bha2UgdGh1c2x5Ogo+
ID4gSW4gb3JkZXIgdG8gdXNlIGFsbCB0aGUgZmVhdHVyZXMgb2YgS0dEQiBpdCdzIG5pY2UgdG8g
aGF2ZQo+ID4gdGhlIHBvc3NpYmlsaXR5IHRvIHNvdXJjZSB0aGUgdm1saW51eC1nZGIucHkgZmls
ZS4gVGhlCj4gPiBnZW5lcmF0aW9uIG9mIHRoaXMgZmlsZSBpdCdzIGEgdGFyZ2V0IG9mIGxpbnV4
IGtlcm5lbC4KPgo+IEl0IGlzIGF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIHdoZW4gdGhlIGtlcm5l
bCBpcyBjb25maWd1cmVkIHdpdGgKPiBDT05GSUdfR0RCX1NDUklQVFMsIHNvIEkgdGhpbmsgdGhl
IGJlc3QgYXBwcm9hY2ggd291bGQgYmUgc29tZXRoaW5nCj4gYWxvbmcgdGhlIGxpbmVzIG9mOgo+
Cj4gICAgIHBhY2thZ2UvZ2RiL2dkYi5tazoKPgo+ICAgICBkZWZpbmUgSE9TVF9HREJfTElOVVhf
Q09ORklHX0ZJWFVQUwo+ICAgICAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdf
R0RCX1NDUklQVFMpCj4gICAgIGVuZGVmCj4KPiBTZWU6Cj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL01h
a2VmaWxlI24xNzQ4Cj4gYW5kOgo+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9NYWtlZmlsZSNuMTc1Mgo+
CgpJIGhhdmUgZG9uZSB0aGUgY2hhbmdlLCB0aGUgc3VnZ2VzdGlvbiB3YXMgcmVhbGx5IGdvb2Qu
IEkgcmUtc3VibWl0LAphZGQgeW91ciBjb250cmlidXRpb24Kb24gdGhlIGNvbW1pdCBtZXNzYWdl
LCBpbmNsdWRpbmcgc3VnZ2VzdGVkIGJ5IGFuZCByZXNlbnQgdjIKCk1pY2hhZWwKCj4gUmVnYXJk
cywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gPiBBZGQgaXQKPiA+IGluIG9yZGVyIHRvIHVzZSBnZGIg
b2Ygdm1saW51eCBpbiBvdXRwdXQgZGlyZWN0b3J5IGluY2x1ZGluZwo+ID4gdHgtKiBsaW51eCBz
Y3JpcHQKPiA+Cj4gPiBnZGItbXVsdGlhcmNoIC0tdHVpIG91dHB1dC9idWlsZC88bGludXggZGly
Pi92bWxpbnV4Cj4gPiBhZGQtYXV0by1sb2FkLXNhZmUtcGF0aCBvdXRwdXQvYnVpbGQvPGxpbnV4
IGRpcj4KPiA+IHNvdXJjZSBvdXRwdXQvYnVpbGQvPGxpbnV4IGRpcj4vdm1saW51eC1nZGIucHkK
PiA+Cj4gPiBMaW51eCBuZWVkcyB0byBiZSBjb21waWxlZCB3aXRoIERFQlVHX0lORk8gKHdpdGhv
dXQgcmVzdHJpY3QKPiA+IERFQlVHX0lORk8pIGFuZCBrZXJuZWwgY21kbGluZSBzaG91bGQgYmUg
bW9kaWZpZWQgdG8gd2FpdAo+ID4gb2Yga2dkYiBpZiBuZWVkZWQuIEFzIGV4YW1wbGUKPiA+Cj4g
PiBrZ2Rib2NfZWFybHljb249bnMxNjU1MGEga2dkYm9jPS9kZXYvdHR5UzIga2dkYndhaXQgbm9r
YXNscgo+ID4KPiA+IFRoZSB0ZXN0IHdhcyBkb25lIG9uIGFtNjJ4IGJvYXJkIG92ZXIgc2VyaWFs
IGxpbmUuIEluIG9yZGVyCj4gPiB0byBoYXZlIGl0IHJ1bm5pbmcgcHJvcGVybHkgd2UgbmVlZCB0
byBjb21waWxlIHRoZSBhZ2VudC1wcm94eQo+ID4KPiA+IC4vb3V0cHV0L2hvc3QvYmluL2FnZW50
LXByb3h5IDQ0NDAgNDQ0MSAwIC9kZXYvdHR5VVNCMCAxMTUyMDAKPiA+Cj4gPiBnZGIgY2FuIG5v
dyBoYXZpbmcgdGhlIGRlYnVnZ2luZyB1YXJ0IGF2YWlsYWJsZSB1c2luZzoKPiA+Cj4gPiB0YXJn
ZXQgcmVtb3RlIGxvY2FsaG9zdDo0NDQxCj4gPgo+ID4gdGhlIDQ0NDAgaXMgdXNlZCBieSB0aGUg
Y29uc29sZSBhbmQgNDQ0MSBpcyB1c2VkIHRvIGRlYnVnCj4gPgo+ID4gVGVzdGVkLWJ5OiBNaWNo
YWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+
ID4gLS0tCj4gPiAgbGludXgvQ29uZmlnLmluIHwgNyArKysrKysrCj4gPiAgbGludXgvbGludXgu
bWsgIHwgNyArKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2xpbnV4L0NvbmZpZy5pbiBiL2xpbnV4L0NvbmZpZy5pbgo+ID4g
aW5kZXggYWU3MzRjNDlhMC4uNzFhYjI3YmJjYiAxMDA2NDQKPiA+IC0tLSBhL2xpbnV4L0NvbmZp
Zy5pbgo+ID4gKysrIGIvbGludXgvQ29uZmlnLmluCj4gPiBAQCAtNDg2LDYgKzQ4NiwxMyBAQCBj
b25maWcgQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX1BBSE9MRQo+ID4gICAgICAgICBzdWNo
IGFzICJCVEY6IC50bXBfdm1saW51eC5idGY6IHBhaG9sZSAocGFob2xlKSBpcyBub3QKPiA+ICAg
ICAgICAgYXZhaWxhYmxlIi4KPiA+Cj4gPiArY29uZmlnIEJSMl9MSU5VWF9LRVJORUxfQUREX0hP
U1RfR0RCX1NDUklQVFMKPiA+ICsgICAgIGJvb2wgIk5lZWQgdG9vbHMgZm9yIGRlYnVnZ2luZyB3
aXRoIGtnZGIiCj4gPiArICAgICBoZWxwCj4gPiArICAgICAgIEFkZCBoZWxwaW5nIHNjcmlwdCB0
byBiZSB1c2VkIHdpdGggZ2RiIGFuZCBrZ2RiIGluIG9yZGVyIHRvCj4gPiArICAgICAgIGRlYnVn
IGxpbnV4IGtlcm5lbC4gVGhvc2UgY29udmluaWVudHMgc2NyaXB0cyBhZGQgc29tZSBmZWF0dXJl
Cj4gPiArICAgICAgIGNvbW1hbmQgdG8gZ2RiIHdpdGggc3BlY2lmaWMgcHl0aG9uIHNjcmlwdAo+
ID4gKwo+ID4gICMgTGludXggZXh0ZW5zaW9ucwo+ID4gIHNvdXJjZSAibGludXgvQ29uZmlnLmV4
dC5pbiIKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbGludXgvbGludXgubWsgYi9saW51eC9saW51eC5t
awo+ID4gaW5kZXggMWRiNWM2MDQ2ZC4uZThjZGIyNjc5MyAxMDA2NDQKPiA+IC0tLSBhL2xpbnV4
L2xpbnV4Lm1rCj4gPiArKysgYi9saW51eC9saW51eC5tawo+ID4gQEAgLTQ4OCw2ICs0ODgsMTIg
QEAgTElOVVhfQVBQRU5EX0RUQiArPSA7IFwKPiA+ICBlbmRpZgo+ID4gIGVuZGlmCj4gPgo+ID4g
K2lmZXEgKCQoQlIyX0xJTlVYX0tFUk5FTF9BRERfSE9TVF9HREJfU0NSSVBUUykseSkKPiA+ICtk
ZWZpbmUgTElOVVhfQlVJTERfR0RCX1NDUklQVFMKPiA+ICsgICAgICQoTElOVVhfTUFLRV9FTlYp
ICQoQlIyX01BS0UpICQoTElOVVhfTUFLRV9GTEFHUykgLUMgJChARCkgc2NyaXB0c19nZGIKPiA+
ICtlbmRlZgo+ID4gK2VuZGlmCj4gPiArCj4gPiAgIyBDb21waWxhdGlvbi4gV2UgbWFrZSBzdXJl
IHRoZSBrZXJuZWwgZ2V0cyByZWJ1aWx0IHdoZW4gdGhlCj4gPiAgIyBjb25maWd1cmF0aW9uIGhh
cyBjaGFuZ2VkLiBXZSBjYWxsIHRoZSAnYWxsJyBhbmQKPiA+ICAjICckKExJTlVYX1RBUkdFVF9O
QU1FKScgdGFyZ2V0cyBzZXBhcmF0ZWx5IGJlY2F1c2UgY2FsbGluZyB0aGVtIGluCj4gPiBAQCAt
NTAzLDYgKzUwOSw3IEBAIGRlZmluZSBMSU5VWF9CVUlMRF9DTURTCj4gPiAgICAgICAkKExJTlVY
X01BS0VfRU5WKSAkKEJSMl9NQUtFKSAkKExJTlVYX01BS0VfRkxBR1MpIC1DICQoQEQpIGFsbAo+
ID4gICAgICAgJChMSU5VWF9NQUtFX0VOVikgJChCUjJfTUFLRSkgJChMSU5VWF9NQUtFX0ZMQUdT
KSAtQyAkKEBEKSAkKExJTlVYX1RBUkdFVF9OQU1FKQo+ID4gICAgICAgJChMSU5VWF9CVUlMRF9E
VEIpCj4gPiArICAgICAkKExJTlVYX0JVSUxEX0dEQl9TQ1JJUFRTKQo+ID4gICAgICAgJChMSU5V
WF9BUFBFTkRfRFRCKQo+ID4gIGVuZGVmCj4gPgo+ID4gLS0KPiA+IDIuNDAuMQo+ID4KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiAtLQo+IC4t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2
NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19f
ICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0t
LTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1v
cmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29u
c3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwoKCgotLSAKTWljaGFlbCBOYXp6
YXJlbm8gVHJpbWFyY2hpCkNvLUZvdW5kZXIgJiBDaGllZiBFeGVjdXRpdmUgT2ZmaWNlcgpNLiAr
MzkgMzQ3IDkxMyAyMTcwCm1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwoKQW1hcnVsYSBTb2x1dGlvbnMgQlYKSm9vcCBHZWVzaW5r
d2VnIDEyNSwgMTExNCBBQiwgQW1zdGVyZGFtLCBOTApULiArMzEgKDApODUgMTExIDkxNzIKaW5m
b0BhbWFydWxhc29sdXRpb25zLmNvbQp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
