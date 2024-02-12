Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C75C4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C17605A3;
	Mon, 12 Feb 2024 21:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8bvroP1txyZ; Mon, 12 Feb 2024 21:09:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14072605AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14072605AD;
	Mon, 12 Feb 2024 21:09:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 587841BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 428D040568
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TtrRX2_4Q5AI for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:09:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 40519404BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40519404BC
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40519404BC
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:09:34 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-42c78ba62aaso6150571cf.2
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 13:09:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707772173; x=1708376973;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vptc7y6KuU6hgxB0g/1w7WRyCsSKHbG5XwOOOl2XCXg=;
 b=oqFysMiv4tnSQUZTQB9d9FXmPiXeWXe2T1gR1UIUR7f3oRIFgwC8/eEQvehMCkEDu9
 K7BfnV3TEuHFDmBPdQ5XW/VPa35b28ajQol5xgoHssMSeQlh864QnrUFsTIxP9TCFvqg
 eR8Y63gKsxA4T1S4XiBN+ikrp6rHvoclVldRb9ISyi4tsK0YXaCo0+zj8hTRTC9PSZpf
 2MYRg6QDbNBj/1QRfnMKj+7BDgMND0lJadoeX1CvocgP5oMikd60ajBbynHp1s9tzhOg
 xUSdy495AYOAXxU2Wpb758MNEACWZWMx0mSyiosnrLASk0qFA+nlnc0C5kPCsYyUkRwm
 NDgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd1GSzFj+il1/6dO1J9Bde9sIRRAumXceasDrZ/TwCET4F6BJnOY4h0vyFsLPdcOe3cquwwPjAcTGiCNRxLBGhDuTDTXX9gA==
X-Gm-Message-State: AOJu0Yzdm+eXvp4sUmVoXw0qrJNByAUnrF6g8JldJiPokG2lBsZJpSfB
 gOPsrenvCU9JgrHkR+vC/E+Xz0AmwCcoiyaM+928avoVxET8O2uyHG798iv+m8+3k2YzezAnQIr
 jFf2/Eg2bbdNgNBzDtoFlVpwkCIE=
X-Google-Smtp-Source: AGHT+IFoUL0oLr2I3xTwuj07Fa3rBPVJwbx5xs+WJpdEa4fz4hX0RudlOZiiYlw0SsG/u7/YarzrfPaX4T3A4VNCjR8=
X-Received: by 2002:ac8:1387:0:b0:42c:66af:e1d0 with SMTP id
 h7-20020ac81387000000b0042c66afe1d0mr6669861qtj.33.1707772173020; Mon, 12 Feb
 2024 13:09:33 -0800 (PST)
MIME-Version: 1.0
References: <20240209175631.1337370-1-james.hilliard1@gmail.com>
 <Zck6_sR8fspWF37e@landeda>
 <CADvTj4ppD06TSGnYUUBSzB_sV6vErb2ozyMuGr1QjyLtu_pvPA@mail.gmail.com>
 <ZclC3_dSvLTp6Ras@landeda> <18bea399-dc8e-424b-b087-3823d0bd4545@bubu1.eu>
 <CADvTj4pdnvNK3go=5t6PWhU8ax0gNpqwD3kpOUn9RCJV8b2NkA@mail.gmail.com>
 <ae0932bd-dd5c-4082-a34d-af0eea110b20@mind.be>
In-Reply-To: <ae0932bd-dd5c-4082-a34d-af0eea110b20@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Feb 2024 14:09:20 -0700
Message-ID: <CADvTj4r3sY7qO4XJcPOdq3WieX_3zp7KEheVVkxNjuj64m6vSA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707772173; x=1708376973; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vptc7y6KuU6hgxB0g/1w7WRyCsSKHbG5XwOOOl2XCXg=;
 b=Jujnd/h6rEI6TKfFR1HGrdX52TDnnMgJH4XOAEaGiBoBmYSIFu3WIRElUk/uyTzyE+
 W6eQQMKVnUNnwMWe83Ec8Ab1rAW4mhFY2yWlsfJW+KnhhbaGpfjgNttUDehhs0BEqp3b
 PD+JQ6SMMbYkBPYmWawXKaA11CaNH8u/CXyLad0RAlTzCpAQT1EL6WmZBVKh7KfrcDl1
 zqkaOwjEDdnH6sL0Ig3xDPAo2DUhzw7EqBdorfgSAK+19Duec3ptA6G37qkwz+Yi9Jtu
 UUuEoZyInmOLqqMu1mXpEdxHBV8FOt2YFD3eyZ6InkGMPrpgnjDq6FwIgmfaDPMMufbv
 Bz2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Jujnd/h6
Subject: Re: [Buildroot] [PATCH 1/2] package/python-uvloop: add support for
 cython3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBGZWIgMTIsIDIwMjQgYXQgMTI6NTDigK9QTSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8
YXJub3V0QG1pbmQuYmU+IHdyb3RlOgo+Cj4KPgo+IE9uIDEyLzAyLzIwMjQgMDE6NTEsIEphbWVz
IEhpbGxpYXJkIHdyb3RlOgo+ID4gT24gU3VuLCBGZWIgMTEsIDIwMjQgYXQgNToxM+KAr1BNIE1h
cmN1cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1YnUxLmV1PiB3cm90ZToKPiBbc25pcF0+PiBJbiBz
aG9ydDogaWYgd2UgY29udGludWUgdG8gdXNlIHRoZSBzZGlzdHMgZnJvbSBweXBpLCBjeXRob24g
aXMgbm90IGEKPiA+PiByZWFsIGJ1aWxkIGRlcGVuZGVuY3kgYW5kIHdlIGNhbiBqdXN0IHJlbW92
ZSBpdCBmcm9tIHB5cHRvamVjdC50b21sCj4gPj4gaW5zdGVhZCBvZiB0cnlpbmcgdG8gcHJvdmlk
ZSB0aGUgY29ycmVjdCB2ZXJzaW9uIHRoYXQncyBuZXZlciBnb2luZyB0bwo+ID4+IGJlIGludm9r
ZWQuCj4gPgo+ID4gV2UgY2FuIHByb2JhYmx5IGp1c3QgcGFzcyAtLXNraXAtZGVwZW5kZW5jeS1j
aGVjayBhcyBhIGJ1aWxkIGFyZyBvcgo+ID4gc29tZXRoaW5nIGxpa2UgdGhhdCBJIHN1cHBvc2Uu
Cj4KPiAgIFRoYXQgc2tpcHMgX2FsbF8gZGVwZW5kZW5jeSBjaGVja3MsIGFuZCB3ZSB1c3VhbGx5
IHdhbnQgdG8gY2hlY2sgZGVwZW5kZW5jaWVzLgo+IFVubGVzcyB0aGUgZGVwZW5kZW5jeSBjaGVj
ayB3aWxsIHJlcXVpcmUgaG9zdCBwYWNrYWdlcyBmb3IgcnVudGltZSBkZXBlbmRlbmNpZXM/Cj4g
QnV0IGlmIHRoYXQgd2VyZSB0aGUgY2FzZSB3ZSdkIGFscmVhZHkgaGF2ZSBhIGxvdCBvZiB1c2Vs
ZXNzIGhvc3QtcHl0aG9uLWZvbwo+IHBhY2thZ2VzIEkgZXhwZWN0Li4uCgpZZWFoLCBzbyBydW50
aW1lIGRlcGVuZGVuY2llcyBhcmUgYmFzaWNhbGx5IG5vdCBjaGVja2VkIGF0IGFsbCBzaW5jZSB3
ZSBkb24ndApnZW5lcmFsbHkgaGF2ZSBidWlsZHJvb3QgdGFyZ2V0IHB5dGhvbiBwYWNrYWdlcyB3
aGljaCBkZXBlbmQgb24gb3RoZXIgYnVpbGRyb290CnRhcmdldCBweXRob24gcGFja2FnZXMsIHRo
ZXkgbWVyZWx5IHNlbGVjdCB0aGVpciBkZXBlbmRlbmNpZXMgd2hpY2ggYWxsb3dzIGZvcgp0aGVp
ciBkZXBlbmRlbmNpZXMgdG8gYmUgYnVpbHQgcGFyYWxsZWwgYnV0IHByZXZlbnRzIGFueSBzb3J0
IG9mIHRhcmdldCBwYWNrYWdlCmRlcGVuZGVuY3kgdmFsaWRhdGlvbi4KCkkgdGhpbmsgdGhhdCAt
LXNraXAtZGVwZW5kZW5jeS1jaGVjayBmbGFnIGp1c3QgZGlzYWJsZXMgcGVwNTE3IGJ1aWxkIGRl
cGVuZGVuY3kKY2hlY2tzIHdoaWNoIHdvdWxkIGJlIHRob3NlIGhvc3QtcHl0aG9uLWZvbyBidWls
ZCBkZXBlbmRlbmNpZXMgdGhhdCBzb21lIGhhdmUuCgo+Cj4gICBSZWdhcmRzLAo+ICAgQXJub3V0
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
