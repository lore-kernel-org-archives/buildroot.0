Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BCFC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FC684031D;
	Tue,  4 Feb 2025 14:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzIMH7o0UrEo; Tue,  4 Feb 2025 14:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 976AD4043D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 976AD4043D;
	Tue,  4 Feb 2025 14:47:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B0FE12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F4EB60783
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElFpJSTWfcM3 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:47:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.173;
 helo=mail-yw1-f173.google.com; envelope-from=bryce.d.johnson@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46AA860AD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46AA860AD3
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46AA860AD3
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:47:29 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6f88509dad2so39859997b3.3
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 06:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738680448; x=1739285248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HwhQJLvprdqE4FTSMu0NA4HI1vtLrdBDBEljOG2mtXk=;
 b=OJGON6rKGZYSGbl1fM/zPLfXyvndrjZqVUxSR6G4dSwzmLxUrUld7LhtOoigbNwSQV
 5BNPsrr2Ci9H3gQ85a4Q7ScabS8ol3dtmv92uAGDQ1BduAlp6faJ46QXiON/a9QXtpOF
 NzFIoWkeIIEX/Guu+XWw+aGZrgTOounM0d4xLFIgDo3moplFX/EI6Hpzn7FKftCdF9Jt
 Lg0VgVJydUYjmS6JlEY5q02r2i68cQvbheNZeEEkNjzPKUY6ywyUeOT76wtZVawasNZv
 iTa9kjWgOm5AhG2ECaRtPBdi8QvODzBwV0E9PMYQ+H2lWGrfE21KUjSeOTFtljWGqQi3
 4mjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDr/PTYcSQMaV2uCX0eCrqVCKktPSAnHJFsPqWeHEiAAXhra2AIT1E21NOtJh3IgEheA1CbzlaZok=@buildroot.org
X-Gm-Message-State: AOJu0YwE56VxrDoWaGyJYl/Q3Ly9MJq06Uju7x9rKjh9FB+b11uY/f6u
 eq+n5DN/pTnkJMjdYUXFyXJlAHYBhip63Qt23UvXAK1QM0BtTHaoncnIWw==
X-Gm-Gg: ASbGncu6udJVQVJRFW4/9L6gAs3miK3nbW3KUKMDIm3guOCDSptb+V4hfE8bZEmkXEC
 BoUgYVZqQpvJndNoonodH/r5OFF62OLUK97tpZLclTQcls8LJEJaafkjM4+qd7V8u0XHdU85dwd
 wkioEg+cq2+Pgqurw+wWRCH1n+ZpCIJLGHwbCd6yCjAA5bKI/6AdDGRbicNp6LzxH6v9YqAr9dI
 inaqfdtkfg7SflGSYYo/kYVaRaZSaj8FVtD7wKKrYTv9wtKrcv2wyVjqs9A6Ud+TC2ffvs+xDfW
 j6doOh15mALlXz28paJCzJiYtIDtHN8nqe6QMlxfk7nJIW1RksQF76pFRNM=
X-Google-Smtp-Source: AGHT+IGaBOqtLvJ5LF/tdlr/vBS0VKtcrRvBwyCZfAl17bxBjGamJ3NspnktUHtk7MHrkPrFVKOfBg==
X-Received: by 2002:a05:6902:110f:b0:e58:5cf:bc52 with SMTP id
 3f1490d57ef6-e58a4a94a08mr19977484276.9.1738680447870; 
 Tue, 04 Feb 2025 06:47:27 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e5b17231766sm305645276.49.2025.02.04.06.47.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 06:47:27 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e53a5ff2233so5808151276.3
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 06:47:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWaV2ZEtKXfiQW/qi+sAIYdR0lEEHtGMTCZyYhk+nruEbPFPf81j/C+pNfDIvfGh18eWRfkzHUk+lg=@buildroot.org
X-Received: by 2002:a05:6902:707:b0:e4e:891:c8cd with SMTP id
 3f1490d57ef6-e58a4ac37b9mr19071866276.14.1738680446941; Tue, 04 Feb 2025
 06:47:26 -0800 (PST)
MIME-Version: 1.0
References: <035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr>
 <3ea35c40-07d1-41d3-b4f9-08bbb0336d24@smile.fr>
 <4e691513-04a1-4f6f-ad3a-df18f653a6b7@grenoble.cnrs.fr>
 <f6d14b70-cf74-4a03-80fd-5e4fc4325a47@gmx.de>
 <d01683ed-cc7e-4c0d-a807-7a76ce7129ba@smile.fr>
 <1c7e531a-e549-4893-b8fd-d7e9cb01f319@gmx.de>
In-Reply-To: <1c7e531a-e549-4893-b8fd-d7e9cb01f319@gmx.de>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Tue, 4 Feb 2025 07:47:15 -0700
X-Gmail-Original-Message-ID: <CADXxVSJ-0GtrywPpHwy_naA2Jx=aj31c=qLbNtt+bQ6YVqujnQ@mail.gmail.com>
X-Gm-Features: AWEUYZmvCGOkaksEmUOlz7cHRqzDgLQiOfKWAOOB6ZLn58zUe5NpJya7Cokvkow
Message-ID: <CADXxVSJ-0GtrywPpHwy_naA2Jx=aj31c=qLbNtt+bQ6YVqujnQ@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Romain Naour <romain.naour@smile.fr>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Buildroot development <buildroot@buildroot.org>,
 Michael Walle <mwalle@kernel.org>, 
 Chris Packham <judge.packham@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=redpinelabs.com
Subject: Re: [Buildroot] [PATCH v2 1/1] linux: make out-of-tree DTS work
 with newest kernels
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

SGkgRmlvbmEsCkkgdHJpZWQgdGhlIHBhdGNoIGFuZCBpdCBsb29rcyBpbnRlcmVzdGluZywgd2Fz
IHRoZXJlIGEgd2F5IHRvIHN0aWxsCmluY2x1ZGUgc29tZSBkdHNpIGluY2x1ZGVkIGluIHRoZSBr
ZXJuZWw/ICBGb3IgZXhhbXBsZSwgSSBoYXZlIGEKY3VzdG9tIGJvYXJkIHdpdGggVEkgQU02Mlgu
ICBJIG1pZ2h0IGhhdmUgYSBteWJvYXJkLmR0cyB0aGF0IHdhbnRzIHRvCmluY2x1ZGUgZnJvbSB0
aGUga2VybmVsLCBrMy1hbTYyNS5kdHNpIHdoaWNoIGluY2x1ZGVzIGszLWFtNjIuZHRzaSwKd2hp
Y2ggaW5jbHVkZSBrMy1hbTYyLW1haW4uZHRzaSxrMy1hbTYyLW1jdS5kdHNpLCBrMy1hbTYyLXdh
a2V1cC5kdHNpLApldGMuCgpJIGNvdWxkIHByb2JhYmx5IGNvcHkgdGhlbSBhbGwgb3ZlciBhbmQg
aGF2ZSBjdXN0b20tZHRicyBidWlsZCBpdCwgYnV0Cm5vdCBxdWl0ZSBhcyBjb252ZW5pZW50IHNp
bmNlIGluIGdlbmVyYWwgSSBzaG91bGRuJ3QgbmVlZCB0byB0b3VjaAp0aG9zZSB1bmRlcmx5aW5n
IGNoaXAgc3VwcG9ydCBkdHNpIGFuZCB3YW50IHRvIHB1bGwgaW4gYnVnIGZpeGVzIG9yCmFkZGVk
IGZlYXR1cmVzIHdoZW4gSSBidW1wIGtlcm5lbCB2ZXJzaW9uLgoKQnJ5Y2UKCk9uIE1vbiwgRmVi
IDMsIDIwMjUgYXQgODo0OOKAr0FNIEZpb25hIEtsdXRlIHZpYSBidWlsZHJvb3QKPGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPgo+IEFtIDI5LjAxLjI1IHVtIDExOjEwIHNjaHJpZWIg
Um9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3Q6Cj4gPiBIZWxsbyBGaW9uYSwgQWxsLAo+ID4KPiA+
IExlIDI4LzAxLzIwMjUgw6AgMTQ6MzMsIEZpb25hIEtsdXRlIGEgw6ljcml0IDoKPiA+PiBBbSAy
NC4xMi4yNCB1bSAxMzoyMiBzY2hyaWViIEVkZ2FyIEJvbmV0Ogo+ID4+PiBIZWxsbyEKPiA+Pj4K
PiA+Pj4gT24gMjAyNC0xMi0xOCwgUm9tYWluIE5hb3VyIHdyb3RlOgo+ID4+Pj4gSGVsbG8gRWRn
YXIsCj4gPj4+Pgo+ID4+Pj4gTGUgMTcvMTIvMjAyNCDDoCAxMDo1NSwgRWRnYXIgQm9uZXQgYSDD
qWNyaXQgOgo+ID4+Pj4+IFNpbmNlIExpbnV4IDYuMTIgKGNvbW1pdCBlN2UyOTQxMzAwZDIsICJr
YnVpbGQ6IHNwbGl0IGRldmljZSB0cmVlIGJ1aWxkCj4gPj4+Pj4gcnVsZXMgaW50byBzY3JpcHRz
L01ha2VmaWxlLmR0YnMiKSwgdGhlIGtlcm5lbCBidWlsZCBwcm9jZXNzIGRvZXMgbm90Cj4gPj4+
Pj4gYnVpbGQgdGhlIERUQnMgZnJvbSB0aGUgc291cmNlIGZpbGVzIGxpc3RlZCBpbgo+ID4+Pj4+
IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRILlsxXSBUaGlzIGlzIGJlY2F1c2UgaXQg
ZXhwZWN0cyBhbGwgdGhlCj4gPj4+Pj4gRFRTIGZpbGVzIHRvIGxpdmUgaW4gdmVuZG9yLXNwZWNp
ZmljIHN1YmRpcmVjdG9yaWVzIG9mCj4gPj4+Pj4gYXJjaC8kQVJDSC9ib290L2R0cy8gLCB3aGVy
ZWFzIEJ1aWxkcm9vdCBkcm9wcyB0aGVtIGluIHRoZSB0b3AgZHRzCj4gPj4+Pj4gZGlyZWN0b3J5
Lgo+ID4+Pj4KPiA+Pj4+IE1heWJlIHdlIGNvdWxkIGFkZCBzb21lIGFkZGl0aW9uYWwgZXhwbGFu
YXRpb246Cj4gPj4+Pgo+ID4+Pj4gQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEggd2Fz
IGludHJvZHVjZWQgaW4gQnVpbGRyb290IDIwMTIuMDggWzFdIGF0IHRoZQo+ID4+Pj4gdGltZSB0
aGUga2VybmVsIGRpZG4ndCBoYXZlIGFueSB2ZW5kb3Itc3BlY2lmaWMgc3ViZGlyZWN0b3J5IGlu
Cj4gPj4+PiBhcmNoLyRBUkNIL2Jvb3QvZHRzLy4KPiA+Pj4+Cj4gPj4+PiB2ZW5kb3Itc3BlY2lm
aWMgc3ViZGlyZWN0b3J5IHdhcyBpbnRyb2R1Y2VkIGluIGtlcm5lbCB2My4xOSBbMl0gZm9yIEFS
TTY0IGFuZCBpbgo+ID4+Pj4ga2VybmVsIHY2LjUgZm9yIEFSTSBbM10uIE5vdGUsIG90aGVyIGFy
Y2ggdGhhbiBBUk0gYW5kIEFSTTY0IGRvZXNuJ3QgYWN0dWFsbHkKPiA+Pj4+IHVzZSBhIHZlbmRv
ci1zcGVjaWZpYyBzdWJkaXJlY3RvcnkgKG5vdCBldmVuIHBvd2VycGMpLgo+ID4+Pgo+ID4+PiBJ
IGhhZG4ndCBub3RpY2VkIHRoYXQgdGhpcyB2YXJpZXMgYW1vbmcgYXJjaHMuIE5vdyB0aGF0IEkg
bG9vayBhdCBpdCwgaXQKPiA+Pj4gYXBwZWFycyBtaXBzIGFuZCByaXNjdiBhbHNvIHVzZSB2ZW5k
b3Itc3BlY2lmaWMgc3ViZGlyZWN0b3JpZXMuCj4gPj4+Cj4gPj4+PiBZb3VyIGNvbW1lbnQgZG9l
c24ndCBzZWVtcyB0byBhcHBseSBmb3Igbm9uIEFSTXssNjR9IGFyY2g6Cj4gPj4+PiAiVGhpcyBp
cyBiZWNhdXNlIGl0IGV4cGVjdHMgYWxsIHRoZSBEVFMgZmlsZXMgdG8gbGl2ZSBpbiB2ZW5kb3It
c3BlY2lmaWMKPiA+Pj4+IHN1YmRpcmVjdG9yaWVzIG9mIGFyY2gvJEFSQ0gvYm9vdC9kdHMvIgo+
ID4+Pgo+ID4+PiBJbmRlZWQsIGl0IGlzIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQuCj4gPj4+Cj4g
Pj4+PiBbMV0KPiA+Pj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC8tLwo+ID4+Pj4gY29tbWl0LzY5ZmM0OTdkZjBhZTUxYmNjOGEwNjdjODQ5NDQ3YWJkZWIzY2Iy
YmUKPiA+Pj4+IFsyXQo+ID4+Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvPwo+ID4+Pj4gaWQ9Y2E1YjM0MTAw
YzU3MTY1OGU2MDVjNTU1NGFhYzM3NDY0OTU5MzMyNwo+ID4+Pj4gWzNdCj4gPj4+PiBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0
L2NvbW1pdC8/Cj4gPj4+PiBpZD03MjRiYTY3NTE1MzIwNTVkYjc1OTkyZmM2YWUyMWMzZTMyMmU5
NGE3Cj4gPj4+Pgo+ID4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+IEZ1bGZpbGxpbmcgdGhpcyBrZXJuZWwg
ZXhwZWN0YXRpb24gd291bGQgcmVxdWlyZSBhIG5ldyBjb25maWd1cmF0aW9uCj4gPj4+Pj4gcGFy
YW1ldGVyIGZvciB0aGUgbmFtZSBvZiB0aGUgYXBwcm9wcmlhdGUgdmVuZG9yIHN1YmRpcmVjdG9y
eS4gSXQgd291bGQKPiA+Pj4+PiBhbHNvIHJlcXVpcmUgY2hhbmdpbmcgdGhlIHJlbGF0aXZlIHBh
dGhzIHRvIGluY2x1ZGVkIC5kdHNpIGZpbGVzLgo+ID4+Pj4+Cj4gPj4+Pj4gTGV0J3MgYWRkIGlu
c3RlYWQgYSBydWxlIHRvIHRoZSB0b3AgZHRzL01ha2VmaWxlIGZvciBlYWNoIERUQiB3ZSB3YW50
IHRvCj4gPj4+Pj4gYnVpbGQuIFRoaXMgYXZvaWRzIGJyZWFraW5nIHVzZXIncyBvdXQtb2YtdHJl
ZSBjb25maWd1cmF0aW9ucy4KPiA+Pj4+Pgo+ID4+Pj4+IFsxXSBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDI0LU9jdG9iZXIvNzY1NDYzLmh0bWwKPiA+
Pj4+Cj4gPj4+PiBOb3RlOiBZb2N0byBkb2Vzbid0IHJlbHkgb24gdGhlIGtlcm5lbCBidWlsZCBp
bmZyYXN0cnVjdHVyZSB0byBidWlsZCB1c2VyCj4gPj4+PiBwcm92aWRlZCBkZXZpY2V0cmVlIFs0
XS4KPiA+Pj4+Cj4gPj4+PiBNYXliZSB3ZSBzaG91bGQgY29uc2lkZXIgYWRkaW5nIGEgbmV3IHBh
Y2thZ2UgaW5mcmFzdHJ1Y3R1cmUgbGlrZSBrZXJuZWwtbW9kdWxlPwo+ID4+Pgo+ID4+PiBUaGlz
IHNlZW1zIGxpa2UgYW4gaW50ZXJlc3Rpbmcgb3B0aW9uLiBJdCBpcywgaG93ZXZlciwgYmV5b25k
IG15Cj4gPj4+IGNhcGFiaWxpdGllcy4KPiA+Pgo+ID4+IEJpdCBsYXRlIHRvIHRoZSBwYXJ0eSwg
YnV0OiBJIGN1cnJlbnRseSBoYXZlIGEgcGFja2FnZSBpbiBhbiBleHRlcm5hbAo+ID4+IHRyZWUg
dGhhdCB0YWtlcyBhIGxpc3Qgb2YgLmR0cy8uZHRzbyBmaWxlcyBmcm9tIGNvbmZpZyBhbmQgY2Fs
bHMgY3BwICYKPiA+PiBkdGMgdG8gYnVpbGQgLmR0Yi8uZHRibyBmaWxlcywgd2l0aCBpbmNsdWRl
IHBhdGhzIGludG8gdGhlIExpbnV4IGJ1aWxkCj4gPj4gZGlyIGFkZGVkLiBUaGUgYnVpbGQgY29t
bWFuZHMgYXJlIG5hdHVyYWxseSBtb2RlbGVkIG9uIGhvdyB0aGUga2VybmVsCj4gPj4gYnVpbGQg
YnVpbGRzIERUQnMsIGJ1dCBpdCBkb2Vzbid0IHJlbHkgb24gdGhlIGtlcm5lbCBNYWtlZmlsZXMu
Cj4gPgo+ID4gQUZBSUssIHRoZSBjdXJyZW50IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19Q
QVRIIG9wdGlvbiBkb2Vzbid0IHNlZW1zIHRvIHRha2UKPiA+IGludG8gYWNjb3VudCBhbnkgZXh0
ZXJuYWwgZGV2aWNldHJlZSBvdmVybGF5IGZpbGVzIChkdHNvKS4KPiA+Cj4gPiBJJ3ZlIHNlbmQg
YSBuZXcgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIChidXQgZHRzbyBhcmUgbm90IHN1cHBvcnRlZCk6
Cj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjUwMTI5MDk1NzE2
LjI1MTE0MzQtMS1yb21haW4ubmFvdXJAc21pbGUuZnIvVC8jdAo+ID4KPiA+Pgo+ID4+IFdvdWxk
IHNvbWV0aGluZyBsaWtlIHRoYXQgYmUgaW50ZXJlc3RpbmcgZm9yIEJ1aWxkcm9vdCwgd2hldGhl
ciBhcyBhCj4gPj4gZ2VuZXJpYyBEVEIgYnVpbGQgcGFja2FnZSBvciBpbmZyYXN0cnVjdHVyZT8K
PiA+Cj4gPiBXaGlsZSByZXZpZXdpbmcgdGhpcyBwYXRjaCwgSSBoYWQgdG8gdGFrZSBhIGxvb2sg
YXQgaG93IHRvIGJ1aWxkIGEgZHRiIGZpbGUKPiA+IG91dHNpZGUgb2YgdGhlIGtlcm5lbCBidWls
ZCBpbmZyYXN0cnVjdHVyZSAobGlrZSBZb2N0byBkb2VzKSBidXQgaXQncyBub3QgZWFzeS4KPiA+
IEFjdHVhbGx5IHdlIGFyZSBoYXBweSB0byBrZWVwIHRoaXMgYnVpbGQgcHJvY2VzcyBoaWRkZW4g
aW4gdGhlIGtlcm5lbCBNYWtlZmlsZXMuCj4gPgo+ID4gU2luY2UgdGhlIG5leHQgQnVpbGRyb290
IG1lZXRpbmcgaXMgbmV4dCB3ZWVrLCB0aGlzIGlzIHByb2JhYmx5IGEgdG9waWMgd2UgY2FuCj4g
PiBkaXNjdXNzLiBGZWVsIGZyZWUgdG8gc2VuZCBhIHBhdGNoIChldmVuIGEgZHJhZnQpLgo+IEkn
dmUganVzdCBzZW50IGEgcGF0Y2gsIGFuZCB3b3VsZCBiZSBoYXBweSB0byBoZWFyIHdoYXQgeW91
IHRoaW5rLiBJJ20KPiBub3QgYXQgdGhlIG1lZXRpbmcsIGJ1dCBhdmFpbGFibGUgb24gSVJDIGlm
IHRoZXJlJ3MgYW55dGhpbmcgdG8gZGlzY3Vzcy4gOi0pCj4KPiBTZWU6Cj4gaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MDIwMzE1NDY1MS4y
NzkwNzg0LTEtZmlvbmEua2x1dGVAZ214LmRlLwo+Cj4gQmVzdCByZWdhcmRzLAo+IEZpb25hCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
