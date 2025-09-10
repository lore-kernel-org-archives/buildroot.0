Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793AACA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B2C0418C6;
	Wed, 10 Sep 2025 21:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1xm6lS6O7VZ; Wed, 10 Sep 2025 21:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4602341911
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4602341911;
	Wed, 10 Sep 2025 21:17:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAA36234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACF15407EF
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vvGzi-5drGr for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:17:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2C7140103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2C7140103
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2C7140103
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:17:32 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-892196f0471so40279241.1
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 14:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757539051; x=1758143851;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cDs+yWmnm8QdhUiALuKUVFzI26fjDVTRZlTimwYq4+g=;
 b=HkSc7IggtvuCPPnyUXlS4dEdyrqjRqr4zH1KHDDUDjqjxhNra1HL/hiDi1hdTVrcDf
 RNEOO/e/fmiDw2Q+X9jvnypci/oMxPQXJYow6nnd/3fAnaKVnKf2JS4j37+H1peSYSEh
 7EVlvX0Ktf1xNSA/krRIZ984K+nI8IFj9yXMJ7KZOAj1DpPPKGSjmbchJHqrbXYMuJUC
 r1HGNSTLYe9muXucb8ggTb526NpJWDC0vXkOweOmoJy/KoCwfjKJLJzj3V9dUJ284+BH
 6N1SDXtjPDumi90Rp5xRW7o1fSlYML5Lt0Zxkhh7+JMJdWFlrxU47jnOn4OAIee+2hBq
 l4ug==
X-Gm-Message-State: AOJu0Yx5wRQBn4VEzeMEyboxtda+vVZNVxw6pvChTNYN0znUX81PsNZo
 Kgy7ogSGUv5nFXUHNUZM/AO3Y8CEfXkSwxohN0hvlvMEJsiIVZrSk2PJwmvfWyp3UK2BqFP52m7
 rqblSMi0VPs9vxI6NlFARrEK6E6ghJjY=
X-Gm-Gg: ASbGncuHLg+wARKUkGNOP+e/toTEmRKcRItyu+BMBiXedc36BolSYYzAaKsnH9K3xFg
 dfpFUmRWslDD+9lk3Hn9aS7hDLi5b1aeyZr7/hidhljVet4QFetlV4j/I/9SXH3TFjjTnlkWDoH
 LJw4Xa6Mv07xKMeaUqCxpqwp0sJC3Jc0Wp/WCK9dPP7wBCVMahfq+eMgNszLEQgtr2ZBOGchO7S
 2Nbqe9ulrFJ22UiHKU=
X-Google-Smtp-Source: AGHT+IH523bA8z8z9rUUQazNvWRiRHx3OB8B0nbuZszIyAWuojIaFfTvOrZxtMBugIO9X2VUCS9qlSK13Jfrd5SWSPA=
X-Received: by 2002:a05:6102:5114:b0:52a:ef9a:cbef with SMTP id
 ada2fe7eead31-53d162c0ddfmr6133388137.35.1757539051155; Wed, 10 Sep 2025
 14:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250910183458.1288165-1-james.hilliard1@gmail.com>
 <CA+h8R2ozbY7zf0=x+gP=bgruLYOK7qW1Ex5Sa0x_h_gaqqHrwg@mail.gmail.com>
In-Reply-To: <CA+h8R2ozbY7zf0=x+gP=bgruLYOK7qW1Ex5Sa0x_h_gaqqHrwg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 10 Sep 2025 15:17:20 -0600
X-Gm-Features: AS18NWBUXmmsKmtsGfN6WHccXb1_Mq6qct0R__YM3e9hGFSqcRnPnfmUzMEXefc
Message-ID: <CADvTj4pVPa=j0BrhiJMoiYBmzq_uXbUtUw-xEqdNoWUCkam+VQ@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757539051; x=1758143851; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cDs+yWmnm8QdhUiALuKUVFzI26fjDVTRZlTimwYq4+g=;
 b=kc5ZNMB5K2Z/2LL6qG9jRMp6F9twniTSrm1H0ZALNquPmsBTH4Pi0yFFy49VSXgqBt
 V/GmpCrp2u/R8Dwd7yPDTOmUzLdMR7h6MhrMcASeLswYkj3zzxmbCXmCaUfn3ys+3UL0
 Kf/kkpIhNrMJtmHB5N3eMIxyUepcjikWnZXG9vcLHitsIHuhqLzdHBxXFh4jwmizsgek
 /cO9wJxzAaTuxkEw29sthSpAHBmQiuZyZUMyvBuMufnMSJwD6wzgp204RtZlREc/W4SD
 21gDkaR9EbHwpSJ+yuBtIZbFxsAUdaiT2C0Tv3efBDxxw5AHn8g2sPKvcN0kvXUHPmYd
 FwlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kc5ZNMB5
Subject: Re: [Buildroot] [PATCH 1/2] package/go: bump to version 1.25.1
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

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMjozM+KAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gSGkgSmFtZXMsCj4KPiBPbiBXZWQsIFNlcCAx
MCwgMjAyNSBhdCAxMTozNOKAr0FNIEphbWVzIEhpbGxpYXJkCj4gPGphbWVzLmhpbGxpYXJkMUBn
bWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEJ1aWxkaW5nIEdvIDEuMjQgYW5kIGxhdGVyIHJlcXVp
cmVzIEdvIDEuMjIuNiBvciBsYXRlciBmb3IgYm9vdHN0cmFwLgo+ID4KPiA+IFRvIHN1cHBvcnQg
dGhpcyB3ZSB1c2Ugb3VyIHByZXZpb3VzIEdvIHZlcnNpb24gMS4yMy4xMiBhcyB0aGUgdmVyc2lv
bgo+ID4gZm9yIGdvLWJvb3RzdHJhcC1zdGFnZTQgYW5kIGhhdmUgdGhlIGJ1aWxkIGZvciBHbyAx
LjI1LjEgZGVwZW5kIG9uCj4gPiBnby1ib290c3RyYXAtc3RhZ2U0Lgo+ID4KPiA+IEdvIHZlcnNp
b24gMS4yMy4xMiBpcyB0aGUgbGF0ZXN0IGdvIHZlcnNpb24gd2UgY2FuIGJ1aWxkIHVzaW5nCj4g
PiBnby1ib290c3RyYXAtc3RhZ2UzLgo+ID4KPiA+IFRoZSBwYWNrYWdlIGJ1aWxkIGZvciBnby1i
b290c3RyYXAtc3RhZ2U0IGlmIGVmZmVjdGl2ZWx5IGlkZW50aWNhbCB0bwo+ID4gZ28tYm9vdHN0
cmFwLXN0YWdlMyB3aXRoIG9ubHkgdGhlIEdvIHZlcnNpb24gYW5kIHN0YWdlIG51bWJlciBjaGFu
Z2VkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFy
ZDFAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9nby9Db25maWcuaW4uaG9zdCAgICAg
ICAgICAgICAgICAgICAgIHwgIDkgKy0tCj4gPiAgLi4ubGR2Y3MtZmFsc2Utd2hlbi1idWlsZGlu
Zy1nby1ib290c3RyLnBhdGNoIHwgNzEgKysrKysrKysrKysrKysrKysrKwo+ID4gIHBhY2thZ2Uv
Z28vZ28tYm9vdHN0cmFwLXN0YWdlNC9Db25maWcuaW4uaG9zdCB8ICA0ICsrCj4gPiAgLi4uL2dv
LWJvb3RzdHJhcC1zdGFnZTQuaGFzaCAgICAgICAgICAgICAgICAgIHwgIDMgKwo+ID4gIC4uLi9n
by1ib290c3RyYXAtc3RhZ2U0Lm1rICAgICAgICAgICAgICAgICAgICB8IDU0ICsrKysrKysrKysr
KysrCj4gPiAgcGFja2FnZS9nby9nby1zcmMvZ28tc3JjLm1rICAgICAgICAgICAgICAgICAgIHwg
IDQgKy0KPiA+ICBwYWNrYWdlL2dvL2dvLmhhc2ggICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAxNCArKy0tCj4gPiAgcGFja2FnZS9nby9nby5tayAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KPiA+ICA4IGZpbGVzIGNoYW5nZWQsIDE0NyBpbnNlcnRpb25zKCspLCAxNCBk
ZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nby9nby1ib290c3Ry
YXAtc3RhZ2U0LzAwMDEtY21kLWRpc3Qtc2V0LWJ1aWxkdmNzLWZhbHNlLXdoZW4tYnVpbGRpbmct
Z28tYm9vdHN0ci5wYXRjaAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dvL2dvLWJv
b3RzdHJhcC1zdGFnZTQvQ29uZmlnLmluLmhvc3QKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9nby9nby1ib290c3RyYXAtc3RhZ2U0L2dvLWJvb3RzdHJhcC1zdGFnZTQuaGFzaAo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dvL2dvLWJvb3RzdHJhcC1zdGFnZTQvZ28tYm9v
dHN0cmFwLXN0YWdlNC5tawo+Cj4gSSBqdXN0IHN1Ym1pdHRlZCBhIGRpZmZlcmVudCBzZXJpZXMg
dG8gZG8gdGhlIHNhbWUgdGhpbmcsIHNvcnJ5LCBJCj4gZGlkbid0IHNlZSB5b3VycyB1bnRpbCBJ
IGhhZCBhbHJlYWR5IHN1Ym1pdHRlZC4KPgo+IEl0J3MgYSBiaXQgZGlmZmVyZW50IHRob3VnaCwg
c2VwYXJhdGUgY29tbWl0cyBmb3IgYWRkaW5nIHN0YWdlNCBhbmQKPiBnbzEuMjQgYW5kIGdvIDEu
MjUgZm9yIGJldHRlciBiaXNlY3QuCgpOb3Qgc3VyZSBpZiB0aGVyZSdzIG11Y2ggcmVhc29uIHRv
IGhhdmUgYW4gaW50ZXJtZWRpYXJ5IGdvMS4yNCBhcyBnbzEuMjUKaGFzIHRoZSBzYW1lIGJvb3Rz
dHJhcCByZXF1aXJlbWVudHMuCgpZb3VyIHN0YWdlNCBwcm9iYWJseSBzaG91bGQgdXNlIHZlcnNp
b24gMS4yMy4xMi4KCj4gV2hhdCBkbyB5b3UgdGhpbms/CgpJIHRoaW5rIHlvdXJzIG1pZ2h0IGJl
IG1pc3Npbmcgc29tZSBjb25maWcgY2hhbmdlcywgYW55dGhpbmcgeW91IGRpZCBpbgp5b3VycyB0
aGF0IEkgbWlzc2VkIGluIG1pbmU/Cgo+IDEuIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNTA5MTAyMDIxMzguMTM2NDgtMS1jaHJpc3RpYW5A
YXBlcnR1cmUudXMvCj4gMi4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1
aWxkcm9vdC9wYXRjaC8yMDI1MDkxMDIwMjEzOC4xMzY0OC0yLWNocmlzdGlhbkBhcGVydHVyZS51
cy8KPiAzLiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3Bh
dGNoLzIwMjUwOTEwMjAyMTM4LjEzNjQ4LTMtY2hyaXN0aWFuQGFwZXJ0dXJlLnVzLwo+Cj4gSXQn
cyBhY3R1YWxseSBhbm90aGVyIHJldmlzaW9uIG9mIGEgdmVyeSBvbGQgc2VyaWVzIEkgc3VibWl0
dGVkIGZvciBnbzEuMjQuCj4KPiBUaGFua3MsCj4gQ2hyaXN0aWFuIFN0ZXdhcnQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
