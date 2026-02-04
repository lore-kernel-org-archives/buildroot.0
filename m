Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A38E8B386
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 01:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C06D407C0;
	Wed,  4 Feb 2026 01:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAaE5oAV_vSY; Wed,  4 Feb 2026 01:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E9AF407D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770169356;
	bh=liaEvuvlHZRasjIK3FeVnCFJUuhD9zHjhcuN4q7CBik=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ipqTHXDRx7gF2lfxUjwTEHNi0WRi+8yRfiK14cZ4vdGRNPQosznVuXGUtYDTP2Vtx
	 8oAGNKsH0duTX38OfTNYW73FzMqr417kSZeBEdj/AVzDHM1+AUmj2pbZDIhF4uyqJL
	 Hk0aMvsu5Fzwzv1jWgF0Aal7qbvRwccj7kzcY0SoDPLbuwMpORlqNNKEDC0Rt/s2rv
	 +wA6ZrId238iBpSUhyPOnF/SBHjUSkLvkfhJPpfVM7TFq51o4DFggJG19cTe/Otci3
	 wRK0ZtqWIHLtc5Kv5m0Ayv2eOkgWbcShjNpKDR+CjD8sgnzD9nizTsi/Yo9X/SzO/h
	 qO0DT2iBQnauQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E9AF407D2;
	Wed,  4 Feb 2026 01:42:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D666173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 01:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D20340574
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 01:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JR9CFm_dem1x for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 01:42:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82A474056E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82A474056E
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82A474056E
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 01:42:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4359228b7c6so4390437f8f.2
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 17:42:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770169352; cv=none;
 d=google.com; s=arc-20240605;
 b=VXSXexmJ6JejL4AROAs9Iotod7grJ3AwzcwX4kWnnnvqK7SIaOhsfWdkl8eva/qTXI
 M9lk3V00fjaCaT5E7V1lj4t/06zypxFaEDlfuiNFw6IaUXsJCSxzmHMXhqXmrJmJyM+t
 KzJFF8LuvPa1cY3qnp2dLW1npmLcH7hrZvVTbiyls06N2EfaRQ3C50YXpofuGa1WJFts
 X1CStshUAd5SWfxw1u0Yt5w2LqqtQtyK8nnstzGuzqOIE36FqK9VXa8K7kLNBIHiIny4
 JkpH9HzN+aiY2FZhDrQOgrTxA84Kz/iSH1BNpnaonA/PDFCRbC4hhtaEzdCxHAwXoL11
 2B1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sml6wAcv374pw6XwyTs7PdHqfRUYbY6knVpf8cLhyMg=;
 fh=wRmw6LgSvdYxuFsOpgDZxgsvazzHnChEMKZKOcw5uKg=;
 b=Az6kE0W7h0X/D6FPQMEM42Jr9FsX+9FebyVaOAOZSHVn+NWAHcrYKXC3UuUNAo9r1e
 sdtKOey+00ptsRpv904Fx6MPcgazNvtM8Dc9UgVnjBJFIzbra9OFwuq7iYA9LMx3hdcJ
 a+buGyWJ3SbKknZqWypP+UJju4lf6hPUBSxqmnVdRQtNPii5Q6GNqkOBlLdHLjKajE6u
 /d0WMwTo6FQtcUS5QnT3Ocd9nKv3G4kS/dOG9iv+QnfsNU3f96nT5JtMBVjISpZLORkG
 TcwwX69fJ2sTa0znscIzUynpg2mM4ilaHhNLBOlDX0MHvHOnsO11dN/bfsb+raK58h79
 sFVg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770169352; x=1770774152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sml6wAcv374pw6XwyTs7PdHqfRUYbY6knVpf8cLhyMg=;
 b=XsmUWT+6Tc7sF4wJl2GvkzVYW7bNLASRvxBnlzIoMJt68IkN/oUKOehgxhH66LliSP
 /YAKENnNq5w8kpv0XHlp6o80lyDlDYrCiQa5kyMjlQgeSwhXEogf1hX5NJJvLdTRJL0t
 RwsvHVGWt41UntCqxwDUQJRnS6IqxwsT43Q4HEgx5zpchv2p5JesXQHuxliP6zwGPna1
 DtVPUDTBEbH1DUrL4XizFRNWlCP8yCh7vyi8z3HfJ8llO9lDon2ouNULZWmIguUUlr98
 WxWkbP4Nm4OqTFsZPDuWWjGN60V9oDhWcpdgyjWbTL90lUIOBwKKq7pb+XTiCj5L0p1m
 E8cw==
X-Gm-Message-State: AOJu0YxysLlpzJEPSBoZEU5O5HxMTyA9Yf2bR9l/lCzjqQWnAcM7wTZb
 pKu6QM7wQVrQ/pPn+MsJ2CInqtCvfJ+timUVwLvffJfOeBgDL7GP30FGs3KPcL1l8wsMKLDjsl9
 3Qo6IJCkuicgCFdapkbN2Y6dZ+YaQCnPfBlrf
X-Gm-Gg: AZuq6aKph8WvDXoCviMfZMs7YJmJXPRKOahKbddCPWMg7mJhUy5YbrV5V29AxLxqvgO
 HktBRCfMPzyg2xde/mm1qqRXff5wWmksJ8s/GRx8eXRAfawKdEFkYHp1q92Qd7vINKNVd6yM5eF
 5PexxGs/JHagua+RgWP5uJZyWql+7x42d6zo2eF4UsicFC5L/jR8iThJDbBpZBvH4HL0pUGxoGd
 WU/Ex3A2yCJwRm37+Lip9dIWW0LJ2FKREBmp+Al/Whe0aivsv1GVeEHRvi6+7vUGyv60Uo=
X-Received: by 2002:a05:6000:25c4:b0:435:975a:131c with SMTP id
 ffacd0b85a97d-43618053afdmr1654680f8f.36.1770169352116; Tue, 03 Feb 2026
 17:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20260203214254.335146-1-yann.morin.1998@free.fr>
In-Reply-To: <20260203214254.335146-1-yann.morin.1998@free.fr>
From: Jesse T <mr.bossman075@gmail.com>
Date: Tue, 3 Feb 2026 20:41:50 -0500
X-Gm-Features: AZwV_QihrDwhHurVzVSFM07qZPqW9Sf8Sy5k7gf_-CUCkUwDdKgEbxo1oQh1Fu0
Message-ID: <CAJFTR8T7YEw5Qu6QP=wUaT4y6aqomODo=eQYiE7jBTAZTC_xAQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770169352; x=1770774152; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sml6wAcv374pw6XwyTs7PdHqfRUYbY6knVpf8cLhyMg=;
 b=LSn3VYkQ5b/uEeFBMBKtrbX8wnEULZQSz0C7U9MVpDmax7Z/6CLSc4japo4MRL7Kwb
 Sj/ANp4ixsDgVBfIZaqJhPrKJ4RZvtHnGidPmgtWdEYCBiTROtoDorfYxcKmbSBGHYiQ
 3INPtui0kkdBY4AgO3NhopzNoVVO/NwbvMBOg02oxqnghWs8bbwg1MWlTWFHa2Tira3S
 nINvO3FZWwvckBUplHzDmfYTsGp5j0LFs6dD7cWO3dpdAUmW6pM6SSg8KQYr8elbaP1Y
 dOOHQodEhXMrtkGqzaN1Zln67pPz46n21V0yUH7g8dzBnT/9HM2ZEnB2OplCtHjlYo5q
 aZ6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LSn3VYkQ
Subject: Re: [Buildroot] [PATCH] package/pico-sdk: fix host install
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBGZWIgMywgMjAyNiBhdCA0OjQy4oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gV2UndmUgbm90IGJlZW4gdXNpbmcgSE9TVC91c3Ig
Zm9yIHllYXJzIG5vdywgYW5kICdtYWtlIGNoZWNrLXBhY2thZ2UnCj4gZmluZHMgYW5kIHJlcG9y
dHMgdGhlIGlzc3VlOgoKT2ggaW50ZXJlc3RpbmcgZGlkIG5vdCBrbm93LCBzb3JyeSBhYm91dCB0
aGF0LiBsZ3RtLgoKVGhhbmtzLApKZXNzZSBUYXViZQoKPgo+ICAgICAkIC4vdXRpbHMvZG9ja2Vy
LXJ1biBtYWtlIGNoZWNrLXBhY2thZ2UKPiAgICAgcGFja2FnZS9waWNvLXNkay9waWNvLXNkay5t
azoyMzogaW5zdGFsbCBmaWxlcyB0byAkKEhPU1RfRElSKS8gaW5zdGVhZCBvZiAkKEhPU1RfRElS
KS91c3IvCj4gICAgIHBhY2thZ2UvcGljby1zZGsvcGljby1zZGsubWs6MjQ6IGluc3RhbGwgZmls
ZXMgdG8gJChIT1NUX0RJUikvIGluc3RlYWQgb2YgJChIT1NUX0RJUikvdXNyLwo+Cj4gRml4ZXM6
IGNlYjgwMGQzYzYzZmU5MTYyOGY0MmNlNzQ5YzIxMWViZWYyNzg2MjgKPiBGaXhlczogOTI2Mzgx
ZDM2MDA4MmU5MjZjYjZiZTI4Y2IxZTk3NjM5ZDI2ZWEwZgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFu
biBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gQ2M6IEplc3NlIFRhdWJlIDxt
ci5ib3NzbWFuMDc1QGdtYWlsLmNvbT4KPiBDYzogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3Jz
Z2FhcmQuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3BpY28tc2RrL3BpY28tc2RrLm1rIHwgNCArKy0t
Cj4gIHBhY2thZ2UvcGljb3Rvb2wvcGljb3Rvb2wubWsgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcGljby1zZGsvcGljby1zZGsubWsgYi9wYWNrYWdlL3BpY28tc2RrL3BpY28tc2RrLm1rCj4g
aW5kZXggNWJjZjcxNjUwZC4uZGZiMjlkMjMyMCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BpY28t
c2RrL3BpY28tc2RrLm1rCj4gKysrIGIvcGFja2FnZS9waWNvLXNkay9waWNvLXNkay5tawo+IEBA
IC0yMCw4ICsyMCw4IEBAIGRlZmluZSBQSUNPX1NES19JTlNUQUxMX1NUQUdJTkdfQ01EUwo+ICBl
bmRlZgo+Cj4gIGRlZmluZSBIT1NUX1BJQ09fU0RLX0lOU1RBTExfQ01EUwo+IC0gICAgICAgbWtk
aXIgLXAgJChIT1NUX0RJUikvdXNyL3NoYXJlL3BpY28tc2RrCj4gLSAgICAgICBjcCAtciAkKEBE
KS8qICQoSE9TVF9ESVIpL3Vzci9zaGFyZS9waWNvLXNkawo+ICsgICAgICAgbWtkaXIgLXAgJChI
T1NUX0RJUikvc2hhcmUvcGljby1zZGsKPiArICAgICAgIGNwIC1yICQoQEQpLyogJChIT1NUX0RJ
Uikvc2hhcmUvcGljby1zZGsKPiAgZW5kZWYKPgo+ICAkKGV2YWwgJChnZW5lcmljLXBhY2thZ2Up
KQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BpY290b29sL3BpY290b29sLm1rIGIvcGFja2FnZS9w
aWNvdG9vbC9waWNvdG9vbC5tawo+IGluZGV4IGJjYTk0ODk2NjUuLmNmOGUyOTQ4MzUgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9waWNvdG9vbC9waWNvdG9vbC5tawo+ICsrKyBiL3BhY2thZ2UvcGlj
b3Rvb2wvcGljb3Rvb2wubWsKPiBAQCAtMTIsNyArMTIsNyBAQCBQSUNPVE9PTF9MSUNFTlNFX0ZJ
TEVTID0gTElDRU5TRS5UWFQKPiAgUElDT1RPT0xfQ09ORl9PUFRTID0gLURQSUNPX1NES19QQVRI
PSQoU1RBR0lOR19ESVIpL3Vzci9zaGFyZS9waWNvLXNkawo+ICBQSUNPVE9PTF9ERVBFTkRFTkNJ
RVMgPSBsaWJ1c2IgcGljby1zZGsKPgo+IC1IT1NUX1BJQ09UT09MX0NPTkZfT1BUUyA9IC1EUElD
T19TREtfUEFUSD0kKEhPU1RfRElSKS91c3Ivc2hhcmUvcGljby1zZGsKPiArSE9TVF9QSUNPVE9P
TF9DT05GX09QVFMgPSAtRFBJQ09fU0RLX1BBVEg9JChIT1NUX0RJUikvc2hhcmUvcGljby1zZGsK
PiAgSE9TVF9QSUNPVE9PTF9ERVBFTkRFTkNJRVMgPSBob3N0LWxpYnVzYiBob3N0LXBpY28tc2Rr
Cj4KPiAgJChldmFsICQoY21ha2UtcGFja2FnZSkpCj4gLS0KPiAyLjUyLjAKPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
