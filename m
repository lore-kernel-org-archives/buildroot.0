Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045B4C5CFDB
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 08:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E1AA40846;
	Wed, 12 Aug 2026 08:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Idcf1tsa9Sx6; Wed, 12 Aug 2026 08:50:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F9A840842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786524612;
	bh=DHSsnVtYlDNgN1OEJAzl0Ls9JwAzdDg7V5X7O67kig4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ve4AWulIG5Nwiyg0S8tRKvKMJ1nq9jC8yCOt15gieKadkEvEsib7Rhr6RYmq5+yoE
	 rBTF22mzGegdwliq+qVqR3tCeaUZH3xx56aIAIsX6fOwZSn01CUm70dXdZZcuv32xG
	 +X1uLEsu7nCoG6HVl86R4bOWKT/bk6yPUl2sDPj+yo/t9LjSxHLVKpaebGU5QEQQ+V
	 QHNZjSd27Hmd6WXNJ0MagojTi3l+QTkVLtAiRIiahjDB445iaAXOwx/Sp843Ty5X4H
	 zxidGbKlhSPdWIrR80m/5yBd6qC1D6r4KR0UN7jp9Pf74u9VmxNzOCNRrlYix7KbF5
	 ivZbThb4enx2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F9A840842;
	Wed, 12 Aug 2026 08:50:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98AA5EC
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 08:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A7E5607E2
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 08:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVxWF7jK_xsP for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 08:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 344DD60769
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 344DD60769
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 344DD60769
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 08:50:08 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-47f7872abb6so303845f8f.3
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 01:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786524607; x=1787129407;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N8QgY7zFIuGeAJyNIqFF4qSArqE3I+obGZHxl1EbJKQ=;
 b=X4SezNHV6QxHeyp1TfETCxq8iG5nCtphcHhgb/ST7zDryI1xGoT1mxohuNv0nJ38bE
 AdIlN7sdfXNmMu/NJUxPE+veQvsFOrz4onuEr1TsAaB8APatX173GjP0M/j5xeCq4uU0
 zdkxDmtzrSr8+NdMc4aYEeDKcgxFa7yCbA6xDfNc1NCx8dz3JZsKsjfh0es+xq+lmEsw
 SQ4ztV9KKMqG/WfQZB3rsgAfHaE8T+KS9EI7SX6dUqoO99RDy0d+tgy/0M9y5ggOUMtD
 S533GhxFsmu6qG8JMqVrAsLYcq/u5cNhX4waHeW27h9OEn92PCMvE2b/4N6pua8CVAtJ
 KbIA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rps7fR/xl7vuec/fP7vThhCeKTmAOiz4720BqQXlqliAqzB2IinG8xF8wrrfxIDMyEKc97cR2CkbRg=@buildroot.org
X-Gm-Message-State: AOJu0YyXjksKgehdGW+GyPqqf6yqaQEZaCkIw4JvaWgkc+fUzV54iT5a
 wPx16RB0aEyhWB7fIuWCqTtF1Is8kbGpTc9tUo6Fld/7yFRUKovYG7vQBpqmje8rGNc=
X-Gm-Gg: AR+sD12juL4D/Af8JTiQZH+vb3tXZFIxGzayNZOAJ2q4IT7dbPyvtfc5XlF/waySUXc
 rmaMBskxAVjGs080boB8NnC79XC+Q1uXjJRIYWC5iPVhfltMbsWVeSf7ruuaPjJixOlCwnu8t+t
 3vglwHxeBcFxxl5LbwT9J1MqKAGqYJektvxpW2O6w51qSeC3AJTBcriYtT5hWik+AQIozgRAp0G
 GHhs2FSXTiaMFX+U7MmK7VJct+9beBnH718ERkRz3wJcAfIQGV2zGHmaq6p5UHwNqwwX7mgcHgJ
 MxZslQE3ObBjtR/CiXoPeyr2Yw9riU1YKqL8O/BZzXK+DP05P0B1rDunBgGYCkiv1U8o2d0UPgh
 rKBpDSrlHfe79Fi7stHuPaBpHrNLZmDcq+p6I/lAZ6NsAobsuCNoENx45Hk9FBo3eCTLwQsbPsE
 7ZpzehcNqp9VGXQ/OOqZg8sEBf05uoQQvx/FZips5+5XVEA8JW687aj4bN2h1Zwu2g0ZdkBLzFv
 /38bQoeixHfakykLSMfPVnExAYjLuR5O4Kc5UKhVnX/ubcQlLSV9bke3sWGWho=
X-Received: by 2002:adf:e198:0:b0:47f:f4a9:ff34 with SMTP id
 ffacd0b85a97d-48152c94581mr4213525f8f.30.1786524606776; 
 Wed, 12 Aug 2026 01:50:06 -0700 (PDT)
Received: from [10.5.90.78]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d4e675sm5821314f8f.23.2026.08.12.01.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 01:50:06 -0700 (PDT)
Message-ID: <70c7d941-5737-467c-8def-d97c44d9d36f@smile.fr>
Date: Wed, 12 Aug 2026 10:50:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260527-master-v1-1-0d975f3b3f0d@gmail.com>
 <cbfb9495-35d2-447e-a9e1-22c834d07dc5@smile.fr>
 <009fc076-444a-4da5-ad0b-c8d71ac99bac@gmail.com>
Content-Language: en-US
In-Reply-To: <009fc076-444a-4da5-ad0b-c8d71ac99bac@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1786524607; x=1787129407; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=N8QgY7zFIuGeAJyNIqFF4qSArqE3I+obGZHxl1EbJKQ=;
 b=Ic8cZfp4tqcmyWxrEjDUKJULJykGgl7E7vNxpmwgBQ/rcEVV96UkYX7Z7HAaVxXXKa
 auyolDUdf8vLJF19wludCTMCjfEB4Jl26fFQ5zrJLdVTZq0+O8z2Ol4LtaMVU03v9elD
 Ee4szaat1cbggBsldBGkMhIleY1p65GcTem8k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Ic8cZfp4
Subject: Re: [Buildroot] [PATCH] package/libxkbcommon: provide xkbregistry
 when libxml2 is enabled
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

SGVsbG8gUmFwaGHDq2wsIEFsbCwKCkxlIDA2LzA3LzIwMjYgw6AgMTc6MzQsIFJhcGhhw6tsIEdh
bGxhaXMtUG91IGEgw6ljcml0wqA6Cj4gCj4gCj4gT24gNi8yNC8yNiAxNzo1MSwgUm9tYWluIE5h
b3VyIHdyb3RlOgo+PiBIZWxsbyBSYXBoYcOrbCwKPiAKPiBIaSwKPiAKPj4KPj4gTGUgMjcvMDUv
MjAyNiDDoCAyMTo1MywgUmFwaGHDq2wgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPj4+IHhrYnJl
Z2lzdHJ5IGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQuwqAgWWV0LCBpdCBvbmx5IG5lZWRzIGxpYnht
bDIgdG8gYmUKPj4+IGJ1aWx0LCB3aGljaCBpcyBhbHJlYWR5IHN1cHBvcnRlZC4KPj4+Cj4+PiBB
ZGQgdGhlIGNvbXBpbGUgZmxhZ3MgdG8gYnVpbGQgeGticmVnaXN0cnkgd2hlbiBwb3NzaWJsZS4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBHYWxsYWlzLVBvdSA8cmdhbGxhaXNwb3VA
Z21haWwuY29tPgo+Pj4gLS0tCj4+PiDCoCBwYWNrYWdlL2xpYnhrYmNvbW1vbi9saWJ4a2Jjb21t
b24ubWsgfCAxMCArKysrKysrKy0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnhrYmNv
bW1vbi9saWJ4a2Jjb21tb24ubWsgYi9wYWNrYWdlL2xpYnhrYmNvbW1vbi8KPj4+IGxpYnhrYmNv
bW1vbi5tawo+Pj4gaW5kZXggMjFhMmI5MzdlZjAyLi45ODE1NDM2OWI0MTkgMTAwNjQ0Cj4+PiAt
LS0gYS9wYWNrYWdlL2xpYnhrYmNvbW1vbi9saWJ4a2Jjb21tb24ubWsKPj4+ICsrKyBiL3BhY2th
Z2UvbGlieGtiY29tbW9uL2xpYnhrYmNvbW1vbi5tawo+Pj4gQEAgLTEyLDggKzEyLDcgQEAgTElC
WEtCQ09NTU9OX0NQRV9JRF9WRU5ET1IgPSB4a2Jjb21tb24KPj4+IMKgIExJQlhLQkNPTU1PTl9J
TlNUQUxMX1NUQUdJTkcgPSBZRVMKPj4+IMKgIExJQlhLQkNPTU1PTl9ERVBFTkRFTkNJRVMgPSBo
b3N0LWJpc29uIGhvc3QtZmxleAo+Pj4gwqAgTElCWEtCQ09NTU9OX0NPTkZfT1BUUyA9IFwKPj4+
IC3CoMKgwqAgLURlbmFibGUtZG9jcz1mYWxzZSBcCj4+PiAtwqDCoMKgIC1EZW5hYmxlLXhrYnJl
Z2lzdHJ5PWZhbHNlCj4+Cj4+IHhrYnJlZ2lzdHJ5IGhhcyBiZWVuIGRpc2FibGVkIG9uIHB1cnBv
c2Ugd2hlbiBsaWJ4a2Jjb21tb24gaGFzIGJlZW4gdXBkYXRlZCB0bwo+PiAxLjAuMSBbMV0uCj4g
Cj4gSW5kZWVkIEkgaGF2ZW4ndCBzZWUgdGhpcy4KPiAKPj4KPj4gSXQgc2VlbXMgdG8gcmVxdWly
ZXMgeGtleWJvYXJkLWNvbmZpZyBhdCBydW50aW1lIFsyXSwgY2FuIHlvdSB2ZXJpZnk/Cj4gCj4g
WWVzOiBsaWJ4a2Jjb21tb24gZG9lcyBub3QgcHJvdmlkZSBkYXRhc2V0LCB3aGljaCBpcyB3aGF0
IHhrZXlib2FyZC1jb25maWcgaXMuCj4gRnJvbSBbMl06Cj4gSXQgaXMgW3ByZWZlcnJlZF0gdGhh
dCBsaWJ4a2JyZWdpc3RyeSBiZSBzcGxpdCBpbnRvIGEgc2VwYXJhdGUgcGFja2FnZXMgYXMgbW9z
dAo+IGNsaWVudHMgdGhhdCByZXF1aXJlIGxpYnhrYmNvbW1vbiBkbyBub3QgcmVxdWlyZSBsaWJ4
a2JyZWdpc3RyeSBhbmQgY2xpZW50cwo+IHJlcXVpcmluZyBsaWJ4a2JyZWdpc3RyeSBtYXkgbm90
IG5lZWQgbGlieGtiY29tbW9uLgo+IAo+IERvZXMgdGhhdCBtZWFuIHRoYXQgYSBsaWJ4a2JyZWdp
c3RyeSBwYWNrYWdlIG5lZWRzIHRvIGJlIGNyZWF0ZWQgc2luY2UgaXQgaXMKPiBpbmRlcGVuZGFu
dCBmcm9tIGxpYnhrYmNvbW1vbiA/CgpJIGRvbid0IHRoaW5rIHNvLCBJJ20gZmluZSBlbmFibGlu
ZyB4a2JyZWdpc3RyeSB3aGVuIHRoZSBvcHRpb25hbCBsaWJ4bWwyCmRlcGVuZGVuY3kgaXMgYXZh
aWxhYmxlLCBqdXN0IHRha2UgY2FyZSBvZiBydW50aW1lIGRlcGVuZGVuY2llcy4gTWF5YmUgY29u
c2lkZXIKYWRkaW5nIGEgbmV3IHN1YiBvcHRpb24gZm9yIHBhY2thZ2VzIHRoYXQgbmVlZCBleHBs
aWNpdGx5IGxpYnhrYnJlZ2lzdHJ5LgoKbGlieGticmVnaXN0cnkgaXMgcGFja2FnZWQgYnkgbGli
eGtiY29tbW9uIHBhY2thZ2UgaW4gRmVkb3JhIGFuZCBZb2N0bywgdGhlcmUgaXMKbm8gc2VwYXJh
dGUgcGFja2FnZSBmb3IgaXQgWzFdWzJdLgoKTm90ZTogWW9jdG8gYWRkIHhrZXlib2FyZC1jb25m
aWcgcnVudGltZSBkZXBlbmRlbmN5IHRvIGxpYnhrYmNvbW1vbiB3aXRoIHgxMQpzdXBwb3J0LCBu
b3QgeGticmVnaXN0cnkgaXRzZWxmLgoKUGxlYXNlLCBzZW5kIGFuIHVwZGF0ZWQgcGF0Y2guCgpb
MV0gaHR0cHM6Ly9zcmMuZmVkb3JhcHJvamVjdC5vcmcvcnBtcy9saWJ4a2Jjb21tb24vYmxvYi9m
NDUvZi9saWJ4a2Jjb21tb24uc3BlYyNfMTgKClsyXQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmVt
YmVkZGVkL29wZW5lbWJlZGRlZC1jb3JlL2Jsb2IvNWQxYWE1YzgwNmMwNjFhMjk5NGY0ZGVjYjU5
MDE2NjEwZjA5MzIxMy9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGtiY29tbW9u
XzEuMTMuMS5iYiNMMjEKCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IEJlc3QgcmVnYXJkcywK
PiBSYXBoYcOrbAo+IAo+Pgo+PiBbMV0KPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vCj4+IGNvbW1pdC8xNzkxYmMzMGE1YjE5YmI1MjM2NjM3NWQwM2U2NjM0
ODI0MmZmMjVhCj4+Cj4+IFsyXQo+PiBodHRwczovL2dpdGh1Yi5jb20veGtiY29tbW9uL2xpYnhr
YmNvbW1vbi8KPj4gYmxvYi8yYzI5NWIxMGFhODdlOWJkOGMxMTk1NGFkY2Y3ZTkyYjAzMWI5MmY5
L1BBQ0tBR0lORyNMNjEKPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPj4KPj4+ICvCoMKg
wqAgLURlbmFibGUtZG9jcz1mYWxzZQo+Pj4gwqAgwqAgaWZlcSAoJChCUjJfUEFDS0FHRV9YT1JH
NykseSkKPj4+IMKgIExJQlhLQkNPTU1PTl9DT05GX09QVFMgKz0gLURlbmFibGUteDExPXRydWUK
Pj4+IEBAIC0yMiw2ICsyMSwxMyBAQCBlbHNlCj4+PiDCoCBMSUJYS0JDT01NT05fQ09ORl9PUFRT
ICs9IC1EZW5hYmxlLXgxMT1mYWxzZQo+Pj4gwqAgZW5kaWYKPj4+IMKgICtpZmVxICgkKEJSMl9Q
QUNLQUdFX0xJQlhNTDIpLHkpCj4+PiArTElCWEtCQ09NTU9OX0NPTkZfT1BUUyArPSAtRGVuYWJs
ZS14a2JyZWdpc3RyeT10cnVlCj4+PiArTElCWEtCQ09NTU9OX0RFUEVOREVOQ0lFUyArPSBsaWJ4
bWwyCj4+PiArZWxzZQo+Pj4gK0xJQlhLQkNPTU1PTl9DT05GX09QVFMgKz0gLURlbmFibGUteGti
cmVnaXN0cnk9ZmFsc2UKPj4+ICtlbmRpZgo+Pj4gKwo+Pj4gwqAgaWZlcSAoJChCUjJfUEFDS0FH
RV9MSUJYS0JDT01NT05fVE9PTFMpLHkpCj4+PiDCoCBMSUJYS0JDT01NT05fQ09ORl9PUFRTICs9
IC1EZW5hYmxlLXRvb2xzPXRydWUKPj4+IMKgIGVsc2UKPj4+Cj4+PiAtLS0KPj4+IGJhc2UtY29t
bWl0OiAwOGYzNzU3YjBmMjEzM2IwZWQ1MGUxZWYzZDdhNWExZDljODBkZTFjCj4+PiBjaGFuZ2Ut
aWQ6IDIwMjYwNTI3LW1hc3Rlci0yZTUyOTlhYWE4Y2EKPj4+Cj4+PiBCZXN0IHJlZ2FyZHMsCj4+
PiAtLSAKPj4+IFJhcGhhw6tsIEdhbGxhaXMtUG91IDxyZ2FsbGFpc3BvdUBnbWFpbC5jb20+Cj4+
Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+PiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPj4K
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
