Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB26CD8C8C
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 12:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19FFC61729;
	Sat,  6 Jun 2026 12:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGPJOmFV_TmL; Sat,  6 Jun 2026 12:25:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43BDF61723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780748719;
	bh=A70rrTFH/NP102tLwSH5BIvu3Gliw3qrwFSKA74G9X8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=SysnsQL6pkqHjM6HsqH4f4qiq4iFQh7fTJnrgHv5GCKmSIWCg1AaD1RE7ToSqzshI
	 +33EiiL4H/7zPTnsLif/X3pEC0JszdGbQIlL/EHEYBc/16iJVM5RgnHxlIqv3XAcdS
	 83EhJZQzqDHoYg7OBNaIn7WAt6pmM7iLs6H851A/VhmXFM9mqTX1ffRmCbi4OIeOMA
	 S/IA04ddw6dVzoTLp6JsQgyEVBIu8iv4MtU99dP0OOepui7mhYHtnx37K7a8xsAksc
	 tdJpFVUfecY4g2txNb92Z/+yf1DkCVKNdAdB+O5k1qxMEKOYca/ZesRFroDFYLrAth
	 fEA/nONWIVm6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43BDF61723;
	Sat,  6 Jun 2026 12:25:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33D3B2EF
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 12:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 255B04085A
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 12:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAtbSURLfwhy for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 12:25:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E51524084B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E51524084B
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E51524084B
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 12:25:15 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso30958575e9.2
 for <buildroot@buildroot.org>; Sat, 06 Jun 2026 05:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780748713; x=1781353513;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NbDODa9M9zvR+jB//rqq4nNJoDjD5N5vCwdSHUMCXYM=;
 b=mCspU4Vy/HnxS3ursV1+9589PJ07fwGCJoxpbT4X2yrtLW2W/rEJ4BgCKGBOh6v8Td
 NmED4N0F3W90C+mkwzBxoIoXmjmOvhKeIYfggdXxgSt9MLkbAZ207JDWNwTRQU1H1lai
 oDJIN8glNXlB+5M2inUI+oqWwMr+H6DeWI5bR7Lvq2Io9t5rhKzdQX7eg7w1njrw3y9v
 x6Zo1bBtHab4pt3ZcfSHd3j8iGTdnLhFYyzFJlcxtJFrlwy+/OgpwrKu6jbxsBFmFMWP
 PNZR/J/ebnHLTya2oRMTDE+fAzerVmp1l/6un6N0pPqLZCZC4t2gKG9OcY+GURRRaP4D
 h5ug==
X-Gm-Message-State: AOJu0Yy9FXWW78/LZZI8FqKdnYmjPA8rB88JB/nP0HrGEIhwSP9G8720
 AqEd0otcHPFO3zMcHfaF4Cj3uTpkfZc8fjTy/LRTSC4rzsx/L0P9qedf/HVpA1QUI+PVOqAkKX5
 dA7Ip
X-Gm-Gg: Acq92OHBU0JsCIFYNgoiZ6R82Gu6R10Tm5ZMgpXvQuDKLT9ZQCJqLQtRJf599TnOHU4
 NpfXQcF8orPOijpUYB4LcpwUh/VC6Zv28V7/ubhGKF7ulI3cuNSuNPlIzJLLqUrRXti6BCyFrR0
 sxcfHJbOFGvFRAdwz5fd5ALLocwCxzfhD4jqXc6qpm6xtrxDQS5gpU3VDaykfU6BcTj2hPSx8Q3
 RGnqfstxpk7rfT6yUH/wPYrCArdQg1bzURpHgxMQU03HHGa37/WkCNdf1YzsTbCISz4HLYHVY0c
 dyGg81HF7FOJI6oPdgccsldkMtx7doMNTOipGwXmNsO7qQYeS72Q11b+3nXc5zAptsIDI2goot2
 qnapshQF558n7smAgfd819a9ZO5u17o+WGgfRlJP/no+IcginY8n4kkSdjuK/e5qZVXBMB9yVOV
 iqTe+1sTbSZ14P7gpFQA6vWLADlZo0UFq4PeHdyHjFt46inm7hjJDFEVBuPB9vnxxcYI+ZfuF3A
 Q7Zo3T6PW3/1lcW2UTL4LY8lQadU2tjO7t1w1NhO8qLMu9jf9LVXhO50b0+hzrlV39Iu6Zy6+wZ
X-Received: by 2002:a05:600c:3e83:b0:490:3fa2:1b93 with SMTP id
 5b1f17b1804b1-490c25a7f45mr130879255e9.13.1780748713277; 
 Sat, 06 Jun 2026 05:25:13 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351d40sm34143585f8f.26.2026.06.06.05.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Jun 2026 05:25:12 -0700 (PDT)
Message-ID: <8816b903-d4cc-4416-ad02-2b63d67002c2@smile.fr>
Date: Sat, 6 Jun 2026 14:25:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20260605224249.2590975-1-romain.naour@smile.fr>
Content-Language: fr, en-US
In-Reply-To: <20260605224249.2590975-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780748713; x=1781353513; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NbDODa9M9zvR+jB//rqq4nNJoDjD5N5vCwdSHUMCXYM=;
 b=pINMg2Acj/ZRFzoVHl5uLvchKYAVjTO/M1t7xlTAtoivcfQkly8LPT3sMdcHWIBDCf
 R8X6Nt3lPzYoHF+N5OUqvatxHRyxtDcZB+5+RXMB7DLED4fge5JQbFsFN+cduZ9Yre+7
 AHEnc9j1ZKPAqFOk+/dl8/4HmW6VaMhQyTNUU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=pINMg2Ac
Subject: Re: [Buildroot] [PATCH] package/runc: needs user namespace support
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

SGVsbG8gQWxsLAoKTGUgMDYvMDYvMjAyNiDDoCAwMDo0MiwgUm9tYWluIE5hb3VyIGEgw6ljcml0
wqA6Cj4gU2luY2UgdGhlIHJ1bmMgc2VjdXJpdHkgYnVtcCB0byB2ZXJzaW9uIDEuMy41IFsxXSwg
dGhlIFRlc3RPY2kgZmFpbCBkdWUKPiB0byBtaXNzaW5nIHVzZXIgbmFtZXNwYWNlIHN1cHBvcnQg
aW4gdGhlIGtlcm5lbDoKPiAKPiAgIHByb2Mvc2VsZi9zZXRncm91cHM6IG5vIHN1Y2ggZmlsZSBv
ciBkaXJlY3RvcnkKPiAKPiBMaWtlIGZvciB0aGUgZG9ja2VyLWVuZ2luZSBwYWNrYWdlLCBhIHNj
cmlwdCBjaGVjay1jb25maWcuc2ggaXMKPiBwcm92aWRlZCB0byBjaGVjayBhbnkgbWlzc2luZyBr
ZXJuZWwgc3VwcG9ydC4KPiAKPiAgIEdlbmVyYWxseSBOZWNlc3Nhcnk6Cj4gICAtIGNncm91cCBo
aWVyYXJjaHk6IHByb3Blcmx5IG1vdW50ZWQgWy9zeXMvZnMvY2dyb3VwXQo+ICAgLSBDT05GSUdf
TkFNRVNQQUNFUzogZW5hYmxlZAo+ICAgLSBDT05GSUdfTkVUX05TOiBtaXNzaW5nCgpJdCB3YXMg
bGF0ZSB5ZXN0ZXJkYXkgYW5kIEkgY29uZnVzZWQgQ09ORklHX05FVF9OUyB3aXRoIENPTkZJR19V
U0VSX05TLi4uCgpJbml0aWFsbHkgQ09ORklHX1VTRVJfTlMgd2FzIG1pc3NpbmcgZnJvbSB0aGUg
T3B0aW9uYWwgRmVhdHVyZXMKCiAgT3B0aW9uYWwgRmVhdHVyZXM6CiAgLSBDT05GSUdfVVNFUl9O
UzogbWlzc2luZwoKQW5kIEkgaGFkIHRvIGVuYWJsZSBpdCB0byB3b3JrYXJvdW5kIHRoZSBydW5j
IHJ1bnRpbWUgaXNzdWUuCgpJJ2xsIHNlbmQgYSB2MiB0byB1cGRhdGUgdGhlIGNvbW1pdCBsb2cu
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAgIC0gQ09ORklHX1BJRF9OUzogZW5hYmxlZAo+ICAg
LSBDT05GSUdfSVBDX05TOiBlbmFibGVkCj4gICAtIENPTkZJR19VVFNfTlM6IGVuYWJsZWQKPiA+
IEF0IGxlYXN0IG1ha2Ugc3VyZSB0aGF0IENPTkZJR19VU0VSX05TIGlzIGVuYWJsZWQgZm9yIFRl
c3RPY2kuCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVp
bGRyb290Ly0vam9icy8xNDY5NjUyNTk0NiAoVGVzdE9jaSkKPiAKPiBbMV0gZTAxM2UyZGY4NGZi
MzY5ODUyNjFkN2IzYzZlNmFmMDZhZmQ0MGY5Mwo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+IENjOiBQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvcnVuYy9ydW5jLm1rIHwgNSArKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcnVuYy9ydW5jLm1rIGIvcGFja2FnZS9ydW5jL3J1bmMubWsKPiBpbmRleCAxMGZmOThjOWQ3
Li45NGM3YTMwODhlIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcnVuYy9ydW5jLm1rCj4gKysrIGIv
cGFja2FnZS9ydW5jL3J1bmMubWsKPiBAQCAtMjYsNSArMjYsMTAgQEAgZW5kaWYKPiAgSE9TVF9S
VU5DX0xERkxBR1MgPSAkKFJVTkNfTERGTEFHUykKPiAgSE9TVF9SVU5DX1RBR1MgPSBjZ28gc3Rh
dGljX2J1aWxkCj4gIAo+ICsjIGJhc2VkIG9uIHNjcmlwdC9jaGVjay1jb25maWcuc2gKPiArZGVm
aW5lIFJVTkNfTElOVVhfQ09ORklHX0ZJWFVQUwo+ICsJJChjYWxsIEtDT05GSUdfRU5BQkxFX09Q
VCxDT05GSUdfVVNFUl9OUykKPiArZW5kZWYKPiArCj4gICQoZXZhbCAkKGdvbGFuZy1wYWNrYWdl
KSkKPiAgJChldmFsICQoaG9zdC1nb2xhbmctcGFja2FnZSkpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
