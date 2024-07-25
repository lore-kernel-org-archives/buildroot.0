Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D959BC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 06:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74DD081BD9;
	Thu, 25 Jul 2024 06:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id koj8vap-n0hi; Thu, 25 Jul 2024 06:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B96B81BE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B96B81BE3;
	Thu, 25 Jul 2024 06:04:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F9711BF3D7
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 06:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26D4881BE3
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 06:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uPRtMrNhDDW for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 06:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::935; helo=mail-ua1-x935.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05EEB81BD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05EEB81BD9
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05EEB81BD9
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 06:04:17 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-826fee202d3so196057241.1
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 23:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721887456; x=1722492256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQEyEDUYbx1nnpwqLSXZ1MSH0RfKzzAjRJr+uv5vCLY=;
 b=Wcy3/M5hyqXDLWmmQHpzw/TTbGlH559aMi6HwCikh7+gTklGH5BUZ4d07piu2FZWwK
 ui5f343iLSOMoTm/56Fe7rz+0+rM7YPvkfXziGe0KIZBoT+5dMeAlEniZjRcjd0u3w1c
 4CmRdfTMWQvXyW3fq3rXcVYZjoZuKsG19seS1f8zkd5F6GriQAIUh+T5ojvpQWvXA2dq
 XM4is1nMPefSAwbZurebG40zG2fJdOba2cE7szeF5v16d9htoYmTYYaAhrCRXsUQ1zVl
 tLZAZv3klAIZK2GFMAol8BcCjq1MsybUDf+f8wETXRqMz3k1MnfmKZjO3QoNUvr6OBC2
 g4Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHg4VhidyARfArtcfw1fD+HkROA5PcTWPsxGbTqJFt+vR+VjjgaGYCLSBR5VWHoP1sWvcaZ9oEHH7XvHyjRuVY+uryEqMklg==
X-Gm-Message-State: AOJu0Yy/F4ZfwY/Yt8zT2kzCanXhR3JJc98Bb2bvjdwTJ5YYaUE0IGbt
 ohMU92HoNfq36xVIm11Nm/VBBIcq0GO343+4B2uVoYzsbPlXOzUEU6dNR869B/dRyp3h+8iZ+Od
 0zXP16PwhYsgy6+6mbltQID8E2DI=
X-Google-Smtp-Source: AGHT+IEOF7Pn+40SWtIyjjHOIUMSA+Z1Y+bd1b4AKHDjJ2qKEU+kWhDg3g/X65NVnmnAcXbdv8imIbvvKH4OaR8I0oo=
X-Received: by 2002:a05:6102:3e0d:b0:48f:e57a:e2f6 with SMTP id
 ada2fe7eead31-493d99b3f4fmr1412450137.1.1721887456287; Wed, 24 Jul 2024
 23:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240724-revert-output-gitignore-v1-0-510a2795884c@collins.com>
 <20240724-revert-output-gitignore-v1-1-510a2795884c@collins.com>
 <20240725075112.576a95cf@windsurf>
In-Reply-To: <20240725075112.576a95cf@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 25 Jul 2024 00:04:05 -0600
Message-ID: <CADvTj4qxPTw_rGV1wLWn6hvFvJ7fL50V=_npzCnQ5qAOrFZkDg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721887456; x=1722492256; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQEyEDUYbx1nnpwqLSXZ1MSH0RfKzzAjRJr+uv5vCLY=;
 b=VtYPXUh+NlBb9sLmlXigBx42GgynvifpNO6atv+gkvUtKAKm8szdVjhRCFuj/kqhAI
 Lr8SlKsBgkjVR37YNrobaV08IxLkz3RGdMxSf3Rg3eT+3L3ao+hVnNZr8GYMWJpQ3Ama
 CIFlcSjHCDNDijtYugUZadbdrfYY6paFTgfhKzyvXGTvMfDFt1cCwHCjGzH35ZMzHWmG
 HQyoTSWY8ToKYp81ZKDwezcd6kFq+9g0hQfS5y05avo1Rmgdz0LZPt9HcfKFjpRI4PUd
 oClZ50dHYQ+OB5sC2rd6sz2FpeiipjHrA3KTjUHgDX0SRX1swvaqo19Lt431k2tfdmg8
 /QTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VtYPXUh+
Subject: Re: [Buildroot] [PATCH 1/2] Revert "Create a .gitignore file in the
 CANONICAL_O directory"
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
Cc: Bryan Brattlof <bb@ti.com>, Brandon Maier <brandon.maier@collins.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBKdWwgMjQsIDIwMjQgYXQgMTE6NTHigK9QTSBUaG9tYXMgUGV0YXp6b25pIHZpYSBi
dWlsZHJvb3QKPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPgo+IEhlbGxvIEJyYW5k
b24sCj4KPiBPbiBXZWQsIDI0IEp1bCAyMDI0IDIxOjIzOjIwICswMDAwCj4gQnJhbmRvbiBNYWll
ciA8YnJhbmRvbi5tYWllckBjb2xsaW5zLmNvbT4gd3JvdGU6Cj4KPiA+IFRoZSBwYWNrYWdlcyAn
cHl0aG9uLWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnMnLCAncHlkYW50aWMtY29yZScsIGFuZAo+
ID4gbGlrZWx5IG90aGVyIHBhY2thZ2VzIGJhc2VkIG9uIFB5dGhvbiBtYXR1cmluIHNpbGVudGx5
IHN0b3BwZWQKPiA+IGluc3RhbGxpbmcgZmlsZXMgdG8gdGhlIGhvc3QgYW5kIHRhcmdldCBkaXJl
Y3RvcmllcyBhZnRlciBjb21taXQKPiA+IGExNGM4NjJjMDguCj4gPgo+ID4gQSBzaW1pbGFyIGlz
c3VlIHdhcyByZXBvcnRlZCBieSB0aGUgQ29uZGEgcHJvamVjdFsxXS4gSXQgc2VlbXMgc29tZQo+
ID4gYnVpbGQgdG9vbHMgc2NhbiBmb3IgZ2l0aWdub3JlIGZpbGVzIHRvIGRlY2lkZSB3aGF0IGZp
bGVzIHRvIGJ1aWxkCj4gPiBhbmQgaW5zdGFsbC4KPiA+Cj4gPiBJIGF0dGVtcHRlZCB2YXJpb3Vz
IGNvbWJpbmF0aW9ucyBvZiBnaXRpZ25vcmUgcGF0dGVybnMgaW5jbHVkaW5nCj4gPiBtaW1pY2tp
bmcgdGhlIENvbmRhIHByb2plY3QncyBnaXRpZ25vcmVbMl0sIGJ1dCB0aGUgb25seSB0aGluZyB0
aGF0IGhhcwo+ID4gd29ya2VkIHJlbGlhYmx5IGlzIHRoZSBvcmlnaW5hbCBgL291dHB1dGAgaWdu
b3JlIGluIHRoZSByb290IEJ1aWxkcm9vdAo+ID4gZGlyZWN0b3J5Lgo+Cj4gVGhhbmtzIGZvciB3
b3JraW5nIG9uIHRoaXMuIEhvd2V2ZXIsIGl0J3MgcmVhbGx5IG1lc3NlZCB1cC4gV2h5IHdvdWxk
Cj4gdGhlc2UgdG9vbHMgYmUgYm90aGVyZWQgYnkgYSAuZ2l0aWdub3JlIGZpbGU/IERvIHlvdSBo
YXZlIHNvbWUgbW9yZQo+IGRldGFpbHM/CgpTbyBpdCdzIHRoZSBleGFjdCBzYW1lIHJlYXNvbiBy
aXBncmVwIGlzIGFmZmVjdGVkIGJ5IC5naXRpZ25vcmUgZmlsZXMsCm1hdHVyaW4gYWN0dWFsbHkg
dXNlcyB0aGUgaWdub3JlIGNyYXRlIGZyb20gdGhlIHJpcGdyZXAgcHJvamVjdDoKaHR0cHM6Ly9j
cmF0ZXMuaW8vY3JhdGVzL2lnbm9yZQoKTm90ZSB0aGF0IHRoZSBpZ25vcmUgY3JhdGUgZG9lc24n
dCBlbnRpcmVseSBjb3JyZWN0bHkgcmVwbGljYXRlIGdpdCdzCmlnbm9yZSBsb2dpYyBhcyBvdGhl
cndpc2UgdGhpcyBzaG91bGRuJ3QgaGF2ZSB0cmlnZ2VyZWQgYW55IGlzc3Vlcy4KCj4KPiBJIHRo
aW5rIEknbSBnb2luZyB0byBhcHBseSB0aGUgcmV2ZXJ0IHRvIGZpeCB0aGUgaW1tZWRpYXRlIGJ1
aWxkCj4gaXNzdWVzLCBidXQgSSB3b3VsZCByZWFsbHkgcmVhbGx5IGxpa2UgdG8gZml4IHRoZSBy
ZWFsIHByb2JsZW0sIGFuZAo+IGFsbG93IHVzIHRvIGdlbmVyYXRlIHRoaXMgLmdpdGlnbm9yZSBm
aWxlIGluIHRoZSBvdXRwdXQgZGlyZWN0b3J5LgoKWWVhaCwgSSd2ZSBiZWVuIHdvcmtpbmcgb24g
YSBmaXggYnV0IGl0IGhhcyBzb21lIGlzc3VlcywgbWF5YmUKc29tZW9uZSBjYW4gaGVscCBmaXgg
dGhlIHRlc3RzOgpodHRwczovL2dpdGh1Yi5jb20vUHlPMy9tYXR1cmluL3B1bGwvMjE1OAoKPgo+
IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4g
aHR0cHM6Ly9ib290bGluLmNvbQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
