Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4A3C3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1496C61096;
	Tue, 20 May 2025 17:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2thiqKPN9m7C; Tue, 20 May 2025 17:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4372F61028
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4372F61028;
	Tue, 20 May 2025 17:32:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80C5DD4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6768E40195
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZHW12H64MbN for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:32:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EC8264015F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC8264015F
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC8264015F
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:32:43 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a365bc0af8so401695f8f.3
 for <buildroot@buildroot.org>; Tue, 20 May 2025 10:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747762362; x=1748367162;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:sender:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3UAon7bfMgulod24NwE4xit9JtQGDnMX7yy+HhfKU1U=;
 b=U7cw/bdUs/GQDNtZUvoVuOzNBK4IH3m//J6TzBaz+PBDR/koRkpwwgxQbvnwTGkE2u
 fMpxEmadwh6gSBaFF+mlfGGqC+PWr6KBMa0yB+Oq1pAouaWRGLUPZqsk/vxS8MAG4MW5
 nuZ+nTKP7NhtYm7by/uwhu6IVq/0DxJF0saPxO8dzxZ8l8vZiRuwIQWmHDtPH/60lciL
 6pfs66cJ2SMqyo/vPD6rnrVby5rRD4lrOIhVo8x3o0HDndwIxcwz46mlFnv+VisVYogC
 S7j+m0M8+4gK8RwnTHStXBxO2GnoKvECjD3qru63sE6ra2UBouUwLPRnO48z7lXVAroI
 f35g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/dtBYY/+Famq99f7QzJ3Hnuqg+WOkN+BuXQpbWtLgVKGfp54jlIXuV7oysagFQSDyWaqfsgIJE/c=@buildroot.org
X-Gm-Message-State: AOJu0YxqIeFR1tZ2R84CXBuJ6jkBqiDXlsZru5rHsni5X3qeEjmrduDV
 qgUKnmNEdbRH2UraIa4eSuySwx8cUG/5mNdEMkrLvnV5WYdNDzyK52QOxCFf7yKYs5DgUg==
X-Gm-Gg: ASbGncvxmRZH2Vy86K6NjcjB4cBlajrNrreH1Sm5H+x1vnDDtl7XwZQqpNWLxa4ORCn
 fJdOauiC7P7PsOON0/PJO0fIRq3fx9C//b12ey1a0xZDi3RZTUUGNyYvt5OGpcbSF/6fANZ1YvH
 2t7Juppa5pnQPdf31NTWWtWn+pPfY9QKwLCxEOuYN4X1XwvS9lXU5jA4jq0IXfIWB2ISMiIqaSp
 JXL6AlLzSYEVJnfYbnwEI5e6EhAM47OJfPu5x3pQF8xLyw88xNlW2YANMZYVVuwwV0T5uK6jOLJ
 6tZ1VCu9dGJDpYz09nntxr7dkxHDwWO1uR63M4GsFTo1fQzBWrcvWOBmTbo=
X-Google-Smtp-Source: AGHT+IEySvjt4416zf+iwCLor3aVhWmWL1rzdL6FHaIdykhmSZkPSjac2IlTbJtyPgGtmC0C6qHlag==
X-Received: by 2002:a05:6000:400d:b0:3a3:63d3:368e with SMTP id
 ffacd0b85a97d-3a363d33805mr4541441f8f.0.1747762361527; 
 Tue, 20 May 2025 10:32:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca9417dsm16794478f8f.101.2025.05.20.10.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 10:32:41 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 20 May 2025 19:32:40 +0200
Message-Id: <DA161SA1RS4I.3QMPR1V62YQ2V@gmail.com>
Cc: "Mahyar Koshkouei" <mahyar.koshkouei@gmail.com>, "Olivier Benjamin"
 <olivier.benjamin@bootlin.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
To: "Romain Naour" <romain.naour@smile.fr>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250204173456.201056-1-gael.portay+rtone@gmail.com>
 <20250204173456.201056-2-gael.portay+rtone@gmail.com>
 <27cfddc7-d417-49e3-8344-1be16b5e2f9e@smile.fr>
In-Reply-To: <27cfddc7-d417-49e3-8344-1be16b5e2f9e@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747762362; x=1748367162; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:sender:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3UAon7bfMgulod24NwE4xit9JtQGDnMX7yy+HhfKU1U=;
 b=YOLKQaMidRCRDv5AxukzU57XoWadcE+6Ywsv+kKskp793A20F3SFoULDTiBFZ8rwsn
 Qj6vxzcFHwVjtMKI0h3dEy4PnS5iK1S7pMQ1ardeAvLh0kuPisrxHv7mohrH9n07qAqc
 C5rhrhlQum3giDJAthNE7gvQqzKlLLOIe1axdfgbUzFe3BIVJ16IE+Il1gP5a/QP5Ds0
 cLoAfvrXua5ozES1wNg8cHmUfjzhWWBWX+XMEPBPX76QjczL9FBQsTb4Uc8+1nPHcVAy
 9iKlarUYx+pXiV9UI22OpNr/Fdq+Z3bCPO9HGa1Mix0bIqPcICCYECVfFVA6Mgo1uwu1
 ispQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YOLKQaMi
Subject: Re: [Buildroot] [PATCH v4 1/2] package/rpi-utils: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKT24gV2VkIEZlYiA1LCAyMDI1IGF0IDk6NDQgQU0gQ0VULCBSb21haW4g
TmFvdXIgd3JvdGU6Cj4gSGVsbG8gR2HDq2wsIEFsbCwKPgo+IExlIDA0LzAyLzIwMjUgw6AgMTg6
MzQsIEdhw6tsIFBPUlRBWSBhIMOpY3JpdMKgOgo+PiBUaGUgcGFja2FnZSBycGktdXNlcmxhbmQg
aGFzIGJlZW4gbWFya2VkIGFzIGFuY2llbnQgYW5kIGRlcHJlY2F0ZWRbMV0uCj4+IAo+PiBUaGUg
dXNlZnVsIHRvb2xzIChkdG92ZXJsYXksIGR0bWVyZ2UsIHZjbWFpbGJveCwgdmNnZW5jbWQpIHdl
cmUgbW92ZWQgdG8KPj4gdGhlIHJlcG9zaXRvcnkgcnBpLXV0aWxzIHNpbmNlIHRoZW4uCj4+IAo+
PiBUaGlzIGFkZHMgdGhlIG5ldyBwYWNrYWdlIHJwaS11dGlscyBhdCBsYXRlc3QgY29tbWl0IGFz
IHRoZXJlIGlzIG5vCj4+IHRhZ2dlZCBjb21taXQuCj4KPiBCUjJfUEFDS0FHRV9SUElfVVNFUkxB
TkQgaXMgdXNlZCBpbiBzZXZlcmFsIHBhY2thZ2VzLiBTaW5jZSBycGktdXRpbHMgc2hvdWxkCj4g
cmVwbGFjZSBycGktdXNlcmxhbmQgbWF5YmUgaXQncyB0aW1lIHRvIGFsc28gdXBkYXRlIHRoZXNl
cyBwYWNrYWdlcz8KPgoKVGhhdCBpcyBhIGdvb2QgY2F0Y2guIEJ1dCB3ZSBjYW5ub3QgYXMgcnBp
LXV0aWxzIGRvZXMgbm90IHByb3ZpZGVzIGFsbAp0aGUgcGllY2VzIHRoYXQgcnBpLXVzZXJsYW5k
IHByb3ZpZGVzLgoKPiBEaWQgeW91IGNvbnNpZGVyIG5vdCBvbmx5IGRlcHJlY2F0aW5nIHJwaS11
c2VybGFuZCBidXQgYSBjb21wbGV0ZSByZXBsYWNlbWVudD8KPgoKQW5kIHRodXMsIHRoZSBycGkt
dXRpbHMgY2Fubm90IHJlcGxhY2UgZW50aXJlbGx5IHJwaS11c2VybGFuZC4KClNvIEkgZ3Vlc3Ms
IHdlIHNob3VsZCByZW1vdmVzIHRoZSBiaW5hcmllcyB1dGlsaXRpZXMgcHJvdmlkZWQgYnkgdGhl
IG5ldwpwYWNrYWdlIHJwaS11dGlscyAoZHRvdmVybGF5LCBkdG1lcmdlLCB2Y21haWxib3gsIHZj
Z2VuY21kKSBmcm9tIHRoZSBvbGQKcGFja2FnZSBycGktdXNlcmxhbmQuIEFuZCB0aHVzLCBib3Ro
IHBhY2thZ2VzIGNhbiBiZSBpbnN0YWxsZWQgYXQgdGhlCnNhbWUgdGltZS4KCldoYXQgZG8geW91
IHRoaW5rPwoKPj4gCj4+IFsxXTogaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL3VzZXJs
YW5kL2NvbW1pdC85NmE3MzM0YWU5ZDVmYzlkYjdhYzkyZTU5ODUyMzc3ZGY2M2YxODQ4Cj4+IAo+
PiBUZXN0ZWQtYnk6IE9saXZpZXIgQmVuamFtaW4gPG9saXZpZXIuYmVuamFtaW5AYm9vdGxpbi5j
b20+Cj4+IFNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21h
aWwuY29tPgo+PiAtLS0KPgo+IFdoYXQgaGFwcGVuZWQgc2luY2UgdjM/Cj4KCk5vIGJpZyBjaGFu
Z2VzLCBpdCB3YXMgaW4gdGhlIGNvdmVybGV0dGVyOgoKQ2hhbmdlcyBzaW5jZSB2MzoKIC0gVXBk
YXRlIG15IGUtbWFpbAogLSBSZWJhc2Ugb24gbWFzdGVyCiAtIEFkZCBUZXN0ZWQtYnk6IE9saXZp
ZXIgQmVuamFtaW4gPG9saXZpZXIuYmVuamFtaW5AYm9vdGxpbi5jb20+Cgo+PiAgREVWRUxPUEVS
UyAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAg
ICAgICAgICAgICB8ICAxICsKPj4gIHBhY2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5pbiAgICAgIHwg
MTIgKysrKysrKysrKysrCj4+ICBwYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMuaGFzaCB8ICAz
ICsrKwo+PiAgcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLm1rICAgfCAxOCArKysrKysrKysr
KysrKysrKysKPj4gIDUgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+PiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5pbgo+PiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5oYXNoCj4+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLm1rCj4+IAo+PiBkaWZmIC0tZ2l0IGEv
REVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPj4gaW5kZXggMmRhNWQxNzhiMi4uZmMxYmEyYWIyNyAx
MDA2NDQKPj4gLS0tIGEvREVWRUxPUEVSUwo+PiArKysgYi9ERVZFTE9QRVJTCj4+IEBAIC0xMjAz
LDYgKzEyMDMsNyBAQCBGOglwYWNrYWdlL25naW54LW1vZHNlY3VyaXR5Lwo+PiAgTjoJR2HDq2wg
UE9SVEFZIDxnYWVsLnBvcnRheStydG9uZUBnbWFpbC5jb20+Cj4+ICBGOglib2FyZC9yYXNwYmVy
cnlwaS8KPj4gIEY6CWNvbmZpZ3MvcmFzcGJlcnJ5cGkqCj4+ICtGOglwYWNrYWdlL3JwaS11dGls
cy8KPj4gIAo+PiAgTjoJR2FvIFhpYW5nIDxoc2lhbmdrYW9AYW9sLmNvbT4KPj4gIEY6CXBhY2th
Z2UvZXJvZnMtdXRpbHMvCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2th
Z2UvQ29uZmlnLmluCj4+IGluZGV4IGU5Yzc4OWNmZjIuLmYwMmZlNTJmMzUgMTAwNjQ0Cj4+IC0t
LSBhL3BhY2thZ2UvQ29uZmlnLmluCj4+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4+IEBAIC00
NTQsNiArNDU0LDcgQEAgbWVudSAiRmlybXdhcmUiCj4+ICAJc291cmNlICJwYWNrYWdlL3Fvcmlx
LWZtLXVjb2RlL0NvbmZpZy5pbiIKPj4gIAlzb3VyY2UgInBhY2thZ2UvcmN3LXNtYXJjLXNhbDI4
L0NvbmZpZy5pbiIKPj4gIAlzb3VyY2UgInBhY2thZ2UvcnBpLWZpcm13YXJlL0NvbmZpZy5pbiIK
Pj4gKwlzb3VyY2UgInBhY2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5pbiIKPj4gIAlzb3VyY2UgInBh
Y2thZ2Uvc3VueGktYm9hcmRzL0NvbmZpZy5pbiIKPj4gIAlzb3VyY2UgInBhY2thZ2UvdHM0OTAw
LWZwZ2EvQ29uZmlnLmluIgo+PiAgCXNvdXJjZSAicGFja2FnZS91eDUwMC1maXJtd2FyZS9Db25m
aWcuaW4iCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS11dGlscy9Db25maWcuaW4gYi9wYWNr
YWdlL3JwaS11dGlscy9Db25maWcuaW4KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXgg
MDAwMDAwMDAwMC4uYTI3MjkxNjdhYQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2Uv
cnBpLXV0aWxzL0NvbmZpZy5pbgo+PiBAQCAtMCwwICsxLDEyIEBACj4+ICtjb25maWcgQlIyX1BB
Q0tBR0VfUlBJX1VUSUxTCj4+ICsJYm9vbCAicnBpLXV0aWxzIgo+Cj4gU2luY2UgaXQncyBvbmx5
IHVzZWZ1bGwgZm9yIHJwaSB0YXJnZXRzLCB5b3Ugc2hvdWxkIGtlZXAgdGhlIGFyY2hpdGVjdHVy
ZQo+IGRlcGVuZGVuY2llcyAoYXQgbGVhc3QpOgo+Cj4gCWRlcGVuZHMgb24gQlIyX2FybSB8fCBC
UjJfYWFyY2g2NAo+Cj4gT3RoZXJ3aXNlLCBpdCBsb29rcyBvay4KPgoKTWFrZXMgc2Vuc2UuCgo+
IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPgoKUmVnYXJkcywKR2HDq2wKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
