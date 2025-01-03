Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1251BE77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 22:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0555401F3;
	Fri,  3 Jan 2025 22:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRrO94Vc-GWh; Fri,  3 Jan 2025 22:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F01B4021D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F01B4021D;
	Fri,  3 Jan 2025 22:07:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8F84AF0
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 22:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D69CB60AC5
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 22:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvKIt0FrbIre for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 22:07:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7533C6064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7533C6064B
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7533C6064B
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 22:07:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so5360825e9.1
 for <buildroot@buildroot.org>; Fri, 03 Jan 2025 14:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735942061; x=1736546861;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g7VNAk/v7tQXOtjsGTgjTWUANk7uHtul0nNMy1TxDAg=;
 b=fy9rJlw2kwNel99ZjnpNRb5SQUQfk1ue3a4+ldNktfS8nm/60LTwnOBz3NVriGmvnQ
 XE1adIaODfD9UDgRkERUW24vA0FEx3CRlgPi4FMt8v08p2qk7C9urSXSN3GwY6zl1oVG
 pClG31vhlJQwbY9OW9BfXC/oqWF1PWtjzquZCY08tg6D17QAH9n/gy3reiZz48Igf/7P
 fF5bVZiNtAIzSMYIXaa7KfZvzFWbZ0ZGxyAs5ywQCgn9cJMR/skm9t59+AgwhKK4SBkF
 HJtH0DDRtttK+HhlT4l0rezoXJqfRPmRBK1q+T9rWHL8wAy7cShO3IpTye1ov8fu2NDP
 tdUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6frEE90LAGijgUrtrlxcmJmMwN4bObGDNs2hLjhYIEfSafwSnbxhwhKI6LaS8kBWpdQ+pgYXzrEo=@buildroot.org
X-Gm-Message-State: AOJu0YyJ4j4nlYl6aVaf/ITe+o/NcoA4nWTvyKdmkOmRfJXwFJ0ZsNaR
 eg4Q9SFsMFKYrGmMhwK0cWgcWGIWb56qf0fsGUoeg5kFZNLOehmDXnO7AV5nWOI=
X-Gm-Gg: ASbGncsFaTArnIutL/Wuj4fNXTV0sUJYpdlDqCKksFcvutOdDtZHzkEYE7atRAuyNMv
 q6xt7K0cB7vi0o0MGgOE39s7UWRuYk+ZDr5kN75CkJEaalGFAfCDoGUqz7+UeAsUEim0vF3Sle2
 zrZZKcFaLmPNmfPJeDeskABQKpFj1sEBoe+zSjvvTZNSHWAHFyC+US39u7lGUJj3zMm7DitKH6D
 xLe55Wbnca0d9OYLcfpUENHI7ZZ1JQT34UNmYq0lKXJogzb0FlY0SzF4FkhGkKBoqBYTBFJjEOw
 HEaXVkq2u/Cmd8lzjUZP0Ed6tidMFXCMkQFi/RKhgrZvI8B1bcmlFjp2usIL3rulzcMCM/HeC9E
 IwPtibkyBGWg/xevs
X-Google-Smtp-Source: AGHT+IHGBDyOMHfXF7VcEeeEIXc6LmuRgiqQ7SzT8s/2y5IEcUBoF5M69+hd4w7BCrWfDADY36W2uw==
X-Received: by 2002:a5d:47cf:0:b0:385:ee59:44eb with SMTP id
 ffacd0b85a97d-38a221fa9ffmr41817696f8f.33.1735942061259; 
 Fri, 03 Jan 2025 14:07:41 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8a6dd3sm41578356f8f.96.2025.01.03.14.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2025 14:07:41 -0800 (PST)
Message-ID: <af0fd38c-8464-4bb9-9279-4ad4c1e6de19@smile.fr>
Date: Fri, 3 Jan 2025 23:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Buildroot development <buildroot@buildroot.org>
References: <93f83afb-6987-441c-8e06-dab4d43b828f@grenoble.cnrs.fr>
Content-Language: fr
In-Reply-To: <93f83afb-6987-441c-8e06-dab4d43b828f@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1735942061; x=1736546861; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g7VNAk/v7tQXOtjsGTgjTWUANk7uHtul0nNMy1TxDAg=;
 b=0MGUt/iH9Ko7gNaZaidio1uXDwOWlsqiK68RF+OyTJVDFmAjw6OYQjCu2lxL1iPKUH
 ruKsodx8JsFBkuZ6gz8Zith2mJFJDUtYRx4ebcuSPP5CFUXJjGuccmFUF4kReQdB8eUn
 Z+Klx6a0RlHvc1tk8nEz+O+BwtBtWIe+gUNck=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=0MGUt/iH
Subject: Re: [Buildroot] [PATCH v3 1/1] linux: make out-of-tree DTS work
 with newest kernels
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Michael Walle <mwalle@kernel.org>, Sergey Matyukevich <geomatsi@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Chris Packham <judge.packham@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRWRnYXIsIEFsbCwKCkxlIDAzLzAxLzIwMjUgw6AgMTU6MzMsIEVkZ2FyIEJvbmV0IGEgw6lj
cml0wqA6Cj4gU2luY2UgTGludXggNi4xMiwgdGhlIEJ1aWxkcm9vdCBvcHRpb24gQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fRFRTX1BBVEgKPiBkb2VzIG5vdCB3b3JrIGFzIGV4cGVjdGVkIG9uIGFy
bSwgYXJtNjQsIG1pcHMgYW5kIHJpY3YuWzFdIFRoZXNlIGFyZSB0aGUKPiBhcmNoaXRlY3R1cmVz
IHRoYXQgc3RvcmUgdGhlIGluLXRyZWUgRFRTIGZpbGVzIGluIHZlbmRvci1zcGVjaWZpYwo+IHN1
YmRpcmVjdG9yaWVzIG9mIGFyY2gvJEFSQ0gvYm9vdC9kdHMvLgo+IAo+IEJSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX0RUU19QQVRIIHdhcyBpbnRyb2R1Y2VkIGluIEJ1aWxkcm9vdCAyMDEyLjA4Cj4g
KGNvbW1pdCA2OWZjNDk3ZGYwYWUgIlJld29yayBzdXBwb3J0IGZvciB0aGUgZGV2aWNlIHRyZWUi
KS4gQXQgdGhlIHRpbWUsCj4gdGhlIGtlcm5lbCBrZXB0IGFsbCBpbi10cmVlIERUUyBmaWxlcyBk
aXJlY3RseSBpbiBhcmNoLyRBUkNIL2Jvb3QvZHRzLywKPiBhbmQgdGhpcyBpcyB3aGVyZSBCdWls
ZHJvb3QgZHJvcHMgdGhlIHVzZXIncyBjdXN0b20gRFRTLiBWZW5kb3Itc3BlY2lmaWMKPiBzdWJk
aXJlY3RvcmllcyBhcHBlYXJlZCBpbiBMaW51eCB2My4xOSBmb3IgdGhlIGFybTY0IGFyY2hpdGVj
dHVyZSwgYW5kCj4gdGhpcyBzY2hlbWUgd2FzIGxhdGVyIGFkb3B0ZWQgYnkgbWlwcywgcmlzY3Yg
YW5kIGFybS4KPiAKPiBGb3IgdGhlc2UgYXJjaGl0ZWN0dXJlcywgTGludXggNi4xMiAoY29tbWl0
IGU3ZTI5NDEzMDBkMiwgImtidWlsZDogc3BsaXQKPiBkZXZpY2UgdHJlZSBidWlsZCBydWxlcyBp
bnRvIHNjcmlwdHMvTWFrZWZpbGUuZHRicyIpIG1hZGUgdGhlIERUQiBidWlsZAo+IGluZnJhc3Ry
dWN0dXJlIGluY29tcGF0aWJsZSB3aXRoIHRoZSB3YXkKPiBCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9EVFNfUEFUSCBpcyBpbXBsZW1lbnRlZC4gVGhpcyBpbmZyYXN0cnVjdHVyZSBub3cKPiBleHBl
Y3RzIGFsbCBEVFMgZmlsZXMgdG8gYmUgaW4gdmVuZG9yLXNwZWNpZmljIHN1YmRpcmVjdG9yaWVz
IG9uIHRoZQo+IGFyY2hpdGVjdHVyZXMgdGhhdCB1c2UgdGhpcyBzY2hlbWUuIEZ1bGZpbGxpbmcg
dGhpcyBrZXJuZWwgZXhwZWN0YXRpb24KPiB3b3VsZCByZXF1aXJlIGEgbmV3IGNvbmZpZ3VyYXRp
b24gcGFyYW1ldGVyIGZvciB0aGUgbmFtZSBvZiB0aGUKPiBhcHByb3ByaWF0ZSB2ZW5kb3Igc3Vi
ZGlyZWN0b3J5LiBJdCB3b3VsZCBhbHNvIHJlcXVpcmUgY2hhbmdpbmcgdGhlCj4gcmVsYXRpdmUg
cGF0aHMgdG8gaW5jbHVkZWQgLmR0c2kgZmlsZXMuCj4gCj4gTGV0J3MgYWRkIGluc3RlYWQgYSBy
dWxlIHRvIHRoZSB0b3AgZHRzL01ha2VmaWxlIGZvciBlYWNoIERUQiB3ZSB3YW50IHRvCj4gYnVp
bGQuIFRoaXMgYXZvaWRzIGJyZWFraW5nIHVzZXIncyBvdXQtb2YtdHJlZSBjb25maWd1cmF0aW9u
cy4KClRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGNvbW1pdCBsb2chCgpJJ2xsIHdhaXQgZm9yIGZl
ZWRiYWNrIGZyb20gb3RoZXIgbWFpbnRhaW5lcnMgYW5kIGZvciB0ZXN0aW5nIHRhZ3MuCgpSZXZp
ZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2Fy
ZHMsClJvbWFpbgoKCj4gCj4gWzFdIGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1h
aWwvYnVpbGRyb290LzIwMjQtT2N0b2Jlci83NjU0NjMuaHRtbAo+IAo+IFJlcG9ydGVkLWJ5OiBD
aHJpcyBQYWNraGFtIDxqdWRnZS5wYWNraGFtQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBF
ZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KPiAtLS0KPiBDaGFuZ2VzIHYyIC0+
IHYzOgo+ICAgLSBub3RlLCBpbiB0aGUgY29tbWVudCBhbmQgaW4gdGhlIGxvZyBtZXNzYWdlLCB0
aGF0IHRoaXMgaXNzdWUgb25seQo+ICAgICBhZmZlY3RzIHNvbWUgYXJjaGl0ZWN0dXJlcwo+ICAg
LSBleHBhbmQgdGhlIGxvZyBtZXNzYWdlIHdpdGggc29tZSBoaXN0b3JpY2FsIGNvbnRleHQKPiBU
aGVzZSBjaGFuZ2VzIHdlcmUgc3VnZ2VzdGVkIGJ5IFJvbWFpbiBOYW91ci4KPiAKPiBDaGFuZ2Vz
IHYxIC0+IHYyOgo+ICAgLSBkZWZpbmUgYSBob29rIGZvciBMSU5VWF9QT1NUX1BBVENIX0hPT0tT
IGFuZCBMSU5VWF9QT1NUX1JTWU5DX0hPT0tTCj4gICAgIGluc3RlYWQgb2YgbW9kaWZ5aW5nIExJ
TlVYX0JVSUxEX0NNRFMKPiAgIC0gdXNlICQocGF0c3Vic3QgJS5kdHMsJS5kdGIsJChkdHMpKSBp
bnN0ZWFkIG9mICQoZHRzOiUuZHRzPSUuZHRiKQo+IGJvdGggY2hhbmdlcyBzdWdnZXN0ZWQgYnkg
QXJub3V0IFZhbmRlY2FwcGVsbGUuCj4gCj4gVGhpcyB3YXMgYnVpbGQtdGVzdGVkIHdpdGggYW4g
QWNxdWEgZGVmY29uZmlnLAo+IGluIHRoZSBzYW1lIG1hbm5lciBhcyB2MjoKPiAKPiAgICAgIyBU
ZXN0IHdpdGggYW4gb2xkIGtlcm5lbDogdjYuNi4zMAo+ICAgICBtYWtlIGFjbWVzeXN0ZW1zX2Fj
cXVhX2E1XzUxMm1iX2RlZmNvbmZpZwo+ICAgICBtYWtlIGxpbnV4Cj4gCj4gICAgICMgVGVzdCB3
aXRoIGEgbmV3IGtlcm5lbDogdjYuMTIuOAo+ICAgICBtYWtlIGxpbnV4LWRpcmNsZWFuCj4gICAg
IGdpdCBhbSBidW1wX0FjcXVhX2tlcm5lbF90b192Ni4xMi44LnBhdGNoCj4gICAgIG1ha2UgYWNt
ZXN5c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVmY29uZmlnCj4gICAgIG1ha2UgbGludXgKPiAKPiAg
ICAgIyBUZXN0IHRoZSBPVkVSUklERV9TUkNESVIgY2FzZS4KPiAgICAgbWFrZSBsaW51eC1kaXJj
bGVhbgo+ICAgICBnaXQgLUMgJEhPTUUvc3JjL2xpbnV4IGNoZWNrb3V0IHY2LjEyLjgKPiAgICAg
ZWNobyAiTElOVVhfT1ZFUlJJREVfU1JDRElSID0gJEhPTUUvc3JjL2xpbnV4IiA+IGxvY2FsLm1r
Cj4gICAgIG1ha2UgYWNtZXN5c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVmY29uZmlnCj4gICAgIG1h
a2UgbGludXgKPiAtLS0KPiAgbGludXgvbGludXgubWsgfCAxMSArKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saW51eC9saW51
eC5tayBiL2xpbnV4L2xpbnV4Lm1rCj4gaW5kZXggMTI2OTliOGVlNC4uZTZlOGEzYzNiYyAxMDA2
NDQKPiAtLS0gYS9saW51eC9saW51eC5tawo+ICsrKyBiL2xpbnV4L2xpbnV4Lm1rCj4gQEAgLTMy
Nyw2ICszMjcsMTcgQEAgZGVmaW5lIExJTlVYX1RSWV9QQVRDSF9USU1FQ09OU1QKPiAgZW5kZWYK
PiAgTElOVVhfUE9TVF9QQVRDSF9IT09LUyArPSBMSU5VWF9UUllfUEFUQ0hfVElNRUNPTlNUCj4g
IAo+ICsjIE9uIHNvbWUgYXJjaGl0ZWN0dXJlcywga2VybmVscyA2LjEyKyB3b24ndCBjb21waWxl
IHRoZSBjdXN0b20gRFRTCj4gKyMgZmlsZXMgd2UgZHJvcCBpbnRvIGFyY2gvJEFSQ0gvYm9vdC9k
dHMgdW5sZXNzIHdlIGFkZCBzcGVjaWZpYyBydWxlcyB0bwo+ICsjIHRoYXQgZGlyZWN0b3J5J3Mg
TWFrZWZpbGUuCj4gK2RlZmluZSBMSU5VWF9BRERfRFRCX01BS0VfUlVMRVMKPiArCSQoZm9yZWFj
aCBkdHMsJChjYWxsIHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIKSks
IFwKPiArCQllY2hvICJkdGIteSArPSAkKHBhdHN1YnN0ICUuZHRzLCUuZHRiLCQobm90ZGlyICQo
ZHRzKSkpIiA+PiAkKExJTlVYX0FSQ0hfUEFUSCkvYm9vdC9kdHMvTWFrZWZpbGUKPiArCSkKPiAr
ZW5kZWYKPiArTElOVVhfUE9TVF9QQVRDSF9IT09LUyArPSBMSU5VWF9BRERfRFRCX01BS0VfUlVM
RVMKPiArTElOVVhfUE9TVF9SU1lOQ19IT09LUyArPSBMSU5VWF9BRERfRFRCX01BS0VfUlVMRVMK
PiArCj4gIExJTlVYX0tFUk5FTF9DVVNUT01fTE9HT19QQVRIID0gJChjYWxsIHFzdHJpcCwkKEJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX0xPR09fUEFUSCkpCj4gIGlmbmVxICgkKExJTlVYX0tFUk5F
TF9DVVNUT01fTE9HT19QQVRIKSwpCj4gIExJTlVYX0RFUEVOREVOQ0lFUyArPSBob3N0LWltYWdl
bWFnaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
