Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F21D5B846
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDC2540345;
	Mon, 28 Oct 2024 22:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdpB_8kiKYQP; Mon, 28 Oct 2024 22:24:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9844F40631
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9844F40631;
	Mon, 28 Oct 2024 22:24:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B0DEAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15F3F610A8
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4yE3lSpGMg3 for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:24:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1607A6108C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1607A6108C
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1607A6108C
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:24:51 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-4a47fd930b8so1369682137.1
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730154291; x=1730759091;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o5lGB2ETJalX9YSBft3fo/Q2OGiCVZEZzH7g5kN0tbw=;
 b=cUt0eZQwwiKP1TVBDSi5d7ZXkXdr16oXQecnlfc3JldmFuBZ/hah++UL/o3Z4Ixp2l
 XWAH1eGY3pXSUl4Kf/YSn8DQJz/eL88U8W7KEahPbMBoDSPMLukZQC4kRv8Pzi8z57+h
 qR0uQ9tXDq83649skf3XVBe+emB5UnYZZuSdN8UD2WfqlcdqymSudyD47qFMYSS2htra
 5vxOktVtT4J9KlqnwOp2/joQHlS2FkxTe6FMMICoM5qb1u1wlB+8xDoYWhGYD7DUj8lS
 ua3bB6uVBvsDjL7b3n/d1qoXmFE6pN4k0ocDDv9PagbYTK4OV3zaZyv3w5fMeBlmTuoY
 +aEQ==
X-Gm-Message-State: AOJu0YzRmFYwyOcnVz6iONCmTLpzPDw0ECchsqjv3kWCz11MvGdSDMFf
 ucHkxHfP7XGziHrT412erXUwuluhDerD++NlhmpPo/xOlVZxQ322WYwBKXzxB3TJRyyc0jpAgtr
 GO4wiYnRALm6chxA3+6CzWgwoxfUkDw==
X-Google-Smtp-Source: AGHT+IHuDi0vpcr8QVMu9UQS43bQcskhRMJwdNAhMT4749XpzAHqVi2T4+pubHwY0atxJOgGssWpdkAXRUWfcxEfKsU=
X-Received: by 2002:a05:6102:c93:b0:4a5:6f41:211a with SMTP id
 ada2fe7eead31-4a8cfd6d97dmr8341090137.25.1730154290818; Mon, 28 Oct 2024
 15:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241028221045.3354144-1-james.hilliard1@gmail.com>
 <20241028231555.47e73fd0@windsurf>
In-Reply-To: <20241028231555.47e73fd0@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 28 Oct 2024 16:24:39 -0600
Message-ID: <CADvTj4pnpo7CfciZaUhTmb-bvgAgyMgM08Ng3p2+eT-mBpQmLg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Christian Stewart <christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730154291; x=1730759091; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o5lGB2ETJalX9YSBft3fo/Q2OGiCVZEZzH7g5kN0tbw=;
 b=k2l0iTndlJ10UwkXtWCDllsp7zMwZAuJI2dNdwy5ENYLpnXdCk6gpQo2a1A2anmVlj
 3dk6uSKaUbseMMot1yFLisRJlqzFOIjIPC8MblNGwB1KqEYfJ3HqezG5Me0ZkW9IVUNl
 RD72jDZs4hv++meWv/mrYuLDZz8N2nWgSpzMorWk8PqoEd6txlNtLmT6JdqhyaiBHYhg
 gkCSm3y6Fyh1sRuQx7KbhXs+wCxkWjWOUSTqG+HmPXuZZjFp4eXPfotUTPspw0Jlq3Nq
 KzMKnFO7Dd7g7m9aLP47XSA8lfgJSr/t9Ah/ovzjbWZAhaJK2jUhU4KTKK/uR4Wh9g48
 qCEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=k2l0iTnd
Subject: Re: [Buildroot] [PATCH 1/2] package/go/go-cf: new package
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

T24gTW9uLCBPY3QgMjgsIDIwMjQgYXQgNDoxNeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyOCBPY3QgMjAyNCAx
NjoxMDo0NCAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gVGhpcyBpcyBhIGZvcmsgb2YgZ28gbmVlZGVkIGZvciBjbG91ZGZsYXJl
ZCB0byB3b3JrIHByb3Blcmx5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJk
IDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+Cj4gVGhpcyBpcyByZWFsbHkgbnV0cy9jcmF6
eS4gQXJlIHdlIGdvaW5nIHRvIGhhdmUgdG8gcGFja2FnZSBhIGRpZmZlcmVudAo+IEdvIGNvbXBp
bGVyIGZvciBlYWNoIGFuZCBldmVyeSBwcm9qZWN0PwoKWWVhaCwgSSBhZ3JlZSBpdCdzIGEgYml0
IGNyYXp5LCBub3Qgc3VyZSBpZiB0aGVyZSdzIGEgYmV0dGVyIHdheSB0byBoYW5kbGUKdGhpcyBo
b3dldmVyLiBJIHRyaWVkIHRvIG1vZGVsIHRoaXMgb24gaG93IHdlIGN1cnJlbnRseSBoYW5kbGUg
bXVsdGlwbGUKZ28gdG9vbGNoYWlucyBmb3IgYm9vdHN0cmFwcGluZyBwdXJwb3NlcyB3aXRoIHRo
aXMgc2ltcGx5IGRlcGVuZGluZwpvbiB0aGUgbGF0ZXN0IGdvIHRvb2xjaGFpbiBmb3IgYm9vdHN0
cmFwcGluZyBnby1jZi4KCkkgc3VyZSBob3BlIG5vdCwgaG93ZXZlciBmb3IgY2xvdWRmbGFyZWQg
dGhleSBzZWVtIHRvIGJlIGRlcGVuZGluZwpvbiBhIGJ1bmNoIG9mIGV4cGVyaW1lbnRhbCBmZWF0
dXJlcyB0aGF0IGFyZSBub3QgaW4gdXBzdHJlYW0gZ29sYW5nLgoKPgo+IChOb3RlOiB5b3VyIGNv
bW1pdCBtZXNzYWdlIG5lZWRzIGEgbG90IG1vcmUgZXhwbGFuYXRpb24gb24gaG93IGl0Cj4gaW50
ZWdyYXRlcyBpbiBCdWlsZHJvb3QsIHdoYXQgaGFwcGVucyBpZiBvbmUgdXNlcyBib3RoIG5vcm1h
bCBHbyBhbmQKPiBnby1jZiwgd2hldGhlciB0aGV5IHdpbGwgY29uZmxpY3QsIG9yIG5vdCwgZXRj
LikuCgpZZWFoLCBpdCBzaG91bGRuJ3QgY29uZmxpY3QsIEkgZGlkIHZlcmlmeSBJIGNhbiBidWls
ZCBwYWNrYWdlcyB0aGF0IHJlcXVpcmUKZ29sYW5nIDEuMjMgYXQgdGhlIHNhbWUgdGltZSBhcyBj
bG91ZGZsYXJlZCBvbiB0aGVpciAxLjIyIGJhc2VkIGZvcmsuCgo+Cj4gVGhvbWFzCj4gLS0KPiBU
aG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4u
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
