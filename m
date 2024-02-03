Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E65C4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 594E941BAB;
	Sat,  3 Feb 2024 18:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 594E941BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D7a0BWDrvmN7; Sat,  3 Feb 2024 18:01:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6580F417B9;
	Sat,  3 Feb 2024 18:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6580F417B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC2B91BF95D
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 13:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C96D060DCB
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 13:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xo-lkmi2I64y for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 13:02:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4404860DB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4404860DB7
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4404860DB7
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 13:02:04 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55fe4534e9bso2324504a12.0
 for <buildroot@buildroot.org>; Sat, 03 Feb 2024 05:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706965322; x=1707570122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qxP1Y9/5stSUrjKzMiaRfqPF9zdw0qRZwa05O3nNOB8=;
 b=YeAjpPxSYMs94n5dvvovMW65QxrbbKqy9sCLk1+6RE2tC95MdpSbYEQJmit0DQWdGX
 6c7xoALO3aDjcK9XWXdh757+KJRP8GjJbobr+B+S2yxyBuTbKQZNnGrCNRYTaCYOwPDc
 Bj4R2VwtsdKbhAS+fux2c+xi2+uEpxzXDv6Aqf8NS9rOFJWzefja3mD/fu1LfQRXjM5Z
 Xx2WA+ORxzdmgRdAveFgJ5Ui9i5bNNUu0q3zOuzD2uCTpeEDZoLjZDnBMxqe55lMRiZs
 GLAsNFjfUWSWcskJToLUsQeNnGvh1ls8cSSZqXUuJRO1k/1lK1zVnoe2anmhaup2wFsX
 FnzA==
X-Gm-Message-State: AOJu0YwQw1TvY+oA47Pb1MHQRoHlcCNnc2ZK6238L3qNeO7yGNvQ8P2L
 tTLNnZDTmdA5l2bIm0xeOcqx1/UBLIfsYBlD8Pb/cBimP+tCt2rqsROHX1pXtHgngXUes2VW0U8
 /DIGPfP3AyTpCt5K7+gmoFbmTMnBtmI/zd5gLDw==
X-Google-Smtp-Source: AGHT+IEbRsLM/9MejnmUvZjdrKIxwskvK6XU0f5nOIIrPFF5ESHi8AkMEU4xgwG3g/rY6knY4gvfmN9KyFNZGtu0ya0=
X-Received: by 2002:a17:907:3da0:b0:a35:fa06:aced with SMTP id
 he32-20020a1709073da000b00a35fa06acedmr4346370ejc.65.1706965322069; Sat, 03
 Feb 2024 05:02:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1706448055.git.yann.morin.1998@free.fr>
 <df16b2a080d81430777e362a57818411d1c57a94.1706448055.git.yann.morin.1998@free.fr>
In-Reply-To: <df16b2a080d81430777e362a57818411d1c57a94.1706448055.git.yann.morin.1998@free.fr>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Sat, 3 Feb 2024 14:01:50 +0100
Message-ID: <CAHDQB6MushDOyaUoSo5MidXiwz0XNGxtWYnCAPt1-5a2gUq1tA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706965322; x=1707570122;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qxP1Y9/5stSUrjKzMiaRfqPF9zdw0qRZwa05O3nNOB8=;
 b=MMbeTMREQn2X105npmITKdSiJPfm2Pmh5ZE9pDaOOY/MfV+V/o2398UuI39F1qhuqb
 Ug7XeTUWJuh4dyuzzPZ9Xi+OEum7tzyPuQch7pPboGReW5ERkaSNk/XrYn3qHxcCdYfG
 Ji/b34rq5y4zxkF5zZxp1aQ+dujEFFvMv14Ak=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=MMbeTMRE
Subject: Re: [Buildroot] [PATCH 02/10] package/ivi-homescreen: fix
 dependencies for gstreamer plugin
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubjsKCgpPbiBTdW4sIEphbiAyOCwgMjAyNCBhdCAyOjIx4oCvUE0gWWFubiBFLiBNT1JJTiA8
eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gVGhlIGdzdHJlYW1lciBwbHVnaW4g
c2VsZWN0IHRoZSBFR0wgYmFja2VuZCBvZiBnc3QxLXBsdWdpbnMtYmFzZSwgYnV0Cj4gZm9yZ290
IHRvIHByb3BhZ2F0ZSBhbGwgb2YgaXRzIGRlcGVuZGVuY2llcywgbm90YWJseSB0aGUgX0hBU19B
UEkKPiBjb25kaXRpb24sIGNhdXNpbmcgdW5tZXQgZGVwZW5kZW5jaWVzIHdhcm5pbmdzICh1bmZv
cnR1bmF0ZWx5LCBub3QKPiBlcnJvcnMpLCBzdWNoIGFzOwo+Cj4gICAgICQgS0NPTkZJR19TRUVE
PTB4NTk3RDIyQTggbWFrZSByYW5kY29uZmlnCj4gICAgIFdBUk5JTkc6IHVubWV0IGRpcmVjdCBk
ZXBlbmRlbmNpZXMgZGV0ZWN0ZWQgZm9yIEJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQVNFX0xJ
Ql9PUEVOR0xfRUdMCj4gICAgICAgRGVwZW5kcyBvbiBbbl06IEJSMl9QQUNLQUdFX0dTVFJFQU1F
UjEgWz15XSAmJiBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFTRSBbPXldICYmIEJSMl9QQUNL
QUdFX0dTVDFfUExVR0lOU19CQVNFX0xJQl9PUEVOR0wgWz15XSAmJiBCUjJfUEFDS0FHRV9HU1Qx
X1BMVUdJTlNfQkFTRV9MSUJfT1BFTkdMX0hBU19BUEkgWz1uXSAmJiBCUjJfUEFDS0FHRV9IQVNf
TElCRUdMIFs9eV0KPiAgICAgICBTZWxlY3RlZCBieSBbeV06Cj4gICAgICAgLSBCUjJfUEFDS0FH
RV9JVklfSE9NRVNDUkVFTl9HU1RSRUFNRVJfRUdMX1BMVUdJTiBbPXldICYmIEJSMl9QQUNLQUdF
X0lWSV9IT01FU0NSRUVOIFs9eV0gJiYgQlIyX1BBQ0tBR0VfRkZNUEVHX0FSQ0hfU1VQUE9SVFMg
Wz15XSAmJiBCUjJfUEFDS0FHRV9IQVNfTElCRUdMIFs9eV0KPgo+IFdlIGNhbid0IHNlbGVjdCBf
SEFTX0FQSSwgYmVjYXVzZSBpdCBpcyBhIHN5bWJvbCB0aGF0IHJlcHJlc2VudHMgYQo+IGNhcGFi
aWxpdHkgcHJvdmlkZWQgYnkgb3RoZXIgZmVhdHVyZXMgb2YgZ3N0MS1wbHVnaW5zLWJhc2U7IGl0
J3MKPiBzZW1hbnRpY2FsbHkgbGlrZSBhIHZpcnR1YWwgcGFja2FnZTogd2UgY2FuJ3Qgc2VsZWN0
IGl0LCB3ZSBjYW4gb25seQo+IGRlcGVuZCBvbiBpdC4KPgo+IEFkZCB0aGlzIGRlcGVuZGVuY3kg
dG8gZml4IHRoaXMgc2l0dWF0aW9uLgo+Cj4gVGhpcyBob3dldmVyIGNhdXNlcyBjaXJjdWxhciAo
cmVjdXJzaXZlKSBkZXBlbmRlbmNpZXMgZXJyb3JzOgo+Cj4gICAgIHBhY2thZ2UvZ3N0cmVhbWVy
MS9nc3QxLXBsdWdpbnMtYmFzZS9Db25maWcuaW46MTM1OmVycm9yOiByZWN1cnNpdmUgZGVwZW5k
ZW5jeSBkZXRlY3RlZCEKPiAgICAgcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1iYXNl
L0NvbmZpZy5pbjoxMzU6ICAgICBzeW1ib2wgQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBU0Vf
TElCX09QRU5HTCBpcyBzZWxlY3RlZCBieSBCUjJfUEFDS0FHRV9JVklfSE9NRVNDUkVFTl9HU1RS
RUFNRVJfRUdMX1BMVUdJTgo+ICAgICBwYWNrYWdlL2l2aS1ob21lc2NyZWVuL0NvbmZpZy5pbjoy
MjE6ICAgc3ltYm9sIEJSMl9QQUNLQUdFX0lWSV9IT01FU0NSRUVOX0dTVFJFQU1FUl9FR0xfUExV
R0lOIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBU0VfTElCX09QRU5HTF9I
QVNfQVBJCj4gICAgIHBhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMtYmFzZS9Db25maWcu
aW46MTQ5OiAgICAgc3ltYm9sIEJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQVNFX0xJQl9PUEVO
R0xfSEFTX0FQSSBpcyBzZWxlY3RlZCBieSBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFTRV9M
SUJfT1BFTkdMX09QRU5HTAo+ICAgICBwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5zLWJh
c2UvQ29uZmlnLmluOjE1MjogICAgIHN5bWJvbCBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFT
RV9MSUJfT1BFTkdMX09QRU5HTCBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19C
QVNFX0xJQl9PUEVOR0wKPgo+IEluZGVlZCwgX0hBU19BUEkgaXMgb25seSBldmVuIHNldCB3aGVu
IGdzdHJlYW1lcjEsIGdzdDEtcGx1Z2lucy1iYXNlLAo+IGFuZCB0aGUgZ3N0MS1wbHVnaW5zLWJh
c2UncyBsaWItb3BlbmdsIHN1cHBvcnQsIGFyZSBhbGwgYWxyZWFkeSBlbmFibGVkLgo+IEFzIHN1
Y2gsIHRoZSBkZXBlbmRlbmN5IG9uIF9IQVNfQVBJIGFscmVhZHkgaW1wbGllcyB0aG9zZSwgYW5k
IHRoZXJlIGlzCj4gbm8gbmVlZCB0byBzZWxlY3QgdGhlbS4KPgpUaGFuayB5b3Ugc28gbXVjaCBm
b3IgdGhlIHBhdGNoLiBJIGRpZG4ndCBldmVuIG5vdGljZSB0aGlzISBJJ20gc28gc29ycnkhCgpS
ZXZpZXdlZC1ieTogQWRhbSBEdXNrZXR0IDxBZGFtLkR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5j
b20+ClRlc3RlZC1ieTogQWRhbSBEdXNrZXR0IDxBZGFtLkR1c2tldHRAYW1hcnVsYXNvbHV0aW9u
cy5jb20+Cgo+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyPgo+IENjOiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25z
LmNvbT4KPiAtLS0KPiAgcGFja2FnZS9pdmktaG9tZXNjcmVlbi9Db25maWcuaW4gfCA5ICsrKyst
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvaXZpLWhvbWVzY3JlZW4vQ29uZmlnLmluIGIvcGFja2Fn
ZS9pdmktaG9tZXNjcmVlbi9Db25maWcuaW4KPiBpbmRleCBkZTc1MDkzMjBmLi5jMjRkZjA1YjZk
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvaXZpLWhvbWVzY3JlZW4vQ29uZmlnLmluCj4gKysrIGIv
cGFja2FnZS9pdmktaG9tZXNjcmVlbi9Db25maWcuaW4KPiBAQCAtMjIyLDEwICsyMjIsOCBAQCBj
b25maWcgQlIyX1BBQ0tBR0VfSVZJX0hPTUVTQ1JFRU5fR1NUUkVBTUVSX0VHTF9QTFVHSU4KPiAg
ICAgICAgIGJvb2wgIkdTdHJlYW1lciBFR0wiCj4gICAgICAgICBkZXBlbmRzIG9uIEJSMl9QQUNL
QUdFX0ZGTVBFR19BUkNIX1NVUFBPUlRTCj4gICAgICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X0hBU19MSUJFR0wKPiArICAgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5T
X0JBU0VfTElCX09QRU5HTF9IQVNfQVBJICMgR1NUMV9QTFVHSU5TX0JBU0VfTElCX09QRU5HTF9F
R0wKPiAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9GRk1QRUcKPiAtICAgICAgIHNlbGVjdCBC
UjJfUEFDS0FHRV9HU1RSRUFNRVIxCj4gLSAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfR1NUMV9Q
TFVHSU5TX0JBU0UKPiAtICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFT
RV9MSUJfT1BFTkdMCj4gICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JB
U0VfTElCX09QRU5HTF9FR0wKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgQSBHU3RyZWFtZXIt
cG93ZXJlZCBhbHRlcm5hdGl2ZSB0byBGbHV0dGVyJ3MgdmlkZW9fcGxheWVyIHRoYXQKPiBAQCAt
MjMzLDkgKzIzMSwxMCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfSVZJX0hPTUVTQ1JFRU5fR1NUUkVB
TUVSX0VHTF9QTFVHSU4KPgo+ICAgICAgICAgICBodHRwczovL3B1Yi5kZXYvcGFja2FnZXMvZmx1
dHRlcl9nc3RyZWFtZXJfcGxheWVyCj4KPiAtY29tbWVudCAiR1N0cmVhbWVyIHBsdWdpbiBuZWVk
cyBhbiBFR0wgYmFja2VuZCIKPiArY29tbWVudCAiR1N0cmVhbWVyIHBsdWdpbiBuZWVkcyBnc3Qx
LXBsdWdpbnMtYmFzZSB3aXRoIGFuIEVHTCBiYWNrZW5kIgo+ICAgICAgICAgZGVwZW5kcyBvbiBC
UjJfUEFDS0FHRV9GRk1QRUdfQVJDSF9TVVBQT1JUUwo+IC0gICAgICAgZGVwZW5kcyBvbiAhQlIy
X1BBQ0tBR0VfSEFTX0xJQkVHTAo+ICsgICAgICAgZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfSEFT
X0xJQkVHTCBcCj4gKyAgICAgICAgICAgICAgIHx8ICFCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNf
QkFTRV9MSUJfT1BFTkdMX0hBU19BUEkKPgo+ICBjb25maWcgQlIyX1BBQ0tBR0VfSVZJX0hPTUVT
Q1JFRU5fT1BFTkdMX1RFWFRVUkVfUExVR0lOCj4gICAgICAgICBib29sICJPcGVuR0wgVGV4dHVy
ZSIKPiAtLQo+IDIuNDMuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
