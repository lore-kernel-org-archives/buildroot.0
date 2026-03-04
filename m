Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A8DEFCE47
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13918811B9;
	Wed,  4 Mar 2026 21:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 882-5sittT09; Wed,  4 Mar 2026 21:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1CA9811DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772661029;
	bh=6QDF75etBSJy0pDo7MakJx2R2ScHJkrMHHkEEJEt/wg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TYmriXFTp9s/JelAhp8nDZLxwfenaNF5B0B9Pu711UajUyGW7dX7OWkwqLU7RuFlA
	 oktJWgQu7h33nix+k4/hPVzwaW6bz7BcplI/lBh4oTFuIcmWPKCKsR3eCNcGDvCbak
	 NHtX9uYbGtcI00FaRb/cQfcwYMlseTzwPd5uJ9SUPUXDeMiqIV7BKcm9TN6E24oyha
	 AiEwkhdFscqwdEZwVRROVEDCR7UvH8tpw/1NhQ3uE+6A1CjCADdm39yjlDacj0EURX
	 3yFjayATTGyjsNhIZ23SRUwW3fJMk6D7lGXLt5wBcwtg6rgNMQlwJGnjrGb2FtCuO2
	 LkJzK80V0JEdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1CA9811DB;
	Wed,  4 Mar 2026 21:50:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DF86223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F709811DB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-gx6JAjmNo6 for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:50:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E99F6811AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E99F6811AF
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E99F6811AF
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:50:26 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-439ac15f35fso4236296f8f.0
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 13:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772661025; x=1773265825;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZzTA0KqAfE5I2+uqHvNNcOalu8aMNUeyzU92qlobBbU=;
 b=kDucNQ7h9OP0QD6VlcC/RDG2XY1RNSBRwGYocz4o3wP0MV9f4fpAt1AXL42ncUd+Ob
 3i9mVoOVg3dC3Gy/OQgdghGD+1fFE6Hd7DML1msyr5qA6l8Af91MTk4aEy8vI2AlHjdj
 2/CUPLtQ6wBORbSlgKLRiG1KItUb8wr3/Jy5C7cM3x79mAZMNDXbcPXMoLEBUyrt3UyE
 HMQJoRKQZ6w2V8ny3hY4QC9nFJqisvomzWXytJYIfbUSuYom/yJlNLwQqpRZC6opO143
 ZAOnfIO1hjxXdrYueFVNecRqME+xKfhGU8eON7GPmuoJRZSfv+N3JuIzEtViPIRdlS/H
 9f5g==
X-Gm-Message-State: AOJu0YwgsQ7b60ETnyQWfbIrNUOnueaFLsn7YkFSnOTLvEr0KKs+5MXX
 z6J0DbtOa4mFb2AWHxQ6uDXiG+/UUSI4FF+qG18Q5ZRUbRwtH8pHn7LNuO73Qi4L2DM=
X-Gm-Gg: ATEYQzyrzzmZMSoxAVZ+MYkbKR5eyRwBEZD60BmMgc7JvkZFFhSJUv+2N8oNT4Iryqe
 /EI6WBA5/MA2hjIQH/0h7R8wIz1C/fjaMflNVrrzVfmzboXG7BR/PVxdLF3kDc/JZOFUXcqhRiY
 efKRP02vukTSGQVyGH8rRsM5KN5nSnwpA6+USJOdOG655C7NcjjLwHWJJ3YwY7NHAXtOtVKiGTe
 ZnNYPi/jBI5RPNq1XnK5bo2SBzY8mCwXVHBX4fs4FMA+J+Gs+d/bbN5YiSOkzJ2HGgqOYYnBn1W
 GAFu26f8G9ZuFT5osfR+1Qol8u8dB8JVKZYP2tz3IrKdYJRCcD0bWx7hWyg+3TL3fhf/lp/LWch
 cZRh//M66Ft/t62K3T0KIjcdhdHZk8q++0J1ZDY74hhvYmlJl8qE3Fv57DLQcGDBkUScFv/0fgc
 kgjPpMLQuf1t1r0Xkn98eFTawPk7sqS8f38nkPxY9gjvgCJUxiQEOt5CYOuQgZZjAoEyDAIrZGW
 4MbHNlD/ROKgKQtxxz67zBvG3qwpMQid3sxe72uiJKvYLY/kAybV4C5ntxayK2KeA==
X-Received: by 2002:a05:6000:4387:b0:439:af42:c280 with SMTP id
 ffacd0b85a97d-439c7ffd950mr6529221f8f.57.1772661025005; 
 Wed, 04 Mar 2026 13:50:25 -0800 (PST)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b6d540b2sm26115526f8f.36.2026.03.04.13.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 13:50:24 -0800 (PST)
Message-ID: <6c90845b-4d69-4c4f-8fed-5c0432452429@smile.fr>
Date: Wed, 4 Mar 2026 22:50:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
References: <20260124131337.1022030-1-ju.o@free.fr>
 <20260124131337.1022030-3-ju.o@free.fr>
 <82fffd9a-dcd8-4dc6-8f33-c85e8d3f836c@smile.fr>
 <a3c30c525a648b03b3ee9755fdcd6a4d@free.fr>
 <39a51a3a-816f-4666-bfa1-4ed769cf88a3@smile.fr>
 <f34c272d9ce129774ac2abe9db6a2675@free.fr>
Content-Language: fr
In-Reply-To: <f34c272d9ce129774ac2abe9db6a2675@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1772661025; x=1773265825; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZzTA0KqAfE5I2+uqHvNNcOalu8aMNUeyzU92qlobBbU=;
 b=OHh6hdj9s/ssi8anCPVxekgaQtDaI1bfpj7VzzXKUXcJqi8ZElygO08Bmwo8TG6Xk3
 Q+t2IOAz3fxIqqbhR2UAGKvZSCDaKCe3m2RRFDcgQ1qAkbtuRjcDCKnKbLJwFXI5n+g9
 7RMjqrFLYbdI9e27efG/bygKYNh0U0feWW9nQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=OHh6hdj9
Subject: Re: [Buildroot] [PATCH 3/3] boot/edk2: bump to version
 edk2-stable202511
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAwMi8wMi8yMDI2IMOgIDE1OjE5LCBKdWxpZW4gT2xpdmFp
biBhIMOpY3JpdMKgOgo+IEhpIFJvbWFpbiwgQWxsLAo+IAo+IE9uIDAyLzAyLzIwMjYgMTA6NTEs
IFJvbWFpbiBOYW91ciB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBIZWxsbyBKdWxpZW4sIEFsbCwK
Pj4KPj4gTGUgMDEvMDIvMjAyNiDDoCAyMjo1MywgSnVsaWVuIE9saXZhaW4gYSDDqWNyaXTCoDoK
Pj4+IEhpIFJvbWFpbiwKPj4+Cj4+PiBPbiAwMS8wMi8yMDI2IDIyOjIxLCBSb21haW4gTmFvdXIg
dmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4+PiBIZWxsbyBKdWxpZW4sCj4+Pj4KPj4+PiBMZSAyNC8w
MS8yMDI2IMOgIDE0OjEzLCBKdWxpZW4gT2xpdmFpbiBhIMOpY3JpdMKgOgo+Pj4+PiBGb3IgcmVs
ZWFzZSBub3RlcyBzaW5jZSBlZGsyLXN0YWJsZTIwMjUwOCwgc2VlOgo+Pj4+PiBodHRwczovL2dp
dGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvcmVsZWFzZXMvdGFnL2VkazItc3RhYmxlMjAyNTExCj4+
Pj4+Cj4+Pj4+IFRoaXMgY29tbWl0IGFsc28gdXBkYXRlcyB0aGUgZWRrMi1wbGF0Zm9ybXMgcGFj
a2FnZXMgd2l0aCB0aGUgbGFzdAo+Pj4+PiBjb21taXQgbWVyZ2VkIGF0IHRoZSBlZGsyIHJlbGVh
c2UgZGF0ZSAoMjAyNS0xMS0xOSksIHdoaWNoIGNvcnJlc3BvbmRzCj4+Pj4+IHRvIGNvbW1pdCBb
MV0uCj4+Pj4+IFRoZSBlZGsyLW5vbi1vc2kgcGFja2FnZSBpcyBhbHNvIHVwZGF0ZWQgdGhlIHNh
bWUgd2F5LCB3aGljaAo+Pj4+PiBjb3JyZXNwb25kcyB0byBjb21taXQgWzJdLgo+Pj4+Pgo+Pj4+
PiBUaGlzIGNvbW1pdCBhbHNvIGFkZHMgYW4gZWRrMi1wbGF0Zm9ybXMgcGFja2FnZSBwYXRjaCB0
byBmaXggYSBNYXJ2ZWxsCj4+Pj4+IGJ1aWxkIGZhaWx1cmUgc2VlbiB3aXRoIHRoZSBTb2xpZFJ1
biBNYWNjaGlhdG9CaW4gcGxhdGZvcm0uCj4+Pj4+Cj4+Pj4+IFRoaXMgY29tbWl0IGhhcyBiZWVu
IHJ1bnRpbWUgdGVzdGVkIHdpdGggdGVzdHMgdXNpbmcgRURLMiBwYWNrYWdlLAo+Pj4+PiB3aXRo
IGNvbW1hbmRzOgo+Pj4+Pgo+Pj4+PiDCoMKgwqAgc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyBc
Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgIC1kIGRsIC1vIG91dHB1dF9mb2xkZXIgXAo+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHRlc3RzLmJvb3QudGVzdF9lZGsyIFwKPj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB0ZXN0cy5ib290LnRlc3RfZ3J1Yi5UZXN0R3J1YkFBcmNoNjRFRkkgXAo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRlc3RzLmJvb3QudGVzdF9ncnViLlRlc3RHcnVi
UmlzY1Y2NEVGSSBcCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGVzdHMuYm9vdC50ZXN0
X2dydWIuVGVzdEdydWJYODY2NEVGSSBcCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGVz
dHMucGFja2FnZS50ZXN0X2Z3dHMKPj4+Pj4KPj4+Pj4gSXQgaGFzIGFsc28gYmVlbiBydW50aW1l
IHRlc3RlZCAoYnkgYm9vdGluZyBpbiBxZW11KSB3aXRoIGRlZmNvbmZpZ3MKPj4+Pj4gdXNpbmcg
RURLMiBwYWNrYWdlOgo+Pj4+PiBxZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcKPj4+Pj4gcWVt
dV9sb29uZ2FyY2g2NF92aXJ0X2VmaV9kZWZjb25maWcKPj4+Pj4gcWVtdV9yaXNjdjY0X3ZpcnRf
ZWZpX2RlZmNvbmZpZwo+Pj4+PiBxZW11X3g4Nl82NF9lZmlfZGVmY29uZmlnCj4+Pj4+Cj4+Pj4+
IFsxXSBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazItcGxhdGZvcm1zLwo+Pj4+PiBj
b21taXQvMWU2NGMxMTA5YWUyYWMwMTg1MzUxZThkMGMxOTczMjk3MGQ0ZmVjZgo+Pj4+PiBbMl0g
aHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyLW5vbi1vc2kvCj4+Pj4+IGNvbW1pdC85
NGQwNDg5ODExMTZlMmUzZWRhNTJkYWQxYTg5OTU4ZWU0MDQwOThkCj4+Pj4+Cj4+Pj4+IENjOiBE
aWNrIE9sc3NvbiA8aGlAc2VuemlsbGEuaW8+Cj4+Pj4+IENjOiBSb21haW4gTmFvdXIgPHJvbWFp
bi5uYW91ckBzbWlsZS5mcj4KPj4+Pj4gQ2M6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVo
bGVAYXJtLmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJl
ZS5mcj4KPj4+Pj4gLS0tCj4+Pj4+IFRoZSBlZGsyLXBsYXRmb3JtcyBwYXRjaCBjb250YWlucyBD
Ui1MRiBsaW5lIGVuZGluZ3MsIHdoaWNoIG1pZ2h0IGJlIGNoYW5nZWQKPj4+Pj4gYnkgdGhlIG1h
aWxpbmcgbGlzdCB0byBMRi4gVGhpcyBjYW4gbWFrZSB0aGUgcGF0Y2ggbm90IGFwcGx5IGNsZWFu
bHkuIEZvcgo+Pj4+PiBjb252ZW5pZW5jZSwgSSBhbHNvIHB1Ymxpc2hlZCB0aG9zZSBwYXRjaGVz
IGF0Ogo+Pj4+PiBodHRwczovL2dpdGxhYi5jb20vam9saXZhaW4vYnVpbGRyb290Ly0vY29tbWl0
cy9idW1wX2VkazItc3RhYmxlMjAyNTExCj4+Pj4+IC0tLQo+Pj4+PiDCoENvbmZpZy5pbi5sZWdh
Y3nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCA3ICsrCj4+Pj4+IMKgYm9vdC9lZGsyL0NvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMiArLS0KPj4+Pj4gwqBib290
L2VkazIvZWRrMi5oYXNowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgMiArLQo+Pj4+PiDCoGJvb3QvZWRrMi9lZGsyLm1rwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNSArLS0tCj4+
Pj4+IMKgcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLmhhc2jCoMKgwqDCoMKgwqDC
oCB8wqAgMiArLQo+Pj4+PiDCoHBhY2thZ2UvZWRrMi1ub24tb3NpL2VkazItbm9uLW9zaS5ta8Kg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+Pj4+PiDCoC4uLk1hcnZlbGwtZml4LVNNQklPUy10
eXBlLTctc3RydWN0dXJlcy5wYXRjaCB8IDgwICsrKysrKysrKysrKysrKysrKysKPj4+Pj4gwqBw
YWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLmhhc2jCoMKgwqAgfMKgIDIgKy0K
Pj4+Pj4gwqBwYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLm1rwqDCoMKgwqDC
oCB8wqAgMiArLQo+Pj4+PiDCoDkgZmlsZXMgY2hhbmdlZCwgOTcgaW5zZXJ0aW9ucygrKSwgMjcg
ZGVsZXRpb25zKC0pCj4+Pj4+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZWRrMi1wbGF0
Zm9ybXMvMDAwMS1TaWxpY29uLU1hcnZlbGwtZml4LVNNQklPUy0KPj4+Pj4gdHlwZS03LXN0cnVj
dHVyZXMucGF0Y2gKPj4+Pj4KPj4+Pgo+Pj4+IC4uLgo+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9i
b290L2VkazIvZWRrMi5tayBiL2Jvb3QvZWRrMi9lZGsyLm1rCj4+Pj4+IGluZGV4IDJjMDg5YWVm
Y2EuLmRiYTRhZWQ1MTMgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2Jvb3QvZWRrMi9lZGsyLm1rCj4+Pj4+
ICsrKyBiL2Jvb3QvZWRrMi9lZGsyLm1rCj4+Pj4+IEBAIC00LDcgKzQsNyBAQAo+Pj4+PiDCoCMK
Pj4+Pj4gwqAKPj4+Pj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4+Pj4KPj4+Pj4gLUVESzJf
VkVSU0lPTiA9IGVkazItc3RhYmxlMjAyNTA4Cj4+Pj4+ICtFREsyX1ZFUlNJT04gPSBlZGsyLXN0
YWJsZTIwMjUxMQo+Pj4+PiDCoEVESzJfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2Nv
cmUvZWRrMgo+Pj4+PiDCoEVESzJfU0lURV9NRVRIT0QgPSBnaXQKPj4+Pj4gwqBFREsyX0xJQ0VO
U0UgPSBCU0QtMi1DbGF1c2UtUGF0ZW50Cj4+Pj4+IEBAIC01NiwxNCArNTYsNyBAQCBFREsyX0dJ
VF9TVUJNT0RVTEVTID0gWUVTCj4+Pj4+IMKgRURLMl9CVUlMRF9QQUNLQUdFUyA9ICQoQEQpL0J1
aWxkL0J1aWxkcm9vdAo+Pj4+PiDCoEVESzJfUEFDS0FHRVNfUEFUSFMgPSAkKEBEKSAkKEVESzJf
QlVJTERfUEFDS0FHRVMpICQoU1RBR0lOR19ESVIpL3Vzci9zaGFyZS8KPj4+Pj4gZWRrMi1wbGF0
Zm9ybXMKPj4+Pj4KPj4+Pj4gLWlmZXEgKCQoQlIyX1RBUkdFVF9FREsyX1BMQVRGT1JNX09WTUZf
STM4NikseSkKPj4+Pj4gLUVESzJfQVJDSCA9IElBMzIKPj4+Pj4gLUVESzJfREVQRU5ERU5DSUVT
ICs9IGhvc3QtbmFzbQo+Pj4+PiAtRURLMl9QQUNLQUdFX05BTUUgPSBPdm1mUGtnCj4+Pj4+IC1F
REsyX1BMQVRGT1JNX05BTUUgPSBPdm1mUGtnSWEzMgo+Pj4+PiAtRURLMl9CVUlMRF9ESVIgPSBP
dm1mSWEzMgo+Pj4+PiAtCj4+Pj4+IC1lbHNlIGlmZXEgKCQoQlIyX1RBUkdFVF9FREsyX1BMQVRG
T1JNX09WTUZfWDY0KSx5KQo+Pj4+PiAraWZlcSAoJChCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1f
T1ZNRl9YNjQpLHkpCj4+Pj4+IMKgRURLMl9BUkNIID0gWDY0Cj4+Pj4+IMKgRURLMl9ERVBFTkRF
TkNJRVMgKz0gaG9zdC1uYXNtCj4+Pj4+IMKgRURLMl9QQUNLQUdFX05BTUUgPSBPdm1mUGtnCj4+
Pj4+IEBAIC03NCwxMyArNjcsMTMgQEAgZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfRURLMl9QTEFU
Rk9STV9BUk1fVklSVF9RRU1VKSx5KQo+Pj4+PiDCoEVESzJfQVJDSCA9IEFBUkNINjQKPj4+Pj4g
wqBFREsyX1BBQ0tBR0VfTkFNRSA9IEFybVZpcnRQa2cKPj4+Pj4gwqBFREsyX1BMQVRGT1JNX05B
TUUgPSBBcm1WaXJ0UWVtdQo+Pj4+PiAtRURLMl9CVUlMRF9ESVIgPSAkKEVESzJfUExBVEZPUk1f
TkFNRSktJChFREsyX0FSQ0gpCj4+Pj4+ICtFREsyX0JVSUxEX0RJUiA9ICQoRURLMl9QTEFURk9S
TV9OQU1FKS1BQXJjaDY0Cj4+Pj4+Cj4+Pj4+IMKgZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfRURL
Ml9QTEFURk9STV9BUk1fVklSVF9RRU1VX0tFUk5FTCkseSkKPj4+Pj4gwqBFREsyX0FSQ0ggPSBB
QVJDSDY0Cj4+Pj4+IMKgRURLMl9QQUNLQUdFX05BTUUgPSBBcm1WaXJ0UGtnCj4+Pj4+IMKgRURL
Ml9QTEFURk9STV9OQU1FID0gQXJtVmlydFFlbXVLZXJuZWwKPj4+Pj4gLUVESzJfQlVJTERfRElS
ID0gJChFREsyX1BMQVRGT1JNX05BTUUpLSQoRURLMl9BUkNIKQo+Pj4+PiArRURLMl9CVUlMRF9E
SVIgPSAkKEVESzJfUExBVEZPUk1fTkFNRSktQUFyY2g2NAo+Pj4+Cj4+Pj4gSXQgc2VlbXMgdGhl
IGNvbW1pdCBsb2cgZG9lc24ndCBleHBsYWluIHRoaXMgY2hhbmdlLgo+Pj4KPj4+IFlvdSBhcmUg
Y29ycmVjdC4gSSBmb3Jnb3QgdG8gaW5jbHVkZSB0aGUgZXhwbGFuYXRpb24uCj4+Pgo+Pj4gVGhl
IGZvbGxvd2luZyB0ZXh0IHNob3VsZCBiZSBhZGRlZCBpbiB0aGUgY29tbWl0IGxvZzoKPj4+Cj4+
PiAiIiIKPj4+IFVwc3RyZWFtIGNvbW1pdCBbM10gcmVtb3ZlZCB0aGUgMzJiaXQgQVJNIFZpcnR1
YWwgUGxhdGZvcm1zLiBUaGUKPj4+IHNwZWNpZmljIGNoYW5nZSBbNF0gY2hhbmdlZCBhICIkKEFS
Q0gpIiB0byAiQUFyY2g2NCIuIFBvc3NpYmxlCj4+PiB2YWx1ZXMgZm9yICIkKEFSQ0gpIiB3ZXJl
ICJBQVJDSDY0IiBvciAiQVJNIi4gU2luY2UgTGludXggaGFzCj4+PiBhIGNhc2Ugc2Vuc2l0aXZl
IGZpbGVzeXN0ZW0sIHRoZSBFREsyX0JVSUxEX0RJUiB2YWx1ZXMgbmVlZHMgdG8gYmUKPj4+IHVw
ZGF0ZWQgYWNjb3JkaW5nbHkuCj4+Pgo+Pj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2Nv
cmUvZWRrMi9jb21taXQvCj4+PiBiNDcxZWQyOTY5NGMzNzVlYTFiNmI0ODRlYjcxYWY3M2VkNjFm
ZWNlCj4+PiBbNF0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL2NvbW1pdC8KPj4+
IGI0NzFlZDI5Njk0YzM3NWVhMWI2YjQ4NGViNzFhZjczZWQ2MWZlY2UjZGlmZi01NTIwMGFjOTM0
YmJlNmU4MWJiNDE1OGJmZmY0Nzk3OTkyYjEzZmIxYWZiOTVmZTk4Mjg1MzAyNGM2MDE4NDMwTDIw
LVIyMQo+Pj4gIiIiCj4+Pgo+Pj4gRm9yIGNvbnZlbmllbmNlLCBJJ3ZlIGFsc28gcHVibGlzaGVk
IHRoaXMgdXBkYXRlZCBjb21taXQgbG9nIGF0Ogo+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2
YWluL2J1aWxkcm9vdC8tL2NvbW1pdHMvYnVtcF9lZGsyLXN0YWJsZTIwMjUxMV92Mgo+Pj4KPj4+
IFRlbGwgbWUgaWYgeW91IHdhbnQgbWUgdG8gc2VuZCBhIHYyIG9uIHRoZSBsaXN0Lgo+Pgo+PiBU
aGFua3MgZm9yIHRoZSB1cGRhdGUuCj4+Cj4+IEZvciB0aGUgdXBjb21pbmcgMjAyNi4wMiByZWxl
YXNlLCBJJ20gbm90IHN1cmUgaWYgd2Ugc2hvdWxkIG1lcmdlIHRoaXMgc2VyaWVzCj4+IHJpZ2h0
IG5vdy4gSW5kZWVkIHVwc3RyZWFtIEVESzIgcmVtb3ZlZCB0aGUgSUEzMiBzdXBwb3J0LCBzbyB3
ZSBoYXZlIHRvIGZvbGxvdwo+PiB1cHN0cmVhbSBjaGFuZ2UgZm9yIHRoZSBsb25nLXRlcm0gYnV0
IHdlIHN1ZGRlbmx5IHJlbW92ZSBpdCBmcm9tIEJ1aWxkcm9vdCB3aGlsZQo+PiB1cHN0cmVhbSBz
dGlsbCBwcm92aWRlIGEgc3BlY2lmaWMgYnJhbmNoIGZvciAiYW55IGxvbmcgdGVybSBjb25zdW1l
cnMiLgo+Pgo+PiBJbiBhbiBvdGhlciBoYW5kLCB0aGUgMjAyNi4wMiByZWxlYXNlIHdpbGwgbm90
IGJlIGFuIExUUyByZWxlYXNlIChzZWUKPj4gaHR0cHM6Ly9idWlsZHJvb3Qub3JnL2x0cy5odG1s
KS4KPj4KPj4gVGhvdWdodHM/Cj4gCj4gU2luY2UgMjAyNi4wMiB3aWxsIG5vdCBiZSBhIEJ1aWxk
cm9vdCBMVFMgdmVyc2lvbiwgaXQgZG9lcyBub3QgcmVhbGx5IG1hdHRlcgo+IGlmIHRoaXMgcGF0
Y2ggaXMgYXBwbGllZCBub3cgb2YganVzdCBhZnRlciB0aGUgdXBjb21pbmcgMjAyNi4wMiB0YWcu
IEl0IHdpbGwKPiBqdXN0IGV4dGVuZCBieSB0aGlzIElBMzIgYW5kIEFSTTMyIHN1cHBvcnQgYnkg
MyBtb250aHMgKHdoaWNoIGlzIG5vdCBtdWNoKS4KPiAKPiBJIGFtIGdlbmVyYWxseSBpbmNsaW5l
ZCB0byBmb2xsb3cgdGhlIHVwc3RyZWFtIGRlY2lzaW9ucyBhbmQgdG8ga2VlcAo+IHBhY2thZ2Vz
IHVwIHRvIGRhdGUuIFNvIEkgYmVsaWV2ZSB3ZSB3aWxsIHJlbW92ZSB0aGlzIHN1cHBvcnQgc29v
bmVyIG9mCj4gbGF0ZXIuIEkgaGF2ZSBubyBvcGluaW9uIGlmIHdlIHNob3VsZCBkbyB0aGF0IGJl
Zm9yZSBvciBhZnRlciB0aGUgMjAyNi4wMi4KPiBJbiBhbnkgY2FzZXMsIHRoZSBwcmV2aW91cyBF
REsyIHZlcnNpb24gdGhhdCBzdGlsbCBzdXBwb3J0cyB0aG9zZQo+IGFyY2hpdGVjdHVyZXMgYXJl
IGluIHRoZSBCdWlsZHJvb3QgTFRTLiBTbyB3ZSBjb3VsZCBldmVudHVhbGx5IHBpY2sKPiB0aG9z
ZSBFREsyIG1haW50ZW5hbmNlIHZlcnNpb25zIGZvciBCdWlsZHJvb3QgTFRTIGJyYW5jaGVzLgo+
IAo+IEkgbGV0IG90aGVycyBjb21tZW50IG9uIHRoYXQgdG9waWMsIGlmIG5lZWRlZC4KCldpdGgg
bm8gb3RoZXIgcmVwbHkgYW5kIGFuIGV4dHJhIHRpbWUgYmVmb3JlIGFwcGx5aW5nLgoKQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPj4gQmVzdCBy
ZWdhcmRzLAo+PiBSb21haW4KPj4KPj4KPj4+Cj4+Pj4gQmVzdCByZWdhcmRzLAo+Pj4+IFJvbWFp
bgo+Pj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+Cj4+PiBKdWxpZW4uCj4gCj4gQmVzdCByZWdhcmRz
LAo+IAo+IEp1bGllbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
