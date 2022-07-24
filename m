Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB00CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 08:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44FEC60FE6;
	Sun, 24 Jul 2022 08:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44FEC60FE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ji7Vo2lMDev2; Sun, 24 Jul 2022 08:39:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F30760F23;
	Sun, 24 Jul 2022 08:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F30760F23
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F10E1BF312
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB95A60F23
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB95A60F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ovaUmDcMaKk for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 08:39:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECAE560E90
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECAE560E90
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 08:39:02 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id u9so10102896oiv.12
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 01:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jlOaBv1s/A0Il1+tTypPjZ0XMgaNDQFzuQstnoKbV7g=;
 b=5ArDhOo6yzS5ADyB6KiOyDRS4ZzxDBlcnvBQCAWiCh3jN0KxcaNR71EmhKj8TehgEe
 fwZ4wwYfU97TLqFY8/sLrHmT9SeMXzDBdafjLqWud+PYY3kRcURH6cPi4g7RJpc2rS6a
 e2F6wdPx7uKpgW+WgN8pBw8mpYwBVtpC962X4o6cRsG63a07ZvcPLQh6Q2+RkdjTloRI
 5v3jub1YDilYgbBA+vk8tBTnkS/czxx5E97czPOUiNB5DSZx0NuwiLYb5tsyq3cwZ1kL
 XHUE27JfOfs64Yn8n4VdUgcmXxItI6+j3+59YfZpMmpEBkO31/50vgMVE3pnvY01oyag
 t/0Q==
X-Gm-Message-State: AJIora+nvqOk80YaQTYaPtXoDchHbmTea6NdLyw8M05pR15vydkva3pi
 QWwfItdK515NYPEB/GWPisBSZ/rW/Z/cce0mZ1Hi3Ug3VFyLQA==
X-Google-Smtp-Source: AGRyM1to6f9dvSNxKNdNk+CsNfVUB9E0BqnzsVE5g0/Gci9+Llc72wihDW+E6UvONAgk5/f0w7s7/K6ROxv4Dwc/OEA=
X-Received: by 2002:a54:488d:0:b0:33a:87b3:31a with SMTP id
 r13-20020a54488d000000b0033a87b3031amr10625337oic.153.1658651941595; Sun, 24
 Jul 2022 01:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220724073726.A0A3B854E7@busybox.osuosl.org>
 <94a2d730-3d96-6a3b-77bb-0b2ffc2eabb6@smile.fr>
In-Reply-To: <94a2d730-3d96-6a3b-77bb-0b2ffc2eabb6@smile.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 24 Jul 2022 02:38:50 -0600
Message-ID: <CADvTj4rwgF=gpjp2zEpPwTKb37cQ4Q54W1PdrO2Ej7GnAr3Xmg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jlOaBv1s/A0Il1+tTypPjZ0XMgaNDQFzuQstnoKbV7g=;
 b=iuodeT8X7H2gmP0ftR8XDW24Qa+rUwm37NwAjqSE9KvJ7nkRVmNfzekzHPGph5DhOj
 e5by01y3kCjnqHG7p6QG+04ijt2kdVGOE1H4/GJIYV5HlX18fIQE+DOsHSyZZkHqM3FZ
 jRpRrRr68+Baw3iDuu1OcVzX7+3uMFr9Yo1K8T4HU69zWiPPvA7d2xVTg1SGOpervjFj
 qREDfSMAipE5hiAQVMWi0Nl9+vgnAM3+/I6Y50+A7oPXKQofK7idMHY4aGRQvo68ylcv
 q7x+PzshgLfYd0L2Uj88zEC7Bauq3gF9Zbm/bWCsm3Qcn7xXbB+TkZnYa4qQ3udpEK3Y
 ZUXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iuodeT8X
Subject: Re: [Buildroot] [git commit] package/python-maturin: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBKdWwgMjQsIDIwMjIgYXQgMjozMiBBTSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBzbWlsZS5mcj4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IExlIDI0LzA3LzIwMjIgw6AgMDk6NTAs
IFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdCA6Cj4gPiBjb21taXQ6IGh0
dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9MmQ5OTFjOTJmNWJl
NmE5YTg1OGM4Njg5ZWEyZDkyNzM2NWU5YzY2NAo+ID4gYnJhbmNoOiBodHRwczovL2dpdC5idWls
ZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyCj4gPgo+ID4g
VGhpcyBpcyBwZXA1MTcgcHlvMyBidWlsZCBiYWNrZW5kIHRoYXQncyBhbiBhbHRlcm5hdGl2ZSB0
bwo+ID4gcHl0aG9uLXNldHVwdG9vbHMtcnVzdC4KPiA+Cj4gPiBOb3RlIHRoYXQgbWF0dXJpbiBp
dHNlbGYgdXNlcyBweXRob24tc2V0dXB0b29scy1ydXN0IGZvcgo+ID4gYm9vdHN0cmFwcGluZy4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4KPiA+IFRlc3RlZC1ieTogR3JhZW1lIFNtZWNoZXIgPGdzbWVjaGVyQHRocmVlc3Bl
ZWRsb2dpYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4KPiAuLi4KPgo+ID4gKysrIGIvcGFja2Fn
ZS9weXRob24tbWF0dXJpbi9weXRob24tbWF0dXJpbi5tawo+ID4gQEAgLTAsMCArMSwyNSBAQAo+
ID4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiArIwo+ID4gKyMgcHl0aG9uLW1hdHVyaW4K
PiA+ICsjCj4gPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ICsKPiA+ICtQWVRIT05fTUFU
VVJJTl9WRVJTSU9OID0gMC4xMi4yMAo+ID4gK1BZVEhPTl9NQVRVUklOX1NPVVJDRSA9IG1hdHVy
aW4tJChQWVRIT05fTUFUVVJJTl9WRVJTSU9OKS50YXIuZ3oKPiA+ICtQWVRIT05fTUFUVVJJTl9T
SVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzM5L2JhL2ZlYzU5
ODk1NjM5MzIzMDM0MWRlZjQyMzY3YzZhZDBlZmJlZTZkZGM4OTlmODg1OGU1YjI1YTdmMzdhNQo+
ID4gK1BZVEhPTl9NQVRVUklOX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4gPiArUFlUSE9OX01B
VFVSSU5fTElDRU5TRSA9IEFwYWNoZS0yLjAgb3IgTUlUCj4gPiArUFlUSE9OX01BVFVSSU5fTElD
RU5TRV9GSUxFUyA9IGxpY2Vuc2UtYXBhY2hlIGxpY2Vuc2UtbWl0Cj4gPiArSE9TVF9QWVRIT05f
TUFUVVJJTl9ERVBFTkRFTkNJRVMgPSBcCj4gPiArICAgICBob3N0LXB5dGhvbi1zZXR1cHRvb2xz
LXJ1c3QgXAo+ID4gKyAgICAgaG9zdC1weXRob24tdG9tbGkgXAo+ID4gKyAgICAgaG9zdC1ydXN0
Ywo+ID4gK0hPU1RfUFlUSE9OX01BVFVSSU5fRU5WID0gXAo+ID4gKyAgICAgJChIT1NUX1BLR19D
QVJHT19FTlYpIFwKPiA+ICsgICAgIFBZTzNfQ1JPU1NfTElCX0RJUj0iJChIT1NUX0RJUikvdXNy
L2xpYi9weXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikiCj4KPiBTaG91bGQgYmUgJChIT1NU
X0RJUikvbGliIGhlcmUuCgpZZWFoLCB0aGF0IGdvdCBjb3B5IHBhc3RlZCBmcm9tIHB5dGhvbi1j
cnlwdG9ncmFwaHksIGZpeGVkIGJvdGggaGVyZToKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDcyNDA4Mzc0OC4xNTAzMjM4LTEtamFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbS8KCj4KPiBTZWUKPiBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvYmMxNmFkZmUzZDcxNDMxMDVlODQwMDcyZWRiMTY5
ZTRjYjczNTRjYy4xNjU4MDA3MDAwLmdpdC55YW5uLm1vcmluLjE5OThAZnJlZS5mci8KPgo+IEJl
c3QgcmVnYXJkcywKPiBSb21haW4KPgo+Cj4gPiArIyBXZSBuZWVkIHRvIHZlbmRvciB0aGUgQ2Fy
Z28gY3JhdGVzIGF0IGRvd25sb2FkIHRpbWUKPiA+ICtQWVRIT05fTUFUVVJJTl9ET1dOTE9BRF9Q
T1NUX1BST0NFU1MgPSBjYXJnbwo+ID4gK1BZVEhPTl9NQVRVUklOX0RPV05MT0FEX0RFUEVOREVO
Q0lFUyA9IGhvc3QtcnVzdGMKPiA+ICtIT1NUX1BZVEhPTl9NQVRVUklOX0RMX0VOViA9ICQoSE9T
VF9QS0dfQ0FSR09fRU5WKQo+ID4gKwo+ID4gKyQoZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2thZ2Up
KQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
