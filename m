Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A25C4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 14:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C35840149;
	Mon, 22 Apr 2024 14:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faNLqLW7TP63; Mon, 22 Apr 2024 14:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A97644056A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A97644056A;
	Mon, 22 Apr 2024 14:22:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD651BF31C
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 14:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 799BB608A9
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 14:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4gB3XRdNZZW for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 14:22:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0B99608A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0B99608A2
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0B99608A2
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 14:22:29 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51acb95b892so3247021e87.2
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 07:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713795747; x=1714400547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MuNRPdUi/0G0vyvriRlPl6CJXquswKO04hZW0sPEeNE=;
 b=VDGGiA037xdHE/4QNMONwTLBJryzX+u56GF3Tu9P4zpOq5N83lL6iRfgqpJG50M8Rc
 OkOS+XVjrrTsFIXQrvLv/clA453wB4++2D4AzQM2rFd0iU0rhgcSnuGuqfWW42vpG3cI
 qn3j/GHPrd1W6amNHk6NBc92SHKGNRZNAtq4L5BS3LaFB8A0rsV7wQ2leo3qbWiGwR5j
 31atm1hknAuQyMiX9Vvr0JjpvyBYxIDGyJReQZknegW9TIN3SdNc8OR2k+HZfFX0GKdM
 au8Epz+IOSSdTTD2lXrReZiBnTFHMkSipODmqT1gpwOpyvrHHPzeScQvpqJU0S88SeRQ
 9phA==
X-Gm-Message-State: AOJu0Yyu3NUUzTJJnNa2YEvRjr9TOC9/SSuVAD4o4toUzrKIp2Xz/N/0
 LBbtqJ0HZ7WnTCOOSQqtKqZlEO2B7CxhW4RkuFPbJRQixbpK9qcbd7f26+Ylz503XwislI1nxfJ
 x5tvzfz6TaGxqYU3WIyHL8obiVz8=
X-Google-Smtp-Source: AGHT+IHuw1AdAheRdEhR37m8PN7zxv8shkHR4ZetqD+yxyUsi3HpYp8H3IA8RcbSXrdTwDNzxM8n/lwwjPfGwqk0RKo=
X-Received: by 2002:a19:6411:0:b0:515:b164:4112 with SMTP id
 y17-20020a196411000000b00515b1644112mr7377259lfb.68.1713795747160; Mon, 22
 Apr 2024 07:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kv4F+h1KZOiYTJ2ZActM6FMekfUc-OSQYt+ABEjdCsncA@mail.gmail.com>
 <20240422141405.10ed2e21@gmx.net>
 <CAGm1_ks=J-wT0QrPxMFO+DrXsRXYCLGnUdGJhaHUwOLaqPER+Q@mail.gmail.com>
 <CAGm1_kudsdPfm+++_ZTXz2D23ezUJSxGaKaGpxC_ac45eK8sgQ@mail.gmail.com>
 <20240422151155.28acd5df@gmx.net> <20240422152617.7c201eb0@gmx.net>
In-Reply-To: <20240422152617.7c201eb0@gmx.net>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 22 Apr 2024 16:22:14 +0200
Message-ID: <CAGm1_kuucrr-HD-Y_fe6cRSZ_gpa-Zn8N3-ak9YgfxpZ7g_9ng@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1713795747; x=1714400547; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MuNRPdUi/0G0vyvriRlPl6CJXquswKO04hZW0sPEeNE=;
 b=NeSUYr/bsdWgwyDDTy7Zu/qhjPK5H3r5fnAq5x5TiZmeJDrjYfuguWoJD6f9dfIocY
 7+yrvwY+l0TVOsTD3JNRStUDLg9VKeoTMrTN6yvOADJ4ZMQbkvUbc5Isn0p1QKwhLlHI
 wUJnXxaBurw8PLDC/gls8CNfCuo2+kYhLwo3uCLpqoQ5S14QrmT5okZV9GG3xxwZ893u
 3bQOO2+1GAQeTQA6vD/eZEeN9h4cTNrBT/vn282z4zXKgN9fO/qgWo2IZ+nD2BUpo7WF
 cWMvuysbTJp/jrIKn+BBxJp07Lq/p/qOYNmhbaRTGABczkrUfegcBZ0zPJcvR+2sp2zg
 M64A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NeSUYr/b
Subject: Re: [Buildroot] pkg-meson.mk: support for the host python packages
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Seiderer via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBBcHIgMjIsIDIwMjQgYXQgMzozMeKAr1BNIFBldGVyIFNlaWRlcmVyIDxwcy5yZXBv
cnRAZ214Lm5ldD4gd3JvdGU6Cj4KPiBPbiBNb24sIDIyIEFwciAyMDI0IDE1OjExOjU1ICswMjAw
LCBQZXRlciBTZWlkZXJlciB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4g
d3JvdGU6Cj4KPiA+IE9uIE1vbiwgMjIgQXByIDIwMjQgMTQ6Mjk6NDIgKzAyMDAsIFllZ29yIFll
ZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBPbiBN
b24sIEFwciAyMiwgMjAyNCBhdCAyOjI44oCvUE0gWWVnb3IgWWVmcmVtb3YKPiA+ID4gPHllZ29y
c2xpc3RzQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIE1vbiwgQXBy
IDIyLCAyMDI0IGF0IDI6MTnigK9QTSBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+
IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIE1vbiwgMjIgQXByIDIwMjQgMTI6NDY6MDQg
KzAyMDAsIFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4gd3JvdGU6
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPiBsaWJnbGliMiAyLjgwLjAgcmVxdWlyZXMgaG9zdC1weXRo
b24tcGFja2FnaW5nIHRvIGJ1aWxkIHRoZSBsaWJyYXJ5IFsxXS4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gV2hhdCBpcyB0aGUgYmVzdCB3YXkgdG8gdGVsbCBtZXNvbi9uaW5qYSB3aGVyZSB0byBs
b29rIGZvciBvdXIgaG9zdAo+ID4gPiA+ID4gPiBweXRob24gcGFja2FnZXM/Cj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IFsxXSBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvZ2xpYi8tL2Nv
bW1pdC9mYzZmMDYxMjdjZmY5ZmUzZTQ2NGI1YmU4YzkyZWEwOGE2NzliNjIwCj4gPiA+ID4gPgo+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIubWsgYi9wYWNr
YWdlL2xpYmdsaWIyL2xpYmdsaWIyLm1rCj4gPiA+ID4gPiBpbmRleCBjMDZkZWQyYTViLi44MTky
ODI5MTBhIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5t
awo+ID4gPiA+ID4gKysrIGIvcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5tawo+ID4gPiA+ID4g
QEAgLTM0LDkgKzM0LDExIEBAIEhPU1RfTElCR0xJQjJfQ09ORl9PUFRTID0gXAo+ID4gPiA+ID4K
PiA+ID4gPiA+ICBMSUJHTElCMl9ERVBFTkRFTkNJRVMgPSBcCj4gPiA+ID4gPiAgICAgICAgIGhv
c3QtcGtnY29uZiBob3N0LWxpYmdsaWIyIFwKPiA+ID4gPiA+ICsgICAgICAgaG9zdC1weXRob24z
IGhvc3QtcHl0aG9uLXBhY2thZ2luZyBcCj4gPiA+ID4gPiAgICAgICAgIGxpYmZmaSBwY3JlMiB6
bGliICQoVEFSR0VUX05MU19ERVBFTkRFTkNJRVMpCj4gPiA+ID4gPgo+ID4gPiA+ID4gIEhPU1Rf
TElCR0xJQjJfREVQRU5ERU5DSUVTID0gXAo+ID4gPiA+ID4gKyAgICAgICBob3N0LXB5dGhvbjMg
aG9zdC1weXRob24tcGFja2FnaW5nIFwKPiA+ID4gPiA+ICAgICAgICAgaG9zdC1nZXR0ZXh0IFwK
PiA+ID4gPiA+ICAgICAgICAgaG9zdC1saWJmZmkgXAo+ID4gPiA+ID4gICAgICAgICBob3N0LXBj
cmUyIFwKPiA+ID4gPgo+ID4gPiA+IFRoaXMganVzdCBidWlsZHMgdGhlIHBhY2thZ2UgYnV0IG1l
c29uIHdvbid0IGxvb2sgaW4KPiA+ID4gPiBob3N0L2xpYi9weXRob24zLjExL3NpdGUtcGFja2Fn
ZXMvIGZvciByZWdleC4KPiA+Cj4gPiBTb3JyeSwgd29ya3MgZm9yIG1lIChhbmQgYWRkaXRpb25h
bCByZW1vdmVkIHRoZSBsb2NhbCBweXRob24zMTEtcGFja2FnaW5nIG9uIHRoZQo+ID4gYnVpbGQg
c3lzdGVtLCBidXQgd29ya3Mgb3RoZXJ3aXNlIHRvbyk6Cj4gPgo+ID4gICAgICAgJCBybSAtcmYg
YnVpbGQvaG9zdC1saWJnbGliMi0yLjgwLjAgJiYgcm0gLXJmIGJ1aWxkL2xpYmdsaWIyLTIuODAu
MCAmJiBzdHJhY2UgLWZvIG91dC5sb2cgbWFrZSBsaWJnbGliMgo+ID4KPiA+ICAgICAgICQgZ3Jl
cCBwYWNrYWdpbmcgYnVpbGQvbGliZ2xpYjItMi44MC4wL2J1aWxkL21lc29uLWxvZ3MvbWVzb24t
bG9nLnR4dAo+ID4gICAgICAgUHJvZ3JhbSBweXRob24zIChwYWNrYWdpbmcpIGZvdW5kOiBZRVMg
KDxteV9sb2NhbF9idWlsZF9wYXRoPi9ob3N0L2Jpbi9weXRob24zKSBtb2R1bGVzOiBwYWNrYWdp
bmcKPiA+Cj4gPiAgICAgICAkIGdyZXAgcGFja2FnaW5nIG91dC5sb2cKPiA+ICAgICAgIFsuLi5d
Cj4gPiAgICAgICAyMTkyOSBuZXdmc3RhdGF0KEFUX0ZEQ1dELCAiPG15X2xvY2FsX2J1aWxkX3Bh
dGg+L2hvc3QvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcy9wYWNrYWdpbmcvX19pbml0X18u
cHkiLCB7c3RfbW9kZT1TX0lGUkVHfDA2NDQsIHN0X3NpemU9NDk2LCAuLi59LCAwKSA9IDAKPiA+
ICAgICAgIDIxOTI5IG5ld2ZzdGF0YXQoQVRfRkRDV0QsICI8bXlfbG9jYWxfYnVpbGRfcGF0aD4v
aG9zdC9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL3BhY2thZ2luZy9fX2luaXRfXy5weSIs
IHtzdF9tb2RlPVNfSUZSRUd8MDY0NCwgc3Rfc2l6ZT00OTYsIC4uLn0sIDApID0gMAo+ID4gICAg
ICAgMjE5Mjkgb3BlbmF0KEFUX0ZEQ1dELCAiPG15X2xvY2FsX2J1aWxkX3BhdGg+L2hvc3QvbGli
L3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcy9wYWNrYWdpbmcvX19weWNhY2hlX18vX19pbml0X18u
Y3B5dGhvbi0zMTEucHljIiwgT19SRE9OTFl8T19DTE9FWEVDKSA9IDMKPgo+IEFuZCBob3N0LXB5
dGhvbi1wYWNrYWdpbmcgaXMgYWxyZWFkeSBhbiAoaW5kaXJlY3QpIGRlcGVuZGVuY3kgb2YKPiBo
b3N0LWxpYmdsaWIyL2xpYmdsaWIyIChtYWtlIGdyYXBoLWRlcGVuZHMpOgo+Cj4gICAgICAgICBs
aWJnbGliMiAtLT4gaG9zdC1saWJnbGliMiAtLT4gaG9zdC1tZXNvbiAtLT4gaG9zdC1weXRob24t
c2V0dXB0b29scyAtLT4KPiAgICAgICAgICAgICAgICAgaG9zdC1weXRob24td2hlZWwgLS0+IGhv
c3QtcHl0aG9uLXB5cGEtYnVpbGQgLS0+IGhvc3QtcHl0aG9uLXBhY2thZ2luZwoKWW91J3JlIHJp
Z2h0LiBFdmVyeXRoaW5nIGlzIHdvcmtpbmcuIEkgdGhpbmssIEkgY29uZnVzZWQgbXkgQlIgdGhy
b3VnaApleHBlcmltZW50aW5nIHNvIHRoYXQgdGhlIHB5dGhvbiBwYWNrYWdlIGRpZG4ndCBpbnN0
YWxsIGludG8KPG15X2xvY2FsX2J1aWxkX3BhdGg+L2hvc3QvbGliL3B5dGhvbjMuMTEvc2l0ZS1w
YWNrYWdlcy8gYnV0IGFmdGVyCnNvbWUgY2xlYW51cCBpdCBub3cgZG9lcy4KClNvcnJ5IGZvciB0
aGUgbm9pc2UgYW5kIHRoYW5rcyBmb3IgdGhlIHN0cmFjZSBoaW50LgoKWWVnb3IKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
