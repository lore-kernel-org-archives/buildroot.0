Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FCCE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 15:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 835CD409D2;
	Wed, 11 Dec 2024 15:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBsLPAUW763z; Wed, 11 Dec 2024 15:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 571BF409EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 571BF409EF;
	Wed, 11 Dec 2024 15:59:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 427C46F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 221E441C6F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQU2ZDevsmq9 for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 15:59:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65EC741C54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65EC741C54
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65EC741C54
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:59:36 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3862df95f92so3504287f8f.2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 07:59:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733932774; x=1734537574;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M3KzLQqagebcOjflGMOEiSqSRQaMW4FmEi4jA8m0js0=;
 b=YzAhZApioqS50AEUbGuhR8T/ulFi1Fd7SqVp3W2tfN+YaPFIfAKrO6u6kT+tTnrgyq
 5XVQY3UTexGao1Z0H6ZhrNuqbCpMidUYFayJ26P/e5uluqMtN1OcDSmDFWnVbce9yBPi
 cTETS0BixqRR1x4rqxBmLm2Mf0dmlJW7TfiILhZvRV8hJIO8pC+dN0KHHH9wjAHx4yq3
 CNnwLBd+FSMlT9rucryNG10jdQXl5tRFi6plFwvCNKrUBYH8gxRxyOH/qbJpulFyN+c/
 NlqAGXJxh5uuabGSUwGEwmqg/hXEyEv1tnPA17Ojw4ECT1tH/9KIDXNx8eNI6H7wCSSu
 s7ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/rHdEgEbkjMWdmCm73BeDkE0N0nry7Ba6DIuytpqXZYKOZyfyqYIakQgX1wNhGl3KyVl8tdv/17s=@buildroot.org
X-Gm-Message-State: AOJu0YyArhR/Akef3siCIjc0aMmzpvDMbpLUzsO1CAulWnRa3qrbt8ey
 m4wazlt6ymTN3yo+21PbJyq/x90Wi8Wx8A+sbyJv4DoOne6SZXgIOQVffd7gH96KEAr+Gtw3Zuf
 X7s1yBw==
X-Gm-Gg: ASbGncuRAIDcDFt90xMaw+CNSpEQy72vuMjWc4KK49Y+NGSeyhqbW/E6gPPPdcUHNra
 CE2hOP8arvhNk3LTL/4C/FjxC0eLMy+qRbJJmDLS2ZD0xI/rgJYdrn9Gwxq2kvBpPl3I59X3Rh5
 54jroovlpJTN5IRSrmNML7TKP/CMGzOsZ7oBcPUYI/XsdUtgaKaBu0BELxkNbz9/hdpzcFp3KyF
 y/HMzOeIoaOADZgI6qpM0u6UTWHzYphSu3rA+YFjrUGakB0nBsOQ7TBZrG1v7wPstsJ1ev/LJHJ
 kGXxExh6x45RXb8mUkasgInsdqU/fNDQkqzJY2d26w==
X-Google-Smtp-Source: AGHT+IH3vVD5Mnm87OnWXRSdQy1tMRXBZLnPAgPm1WvlmKsy47O0mTmo5++chcePgEw1jdVfZUf/Ag==
X-Received: by 2002:a05:6000:401f:b0:386:4acd:4d77 with SMTP id
 ffacd0b85a97d-387876aee27mr102296f8f.44.1733932773809; 
 Wed, 11 Dec 2024 07:59:33 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362210453esm3889855e9.15.2024.12.11.07.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 07:59:33 -0800 (PST)
Message-ID: <4a554651-5530-4e68-a3ef-f359e0d5f6e8@smile.fr>
Date: Wed, 11 Dec 2024 16:59:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241116164727.16193-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20241116164727.16193-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733932774; x=1734537574; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M3KzLQqagebcOjflGMOEiSqSRQaMW4FmEi4jA8m0js0=;
 b=L/NJPyA9LcIQpmnVBTkD0nwOocrWP/hChJGAVjG3mQVdIkhsM+VsgjxBeNncVZb6Xr
 vKGKqRg6Chj/lAHR+Decm3HWTfhETYPpRDfjCykrSigmZzAKlIvLV50tcOFxO90NPfWZ
 nkzxWIADcJ6Peg/T5W7OlktqJrleOnozmw8ZE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=L/NJPyA9
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_fwts.py: switch to neoverse-n1 cpu
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAxNi8xMS8yMDI0IMOgIDE3OjQ3LCBKdWxpZW4gT2xpdmFp
biBhIMOpY3JpdMKgOgo+IFRoZSBTQlNBIFJlZmVyZW5jZSBQbGF0Zm9ybSB3YXMgdXBkYXRlZCB0
byB1c2UgdGhlIG5lb3ZlcnNlLW4xIGNwdQo+IChhcm12OC4yYSkgaW4gUWVtdSB2OC4xIFsxXS4K
PiAKPiBDb21taXQgYzU4YTJhOTY4ICJjb25maWdzL3FlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZp
Zzogc3dpdGNoIHRvCj4gbmVvdmVyc2UtbjEgKGFybXY4LjJhKSIgWzJdIHJlZmxlY3RlZCB0aGlz
IGNoYW5nZSBpbgo+IHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZy4KPiAKPiBUaGlzIGNvbW1p
dCB1cGRhdGVzIHRoZQl0ZXN0X2Z3dHMgcnVudGltZSB0ZXN0IHRoZSBzYW1lIHdheS4KPiAKPiBU
aGlzIHVwZGF0ZSBpcyBwb3NzaWJsZSB3aXRoIHRoZSBoZWxwIG9mIGNvbW1pdHMgWzNdIGFuZCBb
NF0uCj4gCj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2NvbW1p
dC8xODc3MjcyYmFkN2IwOGI2NzMxMjUwM2VlNjYxODQyNzk4NzZjN2JkCj4gWzJdIGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9jNThhMmE5Njg3YzA0
NTM3OWMwZjc2OGM4YzZjMWMxYTQxODQyYTg1Cj4gWzNdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8wZDQxNzc1OThjZTdlNzNmMmI5N2FjNThjMjFm
YjE3NzM0MzY0M2UzCj4gWzRdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2NvbW1pdC8wMjdkZGNiZmY2NWJiOWRjMTc5OWQ4OWZjMTQwYTMzZTgxZDM1NDIxCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gUGF0Y2gg
dGVzdGVkIGluOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9qb2Jz
LzgzODg3MDE2NjcKPiAtLS0KPiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9m
d3RzLnB5IHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X2Z3dHMucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2Z3dHMucHkK
PiBpbmRleCA2ZTJiNmY1MGJhLi40ZGYxM2I2MGY5IDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZnd0cy5weQo+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfZnd0cy5weQo+IEBAIC03LDYgKzcsNyBAQCBjbGFzcyBUZXN0Rnd0
cyhpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ICAgICAgY29uZmlnID0gXAo+ICAgICAgICAgICIi
Igo+ICAgICAgICAgIEJSMl9hYXJjaDY0PXkKPiArICAgICAgICBCUjJfbmVvdmVyc2VfbjE9eQo+
ICAgICAgICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+ICAgICAgICAgIEJSMl9UQVJHRVRf
R0VORVJJQ19HRVRUWV9QT1JUPSJ0dHlBTUEwIgo+ICAgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZT
X0VYVDI9eQo+IEBAIC02Niw3ICs2Nyw3IEBAIGNsYXNzIFRlc3RGd3RzKGluZnJhLmJhc2V0ZXN0
LkJSVGVzdCk6Cj4gICAgICAgICAgZmxhc2gxID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIs
ICJpbWFnZXMiLCAiU0JTQV9GTEFTSDEuZmQiKQo+ICAgICAgICAgIHNlbGYuZW11bGF0b3IuYm9v
dChhcmNoPSJhYXJjaDY0IiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucz1b
Ii1NIiwgInNic2EtcmVmIiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ii1jcHUiLCAiY29ydGV4LWE1NyIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICItY3B1IiwgIm5lb3ZlcnNlLW4xIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIi1tIiwgIjUxMk0iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiLXBmbGFzaCIsIGZsYXNoMCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIi1wZmxhc2giLCBmbGFzaDEsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
