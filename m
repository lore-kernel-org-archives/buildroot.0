Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032A5C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 14:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE882608D4;
	Mon,  3 Feb 2025 14:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2X0Rd6ZWloGg; Mon,  3 Feb 2025 14:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2B81608C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2B81608C8;
	Mon,  3 Feb 2025 14:52:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBA7712A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8E1C4099F
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBya6xhhB0ny for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 14:52:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43AA740993
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43AA740993
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43AA740993
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:52:25 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436202dd730so32005535e9.2
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 06:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738594344; x=1739199144;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V3ELT6T/IIwxbRqgxi02AijK/Uucb0aRd7xW8mnQuWA=;
 b=M1o8m+4dtr9whLQxUrnxxATapJIVPMM9hvJr0dhVA+HB6QnB9VRz8AJfsIanGiwOga
 YZftbLyxSG9RTHoKDYAoXRXeR7GDzoCyBwR2rBz5eLP+KBoi1sgXIavVCZFq7NDP59dm
 wuN9d7U6kQRsBIHQtsLU0Co3umGA+A1ucZ+SAJNH/sa+cOYRBa56pEr5XkrRMg1BjZa2
 uZBoBGHHP4ZWY0nYF2iq1z1iA+5d4dBRvoaqknmLWc/HB795ZLiBjtytNpTspYrPGEoV
 zZDH2D0Msdn+kC1xg1yEjv0Bc+bBNnutesAalqe1W/AoJqdJUruIUR2jIu0HFhFoAuDy
 HJcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn5uK4obSkE70re/XxYgN0LblMN1OhLVB8iuJsGNfaoTGFbRIVp38A98ZMPtJK+F4m/ErRdtXVeVo=@buildroot.org
X-Gm-Message-State: AOJu0Yy+1ohhJMlNfkADx5gV+BtZ9HyWsWSjWTAWc/6X9OgOyrk9X5YG
 fHPJz0ZudRIOrA7MSwpJI3xVxcbzG/GqzmGK4EmGFW+0IohDDcBSf0gWWFDmPYebNy6mVz+15FL
 t
X-Gm-Gg: ASbGncug6yQ6k5E0N4mNteCjFkLAfKv4S1OtLciO53PLcN7coV1t4Qb6Tw8LkQ0aVgw
 0l/HOcveAbheBdGq5hqtiZIZWShAdRJym+T0x+/I0gM8E3WyaRWLNoI1kOayk3zFEsq0kiOKaPx
 txptkpek24R7+06DM3EgfVVGkQOwQ2UKpJMVya9MQkTwTN1Sd9kYT34gUacZOpahMrDk/hpUa5E
 W4upTgeWscEUKzlDFLJd2BqJJ0auvz+3Mevpfz7TOtSbcrg3ExrS36KH3JCE8IR61FMXj/xt2xs
 Wl9m46S1gZOkKwpWUBKxb96nYW3HrHn1Nccp7gmBlzqyTYo=
X-Google-Smtp-Source: AGHT+IETnQ2wY06Az+ND+b9h1vtqMFDDhjuUFxGQXcNmBacmRC8AmfsDeAe8pwooU73bP9K/Wg/1cw==
X-Received: by 2002:a05:600c:1d07:b0:436:aaf:7eb9 with SMTP id
 5b1f17b1804b1-438dc3fc344mr178748595e9.20.1738594344002; 
 Mon, 03 Feb 2025 06:52:24 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc27130sm192361755e9.16.2025.02.03.06.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 06:52:23 -0800 (PST)
Message-ID: <06588f58-a015-469a-a99f-1a6494c8f91d@mind.be>
Date: Mon, 3 Feb 2025 15:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 buildroot@buildroot.org
References: <20250201183553.929140-1-gael.portay+rtone@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250201183553.929140-1-gael.portay+rtone@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738594344; x=1739199144; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V3ELT6T/IIwxbRqgxi02AijK/Uucb0aRd7xW8mnQuWA=;
 b=DkLE7Xy0gnWlZn4y9cGchGKvYoAjbvendVg0+A0+7p2RANDbzOp8KH70mgbhVaaGvi
 MwrwhiicXCJ1aXEWZ4p2M0vzEe3eG9Fv+FjSOAyS9wyhchGu4n8NXcRhsyJgpTQyLHpe
 SDFiw+fvtqci5OkW9dDvuv64DEUTyHyDhMCvPrJvpjcdjhvHEoR6Zrio/lFuVAV3YZhb
 vqnhstxI/D76Sp1cW/yZu5WqO6spk5xc+JOJ7BBOUl4j8hUvlB8PugpO+VZJ28wUB9ZQ
 MUHxmRcTwgZ7axe0Gm0UMzusF8S791pzNSDCxWLVlo21SmpNKo3RgqX/bmB9RhQNKw0a
 wY9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DkLE7Xy0
Subject: Re: [Buildroot] [RESEND] board/raspberrypi*: remove dtparam krnbt=on
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

CgpPbiAwMS8wMi8yMDI1IDE5OjM1LCBHYcOrbCBQT1JUQVkgd3JvdGU6Cj4gVGhlIGNvbmZpZy50
eHQgb2YgdGhlIFJhc3BlcnJ5IFBpJ3Mgc3VwcG9ydGluZyBXaS1GaSBhbmQgQmx1ZXRvb3RoIChp
LmUuCj4gemVybyBXLCB6ZXJvIDIgVywgMywgYW5kIDQpIHN3aXRjaCB0aGUgQmx1ZXRvb3RoIGZ1
bmN0aW9uIHRvIHVzZSB0aGUKPiBtaW5pLVVBUlQgKHR0eVMwKSBhbmQgcmVzdG9yZSBVQVJUMCAo
dHR5QU1BMCkgb3ZlciB0aGUgR1BJT3MgMTQgYW5kIDE1Cj4gKGFzIHBlciBtaW5pdWFydC1idC1v
dmVybGF5LmR0c1sxXSkuIEFsbCBvZiB0aGVtIHR1cm4gIm9uIiB0aGUgcGFyYW1ldGVyCj4ga3Ju
YnQgdG8gYXV0b3Byb2JlIHRoZSBibHVldG9vdGggZHJpdmVyLgo+IAo+IEFjY29yZGluZyB0byB0
aGUgUkVBRE1FLm1kLCB0aGUgZHRwYXJhbSBrcm5idCBpcyBub3cgZGVmYXVsdGluZyB0byAib24i
Cj4gc2luY2UgbGludXgtcmFzcGJlcnJ5cGkgNi4xLnlbMl07IGl0IHdhcyBkZWZhdWx0aW5nIHRv
ICJvZmYiIGJlZm9yZVszXS4KPiAKPiBUaGlzIHJlbW92ZXMgdGhlIGR0cGFyYW09a3JuYnQ9b24g
ZnJvbSB0aGVzZSBjb25maWcudHh0IGZpbGVzIHNpbmNlIHRoZQo+IHZhbHVlIHNldCBpcyBhY3R1
YWxseSB0aGUgZGVmYXVsdCB2YWx1ZS4KPiAKPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNw
YmVycnlwaS9saW51eC9ibG9iL3JwaS02LjEueS9hcmNoL2FybS9ib290L2R0cy9vdmVybGF5cy9t
aW5pdWFydC1idC1vdmVybGF5LmR0cwo+IFsyXTogaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJy
eXBpL2xpbnV4L2Jsb2IvcnBpLTYuMS55L2FyY2gvYXJtL2Jvb3QvZHRzL292ZXJsYXlzL1JFQURN
RSNMMjk0LUwyOTYKPiBbM106IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9saW51eC9i
bG9iL3JwaS01LjEwLnkvYXJjaC9hcm0vYm9vdC9kdHMvb3ZlcmxheXMvUkVBRE1FI0wyMTMtTDIx
NQo+IAo+IFNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21h
aWwuY29tPgoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91
dAoKCj4gLS0tCj4gSGVsbG8sCj4gCj4gQ2hhbmdlcyBzaW5jZSByZXNlbmQ6Cj4gICAtIFVwZGF0
ZWQgZS1tYWlsLgo+IAo+IFJlZ2FyZHMsCj4gR2HDq2wKPiAKPiAgIGJvYXJkL3Jhc3BiZXJyeXBp
L2NvbmZpZ18wdy50eHQgICAgICB8IDMgLS0tCj4gICBib2FyZC9yYXNwYmVycnlwaS9jb25maWdf
My50eHQgICAgICAgfCAzIC0tLQo+ICAgYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzNfNjRiaXQu
dHh0IHwgMyAtLS0KPiAgIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180LnR4dCAgICAgICB8IDMg
LS0tCj4gICBib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNF82NGJpdC50eHQgfCAzIC0tLQo+ICAg
Ym9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX3plcm8ydy50eHQgIHwgMyAtLS0KPiAgIDYgZmlsZXMg
Y2hhbmdlZCwgMTggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJy
eXBpL2NvbmZpZ18wdy50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMHcudHh0Cj4gaW5k
ZXggMTIzZTA5Y2Y1Ni4uMDI2NzIxMGUyZCAxMDA2NDQKPiAtLS0gYS9ib2FyZC9yYXNwYmVycnlw
aS9jb25maWdfMHcudHh0Cj4gKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzB3LnR4dAo+
IEBAIC0yNCw2ICsyNCwzIEBAIGdwdV9tZW1fMTAyND0xMDAKPiAgIAo+ICAgIyBFbmFibGUgVUFS
VDAgZm9yIHNlcmlhbCBjb25zb2xlIG9uIHR0eUFNQTAKPiAgIGR0b3ZlcmxheT1taW5pdWFydC1i
dAo+IC0KPiAtIyBlbmFibGUgYXV0b3Byb2Jpbmcgb2YgQmx1ZXRvb3RoIGRyaXZlciB3aXRob3V0
IG5lZWQgb2YgaGNpYXR0YWNoL2J0YXR0YWNoCj4gLWR0cGFyYW09a3JuYnQ9b24KPiBkaWZmIC0t
Z2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzMudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkv
Y29uZmlnXzMudHh0Cj4gaW5kZXggMTIzZTA5Y2Y1Ni4uMDI2NzIxMGUyZCAxMDA2NDQKPiAtLS0g
YS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMy50eHQKPiArKysgYi9ib2FyZC9yYXNwYmVycnlw
aS9jb25maWdfMy50eHQKPiBAQCAtMjQsNiArMjQsMyBAQCBncHVfbWVtXzEwMjQ9MTAwCj4gICAK
PiAgICMgRW5hYmxlIFVBUlQwIGZvciBzZXJpYWwgY29uc29sZSBvbiB0dHlBTUEwCj4gICBkdG92
ZXJsYXk9bWluaXVhcnQtYnQKPiAtCj4gLSMgZW5hYmxlIGF1dG9wcm9iaW5nIG9mIEJsdWV0b290
aCBkcml2ZXIgd2l0aG91dCBuZWVkIG9mIGhjaWF0dGFjaC9idGF0dGFjaAo+IC1kdHBhcmFtPWty
bmJ0PW9uCj4gZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18zXzY0Yml0LnR4
dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18zXzY0Yml0LnR4dAo+IGluZGV4IDg4MjA2ZTli
MTQuLmJiZDhiNjkzNjMgMTAwNjQ0Cj4gLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzNf
NjRiaXQudHh0Cj4gKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzNfNjRiaXQudHh0Cj4g
QEAgLTI1LDggKzI1LDUgQEAgZ3B1X21lbV8xMDI0PTEwMAo+ICAgIyBFbmFibGUgVUFSVDAgZm9y
IHNlcmlhbCBjb25zb2xlIG9uIHR0eUFNQTAKPiAgIGR0b3ZlcmxheT1taW5pdWFydC1idAo+ICAg
Cj4gLSMgZW5hYmxlIGF1dG9wcm9iaW5nIG9mIEJsdWV0b290aCBkcml2ZXIgd2l0aG91dCBuZWVk
IG9mIGhjaWF0dGFjaC9idGF0dGFjaAo+IC1kdHBhcmFtPWtybmJ0PW9uCj4gLQo+ICAgIyBlbmFi
bGUgNjRiaXRzIHN1cHBvcnQKPiAgIGFybV82NGJpdD0xCj4gZGlmZiAtLWdpdCBhL2JvYXJkL3Jh
c3BiZXJyeXBpL2NvbmZpZ180LnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180LnR4dAo+
IGluZGV4IDliNzdkMjNkNzQuLjEzYTcyMzhmNmUgMTAwNjQ0Cj4gLS0tIGEvYm9hcmQvcmFzcGJl
cnJ5cGkvY29uZmlnXzQudHh0Cj4gKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzQudHh0
Cj4gQEAgLTI0LDYgKzI0LDMgQEAgZ3B1X21lbV8xMDI0PTEwMAo+ICAgCj4gICAjIEVuYWJsZSBV
QVJUMCBmb3Igc2VyaWFsIGNvbnNvbGUgb24gdHR5QU1BMAo+ICAgZHRvdmVybGF5PW1pbml1YXJ0
LWJ0Cj4gLQo+IC0jIGVuYWJsZSBhdXRvcHJvYmluZyBvZiBCbHVldG9vdGggZHJpdmVyIHdpdGhv
dXQgbmVlZCBvZiBoY2lhdHRhY2gvYnRhdHRhY2gKPiAtZHRwYXJhbT1rcm5idD1vbgo+IGRpZmYg
LS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNF82NGJpdC50eHQgYi9ib2FyZC9yYXNw
YmVycnlwaS9jb25maWdfNF82NGJpdC50eHQKPiBpbmRleCBmY2IxYzVjMzBhLi4yZWVmNmRkMWEy
IDEwMDY0NAo+IC0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180XzY0Yml0LnR4dAo+ICsr
KyBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180XzY0Yml0LnR4dAo+IEBAIC0yNSw4ICsyNSw1
IEBAIGdwdV9tZW1fMTAyND0xMDAKPiAgICMgRW5hYmxlIFVBUlQwIGZvciBzZXJpYWwgY29uc29s
ZSBvbiB0dHlBTUEwCj4gICBkdG92ZXJsYXk9bWluaXVhcnQtYnQKPiAgIAo+IC0jIGVuYWJsZSBh
dXRvcHJvYmluZyBvZiBCbHVldG9vdGggZHJpdmVyIHdpdGhvdXQgbmVlZCBvZiBoY2lhdHRhY2gv
YnRhdHRhY2gKPiAtZHRwYXJhbT1rcm5idD1vbgo+IC0KPiAgICMgZW5hYmxlIDY0Yml0cyBzdXBw
b3J0Cj4gICBhcm1fNjRiaXQ9MQo+IGRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25m
aWdfemVybzJ3LnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJvMncudHh0Cj4gaW5k
ZXggMTIzZTA5Y2Y1Ni4uMDI2NzIxMGUyZCAxMDA2NDQKPiAtLS0gYS9ib2FyZC9yYXNwYmVycnlw
aS9jb25maWdfemVybzJ3LnR4dAo+ICsrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJv
MncudHh0Cj4gQEAgLTI0LDYgKzI0LDMgQEAgZ3B1X21lbV8xMDI0PTEwMAo+ICAgCj4gICAjIEVu
YWJsZSBVQVJUMCBmb3Igc2VyaWFsIGNvbnNvbGUgb24gdHR5QU1BMAo+ICAgZHRvdmVybGF5PW1p
bml1YXJ0LWJ0Cj4gLQo+IC0jIGVuYWJsZSBhdXRvcHJvYmluZyBvZiBCbHVldG9vdGggZHJpdmVy
IHdpdGhvdXQgbmVlZCBvZiBoY2lhdHRhY2gvYnRhdHRhY2gKPiAtZHRwYXJhbT1rcm5idD1vbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
