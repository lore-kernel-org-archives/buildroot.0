Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3222ACD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEC09844F1;
	Fri, 15 May 2026 17:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHxekYwLlJk6; Fri, 15 May 2026 17:18:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEC33843DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778865527;
	bh=mWHEZxlWbk0SSJtLfSq1bMVUrjAdh9N+TnEPZHV7TBk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=o3nPquBWC5FDg0l/K0IzhyAxII2RY0Mi3S312FJ1VXn7GpwqD1uRw7pCJDliDTy6F
	 uq//rTB5JMuXCoJ5W+0uRvWQ1P7ntU6WLINgCVwXCgJLpA7q0nu0UaZJVJkLIyUrtw
	 3bGo1QxznitNbOg0Y2NgRU+3fFFNgsluyKrJBDtAXe15ITGdi8fvSoyapbyUYFQs44
	 TuQxF426vfGqTx1lBj5gFzG/NQRV0vvUfPwtocZ5WAVEvLSLT5ZlPr+gBEPA3kzlpy
	 Iim59QRQpBgnMDo1VaJrfX8Yz9LX0PFz5b3DgUmsE86OSbK+EnsTyJmuN6hQsXQnlM
	 OTzu1JAxrrepg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEC33843DB;
	Fri, 15 May 2026 17:18:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76C0923F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68E6C60F27
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cccQEj3Tk7Yy for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:18:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 44AA16078F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44AA16078F
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44AA16078F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:18:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-45d96d21e82so13534f8f.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778865522; x=1779470322;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Borz2iwdBSC7vHoS2gBAUgXLNb/AGIWd+IgZ9AAtH0E=;
 b=CfSu3X95zGY5E/Ey0lzJNQuprw35R14kOy3yjF4wY0MDnVZthevo1OVPKhhliJXWGa
 bHE8IBI6qVGzgq7DZqSPl0eQt9g1KuSThEQUHSDlQnlI4qM8xOzjk9hXsCux8kTxne1w
 nGvV66mLWdrDWAfUqddJGieuC2sPGHuu5hDMEwIS+7UrhfWIDfK+hBQ6bmt3GPYSxn+e
 NFkK/t1pkArCkTgqlSDWph0j9LPRQUbX69VWxXtHGCAjCoZScy9A05HrUmg0TzrImDlE
 yYKYfO8sEzWfDizcLKCswAMRTWRnfC8L2PPOFnP801np1m48hmaUCb60mUbs0a/M6+zF
 66NQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+wtiDP9jBPnRIyEGJnK9iKnA0vltYamhZ213xOxrFlU8YFwsj3CVM/itnxWPKX4N1oCnN5XNPX6NA=@buildroot.org
X-Gm-Message-State: AOJu0Yz6sCtUDONnJbbEelAksMFaKrqX9lxbo/H703GpHyZXSHkiP073
 N4a3XfKOKq3yniOOq56SMMMO0CxWd8TXyVplBHF6ejFl5o1TU7+vh21P9PFd+j8ZPdyFKoHIBwb
 r+NGJLwo=
X-Gm-Gg: Acq92OEKbuDk9hdowmdru7aWiqB3QSF4CdveQ94faGMX2XjMmiGxtGfIkYaSlW5OgHU
 oJcVOHXdxx1wbigWzO/vYxjz47m9LHJVM9ZqB01Jb5h0+UXDBCg+5jBBYDVBBKEhS+4gb500fp7
 ZV037sJ7dxP9NxUbgw23nkIOo30abJYj69TuPOJxizgh+VI8KbDezbZYqUpx5LOpeHyyEBMFw0p
 cSPy70x0fpqJT70iutBsvwIF1H8XYZksBDIEveMiv+qtyQuDPQbl/qcCOVm1NXZxB8RMnqI0w1O
 94npSIQRxPhXF0bF7rHwUERPTOO2X1tf07FD9d3w62Sn8xaYcQHXTAINmr5qaQHjLNsuRoS5wr/
 bhgT1prxSUbM7R4OHKoJMMo9gR5qo7D6E6BjecBeUZsObzUfhapLNCaLe57KCCa4SHbXaO3tk5S
 pT8VdZcQ8ublkNRvmCoApd16gfn0ANO/q8gcW6gTPsvVrD+YPwR3hnLXfT9VnD+rD6rww7grnkl
 s52nuet2fL0b0xICs1c8B10P0wMya4DGI3luBaIClCIejWuEAT8OXMhcmc6Vi1rIA==
X-Received: by 2002:a05:6000:2584:b0:43d:7783:c684 with SMTP id
 ffacd0b85a97d-45e5c5e6d3dmr6753484f8f.43.1778865522019; 
 Fri, 15 May 2026 10:18:42 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe1a41sm17251116f8f.31.2026.05.15.10.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:18:41 -0700 (PDT)
Message-ID: <ee4c15d0-c536-4101-8a25-2e30ce3e44d5@smile.fr>
Date: Fri, 15 May 2026 19:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
References: <20260416225157.25398-1-fl@n621.de>
Content-Language: fr
In-Reply-To: <20260416225157.25398-1-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778865522; x=1779470322; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Borz2iwdBSC7vHoS2gBAUgXLNb/AGIWd+IgZ9AAtH0E=;
 b=Jpz01+9IfnigbDhYnYB2eO6TCTbmSgDlkROxsYeHsWijM2LW1KbYKu4zWO1XxSPbbv
 FtomsusaGeY94YyNul9KaGC+n/GkAfGhtsJq6MidKcfP23Ixs7tKb6QCclExR6+UNq38
 XS0aYuF4CL7PosoK6Wley9L9C3MifdxEeBlqs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Jpz01+9I
Subject: Re: [Buildroot] [PATCH 1/2] package/libnfs: fix build on strict
 alignment archs
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

SGVsbG8gRmxvcmlhbiwKCkxlIDE3LzA0LzIwMjYgw6AgMDA6NTEsIEZsb3JpYW4gTGFyeXNjaCBh
IMOpY3JpdMKgOgo+IEJ1aWxkaW5nIGxpYm5mcyBmYWlscyBvbiB0YXJnZXRzIHRoYXQgaGF2ZSBh
bGlnbm1lbnQgcmVxdWlyZW1lbnRzIHZpYQo+IC1XY2FzdC1hbGlnbiBldmVuIHRob3VnaCB0aGUg
dW5kZXJseWluZyBidWZmZXJzIGFyZSBzdWZmaWNpZW50bHkKPiBhbGlnbmVkLiBJbXBvcnQgdGhl
IHVwc3RyZWFtIGZpeCB0aGF0IHNpbGVuY2VzIHRob3NlIHdhcm5pbmdzLgo+IAo+IEZpeGVzOiBo
dHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZDdjL2Q3YzBiYzU4NjFhZmRm
OWJjMjY5MDZlOWFiZDIxN2JlZjg5OGZjNDgKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIExh
cnlzY2ggPGZsQG42MjEuZGU+CgpJIGFwcGxpZWQgb25seSB0aGUgZmlyc3QgcGF0Y2ggb2YgdGhp
cyBzZXJpZXMgdG8gbWFzdGVyIHNpbmNlIGl0IGZpeGVzCmF1dG9idWlsZGVyIGZhaWx1cmVzIGJ5
IGFwcGx5aW5nIGFuIHVwc3RyZWFtIHBhdGNoLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gLS0t
Cj4gIC4uLnZvaWQtY2FzdC10by1hbGxvdy1jb21waWxlLWZvci1hcm0zMi5wYXRjaCB8IDY4ICsr
KysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlibmZzLzAwMDMtc29ja2V0LXVzZS12b2lkLWNh
c3QtdG8tYWxsb3ctY29tcGlsZS1mb3ItYXJtMzIucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJuZnMvMDAwMy1zb2NrZXQtdXNlLXZvaWQtY2FzdC10by1hbGxvdy1jb21waWxlLWZv
ci1hcm0zMi5wYXRjaCBiL3BhY2thZ2UvbGlibmZzLzAwMDMtc29ja2V0LXVzZS12b2lkLWNhc3Qt
dG8tYWxsb3ctY29tcGlsZS1mb3ItYXJtMzIucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAuLjFmNzFhMzkxZTcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFj
a2FnZS9saWJuZnMvMDAwMy1zb2NrZXQtdXNlLXZvaWQtY2FzdC10by1hbGxvdy1jb21waWxlLWZv
ci1hcm0zMi5wYXRjaAo+IEBAIC0wLDAgKzEsNjggQEAKPiArRnJvbSBjNjZkYzlhNjU3MjNlNjEw
ZmQwMmRhMzg0NzFkNjhiODI4OWViMDc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9t
OiBSdWRpIEhlaXRiYXVtIDxydWRpQGhlaXRiYXVtLmNvbT4KPiArRGF0ZTogVHVlLCAxNCBKYW4g
MjAyNSAxNDowOTozNiArMDAwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIHNvY2tldDogdXNlIHZvaWQg
Y2FzdCB0byBhbGxvdyBjb21waWxlIGZvciBhcm0zMgo+ICsKPiArV2hlbiBjb21waWxpbmcgZm9y
IGFybTMyIHRoZSBlcnJvcjogY2FzdCBpbmNyZWFzZXMgcmVxdWlyZWQgYWxpZ25tZW50Cj4gK29m
IHRhcmdldCB0eXBlIG9jY3Vycy4KPiArCj4gKy9saWIvc29ja2V0LmM6IEluIGZ1bmN0aW9uICdy
cGNfcmVhZF9mcm9tX3NvY2tldCc6Cj4gK2xpYi9zb2NrZXQuYzo1ODY6NDk6IGVycm9yOiBjYXN0
IGluY3JlYXNlcyByZXF1aXJlZCBhbGlnbm1lbnQgb2YgdGFyZ2V0IHR5cGUgWy1XZXJyb3I9Y2Fz
dC1hbGlnbl0KPiArICA1ODYgfCAgICAgICAgICAgICAgICAgICAgICAgICBycGMtPnJtX3hpZFsx
XSA9IG50b2hsKCoodWludDMyX3QgKikmYnVmWzBdKTsKPiArICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gK2xpYi9zb2NrZXQuYzo1ODc6
NjE6IGVycm9yOiBjYXN0IGluY3JlYXNlcyByZXF1aXJlZCBhbGlnbm1lbnQgb2YgdGFyZ2V0IHR5
cGUgWy1XZXJyb3I9Y2FzdC1hbGlnbl0KPiArICA1ODcgfCAgICAgICAgICAgICAgICAgICAgICAg
ICBycGMtPnBkdSA9IHJwY19maW5kX3BkdShycGMsIG50b2hsKCoodWludDMyX3QgKikmYnVmWzBd
KSk7Cj4gKyAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXgo+ICtsaWIvc29ja2V0LmM6Nzk5OjM1OiBlcnJvcjogY2FzdCBp
bmNyZWFzZXMgcmVxdWlyZWQgYWxpZ25tZW50IG9mIHRhcmdldCB0eXBlIFstV2Vycm9yPWNhc3Qt
YWxpZ25dCj4gKyAgNzk5IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqKCh1aW50
MzJfdCAqKXJwYy0+aW5idWYpID0gaHRvbmwocnBjLT5ybV94aWRbMV0pOwo+ICsgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gK2xpYi9zb2NrZXQuYzo4NjE6NzE6
IGVycm9yOiBjYXN0IGluY3JlYXNlcyByZXF1aXJlZCBhbGlnbm1lbnQgb2YgdGFyZ2V0IHR5cGUg
Wy1XZXJyb3I9Y2FzdC1hbGlnbl0KPiArICA4NjEgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBSRUFEM3JlcyAqcmVzID0gKFJFQUQzcmVzICop
IHJwYy0+cGR1LT56ZHJfZGVjb2RlX2J1ZjsKPiArICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+ICsK
PiArY2FzdCB2aWEgKHZvaWQgKikgdG8gYWxsb3cgdGhlIGNvbXBpbGUgdG8gc3VjZWVkLCBhcyBh
bGwgb2YgdGhlIHNvdXJjZSBidWZmZXJzIHNob3VsZCBiZSAzMmJpdCBhbGlnbmVkLgo+ICsKPiAr
U2lnbmVkLW9mZi1ieTogUnVkaSBIZWl0YmF1bSA8cnVkaUBoZWl0YmF1bS5jb20+Cj4gKwo+ICtV
cHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3NhaGxiZXJnL2xpYm5mcy9jb21taXQvYTAxZDQy
YTBkOTY4MmQzZTUwNmQzYzc4NjgwZGI4YzdkMTU4ZmU4OAo+ICtTaWduZWQtb2ZmLWJ5OiBGbG9y
aWFuIExhcnlzY2ggPGZsQG42MjEuZGU+Cj4gKy0tLQo+ICsgbGliL3NvY2tldC5jIHwgOCArKysr
LS0tLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
PiArCj4gK2RpZmYgLS1naXQgYS9saWIvc29ja2V0LmMgYi9saWIvc29ja2V0LmMKPiAraW5kZXgg
ZjUxY2E0ZC4uNWI5ZmNlNSAxMDA2NDQKPiArLS0tIGEvbGliL3NvY2tldC5jCj4gKysrKyBiL2xp
Yi9zb2NrZXQuYwo+ICtAQCAtNTgzLDggKzU4Myw4IEBAIHJwY19yZWFkX2Zyb21fc29ja2V0KHN0
cnVjdCBycGNfY29udGV4dCAqcnBjKQo+ICsgCQl9Cj4gKyAJCWlmICghcnBjLT5pc19zZXJ2ZXJf
Y29udGV4dCkgewo+ICsgCQkJcnBjLT5ybV94aWRbMF0gPSBjb3VudDsKPiArLQkJCXJwYy0+cm1f
eGlkWzFdID0gbnRvaGwoKih1aW50MzJfdCAqKSZidWZbMF0pOwo+ICstCQkJcnBjLT5wZHUgPSBy
cGNfZmluZF9wZHUocnBjLCBudG9obCgqKHVpbnQzMl90ICopJmJ1ZlswXSkpOwo+ICsrCQkJcnBj
LT5ybV94aWRbMV0gPSBudG9obCgqKHVpbnQzMl90ICopKHZvaWQgKikmYnVmWzBdKTsKPiArKwkJ
CXJwYy0+cGR1ID0gcnBjX2ZpbmRfcGR1KHJwYywgbnRvaGwoKih1aW50MzJfdCAqKSh2b2lkICop
JmJ1ZlswXSkpOwo+ICsgCQkJaWYgKHJwYy0+cGR1ID09IE5VTEwpIHsKPiArIAkJCQlycGNfc2V0
X2Vycm9yKHJwYywgIkZhaWxlZCB0byBtYXRjaCBpbmNvbWluZyBQRFUvWElELiIKPiArIAkJCQkJ
CSIgSWdub3JpbmcgUERVIik7Cj4gK0BAIC03OTYsNyArNzk2LDcgQEAgcnBjX3JlYWRfZnJvbV9z
b2NrZXQoc3RydWN0IHJwY19jb250ZXh0ICpycGMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIH0KPiArIAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBD
b3B5IHRoZSBuZXh0IDQgYnl0ZXMgaW50byBpbmJ1ZiAqLwo+ICstICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAqKCh1aW50MzJfdCAqKXJwYy0+aW5idWYpID0gaHRvbmwocnBjLT5ybV94
aWRbMV0pOwo+ICsrICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqKCh1aW50MzJfdCAq
KSh2b2lkICopcnBjLT5pbmJ1ZikgPSBodG9ubChycGMtPnJtX3hpZFsxXSk7Cj4gKyAKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogYnV0IHNldCBpbnBvcyB0byAwLCB3ZSB3
aWxsIHVwZGF0ZSBpdCBhYm92ZQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KiB0aGF0IHdlIGhhdmUgYWxyZWFkeSByZWFkIHRoZXNlIDQgYnl0ZXMgaW4KPiArQEAgLTg1OCw3
ICs4NTgsNyBAQCBycGNfcmVhZF9mcm9tX3NvY2tldChzdHJ1Y3QgcnBjX2NvbnRleHQgKnJwYykK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIElm
IHRoZSBSRUFEIGZhaWxlZCwgYmFpbCBvdXQgaGVyZSBhcyB0aGVyZSBpcyBubwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICogZGF0YS4KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwo+ICstICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgUkVBRDNy
ZXMgKnJlcyA9IChSRUFEM3JlcyAqKSBycGMtPnBkdS0+emRyX2RlY29kZV9idWY7Cj4gKysgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBSRUFEM3Jl
cyAqcmVzID0gKFJFQUQzcmVzICopKHZvaWQgKikgcnBjLT5wZHUtPnpkcl9kZWNvZGVfYnVmOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJl
cy0+c3RhdHVzICE9IE5GUzNfT0spIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBwYXlsb2FkX2ZpbmlzaGVkOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICstLSAKPiAr
Mi41My4wCj4gKwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
