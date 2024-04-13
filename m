Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A867C4345F
	for <buildroot@archiver.kernel.org>; Sat, 13 Apr 2024 07:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 952C28225E;
	Sat, 13 Apr 2024 07:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUDfYhDgzAT0; Sat, 13 Apr 2024 07:20:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83B8382260
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83B8382260;
	Sat, 13 Apr 2024 07:20:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AF481BF348
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 07:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6669041601
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 07:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MM26EWOI_Ccl for <buildroot@lists.busybox.net>;
 Sat, 13 Apr 2024 07:20:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9660040788
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9660040788
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9660040788
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 07:20:21 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d8743ecebdso17421861fa.1
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 00:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712992819; x=1713597619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KAY7nVb6GcjIf//3jCOkOoS8zwjdC1CxcjxG4sDtPpE=;
 b=h8aG8RopPCxUrJkV4AlLZrOUctnH60Slv22M40qwFktzp6kcsDX19ulTbI0oqXapl+
 Psoj8RnuWzQuJzOyeGqM2OBA03zcmc+Cg51aHQ+Ygp90aDpE9wWtDoRdaVs9Qz1vlIG5
 mgDoVRnh11mnPV0ckxd8j1VV0rTSXjrZYm5tV8AFTXYa9WoadfIHhhGZY8WSu+x64Gai
 72K0mugaAG6Pb9YUNRAbnKf3MMIasdQ5sfDP5HZ6hGVY57YOiCOPHhzAaUSM2iJgIYpO
 9AFA2jJBps0VUmTzvjLCwG3hWxtbBfemctFMCMqGFuY07QQEPwhl71BUr6wdESyf9Uo0
 NmRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrwK4J3bc9NusiQ309FiebUAs0VRL7jovso1Py0MxkfHiFF9MRG1c4p4Yax23NJAnD+vsCXAzvogdrsCzwuNFU3PPshH5d3g==
X-Gm-Message-State: AOJu0YzQ9JkaZKTei6Le48sDEnqjRjF5Fel5LbY9RknEIIriM1asphW/
 Us/g+19zQa/Gt99Mm0Ki7shnHgL1xio9zo2urxRxqOED9mdQ//BuJwd1i8qibpdiOEmM+37S9z3
 Jg3sxchUvaXfRnuFfrnbNaJuQTDk=
X-Google-Smtp-Source: AGHT+IH1QVl9PXCJ1GmfREYYeRvt/1t+FfxMgcAoPIeN1dDaXAYwXqbCiwzpgkS58r6EgLIWJYv0yx6uMvpvQhYfuCs=
X-Received: by 2002:a2e:9c4f:0:b0:2d8:408c:3f5b with SMTP id
 t15-20020a2e9c4f000000b002d8408c3f5bmr3386167ljj.5.1712992818831; Sat, 13 Apr
 2024 00:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240412055358.1354293-1-heiko.thiery@gmail.com>
 <ZhlWuOI9ZJzGMh6i@landeda> <ZhlYatOD6uL7X6Hr@landeda>
 <f3d41702-e1e6-464f-b282-c8f0309b566d@smile.fr>
In-Reply-To: <f3d41702-e1e6-464f-b282-c8f0309b566d@smile.fr>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 13 Apr 2024 09:20:06 +0200
Message-ID: <CAEyMn7aRqmhRvtvtCdNqkzhv4BjLr1O3=0xJmjL9JbDctfha7w@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712992819; x=1713597619; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KAY7nVb6GcjIf//3jCOkOoS8zwjdC1CxcjxG4sDtPpE=;
 b=DmILxZAELHLh1bzvAN4SQ95FCmfeQLRmnpKk9C6jEhTaHKSnHWbNzFJzQzb4yrnbGw
 1fr9OLpO9clO29H0C7shuZHCNPseaftFiNJ6V1Y9lGAvHUMRxQZZ+AoOh6e1jbuRfcka
 jcil5X47XqyyIe63xHXMYqMylkDo6IJJLITvnFLdl4EG2XU0mdt6ZbRsEJjPtkT1EiGs
 FnB+FUIMOUbjGPv7cSJBOR8sY8Q9tHTJp8ALzy0ySU34Mj4SQZk2iRDUwT75D41Zw8mN
 uHO5dFZR0h8ZSdcEcRxXo+1QaFiZAqxLnGACEEqHUy0w1zdXT4LVzAcXzVIPPyF9fUAG
 x1CA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DmILxZAE
Subject: Re: [Buildroot] [PATCH v3 1/3] package/python-yamllint: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLCBhbGwsCgpBbSBGci4sIDEyLiBBcHIuIDIwMjQgdW0gMjI6NTQgVWhyIHNjaHJp
ZWIgUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Ogo+Cj4gSGVsbG8gSGVpa28s
IFlhbm4sIEFsbCwKPgo+IExlIDEyLzA0LzIwMjQgw6AgMTc6NTEsIFlhbm4gRS4gTU9SSU4gYSDD
qWNyaXQgOgo+ID4gSGVpa28sIEFsbCwKPiA+Cj4gPiBPbiAyMDI0LTA0LTEyIDE3OjQzICswMjAw
LCBZYW5uIEUuIE1PUklOIHNwYWtlIHRodXNseToKPiA+PiBIZWlrbywgQWxsLAo+ID4+Cj4gPj4g
T24gMjAyNC0wNC0xMiAwNzo1MyArMDIwMCwgSGVpa28gVGhpZXJ5IHNwYWtlIHRodXNseToKPiA+
Pj4gVGhpcyBob3N0IHBhY2thZ2UgaXMgbmVlZGVkIHNpbmNlIHUtYm9vdCAyMDI0LjA0IGZvciBi
dWlsZGluZyB0aSBkZWZjb25maWdzLgo+ID4+Pgo+ID4+PiBUaGlzIGlzIGFuIHJlcXVpcmVtZW50
IGZvciB1c2luZyBidWlsZG1hbi9iaW5tYW4gWzFdLgo+ID4+Pgo+ID4+PiBbMV0gaHR0cHM6Ly9z
b3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vYmxvYi92MjAyNC4wNC90b29scy9idWlsZG1h
bi9yZXF1aXJlbWVudHMudHh0P3JlZl90eXBlPXRhZ3MjTDMKPiA+Pj4KPiA+Pj4gU2lnbmVkLW9m
Zi1ieTogSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPgo+ID4+PiAtLS0KPiA+
PiBbLS1TTklQLS1dCj4gPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi15YW1sbGludC9D
b25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi15YW1sbGludC9Db25maWcuaW4KPiA+Pj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+Pj4gaW5kZXggMDAwMDAwMDAwMC4uNWMwOTYyZjA5Zgo+ID4+PiAt
LS0gL2Rldi9udWxsCj4gPj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXlhbWxsaW50L0NvbmZpZy5p
bgo+ID4+PiBAQCAtMCwwICsxLDggQEAKPiA+Pj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05f
WUFNTExJTlQKPiA+Pj4gKyAgIGJvb2wgInB5dGhvbi15YW1sbGludCIKPiA+Pj4gKyAgIHNlbGVj
dCBCUjJfUEFDS0FHRV9QWVRIT05fUEFUSFNQRUMgIyBydW50aW1lCj4gPj4KPiA+PiAgICAgJCAu
L3V0aWxzL2RvY2tlci1ydW4gbWFrZSBjaGVjay1wYWNrYWdlCj4gPj4gICAgIHBhY2thZ2UvcHl0
aG9uLXlhbWxsaW50L0NvbmZpZy5pbjozOiBCUjJfUEFDS0FHRV9QWVRIT05fUEFUSFNQRUMgcmVm
ZXJlbmNlZCBidXQgbm90IGRlZmluZWQKPiA+Pgo+ID4+IE9LLCBJJ2xsIGdvIGFuZCBhcHBseSB0
aGF0IG90aGVyIHBhdGNoIG9mIHlvdXJzIHRoYXQgaW50cm9kdWNlcyB0aGUKPiA+PiB0YXJnZXQg
dmFyaWFudCBmb3IgcHl0aG9uLXBhdGhzcGVjLCBidXQgd2hpY2ggaXMgbm90IGluIHRoaXMgcGF0
Y2hzZXQuCj4KPiBXaGF0IGlmIHB5dGhvbi1wYXRoc3BlYyBpcyBub3QgaW5zdGFsbGVkIG9uIHRo
ZSBob3N0Pwo+Cj4gbWFrZSBob3N0LXB5dGhvbi15YW1sbGludAo+Cj4gLi9vdXB1dC9ob3N0L2Jp
bi9weXRob24gLi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3lh
bWxsaW50LnB5Cj4KPiBNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBtb2R1bGUgbmFtZWQgJ3BhdGhz
cGVjJwo+Cj4gV2UgbXVzdCBhZGQgaG9zdC1weXRob24tcGF0aHNwZWMgKGFuZCBhbGwgb3RoZXIg
cnVudGltZSBkZXBlbmRlbmNpZXMpIGluIGJ1aWxkCj4gZGVwZW5kZW5jaWVzIG9mIGhvc3QtcHl0
aG9uLXlhbWxsaW50CgpZb3UgYXJlIHJpZ2h0IC4uIEkganVzdCByZXRlc3RlZCB0aGlzIGFuZCBj
YW4gY29uZmlybS4gSSB3aWxsIHByZXBhcmUKYSBwYXRjaC4gSSBhbHNvIHNlZSB0aGF0IHRoZSBQ
WVRIT05fWUFNTExJTlRfU0VUVVBfVFlQRSBpcyBub3QKY29ycmVjdC4gSSBoYWQgdG8gdXNlIHNl
dHVwdG9vbHMgYW5kIG5vdCBwZXA1MTcuCgpJdCdzIHJlYWxseSBub3QgdmVyeSBzYXRpc2Z5aW5n
IHRoYXQgd2l0aCB0aGUgZ3Jvd3RoIG9mIGJpbm1hbiBzbyBtYW55CmRlcGVuZGVuY2llcyBmb3Ig
dGhlIHVib290IGFyZSBub3cgY29taW5nIGluLgoKPgo+ICAgIyBUaGlzIGlzIGEgcnVudGltZSBk
ZXBlbmRlbmN5LCBidXQgd2UgZG9uJ3QgaGF2ZSB0aGUgY29uY2VwdCBvZgo+ICAgIyBydW50aW1l
IGRlcGVuZGVuY2llcyBmb3IgaG9zdCBwYWNrYWdlcy4KPiAgIEhPU1RfUFlUSE9OX1lBTUxMSU5U
X0RFUEVOREVOQ0lFUyArPSBcCj4gICAgIGhvc3QtcHl0aG9uLXBhdGhzcGVjIFwKPiAgICAgaG9z
dC1weXRob24tcHl5YW1sCj4KPiBBY3R1YWxseSwgSSdtIG5vdCBzdXJlIGlmIGV2ZXJ5IGhvc3Qt
cHl0aG9uIHBhY2thZ2VzIHJlYWxseSBkbyB0aGlzLgoKSSB0aGluayB5b3UgYXJlIHJpZ2h0LgoK
PiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4KCi0tIApIZWlrbwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
