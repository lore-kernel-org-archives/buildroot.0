Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D312C87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 18:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C804640EE9;
	Sun, 10 Aug 2025 18:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCxQY2XZPA27; Sun, 10 Aug 2025 18:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD33540ECE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD33540ECE;
	Sun, 10 Aug 2025 18:43:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8207531
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73F1160FA9
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4YMDRTrRWq8 for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 18:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A2B360600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A2B360600
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A2B360600
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:42:58 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-458ba079338so28604805e9.1
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 11:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754851376; x=1755456176;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WLCWfQT15QnilQnvRAajSPDtRUfPo0oO2R7RldHlnNY=;
 b=SbrhlgD64+yWmrdXO6BAuVTIkWF7i/aiP10KlRqns2sclyv3YbVX47qFq0qUJe3ytd
 ARBVF3Yc/aFnBv+6Bdk7IO2gTOhyU7Avw9z0uNU455jAkOC0l4XmzKFmxNVSuUhZ50eo
 wOYN4YGlVVnEda1WTs5LjwdBqmHyk79t+A0bK1DnyIH5BosWjxQodzWNlC1yTOgp3/Dn
 sBATXiJRBzSXfXvIRL9eCyhZb4ssQnUvaoYkQA9s4jY4RHm9FKrvdQG4xxxp4pOXiDKT
 8bMbIQwnaqomYAB9zOv/qJ/AQrXs7wUWTiwBr8tCCfOZhYVTs5v692Ny7Ea5zSO/xnGf
 0Nsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfdil5zwU7J8hYIzTe+O4qUxAQonaAU/Ta8NufQtGvLfyaaq+WXdUYB81ny8gzYDDGO4nHWT/Zff0=@buildroot.org
X-Gm-Message-State: AOJu0Yx9ZS7KsyKA0hwKwo0wq6nElWJcMNWpmZF6G9QUs2neI6kA1VBu
 6WRJGw+ZHyNsbrglioypIbkgOnanLii/nLXvi4l9RXlVVXRGBSYehuuT1+vmSxU6POU=
X-Gm-Gg: ASbGncuIWQtoXZBXjJ7mzekp3aftJ8vOyc7mJtlgfFQDGqn6MRvoT/5XwmkIwV21SP0
 hB5z0reSdEurfolkPl1CIdNHoGMzvseVUKgsOpmFNAAhWTqTlTrO7YrPG+o5Bl4YD9VRK1GDrJk
 LNVsENGZmRUSGIsmkSaVi0MZMhQhSGizuDequs5s/uRpaZKCXbhKDaVK6BO0sQTHiHTEgL/UO2C
 Gh1MpDehx/cG+3wXNTujfP/gzWDU003hhvYC6/xqg7pR8wcLg3vdYy9NODavOLLMQ+l23OIWrnx
 a1OfF6V28c8i0bdlu01E7Vit6bqEICRt3z3Ud1KOd4oKo7rY/myrBsU+v3UjzOFVq/7qPueKjlS
 9dRKGj8PHIxe8qd5rznLsRl/HYDPTnci5vD2ICIj6rqKPwKh2wg7JlYYeEAAcyN/v8p/zibPdKO
 tl/mFhwa6dpS5d0VYnkLibrSzeZn6Y+FD+RjPAupNyuxfH5lmLSB182q4K5BXZ
X-Google-Smtp-Source: AGHT+IEY7Tw2lJhegyg0cykQgw1UTZTNZ3TLJyhMoLBGE1ZP9N5OQ7CZnCHmKCBhNpICnn2NmyBTFw==
X-Received: by 2002:a05:600c:c0cb:b0:459:dbc2:201e with SMTP id
 5b1f17b1804b1-459ef788b99mr71620775e9.9.1754851376175; 
 Sun, 10 Aug 2025 11:42:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5c84b8csm123316525e9.4.2025.08.10.11.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 11:42:55 -0700 (PDT)
Message-ID: <e7f0be5f-50d8-4c63-970a-a3211702a431@smile.fr>
Date: Sun, 10 Aug 2025 20:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yegorslists@googlemail.com, buildroot@buildroot.org
Cc: Daniel Sangue <daniel.sangue@sangue.ch>
References: <20250602101435.764559-1-yegorslists@googlemail.com>
Content-Language: fr
In-Reply-To: <20250602101435.764559-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754851376; x=1755456176; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WLCWfQT15QnilQnvRAajSPDtRUfPo0oO2R7RldHlnNY=;
 b=WPSrOIUJi2MU4WF8BSnhqfeYeVpOX5/Yo4w106DtC0TKfLxfrTogpiPScU/H1ooPif
 WAmTFTdbJLe7+2YQEPZyYS206Cf1C+5Ksa9nACgwRz1r+TfdDurnFURPFr9FiuTvqIGr
 FvtZ8Ha2h+D6766GOgAkJZGW+XFUtPmwZ2mCY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=WPSrOIUJ
Subject: Re: [Buildroot] [PATCH] package/libftdi1: fix static building
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

SGVsbG8gWWVnb3IsIEFsbCwKCkxlIDAyLzA2LzIwMjUgw6AgMTI6MTQsIHllZ29yc2xpc3RzQGdv
b2dsZW1haWwuY29tIGEgw6ljcml0wqA6Cj4gRnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xp
c3RzQGdvb2dsZW1haWwuY29tPgo+IAo+IFJlc3RvcmUgdGhlIGZvbGxvd2luZyBwYXRjaCwgYXMg
dGhlIHVwc3RyZWFtIHN0aWxsIGNhbm5vdCBwcm9kdWNlIHN0YXRpYwo+IG9ubHkgbGlicmFyaWVz
Ogo+IAo+IDAwMDEtY21ha2UtdXNlLXRoZS1zdGFuZGFyZC1DTWFrZS1mbGFnLXRvLWRyaXZlLXRo
ZS1zaGFyZS5wYXRjaAo+IAo+IEZpeGVzOgo+IAo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5vcmcvcmVzdWx0cy8wNzc0NGI2N2I1M2QyYjI1ZTc4ZTBmNjFiNTExYTM0MjY3N2UyYWJiLwo+
IAo+IFNpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWls
LmNvbT4KPiAtLS0KPiAgLi4uYW5kYXJkLUNNYWtlLWZsYWctdG8tZHJpdmUtdGhlLXNoYXJlLnBh
dGNoIHwgOTMgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOTMgaW5zZXJ0
aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJmdGRpMS8wMDAxLWNtYWtl
LXVzZS10aGUtc3RhbmRhcmQtQ01ha2UtZmxhZy10by1kcml2ZS10aGUtc2hhcmUucGF0Y2gKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJmdGRpMS8wMDAxLWNtYWtlLXVzZS10aGUtc3RhbmRh
cmQtQ01ha2UtZmxhZy10by1kcml2ZS10aGUtc2hhcmUucGF0Y2ggYi9wYWNrYWdlL2xpYmZ0ZGkx
LzAwMDEtY21ha2UtdXNlLXRoZS1zdGFuZGFyZC1DTWFrZS1mbGFnLXRvLWRyaXZlLXRoZS1zaGFy
ZS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uODU2NTg3
YjdhNgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2xpYmZ0ZGkxLzAwMDEtY21ha2Ut
dXNlLXRoZS1zdGFuZGFyZC1DTWFrZS1mbGFnLXRvLWRyaXZlLXRoZS1zaGFyZS5wYXRjaAo+IEBA
IC0wLDAgKzEsOTMgQEAKPiArRnJvbSBiMGVhNTc3M2M5MGUzNjY1NGRhMzc1NjJhMDNlNjJkOWE2
NjU3NWJmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBTYW11ZWwgTWFydGluIDxz
Lm1hcnRpbjQ5QGdtYWlsLmNvbT4KPiArRGF0ZTogU3VuLCAyNSBKYW4gMjAxNSAwOTo0NTowNCAr
MDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIGNtYWtlOiB1c2UgdGhlIHN0YW5kYXJkIENNYWtlIGZs
YWcgdG8gZHJpdmUgdGhlIHNoYXJlZCBvYmplY3QKPiArIGJ1aWxkCj4gKwo+ICtSZW1vdmUgdGhl
IFNUQVRJQ0xJQlMgQ01ha2Ugb3B0aW9uIChhbmQgdGhlIGNvZGUgaGFuZGxpbmcgaXQpIGFuZCBs
ZXQKPiArdGhlIHN0YW5kYXJkIENNYWtlIGZsYWdzIGRyaXZlIHRoZSBzaGFyZWQgb2JqZWN0IGJ1
aWxkLgo+ICsKPiArU2lnbmVkLW9mZi1ieTogU2FtdWVsIE1hcnRpbiA8cy5tYXJ0aW40OUBnbWFp
bC5jb20+Cj4gK1tGYWJyaWNlOiB1cGRhdGUgZm9yIDEuNV0KPiArU2lnbmVkLW9mZi1ieTogRmFi
cmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgpjaGVjay1wYWNrYWdl
IHdhcm4gZHVlIHRvIG1pc3NpbmcgVXBzdHJlYW06IHRhZy4KCldBUk5JTkc6CnBhY2thZ2UvbGli
ZnRkaTEvMDAwMS1jbWFrZS11c2UtdGhlLXN0YW5kYXJkLUNNYWtlLWZsYWctdG8tZHJpdmUtdGhl
LXNoYXJlLnBhdGNoOjA6Cm1pc3NpbmcgVXBzdHJlYW0gaW4gdGhlIGhlYWRlcgoKV2hhdCdzIHRo
ZSB1cHN0cmVhbSBzdGF0dXMgb2YgdGhpcyBwYXRjaD8gbm90IGFwcGxpY2FibGU/CgpCZXN0IHJl
Z2FyZHMsClJvbWFpbgoKCj4gKy0tLQo+ICsgQ01ha2VPcHRpb25zLnR4dCAgICAgIHwgIDEgLQo+
ICsgZnRkaXBwL0NNYWtlTGlzdHMudHh0IHwgMTQgKy0tLS0tLS0tLS0tLS0KPiArIHNyYy9DTWFr
ZUxpc3RzLnR4dCAgICB8IDEzICstLS0tLS0tLS0tLS0KPiArIDMgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKPiArCj4gK2RpZmYgLS1naXQgYS9DTWFrZU9w
dGlvbnMudHh0IGIvQ01ha2VPcHRpb25zLnR4dAo+ICtpbmRleCAwN2I1ODg3Li5iNzgwZmZkIDEw
MDY0NAo+ICstLS0gYS9DTWFrZU9wdGlvbnMudHh0Cj4gKysrKyBiL0NNYWtlT3B0aW9ucy50eHQK
PiArQEAgLTEsNCArMSwzIEBACj4gKy1vcHRpb24gKCBTVEFUSUNMSUJTICJCdWlsZCBzdGF0aWMg
bGlicmFyaWVzIiBPTiApCj4gKyBvcHRpb24gKCBCVUlMRF9URVNUUyAiQnVpbGQgdW5pdCB0ZXN0
cyB3aXRoIEJvb3N0IFVuaXQgVGVzdCBmcmFtZXdvcmsiIE9GRiApCj4gKyBvcHRpb24gKCBET0NV
TUVOVEFUSU9OICJHZW5lcmF0ZSBBUEkgZG9jdW1lbnRhdGlvbiB3aXRoIERveHlnZW4iIE9GRiAp
Cj4gKyBvcHRpb24gKCBFWEFNUExFUyAiQnVpbGQgZXhhbXBsZSBwcm9ncmFtcyIgT04gKQo+ICtk
aWZmIC0tZ2l0IGEvZnRkaXBwL0NNYWtlTGlzdHMudHh0IGIvZnRkaXBwL0NNYWtlTGlzdHMudHh0
Cj4gK2luZGV4IDM2MGE4MzEuLmRmODg1NjkgMTAwNjQ0Cj4gKy0tLSBhL2Z0ZGlwcC9DTWFrZUxp
c3RzLnR4dAo+ICsrKysgYi9mdGRpcHAvQ01ha2VMaXN0cy50eHQKPiArQEAgLTExLDcgKzExLDcg
QEAgaW5jbHVkZV9kaXJlY3RvcmllcyhCRUZPUkUgJHtDTUFLRV9DVVJSRU5UX0JJTkFSWV9ESVJ9
Cj4gKyBpbmNsdWRlX2RpcmVjdG9yaWVzKCR7Qm9vc3RfSU5DTFVERV9ESVJTfSkKPiArIAo+ICsg
IyBTaGFyZWQgbGlicmFyeQo+ICstYWRkX2xpYnJhcnkoZnRkaXBwMSBTSEFSRUQgJHtjcHBfc291
cmNlc30pCj4gKythZGRfbGlicmFyeShmdGRpcHAxICR7Y3BwX3NvdXJjZXN9KQo+ICsgCj4gKyBt
YXRoKEVYUFIgVkVSU0lPTl9GSVhVUCAiJHtNQUpPUl9WRVJTSU9OfSArIDEiKSAgICAjIENvbXBh
dGliaWxpdHkgd2l0aCBwcmV2aW91cyByZWxlYXNlcwo+ICsgc2V0X3RhcmdldF9wcm9wZXJ0aWVz
KGZ0ZGlwcDEgUFJPUEVSVElFUyBWRVJTSU9OICR7VkVSU0lPTl9GSVhVUH0uJHtNSU5PUl9WRVJT
SU9OfS4wIFNPVkVSU0lPTiAzKQo+ICtAQCAtMjgsMTggKzI4LDYgQEAgaW5zdGFsbCAoIFRBUkdF
VFMgZnRkaXBwMQo+ICsgICAgICAgICAgIEFSQ0hJVkUgREVTVElOQVRJT04gJHtDTUFLRV9JTlNU
QUxMX0xJQkRJUn0KPiArICkKPiArIAo+ICstIyBTdGF0aWMgbGlicmFyeQo+ICstaWYgKCBTVEFU
SUNMSUJTICkKPiArLSAgYWRkX2xpYnJhcnkoZnRkaXBwMS1zdGF0aWMgU1RBVElDICR7Y3BwX3Nv
dXJjZXN9KQo+ICstICBzZXRfdGFyZ2V0X3Byb3BlcnRpZXMoZnRkaXBwMS1zdGF0aWMgUFJPUEVS
VElFUyBPVVRQVVRfTkFNRSAiZnRkaXBwMSIpCj4gKy0gIHNldF90YXJnZXRfcHJvcGVydGllcyhm
dGRpcHAxLXN0YXRpYyBQUk9QRVJUSUVTIENMRUFOX0RJUkVDVF9PVVRQVVQgMSkKPiArLQo+ICst
ICBpbnN0YWxsICggVEFSR0VUUyBmdGRpcHAxLXN0YXRpYwo+ICstICAgICAgICAgICAgQVJDSElW
RSBERVNUSU5BVElPTiAke0NNQUtFX0lOU1RBTExfTElCRElSfQo+ICstICAgICAgICAgICAgQ09N
UE9ORU5UIHN0YXRpY2xpYnMKPiArLSAgKQo+ICstZW5kaWYgKCkKPiArLQo+ICsgaW5zdGFsbCAo
IEZJTEVTICR7Y3BwX2hlYWRlcnN9Cj4gKyAgICAgICAgICAgREVTVElOQVRJT04gaW5jbHVkZS8k
e1BST0pFQ1RfTkFNRX0KPiArICAgICAgICAgICBDT01QT05FTlQgaGVhZGVycwo+ICtkaWZmIC0t
Z2l0IGEvc3JjL0NNYWtlTGlzdHMudHh0IGIvc3JjL0NNYWtlTGlzdHMudHh0Cj4gK2luZGV4IGUx
NDVhZjEuLmNhN2VmYTQgMTAwNjQ0Cj4gKy0tLSBhL3NyYy9DTWFrZUxpc3RzLnR4dAo+ICsrKysg
Yi9zcmMvQ01ha2VMaXN0cy50eHQKPiArQEAgLTIxLDcgKzIxLDcgQEAgY29uZmlndXJlX2ZpbGUo
ZnRkaV92ZXJzaW9uX2kuaC5pbiAiJHtDTUFLRV9DVVJSRU5UX0JJTkFSWV9ESVJ9L2Z0ZGlfdmVy
c2lvbl9pLmgKPiArIHNldChjX3NvdXJjZXMgICAgICR7Q01BS0VfQ1VSUkVOVF9TT1VSQ0VfRElS
fS9mdGRpLmMgJHtDTUFLRV9DVVJSRU5UX1NPVVJDRV9ESVJ9L2Z0ZGlfc3RyZWFtLmMgQ0FDSEUg
SU5URVJOQUwgIkxpc3Qgb2YgYyBzb3VyY2VzIiApCj4gKyBzZXQoY19oZWFkZXJzICAgICAke0NN
QUtFX0NVUlJFTlRfU09VUkNFX0RJUn0vZnRkaS5oIENBQ0hFIElOVEVSTkFMICJMaXN0IG9mIGMg
aGVhZGVycyIgKQo+ICsgCj4gKy1hZGRfbGlicmFyeShmdGRpMSBTSEFSRUQgJHtjX3NvdXJjZXN9
KQo+ICsrYWRkX2xpYnJhcnkoZnRkaTEgJHtjX3NvdXJjZXN9KQo+ICsgCj4gKyBtYXRoKEVYUFIg
VkVSU0lPTl9GSVhVUCAiJHtNQUpPUl9WRVJTSU9OfSArIDEiKSAgICAjIENvbXBhdGliaWxpdHkg
d2l0aCBwcmV2aW91cyByZWxlYXNlcwo+ICsgc2V0X3RhcmdldF9wcm9wZXJ0aWVzKGZ0ZGkxIFBS
T1BFUlRJRVMgVkVSU0lPTiAke1ZFUlNJT05fRklYVVB9LiR7TUlOT1JfVkVSU0lPTn0uMCBTT1ZF
UlNJT04gMikKPiArQEAgLTM4LDE3ICszOCw2IEBAIGluc3RhbGwgKCBUQVJHRVRTIGZ0ZGkxCj4g
KyAgICAgICAgICAgQVJDSElWRSBERVNUSU5BVElPTiAke0NNQUtFX0lOU1RBTExfTElCRElSfQo+
ICsgKQo+ICsgCj4gKy1pZiAoIFNUQVRJQ0xJQlMgKQo+ICstICBhZGRfbGlicmFyeShmdGRpMS1z
dGF0aWMgU1RBVElDICR7Y19zb3VyY2VzfSkKPiArLSAgdGFyZ2V0X2xpbmtfbGlicmFyaWVzKGZ0
ZGkxLXN0YXRpYyAke0xJQlVTQl9MSUJSQVJJRVN9KQo+ICstICBzZXRfdGFyZ2V0X3Byb3BlcnRp
ZXMoZnRkaTEtc3RhdGljIFBST1BFUlRJRVMgT1VUUFVUX05BTUUgImZ0ZGkxIikKPiArLSAgc2V0
X3RhcmdldF9wcm9wZXJ0aWVzKGZ0ZGkxLXN0YXRpYyBQUk9QRVJUSUVTIENMRUFOX0RJUkVDVF9P
VVRQVVQgMSkKPiArLSAgaW5zdGFsbCAoIFRBUkdFVFMgZnRkaTEtc3RhdGljCj4gKy0gICAgICAg
ICAgICBBUkNISVZFIERFU1RJTkFUSU9OICR7Q01BS0VfSU5TVEFMTF9MSUJESVJ9Cj4gKy0gICAg
ICAgICAgICBDT01QT05FTlQgc3RhdGljbGlicwo+ICstICApCj4gKy1lbmRpZiAoKQo+ICstCj4g
KyBpbnN0YWxsICggRklMRVMgJHtjX2hlYWRlcnN9Cj4gKyAgICAgICAgICAgREVTVElOQVRJT04g
aW5jbHVkZS8ke1BST0pFQ1RfTkFNRX0KPiArICAgICAgICAgICBDT01QT05FTlQgaGVhZGVycwo+
ICstLSAKPiArMi4zNC4xCj4gKwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
