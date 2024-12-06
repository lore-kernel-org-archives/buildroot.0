Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3C0E77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 13:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56C9B6119F;
	Fri,  6 Dec 2024 13:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8d4Atuj6oLj1; Fri,  6 Dec 2024 13:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 422B661210
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 422B661210;
	Fri,  6 Dec 2024 13:47:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFB7AED2
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 13:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0E0E80C4E
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 13:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBOtcs83Cohm for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 13:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A86D808A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A86D808A0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A86D808A0
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 13:47:18 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2eeb4d643a5so1829247a91.3
 for <buildroot@buildroot.org>; Fri, 06 Dec 2024 05:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733492838; x=1734097638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uhM1tGmEysO+EfulP54rB6rp49g49MrGRpBF/Mwf9Fc=;
 b=p7AVfCAM8W9ByPGm2QLRk1NAZeoIXUfasNZ+05qVgNvotZGJC/gU1V9WA1MA9pGKwW
 hxfQ3KCutn2GDKGHbTITHSAM6WUWfsqDy7ZtZpwugjsMqkuHEkox1wn8XtaDpjYtOeDo
 LeU3yPPdQgQuLZ9M+Cwh5vLRVmDzz4FM78YrdsqIcCg7IyHl0aPBGx6DNYZiIPNCvaB5
 uSlACgnjUIfWVMtOOrMQJdFyaz1SB/KvihNFNvkdfmcr/yddAEdEs2gP5oBOy9ngDnDp
 G4Ydv5R4TrcBhyHJkpjXx88Ffr6DBZy9TJIyHaaJqg0FiDZNPVQizAFjdbIdjTJizbIA
 rvsg==
X-Gm-Message-State: AOJu0YyChUTchNkXYQp0zl1CSP9XzGnFVOnyOoTLo5k4/vzuzRmkXofB
 4wZyUK6MYjercJhEh/KjzaJIZPLsyANluHjPGXw7+/OlrlmYZ/1pk6EBgFiOdFlmwf+TeBEAL5R
 /lRGPVXAQdD3spbsSlAILErB41aQ=
X-Gm-Gg: ASbGncsXY9crr+Y83spnmTqtZ7419hRlNGORmoyY+hdpPYYGiXGz3GjX4sQ0IIyvxqJ
 s+He3p1L5QIyygP0aivuUmBDZC6egGoc=
X-Google-Smtp-Source: AGHT+IFw1lGjg5EQjSt7ALwAD4LhI2H1LyMF2xJbAF2VltFIR+vha59WsfFwPhSEQIxzZIEZFk7yBhTl0KcEzGybhvw=
X-Received: by 2002:a17:90b:3d4c:b0:2ee:4982:e59f with SMTP id
 98e67ed59e1d1-2ef6a6b8b88mr5697681a91.17.1733492838194; Fri, 06 Dec 2024
 05:47:18 -0800 (PST)
MIME-Version: 1.0
References: <CADwxmTnvhL1rg7T2k8Ye+wV0gx2oCCjLmnKiCfUQsY7ud9RVPA@mail.gmail.com>
 <20241127013001.24122-1-vjardin@free.fr>
 <20241127013001.24122-2-vjardin@free.fr>
 <D5Z27LYGMKJK.2KDMDIY9CR01H@gmail.com>
 <iig5bn2go5jmwxxgusoagg4oapd7kmazljykzgemmnuvtz7a74@m5btvmgminf7>
In-Reply-To: <iig5bn2go5jmwxxgusoagg4oapd7kmazljykzgemmnuvtz7a74@m5btvmgminf7>
From: Brandon Maier <brandon.maier@gmail.com>
Date: Fri, 6 Dec 2024 07:47:06 -0600
Message-ID: <CADwxmTkLcqGnLOQwn9FYtXsixsN0a_cWz5U716ZtPeNCb-usXg@mail.gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Robin Jarry <robin@jarry.cc>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733492838; x=1734097638; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhM1tGmEysO+EfulP54rB6rp49g49MrGRpBF/Mwf9Fc=;
 b=WEabnkj6NV785+TFzjLkGIv2Ejqv2YyDGR2KUZd/VmAoEESj8AkfjEqPsf6/b+/zFG
 qE/3BVsbOeqkDdUfn/oSWc7R2uKWLAQ0wbpnKM1NlaQE/zWn2jJ+wOriB7gk5iIRUeIw
 isePS82P5SXLrQzEd5tL+qQgebYjdO/iw/ri11W2FLtZv5BYGXydFXwsFMzSN7F9CaLC
 /V+a38KQGdfaKApKOjoeGYQCEeQ7+nKxcC9MAd+pBZPYP0rVyz99o4s7x5h7DF0OeMk/
 ABKNfxsQhhkpd0FKRs8YhlSP0sYLh7K049hWJ0uG1g8PUbfibBmPwq4RpIWeZcvFFP4D
 IKpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WEabnkj6
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pkg-meson: h files only into
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

SGkgVmluY2VudCwKClNvcnJ5IGZvciByZXNlbmQsIGZvcmdvdCB0byBSZXBseS1BbGwKCk9uIE1v
biwgRGVjIDIsIDIwMjQgYXQgOTozOeKAr0FNIFZpbmNlbnQgSmFyZGluIDx2amFyZGluQGZyZWUu
ZnI+IHdyb3RlOgo+Cj4gSGkgQnJhbmRvbiwKPgo+IE9uIEZyaSwgTm92IDI5LCAyMDI0IGF0IDA1
OjQyOjU5UE0gVVRDLCBCcmFuZG9uIE1haWVyIHdyb3RlOgo+ID4gSGkgVmluY2VudCwKPiA+Cj4g
PiBPbiBUdWUgTm92IDI2LCAyMDI0IGF0IDc6MzAgUE0gQ1NULCBWaW5jZW50IEphcmRpbiB3cm90
ZToKPiA+ID4gTWFueSBwYWNrYWdlcyBidWlsdCB3aXRoIEJ1aWxkcm9vdCBhbmQgbWVzb24gY3Vy
cmVudGx5IGluc3RhbGwgaGVhZGVyCj4gPiA+IGZpbGVzIGludG8gYm90aDoKPiA+ID4gICAtIHRo
ZSB0YXJnZXTigJlzIC91c3IvaW5jbHVkZSwgYW5kCj4gPiA+ICAgLSB0aGUgc3lzcm9vdOKAmXMg
L3Vzci9pbmNsdWRlLgo+ID4gPgo+ID4gPiBXaGVuIEZPT19NRVNPTl9JTlNUQUxMX1RBR1MgPSBZ
RVMsIGVuc3VyZSB0aGF0IGhlYWRlciBmaWxlcyBhcmUKPiA+ID4gaW5zdGFsbGVkIGV4Y2x1c2l2
ZWx5IGluIHRoZSBzdGFnaW5nIChzeXNyb290KSB0YXJnZXQgZHVyaW5nIHRoZQo+ID4gPiBidWls
ZCBwcm9jZXNzLgo+ID4gPgo+ID4gPiBUaGUgZGVmYXVsdCBpcyBGT09fTUVTT05fSU5TVEFMTF9U
QUdTID89IE5PIGluIG9yZGVyIHRvIGF2b2lkCj4gPiA+IGNoYW5naW5nIHRvIHRoaXMgbmV3IGJl
aGF2aW91ciBmb3IgdGhlIHRpbWUgYmVpbmcuCj4gPgo+ID4gVGhpcyBzZXR0aW5nIGhhcyBkaW1p
bmlzaGVkIHZhbHVlIGlmIGl0IGlzIGRlZmF1bHQgb2ZmLiBIYXZlIHlvdSBkb25lIGEKPiA+IHNp
ZGUtYnktc2lkZSBidWlsZCB0byBzZWUgaG93IG1hbnkgcGFja2FnZXMgdGhpcyBicmVha3M/Cj4K
PiBObywgSSBkaWQgbm90OiBteSBhc3N1bXB0aW9uIHdhcyB0byBzdGFydCBlYXN5IHdpdGhvdXQg
YnJlYWtpbmcvY2hhbmdpbmcKPiBhbnkgYmVoYXZpb3VyLiBUaGVuLCB3ZSBjYW4gc3RhcnQgdHVy
bmluZyBpdCB0byAiWUVTIiBieSBkZWZhdWx0IGxhdGVyCj4gb24uCj4KPiBTbywgZm9yIHRoZSB0
aW1lIGJlaW5nLCB0aGUgbWVzb24gYmFzZWQgcGFja2FnZXMgdGhhdCBhcmUga25vd24gdG8gYmUK
PiAib2siIGNhbiBzdGFydCB1c2luZyB0aGUgdGFncy4gSSBwbGFuIHRvIGRvIHNvIGZvciBncm91
dCwgbGliZWNvbGkgYW5kIERQREsuCgpBbHJpZ2h0LCBteSBtYWluIGNvbmNlcm4gd2FzIHRoYXQg
dGhpcyBmZWF0dXJlIHdvdWxkIGJlIGFkZGVkIGJ1dCBub3QgZ2V0CnVzZWQgaWYgaXQgaXNuJ3Qg
ZGVmYXVsdC4gSWYgeW91J3ZlIGlkZW50aWZpZWQgc29tZSBwYWNrYWdlcyBmb3IgdGhpcwp0aGVu
IHlvdSBjb3VsZCBpbmNsdWRlIHRoZW0gd2l0aCB0aGlzIHBhdGNoIHNlcmllcy4KCj4KPiBTaWRl
IHF1ZXN0aW9uOiBob3cgZG8geW91IGhhbmRsZSBhIHNpZGUtYnktc2lkZSBidWlsZCB3aXRoIEJ1
aWxkcm9vdCA/CgpJZiB5b3Ugd2FudCB0byBkaWZmIHRoZSBmaWxlcyBiZWluZyBpbnN0YWxsZWQg
YmVmb3JlIGFuZCBhZnRlci4gSQp3b3VsZCBnaXQtY2xvbmUKdHdvIGNvcGllcyBvZiBCdWlsZHJv
b3QsIG9uZSB3aXRob3V0IHlvdXIgY2hhbmdlcyBhbmQgb25lIHdpdGggeW91ciBjaGFuZ2VzLgpD
cmVhdGUgYSAuY29uZmlnIHdpdGggdGhlIE1lc29uIHBhY2thZ2VzIGVuYWJsZWQgeW91IHdhbnQg
YW5kIGVuYWJsZQpCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVMgKFBFUl9QQUNLQUdFIGlzb2xh
dGVzIHRoZQp0YXJnZXQvaG9zdC9zdGFnaW5nIGRpcmVjdG9yaWVzIGFuZCBtYWtlcyB0ZXN0aW5n
IGluc3RhbGxhdGlvbiBjaGFuZ2VzIGVhc2llcikuCkJ1aWxkIGVhY2ggb2YgdGhlbS4gVGhlbiB5
b3UgY2FuIGRpZmYgdGhlIGluc3RhbGxlZCBmaWxlcyBsaXN0IHRoYXQKZ2V0IGdlbmVyYXRlZCBp
biB0aGUgcGFja2FnZSBidWlsZCBkaXJlY3RvcmllcyAob3V0cHV0L2J1aWxkL215LXBhY2thZ2Uv
LmZpbGUKcy1saXN0LnR4dCwgLmZpbGVzLWxpc3QtaG9zdC50eHQsIGFuZCAuZmlsZXMtbGlzdC1z
dGFnaW5nLnR4dCkKCkZvciBleGFtcGxlCgo+IGNhdCBidWlsZHJvb3QtMS9vdXRwdXQvYnVpbGQv
Ki8uZmlsZXMtbGlzdC50eHQgfCBzb3J0ID5idWlsZHJvb3QtMS1maWxlcy50eHQKPiBjYXQgYnVp
bGRyb290LTIvb3V0cHV0L2J1aWxkLyovLmZpbGVzLWxpc3QudHh0IHwgc29ydCA+YnVpbGRyb290
LTItZmlsZXMudHh0Cj4gZGlmZiBidWlsZHJvb3QtMS1maWxlcy50eHQgYnVpbGRyb290LTItZmls
ZXMudHh0CgpBbmQgcmVwZWF0IGZvciAtaG9zdC50eHQgYW5kIC1zdGFnaW5nLnR4dAoKVGhhbmtz
IQpCcmFuZG9uCgo+Cj4gPiA+ICsgICAgICAgICAgICAgJCQoJCQoUEtHKV9TUkNESVIpL2J1aWxk
ICQoaWYgJChmaWx0ZXIgWUVTLCQoJChQS0cpX01FU09OX0lOU1RBTExfVEFHUykpLC0tdGFncz1y
dW50aW1lLGRldmVsKQo+ID4KPiA+IFRoZSBjb21tYSBpbiAiLS10YWc9cnVuZXRpbWUsZGV2ZWwi
IGlzIHRyZWF0ZWQgYXMgdGhlIE1ha2VmaWxlIHNlcGFyYXRvcgo+ID4gZm9yICIkKGlmIHgsIHks
IHopIi4gVXNlICItLXRhZz1ydW50aW1lJChjb21tYSlkZXZlbCIgaW5zdGVhZCB3aGljaAo+ID4g
c3Vic3RpdHV0ZXMgYSBsaXRlcmFsIGNvbW1hLgo+Cj4gT0ssIHRoYW5rcyBmb3IgY2F0Y2hpbmcg
aXQgISwgaXQnbGwgYmUgaW5jbHVkZWQgd2l0aCBteSBuZXh0IHVwZGF0ZS4KPiBJIGRpZCBub3Qg
YW5hbHl6ZSB3aHkgSSBkaWQgbm90IGNhdGNoIGl0Li4uCj4KPiA+Cj4gPiBUaGUgc2luZ2xlICIk
IiBuZWVkIHRvIGJlICIkJCIgc28gdGhleSBhcmUgcHJvcGVybHkgZXNjYXBlZC4gKEV4Y2VwdAo+
ID4gIiQoY29tbWEpIikKPgo+IE9LCj4KPiBUaGFua3MgQnJhbmRvbiwgYmVzdCByZWdhcmRzLAo+
ICAgVmluY2VudApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
