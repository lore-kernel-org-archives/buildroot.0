Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0632F3381D
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 09:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C5A96149B;
	Tue, 17 Mar 2026 09:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jp1AT55lpp9H; Tue, 17 Mar 2026 09:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30981614A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773738254;
	bh=bpMVauriy6ANLXJ8epQgQW6um7Utphc54fXF0ZEzOTY=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Kzk4RWfjhQuoprsm4h0hQeONig+SmBqbg1Uk1/OwHJTE5v9OyuAHr0SCx/AZbNN2h
	 D3DJ1p1Tuwygqd87ZKvqrLe7evcRGncxFqQGKWfabnH3zzUGyyg8IxUxZ/iBcgfwtu
	 liZ1seMfrapHYQjeZVRfSgivRxjQeFRDG/C3paRRpFH73GZTGdw1jpGr28lzkPgIY5
	 JKKKv+2NABTwIGRXiOaKAUt886ByMLoJXtKptFITjnvpruKWBArK+bRVr4n2OOR001
	 eUaWO7keRbXc0z2l6T8/FwANb0CGoqqnGZlqzn2IV58ju+zxxspttSAIZH80f0uNa2
	 o6CGZ9rPTJt4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30981614A2;
	Tue, 17 Mar 2026 09:04:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 749DDD3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 09:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A2FC40BDD
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 09:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyI0hjxsR_BH for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 09:04:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=oxffffaa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E15724004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E15724004D
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E15724004D
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 09:04:08 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5a126c8aab9so7509447e87.0
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 02:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773738246; x=1774343046;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FHy9XYIoM6tJ6PvRphCO9hsLbpzczZjdqa+GC7RjtgU=;
 b=h3GlnLD9bI0VtyfPkCLaEue6t8qo6ZIVS0ebMSPE8njQ6kqKi7CLeSECUj71VexK6n
 hu8OqrYEU/k/Yr9nEZWO36Gyy+ieZ8U989R6ssfT8kYuCoynaAGJedwg+8sV4OBL8j0G
 EjvXRUQmZvM3DDOf3jDXyc+DUWJUG5MOMugmr9WGKuAKrRl5z1XC5hIKZ2QB5eI0vhhU
 eMQlWY9zqnrFD0FZUJfQTR0Yb8x/8xoKKB+pMtd4C6qKNOPzi0AEzNqAGK/rJ43MHpyE
 1Rb33Mq3g4XnxrzLDOarBH03vqB37SkHiogkvqHPXefhiMI73dk6YCS5C89cCjgqhKO4
 0fqw==
X-Gm-Message-State: AOJu0YzMRRYACOSsDVl45kIylo0wwuOvlb2khOiIHr09SXqNRRZErasF
 mxSoCE9lsVm/tvKzwq5nEVDQd+Av3Vao3Kq/VWTmi4jaYxrB2U7gEc2Nl+NuXg==
X-Gm-Gg: ATEYQzxQUJD9cXfO3Ifpk48D0gozDQZluZ+fyRAFkT2SHko1FVFWz0RRGHKXvR4K2rB
 I/RLb20sfQxBfw+F72SbFU43yyM+XeezQuX+xzFXNYDw7kpiSR+021Zjj29Y6minrq0UwZTc/wf
 aTVRyjUkueZV/pczFntPARFAh6fneU9Lu9cJ189LgBQYE5jyAwGlBPp7LSNxL9BjqlyAacd8J/j
 bU+BbiPtLxCJu/jXX/Jnua9u3LI/0G9vFDXJxlff+S2bxQDNff/x5/Q0xy2tWvkADziTg+3Nfl1
 IkW3t7YiF9n/65LhZPq57xMv2Hixp2kp9BCyTz4sFVLIq4TVwG9OUAGO9wD0tP1m84sQylszYch
 JbCbln0Efbegsms4hfYDISPE1lJea9xR0WKzrvR7+5StUG/tG7uyH9rPZ1Lb39iOM3oa28FJeq6
 1LMqlktbf9UBkESMkvl46/ELlkHFs=
X-Received: by 2002:a05:6512:610:10b0:5a1:3e3b:9dd6 with SMTP id
 2adb3069b0e04-5a16270925bmr3882815e87.20.1773738245939; 
 Tue, 17 Mar 2026 02:04:05 -0700 (PDT)
Received: from [192.168.0.111] ([77.220.140.242])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a17627287bsm274654e87.75.2026.03.17.02.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 02:04:05 -0700 (PDT)
Message-ID: <9dcd5bf4-797d-47db-9010-455eda7aa2a6@gmail.com>
Date: Tue, 17 Mar 2026 12:04:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: ru
From: Arseniy Krasnov <oxffffaa@gmail.com>
To: buildroot@buildroot.org
References: <987bd2ed-5087-4ee4-b3ce-3cb7a9030563@gmail.com>
In-Reply-To: <987bd2ed-5087-4ee4-b3ce-3cb7a9030563@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773738246; x=1774343046; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FHy9XYIoM6tJ6PvRphCO9hsLbpzczZjdqa+GC7RjtgU=;
 b=aHaPrb9o4fzIWQotAmIixAeX8OFgv/MnKvs5bzXXggPihRp2LeEkiGm0XWYUXDmSMH
 RyIZ5eC3optLuWbbkwcbPcmSd9gkotI8yAsQqzB0lWv+85oTjEJYx/hjalu3AxtIAy/e
 MiQaWR3X1vEbsN2LIowwtM/Xb3D3vUKYWj2t7KF/X9JTzWQ0TWlR40SAFz249bIyErjp
 OeekdBfkffyKvND5DiTzBxE+9sb1tW0eb0zgHnHoOe8Wqmiry0z+tVaCTQd4Q7SoI1yS
 G2wDTMKsLXUt1B+vaaAwf0MdIvRgfEcwHb3htPBkyzYI3LT5yq5JuE13ygFSfcb8tx5J
 vUow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aHaPrb9o
Subject: Re: [Buildroot] [PATCH v1] package/wpa_supplicant: add option for
 bgscan "learn"
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksIHBscyBwaW5nCgpUaGFua3MKCjAzLjAzLjIwMjYgMTg6MDAsIEFyc2VuaXkgS3Jhc25vdiDQ
v9C40YjQtdGCOgo+IFRoaXMgbW9kZSBmb3IgYmdzY2FuIGlzIGV4cGVyaW1lbnRhbCBhbmQgdGh1
cyBpcyBkaXNhYmxlZCBieSBkZWZhdWx0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFz
bm92IDxveGZmZmZhYUBnbWFpbC5jb20+Cj4gLS0tCj4gwqBwYWNrYWdlL3dwYV9zdXBwbGljYW50
L0NvbmZpZy5pbsKgIMKgIMKgIMKgIMKgfCA1ICsrKysrCj4gwqBwYWNrYWdlL3dwYV9zdXBwbGlj
YW50L3dwYV9zdXBwbGljYW50Lm1rIHwgNCArKysrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmln
LmluIGIvcGFja2FnZS93cGFfc3VwcGxpY2FudC9Db25maWcuaW4KPiBpbmRleCBhNDQyZWFhNjQx
Li5kNmMyOTE0YjY3IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmln
LmluCj4gKysrIGIvcGFja2FnZS93cGFfc3VwcGxpY2FudC9Db25maWcuaW4KPiBAQCAtMTgwLDQg
KzE4MCw5IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9XUEFfU1VQUExJQ0FOVF9EQlVTX0lOVFJPU1BF
Q1RJT04KPiDCoCDCoCDCoCDCoHNlY3VyaXR5IGNvbmNlcm5zLCBidXQgc29tZSBzeXN0ZW1zIG1h
eSB3YW50IHRvIHN1cHBvcnQgV0VQCj4gwqAgwqAgwqAgwqBuZXR3b3Jrcy4KPiDCoAo+ICtjb25m
aWcgQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfQkdTQ0FOX0xFQVJOCj4gK8KgIMKgIGJvb2wg
IkVuYWJsZSBiZ3NjYW4gXCJsZWFyblwiIgo+ICvCoCDCoCBoZWxwCj4gK8KgIMKgIMKgIEVuYWJs
ZSBleHBlcmltZW50YWwgImxlYXJuIiBtb2RlIGZvciBiZ3NjYW4uCj4gKwo+IMKgZW5kaWYKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5tayBiL3Bh
Y2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBsaWNhbnQubWsKPiBpbmRleCA4Njk5NzgwNzM2
Li5lZWRkNWQ0MDkzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1
cHBsaWNhbnQubWsKPiArKysgYi9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50
Lm1rCj4gQEAgLTEyNiw2ICsxMjYsMTAgQEAgaWZlcSAoJChCUjJfUEFDS0FHRV9XUEFfU1VQUExJ
Q0FOVF9XUFMpLCkKPiDCoFdQQV9TVVBQTElDQU5UX0NPTkZJR19ESVNBQkxFICs9IENPTkZJR19X
UFMKPiDCoGVuZGlmCj4gwqAKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9XUEFfU1VQUExJQ0FOVF9C
R1NDQU5fTEVBUk4pLHkpCj4gK1dQQV9TVVBQTElDQU5UX0NPTkZJR19FTkFCTEUgKz0gQ09ORklH
X0JHU0NBTl9MRUFSTgo+ICtlbmRpZgo+ICsKPiDCoCMgV1BBMyBjb25maWd1cmF0aW9uczoKPiDC
oCMgLSBDT05GSUdfRFBQOiBFYXN5IENvbm5lY3QgKERldmljZSBQcm92aXNpb25pbmcgUHJvdG9j
b2wgLSBEUFAgUjEgJiBSMikKPiDCoCMgLSBDT05GSUdfU0FFOiBTaW11bHRhbmVvdXMgQXV0aGVu
dGljYXRpb24gb2YgRXF1YWxzIChTQUUpLCBXUEEzLVBlcnNvbmFsCj4gLS3CoAo+IDIuNDcuMwo+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
