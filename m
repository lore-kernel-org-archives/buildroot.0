Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBE5C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 21:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1088B419E1;
	Fri, 12 Jul 2024 21:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mzbpL_yrtDx; Fri, 12 Jul 2024 21:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E014341981
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E014341981;
	Fri, 12 Jul 2024 21:53:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9634A1BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82E83844E3
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNJUwithF9zU for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 21:53:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D69BE844DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D69BE844DF
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D69BE844DF
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 21:53:09 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-36796a9b636so1459104f8f.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720821188; x=1721425988;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qONCuqmU5uiGiPj4fiIY9dpxh49QOANPdUMqR2pgQwc=;
 b=l561lyywDGK07hsMdAO2tPVzIzvJcPjZ3aVU8bPOhzxYxHkFBfO0dWGhQFVEUvlT3k
 kOlaZxmgVzjOe0Rg6LRQJ6rVr7xHUMRH1dUMJpP7yrvneJRcwemTGAZtqYQTff/vJKYG
 nJzQG3fKc9zgjzORutsYx1WysiUTv0nrVJk8aePguyII2ZbZLmLI/2O6xNQG7oLdZWDw
 46GE1yRjAbq2z0PLMZRAlbILe7e7YYqySRud8Vd5sK/mb4UPYzweUD3d2q4W8YCfWBDr
 hAadm00tt3CJljHlbCJeLzuRBCGFkj3IlKxQzrJ0uVcdAK9Hmz9+HqEYEHDr4hv8iYr6
 8B+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPXDoVGRXokcInXkUbFQxcwmpHSTxRGXxtpDb2iCEcYLs1BPDnP2B0CLU78YFeqkdo6XjIILOL4h6pRtyNORP87BCsY8goKA==
X-Gm-Message-State: AOJu0YzWdxfhB6cCVwveK0V6ams/L6wbun22XNnEmGup7J/m2QSuRenB
 olqgKdr5GQeuS4kv4R44Uoy3aeburgej1IKKjJZXtPX+24CDl4Ou0Qn9Kzp2Pfk=
X-Google-Smtp-Source: AGHT+IGzt45GpwVlKVdlKEpsmhVWlviq80QLqZVQU6a/3Pcgl+GGtjn/NKDVTT1eKg0MBOMi+bDFPw==
X-Received: by 2002:a5d:6186:0:b0:367:8aa3:4366 with SMTP id
 ffacd0b85a97d-367cea961a5mr8143643f8f.38.1720821187587; 
 Fri, 12 Jul 2024 14:53:07 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-426740d8c4bsm85990005e9.1.2024.07.12.14.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 14:53:07 -0700 (PDT)
Message-ID: <bf8b544f-85db-43ae-9579-9b4dee1c7643@smile.fr>
Date: Fri, 12 Jul 2024 23:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
 <20240410171211.1633127-2-jeanmichel.hautbois@yoseli.org>
 <20240410215656.1756a37e@windsurf>
 <f85e872c-8d99-4dcf-997e-95d3a382b463@yoseli.org>
 <20240410231711.084c9d7e@windsurf>
 <9b5aee40-4cdb-480c-bd9f-d1bcbe5c57a9@yoseli.org>
 <4ce12a2a-17e5-483a-abdf-5d5cec085875@yoseli.org>
Content-Language: en-US
In-Reply-To: <4ce12a2a-17e5-483a-abdf-5d5cec085875@yoseli.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720821188; x=1721425988; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qONCuqmU5uiGiPj4fiIY9dpxh49QOANPdUMqR2pgQwc=;
 b=iOQSPxcf2p8L6UJ7BVBNhDQe2zWrdnp69Aq8KrVacUW97kqJogxZn0TAyYT3F3C7np
 9i2vNEVSMXABiH0oF980h123A+W44ks7fAlv24apiELde/d5RP3j6ktOeL4Hl1MxtxQQ
 SLOl2Tlq+N/QMvsXTwQl3Ah1+p9xk7CtVxiFs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=iOQSPxcf
Subject: Re: [Buildroot] [PATCH v2 1/3] arch: add support for mcf5441x
 Colfdire
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmVhbi1NaWNoZWwsCgpMZSAxMS8wNC8yMDI0IMOgIDE1OjQ4LCBKZWFuLU1pY2hlbCBI
YXV0Ym9pcyBhIMOpY3JpdMKgOgo+IEhlbGxvLAo+IAo+IE9uIDExLzA0LzIwMjQgMDc6NTksIEpl
YW4tTWljaGVsIEhhdXRib2lzIHdyb3RlOgo+PiBPbiAxMC8wNC8yMDI0IDIzOjE3LCBUaG9tYXMg
UGV0YXp6b25pIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+PiBPbiBXZWQsIDEwIEFwciAyMDI0IDIz
OjA4OjE0ICswMjAwCj4+PiBKZWFuLU1pY2hlbCBIYXV0Ym9pcyA8amVhbm1pY2hlbC5oYXV0Ym9p
c0B5b3NlbGkub3JnPiB3cm90ZToKPj4+Cj4+Pj4+IFdoYXQgaGFwcGVucyB3aGVuIHlvdSBkb24n
dCBzcGVjaWZ5IC1tYXJjaD8gRG8geW91IGtub3cgd2hpY2ggb2YgaXNhYSwKPj4+Pj4gaXNhYXBs
dXMsIGlzYWIgYW5kIGlzYWMgdGhlIE1DRjU0NDF4IGNvcnJlc3BvbmRzIHRvPwo+Pj4+Cj4+Pj4g
SSBkaWQgbm90IGNoZWNrIHdoYXQgaGFwcGVucywgYnV0IGJhc2VkIG9uIHRoZSBmb2xsb3dpbmcg
ZmlsZSBpdCBpcyBpc2FjOgo+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9nY2MtbWlycm9yL2djYy9i
bG9iL21hc3Rlci9nY2MvY29uZmlnL202OGsvbTY4ay1kZXZpY2VzLmRlZiNMMTY4Cj4+Pgo+Pj4g
QW5kIGlmIHlvdSBzcGVjaWZ5IC1tY3B1IGluc3RlYWQsIGRvZXMgaXQgd29yaz8gV2hhdCBkb2Vz
bid0IHdvcmsgaWYKPj4+IHlvdSBvbWl0IC1tYXJjaD8KPj4KPj4gSWYgSSBjaGFuZ2UgdGhlIGxp
bmUgdG8gcGFzcyBpc2FjLCBob3N0LWdjYy1maW5hbCBkb2VzdCBub3QgYnVpbGQgYXQgYWxsOgo+
PiA8c25pcD4KPj4gY2hlY2tpbmcgaWYgbWtkaXIgdGFrZXMgb25lIGFyZ3VtZW50Li4uIG5vCj4+
IEludmFsaWQgLS13aXRoLWFyY2g9aXNhYwo+PiBtYWtlWzNdOiAqKiogW01ha2VmaWxlOjQ1NTM6
IGNvbmZpZ3VyZS1nY2NdIEVycm9yIDEKPj4gbWFrZVsyXTogKioqIFtNYWtlZmlsZToxMDI5OiBh
bGxdIEVycm9yIDIKPj4gbWFrZVsxXTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjI4MzoK
Pj4gL2hvbWUvam0vUHJvamVjdHMvd2FidGVjL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC1n
Y2MtZmluYWwtMTIuMy4wLy5zdGFtcF9idWlsdF0gRXJyb3IgMgo+Pgo+PiBBcyBJIGFtIG5vdCBh
cyBleHBlcmltZW50ZWQgYXMgeW91IHdpdGggdG9vbGNoYWlucywgSSB3b3VsZCBjZXJ0YWlubHkK
Pj4gYXBwcmVjaWF0ZSBzb21lIGd1aWRhbmNlIHRvIGRlYnVnIGlmIG5lZWRlZC4KPj4KPj4gSSBj
YW4gdGVsbCBmb3Igc3VyZSB0aGF0IHdpdGggImNmIiBhbmQgdGhlIDU0NDU1IGZhbWlseSBzcGVj
aWZpZWQsIGl0IGJ1aWxkcwo+PiBteSBhcHBsaWNhdGlvbnMgOy0pLgoKSXQncyBub3QgY2xlYXIg
d2h5IHRoZSBvcHRpb24gaXMgQlIyX202OGtfY2Y1NDQxeCBidXQgeW91IHNldCA1NDQ1NSBmb3IK
QlIyX0dDQ19UQVJHRVRfQ1BVCgogY29uZmlnIEJSMl9HQ0NfVEFSR0VUX0NQVQogCWRlZmF1bHQg
IjY4MDQwIgkJaWYgQlIyX202OGtfNjgwNDAKIAlkZWZhdWx0ICI1MjA4IgkJaWYgQlIyX202OGtf
Y2Y1MjA4CisJZGVmYXVsdCAiNTQ0NTUiCQlpZiBCUjJfbTY4a19jZjU0NDF4CgppcyBhIHR5cG8/
Cgo+IAo+IFNtYWxsIHVwZGF0ZToKPiBJIGhhdmUgdG8gYWRkIHRoZSBmb2xsb3dpbmcgcGF0Y2gg
aW4gcGFja2FnZS9nY2MvMTIuMy4wIHRvIG1ha2UgaXQgdXNlIHRoZQo+IG1hcmNoPSJpc2FjIi4K
PiAKPiBkaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZy5nY2MgYi9nY2MvY29uZmlnLmdjYwo+IGluZGV4
IDVjMzc4YzY5OGZmLi5hNmZlOWMyYWQ1MyAxMDA2NDQKPiAtLS0gYS9nY2MvY29uZmlnLmdjYwo+
ICsrKyBiL2djYy9jb25maWcuZ2NjCj4gQEAgLTQ1MjIsNyArNDUyMiw3IEBAIGNhc2UgIiR7dGFy
Z2V0fSIgaW4KPiDCoMKgwqDCoMKgwqDCoCBmaWRvLSotKiB8IG02OGsqLSotKikKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3VwcG9ydGVkX2RlZmF1bHRzPSJhcmNoIGNwdSIKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSAiJHdpdGhfYXJjaCIgaW4KPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiIiB8ICJtNjhrInwgImNmIikKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAiIiB8ICJtNjhrInwgImNmIiB8ICJpc2FjIikKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG02OGtfYXJjaF9mYW1pbHk9
IiR3aXRoX2FyY2giCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA7Owo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqKQoKQ2FuIHlvdSBhc2sg
b24gdGhlIGdjYyBtYWlsaW5nIGxpc3QgdG8gZ2V0IGFuIHVwc3RyZWFtIHJldmlldz8KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAKPiBKTQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
