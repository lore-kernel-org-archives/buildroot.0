Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD77C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 18:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF7704023F;
	Mon,  5 Feb 2024 18:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF7704023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmU3euX4gYwD; Mon,  5 Feb 2024 18:11:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9339940468;
	Mon,  5 Feb 2024 18:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9339940468
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0141BF379
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 015B240468
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 015B240468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kooTcQg-Cum6 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 18:11:13 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 822B74023F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 18:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 822B74023F
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6e03d97bdd0so20914b3a.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 10:11:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707156673; x=1707761473;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:reply-to:subject:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VZfk0IiZ1ScWpdiUG9E0Rqf6GEm7a8qM1KrhZeZc5PA=;
 b=WGBllJvaVLuBvp7TxiJb1CcyiDlvTF9jqkhqwS6SMB1+FyXTSeJXdaCIgOIsAfbYmL
 WDWTpmAN+WOJBnRDUM9GcnEKSRiAxnn1ZNyThhQqiFPxqsAVPP9vuEkOWxevw0tNwZ6M
 CEJgXRll1wxlll9AEYzSOUVS6OlslBrH/xVBTPs1n5eIFoG4pBm6ZD5V/djBhpgqK8CL
 aHZTakIw3dynY3MgddWs7LWl2BC4bUFF6pMOxBTsBJSMdRBPsWZJIizEp7nWJMvM91Sw
 4nRE/mpfu6IRaGQjlSLLItpnHprLk/M/E2eTzKRO3kkMMkIqZbTB04P3lyxn/0cBfc8I
 aZLw==
X-Gm-Message-State: AOJu0YxyseLQdT0fptiYw4+mVcCkXa3x+rJ/h2AuBqmia8pRRBoVpdfJ
 h80chbvlFN4PbuS1oIspX4kzKbx9pgPQDw8L4zYDsG0NvAIu7AwzsdkV2AF8Sm8=
X-Google-Smtp-Source: AGHT+IEMZ8a1GSS7/Xk7aD01CTMJz0ve5+F9IZHjT7FRB52eiXt9IfeNZHJOfCUusCf6lGAVZAIgbg==
X-Received: by 2002:aa7:8c5a:0:b0:6e0:3f63:ed64 with SMTP id
 e26-20020aa78c5a000000b006e03f63ed64mr293241pfd.34.1707156672693; 
 Mon, 05 Feb 2024 10:11:12 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXyj1XF4IXpBA6t3nWoIV3tC6nLSsjPwqoGQ32Q+fQBcHosnoQdGlBQlv4hJqEI7/tpDHh+XKFhl+VstzcN0XbebruYVCv96VIWE01e0w/P
Received: from [10.10.10.151] (97-120-67-139.ptld.qwest.net. [97.120.67.139])
 by smtp.gmail.com with ESMTPSA id
 j71-20020a638b4a000000b005cfd70edc1bsm314424pge.7.2024.02.05.10.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 10:11:12 -0800 (PST)
X-Google-Original-From: Kris Bahnsen <kris@embeddedTS.com>
Message-ID: <fda17439795949fef1527435444baada90bcf38b.camel@embeddedTS.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 05 Feb 2024 10:11:12 -0800
In-Reply-To: <ZcC2MgwHx2F8fACA@landeda>
References: <399bbbdbc865bb5fab6fa7dbdad653f9aa240da2.camel@embeddedTS.com>
 <ZcC2MgwHx2F8fACA@landeda>
Organization: embeddedTS
User-Agent: Evolution 3.38.3-1+deb11u2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embeddedts.com; s=google; t=1707156673; x=1707761473; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:reply-to:subject:message-id:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VZfk0IiZ1ScWpdiUG9E0Rqf6GEm7a8qM1KrhZeZc5PA=;
 b=qC9vMeKXS+2ppZjvcMmwwxIanJFD0dPqodGzYUmZEUUF17frYo8tZaOl3GTClLXCnP
 lhYpXRTh2SZuJHeZ+Y8QVcfKRMtrwZWPsKmQAQuh+Ry+w12PNvVf49wT7ON9Y83adHaF
 nTFI3lTrlBgok5wSR0IOyeeO4yLFjFdFnJqFw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=embeddedts.com header.i=@embeddedts.com
 header.a=rsa-sha256 header.s=google header.b=qC9vMeKX
Subject: Re: [Buildroot] [PATCH 1/1] package/wilc_firmware: bump to 16.1.2
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: kris@embeddedTS.com
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpLcmlzLCBBbGwsCgpPbiAyMDI0LTAyLTAxIDEzOjU5IC0wODAwLCBLcmlzIEJhaG5z
ZW4gdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gRnJvbSA1NWU4ZDI5NDk5N2FmOTMzYmIz
ZDgzMmI3MzIyOWJlYmVmYTQ1MDQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAKPiAyMDAxCj4gRnJvbTog
S3JpcyBCYWhuc2VuIDxrcmlzQGVtYmVkZGVkVFMuY29tPgo+IERhdGU6IFRodSwgMSBGZWIgMjAy
NCAyMDo0NjozOSArMDAwMAo+IFN1YmplY3Q6IFtQQVRDSCAxLzFdIHBhY2thZ2Uvd2lsY19maXJt
d2FyZTogYnVtcCB0byAxNi4xLjIKPiAKPiBSZWxlYXNlIGNoYW5nZWxvZzoKPiAtIFVzZSBkZWZh
dWx0IHZhbHVlcyBmb3IgSVEgY2FsaWJyYXRpb24gY29ycmVjdGlvbiB3aGVuIHRoZSBlRnVzZQo+
IHJlZ2lzdGVyIGhhcyB6ZXJvIHZhbHVlcy4KPiAtIEZpeCBmb3IgIldJTEMxMDAwIEZpcm13YXJl
IGluaXRpYWxpemF0aW9uIGlzc3VlIiBieSB1cGRhdGluZwo+IHRoZSBQTVUgY2xvY2sgc3dpdGNo
aW5nIHNlcXVlbmNlIGR1cmluZyBmaXJtd2FyZSBpbml0aWFsaXphdGlvbi4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBLcmlzIEJhaG5zZW4gPGtyaXNAZW1iZWRkZWRUUy5jb20+CgpJdCBzZWVtcyB5b3Vy
IHBhdGNoIGdvdCBiYWRseSBtYW5nbGVkLCBhbmQgSSBoYWQgaXNzdWVzIGFwcGx5aW5nIGl0Cihn
aXQtYW0gd2hpbmVkIHRoZSBwYXRjaCB3YXMgZW1wdHkpLiBBbmQgSSBub3RpY2UgdGhhdCB0aGUg
bWFpbCBoZWFkZXJzCmFyZSBpbmNsdWRlZCBpbiB0aGUgcGF0Y2guIE5vdCBzdXJlIHdoYXQgaGFw
cGVuLiBVc2luZyAiZ2l0IHNlbmQtZW1haWwiCmlzIGtub3duIHRvIHNlbmQgY29ycmVjdGx5IGZv
cm1hdHRlZCBwYXRjaGVzLCBzbyBtYXliZSBjaGVjayBpZiB5b3UgY2FuCmRvIHRoYXQgbmV4dCB0
aW1lLgoKTXkgYXBvbG9naWVzLCBJIHVzdWFsbHkgdXNlIGBnaXQgc2VuZC1lbWFpbGAsIGJ1dCBo
YWQgdG8gdXNlIGFuIGVtYWlsCmNsaWVudCB0byBzZW5kIHRoaXMgcGF0Y2ggKGFuZCBvYnZpb3Vz
bHkgZGlkIGl0IGluY29ycmVjdGx5KS4gRnV0dXJlCnBhdGNoZXMgd2lsbCBhbGwgY29tZSBpbiBv
biBgZ2l0IHNlbmQtZW1haWxgLiBUaGFua3MhCgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4K
ClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+IMKgcGFja2FnZS93aWxjLWZpcm13YXJl
L3dpbGMtZmlybXdhcmUuaGFzaCB8IDIgKy0KPiDCoHBhY2thZ2Uvd2lsYy1maXJtd2FyZS93aWxj
LWZpcm13YXJlLm1rwqDCoCB8IDIgKy0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dpbGMtZmlybXdh
cmUvd2lsYy1maXJtd2FyZS5oYXNoIGIvcGFja2FnZS93aWxjLQo+IGZpcm13YXJlL3dpbGMtZmly
bXdhcmUuaGFzaAo+IGluZGV4IDgwMmNiNGY5YjEuLjhhNzk1N2ExZDIgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS93aWxjLWZpcm13YXJlL3dpbGMtZmlybXdhcmUuaGFzaAo+ICsrKyBiL3BhY2thZ2Uv
d2lsYy1maXJtd2FyZS93aWxjLWZpcm13YXJlLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiDCoCMg
TG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NsKgCj4gYTA2YTZhNDZlMDNjYTAwZDM1ZGEyMjBm
N2E5ZjM1M2NjNjUwZTVlNTY1N2E3OTg4ZWE3MzI5MTNhZDI2ZDlhMMKgCj4gd2lsYy1maXJtd2Fy
ZS13aWxjX2xpbnV4XzE2XzEudGFyLmd6Cj4gK3NoYTI1NsKgCj4gNmNkNWZjNTIxNTA1MjBiZWRi
NzM2ZjU4MTI0MDYzMDQxYjRkOTg0OWVhMzM0ODFhOGIwNzVmNTFhZWM2NGY4ZcKgCj4gd2lsYy1m
aXJtd2FyZS13aWxjX2xpbnV4XzE2XzFfMi50YXIuZ3oKPiDCoHNoYTI1NsKgCj4gNzEzNTVlZWU5
NDdhMzEyNTk0ZGJkYWFjMDM5ODI3NTQ0ZjkzZDIzOTQ5YjY1YzM1NmI3YjBjZTA5ZTI2MDBmYsKg
Cj4gTElDRU5TRS53aWxjX2Z3Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2lsYy1maXJtd2FyZS93
aWxjLWZpcm13YXJlLm1rIGIvcGFja2FnZS93aWxjLQo+IGZpcm13YXJlL3dpbGMtZmlybXdhcmUu
bWsKPiBpbmRleCAxMmM4MjVjZjkyLi4zMzgxMTYyYmJkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
d2lsYy1maXJtd2FyZS93aWxjLWZpcm13YXJlLm1rCj4gKysrIGIvcGFja2FnZS93aWxjLWZpcm13
YXJlL3dpbGMtZmlybXdhcmUubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiDCoCMKPiDCoCMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4gIyMjIyMjIyMjIyMjCj4gwqAKPiAtV0lMQ19GSVJNV0FSRV9WRVJTSU9OID0gd2lsY19s
aW51eF8xNl8xCj4gK1dJTENfRklSTVdBUkVfVkVSU0lPTiA9IHdpbGNfbGludXhfMTZfMV8yCj4g
wqBXSUxDX0ZJUk1XQVJFX1NJVEUgPSAkKGNhbGwKPiBnaXRodWIsbGludXg0d2lsYyxmaXJtd2Fy
ZSwkKFdJTENfRklSTVdBUkVfVkVSU0lPTikpCj4gwqAKPiDCoFdJTENfRklSTVdBUkVfTElDRU5T
RSA9IFBST1BSSUVUQVJZCj4gLS0gCj4gMi4zNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
