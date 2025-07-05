Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F347C83030
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 18:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB9960F2A;
	Sat,  5 Jul 2025 18:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKRmhQIYWKHL; Sat,  5 Jul 2025 18:14:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 616AE60EF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 616AE60EF6;
	Sat,  5 Jul 2025 18:14:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0554E12E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 18:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C179F60EF2
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 18:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8LWhRRIwf9S for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 18:14:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF67660E86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF67660E86
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF67660E86
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 18:14:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-450cfb79177so10009505e9.0
 for <buildroot@buildroot.org>; Sat, 05 Jul 2025 11:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751739245; x=1752344045;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z/pjsRGzKkrecCMl3EJAbX8zoIB1RCf91Qwbyk32S+Y=;
 b=w9Zv+QE/h+dW3U7CD90nlfJhr6Fragb/88XE2G/GWHHD8pfcyESLuxOUT021abbUkO
 EcA9vPrbTImoANYGsX5hJzPVlTC9EH5XmTdONvJ6wx1VU8C1jiPLx6lSRCkCgfKrrOSj
 VT4wY7owlH8Ph3qp9QqULzo3bNgcZ9PH1CwX94X3Jh1DqXy4sO5HV8bJ8gagYbVfbAsO
 LHeLcFgVgrsDKekxH0Iu669/HDt2M6rOCwJRx58JifsKuhsGAtMLMM2oAXfGUSPgT8GK
 hYFaIJdqwvtzwcNrDa5IakdJEfEsyFLc88d0Y54E8emms5fYdfzp1PkK45SYkj3CqLkx
 27FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3gaRczw4OklzmI+wWqOXm7ubtdf3qSMFUCaakJK0PbIoGDcHdH3+BEodqZi8VhO4z+S1kzgN8QTg=@buildroot.org
X-Gm-Message-State: AOJu0YxFkCiMXDlavmo3O5WVwxhPXseN1ystKLi1owU0hCMNX7EXty/5
 GnSMo/yNa4s6RPr+UFZfITjTgUz/RuekSKQlG5yt8qEB7m7cCIDNebDxgXdq7Yn387c=
X-Gm-Gg: ASbGncueXBCz9wvUV2mqXc/sNUz1YaTP/D2ctBk0Ge2L985cYbInMf5B3tm/uzXrmlQ
 fEH2mfan92J0QOy/AOK6S+5zgWGeidNMLR6cgeY3qvcaNU57YFsklc0xP7tnP/FFWABjA8out+U
 c/tLY7g76xqa0hPTn/Yci/SuHQgmpRhTu9L6/Og1gpHUIMWwA2jdNWAwtgUVOGoEALfqejoSX2x
 wX0WvQi7ORdPYU+t3v8evJI3wYb2u2GvFUFllX5xk47gTY8dznBoqPveSII2WlQqNOkdXGeY1qo
 AiJDm8KvRfOuz5bFflIfXFzaX3UcYZSbrayY+CH2HrNvL7+NbbbXAC7VEmmkCuu0/1nz76TexcB
 6gADCyE1aHLHaBXotML3E/08K8Ye5PLA6KnoGlOIdS0+aQnNKTmTB44BWElBj8A+dtQZLSjoFG8
 5GSX+ML7cJuPv9flVyQoJ+x2Z7
X-Google-Smtp-Source: AGHT+IGwwjCYFU53WGREkfMrtjj+KYiWlto/TYBJ0NtiCtP8VYzIMJCH+Flxg/D8CdOY90l+CadLYw==
X-Received: by 2002:a05:600c:a06:b0:442:dc6f:7a21 with SMTP id
 5b1f17b1804b1-454bb7f9b56mr29517225e9.3.1751739244561; 
 Sat, 05 Jul 2025 11:14:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225a4e1sm5569566f8f.74.2025.07.05.11.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jul 2025 11:14:04 -0700 (PDT)
Message-ID: <758ede1c-5990-4127-976d-f81cf7532b01@smile.fr>
Date: Sat, 5 Jul 2025 20:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Thomas Huth <huth@tuxfamily.org>, Cyril Bur <cyrilbur@gmail.com>
References: <20250619144837.1298990-1-alex.bennee@linaro.org>
 <20250619144837.1298990-2-alex.bennee@linaro.org>
Content-Language: fr
In-Reply-To: <20250619144837.1298990-2-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751739245; x=1752344045; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z/pjsRGzKkrecCMl3EJAbX8zoIB1RCf91Qwbyk32S+Y=;
 b=L7nDAU5LcwG83hW6bXPhV13w1GxmvXSgPBhjVZHR1+QRw5lxK6uX8j+VDwhWTFibT7
 GdMY8ougQP9DULA+7R3Ff76PnGKN7NNA6o5pWXIycfWzQVuf8oO73Dd1ubBJLvfuYj4O
 CA6td+CfXZjTUmffkpLrKTsqigSrX+kNZDd+Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=L7nDAU5L
Subject: Re: [Buildroot] [PATCH 1/3] package/kvm-unit-tests: assume AArch64
 supports KVM
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleCwKCkxlIDE5LzA2LzIwMjUgw6AgMTY6NDgsIEFsZXggQmVubsOpZSBhIMOpY3Jp
dMKgOgo+IEFsdGhvdWdoIGl0IGlzIHBvc3NpYmxlIHRvIGNvbmZpZ3VyZSBhbiBBQXJjaDY0IENQ
VSB3aXRob3V0IHN1cHBvcnQKPiBmb3IgRUwyIGluIHByYWN0aWNlIGFsbCB0aGUgY29tbW9uIEFB
cmNoNjQgaGF2ZSBzdXBwb3J0ZWQKPiB2aXJ0dWFsaXNhdGlvbiBmcm9tIHRoZSBzdGFydC4KPiAK
PiBJZiB3ZSByZWFsbHkgd2FudGVkIHRvIGJlIHN0cmljdCB3ZSBjb3VsZCBibGFja2xpc3Qga25v
d24gbm9uLUVMMiBDUFVzCj4gYnV0IEFGQUlDVCBhbGwgdGhlIGN1cnJlbnQgb25lcyBpbiB0aGUg
Y29uZmlnIGhhdmUgRUwyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5i
ZW5uZWVAbGluYXJvLm9yZz4KPiAtLS0KPiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcu
aW4gfCA5ICsrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZp
Zy5pbiBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCj4gaW5kZXggMDJlYThkZDU4
Yy4uMDAwZjVkY2VjZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZp
Zy5pbgo+ICsrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCj4gQEAgLTEsMTMg
KzEsMTIgQEAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTX0FSQ0hfU1VQUE9S
VFMKPiAgCWJvb2wKPiAgCSMgT24gQVJNLCBpdCBuZWVkcyB2aXJ0dWFsaXphdGlvbiBleHRlbnNp
b25zIGFuZCBsaXR0bGUgZW5kaWFuIENQVXMKPiAtCWRlZmF1bHQgeSBpZiAoQlIyX2FybSB8fCBC
UjJfYWFyY2g2NCkgJiYgXAo+ICsJZGVmYXVsdCB5IGlmIEJSMl9hcm0gJiYgXAo+ICAJCShCUjJf
Y29ydGV4X2E3IHx8IEJSMl9jb3J0ZXhfYTEyIHx8IFwKPiAgCQlCUjJfY29ydGV4X2ExNSB8fCBC
UjJfY29ydGV4X2ExNV9hNyB8fCBcCj4gLQkJQlIyX2NvcnRleF9hMTcgfHwgQlIyX2NvcnRleF9h
MTdfYTcgfHwgXAo+IC0JCUJSMl9jb3J0ZXhfYTU1IHx8IEJSMl9jb3J0ZXhfYTc1IHx8IFwKPiAt
CQlCUjJfY29ydGV4X2E3NV9hNTUgfHwgQlIyX2NvcnRleF9hNzYgfHwgXAo+IC0JCUJSMl9jb3J0
ZXhfYTc2X2E1NSkKCkJSMl9jb3J0ZXhfYTc2IGFuZCBCUjJfY29ydGV4X2E3Nl9hNTUgY2FuIGJl
IHVzZWQgd2l0aCBCUjJfYXJtPXkuCk9ubHkgQlIyX2NvcnRleF9hNTUgYW5kIEJSMl9jb3J0ZXhf
YTc1IGRlcGVuZHMgb24gQlIyX0FSQ0hfSVNfNjQuCgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRy
b290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZTY1YTE3M2U1MjQzYmI5ZmRlY2M0ZTE3OTJlNDcz
MTE2ZDFkZTllZgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICsJCUJSMl9jb3J0ZXhfYTE3IHx8
IEJSMl9jb3J0ZXhfYTE3X2E3KQo+ICsJIyBGb3IgQUFyY2g2NCB3ZSBjYW4gYXNzdW1lIGFsbCB2
OC4wKyBzdXBwb3J0IHZpcnR1YWxpemF0aW9uCj4gKwlkZWZhdWx0IHkgaWYgQlIyX2FhcmNoNjQK
PiAgCWRlZmF1bHQgeSBpZiBCUjJfaTM4NiB8fCBCUjJfeDg2XzY0Cj4gIAlkZWZhdWx0IHkgaWYg
QlIyX3Bvd2VycGM2NCB8fCBCUjJfcG93ZXJwYzY0bGUKPiAgCWRlZmF1bHQgeSBpZiBCUjJfczM5
MHgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
