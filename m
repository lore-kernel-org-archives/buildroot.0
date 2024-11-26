Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7888D65552
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 19:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6435A409FD;
	Tue, 26 Nov 2024 19:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Llxmb5hjdLKG; Tue, 26 Nov 2024 19:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31FFD4ECAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31FFD4ECAB;
	Tue, 26 Nov 2024 19:57:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA8E0DB3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 19:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B5264EBC3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 19:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmFVGJGYBuB0 for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 19:57:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B5A8A409FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5A8A409FD
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5A8A409FD
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 19:57:51 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2ea1c453f0eso4751794a91.1
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 11:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732651071; x=1733255871;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=daXOSCLVW8Bi0dBO+wT16YjvXRchJXc0XBJ8U6z55j0=;
 b=ICQfg4hg2nQT7CueQewiCVMljyJwfrdwJo1WJIjVmRBiRf91otQdSUgsWRdh4VYJcG
 NZhNdNG8LzswS5UV0VpQmuaW3xpp5FERwBhk0vnbxwM0c7P+BpNd/KnZ3QP7wSG6WxxE
 iiAr7ZiLVONdwLkQ4aZYnRRI/Cp3vhdlKwOPUwLcACA4+nXhomPVxJywQMDYbfFlfwWE
 cSaBFGKZdKtHO1qHFYqn8z0NtsoAFIf0OVYMDFro5zNf0RgwyFMu2UURJv03NjaVruQ5
 Xb12+/pHyXkSxBW3gxx+hXXjomU6ReCDiMwi/0SVVeq0+AssaaVltvYqMJA0GpCUpl1E
 UvSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUayeCAUwFxn7NBSm7zVPQbIFxbQNby72G6u/MvpU2ME1Njf7tGTOKH2dekr5eIglpPo5QDpHenY1I=@buildroot.org
X-Gm-Message-State: AOJu0YxUSpkTwZ9FITqTBBmUwc/CCwmaasMx9C+Of5z1DsxlmDKy2AEf
 Cs+BzJErEDGGlG+EI7LW1o1WG+ic9bsI3JAszGi2GsZa6qjmQQpKbeZsVtj2keug8uukeBjok9Z
 7E91EviRwSsVIsi5bSRFgu6CpTP55hg==
X-Gm-Gg: ASbGncvZFLKifbPuQUHjp382+tqv7qM9FNhFv5HU4BAEO9lgNcHeC+KccD08bsPgr3i
 LunJxBFjNuEEYCBwb+XCrYNwUEQ6F5yI=
X-Google-Smtp-Source: AGHT+IFpZNDMedUr+NKY1OZhcRhXdJwlSavytwX+GiBARqezWP9hsfbxgx/WrBuJ9nbLbj1O7OkGTi3y6NoFILHLRaA=
X-Received: by 2002:a17:90b:2d0d:b0:2ea:8c5c:ff63 with SMTP id
 98e67ed59e1d1-2ee097bdd21mr649743a91.29.1732651070857; Tue, 26 Nov 2024
 11:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20241119205901.58762-1-vjardin@free.fr>
 <CADwxmTktxHDhbw56oraJFHrNknUD+sqNvbAD8EpOEJHKs-5vDQ@mail.gmail.com>
 <q75xktmldvlans2dyvm2ssodi7bzjcpqb7yyjw6mowmb4i5yhc@em7opvmlgjgm>
 <CADwxmTk+-1moJHWyPXsxrgN+aiG0biNCU-m86a+Rguw04SDaJg@mail.gmail.com>
 <19369aaf5c0.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <19369aaf5c0.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
From: Brandon Maier <brandon.maier@gmail.com>
Date: Tue, 26 Nov 2024 13:57:39 -0600
Message-ID: <CADwxmTnvhL1rg7T2k8Ye+wV0gx2oCCjLmnKiCfUQsY7ud9RVPA@mail.gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: Robin Jarry <robin@jarry.cc>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732651071; x=1733255871; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=daXOSCLVW8Bi0dBO+wT16YjvXRchJXc0XBJ8U6z55j0=;
 b=TMlYCGaXFE0PbeCR5lgE7BRYGy9a2rIt3BFryC5BMiTY8XzOiK1NU7/Gtam06hiEgR
 tB1yqzk0eGY8C0F9A0Oqk3qXsHcKWLysIhqXbgmdGWJ+JDZbpFZG3IFo61zAVR3bhzvt
 eixpKxuXsC7zGUKfFBmaWgAxJnkALAeETJUbt7CHAmX4xac77QaNbgGSuQZB9uEPzCdl
 2NuuYF6t4mQX0yIxTrEAp+axdA0KUNTVvej9TAEAY0Rkr7awXScZ80maCWk1U6zAE87X
 V2skDAz0xETzu0fnwjEcux+clCKiWmyFay8WshKlXEyo0H9i5HUvgcm7P6bvkEscDQMr
 Xr5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TMlYCGaX
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: h files only into
 sysroot
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

T24gVHVlLCBOb3YgMjYsIDIwMjQgYXQgMTI6MTDigK9QTSBWaW5jZW50IEphcmRpbiA8dmphcmRp
bkBmcmVlLmZyPiB3cm90ZToKLi4uCj4KPiBSZWdhcmRpbmcgdGhlIGRvY3VtZW50YXRpb24sIHNo
b3VsZCB0aGUgdXBkYXRlIG9mIGh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFs
L2FkZGluZy1wYWNrYWdlcy1tZXNvbi50eHQgYmUgcGFydCBvZiBhIHNhbWUgY29tbWl0IG9yIHNo
b3VsZCBpdCBiZSBhbm90aGVyIGNoYW5nZSBzZXQgPwoKSSBiZWxpZXZlIHRoZSBwcmVmZXJyZWQg
d2F5IGlzIHRvIGRvIHlvdXIgY2hhbmdlcyB0byBwa2ctbWVzb24ubWsgaW4KdGhlIGZpcnN0IGNv
bW1pdC4gVGhlbiBoYXZlIGEgc2Vjb25kIGNvbW1pdCB0aGF0IHVwZGF0ZXMgdGhlCmRvY3VtZW50
YXRpb24uIFNlbmRpbmcgdGhvc2UgYm90aCBpbiB0aGUgc2FtZSBwYXRjaCBzZXJpZXMuCgo+Cj4g
QmVzdCByZWdhcmRzLAo+ICAgIFZpbmNlbnQKPgo+Pgo+PiAtIEJyYW5kb24KPj4KPj4+Cj4+PiBi
ZXN0IHJlZ2FyZHMsCj4+PiBWaW5jZW50Cj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
