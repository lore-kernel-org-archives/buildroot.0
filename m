Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB30AFB5E83
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 22:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 492E360FBC;
	Mon, 16 Mar 2026 22:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRg1CBbQ50vX; Mon, 16 Mar 2026 22:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63BDD60FC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773700887;
	bh=RPtMgVLrkwXtDRPY+/6LRvN6PMlrVekBj+LH2wMEGVE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XBLm0Ik+CUprBm3EKhsJmVjiLbqfmiI8Gt5sr+MWQh7ZahY8dhCzL/5b3lPK9/zSl
	 FPw/NBWDa3F0huUeGxatnTePlFesCQ/6h+AuW5AgeG1+f+SZEeOxh3Hobs+Szl6383
	 KgDK4/UkIJ8k/1mQMuOQZI5rUJYes2B1I+/q+zFqtRhEP0/Av/FYylYcWQ1RkaQ6U6
	 k6pVIUZ1j1uAWJPb96XFVqG7y/h5DSdxDTzWXMfGVM+CTR8Mdn+V6kpGt80pXc5np0
	 81juKfMu7mhfNDcR8EwCcGuqn6SAmogOKQqLRuObaPZCDTvuKfV/8fGAU4SUpi6bks
	 RrQCTds+2eF/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63BDD60FC6;
	Mon, 16 Mar 2026 22:41:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58BA53BE
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 22:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EEE383AEF
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 22:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rutL_FDuOffs for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 22:41:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CDD983AEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CDD983AEE
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CDD983AEE
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 22:41:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-439c5b40f60so4003723f8f.0
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 15:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773700882; x=1774305682;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fWpQdwYM31Z4IHKtDcas3xeALCn2wKbbSC0SUdIToDE=;
 b=F85m2ykZHxoL5H0UxLBNkgF/CoPnkenh5GuEqv4vv38XWZefqd/AVpTaM8ItcT/YLS
 kiWLi1dodhaVSRKhq9x7ejtarrX0Ux3/bfKp9ZY6xpmGYQJK5Z7iXzTP6ljt8tFmpn7c
 jKfV/qj1KxmR7k4MNUTyh+taDrFhle7BG3PdYJcUKWXEmUxCgI9Dyag367bjRCPDZx4w
 9CLfoPZEHfCCjLahyEjNyEtTV8myUqr4/pijnengz2R/zFDtxfF/8g2Fb8+tz9c+jWr0
 VMOytpGr83SUUp08uxa9XYrvPSjFqviAKCMfHMA9ph/OM/1qOl4tuSrbF/7KqmRkWGMC
 LJgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMzNlejqGXg4iGeUJCvBgEEq7+o8g7+dob6lwnOzmeTzwYdfUnKNY7EVSz7krz9xxvI7aPS//5tTU=@buildroot.org
X-Gm-Message-State: AOJu0Yylo1uhe5lWwcbbKgLy5UlVEw8LTNY1tpmWe5vGdF6LChqdt9fb
 r3o6rY2oJS8ihSi4I9I+q7//cg7C+I0W8KYB9Q90B1TIPUxurqhSP+gVlRTjhjAKabk=
X-Gm-Gg: ATEYQzwUbx12ycfvkAzZT954SVdNbFRLG+t1g+SppNZuEzaLS8gsftG84Q3saiD1ty8
 y8Q5T/PdV3+muc4wJgCpw/kzgU5JZKMTxasAEm6k2nW+qDLKoVgIxdx/Ioj7pSWJeLexTTKiaFh
 RG17Zg84doHpwoYtUFcn9WWO7b0MVlITMBbMDZWoTAlXQW1IBBLF4p4DqwrZY7xgJaYUO4w4LPa
 89InUfqLXANWuCgPiZSlZqNMtVvfPNeOwf3h1Ekf1ZNuCMUvb5YlyA9Y4wHTCHr52nYJNzha6QC
 hNIlsm1CLuulVn2AHpWV+tYwEHpY0pUUVcXMpb1digJ9aa2pFZH95fMv0J3ZFziKwLOi7HWxmvP
 lZrK2OXyKIHCGkZRdMJ2JwzN9IV8/rMBhYJ9qYMPhRGTKIQ8i4KdJ58b/ZufBMxIsrlbJbgYVAe
 +u5Gewiu7yH6plVeBpMgPiaGk9wMZFJ6lsyTD6UPeabCJ62GJDVNjCzUYWnEQagonaa8InZwtRZ
 /j6KvNjaXdHDm640I8C8M0T+NGFrszThEyH/A/tKnaAKWZvHJy9MOiBVYQfrvVavw==
X-Received: by 2002:a5d:5f91:0:b0:43b:3dcc:8b03 with SMTP id
 ffacd0b85a97d-43b3dcc8cabmr13953817f8f.21.1773700881638; 
 Mon, 16 Mar 2026 15:41:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b45e5c233sm11047257f8f.33.2026.03.16.15.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 15:41:21 -0700 (PDT)
Message-ID: <a0243741-5266-4acf-a9f0-8c075e95811a@smile.fr>
Date: Mon, 16 Mar 2026 23:41:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>, buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>
References: <20251204-uboot-bl1-v1-0-ce8e01d73906@ti.com>
 <20251204-uboot-bl1-v1-2-ce8e01d73906@ti.com>
Content-Language: fr
In-Reply-To: <20251204-uboot-bl1-v1-2-ce8e01d73906@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773700882; x=1774305682; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fWpQdwYM31Z4IHKtDcas3xeALCn2wKbbSC0SUdIToDE=;
 b=d+1dHN7pTouk4RlmCvemsWQJshj7pufgCZ9qfN7yTvBsaIElpN3QWkPvU9E+Azhcoi
 urJu+wV7bkUcw9RnEeNnPUWcpIHadQyCyeJLAeu+919Y24fq0It32RTzPOrMqVJgVPL2
 htvlxFHDYucsoTSkVhJK67jsYoAx0Sqv4pYJA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=d+1dHN7p
Subject: Re: [Buildroot] [PATCH 2/2] boot/uboot: add option to add TF-A's
 BL1 as a dependency
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

SGVsbG8gQnJ5YW4sIEFsbCwKCkxlIDA0LzEyLzIwMjUgw6AgMTQ6MjcsIEJyeWFuIEJyYXR0bG9m
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBTb21lIFNvQ3MgKGxpa2UgVEkncyBBTTYyTHgp
IHJlcXVpcmUgdGhlIEFSTSBUcnVzdGVkIGZpcm13YXJlJ3MgKEFURikKPiBUcnVzdGVkIGZpcm13
YXJlIEJMMSBiZSBwYWNrYWdlZCB3aXRoIFUtQm9vdCB0byBwcm9wZXJseSBib290LiBBZGQgaXQg
YXMKPiBhIHNlbGVjdGFibGUgZGVwZW5kZW5jeSB0byBVLUJvb3QuCgpJdCBjb3VsZCBiZSBpbnRl
cmVzdGluZyB0byBoYXZlIGEgZGVmY29uZmlnIHVzaW5nIHRoaXMgbmV3IFRGLUEncyBCTDEgb3B0
aW9uLgoKV2hhdCBhYm91dCBhZGRpbmcgYSBkZWZjb25maWcgZm9yIHRoZSBuZXcgKHVwY29taW5n
KSBiZWFnbGViYWRnZSBbMV0/IChldmVuIGEKV0lQIG9uZSkKClsxXSBodHRwczovL3d3dy5iZWFn
bGVib2FyZC5vcmcvYm9hcmRzL2JlYWdsZWJhZGdlCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyeWFu
IEJyYXR0bG9mIDxiYkB0aS5jb20+Cj4gLS0tCj4gIGJvb3QvdWJvb3QvQ29uZmlnLmluIHwgMTIg
KysrKysrKysrKysrCj4gIGJvb3QvdWJvb3QvdWJvb3QubWsgIHwgMTMgKysrKysrKysrKysrKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYm9v
dC91Ym9vdC9Db25maWcuaW4gYi9ib290L3Vib290L0NvbmZpZy5pbgo+IGluZGV4IGQ0MGUxZTk1
ZTA3YTk1MGQzZWM0MzEzZTcxMmQ0ZDAxZmEyNTYwODguLjlhN2ZlOGY0MGIyNTMyYTk3ODliOTY2
NmJmOWEzZTNkMmZhOWZlY2UgMTAwNjQ0Cj4gLS0tIGEvYm9vdC91Ym9vdC9Db25maWcuaW4KPiAr
KysgYi9ib290L3Vib290L0NvbmZpZy5pbgo+IEBAIC0yNDIsNiArMjQyLDE4IEBAIGNvbmZpZyBC
UjJfVEFSR0VUX1VCT09UX05FRURTX1hYRAo+ICAJICB0eXBpY2FsbHkgdGhlIGNhc2Ugd2hlbiB0
aGUgYm9hcmQgY29uZmlndXJhdGlvbiBoYXMKPiAgCSAgQ09ORklHX1VTRV9ERUZBVUxUX0VOVl9G
SUxFIGVuYWJsZWQuCj4gIAo+ICtjb25maWcgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZfQkwx
Cj4gKwlib29sICJVLUJvb3QgbmVlZHMgQVRGIEJMMSIKPiArCWRlcGVuZHMgb24gQlIyX1RBUkdF
VF9BUk1fVFJVU1RFRF9GSVJNV0FSRQo+ICsJZGVwZW5kcyBvbiAhQlIyX1RBUkdFVF9BUk1fVFJV
U1RFRF9GSVJNV0FSRV9VQk9PVF9BU19CTDMzCj4gKwlzZWxlY3QgQlIyX1RBUkdFVF9BUk1fVFJV
U1RFRF9GSVJNV0FSRV9CTDEKPiArCWhlbHAKPiArCSAgU29tZSBzcGVjaWZpYyBwbGF0Zm9ybXMg
KHN1Y2ggYXMgVEkncyBBTTYyTHgpCj4gKwkgIGVuY2Fwc3VsYXRlIHRoZSBCTDEgcGFydCBvZiBB
VEYgaW5zaWRlIFUtQm9vdC4gVGhpcyBvcHRpb24KPiArCSAgbWFrZXMgc3VyZSBBVEYgZ2V0cyBi
dWlsdCBwcmlvciB0byBVLUJvb3QsIGFuZCB0aGF0IHRoZSBCTDEKPiArCSAgdmFyaWFibGUgcG9p
bnRpbmcgdG8gQVRGJ3MgQkwzMSBiaW5hcnksIGlzIHBhc3NlZCBkdXJpbmcgdGhlCj4gKwkgIEJ1
aWxkcm9vdCBidWlsZC4KCldoYXQgaWYgQkwzMSBpcyBub3QgYnVpbHQ/Ckl0IHNlZW1zIHRoYXQg
QlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9CTDMxIGlzIG5lZWRlZCBhdCBsZWFzdCBi
dXQKQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZfQkwzMSBzaG91bGRuJ3QgYmUgZW5hYmxlZCBh
dCB0aGUgc2FtZSB0aW1lLgoKKGEgZGVmY29uZmlnIGV4YW1wbGUgd291bGQgaGF2ZSBoZWxwZWQp
Cgo+ICsKPiAgY29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzEKPiAgCWJvb2wg
IlUtQm9vdCBuZWVkcyBBVEYgQkwzMSIKPiAgCWRlcGVuZHMgb24gQlIyX1RBUkdFVF9BUk1fVFJV
U1RFRF9GSVJNV0FSRQo+IGRpZmYgLS1naXQgYS9ib290L3Vib290L3Vib290Lm1rIGIvYm9vdC91
Ym9vdC91Ym9vdC5tawo+IGluZGV4IDdiZDA5MzdkZjI0Mjk2OTJiZjUzYmE3YTQ3NWYwZjE5Nzg3
ZWFiNDguLjU2YWJlMWUzNjk3NDFmYjEzZjQwM2Q5OTNjNWIwYzUwY2RlNTE4NzEgMTAwNjQ0Cj4g
LS0tIGEvYm9vdC91Ym9vdC91Ym9vdC5tawo+ICsrKyBiL2Jvb3QvdWJvb3QvdWJvb3QubWsKPiBA
QCAtMTg1LDYgKzE4NSwxMSBAQCBlbmRpZgo+ICAKPiAgaWZlcSAoJChCUjJfVEFSR0VUX1VCT09U
X05FRURTX0FURl9CTDMxKSx5KQo+ICBVQk9PVF9ERVBFTkRFTkNJRVMgKz0gYXJtLXRydXN0ZWQt
ZmlybXdhcmUKPiArZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMSks
eSkKPiArVUJPT1RfREVQRU5ERU5DSUVTICs9IGFybS10cnVzdGVkLWZpcm13YXJlCj4gK2VuZGlm
Cj4gKwo+ICtpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzEpLHkpCgpJZiBC
UjJfVEFSR0VUX1VCT09UX05FRURTX0FURl9CTDMxIGNhbid0IGJlIGVuYWJsZWQgYXQgdGhlIHNh
bWUgdGltZSB0aGFuCkJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMSwgdGhpcyBwYXJ0IGlz
IG5vdCByZXF1aXJlZC4KCj4gIGlmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZfQkwz
MV9FTEYpLHkpCj4gIFVCT09UX01BS0VfT1BUUyArPSBCTDMxPSQoQklOQVJJRVNfRElSKS9ibDMx
LmVsZgo+ICBkZWZpbmUgVUJPT1RfQ09QWV9BVEZfRklSTVdBUkUKPiBAQCAtMjAwLDYgKzIwNSwx
NCBAQCBVQk9PVF9QUkVfQlVJTERfSE9PS1MgKz0gVUJPT1RfQ09QWV9BVEZfRklSTVdBUkUKPiAg
ZW5kaWYKPiAgZW5kaWYKPiAgCj4gK2lmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZf
QkwxKSx5KQoKSnVzdCBhZGQgQVRGIGRlcGVuZGVuY3kgaGVyZQpVQk9PVF9ERVBFTkRFTkNJRVMg
Kz0gYXJtLXRydXN0ZWQtZmlybXdhcmUKCkknbGwgbWFyayB0aGlzIHNlcmllcyBhcyBDaGFuZ2Vz
IFJlcXVlc3RlZC4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiArVUJPT1RfTUFLRV9PUFRTICs9
IEJMMT0kKEJJTkFSSUVTX0RJUikvYmwxLmJpbgo+ICtkZWZpbmUgVUJPT1RfQ09QWV9CTDFfRklS
TVdBUkUKPiArCWNwICQoQklOQVJJRVNfRElSKS9ibDEuYmluICQoQEQpLwo+ICtlbmRlZgo+ICtV
Qk9PVF9QUkVfQlVJTERfSE9PS1MgKz0gVUJPT1RfQ09QWV9CTDFfRklSTVdBUkUKPiArZW5kaWYK
PiArCj4gIGlmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUFRFRV9URUUpLHkpCj4gIFVC
T09UX0RFUEVOREVOQ0lFUyArPSBvcHRlZS1vcwo+ICBpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1Rf
TkVFRFNfT1BURUVfVEVFX0VMRikseSkKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
