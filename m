Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DFEC83F05
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 13:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20017418CE;
	Wed,  2 Jul 2025 13:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5Y0D5VMOj-o; Wed,  2 Jul 2025 13:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08111418CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08111418CA;
	Wed,  2 Jul 2025 13:39:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04998128
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEF1260701
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeKFFsOXA4Cq for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 13:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B80D1606E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B80D1606E9
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B80D1606E9
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:39:06 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so47416105e9.1
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 06:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751463544; x=1752068344;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KlkykX8bYmF7zKchXK36tQiRvl800Fg2moVTfiIwu/8=;
 b=AZtxVR9ff5rPO18QFpny1RvWFVwJ4pC208v6g+pObhmERxP0vZ6w93mzIFY2dzBJjY
 LsTSPX/DWv+GOgs+UDPs1xDuF8cHzVM/l4XdV4VZEGnrZY3+REXuuBvoL78ux5b9fj3S
 c5bWG2xt2f3RznV3H9KR45pkwAeGYy20eXxzez4Upn1VnMTM/Icn/WXBokf37SFR5zqx
 AH99ugjenu3gG7T/s2NLUGleTn11t8dERjXMWX88aNiuiXUzvfNiOgIpRseg6KlAHcxC
 o7BsdaPmac1gBeQOtszxX6PZhhJccFiK14O4lkRnuEelqvppzjLgU//O0nfwvr8uIjKx
 waPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhXHdpTQqXjAXZXWYrKbvSXR17mhSLmk9LwjfidwOJF6RJs7rLbBam+883FCE15xc/acdGJklYtok=@buildroot.org
X-Gm-Message-State: AOJu0YxkA2tBrZB732otbbmYnGGtCHdiK8OjPGShrpgyKtYzsMD6R54F
 AmqSPNnrUmuAsz0W+6WJdWWoikoAzZZVTD2gKOxXXUWB7coxnZALDjxvjiH/vDngmDg=
X-Gm-Gg: ASbGncsZ/wCa7nJwolunfz+uRq4dw6loarOCwEpLFkZJSTo/7Sp/wvXnk0loiunnuFD
 InY/0u14kkSSG98c6x4mJaZobqgYrNS83GbJJTKzoFDB8P7HRbt5Q+0pxWv7wz4+n795XLmPYUX
 iqTG93IJmWbv6qVV1Lp7pIdlsTea0JEwKh9FdufI+5hxzJtg48gtklIn6jUXgwWQb5qrhBx17QB
 kbHKf+QP4O04TrG9IB+WQO5XTIk6FJ+CuA5L2fCVdxLovYbVZUfjzEpqlf62mgn8B05ji6xB6r9
 dwN3XwWL4HuQ86ql17MxZiKdT8QvxTEHT1OX9r5VH081ZmiyRDyh20hcoBA0mbNyvsiQf4OTr7V
 aWFtjG7VfKWee2PxNh+R2HVmHG/v82CIvppLseOm2af1aOJsVdN25cKLB3f2x
X-Google-Smtp-Source: AGHT+IGV9ijvlYJSnmnEker7itddcqPHnN7lzJALEA2SqQqbFHT4LX0YG6IU8f3eUzyKxJ2tI3Rwfw==
X-Received: by 2002:a05:600c:3f0c:b0:441:b076:fce8 with SMTP id
 5b1f17b1804b1-454a36e91eamr34714775e9.14.1751463544338; 
 Wed, 02 Jul 2025 06:39:04 -0700 (PDT)
Received: from [10.5.90.80]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823ad247sm236930355e9.26.2025.07.02.06.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 06:39:03 -0700 (PDT)
Message-ID: <fce788be-dd91-413a-951c-4bf72ade7a13@smile.fr>
Date: Wed, 2 Jul 2025 15:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250701194411.13153-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20250701194411.13153-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751463544; x=1752068344; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KlkykX8bYmF7zKchXK36tQiRvl800Fg2moVTfiIwu/8=;
 b=LsIURXCPRKNz76OKx8qp3yqOGdcKF2S49GWoFVA1ta4QTgv2hu6TtNdGOkMhnjBqlb
 f8YH/6TLqphEyxl2aa4zG0rhY9jhJ92IDCNxQCRjkPerH+w+X1y5nMBj/CNMyga4I1Jk
 tY1yn7QfxW5mY0843SvskbCsSdrgC/dyWToqs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=LsIURXCP
Subject: Re: [Buildroot] [PATCH v2 1/3] arch/Config.in: introduce
 BR2_ARCH_NEEDS_GCC_AT_LEAST_16
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAwMS8wNy8yMDI1IMOgIDIxOjQ0LCBKdWxpZW4gT2xpdmFp
biB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gZ2NjIDE1IHdhcyBpbnRyb2R1Y2VkIGluIEJ1
aWxkcm9vdCBpbiBjb21taXQgWzFdLgo+IAo+IEluIEJ1aWxkcm9vdCwgYSB1c2VyIGNyZWF0ZXMg
YSBidWlsZCBjb25maWd1cmF0aW9uIGluIEtjb25maWcKPiBtZW51cyBieSBzZWxlY3RpbmcgdGhl
IENQVSBhcmNoaXRlY3R1cmUgYW5kIENQVSBmaXJzdCwgdGhlbgo+IGEgdG9vbGNoYWluIHRoYXQg
c3VwcG9ydCB0aGlzIENQVSwgdGhlbiBwYWNrYWdlcyBhbmQgc3lzdGVtCj4gY29uZmlndXJhdGlv
bi4KPiAKPiBUbyBtYWtlIHN1cmUgdGhvc2UgS2NvbmZpZyBtZW51cyBhbmQgY2hvaWNlcyBiZWhh
dmUgY29ycmVjdGx5IGluIHRoYXQKPiBvcmRlciwgd2UgdXNlIGEgbG9naWMgaW4gd2hpY2ggYSBD
UFUgc2VsZWN0cyB0aGUgS2NvbmZpZyBzeW1ib2wKPiBCUjJfQVJDSF9ORUVEU19HQ0NfQVRfTEVB
U1RfTiAod2l0aCBOIGJlaW5nIHRoZSBuZWVkZWQgZ2NjIHZlcnNpb24pLgo+IFRoZW4sIHRvIG1h
a2Ugc3VyZSB1bnN1cHBvcnRlZCBnY2MgdmVyc2lvbiBhcmUgaGlkZGVuIGZvciBhIHNlbGVjdGVk
Cj4gQ1BVLCBhIGdjYyB2ZXJzaW9uIE4gaGFzIGluIGZhY3QgYSAiZGVwZW5kcyBvbgo+ICFCUjJf
QVJDSF9ORUVEU19HQ0NfQVRfTEVBU1RfKE4rMSkiLiBGb3IgZXhhbXBsZSwgQ29ydGV4LUE3MTAg
bmVlZHMKPiBhdCBsZWFzdCBnY2MgMTIuIFNlZSBbMl0gYW5kIFszXS4KPiAKPiBUaGlzIG1lYW5z
IHRoYXQgd2hlbiB3ZSBpbnRyb2R1Y2UgdGhlIGxhdGVzdCBnY2MgdmVyc2lvbiB3aXRoIHRoaXMK
PiBsb2dpYyBpbiBwbGFjZSwgd2UgYWxyZWFkeSBuZWVkIHRoaXMgQlIyX0FSQ0hfTkVFRFNfR0ND
X0FUX0xFQVNUXyhOKzEpCj4gc3ltYm9sIGRlZmluZWQuIERvaW5nIHNvIGlzIGRlc2lyYWJsZSB0
byBhdm9pZCBmb3JnZXR0aW5nIHRvIGFkZCBpdAo+IGxhdGVyLiBTZWUgZm9yIGV4YW1wbGUgY29t
bWl0IFs0XSwgYWRkaW5nIHRob3NlIG1pc3NpbmcgZGVwZW5kZW5jaWVzCj4gZm9yIGdjYyAxMyBh
bmQgMTQuCj4gCj4gU2luY2UgaW4gQnVpbGRyb290IHdlIGN1cnJlbnRseSBrZWVwIDMgYWN0aXZl
bHkgbWFpbnRhaW5lZCBnY2MKPiB2ZXJzaW9ucywgYWRkaW5nIGEgbmV3IGdjYyB2ZXJzaW9uIE4g
aW4gQnVpbGRyb290IHNob3VsZDoKPiAtIGFkZCB0aGUgQlIyX0FSQ0hfTkVFRFNfR0NDX0FUX0xF
QVNUXyhOKzEpIHN5bWJvbAo+IC0gYWRkIHBhY2thZ2UvZ2NjIE4KPiAtIHN3aXRjaCB0aGUgZGVm
YXVsdCBnY2MgZnJvbSBOLTIgdG8gTi0xCj4gLSBkcm9wIHBhY2thZ2UvZ2NjIE4tMwoKV2hpbGUg
YWRkaW5nIGEgbmV3IGdjYyB2ZXJzaW9uLCB3ZSBhbHNvIG5lZWQgdG8gdGFrZSBpbnRvIGFjY291
bnQKdG9vbGNoYWluLWV4dGVybmFsLWN1c3RvbSAoQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9HQ0Nf
eHgpIGFuZCB0b29sY2hhaW4KKEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUX3h4KSBwYWNrYWdl
cyB0byBjb21wbGV0ZSB0aGlzIHVwZGF0ZSBwcm9jZXNzLgoKQWN0dWFsbHkgYWxzbyBuZWVkIHRv
IGNoZWNrIGlmIGV4aXN0aW5nIGNvbXBpbGVyIGJ1ZyBzdGlsbCBhcHBseSB3aXRoIHRoZSBuZXcK
Z2NjIHZlcnNpb24gKEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfeHh4eCkgZXRjLi4uCgpNYXli
ZSB3ZSBoYXZlIHRvIHdyaXRlIGluIHRoZSBtYW51YWwgdGhpcyBnY2MgdXBkYXRlIGNoZWNrbGlz
dC4KCkZvciBub3csIEknbSBmaW5lIHdpdGggeW91ciBjb21taXQgbG9nLgoKCkFwcGxpZWQgdG8g
bWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gVGhlbiwgb25jZSB0
aGlzIG5ldyBnY2MgTiBpcyBhZGRlZCwgbmV3IENQVXMgc3VwcG9ydGVkIGJ5IHRoYXQgdmVyc2lv
bgo+IGNhbiBiZSBpbnRyb2R1Y2VkLCBieSBzZWxlY3RpbmcgQlIyX0FSQ0hfTkVFRFNfR0NDX0FU
X0xFQVNUX04uCj4gCj4gQWxsIHRoaXMgbG9naWMgd2lsbCBiZSByZWFkeSBmb3IgZnV0dXJlIGdj
YyB2ZXJzaW9ucy4gVGhpcyB3YXMgYWxzbwo+IGRlc2NyaWJlZCBpbiBjb21taXQgbG9nIFs1XS4K
PiAKPiBUaGlzIGNvbW1pdCBzaW1wbHkgYWRkcyB0aGUgQlIyX0FSQ0hfTkVFRFNfR0NDX0FUX0xF
QVNUXzE2IHN5bWJvbC4KPiAKPiBJdCBpcyB3b3J0aCBtZW50aW9uaW5nIHRoYXQsIGF0IHRoZSB0
aW1lIG9mIHRoaXMgY29tbWl0LCBnY2MgMTYgaXMgbm90Cj4gcmVsZWFzZWQgeWV0LiBUaGlzIHJl
bGVhc2UgbnVtYmVyIDE2IGlzIGFscmVhZHkga25vd24sIHRob3VnaC4gU2VlIFs2XS4KPiAKPiBG
b3IgcmVmZXJlbmNlLCB0aGlzIHdhcyBkaXNjdXNzZWQgaW4gWzddLgo+IAo+IFsxXSBodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvNzU4OTEzOTdhYmU2
MGRiZTNkODJhMWVjMzk2NTRmZjgxZDFiMTQwNgo+IFsyXSBodHRwczovL2dpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjUuMDUvYXJjaC9Db25maWcuaW4uYXJtI0w1
MTQKPiBbM10gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxv
Yi8yMDI1LjA1L3BhY2thZ2UvZ2NjL0NvbmZpZy5pbi5ob3N0I0wyNwo+IFs0XSBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvNmYyMzFkMzAwMzUwMjI4
MjcxMGEwZGE3ZWNkOTgzNDRlYzg2ODA5NQo+IFs1XSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRy
b290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZWFiMTdkNzYzYzZjYTFiZjc0NzQ5ZTNhNzkzZmQw
NDRiNWU2ZDQ1Nwo+IFs2XSBodHRwczovL2djYy5nbnUub3JnL2djYy0xNi9jaGFuZ2VzLmh0bWwK
PiBbN10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290Lzg3N2MwdjFzbjEuZnNmQGRl
bGwuYmUuNDhlcnMuZGsvVC8jbTQ1Njg4ZTI1NjMyNDAxMDI5ZTRjMGQ5ODkwNzJlMWQzZTFhNTk4
NTQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IC0t
LQo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gLSBtZW50aW9uIGJ1aWxkcm9vdCBjb21taXQgZWFiMTdk
NzYgaW4gY29tbWl0IGxvZywgd2hpY2ggYWxyZWFkeQo+ICAgZGVzY3JpYmVkIHRoaXMgdG9waWMu
Cj4gLS0tCj4gIGFyY2gvQ29uZmlnLmluIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4gYi9hcmNoL0NvbmZp
Zy5pbgo+IGluZGV4IDZiNTRjNjVkZjkuLmZhOGZlMGY1YWMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9D
b25maWcuaW4KPiArKysgYi9hcmNoL0NvbmZpZy5pbgo+IEBAIC0zMTEsNiArMzExLDEwIEBAIGNv
bmZpZyBCUjJfQVJDSF9ORUVEU19HQ0NfQVRfTEVBU1RfMTUKPiAgCWJvb2wKPiAgCXNlbGVjdCBC
UjJfQVJDSF9ORUVEU19HQ0NfQVRfTEVBU1RfMTQKPiAgCj4gK2NvbmZpZyBCUjJfQVJDSF9ORUVE
U19HQ0NfQVRfTEVBU1RfMTYKPiArCWJvb2wKPiArCXNlbGVjdCBCUjJfQVJDSF9ORUVEU19HQ0Nf
QVRfTEVBU1RfMTUKPiArCj4gICMgVGhlIGZvbGxvd2luZyBzdHJpbmcgdmFsdWVzIGFyZSBkZWZp
bmVkIGJ5IHRoZSBpbmRpdmlkdWFsCj4gICMgQ29uZmlnLmluLiRBUkNIIGZpbGVzCj4gIGNvbmZp
ZyBCUjJfQVJDSAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
