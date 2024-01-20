Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102B0C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 08:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94E3660A66;
	Sat, 20 Jan 2024 08:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94E3660A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zx-aJ3sO3Jh8; Sat, 20 Jan 2024 08:02:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB66460C08;
	Sat, 20 Jan 2024 08:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB66460C08
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 972DE1BF33B
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 08:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BD2D60C08
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 08:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BD2D60C08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZ9GcwKFUOZ3 for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 08:01:59 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E144560A66
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 08:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E144560A66
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40ea25c5b14so5891015e9.1
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 00:01:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705737716; x=1706342516;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3rcczcYQsMFW6PCKO+IAOCieFza5WpElTmjtPGhC8gQ=;
 b=B3Fnc8e9dC4sM8y+d9ONzVqxJGDZmso8AvDwe4fDGs57rHhsZJJF6E3Rn+R3LjvXCM
 feZVD+57V/W7XA8/S38kTzqDesIXEmB+6uBKNgQyYP3lUO/A7xBtIVzxF9dzHDoi/k3Z
 o0x8/pE0VIVrWOsw+axOHiPR1Ci0sCY5dkLsB3gzE1VXA1JwrpovYUmE0FLxTmGtSA5r
 /6eIfAzPimMiCJ30ZPAIoW8/EyWhIpINht/+mMHA/uz4fBAkf5GUFMVtSj9kcxoOk79a
 LJvpV3QyD8PoDTxs+H0bko9pZ5Ab6Fhw3D7rYdq76EvobisfwI5H1sWzaOvMc0l5xCLo
 C/hg==
X-Gm-Message-State: AOJu0Yxp6zmOYejZ2nx+Jbvd8bLlwVwpEiKtoThCFfoqkXJ3vnWeDoaw
 9UUltR8l9s16b93OvG9tp0l2ouDX1QkQ7iOKkw4pFiUi9a4QMHpftK43VXTBzH3ysQUpsl9RTAH
 s
X-Google-Smtp-Source: AGHT+IEZYpcYWG3YYlpReEtJ7uADKS0JuHG4nUOq28y+1laNLrYDaFw4k2IqzgOPNTdzPV8M0hvAmg==
X-Received: by 2002:a1c:4b02:0:b0:40e:52d3:4eb9 with SMTP id
 y2-20020a1c4b02000000b0040e52d34eb9mr561172wma.76.1705737716481; 
 Sat, 20 Jan 2024 00:01:56 -0800 (PST)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 l39-20020a05600c1d2700b0040e50d82af5sm31637230wms.32.2024.01.20.00.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Jan 2024 00:01:56 -0800 (PST)
Mime-Version: 1.0
Date: Sat, 20 Jan 2024 09:01:55 +0100
Message-Id: <CYJDK0VJP7DC.3TY6V25XFO40U@rtone.fr>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>
To: "Adam Duskett" <adam.duskett@amarulasolutions.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
X-Mailer: aerc 0.15.2
References: <20231211155951.4079886-1-gael.portay@rtone.fr>
 <20231211155951.4079886-3-gael.portay@rtone.fr> <ZardHEVqvVLucJQM@landeda>
 <CAHDQB6NrRc3YPpTvRUw52FVZjY28=RaNWEmEXt2YVKvB6ZwtyA@mail.gmail.com>
In-Reply-To: <CAHDQB6NrRc3YPpTvRUw52FVZjY28=RaNWEmEXt2YVKvB6ZwtyA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1705737716; x=1706342516; darn=buildroot.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3rcczcYQsMFW6PCKO+IAOCieFza5WpElTmjtPGhC8gQ=;
 b=Nz8lvcYSMI++NhRtHHW1JIAIDRqJawrNz/TnsS50nU1nvvWr37MK7I/2DjZ+36XstM
 Ce/OVoQRHKlAjhKZlLSYZegzvOF44R3/MxMIdeSkheW7zQ6ryLwbB2/jw86yr7zEx7T2
 3QZWWvuRmGbaTR2OzppGhVJE//X3vmA9MM+bo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=Nz8lvcYS
Subject: Re: [Buildroot] [PATCH v2 2/2] configs: add raspberrypi 5 defconfig
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
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgQWRhbSwKCk9uIFNhdCBKYW4gMjAsIDIwMjQgYXQgNDoxMSBBTSBDRVQsIEFkYW0gRHVz
a2V0dCB3cm90ZToKPiBIZWxsbzsKPgo+Cj4gT24gRnJpLCBKYW4gMTksIDIwMjQgYXQgMTozNuKA
r1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+Cj4g
PiBHYcOrbCwgQWxsLAo+ID4KPiA+IE9uIDIwMjMtMTItMTEgMTY6NTkgKzAxMDAsIEdhw6tsIFBP
UlRBWSBzcGFrZSB0aHVzbHk6Cj4gPiA+IFRoaXMgY29uZmlndXJhdGlvbiBidWlsZHMgYW4gaW1h
Z2UgZm9yIHRoZSBSYXNwYmVycnlQaSA1Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHYcOr
bCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgo+ID4gWy0tU05JUC0tXQo+ID4gPiAtLS0g
L2Rldi9udWxsCj4gPiA+ICsrKyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZwo+ID4g
PiBAQCAtMCwwICsxLDQwIEBACj4gPiA+ICtCUjJfYWFyY2g2ND15Cj4gPiA+ICtCUjJfY29ydGV4
X2E3Nl9hNTU9eQo+ID4gPiArQlIyX0FSTV9GUFVfVkZQVjQ9eQo+ID4gPiArQlIyX0FSTTY0X1BB
R0VfU0laRV8xNks9eQo+ID4KPiA+IFNvLCB3ZSBjaG9vc2UgMTZLIGZvciB0aGUgdXNlcmxhbmQg
cGFnZSBhbGlnbm1lbnQsIGJlY2F1c2UuLi4KPiA+Cj4gPiBbLS1TTklQLS1dCj4gPiA+ICtCUjJf
TElOVVhfS0VSTkVMPXkKPiA+ID4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTEw9eQo+
ID4gPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTF9MT0NBVElPTj0iJChjYWxsIGdp
dGh1YixyYXNwYmVycnlwaSxsaW51eCwxN2YxMzViNzQyYzRlZGIzNDBhZmIzNjU4NzNjM2E1NzRm
N2UxNmNiKS9saW51eC0xN2YxMzViNzQyYzRlZGIzNDBhZmIzNjU4NzNjM2E1NzRmN2UxNmNiLnRh
ci5neiIKPiA+ID4gK0JSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJiY20yNzEyIgo+ID4KPiA+
IC4uLiB0aGUgYmNtMjcxMl9kZWZjb25maWcgaW4gdGhlIGtlcm5lbCB0cmVlIGRlZmF1bHQgdG8g
dXNlIDE2SyBwYWdlczoKPiA+ICAgICBDT05GSUdfQVJNNjRfMTZLX1BBR0VTPXkKPiA+CgouLi4g
YW5kIGJlY2F1c2UgQkNNMjcxMiBzdXBwb3J0IDE2ay4gT3RoZXJ3aXNlIEkgd291bGQgaGF2ZSBj
aG9zZW4gdGhlCmJjbTI3MTFfZGVmY29uZmlnIHRoYXQgaXMgNEsuCgo+ID4gVGhpcyBpcyBhbGwg
YSBsaXR0bGUgYml0IG11cmt5IGZvciBtZSwgYnV0IHRoZSBrZXJuZWwgaGVscCBmb3IKPiA+IENP
TkZJR19BUk02NF8xNktfUEFHRVMgc3RhdGVzOgo+ID4KPiA+ICAgVGhlIHN5c3RlbSB3aWxsIHVz
ZSAxNktCIHBhZ2VzIHN1cHBvcnQuIEFBcmNoMzIgZW11bGF0aW9uCj4gPiAgIHJlcXVpcmVzIGFw
cGxpY2F0aW9ucyBjb21waWxlZCB3aXRoIDE2SyAob3IgYSBtdWx0aXBsZSBvZiAxNkspCj4gPiAg
IGFsaWduZWQgc2VnbWVudHMuCj4gPgo+ID4gQnV0IHdlIGFyZSBub3QgZG9pbmcgMzItb24tNjQg
aW4gQnVpbGRyb290LCB3ZSdyZSBvbmx5IGRvaW5nIHB1cmUKPiA+IDY0LWJpdC4KPiA+CgpJbmRl
ZWQuCgo+ID4gSWYgSSBpbnRlcnByZXQgdGhlIGtlcm5lbCBoZWxwIHRleHQgY29ycmVjdGx5LCBh
YXJjaDY0IHVzZXJsYW5kIGlzIG5vdAo+ID4gaW1wYWN0ZWQgYnkgdGhlIHBhZ2Ugc2l6ZSB0aGUg
a2VybmVsIHVzZXMsIHNvIHdlIGNhbiBzdGlsbCB1c2UgNEsgcGFnZXMKPiA+IGluIHVzZXJsYW5k
Lgo+ID4KPiA+IE9yIGRvIHdlIGp1c3Qgd2FudCB0byBhdm9pZCBhbnkgY29uZnVzaW9uIGF0IGFs
bCwgYW5kIGFsd2F5cyBjb25zaWRlcgo+ID4gdGhhdCB0aGUgdXNlcmxhbmQgYW5kIGtlcm5lbCBw
YWdlIHNpemUgbXVzdCBtYXRjaD8gT3IgZGlkIEkganVzdAo+ID4gbWlzaW50ZXJwcmV0IHRoZSBr
ZXJuZWwgaGVscCB0ZXh0LCBhbmQgdGhlIHR3byAqbXVzdCogbWF0Y2g/Cj4gPgo+ID4gSWYgSSBt
aXNzZWQgc29tZXRoaW5nIG9yIGFtIHdyb25nIHNvbWV3aGVyZSwganVzdCB5ZWxsISA7LSkKPiA+
Cj4gPiBSZWdhcmRzLAo+ID4gWWFubiBFLiBNT1JJTi4KPiA+CgpJSVJDLCBJIGhhdmUgYnVpbHQg
d2l0aDoKCi0gdGhlIChpbnRlcm5hbCkgYnVpbGRyb290IHRvb2xjaGFpbiBhbmQgaXQgd29ya3Mg
KDE2ayBpbmRlZWQpLgotIHRoZSBleHRlcm5hbCBCb290bGluIHRvb2xjaGFpbiBhbmQgaXQgZmFp
bHMgdG8gcnVuIGluaXQgKDRrIGFjY29yZGluZwogIHRvIFRob21hcykuCi0gdGhlIGV4dGVybmFs
IEFybSBBQXJjaDY0IHRvb2xjaGFpbiBhbmQgaXQgd29ya3MgKDE2ayBJIGd1ZXNzID8/PykuCgpB
bmQgdGh1cywgSSBzdXNwZWN0IGJvdGggdXNlcmxhbmQgYW5kIGtlcm5lbCBwYWdlIHNpemUgbXVz
dCBtYXRjaC4KCj4KPiBZZXMsIHlvdSBhcmUgY29ycmVjdC4gSSBjcmVhdGVkIGJvYXJkL3Jhc3Bi
ZXJyeXBpL3JwaTUtbGludXguZnJhZ21lbnQgd2l0aCB0aGUKPiBmb2xsb3dpbmcgbGluZToKPiBD
T05GSUdfQVJNNjRfNEtfUEFHRVM9eQo+Cj4gSSBidWlsdCB0aGlzIGNvbmZpZyB1c2luZyBhIEJv
b3RsaW4gdG9vbGNoYWluLCBhbmQgZXZlcnl0aGluZyB3b3JrcyBwcm9wZXJseQo+IG9uIG15IHBl
cnNvbmFsIFJQSTUhCj4KPiBBZGFtCgpUaGFua3MgZm9yIHRoaXMgdGVzdC4KCi0tLQoKU28sIGlm
IHRoZSBhc3NvbXB0aW9uIGlzIHJpZ2h0IChpLmUuIHVzZXJsYW5kIGFuZCBrZXJuZWwgcGFnZSBz
aXplcyBtdXN0Cm1hdGNoKSwgSSBndWVzcyBpdCB3b3VsZCBiZSBpbnRlcmVzdGluZyB0byBmaWx0
ZXItaW4gKG9yIHRvIGZpbHRlci1vdXQpCnRoZSBleHRlcm5hbCB0b29sY2hhaW5zIHRoYXQgbWF0
Y2ggdGhlIGNvbmZpZyBiZWNhdXNlIGJ1aWxkcm9vdCBwcm9tcHRzCmZvciBhbGwgdGhlIGV4dGVy
bmFsIHRvb2xjaGFpbjsgYnV0IHNvbWUgb2YgdGhlbSBmYWlsIGF0IHJ1bnRpbWUgYmVjYXVzZQpv
ZiBhIG1pc21hdGNoIHBhZ2Utc2l6ZS4KCldoYXQgYWJvdXQgaW50cm9kdWNpbmcgQlIyX1RPT0xD
SEFJTl9IQVNfUEFHRV9TSVpFX3s0LDE2LDY0fUs/CgpPciwgSSBhbSB0b3RhbGx5IHdyb25nIDov
CgpSZWdhcmRzLApHYcOrbAoKUFM6IEFsc28sIEJSIGNvdWxkIGhhdmUgdHdvIGNvbmZpZ3MgZm9y
IHBpNToKIC0gcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZzogNGsKICAgQlIyX0xJTlVYX0tFUk5FTF9E
RUZDT05GSUc9ImJjbTI3MTEiCiAgICMgQlIyX0FSTTY0X1BBR0VfU0laRV80Sz15CiAtIHJhc3Bi
ZXJyeXBpNS0xNmtfZGVmY29uZmlnOiAxNmsKICAgQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9
ImJjbTI3MTIiCiAgIEJSMl9BUk02NF9QQUdFX1NJWkVfMTZLPXkKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
