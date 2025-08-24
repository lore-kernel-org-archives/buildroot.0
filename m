Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38A6CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 14:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C517383BBA;
	Sun, 24 Aug 2025 14:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pe4s9L7mVTvY; Sun, 24 Aug 2025 14:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A29483DB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A29483DB8;
	Sun, 24 Aug 2025 14:41:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B823CA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E62BD405E4
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcuAA4z2Z__s for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 14:41:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9F36400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9F36400D6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9F36400D6
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:41:19 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45b5d49ae47so1752435e9.0
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 07:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756046478; x=1756651278;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J6KaBeWeyn1++ZBCNKZXtd3lNb+GoJbtdH/stBGa6Po=;
 b=mSHxC3GmoBHc3T2oH1qO2lCL8rGRgo0ao4hm8O/aUHE4Q1kAZYUrDi2juk3LC6mraM
 o6lhI1sV2+xs4hyBxyJzLCpfmbX0PIRu1mqsRbECuYfaVhD+tzH0u1wVp3gaHCI90dCX
 HES2BAQxRPknq6i95kLqiyKqUCQ6Q+SLr5+EkaGbhevK3s57XM+zLuSrIUg2FFEkS06V
 kZijsM45Dq2VUIZ6CGyICyRtpxlVUk8gOmnaS7sspejnlmhX0nrImka4LivNfrO3u73y
 DTIP2vTRp7iNMPtAHlw8sHRSQ82SFLEM6SVsfQA0xTGgDf9V3fDiFyqG8FBinQJRUrjK
 D02A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRqfLwuzbqvANZLyM2M016b6x9ZJUmulN1s4L0zCyx8QQuRai9FNx6Wt1GfscxuwAvcXqIsrp3qFg=@buildroot.org
X-Gm-Message-State: AOJu0YweD5yNxVUSdwRvEAqgGDwgm88KbMP/5XAOowkUFPV/GRuZHGf6
 KSVgLU2+kkGajVfRJ+5DOYXNh86ukwEuN2JywA0I8lnrtw6/SRACr+Sg9ZazUnV4p7N96qvIdWg
 RV35K
X-Gm-Gg: ASbGncvmj0atwuD9gbh62Ri1cdiXewz31+MXl3mjwoaN2g67HEexXAHhfaR8lqvQPxq
 wscmk9mwOHHaY7pmS4kXLKmf7YJdhuGqI9Ndii7c8VjNEgaLX3UiQgXhCTN+JT8XUJi60Dle6AP
 HeHCDDhMEWpgpzQerBj3EtUe5djssFjOBG/mCSGQldqNei4l6Caxshe1mY8J8hlUgwchdl/6uxs
 2qKnPpV8FyoxX28MxsS8h9oay5lQ2sn+23yOIGlL8A3MQUNM6eUH2XrAqGPqG0Yj6RLvf2NsUhE
 BH8eAj4mawSZyl1GFEMSw4kQchp3f9UKZSkaxQ/pso6eYq+1SkA/AQ3/z62nBK4QnnZOiVyXuZs
 GrZDa9BU2CHShmbP3VOuwbVNMaQYcmhpFjKt8F8erJQIP74Vz8pv7wXwZ5Zp8XdH9yh/MwpMZcG
 pp/TKis6Pn5ZGCI+4lmdeLucvxrgw49jcclfDoforjx6eAishWGQCR9Bz32/S9
X-Google-Smtp-Source: AGHT+IHVvPqlzZUQ8++cEegnGUSQB0GhxR0KabkfWCZLgPzhD10StZ+H8ZBl3fQVX49IbhV3wXirtw==
X-Received: by 2002:a05:6000:3105:b0:3b7:886b:fb76 with SMTP id
 ffacd0b85a97d-3c5da83b893mr7809774f8f.12.1756046477716; 
 Sun, 24 Aug 2025 07:41:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b4e8f4552sm77034745e9.8.2025.08.24.07.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 07:41:17 -0700 (PDT)
Message-ID: <25600b94-4bf4-4be0-a446-e36114c8f38e@smile.fr>
Date: Sun, 24 Aug 2025 16:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250725184609.3794-1-fl@n621.de>
 <20250728225205.2c22044b@windsurf> <20250728212043.uxfacpm3fovokhcq@n621.de>
 <3b344658-7e1d-43e9-89bf-c776ba0c39b6@smile.fr>
 <20250810181749.43yrkmkud44pxwib@n621.de>
Content-Language: fr, en-US
In-Reply-To: <20250810181749.43yrkmkud44pxwib@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756046478; x=1756651278; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J6KaBeWeyn1++ZBCNKZXtd3lNb+GoJbtdH/stBGa6Po=;
 b=sXNebr0j7bgGc8Ekjo1fCw6DzN/cLtCFf2nc2AxVZ1VK1MqMQ73WjusTmR5ctStdze
 JToubMwfsXyIFD+aPo3DU8t9oJyjikWlldujdxTf4hOJtUaNA8Xouyb+uoTJ2zD6zbI8
 VH1etBcPyPLmsYVIEGjQWoGeCoMJVjHRkH0x0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=sXNebr0j
Subject: Re: [Buildroot] [PATCH 1/1] package/libmbus: switch to git repo
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

SGVsbG8gRmxvcmlhbiwKCkxlIDEwLzA4LzIwMjUgw6AgMjA6MTcsIEZsb3JpYW4gTGFyeXNjaCBh
IMOpY3JpdMKgOgo+IEhlbGxvIFJvbWFpbiwKPiAKPiBPbiBTdW4sIEF1ZyAxMCwgMjAyNSBhdCAw
ODowMDo1OFBNICswMjAwLCBSb21haW4gTmFvdXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4gV2Vs
bCwgYSB3b3JraW5nIGxpbmsgaXMgYmV0dGVyIHRoYW4gYSBicm9rZW4gb25lLgo+IAo+IEZhaXIu
IEknbGwgY2hhbmdlIGl0Lgo+IAo+PiBBY3R1YWxseSB0aGVyZSBpcyBhIG5ldyByZWxlYXNlIDAu
OS4wIGZyb20gMjAxOQo+IAo+IFllYWggSSB3YW50ZWQgdG8gc2VwYXJhdGUgdGhlIGJ1aWxkIGZp
eCBmcm9tIHRoZSB2ZXJzaW9uIGJ1bXAgc28gdGhhdAo+IHRoZSBmb3JtZXIgY291bGQgYmUgYmFj
a3BvcnRlZCB0byBzdGFibGUgcmVsZWFzZXMuIEkgd2FzIGdvaW5nIHRvIHNlbmQKPiB0aGF0IGFm
dGVyIHRoaXMgZ290IG1lcmdlZC4gQnV0IEkgY2FuIGFsc28gYmF0Y2ggdXAgYm90aCBjaGFuZ2Vz
IGluIGEKPiBzZXJpZXMgaWYgSSdtIGdvaW5nIHRvIHJlc3BpbiBpdCBhbnl3YXkgaWYgdGhhdCdz
IGJldHRlcj8KCklmIHlvdSBhbHNvIGhhdmUgYSBwYXRjaCB3aXRoIHRoZSB2ZXJzaW9uIGJ1bXAs
IHlvdSBjYW4gc2VuZCBib3RoIHBhdGNoZXMgYXMgYQpzZXJpZXMuIFRoaXMgY29tbWl0IGFzIHBh
dGNoIDEvMiBhbmQgdGhlIHZlcnNpb24gYnVtcCBhcyBwYXRjaCAyLzIuCgpQYXRjaCAxLzIgd2ls
bCBnbyB0byBtYXN0ZXIgd2hpbGUgcGF0Y2ggMi8yIHdpbGwgZ28gdG8gbmV4dCBicmFuY2guCgo+
IAo+PiBidXQgaWYgdGhpcyBwYWNrYWdlIGlzIG5vdCB1c2VkIG9yIHVwZGF0ZWQgaXQgY2FuIGJl
IGEgY2FuZGlkYXRlIGZvcgo+PiByZW1vdmFsLgo+IAo+IFRoaXMgZmVlbHMgbGlrZSB0aGUga2lu
ZCBvZiBwYWNrYWdlIHRoYXQgaXMgZ29pbmcgdG8gaGF2ZSBhIG51bWJlciBvZgo+IGRvd25zdHJl
YW0gdXNlcnMgaW4gQnVpbGRyb290LiBBbHNvLCB0aGVyZSBoYXMgYmVlbiBzb21lIGFjdGl2aXR5
IG9uIHRoZQo+IG1hc3RlciBicmFuY2ggcmVjZW50bHlbMV0uIEFsbCBpbiBhbGwgSSdkIGxlYW4g
dG93YXJkcyBrZWVwaW5nIGl0IGFyb3VuZAo+IHVubGVzcyBpdCBjYXVzZXMgZnVydGhlciBwcm9i
bGVtcy4KCk9rLCBmZWVsIGZyZWUgdG8gYWRkIGEgbmV3IGVudHJ5IGluIERFVkVMT1BFUlMgZmls
ZSB0aGVuLgoKSSdsbCBtYXJrIHRoaXMgcGF0Y2ggYXMgIkNoYW5nZXMgcmVxdWVzdGVkIi4KClRo
YW5rcyEKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBGbG9yaWFuCj4gCj4gWzFdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9yc2NhZGEvbGlibWJ1cy9jb21taXRzL21hc3RlcgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
