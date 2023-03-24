Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E2AC74A5B
	for <buildroot@archiver.kernel.org>; Fri, 24 Mar 2023 02:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0690540497;
	Fri, 24 Mar 2023 02:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0690540497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBhWFyIn3sWF; Fri, 24 Mar 2023 02:45:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C2944048C;
	Fri, 24 Mar 2023 02:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C2944048C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A2521BF311
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 02:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43CD04048C
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 02:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43CD04048C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvgZ0egFbMdZ for <buildroot@lists.busybox.net>;
 Fri, 24 Mar 2023 02:45:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F08C1400B9
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F08C1400B9
 for <buildroot@buildroot.org>; Fri, 24 Mar 2023 02:45:19 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id eg48so2447788edb.13
 for <buildroot@buildroot.org>; Thu, 23 Mar 2023 19:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679625917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nbivs568qGcnacJTDNIwDIfGFwOAmXDZe4rGUfxBw2w=;
 b=Pu8v4QzT/e7jw8Yk0CNjxPQESfH8fMUwXqV4dGbqJXvrtQHGEYfORlDF2jojrLwyXK
 QOdVK2FpotXegopgRDwV9bwxysHq66L++OtDrisNq1P9RcPOuivaJWwwAqJxugtNPb3D
 cWfl9zBTQZ1D57tJwLq4PQtichgnTPZcd6tW6+HI2U0p7dik+uARhfanZPTTQ3q0mjxg
 lzNRvup2o0x/oewX0lDZ4XS+t5iRA5lQnsG5kkNLCEU7Gvzugr1MGBWpNjksvxrsElHp
 R/4XpF6GkzsIcOzAQWeRG0sRaJz0tlQSYD/Zm0qNXcHiutZJW03iJ3xQMVWSlBAH760I
 EzHw==
X-Gm-Message-State: AAQBX9e9lgGOttOZtad4tNaxDZCa0Jfhfx1eC+C/9pOy8vShIQrdwOuv
 2YfRTh37iLtaNIk7/Ux/s7+R/dQubPj13arvZ4qKYw==
X-Google-Smtp-Source: AKy350Y9kkyK7rYBzZO8dhP9RmLmTfrGe8SeD2UQDiLjom5OMG38L+rmK1i3Z+jQWVZVl+wOmd8Dhw==
X-Received: by 2002:a17:907:d68f:b0:92f:924b:e8f4 with SMTP id
 wf15-20020a170907d68f00b0092f924be8f4mr1240714ejc.4.1679625917362; 
 Thu, 23 Mar 2023 19:45:17 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 z23-20020a50cd17000000b004bd1fe2cc02sm10046773edi.16.2023.03.23.19.45.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 19:45:16 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id ek18so2572769edb.6
 for <buildroot@buildroot.org>; Thu, 23 Mar 2023 19:45:15 -0700 (PDT)
X-Received: by 2002:a17:907:9623:b0:93e:aac:bb8d with SMTP id
 gb35-20020a170907962300b0093e0aacbb8dmr341962ejc.13.1679625915319; Thu, 23
 Mar 2023 19:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230215073256.186476-1-christian@paral.in>
 <20230312225806.0bf4b0fd@windsurf>
In-Reply-To: <20230312225806.0bf4b0fd@windsurf>
Date: Thu, 23 Mar 2023 19:45:04 -0700
X-Gmail-Original-Message-ID: <CA+h8R2ppxhXNkWSO9qWar2d21Xg7cWzZ8nJR82PyBF4=5+bpfQ@mail.gmail.com>
Message-ID: <CA+h8R2ppxhXNkWSO9qWar2d21Xg7cWzZ8nJR82PyBF4=5+bpfQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google; t=1679625917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nbivs568qGcnacJTDNIwDIfGFwOAmXDZe4rGUfxBw2w=;
 b=I0Ac0h17HfYaYnActuZE283oOdhylp8sNMS7sTX1ItplT/8df21iL7UdX+tUMWBeEW
 01LxPkywM5IwyVzKOG9wO/WaR+dW3ryp/x0nZIOv29lCzl7ZWq1KO/okvnHYGL8ruskL
 /4wfaY3dlwo3NxD6N3nRSmVKwZKV31v9Uo8XwhQ43IqGOeEDCRHk0ynsxBxjhN0EytYt
 ZMrP+ocMqqTDJdlogLPWyu/3WeQkTw+xxdQsgKfB4NvHaRRKOLgO68iQ2Ppac0ch1bNj
 XlKV5Mh8VESED3j0yRd+Z88CfEQAmE9Osgfk6CAtls/IWXeNPj0gwy2V7Cb91sUjdxtE
 3J+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=I0Ac0h17
Subject: Re: [Buildroot] [PATCH v3 1/3] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLAoKT24gU3VuLCBNYXIgMTIsIDIwMjMgYXQgMjo1OOKAr1BNIFRob21hcyBQZXRhenpv
bmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+IE9uIFR1ZSwgMTQgRmVi
IDIwMjMgMjM6MzI6NTQgLTA4MDAKPiBDaHJpc3RpYW4gU3Rld2FydCB2aWEgYnVpbGRyb290IDxi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiA+ICsjIFVzZSBsYXN0IEMtYmFzZWQg
R28gY29tcGlsZXI6IHYxLjQueAo+ID4gKyMgU2VlIGh0dHBzOi8vZ29sYW5nLm9yZy9kb2MvaW5z
dGFsbC9zb3VyY2UjYm9vdHN0cmFwRnJvbVNvdXJjZQo+ID4gK0dPX0JPT1RTVFJBUF9TVEFHRTFf
VkVSU0lPTiA9IDEuNC1ib290c3RyYXAtMjAxNzEwMDMKPiA+ICtHT19CT09UU1RSQVBfU1RBR0Ux
X1NJVEUgPSBodHRwczovL2RsLmdvb2dsZS5jb20vZ28KPiA+ICtHT19CT09UU1RSQVBfU1RBR0Ux
X1NPVVJDRSA9IGdvJChHT19CT09UU1RSQVBfU1RBR0UxX1ZFUlNJT04pLnRhci5nego+ID4gKwo+
ID4gK0dPX0JPT1RTVFJBUF9TVEFHRTFfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+ID4gK0dPX0JP
T1RTVFJBUF9TVEFHRTFfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiA+ICsKPiA+ICsjIFRoZSB0
b29sY2hhaW4gaXMgbmVlZGVkIGZvciBIT1NUQ0NfTk9DQUNIRSB1c2VkIHRvIGNvbXBpbGUgdGhl
IEdvIGNvbXBpbGVyLgo+Cj4gVGhpcyBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZS4gV2h5IHdvdWxk
IHRoZSB0b29sY2hhaW4gcGFja2FnZSBiZSBuZWVkZWQKPiBmb3IgSE9TVENDX05PQ0NBQ0hFID8g
V2UgaGF2ZSBzZXZlcmFsIHBhY2thZ2VzIHRoYXQgdXNlIEhPU1RDQ19OT0NDQUNIRQo+IGJlZm9y
ZSB0aGUgdG9vbGNoYWluIGlzIHJlYWR5LgoKSSBzdXBwb3NlIEhPU1RDQ19OT0NDQUNIRSB1c2Vz
IHRoZSBnY2MgaW5zdGFsbGVkIG91dHNpZGUgb2YgYnVpbGRyb290LApzbyBpdCBzaG91bGQgYmUg
ZmluZSB0byByZW1vdmUgdGhpcyBkZXBlbmRlbmN5LgoKCj4gPiArICAgICAjIFNldCBhbGwgZmls
ZSB0aW1lc3RhbXBzIHRvIHByZXZlbnQgdGhlIGdvIGNvbXBpbGVyIGZyb20gcmVidWlsZGluZyBh
bnkKPiA+ICsgICAgICMgYnVpbHQgaW4gcGFja2FnZXMgd2hlbiBwcm9ncmFtcyBhcmUgYnVpbHQu
Cj4gPiArICAgICBmaW5kICQoSE9TVF9HT19CT09UU1RSQVBfU1RBR0UyX1JPT1QpIC10eXBlIGYg
LWV4ZWMgdG91Y2ggLXIgJChARCkvYmluL2dvIHt9IFw7Cj4KPiBTbyB3ZSBoYXZlIHRvIGRvIHRo
aXMgZm9yIGJvb3RzdHJhcC1zdGFnZTIgYnV0IG5vdCBib290c3RyYXAtc3RhZ2UxID8KCkl0J3Mg
bm90IHN0cmljdGx5IG5lY2Vzc2FyeSBmb3IgZWl0aGVyIG9uZS4gSSByZW1vdmVkIGl0IGZvciB0
aGUgbmV4dApyZXZpc2lvbiBvZiB0aGUgcGF0Y2guCgoKPiA+IC0gICAgIGRlcGVuZHMgb24gQlIy
X1BBQ0tBR0VfSE9TVF9HT19CT09UU1RSQVBfQVJDSF9TVVBQT1JUUwo+ID4gKyAgICAgZGVwZW5k
cyBvbiBCUjJfUEFDS0FHRV9IT1NUX0dPX0JPT1RTVFJBUF9TVEFHRTJfQVJDSF9TVVBQT1JUUwo+
ID4gKyAgICAgIyBTZWUgaHR0cHM6Ly9nby5kZXYvZG9jL2luc3RhbGwvc291cmNlI2Vudmlyb25t
ZW50Cj4gPiArICAgICAjIFNlZSBzcmMvZ28vYnVpbGQvc3lzbGlzdC5nbyBmb3IgdGhlIGxpc3Qg
b2Ygc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMKPgo+IFRoaXMgY29tbWVudCBsb29rcyBnb29kLCBi
dXQgaXMgdW5yZWxhdGVkLiBTZXBhcmF0ZSBwYXRjaD8KCklzIGl0IHJlYWxseSBuZWNlc3Nhcnkg
dG8gcHV0IGluIGEgc2VwYXJhdGUgcGF0Y2g/IEl0J3MgYSBtaW5vciBjb21tZW50IGNoYW5nZS4K
CkZlZWxzIGFwcHJvcHJpYXRlIHRvIGJ1bmRsZSBpdCBoZXJlIHdpdGggb3RoZXIgcmVsYXRlZCBj
aGFuZ2VzLgoKPiA+ICAgICAgIGRlcGVuZHMgb24gKEJSMl9hcm0gJiYgQlIyX1RPT0xDSEFJTl9T
VVBQT1JUU19QSUUpIHx8IEJSMl9hYXJjaDY0IFwKPiA+ICAgICAgICAgICAgICAgfHwgQlIyX2kz
ODYgfHwgQlIyX3g4Nl82NCB8fCBCUjJfcG93ZXJwYzY0bGUgXAo+ID4gICAgICAgICAgICAgICB8
fCBCUjJfbWlwczY0IHx8IEJSMl9taXBzNjRlbCB8fCBCUjJfcmlzY3YgfHwgQlIyX3MzOTB4Cj4g
PiBAQCAtMjgsNCArMzAsNCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9HT19UQVJHRVRfQ0dP
X0xJTktJTkdfU1VQUE9SVFMKPiA+ICBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9HT19IT1NUX0FS
Q0hfU1VQUE9SVFMKPiA+ICAgICAgIGJvb2wKPiA+ICAgICAgIGRlZmF1bHQgeQo+ID4gLSAgICAg
ZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX0dPX0JPT1RTVFJBUF9BUkNIX1NVUFBPUlRTCj4g
PiArICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfR09fQk9PVFNUUkFQX1NUQUdFMl9B
UkNIX1NVUFBPUlRTCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nby9nby5tayBiL3BhY2thZ2Uv
Z28vZ28ubWsKPiA+IGluZGV4IGMzOGFlMGI5OWMuLmIwZGQwMDI3MTIgMTAwNjQ0Cj4gPiAtLS0g
YS9wYWNrYWdlL2dvL2dvLm1rCj4gPiArKysgYi9wYWNrYWdlL2dvL2dvLm1rCj4gPiBAQCAtMTIs
NyArMTIsNyBAQCBHT19MSUNFTlNFID0gQlNELTMtQ2xhdXNlCj4gPiAgR09fTElDRU5TRV9GSUxF
UyA9IExJQ0VOU0UKPiA+ICBHT19DUEVfSURfVkVORE9SID0gZ29sYW5nCj4gPgo+ID4gLUhPU1Rf
R09fREVQRU5ERU5DSUVTID0gaG9zdC1nby1ib290c3RyYXAKPiA+ICtIT1NUX0dPX0RFUEVOREVO
Q0lFUyA9IGhvc3QtZ28tYm9vdHN0cmFwLXN0YWdlMgo+ID4gIEhPU1RfR09fR09QQVRIID0gJChI
T1NUX0RJUikvc2hhcmUvZ28tcGF0aAo+ID4gIEhPU1RfR09fSE9TVF9DQUNIRSA9ICQoSE9TVF9E
SVIpL3NoYXJlL2hvc3QtZ28tY2FjaGUKPiA+ICBIT1NUX0dPX1JPT1QgPSAkKEhPU1RfRElSKS9s
aWIvZ28KPiA+IEBAIC0xMjEsMTIgKzEyMSwxMiBAQCBIT1NUX0dPX0hPU1RfRU5WID0gXAo+ID4g
ICAgICAgQ0dPX0NYWEZMQUdTPSIkKEhPU1RfQ1hYRkxBR1MpIiBcCj4gPiAgICAgICBDR09fTERG
TEFHUz0iJChIT1NUX0xERkxBR1MpIgo+ID4KPiA+IC0jIFRoZSBnbyBidWlsZCBzeXN0ZW0gaXMg
bm90IGNvbXBhdGlibGUgd2l0aCBjY2FjaGUsIHNvIHVzZQo+ID4gLSMgSE9TVENDX05PQ0NBQ0hF
LiAgU2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vaXNzdWVzLzExNjg1Lgo+ID4gKyMg
VGhlIGdvIGJ1aWxkIHN5c3RlbSBpcyBub3QgY29tcGF0YWJsZSB3aXRoIGNjYWNoZSwgc28gdXNl
IEhPU1RDQ19OT0NDQUNIRS4KPiA+ICsjIFNlZSBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dv
L2lzc3Vlcy8xMTY4NS4KPgo+IFdoeSBpcyB0aGlzIGNvbW1lbnQgYmVpbmcgY2hhbmdlZCwgd2l0
aCBhIHR5cG8gYWRkZWQ/CgpGaXhlZCB0aGUgdHlwby4gVGhlIGNvbW1lbnQgaXMgYmVpbmcgY2hh
bmdlZCBiZWNhdXNlIGl0IGNhbiBmaXQgb24gYQpzaW5nbGUgbGluZSBpbiA3NSBjaGFyYWN0ZXJz
LgoKSXQganVzdCBsb29rcyBjbGVhbmVyLgoKSSBjYW4gcmV2ZXJ0IHRoaXMgaWYgbmVjZXNzYXJ5
LgoKPiA+ICBIT1NUX0dPX01BS0VfRU5WID0gXAo+ID4gICAgICAgR08xMTFNT0RVTEU9b2ZmIFwK
PiA+ICAgICAgIEdPQ0FDSEU9JChIT1NUX0dPX0hPU1RfQ0FDSEUpIFwKPiA+IC0gICAgIEdPUk9P
VF9CT09UU1RSQVA9JChIT1NUX0dPX0JPT1RTVFJBUF9ST09UKSBcCj4gPiArICAgICBHT1JPT1Rf
Qk9PVFNUUkFQPSQoSE9TVF9HT19CT09UU1RSQVBfU1RBR0UyX1JPT1QpIFwKPiA+ICAgICAgIEdP
Uk9PVF9GSU5BTD0kKEhPU1RfR09fUk9PVCkgXAo+ID4gICAgICAgR09ST09UPSIkKEBEKSIgXAo+
ID4gICAgICAgR09CSU49IiQoQEQpL2JpbiIgXAo+ID4gQEAgLTE1NCw3ICsxNTQsNiBAQCBkZWZp
bmUgSE9TVF9HT19JTlNUQUxMX0NNRFMKPiA+ICAgICAgIGNwIC1hICQoQEQpL3BrZy9pbmNsdWRl
ICQoQEQpL3BrZy9saW51eF8qICQoSE9TVF9HT19ST09UKS9wa2cvCj4gPiAgICAgICBjcCAtYSAk
KEBEKS9wa2cvdG9vbCAkKEhPU1RfR09fUk9PVCkvcGtnLwo+ID4KPiA+IC0gICAgICMgVGhlcmUg
aXMgYSBrbm93biBpc3N1ZSB3aGljaCByZXF1aXJlcyB0aGUgZ28gc291cmNlcyB0byBiZSBpbnN0
YWxsZWQKPgo+IFdoeSBpcyB0aGlzIGNvbW1lbnQgYmVpbmcgcmVtb3ZlZD8KCkl0J3Mgbm90IGFu
IGlzc3VlLCBwZXIgc2UuIFRoZSBuYXR1cmUgb2YgdGhlIEdvIGNvbXBpbGVyIGlzIHRoYXQgaXQK
bmVlZHMgdGhlIHNvdXJjZXMgdG8gd29yay4KVGhhdCBidWcgcmVwb3J0IGhhcyBiZWVuIGNsb3Nl
ZCBmb3IgeWVhcnMgbm93IGFuZCBpcyBhY3R1YWxseQp1bnJlbGF0ZWQgdG8gbmVlZGluZyBzb3Vy
Y2VzIGFueXdheS4KClBsZWFzZSBsZXQgbWUga25vdyBpZjoKCiAtIEkgbmVlZCB0byBtYWtlIGEg
c2VwYXJhdGUgcGF0Y2ggZm9yIHRoYXQgbWlub3IgY29tbWVudCBjaGFuZ2UgKEkgdm90ZSBub3Qp
CiAtIFRoYXQgY29tbWVudCBhZGp1c3RtZW50IHNob3VsZCBiZSByZXZlcnRlZCBvciBub3QgKEkg
dm90ZSBub3QpCiAtIFRoZSBjb21tZW50IG1lbnRpb25pbmcgaW5zdGFsbGluZyBzb3VyY2VzIG5l
ZWRzIHRvIGJlIHRoZXJlIChJIHZvdGUgbm90KQoKT3RoZXJ3aXNlIEkgYXBwbGllZCB0aGUgb3Ro
ZXIgY2hhbmdlcyBhbmQgYW0gcmVhZHkgdG8gcmVzcGluIGEgbmV3IHJldmlzaW9uLgoKQmVzdCBy
ZWdhcmRzLApDaHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
