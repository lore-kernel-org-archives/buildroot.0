Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD332C282C6
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 14:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D0577051E;
	Sat,  1 Mar 2025 14:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOdVIzp4t-It; Sat,  1 Mar 2025 14:29:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A7AA6FCD2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A7AA6FCD2;
	Sat,  1 Mar 2025 14:29:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 957E868
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84C6F4EFEA
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0INnbPruCF1 for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 14:29:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7165740C16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7165740C16
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7165740C16
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:29:02 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so623373966b.1
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 06:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839340; x=1741444140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HY1G6jbQfE+n46JN9AWhc3ZoUPI7BlTpZuqjwxtXwOQ=;
 b=FC7UqkDmbVHDijsnhVG6RdYYoLeVlFf/KQ8aK+yR7fCLGajwkF17BSRMsSvqLr+uI+
 SXvlJ7FX8TY6+mozTKM31H42shbmGbvUemGyxNyoIJCisgVlHfQo7RkOSKnhcOkE+Gjy
 iyseuGCc0XbdhMZq3c6xqCyp8xcCttykNg2k0WdfX/EM8HS16tk8jl8HM71kV1TSheIL
 05HPd/zVfmHX4Nbg5fEz875ezHBoHR1nhcLVYqMjWqb31DBpRfqW7rSqJkamM0ffXEqF
 g+/0Vt4LQ+1iF+YXh+6yKPvUr/zfmlRyjT7oz7HxwTR7fLpUulqd65IQErQhkMH2mNFo
 whdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuCqgaMafIOv2uM53/RKN7iZm6ICSnxa9bVrf8c1ztt3kE+wjy/2etYoCSwu4BPI7qhbXYuHYiEm8=@buildroot.org
X-Gm-Message-State: AOJu0YxjtBbV1ALyuhTU5K5+dneUysuGPMEK53UeSebPI13m682Sb8OA
 i1UCpai4EQ+bmDXwpV+V5Hbi39XK0w3k4lRF5SNvAzsXa/Pu17FxTdPdCevhUZ1qU1/gEPdylPc
 25ywTT67YHiAFw1IleDfeyitaZF4=
X-Gm-Gg: ASbGncvL6SU/ZGVCRvLFALjBZYeS2lnbpTNlc9YUWpxI+XS+AcIoPeJUNRJtmyu9pKt
 fsJTLXZavOZIHbYL7iI7L3kssMDBh5+CNMwgy0crni4zzSaF/pvjckYWORjWmMPduxNG/cxabUh
 bXxAEKf5mBhlR6Gf6Fp26qKhyNlDkrJm4Bjpp5PXUttIb1SOqML4HZ7Un+paSQ
X-Google-Smtp-Source: AGHT+IFRscrxxbSlk27oX854JzgpkVKQS9KH7JKeieDbMjcrbRlfDSvWU73+/B1F5hONo88STBW4VX/u0kKbX4R5r+E=
X-Received: by 2002:a17:907:76ea:b0:abf:4da0:28e8 with SMTP id
 a640c23a62f3a-abf4da02ab3mr276246166b.17.1740839340029; Sat, 01 Mar 2025
 06:29:00 -0800 (PST)
MIME-Version: 1.0
References: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
 <20250205-imx-packages-bump-v1-1-2f11b86d2da5@armadeus.com>
 <06a9719a2eb955a091e37f2bf23c8112@free.fr>
In-Reply-To: <06a9719a2eb955a091e37f2bf23c8112@free.fr>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 1 Mar 2025 10:28:48 -0400
X-Gm-Features: AQ5f1JoRVdJugchQLLGvB_jU-DuRNc_KvLbunuOo76R6VvBA_l1UoNdhFKPCKI4
Message-ID: <CAKcgs2z1Hug4gwjLeT0tMexgUyHiY-OvQg4aZ=nGGzL54sAWvg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839340; x=1741444140; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HY1G6jbQfE+n46JN9AWhc3ZoUPI7BlTpZuqjwxtXwOQ=;
 b=iMT91BNJ2fA5eeUWlDXpkRKEdRi4gWfMqeF+8quVsa6wTa8XGlKZSlos53mTDbX+yz
 /5vJUJgbFb6YsqZ87l94Cp/G44oq31BRRnzsGi2HB0lHF7prMX45VOBXUXWz+bFB1sxB
 Gcdjw1SVEwS6z4fy7PCZ+nM2Vj5ETDfk20obpNFf8qX/K5gr+yLch4DFydIzG+qQzWAR
 lZgbGCkSmFk6TpLvChO3Q7fboFMfEGtjDy8eOBOzO2+FzRUr+D0ZPOBqfQM6F2eICdK7
 ZOwMas3hw9ukF8gPi6KlgfVlNKjemO9UbCYR6by33ZLjvzkma5SZmg17CbAux2Qv3rfL
 NyVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iMT91BNJ
Subject: Re: [Buildroot] [PATCH 01/11] package/freescale-imx/imx-gpu-g2d:
 install the specific library for i.MX8MM
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLCBhbGwKCkxlIHNhbS4gMSBtYXJzIDIwMjUgw6AgMDg6NTksIEp1bGllbiBPbGl2
YWluIDxqdS5vQGZyZWUuZnI+IGEgw6ljcml0IDoKPgo+IEhpIFPDqWJhc3RpZW4sCj4KPiBPbiAw
NS8wMi8yMDI1IDEyOjQwLCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiA+IEZvciB0aGUg
aS5NWDhNTSwgdGhpcyBwYWNrYWdlIGNvbnRhaW5zIGEgc3BlY2lmaWMgbGlicmFyeSB0aGF0IGlz
IG5vdAo+ID4gbGlua2VkIHRvIE9wZW5DTCBiZWNhdXNlIHRoZXJlIGlzIG5vIG9wZW5DTCBzdXBw
b3J0IG9uIGkuTVg4TU0gR1BVLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5
bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPgo+IEkgYXBwbGllZCB0
aGlzIHNlcmllcyB0byBuZXh0Lgo+Cj4gSSBmaXhlZCBhbGwgbWVudGlvbiBpbiBjb21taXQgbG9n
cyB0byBiZToKPiAiIiIKPiBUaGlzIHZlcnNpb24gaXMgYWxpZ25lZCB3aXRoIE5YUCBMaW51eCBC
U1AgdmVyc2lvbiAibGYtNi42LjUyLTIuMi4wIi4KPiAiIiIKPgo+IFRoZXJlIHdhcyBtZW50aW9u
cyBvZiAibGYtNi42LjU1LTIuMi4wIiBvciAibGYtNi42LjUyLTIuMC4wIi4KPiBUaGVyZSBpcyBu
byA2LjYuNTUgcmVsZWFzZSBmb3Igbm93LCBvbmx5IDYuNi41Mi4gQW5kIGl0IGlzIC0yLjIuMAo+
ICh0aGUgLTIuMC4wIHJlbGVhc2UgaXMgYmFzZWQgb24gNi42LjIzKS4KPgo+IFNlZToKPiBodHRw
czovL2dpdGh1Yi5jb20vbnhwLWlteC9pbXgtbWFuaWZlc3QvY29tbWl0L2RiMTg2N2I4MTY3NmEy
NTEzYjkxMjY3ZTRjODUzNjlkZWUyMGE4MDAKPgo+IEknbGwgc2VuZCBkZWZjb25maWdzIGJ1bXBz
IGZvciBhbGwgYXBwbGljYWJsZSBjb25maWdzL2ZyZWVzY2FsZV9pbXgqCj4gc29vbi4KSSBoYWQg
cHJlcGFyZWQgdGhlIHBhdGNoZXMgYW5kIGp1c3Qgc2VudCB0aGVtIG92ZXIuIENhbiB5b3UgcGxl
YXNlCnJldmlldyBhbmQgcHJvdmlkZSBjb21tZW50cyBpZiB5b3Ugc2VlIGFueXRoaW5nIHdyb25n
Pwo+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4KPiBKdWxpZW4uCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKdGhhbmsgeW91ClJlZ2FyZHMKR2lsbGVzLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
