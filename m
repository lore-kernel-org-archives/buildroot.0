Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDECC001DF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 14:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 405E760ADF;
	Sat, 29 Jul 2023 14:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 405E760ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wn1FQ2v_jYxw; Sat, 29 Jul 2023 14:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4027360A8A;
	Sat, 29 Jul 2023 14:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4027360A8A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C7A71BF339
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 14:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 164A383415
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 14:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 164A383415
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b-DGx6r86Xbr for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 14:47:27 +0000 (UTC)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD16882157
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 14:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD16882157
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-584034c706dso31744807b3.1
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 07:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690642045; x=1691246845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mmt6KjedYWrSL4xSKl1Y1rlmG4Ocv+kozavHxKJWIOs=;
 b=lgeLV2zvRsa2AsNxDIsFusJquHCDqTqMQ1YmgpwoZAnBLGfggpdPzamDMBg6LYbTqU
 4mw2gj5FGGxKoapRju41JIcsGgw26MHCsIXIxGHZvKVdtenPltM+4SGp3Yc3QjknJQvo
 H6qWGyzkYbb8TnPox6GLpESF5KuR7uY09/5D98Q6kPfBxnsYS8Q5je55sOVJg8VOmrtk
 OBtXvkcnzyh41YTKY7wjrz1sryhJ2TxpaCdeTBdfYeVDibKt0H1lOeRFgjdhoCPtCYrR
 4ai/j5ZFfcp1/9VqecFlHgoNnOu6dy8UqnaOJgbz/GZZZwI8qIjtuhlanVapg1+MM1Ju
 TePw==
X-Gm-Message-State: ABy/qLarR5gEThXEu9LklupnYLtAU5CiVmd/BNfNxdUUFrKjYBGMfRGW
 WcQxb/8BwXNLSakdwmucQ+amu5L1NWA1Bm/TvR7FRA==
X-Google-Smtp-Source: APBJJlFsvp2pXE2pf5HDHqudFixHU6xFwK/AV50UN7RhjxKpznTcYEpUtfR2xpy3tTEv7oJ7dikkdH28x58sZg3LcR4=
X-Received: by 2002:a0d:d5c8:0:b0:583:d720:db2a with SMTP id
 x191-20020a0dd5c8000000b00583d720db2amr5054759ywd.49.1690642045623; Sat, 29
 Jul 2023 07:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230528113042.585399-1-dario.binacchi@amarulasolutions.com>
 <20230728230159.6440c601@windsurf>
In-Reply-To: <20230728230159.6440c601@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 29 Jul 2023 16:47:14 +0200
Message-ID: <CABGWkvoEvH=4=OmPQHm5T1XMAQ11x-SixLpAxkUL1CUtUrF2_A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1690642045; x=1691246845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmt6KjedYWrSL4xSKl1Y1rlmG4Ocv+kozavHxKJWIOs=;
 b=cgd50W0VcC1RYnHauzfKwwXxVzP//JsOd/Iz1BZEch8rT8CsE+hgkU8DBrn7tVX2gM
 t8PQpwQH+BTxVR6v/7wQwv52d9SFk7NadveMfgpyxqCdR+2gQmoupCUH5AHpOd8vXGgR
 yEFSmQiNFtzPJX6C+Q3NwWR72iWzJLB/h42og=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cgd50W0V
Subject: Re: [Buildroot] [RFC PATCH 1/1] package/automake: include .m4 files
 of autoconf-archive
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

SGVsbG8gVGhvbWFzLAoKT24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgMTE6MDLigK9QTSBUaG9tYXMg
UGV0YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxv
IERhcmlvLAo+Cj4gT24gU3VuLCAyOCBNYXkgMjAyMyAxMzozMDo0MiArMDIwMAo+IERhcmlvIEJp
bmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiA+
IFRoZSBwYXRjaCBleHBhbmRzIHRoZSBudW1iZXIgb2YgdXNhYmxlIC5tNCBmaWxlcyBieSBpbmNs
dWRpbmcgdGhvc2UKPiA+IGNvbnRhaW5lZCBpbiB0aGUgYXV0b2NvbmYtYXJjaGl2ZS4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL2F1dG9tYWtlL2F1dG9tYWtlLm1rIHwg
MyArKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXV0b21ha2UvYXV0b21ha2UubWsgYi9wYWNr
YWdlL2F1dG9tYWtlL2F1dG9tYWtlLm1rCj4gPiBpbmRleCBmZDc5MzNkZDc0ZjkuLmZjMjM1Nzg0
NjQxYSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvYXV0b21ha2UvYXV0b21ha2UubWsKPiA+ICsr
KyBiL3BhY2thZ2UvYXV0b21ha2UvYXV0b21ha2UubWsKPiA+IEBAIC0zNCw1ICszNCw2IEBAICQo
ZXZhbCAkKGhvc3QtYXV0b3Rvb2xzLXBhY2thZ2UpKQo+ID4gIEFVVE9NQUtFID0gJChIT1NUX0RJ
UikvYmluL2F1dG9tYWtlCj4gPiAgQUNMT0NBTF9ESVIgPSAkKFNUQUdJTkdfRElSKS91c3Ivc2hh
cmUvYWNsb2NhbAo+ID4gIEFDTE9DQUwgPSAkKEhPU1RfRElSKS9iaW4vYWNsb2NhbAo+ID4gLUFD
TE9DQUxfUEFUSCA9ICQoQUNMT0NBTF9ESVIpOiQoQUNMT0NBTF9IT1NUX0RJUikKPiA+ICtBQ0xP
Q0FMX0hPU1RfQVJDSElWRV9ESVIgPSAkKEhPU1RfRElSKS9zaGFyZS9hdXRvY29uZi1hcmNoaXZl
Cj4gPiArQUNMT0NBTF9QQVRIID0gJChBQ0xPQ0FMX0RJUik6JChBQ0xPQ0FMX0hPU1RfRElSKTok
KEFDTE9DQUxfSE9TVF9BUkNISVZFX0RJUikKPiA+ICBleHBvcnQgQUNMT0NBTF9QQVRICj4KPiBD
b3VsZCB5b3UgY2xhcmlmeSB0aGUgbW90aXZhdGlvbj8gRG8geW91IGhhdmUgYSBzcGVjaWZpYyBj
YXNlIGZvciB3aGljaAo+IHRoaXMgaXMgbmVlZGVkPwo+Cj4gVGhhbmtzIQo+Cj4gVGhvbWFzCj4g
LS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jv
b3RsaW4uY29tCgpGb2xsb3dpbmcgdGhlIHN1Z2dlc3Rpb25zIG9mIFlhbm4gRS4gTU9SSU4gaW4g
WzFdLCBJIHRyaWVkIHRvIGZpeCB0aGUKaXNzdWUgYnkgc3VibWl0dGluZyBhCnBhdGNoIHRvIHRo
ZSBldGh0b29sIHByb2plY3QuIER1cmluZyB0aGUgdmFyaW91cyByZXZpZXcgc3RhZ2VzLCBJIHNl
bnQKYSB2ZXJzaW9uIChtdWNoIG1vcmUKY29tcGxpY2F0ZWQgdGhhbiB0aGUgb25lIHRoYXQgd2Fz
IGV2ZW50dWFsbHkgYWNjZXB0ZWQpIHRoYXQgcmVxdWlyZWQgYQpzcGVjaWZpYyBNNAptYWNybyAo
WzJdKS4gRnJvbSB0aGVyZSwgdGhlIGlkZWEgZm9yIHRoaXMgcGF0Y2ggd2FzIGJvcm4uCgpbMV0g
aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIz
MDUyMDIxMTI0Ni4zOTUwMTMxLTEtZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20v
ClsyXSBodHRwczovL21hcmMuaW5mby8/bD1saW51eC1uZXRkZXYmbT0xNjg0ODYyMzcxMzE1NjAm
dz0yCgpUaGFua3MgYW5kIHJlZ2FyZHMsCkRhcmlvCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5p
b3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRp
b25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29s
dXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElU
CgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFy
dWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
