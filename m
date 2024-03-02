Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5D2C5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 22:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1924E40999;
	Sat,  2 Mar 2024 22:06:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vs2U_Ep15afE; Sat,  2 Mar 2024 22:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17B3D409A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17B3D409A8;
	Sat,  2 Mar 2024 22:06:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CE3A1BF57C
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15F5581EA1
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGia5f2GckCx for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 22:06:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C315E81E99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C315E81E99
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C315E81E99
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 22:06:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0266A13F86A;
 Sat,  2 Mar 2024 23:06:22 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Mar 2024 23:06:22 +0100
Date: Sat, 2 Mar 2024 23:06:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZeOi3lTtVr_s5Qqh@landeda>
References: <20240229224122.1085300-1-romain.naour@smile.fr>
 <20240229224122.1085300-3-romain.naour@smile.fr>
 <ZeOd3DPvi0lZy5pU@landeda>
 <a760fba9-8f33-4184-8640-fef49efe36a5@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a760fba9-8f33-4184-8640-fef49efe36a5@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709417185;
 bh=M5YGpPJaUT62JjdcKll+zAHtv+68Aoo7Lku0lp4wwHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gtsWPRnWdA2NUxSwD1VKWd23EZmN8Vx6O2W7yv6YWgwadC+mOm9oQXYOfkrEHZKTn
 7FGZBp24ZdbxBWjjfkMwb//EPXCL+EilFDbsAl/6wf42gi87TOtVkyB+RgKK8pRTaf
 gCB25QSaZtI7X3PYG5a7XNyX776S2Tz2kX8KqWiEhCt/pLIBwVsCI8sqYBv9RMjbd/
 adFDwxRJybAWNpi0s18iNpz+58X+5mAXmfVUKt+3vbbx4UnCR2jfe7HAnAedaWfLr4
 jKgOQC6E9dhFYMseUue5HsJ59EldxRzR36PgNgnGFb01Z0euhBUdfzSYLlGe3/yKYH
 f4KCLucOtxIug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gtsWPRnW
Subject: Re: [Buildroot] [PATCH v2 3/3] package/rust: provide RUSTFLAGS for
 cargo
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

Um9tYWluLCBBbGwsCgpPbiAyMDI0LTAzLTAyIDIyOjU0ICswMTAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDAyLzAzLzIwMjQgw6AgMjI6NDUsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiA+IE9uIDIwMjQtMDItMjkgMjM6NDEgKzAxMDAsIFJvbWFpbiBOYW91ciBzcGFrZSB0
aHVzbHk6Cj4gPj4gV2hpbGUgYnVpbGRpbmcgdGhlIHJ1c3QgdG9vbGNoYWluLCB0aGUgYnVpbGQg
c3lzdGVtIGVuZHVwIHVzaW5nCj4gPj4gY2FyZ28gKGZyb20gWy4uLl0vb3V0cHV0L2J1aWxkL2hv
c3QtcnVzdC1iaW4tMS43NC4xL2NhcmdvL2Jpbi9jYXJnbykKPiA+PiB0byBidWlsZCBzb21lIHRv
b2wgbGlrZSBydXN0ZG9jLXRvb2wuClstLVNOSVAtLV0KPiA+PiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9ydXN0L3J1c3QubWsgYi9wYWNrYWdlL3J1c3QvcnVzdC5tawo+ID4+IGluZGV4IDQ5MDMwNjAz
NjguLjM5NGZiZmE0Y2EgMTAwNjQ0Cj4gPj4gLS0tIGEvcGFja2FnZS9ydXN0L3J1c3QubWsKPiA+
PiArKysgYi9wYWNrYWdlL3J1c3QvcnVzdC5tawo+ID4+IEBAIC03MCw3ICs3MCw5IEBAIGRlZmlu
ZSBIT1NUX1JVU1RfQ09ORklHVVJFX0NNRFMKPiA+PiAgZW5kZWYKPiA+PiAgCj4gPj4gIGRlZmlu
ZSBIT1NUX1JVU1RfQlVJTERfQ01EUwo+ID4+IC0JY2QgJChARCk7ICQoSE9TVF9NQUtFX0VOVikg
JChIT1NUX0RJUikvYmluL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKSB4LnB5IGJ1aWxk
Cj4gPj4gKwljZCAkKEBEKTsgJChIT1NUX01BS0VfRU5WKSBcCj4gPj4gKwkJUlVTVEZMQUdTPSIk
KGFkZHByZWZpeCAtQyBsaW5rLWFyZ3M9LCQoSE9TVF9MREZMQUdTKSkiIFwKPiA+IFdoeSBkb24n
dCB3ZSBqc3V0IHBhc3MgJChIT1NUX1BLR19DQVJHT19FTlYpPyBUaGF0IG9uZSBhbHNvIGNvbnRh
aW5zCj4gPiBDQVJHT19IT01FPSQoRExfRElSKS9ici1jYXJnby1ob21lIHNvIEkgdGhpbmsgaXQg
bWlnaHQgbWFrZSBzZW5zZSB0bwo+ID4gcGFzcywgbm8/Cj4gSSBkaWRuJ3QgdmVyaWZ5IGlmIENB
UkdPX0hPTUUgaXMgcmVhbGx5IG1pc3NpbmcuIEFsc28gSE9TVF9QS0dfQ0FSR09fRU5WIGlzCj4g
ZGVmaW5lZCBieSB0aGUgY2FyZ28gcGFja2FnZSBpbmZyYSAocGtnLWNhcmdvLm1rKSB3aGlsZSBo
b3N0LXJ1c3QgaXMgYQo+IGhvc3QtZ2VuZXJpYyBwYWNrYWdlLgo+IAo+IE90aGVyd2lzZSwgSSdt
IGFncmVlLiBXZSBzaG91bGQgdXNlICQoSE9TVF9QS0dfQ0FSR09fRU5WKQoKT0ssIGdyZWF0LCB0
aGFua3MhIFdpbGwgeW91IHRlc3QgYW5kIHJlc3BpbiBhIG5ldyBpdGVyYXRpb24/CgpSZWdhcmRz
LApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4g
TU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBj
b25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAv
IENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAt
LS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5v
ICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJ
TCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
