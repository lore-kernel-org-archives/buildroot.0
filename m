Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794A0E77180
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 16:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43A6040B5F;
	Wed, 11 Dec 2024 16:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKvPAwyEO_fq; Wed, 11 Dec 2024 16:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D89408EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16D89408EC;
	Wed, 11 Dec 2024 16:17:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 010B2ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 16:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D549540928
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 16:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BmnKKR9LfLy7 for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 16:17:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A75E408E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A75E408E1
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A75E408E1
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 16:17:05 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so6522785e9.1
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 08:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733933823; x=1734538623;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dxojMhx41Yheby8bsx5GT6t84YmgaDIdpI923mamoAI=;
 b=nagTspeRXcpoM0XjgRIz7VYfZ5+8vfMRTYekNdJfTBMpTF/dACv2nBum7oknD1KikT
 No4DlyriyYA0Qm4iHuGeU9UOFZSkY7/9Xhv8Dy0X9y98ZTQVZg9CYYqv6NXDKKqmAP6c
 yNhkDNZPGdX8hTNUN4DhgqO0dUA8S7UfbJ/BGnwRtAxTePEtkEqKcyFAfiPXuVTaAPdI
 IV9DqIogFZvForlALOJnB7ub14vg/vOCwC8HO6OxJJt+WHD1koGd6rfMtMmcKX/b2iSZ
 nHBoEH00ZtAaYa1twrDtM8L+V/ca5iEL85BDuQkd9OaySTigBhSDMtyc2Z6p4eRRpbzW
 xFqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhIjA7r2kAUwwDQhP7by4rCl86MogbmYGF0C0C8Gp0BmO1kWCLKQyOIwA+PD0Urh5k7s04VgXcaPw=@buildroot.org
X-Gm-Message-State: AOJu0YxTNrfv4IRXSs6nwzAA1vPuuExCYX72LX4AG/9VMLIUZ1ZdqZcP
 IogDJ0ksuvhbc7EumA4P4JYs4Er7pT6EdnI+wQlKocGrUC8tfPQBQpbzotDxAdpwxEiZtP5D5JH
 PriS3vw==
X-Gm-Gg: ASbGncuaH6XBlxO0IpAb4CViN7FpCl09XNneo63pIzza3rF+eZTXiM/mLZ5Lm738pym
 N+Q9n+/3MnDs57gWtvZi+AcMqg7bvTMAeRx4MfBuRkmFoTJwS1r2qk3xV4CVImHwyN1oTa/MiWG
 l16q0Iep7nQ1JLJjskJ+oVG27sTY8vENRAz2U18wg8s7R2SRHzeIeV8WWHJNqnvzUYj8fwOyuS8
 w4wtRbMeywoN/YYJsa3sznWCMrg0oz9RtHnpqkXRIxWXd+wTJvC/duV9cQ2onPtbMmOr5nPWh3q
 ltFxUZQjjvLCo3hu5PaR9zyJnvwvrhZmuo+Ot9rRSg==
X-Google-Smtp-Source: AGHT+IEZXobZ+RaBuhgzMciSF/fB+Huu3YZ/HY7Hflr1E3WZzQe4uam2bvQ/C02JaZJfJtNa3+3rXw==
X-Received: by 2002:a05:6000:4814:b0:385:e1eb:a7be with SMTP id
 ffacd0b85a97d-38787694c1emr198048f8f.26.1733933823450; 
 Wed, 11 Dec 2024 08:17:03 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38782514e6asm1618660f8f.79.2024.12.11.08.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 08:17:03 -0800 (PST)
Message-ID: <6c4f5ca2-27f4-417b-9ffb-de6d45d61057@smile.fr>
Date: Wed, 11 Dec 2024 17:17:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241117125450.543605-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20241117125450.543605-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733933823; x=1734538623; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dxojMhx41Yheby8bsx5GT6t84YmgaDIdpI923mamoAI=;
 b=NratzXvIaFbdnc+HSoznvT3BMWxXreoPeAdiQsm/XTtWrZmxP2//1aFxt19bVA1dVl
 t1b+A0/Ge4s83TVs9ROkBfzUzSBpbJoR/ZKgBHEcPF/SnUXA/TJr3pkDB4dG41mjbXg4
 SgHIMyVTWR82gkBm572LhrtlJ8ubzRwE1W3sU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=NratzXvI
Subject: Re: [Buildroot] [PATCH next 1/1] package/nettle: update _SITE to
 use BR2_GNU_MIRROR
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAxNy8xMS8yMDI0IMOgIDEzOjU0LCBKdWxpZW4gT2xpdmFp
biBhIMOpY3JpdMKgOgo+IFRoZSBuZXR0bGUgcGFja2FnZSBpcyBkaXN0cmlidXRlZCBvbiB0aGUg
R05VIHByb2plY3Qgc2VydmVycy4gU2VlIFsxXQo+IGFuZCBbMl0uIEJ1aWxkcm9vdCBoYXMgdGhl
IEJSMl9HTlVfTUlSUk9SIGNvbmZpZ3VyYXRpb24gd2hpY2ggY2FuCj4gYmUgdXNlZCBmb3IgdGhh
dCBwdXJwb3NlLiBTZWUgWzNdLgo+IAo+IEZvciBjb25zaXN0ZW5jeSB3aXRoIGFsbCBvdGhlciBH
TlUgcGFja2FnZXMsIHRoaXMgY29tbWl0IHVwZGF0ZXMKPiB0aGUgX1NJVEUgdG8gdXNlIEJSMl9H
TlVfTUlSUk9SLgo+IAo+IE5vdGU6IHRoZSBuZXR0bGUgX1NJVEUgd2FzIHVwZGF0ZWQgdG8gZnRw
LmdudS5vcmcgaW4gY29tbWl0IFs0XS4KPiAKPiBbMV0gaHR0cHM6Ly93d3cubHlzYXRvci5saXUu
c2Uvfm5pc3NlL25ldHRsZS8KPiBbMl0gaHR0cHM6Ly93d3cuZ251Lm9yZy9wcmVwL2Z0cC5odG1s
Cj4gWzNdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2Iv
MjAyNC4wOC4yL0NvbmZpZy5pbiNMMjg2Cj4gWzRdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC85MmYwZWY1ZWFhNzRhZjI4YjJiN2I3YWJiZTAyMWJj
ZTJhYmE0ODc1Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5m
cj4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
LS0tCj4gIHBhY2thZ2UvbmV0dGxlL25ldHRsZS5tayB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bmV0dGxlL25ldHRsZS5tayBiL3BhY2thZ2UvbmV0dGxlL25ldHRsZS5tawo+IGluZGV4IDIyYTQx
YmE1NWIuLjNmMzBmZDc2MWQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9uZXR0bGUvbmV0dGxlLm1r
Cj4gKysrIGIvcGFja2FnZS9uZXR0bGUvbmV0dGxlLm1rCj4gQEAgLTUsNyArNSw3IEBACj4gICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+ICBORVRUTEVfVkVSU0lPTiA9IDMuMTAKPiAtTkVU
VExFX1NJVEUgPSBodHRwczovL2Z0cC5nbnUub3JnL2dudS9uZXR0bGUKPiArTkVUVExFX1NJVEUg
PSAkKEJSMl9HTlVfTUlSUk9SKS9uZXR0bGUKPiAgTkVUVExFX0RFUEVOREVOQ0lFUyA9IGhvc3Qt
bTQgZ21wCj4gIE5FVFRMRV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAgTkVUVExFX0xJQ0VOU0Ug
PSBEdWFsIEdQTC0yLjArL0xHUEwtMy4wKwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
