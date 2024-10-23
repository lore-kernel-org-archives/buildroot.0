Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3EACFA455
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 17:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5468608C6;
	Wed, 23 Oct 2024 17:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WY3AwSj5Da-f; Wed, 23 Oct 2024 17:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD718608C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD718608C9;
	Wed, 23 Oct 2024 17:30:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C6F62072
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2222811A5
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BdPIr_yFI4A for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 17:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DAA14811A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAA14811A3
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAA14811A3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:30:35 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-50d431b0ae2so600830e0c.1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 10:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729704634; x=1730309434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vpn+t3bUxjuGGhxefgeBi+KjYAdoJP3FT2oX1LOnQnE=;
 b=snFpctPr7Zxhd7UhPj9Hmkwhqt+SQ6l/Ql0ri+MdWcnQeHZ/9Hnbeqx9YFWAMtaoMb
 B/jYNeFxNH1f5k4Q7j2vga8He1PDgmDxW0pO1fA043EzhvaGJTclRMMyaNt+onRKEFax
 QFBBPweWAHKN8AS6Zc/jdwKo4CsAqJ8nfRZbKqT4BCMwjC7k5FVVUSvHhJ7L5o5VHob6
 ecAa4FUxAOG/6wPrlJXW9lQDEFZo5zPTeO5tAOiRj5RnijdhQfUa0MCX+CZPKyK4cHQ+
 tXAcfNy8w5NZAtqEPHX2ZXKhHFgUs323fN2vsIXBanMW9+ISpxxLSJUhbOJP/2pXcDoO
 tfjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGiOYISv1B+vbv6hQNlVKS/ocR/YmTvPal3/000zstOY4GIa12Nc6dJUdcUeA5cDYEmPP2UwvcaQM=@buildroot.org
X-Gm-Message-State: AOJu0YwT3j64KNtG5MEOJwHNNKhk4z+EJpYS5LXR20w5wx3YhBIKcVAp
 m5a/gE/akoEMVBTGU822l65kzco06rzdGdUD1WondFeaK+z7JM8kn9Kdz+g6K0qNbO5f40hcZ9s
 QDcdlw5/PSRw5ANA5IjTni5QAYIQ=
X-Google-Smtp-Source: AGHT+IHfMDBEyf+uK8GYO/NDz67OUjPHNViNy53Rw+S6hYcHQAs1KNXVNO3JAWqhIxR4sSsZgUFWIjt960AnwbXw5SU=
X-Received: by 2002:a05:6122:221a:b0:50d:6cfc:ac4d with SMTP id
 71dfb90a1353d-50fd139f4c5mr3202188e0c.5.1729704633831; Wed, 23 Oct 2024
 10:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
 <20240806185731.372f8f3e@windsurf>
 <CA+h8R2rnNhM0nKyZm4_y6ZFrNyn7YzFa7BHeH57cLif38FSrxA@mail.gmail.com>
 <CADvTj4p2heLayPzF7uTK0TLzbbo4C_305vTg9=3W3aCQbAoQGw@mail.gmail.com>
 <CA+h8R2o--yr=J8bmo6R=rBStYLxwOW+fvEKQ3zfLuKrdZznCCA@mail.gmail.com>
In-Reply-To: <CA+h8R2o--yr=J8bmo6R=rBStYLxwOW+fvEKQ3zfLuKrdZznCCA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 23 Oct 2024 11:30:21 -0600
Message-ID: <CADvTj4rJY6n2JfkYKOVEL=kbL6OSfVKdkofUTkeAqsN_xK0ABg@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729704634; x=1730309434; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vpn+t3bUxjuGGhxefgeBi+KjYAdoJP3FT2oX1LOnQnE=;
 b=PQTGHenevyxhpElyWY3CtZqEZCCi2Vp46MHG8JtT9bAe08Cx+jRxFn1ZnusfiHxBpd
 GcevM1Y5w6MMjiSvKFSG567LuB3r7AXQLERPcBFAG9HAdaPJjV7t8GW7SVG/M/QMTfg7
 jxNuKK8ugkRljL+s+JBhpCbdOZyZjaL8PMgyNA5WbH3aVlLEQVhN8+PnCEMAMF/Er9Pv
 W2djGJgn5OflQKghsOr/X9Na9nBvOH4zMkokNSmkd0PEaL+TJnpxBNDyBlA5bgxsV1dy
 hYR47JownBE7vfm3FKlw/600zrth9A0qD1daDihZCv+3C8kVbVpWFPVLPFGVu1HCQn9o
 EZ9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PQTGHene
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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

T24gV2VkLCBPY3QgMjMsIDIwMjQgYXQgMTA6MzXigK9BTSBDaHJpc3RpYW4gU3Rld2FydAo8Y2hy
aXN0aWFuQGFwZXJ0dXJlLnVzPiB3cm90ZToKPgo+IEphbWVzLAo+Cj4gT24gV2VkLCBPY3QgMjMs
IDIwMjQsIDg6MjHigK9BTSBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IE9uIFR1ZSwgQXVnIDYsIDIwMjQgYXQgMTI6NTPigK9QTSBDaHJpc3Rp
YW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPiB3cm90ZToKPj4gPgo+PiA+IFRob21h
cywKPj4gPgo+PiA+IE9uIFR1ZSwgQXVnIDYsIDIwMjQsIDk6NTfigK9BTSBUaG9tYXMgUGV0YXp6
b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPj4gPj4KPj4gPj4gPiBG
b3Igbm93IHdlIGNhbiBqdXN0IGluY2x1ZGUgdGhlIGxhdGVzdCBjb21taXQgaGFzaCBvZiB0YWls
c2NhbGUgdW50aWwgdGhleQo+PiA+PiA+IG1ha2UgYSBuZXcgcmVsZWFzZSBhbmQgbm90aGluZyBl
bHNlIG5lZWRzIHRvIGJlIGNoYW5nZWQuCj4+ID4+Cj4+ID4+IERvbid0IHVuZGVyc3RhbmQgdGhp
cyBsYXN0IHBhcnQuIFdoYXQgaXMgeW91ciBwcm9wb3NhbCB0byBmaXggdGhlCj4+ID4+IHRhaWxz
Y2FsZSBzaXR1YXRpb24/Cj4+ID4KPj4gPgo+PiA+IFRoZXkgZml4ZWQgdGhlIGlzc3VlIHVwc3Ry
ZWFtIGFuZCBub3cgdGhlIG1haW4gYnJhbmNoIG9mIHRhaWxzY2FsZSB3b3JrcyBmaW5lIHdpdGgg
R09QUk9YWT1kaXJlY3QuIFNlZToKPj4KPj4gSSB0aGluayB0cnlpbmcgdG8gZ2V0IHBhY2thZ2Vz
IHRvIG1ha2UgR09QUk9YWT1kaXJlY3Qgd29yayBpcyBnZXR0aW5nCj4+IHJhdGhlciBhbm5veWlu
Zywgd2hpbGUgdHJ5aW5nIHRvIGFkZCBhbm90aGVyIHBhY2thZ2UobmV0YmlyZCkgSSBvbmNlIGFn
YWluCj4+IHJhbiBpbnRvIHRoaXMgZXhhY3Qgc2FtZSBpc3N1ZS4KPj4KPj4gPgo+PiA+IGh0dHBz
Oi8vZ2l0aHViLmNvbS90YWlsc2NhbGUvdGFpbHNjYWxlL2lzc3Vlcy8xMjg1OSNpc3N1ZWNvbW1l
bnQtMjIzOTE1NzU2Mwo+PiA+Cj4+ID4gSXQgaXMgZmluZSB0byB1c2UgdGhlIG1haW4gYnJhbmNo
IG9mIHRhaWxzY2FsZSBoZXJlIGV2ZW4gaWYgaXQncyBhbiBleHRlcm5hbCBzZXJ2aWNlIGFzIHRh
aWxzY2FsZSBrZWVwcyBjb21wYXRpYmlsaXR5IGJldHdlZW4gcmVsZWFzZXMgLSBJIGV2ZW4gaGF2
ZSBtYW55IG1hY2hpbmVzIHJ1bm5pbmcgcXVpdGUgb3V0IG9mIGRhdGUgdGFpbHNjYWxlIGNsaWVu
dHMgd2hpY2ggc3RpbGwgY29ubmVjdCBhbmQgcnVuIHBlcmZlY3RseS4gVGhlIHNhbWUgY2FuIGJl
IHNhaWQgZm9yIGZvcndhcmRzIGNvbXBhdGliaWxpdHkuCj4+ID4KPj4gPiBBbGwgdGhhdCBJIGFz
ayB3aXRoIHJlZ2FyZHMgdG8gR09QUk9YWSBpcyB0aGF0Ogo+PiA+Cj4+ID4gLSB3ZSBkbyBub3Qg
b3ZlcnJpZGUgaXQgcGVyIHBhY2thZ2UsCj4+Cj4+IEknbSBhIGJpdCBjb25mdXNlZCB3aHkgd2Ug
d291bGQgbm90IHdhbnQgdG8gb3ZlcnJpZGUgaXQgcGVyIHBhY2thZ2UgaWYKPj4gdGhlIGJyZWFr
YWdlIGlzIHBlciBwYWNrYWdlLgo+Pgo+PiA+IC0gaWYgd2UgZG8gZGVjaWRlIHRvIGNoYW5nZSB0
aGUgZGVmYXVsdCB0byB1c2UgR29vZ2xlLCBwbGVhc2UgbWFrZSBpdCBhIGNvbmZpZ3VyYWJsZSBv
cHRpb24gKGxpa2UgQlIyX01JUlJPUikgc28gdGhhdCBJIChhbmQgb3RoZXIgdXNlcnMpIGNhbiBv
dmVycmlkZSBpdCBiYWNrIHRvIGJlIGRpcmVjdC4KPj4KPj4gSWYgYSBwYWNrYWdlIGlzIGtub3du
IHRvIG5vdCBidWlsZCB3aXRoIEdPUFJPWFk9ZGlyZWN0IHRoZW4gd2h5IHdvdWxkCj4+IG9uZSB3
YW50IHRvIG92ZXJyaWRlIHRoZSBkZWZhdWx0IEdPUFJPWFkgcmF0aGVyIHRoYW4gYSBwYWNrYWdl
IHNwZWNpZmljCj4+IEdPUFJPWFk/Cj4KPgo+Cj4gSXQgaXMgYSBwcm94eSwgbm90IGEgZG93bmxv
YWQgVVJMLiBUaGUgaW50ZW50IG9mIHRoZSBlbnRpcmUgR28gbW9kdWxlIHN5c3RlbSBpcyB0byBi
ZSBiYXNlZCBvbiBzb3VyY2UgY29udHJvbCB1bmRlciB0aGUgaG9vZC4gV2Ugc2hvdWxkIGJlIGFi
bGUgdG8gY2hlY2sgb3V0IHRoZSBnaXQgcmVwb3NpdG9yaWVzIG9mIHRoZSB1bmRlcmx5aW5nIHNv
dXJjZSB3aXRob3V0IGhhdmluZyB0byB1c2UgdGhlIEdvb2dsZSBwcm94eS4KCkZyb20gbXkgdW5k
ZXJzdGFuZGluZyBpdCdzIGEgY2FjaGluZyBwcm94eSBlc3NlbnRpYWxseSBkZXNpZ25lZCB0bwpl
bnN1cmUgdGhhdCB0aGUgYnVpbGQgY2FuIGJlIHJlcHJvZHVjZWQgaWYgdGhlIGdpdCByZXBvc2l0
b3JpZXMgYXJlIGV2ZXIKYnJva2VuIGluIHNvbWUgd2F5IGRvd24gdGhlIGxpbmUuCgo+Cj4gSWYg
d2UgbWFrZSBhIGhhYml0IG9mIGlnbm9yaW5nIHRoZXNlIGhhc2ggbWlzbWF0Y2hlcyBpdCB3aWxs
IGJlY29tZSB2ZXJ5IGVhc3kgZm9yIHBlb3BsZSB0byBzdHVmZiBjb2RlIGludG8gYSByZWxlYXNl
IG9uIEdpdEh1YiBhbmQgdGhlbiBjaGFuZ2UgdGhlIHRhZyB0byBzb21ldGhpbmcgZWxzZSBsYXRl
ciwgbGVhdmluZyBiZWhpbmQgdGhlIG9sZCByZWNvcmQgaW4gR09QUk9YWSBhbmQgdHJpY2tpbmcg
bWFpbnRhaW5lcnMgaW50byByZXZpZXdpbmcgdGhlIHdyb25nIGNvZGUgb24gdGhlIG1vZGlmaWVk
IEdpdEh1YiB0YWcuCgpJIG1lYW4sIGlmIHNvbWVvbmUgd2FudHMgdG8gcmVwcm9kdWNlIHRoZSBi
dWlsZCBhbmQgdGhlIGdpdCByZXBvIGRvZXNuJ3QKZnVuY3Rpb24gd2hlbiB1c2VkIGRpcmVjdGx5
IGZvciB3aGF0ZXZlciByZWFzb24gdGhlbiByZXZpZXdpbmcgZnJvbSB0aGUKY2FjaGUgd291bGQg
YXBwZWFyIHRvIGJlIHRoZSBvbmx5IGF2YWlsYWJsZSBvcHRpb24gdG8gZ2V0IHRoZSBjb3JyZWN0
CnNvdXJjZSBjb2RlLgoKPgo+IFRoZXJlIG11c3QgYmUgc29tZSByZWFzb24gd2h5IHlvdXIgcGFj
a2FnZSBpcyBoYXZpbmcgdGhpcyBpc3N1ZS4gV2l0aCBhbmNob3JlIHF1aWxsIHBhY2thZ2Ugd2Ug
Zm91bmQgdGhhdCBpdCB3YXMgZ2l0IGxmcyB3aXRoIHRlc3QgZmlsZXMgY2F1c2luZyB0aGUgcHJv
YmxlbS4KPgo+IEJlc3QgcmVnYXJkcywKPiBDaHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
