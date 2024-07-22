Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA8FC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 17:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 959BA40330;
	Mon, 22 Jul 2024 17:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ko-GFJZvfPpM; Mon, 22 Jul 2024 17:22:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C1E640331
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C1E640331;
	Mon, 22 Jul 2024 17:22:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 087BE1BF2F7
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 17:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0198140331
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 17:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnnAtXFxooTR for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 17:22:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e33; helo=mail-vs1-xe33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97EAC40330
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97EAC40330
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97EAC40330
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 17:22:09 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-492a774c807so390219137.3
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 10:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721668928; x=1722273728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HeCl1I1twBsWlxWLy2Tocp0WBliMxivK0KLuudJD6/Y=;
 b=sfePySjiTJglyj+NnwNNgggq92nTNDXcPJai/N5/enl0n0sar9aFAlAxQtj990DjFC
 5qFBCVclW3KguinNH1u4y7jX6pjRDQor3wZIdlyRe+htXfvYmD2GBGmTY6PCYRCP1WZX
 SomhLM74hJdo+hocwAxzGIzr+aPWffUJcbWQ+sx3XIA8nO5iefq3wgPXbHmJrTQeLnRA
 e+AhfKmLHNIGN2ad4v/IcP6ei42dq2l0+ljFrfG95tEY8Oi7e8zyR5x2WtBKAcoSqJB1
 sWRAUsRkFhY4LO61X7gnv/9niAOP7RSlKftMohpvHaYToILfv4ZD8swY7Ef3zevo9HCK
 7oOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsuITuTgvq5BgH/AjaLb08d4FebtckB9LS6ZsSIRauFApjpJqmXEZgi60hLqp8z+/2Jmb8rkvSxBma5eiO3yH7AoyP1FO+dw==
X-Gm-Message-State: AOJu0YzNdspT3cF4fijH+JzUNuvQNoLq8FDNC+bdfqR2cL02AbeUhWj7
 gxyYnlNw4L4YhmJWIiqolSvffKkubh7wb3tJdUMKyG2jcblDjTWTGLXF4sr2PZk6T6shg1aIqsm
 pWMBw8O6zZm5aNUxPCf3o0IpTtG1lkQ==
X-Google-Smtp-Source: AGHT+IGTCNW5mFGk6VtDHsywj8WD42dRAd8StKvfsyxWVSQxxRKphQmD0Gjwndnuc86rnE4mdHJjKIRMb95md6QI+PI=
X-Received: by 2002:a05:6102:f95:b0:492:aaae:835d with SMTP id
 ada2fe7eead31-492aaae869bmr3484399137.0.1721668927935; Mon, 22 Jul 2024
 10:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <170715461915.13905.5968173515742280918-0@git.sr.ht>
 <170715461915.13905.5968173515742280918-1@git.sr.ht>
 <20240722145236.4e7ec0bf@windsurf>
 <99a9d884-8052-4128-8f4e-f68517d80a65@bubu1.eu>
 <20240722180634.0bb07726@windsurf>
 <CADvTj4o7gnjhSheMmrd5Dp-6Wug4ohBoRFpJb+Q4R8ow=KeH3g@mail.gmail.com>
 <20240722183829.76708213@windsurf>
In-Reply-To: <20240722183829.76708213@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 22 Jul 2024 11:21:55 -0600
Message-ID: <CADvTj4rwUSVjWAN-5ekBg0tXWO=QzkOkOMTVhfcdjmgQ1KXn=A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721668928; x=1722273728; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HeCl1I1twBsWlxWLy2Tocp0WBliMxivK0KLuudJD6/Y=;
 b=RXGPRjBChyp1zNlDHCf/c025L0ZviA2cuJOAXR4O9vlMUe1HDiQntOVNHI1e4OpPQW
 RhWW+oG1x5IlIO14v4AjYla0o8Hr3yr4Re5TC1GiIo5d6zgwKbEWQ6pNtCUpuh+T9mb1
 uNr8kitc8V+4aljH6wC2SGXG10OI8H2k4DUuZDfhBP7JbwlRlh8vGiMg/b8HGP9oNsBQ
 gwMbc2gP47Lbx8ZzsPVlovDn7XivMvdo2VWtTU4M+JTWsuxlukQ8VTPMi+Mh/xqGPfgC
 /b9qSf+Z1oiiRBdRjuT4vy+42s72AaE2+t3+ytW4rcP6LLYJZ+oDDuErjRWfcY19RXCS
 7mIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RXGPRjBC
Subject: Re: [Buildroot] [PATCH buildroot v2 2/2] support/testing: add
 fastapi runtime test
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
Cc: ~bubu <bubu@bubu1.eu>, ~bubu <bubu@git.sr.ht>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdWwgMjIsIDIwMjQgYXQgMTA6MzjigK9BTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgMjIgSnVsIDIwMjQg
MTA6MTE6MzEgLTA2MDAKPiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiA+ID4gV2UgaGF2ZSBzb21lIHVwZGF0ZXMgdG8gcHlkYW50aWMtY29yZS9w
eWRhbnRpYyBwZW5kaW5nOgo+ID4gPgo+ID4gPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwNzE5MDQzNzM5LjMyNDEzNzItMS1qYW1lcy5o
aWxsaWFyZDFAZ21haWwuY29tLwo+ID4gPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwNzE5MDQyNjMyLjMyMjcyNDItMS1qYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tLwo+ID4gPgo+ID4gPiAoSSB3YXMgYWJvdXQgdG8gbWVyZ2UgdGhlbSkK
PiA+ID4KPiA+ID4gTm90IHN1cmUgaWYgdGhleSBhcmUgcmVsYXRlZCAvIHNvbHZlIHRoZSBpc3N1
ZT8KPiA+Cj4gPiBUaGVzZSBzZXR1cHRvb2xzL3NldHVwdG9vbHMtcnVzdC9tYXR1cmluIHBhdGNo
ZXMgbWlnaHQgYWxzbyBoZWxwOgo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDcxOTA0NTYzOS4zMzM2NTQxLTEtamFtZXMuaGlsbGlh
cmQxQGdtYWlsLmNvbS8KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9i
dWlsZHJvb3QvcGF0Y2gvMjAyNDA3MTkwNTAxMzQuMzMzODExNy0xLWphbWVzLmhpbGxpYXJkMUBn
bWFpbC5jb20vCj4gPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRy
b290L3BhdGNoLzIwMjQwNzE5MDUyNzAwLjM0Mjc4MzAtMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tLwo+Cj4gSSBhcHBsaWVkIHRoZW0uIEJ1dCBjb3VsZCB3ZSBoYXZlIHNvbWUgYmV0dGVyIGFu
c3dlciB0aGFuICJtaWdodCBhbHNvCj4gaGVscCI/IExpa2UgYWN0dWFsbHkgdGVzdGluZyB3aGlj
aCB0aGluZyBpcyBmaXhpbmcgd2hhdD8KCldlbGwuLi50aG9zZSBhcmUgYWxsIGluIHRoZSBidWls
ZCBkZXBlbmRlbmN5IHRyZWUgZm9yIHB5ZGFudGljLWNvcmUsIHNvCkkgaWYgdGhlcmUgd2FzIHNv
bWV0aGluZyB0aGVyZSB0aGF0IG5lZWRlZCB0byBiZSB1cGRhdGVkIHdhcyB0aGlua2luZyB0aGF0
Cm1pZ2h0IGhlbHAuCgo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25l
ciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
