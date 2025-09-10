Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D659CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 20:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27C07418E8;
	Wed, 10 Sep 2025 20:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZG2kpLmZxoUP; Wed, 10 Sep 2025 20:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42892418D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42892418D9;
	Wed, 10 Sep 2025 20:25:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA4BD234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF94D407BB
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2fD4F5onn8b for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 20:24:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB8AB41491
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB8AB41491
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB8AB41491
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:24:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3e3aafe06a7so32068f8f.0
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 13:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757535894; x=1758140694;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dIdz+WgRQfyCEX+aR+O2TL6khAUD3FunVXUUHLsEOuk=;
 b=gI3UD/Xxhl86nvFEgwZt/vvi8nK60Gafv2Nu+jsZEYhCjJ5amNzkMyfQE0tYzNKGqS
 VAYImhQcBQWllaa/gTnb0OiZ0h2tDVm9HU8QwdLteaJVn+qBLuFOs54pzlJrjrIBGT54
 pbNL9kbqVJPRT8s8QppGKf++asIlh0874ER+eaKg31AJnzkj2jvncayzMjaCWLZnzxdL
 WfkGtAJt1j7HcIRAzj2U67eHhmp3AKKD92RDlvoC2r1iB6sp/xNdKTJciJJKIDhtDuD5
 VVR0O7khPt32n6xsIab6VKEKrMY8pMlCP9yMPEJtHFhv919aYFPvZFJC9abnBETluyG5
 +Rqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqRzxO0DubexPpAd1GsqeM4kFRvwhtq5+tEIkS2bgkCMBhIUqSr5zCtnzLw8s1wkO69MWlKQt/8kQ=@buildroot.org
X-Gm-Message-State: AOJu0YyvHyuBnjS1CzcttNH9U2PrVl/62q6gPuh+57Lq2e/Suc5XIoW7
 Nh2+J9nC3WIRZixykXo5Xmlr2V3bMH8mCvBiVWGa25g5RiVyQYwhq9n1p5oaG77s7uQ=
X-Gm-Gg: ASbGncuVmLTbmEI3XlhCneGgWUMDFOkLlm5UmiBTcwX5nHpVugX6Oeb1nief84zZhFe
 uCfceiXEUIALSBoeQMBlpYAkiey5lo3SRB5OlAKPQPXelReMGSGWQ6yvdorAp80qlDeJW+lKnR4
 Ds2NnN/szOzH5mssFkPB7twzf89D3INwnOxeWi7mwBQ/XjfueKHo7TA8I1v7l4+8gvwjtKz9+/K
 dCYSkAJdpvJbpmcVw8FE4x6CoWFbh73lfLbRc/nAcLbDnhZWvkK21MtHaCFYSntf2Q53CPMfyPd
 o0TH/O7btbou8PH7y6Nj+oNQNDyc+kvkfUZe0527ppJfsHnmRqIg44KPQNl2a78eIlzEy60hTj+
 Sov6wq4/NM1YVl5PfH10Ew7VOsZvUgh6Wr84nz9PLXz3k+WYduGvuZVfmEW89UijiJdzRI9ILEh
 iCLApgDuXT2I8YzRagp4UN8/T+uJ8nGEHeLWqce6MQUo/L7y+b/hnET8heKjfcRY8zhHoYW0Ppp
 N61VzUskg==
X-Google-Smtp-Source: AGHT+IHYIo4IFZQyhJICUTDvI6DygcPyEdQgB7GzEz5+6m508r6XGlaijpZcXBYbte5Eu49ZFTbYZw==
X-Received: by 2002:a05:6000:24ca:b0:3d4:4a27:b1c with SMTP id
 ffacd0b85a97d-3e642cade47mr13721338f8f.28.1757535894390; 
 Wed, 10 Sep 2025 13:24:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7522562d1sm8045150f8f.63.2025.09.10.13.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 13:24:53 -0700 (PDT)
Message-ID: <3e98f4b8-2007-4c4e-8511-f969b13bc55c@smile.fr>
Date: Wed, 10 Sep 2025 22:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 buildroot@buildroot.org
References: <20250909-fix_php_lua-v1-1-f3e379f98bf9@bootlin.com>
Content-Language: fr
In-Reply-To: <20250909-fix_php_lua-v1-1-f3e379f98bf9@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757535894; x=1758140694; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dIdz+WgRQfyCEX+aR+O2TL6khAUD3FunVXUUHLsEOuk=;
 b=to0Ca17ijtHe4nbLaD3UBcJgFmc6mYd/GHE6d9tFT/ao9friNqsWNaWawraF3kczbr
 xCLUIktSlGkrUfQcoHZt2v2D4xtxPo5yn3DOlK4RbwyrpE/SnyURIfcXFWRSutHx8Sae
 NnRRQEs06lLIN64jrxVia9C+S45OhFyLQJiK4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=to0Ca17i
Subject: Re: [Buildroot] [PATCH] package/php-lua: fix build with lua < 5.2
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
Cc: =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleGlzLCBBbGwsCgpMZSAwOS8wOS8yMDI1IMOgIDA5OjI0LCBBbGV4aXMgTG90aG9y
w6kgYSDDqWNyaXTCoDoKPiBwaHAtbHVhIGZhaWxzIHRvIGJ1aWxkIGluIGJ1aWxkcm9vdCAyMDI1
LjA4LXJjMyBvbiB0aGUgZm9sbG93aW5nIGVycm9yOgo+IAo+IGluIGZpbGUgaW5jbHVkZWQgZnJv
bSBbLi4uXS91c3IvaW5jbHVkZS9waHAvWmVuZC96ZW5kLmg6MzIsCj4gICAgICAgICAgICAgICAg
ICBmcm9tIFsuLi5dL3Vzci9pbmNsdWRlL3BocC9tYWluL3BocC5oOjMxLAo+ICAgICAgICAgICAg
ICAgICAgZnJvbSBbLi4uXS9idWlsZC9waHAtbHVhLTIuMC43L2x1YS5jOjI0Ogo+IFsuLi5dL2J1
aWxkL3BocC1sdWEtMi4wLjcvbHVhLmM6IEluIGZ1bmN0aW9uIOKAmHBocF9sdWFfd3JpdGVfcHJv
cGVydHnigJk6Cj4gWy4uLl0vYnVpbGQvcGhwLWx1YS0yLjAuNy9sdWEuYzoyNDc6Mzc6Cj4gZXJy
b3I6IOKAmHZhbOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRp
ZCB5b3UgbWVhbgo+IOKAmHp2YWzigJk/Cj4gICAyNDcgfCAgICAgICAgIGx1YV9wdXNobHN0cmlu
ZyhMLCBaU1RSX1ZBTCh2YWwpLCBaU1RSX0xFTih2YWwpKTsKPiAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fgo+IFsuLi5dL3Vzci9pbmNsdWRlL3BocC9aZW5k
L3plbmRfc3RyaW5nLmg6NjY6MjY6Cj4gbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJha
U1RSX1ZBTOKAmQo+ICAgIDY2IHwgI2RlZmluZSBaU1RSX1ZBTCh6c3RyKSAgKHpzdHIpLT52YWwK
PiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+Cj4gWy4uLl0vYnVpbGQvcGhw
LWx1YS0yLjAuNy9sdWEuYzoyNDc6Mzc6Cj4gbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZp
ZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uCj4gaXQgYXBwZWFycyBp
bgo+ICAgMjQ3IHwgICAgICAgICBsdWFfcHVzaGxzdHJpbmcoTCwgWlNUUl9WQUwodmFsKSwgWlNU
Ul9MRU4odmFsKSk7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefn4KPiBbLi4uXS91c3IvaW5jbHVkZS9waHAvWmVuZC96ZW5kX3N0cmluZy5oOjY2OjI2Ogo+
IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYWlNUUl9WQUzigJkKPiAgICA2NiB8ICNk
ZWZpbmUgWlNUUl9WQUwoenN0cikgICh6c3RyKS0+dmFsCj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn5+fgo+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6MjE0OiBsdWEubG9dIEVy
cm9yIDEKPiAKPiBUaGUgaXNzdWUgdHJpZ2dlcnMgb25seSBpZiBsdWEgaW50ZXJwcmV0ZXIgdmVy
c2lvbiBpcyBsb3dlciB0aGFuIDUuMi4gSW4KPiB0aGlzIGNhc2UsICBwaHBfbHVhX3dyaXRlX3By
b3BlcnR5IGNhbGxzIFpTVFJfVkFMIG9uIHRoZSB3cm9uZyB2YXJpYWJsZS4KPiAKPiBGaXggcGhw
LWx1YSBidWlsZCBieSBjYWxsaW5nIFpTVFJfVkFMIG9uIHRoZSBjb3JyZWN0IHZhcmlhYmxlLgo+
IAo+IFN1Z2dlc3RlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4g
U2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNv
bT4KCkFkZGluZyBUaG9tYXMgUGVyYWxlIGluIENjIGZvciBzdGFibGUgYnJhbmNoZXMuCgpBcHBs
aWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+IFdo
aWxlIHRoaXMgcGF0Y2ggZml4ZXMgcGhwLWx1YSB3aXRoIGx1YSA8IDUuMiwgdGhpcyB3b3VsZCBt
YWtlcyBpdCB5ZXQKPiBhbm90aGVyIGRvd25zdHJlYW0tb25seSBwYXRjaCwgd2hpY2ggaXMgbm90
IHJlYWxseSBkZXNpcmFibGUuIEkgd2lsbAo+IHBpbmcgaW4gdGhlIG1lYW4gdGltZSB0aGUgaW5h
Y3RpdmUgdXBzdHJlYW0gcmVwb3NpdG9yeXYgdG8gY2hlY2sgaWYKPiB0aGVyZSBpcyBhbnkgY2hh
bmNlIHRoYXQgaXQgY291bGQgYmUgdXBkYXRlZCB0byBpbnRlZ3JhdGUgdGhvc2UgcGF0Y2hlcy4K
PiAtLS0KPiAgLi4uYS5jLWZpeC1aU1RSX1ZBTC11c2FnZS13aGVuLXVzaW5nLWx1YS01LjIucGF0
Y2ggfCAzOCArKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGhwLWx1YS8wMDA0LWx1YS5jLWZp
eC1aU1RSX1ZBTC11c2FnZS13aGVuLXVzaW5nLWx1YS01LjIucGF0Y2ggYi9wYWNrYWdlL3BocC1s
dWEvMDAwNC1sdWEuYy1maXgtWlNUUl9WQUwtdXNhZ2Utd2hlbi11c2luZy1sdWEtNS4yLnBhdGNo
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwLi5jNWQ5OWRiN2Y1MTgzNjJiZjZlOGQwOTgxZTM4Y2E4OWQ0YWU3MDg4
Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcGhwLWx1YS8wMDA0LWx1YS5jLWZpeC1a
U1RSX1ZBTC11c2FnZS13aGVuLXVzaW5nLWx1YS01LjIucGF0Y2gKPiBAQCAtMCwwICsxLDM4IEBA
Cj4gK0Zyb20gN2JmMzM0ODMyYWQzNmQxZjI5NzY0MDZkNjgwYjM1YTE2OGZmYWE5MSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogPT9VVEYtOD9xP0FsZXhpcz0yMExvdGhvcj1DMz1B
OT89IDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPiArRGF0ZTogTW9uLCA4IFNlcCAyMDI1
IDE3OjIwOjEyICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gbHVhLmM6IGZpeCBaU1RSX1ZBTCB1
c2FnZSB3aGVuIHVzaW5nIGx1YSA8IDUuMgo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50
LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNv
ZGluZzogOGJpdAo+ICsKPiArV2hlbiB1c2luZyBhIGx1YSBpbnRlcnByZXRlciB3aXRoIGEgdmVy
c2lvbiBsb3dlciB0aGFuIDUuMSwgdGhlCj4gK3BocF9sdWFfd3JpdGVfcHJvcGVydHkgZW5kcyB1
cCBjYWxsaW5nIHRoZSBaU1RSX1ZBTCB3aXRoIHRoZSB3cm9uZwo+ICt2YXJpYWJsZSAoaXQgaXMg
ZXhwZWN0ZWQgdG8gcmVjZWl2ZSAibWVtYmVyIiwgYSB6ZW5kX3N0cmluZyB2YXJpYWJsZSwKPiAr
YnV0IGl0IGlzICJ2YWx1ZSIgdGhhdCBpcyBwYXNzZWQsIHdoaWNoIGlzIGEgenZhbCkuCj4gKwo+
ICtGaXggcGhwLWx1YSBjb21wYXRpYmlsaXR5IHdpdGggaW50ZXJwcmV0ZXJzIDwgNS4yIGJ5IHBh
c3NpbmcgdGhlIGNvcnJlY3QKPiArdmFyaWFibGUKPiArCj4gK1Vwc3RyZWFtOiB1cHN0cmVhbSBk
ZWFkLCBjdXN0b20gcGF0Y2gKPiArU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4
aXMubG90aG9yZUBib290bGluLmNvbT4KPiArLS0tCj4gKyBsdWEuYyB8IDIgKy0KPiArIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICsKPiArZGlmZiAtLWdp
dCBhL2x1YS5jIGIvbHVhLmMKPiAraW5kZXggYTQwZTVkYTQ0MmE0Li41ODg5YmM3ZjgzZWEgMTAw
NzU1Cj4gKy0tLSBhL2x1YS5jCj4gKysrKyBiL2x1YS5jCj4gK0BAIC0yNDQsNyArMjQ0LDcgQEAg
c3RhdGljIHp2YWwqIHBocF9sdWFfd3JpdGVfcHJvcGVydHkoemVuZF9vYmplY3QgKm9iamVjdCwg
emVuZF9zdHJpbmcgKm1lbWJlciwgenYKPiArIAlsdWFfU3RhdGUgKkwgPSBwaHBfbHVhX29ial9m
cm9tX29iaihvYmplY3QpLT5MOwo+ICsgCj4gKyAjaWYgKExVQV9WRVJTSU9OX05VTSA8IDUwMikK
PiArLQlsdWFfcHVzaGxzdHJpbmcoTCwgWlNUUl9WQUwodmFsKSwgWlNUUl9MRU4odmFsKSk7Cj4g
KysJbHVhX3B1c2hsc3RyaW5nKEwsIFpTVFJfVkFMKG1lbWJlciksIFpTVFJfTEVOKG1lbWJlcikp
Owo+ICsgCXBocF9sdWFfc2VuZF96dmFsX3RvX2x1YShMLCB2YWx1ZSk7Cj4gKyAKPiArIAlsdWFf
c2V0dGFibGUoTCwgTFVBX0dMT0JBTFNJTkRFWCk7Cj4gKy0tIAo+ICsyLjUxLjAKPiArCj4gCj4g
LS0tCj4gYmFzZS1jb21taXQ6IDU2ZDlkNWU4ZjA4NzI3MzdmZDc5YWJmNmE2MGU2NjkyMGJiNzg2
MWMKPiBjaGFuZ2UtaWQ6IDIwMjUwOTA4LWZpeF9waHBfbHVhLTliZjc4NzJiMjViNQo+IAo+IEJl
c3QgcmVnYXJkcywKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
