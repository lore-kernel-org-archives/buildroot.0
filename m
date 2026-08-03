Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F78AC55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 22:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9726A606B8;
	Mon,  3 Aug 2026 22:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EulMg9b0HSN; Mon,  3 Aug 2026 22:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 663FE6065A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785795481;
	bh=F/Aq0Sb+w7k5BMdsrTAl6xfrO233qjggwDQn18UvaDk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V0V2JN3qi1j7cuMcbt2xj8Z3gfVI/n1mOa1NY4kvAzLFv2ZeB3r8GQGPxXdu6xtkL
	 thJAkQb7FjV/Rjlg5iO1q3Wf2daLheiUIDctQfZRMBQ+pN1ER99yyQIMu+aJ0ZZVr4
	 iW+QUXiS85DLBN51cdG95Nr9Ch+OT6AIJygflUpruJsh1M4eNUJsA47XrcZgnS+z8A
	 vrk21O56hMi3WgS0WdJzIYl506bU3RohPYbBIwkooM0JyomRUKeLOhEK2+Xk2joLas
	 Vup4HrgM9NvEHXyqoqrAxxnNETcsCiNUkkRU0GWi0MDR9VMzDNgQlsi6K8YHgYz35D
	 utyY+3eFIAZNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 663FE6065A;
	Mon,  3 Aug 2026 22:18:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE26A218
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 22:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3B1980BD7
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 22:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cGce4AqwLbj for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 22:17:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 17D7480A6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17D7480A6D
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17D7480A6D
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 22:17:58 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-47f96c5b722so2300121f8f.0
 for <buildroot@buildroot.org>; Mon, 03 Aug 2026 15:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785795477; x=1786400277;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tia4/zJf/E0PWCsJ3oQpyZrla90JKoz25aWKGuVDFyg=;
 b=KTFz2EJdd3e3skfulN0DcVquI86lWciNzxvGCF3HV18GsijzMurMT1XFiHaRWyMC7i
 MQHOLiQD3X/NPjOMTjf8LcODsE1pxhyMbsn16a6MSQQJHRw1k2Q1FRiQ2LjQFEW9EyqW
 c4ha3KFxNtOqeZP8Y36BQUxvrevRhUeN6MIglOrvClQdONce75CYx9g2f5T4bN1s5lko
 ylggz5jA759pIwrEN8SFw6otI82qQ+aVhIbz+NEgw943Etz/mUMpzvPjtRNXN3uPWuKs
 dDxiDId9pQPXQrvxKYztTT2/6zhdEcxV6fXYzr7NNoEu0TlRx6DWxHR9d/9XGD//LdPA
 h1yg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqwNWvX0//fEbUg3/Kaz6fKVtBcLQ/GzV6NL1CssprTtF6esF91Fyn348Bdz0/mBVg7izxeGinkFqs=@buildroot.org
X-Gm-Message-State: AOJu0YzUw6XFKJTHMviVZcuiLOkpSIgV40Fi6rcAFnc/fzulB0nVDbTi
 YmdVP/4j+23kg40hSmYHjP3ik5JO8jHxeDARiYy/78chVdFNT/TxlGGj
X-Gm-Gg: AR+sD10Rx9cZHgqcTXRFhA/HuIaUm7yRtFMLbBVB1tFKbtyHiPnf2NoIrgrIAVhofeX
 QvJhUZve4u6Fe/ptkir28wyOChUF1ry8R3nrBHSrg5QO+Zy0WGyrWqbWyWhjPJnwI0cJ9OuqjX9
 DCgcCgwbt0kEvs3qijLz4A9v21359s3g87M41OWVFH8SmVkP75vSScxVgPcOIPnrgz1TiO5k9io
 AoVPP8ntz7RGcPUEMJFksboEYRBmX9wuY55gdH+taSW2V31kb4KvB0EXYjc8SsLl2onwghSdNiC
 v/B2q+leBPHPIOb+zEcbjuMTN9klz0HSGmpZpz8eHtvP/IomZH55J3Eab2jDY48l+4b+T0ArGuY
 K0ryWjJ4jWYjgRpqcW9p6ueszGIDKSZnMKLT8WhJeC9WClE1sYSQ5+V/cL71PlTQlJwok/3elVG
 kIgXS0ci+zeUxO99bA5itUctuWDZ0AJhra52uEvWFVChuuoXjzVJl1sZmaV+ha0HHbifXWHn6x6
 NVaDOjRs3HyvDM6/DbkwAfkjL8K8r0q5Ydy+URY2yNCQk59kfv20nY=
X-Received: by 2002:a05:6000:481c:b0:47f:8ac0:ccd3 with SMTP id
 ffacd0b85a97d-47fd9fa5e61mr27704861f8f.2.1785795476913; 
 Mon, 03 Aug 2026 15:17:56 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd458ab61sm37519877f8f.25.2026.08.03.15.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 15:17:56 -0700 (PDT)
Message-ID: <2138261149d2127b99cec0ca77ffd47680e7f7fe.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 04 Aug 2026 00:17:56 +0200
In-Reply-To: <20260706045206.2395575-1-troglobit@gmail.com>
References: <20260706045206.2395575-1-troglobit@gmail.com>
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785795477; x=1786400277; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=tia4/zJf/E0PWCsJ3oQpyZrla90JKoz25aWKGuVDFyg=;
 b=Qy8dXWccPyXczAQzdKS68PtaglRK/JiB5WY2dCN4ZiBflZ58/eplxdPBLO3nLZ7AP9
 9Fa9/1Sfh5b5NyGilOpM+5Clvjga6CptDXAw+5qtGGk3dWD37SvhZgdcT5EO4JO/sCz2
 IW2lhT/yiGx2t6FEYvMcYn0Pq8PBpex5Nr6x/zu1kxEYBPTfQVcv8kfZZtgw1sMEJ2j2
 ZuqMG06+DLeRJrgcBtHHJ9flFd5J/TSeZcrX/PShUR3jup+uJLXso1hlMEEMdz80Tq19
 oJnzd/SfN6Ri48I1SbkU/uu2KtyKnXoQzv2Igg6NqUwyga864SPnDT2Tdj8ox6Wi+cpp
 1BBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Qy8dXWcc
Subject: Re: [Buildroot] [PATCH 0/3] mini-snmpd: bump and housekeeping
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

SGkgSm9hY2hpbSwKCk9uIE1vbiwgMjAyNi0wNy0wNiBhdCAwNjo1MiArMDIwMCwgSm9hY2hpbSBX
aWJlcmcgd3JvdGU6Cj4gVGhpcyBpcyBhIG1ham9yIHVwZGF0ZSBvZiBtaW5pLXNubXBkLCBzZWUg
YmVsb3cgZm9yIGxpbmtzIHRvIHVwc3RyZWFtCj4gcmVsYXNlIG5vdGVzLsKgIFRoZSBpbnRlcm1l
ZGlhdGUgdjEuNyByZWxlYXNlIHR1cm5lZCBvdXQgdG8gYmUgYnVnZ3ksCj4gc28gd2UgdXBkYXRl
IHRvIHYyLjAgZGlyZWN0bHkuCj4gCj4gRm9yIGJ1aWxkcm9vdCwgaW50ZWdyYXRpb24gd2l0aCBs
aWJjb25mdXNlIGFuZCBldGh0b29sLCBhcyB3ZWxsIGFzIGFuCj4gaW5pdCBzY3JpcHQgd2FzIGFk
ZGVkLCB3aXRoIHRoZSBiZW5lZml0IG9mIGFsc28gZml4aW5nIHVzZSBpbiBzeXN0ZW1kCj4gYmFz
ZWQgc3lzdGVtcy4KCnRoYW5rcyBhIGxvdCBmb3IgdGhpcyB1cGRhdGUhCgpBY2tlZC1ieTogQWxl
eGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgoKPiBKb2FjaGlt
IFdpYmVyZyAoMyk6Cj4gwqAgcGFja2FnZS9taW5pLXNubXBkOiBidW1wIHRvIHZlcnNpb24gMi4w
Cj4gwqAgcGFja2FnZS9taW5pLXNubXBkOiBhZGQgc3lzdiBpbml0IHNjcmlwdAo+IMKgIHBhY2th
Z2UvbWluaS1zbm1wZDogZW5hYmxlIG9wdGlvbmFsIC5jb25mIGFuZCBldGh0b29sIHN1cHBvcnQK
PiAKPiDCoC4uLi8wMDAxLWxpbnV4LmMtZml4LW11c2wtYnVpbGQucGF0Y2jCoMKgwqDCoMKgwqDC
oMKgIHwgNDYgLS0tLS0tLS0tLS0tLS0tLQo+IMKgcGFja2FnZS9taW5pLXNubXBkL0NvbmZpZy5p
bsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNyArKysrKy0KPiDCoHBhY2th
Z2UvbWluaS1zbm1wZC9TNjBtaW5pLXNubXBkwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1
MiArKysrKysrKysrKysrKysrKysrCj4gwqBwYWNrYWdlL21pbmktc25tcGQvbWluaS1zbm1wZMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBwYWNrYWdlL21pbmkt
c25tcGQvbWluaS1zbm1wZC5jb25mwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDM2ICsrKysrKysr
KysrKysKPiDCoHBhY2thZ2UvbWluaS1zbm1wZC9taW5pLXNubXBkLmhhc2jCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAzICstCj4gwqBwYWNrYWdlL21pbmktc25tcGQvbWluaS1zbm1wZC5ta8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjkgKysrKysrKysrLS0KPiDCoDcgZmlsZXMgY2hh
bmdlZCwgMTMzIGluc2VydGlvbnMoKyksIDUyIGRlbGV0aW9ucygtKQo+IMKgZGVsZXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvbWluaS1zbm1wZC8wMDAxLWxpbnV4LmMtZml4LW11c2wtYnVpbGQucGF0
Y2gKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21pbmktc25tcGQvUzYwbWluaS1zbm1w
ZAo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWluaS1zbm1wZC9taW5pLXNubXBkLmNv
bmYKCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
