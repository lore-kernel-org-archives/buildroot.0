Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82207C3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0453B40731;
	Sat, 27 Jul 2024 14:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GaEXXMOkhWKU; Sat, 27 Jul 2024 14:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD04F40CEB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD04F40CEB;
	Sat, 27 Jul 2024 14:24:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFE871BF84C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB2E740CEB
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbIkW1DvRPtd for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:24:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 39A2540731
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39A2540731
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39A2540731
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:24:18 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52f01ec08d6so3263092e87.2
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 07:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722090256; x=1722695056;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MwTHNm7o4UrdNpPmoReWuW2s5F9QjQjoBTdhNrLGG28=;
 b=vf0WHitMF4lPknl4ZxrGNp/S+XXio7f1yo86RXvQ6m3F5Wdhssriz+LDm9JGdy4ycx
 hkW8L6KT7qaywbM8LRY3Mxz2gPlxgMT/noYSUyxHEWVwABDouVFYPpTAf0DVKXQ57Az4
 yruKKWqNjd/DU04i613wUfUfSa1XnMZghLLhM8tnoZZ62jbY8PM0jqrJewnFKfu7gXZh
 7qMmzkmOneBCRESgP9enaimZLUgQE9oQWid6L8Do6Vnyzc95ayTK1Y0MKeELygDO01Sy
 +nq4k9yCkHqnXkiVJeHBjS7ZnJ0d2SkDw39ohvMlJwST9zmCgbTPGRh1n5DszQWp++F8
 x5QQ==
X-Gm-Message-State: AOJu0Yx+IXBcHUUNORdM02Kof4PnTsrd3jri0Ypl7+KTnAKUdK5qkhcA
 nl1I71sCInkm943TTMMSzE/Sk50MhMSQhflggjISdmFa15tNMjU/TdOo0jQL6LW8XIbr/qDFoql
 z7F8s9VEHchFLg6CtiUXEqVSBupQUwQ==
X-Google-Smtp-Source: AGHT+IGdMQZ+bi2hGZVDxNk7fv0+fWbdoktUQq5pKMmDCdTeh7SZQ2qXNJpLWVP8wJkavJWFD568x9oaJeQkAkru9Lo=
X-Received: by 2002:a05:6512:308d:b0:52f:154:661b with SMTP id
 2adb3069b0e04-5309b27053bmr1970109e87.11.1722090255693; Sat, 27 Jul 2024
 07:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240727135252.389739-1-fontaine.fabrice@gmail.com>
 <20240727161547.3c7afc77@windsurf>
In-Reply-To: <20240727161547.3c7afc77@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 27 Jul 2024 16:24:03 +0200
Message-ID: <CAPi7W81BpnbcP5Qeu3hQ4byCyGUqbEkLuugrXTP4zmKY_wcqpQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722090256; x=1722695056; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MwTHNm7o4UrdNpPmoReWuW2s5F9QjQjoBTdhNrLGG28=;
 b=PlGQzA6i3S1k9D9Gd2iVS1hCaHNF4KIknf++9gH3FnlrpFW72rRgl2WamfM0e7wC4Y
 SVYycrMCPSY/ay5E+jHrcfzgyUyERLVqfrItCUi7ozOrOsEbGyefGZql1l05gdGxK1St
 SGoQp0IQGHND28AtEGZKKhAcZaAQp/lMJ6zbE8FcD/ligXl/da8o1qlkOVyjwDQ2N3+o
 rP3popb05kr8zYTpPpj0kge5JVjXZiFZfx2qBY1tLNFdsxVN3njFfa7cEcowHr/QcCC/
 Y3U04xZEy18tkohp7xJWdxAJYNqSUN1vnwE1taaG9M0ZmqWvg7AkJIsX/ZdOwxpOg3Wk
 /upw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PlGQzA6i
Subject: Re: [Buildroot] [PATCH 1/1] package/avahi: security bump to version
 0.9-rc1
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

SGVsbG8sCgpMZSBzYW0uIDI3IGp1aWwuIDIwMjQgw6AgMTY6MTUsIFRob21hcyBQZXRhenpvbmkK
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IEhlbGxvIEZhYnJp
Y2UsCj4KPiBPbiBTYXQsIDI3IEp1bCAyMDI0IDE1OjUyOjUyICswMjAwCj4gRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiAtIERyb3AgcGF0
Y2ggKGFscmVhZHkgaW4gdmVyc2lvbikKPiA+IC0gRml4IENWRS0yMDIxLTM0NjggYW5kIENWRS0y
MDIzLTM4NDY5IHRvIENWRS0yMDIzLTM4NDczCj4gPiAtIC0te2VuLGRpc31hYmxlLWxpYnN5c3Rl
bWQgbXVzdCBiZSBwYXNzZWQgc2luY2UKPiA+ICAgaHR0cHM6Ly9naXRodWIuY29tL2F2YWhpL2F2
YWhpL2NvbW1pdC9iYzExNmMwNWIxNWYxZjQ3OGE0MGU0N2ZlOWZjNjgwMTFjZWYxZTUwCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+Cj4KPiBJJ20gYSBiaXQgdW5lYXN5IHdpdGggbW92aW5nIHRvIGEgcmVsZWFzZSBjYW5k
aWRhdGUgdmVyc2lvbi4gSG93IG11Y2gKPiBlZmZvcnQgaXMgaXQgdG8gYmFja3BvcnQgdGhlIENW
RSBmaXhlcyBvbnRvIHZlcnNpb24gMC44ID8KCkkgdGhpbmsgaXQgaXMgZmVhc2libGUgdG8gYmFj
a3BvcnQgdGhlIDYgcGF0Y2hlcyBidXQgb2J2aW91c2x5IGl0IGlzCnRpbWUgY29uc3VtaW5nIChh
cyBhbHdheXMpLgoKPgo+IEFsdGVybmF0aXZlbHksIGRvIHdlIGhhdmUgc29tZSB2aXNpYmlsaXR5
IG9uIHdoZW4gdGhlIGZpbmFsIDAuOSB3aWxsIGJlCj4gcmVsZWFzZWQ/IEtub3dpbmcgdGhhdCAw
LjggZGF0ZXMgYmFjayBmcm9tIDIwMjAsIGl0IHNlZW1zIGxpa2UgdGhlCj4gcHJvamVjdCBpcyBu
b3QgcGFydGljdWxhcmx5IHF1aWNrIGF0IG1ha2luZyBuZXcgcmVsZWFzZXMgOi0pCgpUaGVyZSBp
cyBhbiBvcGVuIGlzc3VlIGNvbmNlcm5pbmcgdGhlIG5ldyByZWxlYXNlOgpodHRwczovL2dpdGh1
Yi5jb20vYXZhaGkvYXZhaGkvaXNzdWVzLzUwMwpJTUhPLCB3ZSdsbCBub3QgZ2V0IG9uZSBhbnkg
dGltZSBzb29uIGFzIHRoaXMgaXNzdWUgaXMgb3BlbmVkIGZvcgpuZWFybHkgb25lIHllYXIgYW5k
IHRoZSBsYXN0IGNvbW1lbnRzIGFyZSBub3QgdmVyeSBwb3NpdGl2ZS4KCj4KPiBUaGFua3MhCj4K
PiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3Rs
aW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+
IGh0dHBzOi8vYm9vdGxpbi5jb20KCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
