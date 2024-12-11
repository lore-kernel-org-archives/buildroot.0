Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4809AE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 15:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02F1C409D2;
	Wed, 11 Dec 2024 15:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSuzbQTeC9OV; Wed, 11 Dec 2024 15:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB35A409A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB35A409A9;
	Wed, 11 Dec 2024 15:59:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BF096F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0EA381F87
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqqGo-4BPfBC for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 15:59:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C05E681F5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C05E681F5A
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C05E681F5A
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:59:12 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso5271645e9.1
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 07:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733932751; x=1734537551;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1oIsahjRH3irjz5xwLc1pafSC4uxcsqekSQTlzHN1x4=;
 b=BKdbkdu39U+7+Mjsam9Jt9HU2sjBNddWrBi/oCexj6w15MayowxObYBpWKNv5Pz4Ns
 G69AsxLact1STnNZb0gk2X40X7r/Jo2wwEtWPTWJso0DY7XPAZvOHLgeJS06lgxyAYfl
 2ofNEDWaIKOnf4VFzQGMlWMlp+VIC6lGJNo6LUAJHClpSknDOkhTtC481YICVbp4v3Es
 h+S/W6GSl1IBR1uuW+8OWfolphMkLnJo4dx5aQ/Ipr1XVgKXjuLHdZy/ivIUknUYpjnS
 gF8JuL5CSB3rtIkYW7nqMW6qDLAqscy9RjPBnXrEILaVpEGcXcut8GR96k4Wk7NUHSXK
 ZKhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHePX6dzDs5/Qiv7RuXzYqOQgQW31F4NwoqbU9+hxYy0QZ2SUhL+Mk3FvAwMEIMO+xbfC38OzJ9gc=@buildroot.org
X-Gm-Message-State: AOJu0YxKcsTfp1c6YptpgBtG2V75oxF/Ir92Ro1lgGToEMhuo7cR9RT6
 Cnfd8wQb69I/Y2vg0qEzLRhJ6SXpFwnhwr79FP9qg6GYoI8Q0JXc+9YIjh5uzrV/P2si8lNsoRs
 vSO9fWQ==
X-Gm-Gg: ASbGncuCBgU3BZFkuQYSOFOOY1LQKGYEkYVun7KO5KT6fklijvgbDt7/daNlDKe8BS7
 96q5rXWbM+GZmBESqbI4e8nkP+tkoi/pp0njlPI25lj3QaAwzPSha0A0+0RJ99DKiOcEdx8u7QB
 nYxB7nhlSolftLCIrcXbL+Qq9GdJooYcLKj8o42MMeM8bNymabNlVnNMm32suesGLWWDxVPoCA6
 DPHYm/GevC2mOW4S/uyjCRZxfmx1FdBhFdJCwpMWyIddtGrtgZmC1kNLoNWac/0YgdgEToehKLY
 7M0dv+5NiEANBK/6XDxtR9d6AuBoiE8Sgkxj+OOlrw==
X-Google-Smtp-Source: AGHT+IGTkBn2XTCUv5tVUukugGS58kmCIn+cOEe+mbJGeh71JqqDkNJZiNO6tCZl6cefDC7q+EQ3Ag==
X-Received: by 2002:a05:600c:4d26:b0:434:9f90:2583 with SMTP id
 5b1f17b1804b1-4361c6068fbmr25056755e9.11.1733932750781; 
 Wed, 11 Dec 2024 07:59:10 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38782514e86sm1595464f8f.72.2024.12.11.07.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 07:59:10 -0800 (PST)
Message-ID: <6b2a8846-4a6d-4fe1-bedc-e5eda1cdd4c2@smile.fr>
Date: Wed, 11 Dec 2024 16:59:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241116163537.12530-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20241116163537.12530-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733932751; x=1734537551; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1oIsahjRH3irjz5xwLc1pafSC4uxcsqekSQTlzHN1x4=;
 b=YLZ9gESk00GFFay9F4t8SZ49CBt3Og7VinEWStKZIIii5Z0GUsG9MvMVLZx0tEFd42
 XrkOobUIH9rV22WaDhkBpz4Is34HS7BXAZ+xgaq9t+mGtzPMGyksgnaqgOdN0dS9RVyh
 0Oi4Xgf0lRBoVJVkrYXsK1GDvl1a9FwqIC2iw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=YLZ9gESk
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/boot/test_edk2.py: switch to neoverse-n1 cpu
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

SGVsbG8gSnVsaWVuLAoKTGUgMTYvMTEvMjAyNCDDoCAxNzozNSwgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBUaGUgU0JTQSBSZWZlcmVuY2UgUGxhdGZvcm0gd2FzIHVwZGF0ZWQgdG8gdXNl
IHRoZSBuZW92ZXJzZS1uMSBjcHUKPiAoYXJtdjguMmEpIGluIFFlbXUgdjguMSBbMV0uCj4gCj4g
Q29tbWl0IGM1OGEyYTk2OCAiY29uZmlncy9xZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWc6IHN3
aXRjaCB0bwo+IG5lb3ZlcnNlLW4xIChhcm12OC4yYSkiIFsyXSByZWZsZWN0ZWQgdGhpcyBjaGFu
Z2UgaW4KPiBxZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcuCj4gCj4gVGhpcyBjb21taXQgdXBk
YXRlcyB0aGUJdGVzdF9lZGsyIHJ1bnRpbWUgdGVzdCB0aGUgc2FtZSB3YXkuCj4gCj4gVGhpcyB1
cGRhdGUgaXMgcG9zc2libGUgd2l0aCB0aGUgaGVscCBvZiBjb21taXRzIFszXSBhbmQgWzRdLgo+
IAo+IFsxXSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9jb21taXQvMTg3
NzI3MmJhZDdiMDhiNjczMTI1MDNlZTY2MTg0Mjc5ODc2YzdiZAo+IFsyXSBodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvYzU4YTJhOTY4N2MwNDUzNzlj
MGY3NjhjOGM2YzFjMWE0MTg0MmE4NQo+IFszXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMGQ0MTc3NTk4Y2U3ZTczZjJiOTdhYzU4YzIxZmIxNzcz
NDM2NDNlMwo+IFs0XSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9jb21taXQvZmJhNjJmMmFiMTNjMDk1ZGU4NjBhMDc4NTFkMTQ4MTgxZjRlMzhiYwo+IAo+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+CgpBcHBsaWVkIHRvIG1h
c3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+IFBhdGNoIHRlc3Rl
ZCBpbjoKPiBodHRwczovL2dpdGxhYi5jb20vam9saXZhaW4vYnVpbGRyb290Ly0vam9icy84Mzg4
Njg0MTA3Cj4gLS0tCj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9ib290L3Rlc3RfZWRrMi5weSB8
IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9lZGsyLnB5
IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9lZGsyLnB5Cj4gaW5kZXggMzlkN2E0
ZGJjYy4uNTRhNTkwODlkYSAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9v
dC90ZXN0X2VkazIucHkKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2Vk
azIucHkKPiBAQCAtNyw2ICs3LDcgQEAgY2xhc3MgVGVzdEVkazIoaW5mcmEuYmFzZXRlc3QuQlJU
ZXN0KToKPiAgICAgIGNvbmZpZyA9IFwKPiAgICAgICAgICAiIiIKPiAgICAgICAgICBCUjJfYWFy
Y2g2ND15Cj4gKyAgICAgICAgQlIyX25lb3ZlcnNlX24xPXkKPiAgICAgICAgICBCUjJfVE9PTENI
QUlOX0VYVEVSTkFMPXkKPiAgICAgICAgICBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0i
dHR5QU1BMCIKPiAgICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKPiBAQCAtNjMsNyAr
NjQsNyBAQCBjbGFzcyBUZXN0RWRrMihpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ICAgICAgICAg
IGZsYXNoMSA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgIlNCU0FfRkxB
U0gxLmZkIikKPiAgICAgICAgICBzZWxmLmVtdWxhdG9yLmJvb3QoYXJjaD0iYWFyY2g2NCIsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9wdGlvbnM9WyItTSIsICJzYnNhLXJlZiIsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICItY3B1IiwgImNvcnRleC1hNTci
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiLWNwdSIsICJuZW92ZXJz
ZS1uMSIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICItbSIsICI1MTJN
IiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIi1wZmxhc2giLCBmbGFz
aDAsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICItcGZsYXNoIiwgZmxh
c2gxLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
