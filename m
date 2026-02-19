Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9E8E9A057
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03D316114D;
	Thu, 19 Feb 2026 17:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZUyIVYxC1BE; Thu, 19 Feb 2026 17:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25FB3611D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771522006;
	bh=ShsBap1PusZfsj+dGKRbZzt3lYnkV/r0Q2HF9HOUt/I=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OP0k1VVEa+wW5CgoqrPpi++mHXduzPhKx/I3gjx5bEgdLjvnqfUwgSHVi1mCwlOC7
	 AXq55pgTdboo4b83za5Or4urVy9EmEJSx5ReCXt2Gpl3deFY4f+oop1epC3eQiDlvl
	 z7KOOrKe7F6tStAibpm3cNvyUb/hUrOdj44lS09t4SjO96JasKL7dgEtPgAznkqd7y
	 6unp1SLUCGSPRR197XFX+7yceBVU7mLVNIH2H7aKxVbCNqzRryglDpyxL+7igDe82Y
	 zxWjrzoBF6xhIxD1Yqzm4vnL3+MgZwuTjzuWZ4+Ikrm2uzXprq+gyiQ0Vp7fGEhPGy
	 BL2POqXP0EwyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25FB3611D9;
	Thu, 19 Feb 2026 17:26:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3C541CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D570B83B66
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2FfkpbzxwAW for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E54F38392C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E54F38392C
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E54F38392C
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:38 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-5fa3f2b8f7dso607184137.0
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771521997; cv=none;
 d=google.com; s=arc-20240605;
 b=EyaFWgcgKyzKAO/gpS/3u0Mg08QgKjvRUNE7yddXHUUZBgiyzrUApnH4q8Km8aD078
 IqbyWuxh4PhtwY40GPnlk6ims5ypFZvesyJXPfgZnqu4jmMFwwtG7gvt/8zIPJxPPOXL
 OClW6mNZydB2zvHReqbsvpsIp9SFZ/zcyAJE73UJjRLR34lIzjWYkqPkIFASg3dQMwfx
 LwtI4IsGSmaGDJZx1KQeE/qQ1UcTNa4x39Bxf9OLxtcGMvA69RYiYf4sz7fy47MNaQcO
 Picua/PoPdMOhfZHcrfgM+R9S66vE9R22r9559ie06zl60spi0Tw9qsixaQDYQQi4P1u
 8G2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Wr/seFeMHqalIfRgmKmfirJ6RAg/JEwqSCzG7NZKrt0=;
 fh=4tcP2eczKWviaKidhOB0tpEuIp5ax5tYzdFzN9+YJBw=;
 b=hm2HDY4LlCcglIgKpFLHrcbyV2V/RBWiY/ED7q6l2P5Z1H+CTP59yaz/X3BbdjTlqR
 DcCKzINZNgWJn2iv8Ey7WInaZeHgfOPENH4i5+uWYCp+ueoYPyyg+xGM7umL9GZn87ub
 JwB/mb+AionI0jJDgvPiE0h1rReObeeLyVEL7CfPWjrlcuABDGClutJpnWWE36MKvLwt
 +mmvzSsPxrIsm4+75rzWxJiacyvVrXhFGK9xxLtY76Mibd9xNjZKmfjTNrz0FBA+gFcV
 bsY5GXwxmT5dTHkbfaG2o2+5U3dxAQvmLefBYFV9gg1dP8Zd/fzqcBCaqnWyJlBw1Cie
 woZQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521997; x=1772126797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wr/seFeMHqalIfRgmKmfirJ6RAg/JEwqSCzG7NZKrt0=;
 b=hctHsZ5eFwzM+XSy/965ZvupLbnIryF9Of1hlYoyR9YUBooVFCfyLekrfiFjTT/a73
 9mM7kpEb6zT/iQahto4xyA3HAi0IriVQzdKMenq/PCgbjDv1ZvkBjAgf543UGW/Tnq/M
 2YxJiVCdcdqzVSg3bLlLqkCOUFCcr3tI2nXZ9ap0yZ8QqfQTOVxwWwtz8T5ynyifrzCf
 dpt2d6K2USmT6NBmL/eZxpbZH34dkCWIye0GaS+r1r4OFZFtV5zH/fjjHdP7lxHsgaz/
 HTAKps+p2bfmVJkNTaDaG1VuxGr3MJ8fXKPog4E6pl/lV/q35XjukzEDIhmRTt0eppi8
 bs4w==
X-Gm-Message-State: AOJu0Yxa2uVHIFk2J6kwToPdCeR36T3C/8nCnzMd8UZFRONb6JPqI/YS
 p01Z7Yqh6WIcOqCUaUOfIm++JUp+cWFhTTEHingXoynWjV4HyPtQVZ4c5IO1dFaLPugBD4pOn0N
 F/nj+dqzaBED/LF9mk31U44oLLPkKTnI=
X-Gm-Gg: AZuq6aLYDrvs8a8TptltALpXrQwH2p05dIsuwAP6tW8YsijMgTD4fZzRBf4JrlWDQgr
 0TKCy6Vy6Ihq0OQTawwQj8QxkJUkrvuC6o3KqaUe6/ALTRwiDFHM8huExiWDJK2GH7btvW3sNey
 cBm2K64DlzWuQCii0ipNGDlkx8ZDXKb8WzxIM4s7c3u7AkXCALYNEoj/u4bfE70Zc9ojl+HesVh
 p4hwUBsgZoYHNjqLbghKV5OPzIpsSNeDMm2xDZbSaMcr0IKdx2CJX72IKpCUG8DcEPKJrBa0w/s
 LqWXmJb8DihkPo0VJLAoYDue9Y/KYjm6e6LMoYpYw52mlb31Rai5wRTFR2yfO+gEXgg=
X-Received: by 2002:a05:6102:390e:b0:5f5:3244:20c with SMTP id
 ada2fe7eead31-5fe90ab9ffamr1399000137.4.1771521997607; Thu, 19 Feb 2026
 09:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20250909161325.59760-1-bernd@kuhls.net>
 <CADvTj4pYf0uymrkZUuWgahWK=pm5CgTJL5U+gwbwKExK1so5jA@mail.gmail.com>
In-Reply-To: <CADvTj4pYf0uymrkZUuWgahWK=pm5CgTJL5U+gwbwKExK1so5jA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Feb 2026 10:26:25 -0700
X-Gm-Features: AaiRm51efQyoJFm1seW5ntZ542MKSQsOCPNMMmwM6-1FXjPD44KKMXdO_lY6RQk
Message-ID: <CADvTj4p=xuJQ=3wRnWuKw9eBxTTD2Pntj+5aCyqeQfnBDsdqsQ@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>, Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771521997; x=1772126797; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wr/seFeMHqalIfRgmKmfirJ6RAg/JEwqSCzG7NZKrt0=;
 b=JeU9W4bB/GsYtSIGfDZ+7SZ02If5uLG3t0/jeK3N73qXS0htqTtep3ReeDmkQqqy63
 haDEI5AnOn2ikKaOY77mZ/LiNlRKj5XXo86QoypKODu7Fpk5RIfMzKmIh9XHmlvEGk1d
 I3ap3JxOcq/dKpeLEBy7EVSHf8RpGkjyPYUZEgB5z1P+p8B08xCQHPIdfTtYZp5Bb82C
 KUXEGWHHvf1An0lbF1Roveto6QnILihuFg0wu1OeRXVlRdaCENU9+DbgLsPYP5w9fiT0
 e6FBLUB9bt15CIloawX+u4QYGqBtTEhEStGS1lmq8T0Z+H7WTfhwlwOGhkdFZFiNkhvk
 MNZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JeU9W4bB
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.2.2
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

T24gVGh1LCBTZXAgMTgsIDIwMjUgYXQgOToxN+KAr1BNIEphbWVzIEhpbGxpYXJkCjxqYW1lcy5o
aWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgU2VwIDksIDIwMjUgYXQgMTA6
MjLigK9BTSBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PiB3cm90ZToKPiA+Cj4gPiBSZWJh
c2VkIHBhdGNoIDAwMDEuCj4gPgo+ID4gUmVtb3ZlZCBHYWxsaXVtIHhhIHN0YXRlIHRyYWNrZXI6
Cj4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vY29tbWl0LzNi
ZTJjNDdkYjIzMThlYmU5MjIyYzgwYmY5ODEwMzhkZjQzNzRiMmQKPiA+Cj4gPiBMZWdhY3kgaGFu
ZGxpbmcgZm9yIGJsaW5kIG9wdGlvbiBCUjJfUEFDS0FHRV9NRVNBM0RfTkVFRFNfWEEgaXMgbm90
Cj4gPiBuZWNlc3NhcnkuCj4gPgo+ID4gUmVsZWFzZSBub3RlczoKPiA+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNS1BdWd1c3QvMDAwODE1
Lmh0bWwKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5u
b3VuY2UvMjAyNS1BdWd1c3QvMDAwODE4Lmh0bWwKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNS1TZXB0ZW1iZXIvMDAwODIwLmh0bWwK
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+ID4g
LS0tCj4gPiAgcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNhM2QtaGVhZGVycy5tayAgICAgICAg
ICAgICAgIHwgIDIgKy0KPiA+ICAuLi4tbWVzb24tb3B0aW9uLXRvLWRpc2FibGUtb3B0aW9uYWwt
bmVvbi1zdXBwb3IucGF0Y2ggfCAgNiArKystLS0KPiA+ICBwYWNrYWdlL21lc2EzZC9Db25maWcu
aW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOSAtLS0tLS0tLS0KPiA+ICBwYWNr
YWdlL21lc2EzZC9tZXNhM2QuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiAr
KystLS0KPiA+ICBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxMCArKy0tLS0tLS0tCj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDI0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2Ez
ZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rIGIvcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNh
M2QtaGVhZGVycy5tawo+ID4gaW5kZXggNWNkMDVjYzlmZi4uNTkzMmQ3M2YyYyAxMDA2NDQKPiA+
IC0tLSBhL3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsKPiA+ICsrKyBi
L3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsKPiA+IEBAIC0xMiw3ICsx
Miw3IEBAIGVuZGlmCj4gPgo+ID4gICMgTm90IHBvc3NpYmxlIHRvIGRpcmVjdGx5IHJlZmVyIHRv
IG1lc2EzZCB2YXJpYWJsZXMsIGJlY2F1c2Ugb2YKPiA+ICAjIGZpcnN0L3NlY29uZCBleHBhbnNp
b24gdHJpY2tlcnkuLi4KPiA+IC1NRVNBM0RfSEVBREVSU19WRVJTSU9OID0gMjUuMS44Cj4gPiAr
TUVTQTNEX0hFQURFUlNfVkVSU0lPTiA9IDI1LjIuMgo+Cj4gSXQgbG9va3MgbGlrZSB0aGlzIGlu
dHJvZHVjZWQgYSByZWdyZXNzaW9uIGZvciBjb2codGhpcyBwYXRjaCB3YXMgZmxhZ2dlZAo+IHdo
ZW4gSSBiaXNlY3RlZCB0aGlzIGNvZyBjcmFzaCk6Cj4gU2VwIDE3IDIxOjM0OjExIGJ1aWxkcm9v
dCBjb2dbMTAzNzhdOiBSZW5kZXJlciBwcm9jZXNzIHRlcm1pbmF0ZWQgYW5kCj4gZmFpbGVkIHRv
IHJlY292ZXIgd2l0aGluIDEwMDBtcwo+IFNlcCAxNyAyMTozNDoxMSBidWlsZHJvb3QgY29nWzEw
Mzc4XTogPD4gQ3Jhc2ghOiBUaGUgcmVuZGVyZXIgcHJvY2Vzcwo+IGNyYXNoZWQuIFJlbG9hZGlu
ZyB0aGUgcGFnZSBtYXkgZml4IGludGVybWl0dGVudCBmYWlsdXJlcy4KPiBTZXAgMTcgMjE6MzQ6
MTEgYnVpbGRyb290IGNvZ1sxMTU1OF06IGxpYkVHTCB3YXJuaW5nOiBmYWlsZWQgdG8gZ2V0Cj4g
ZHJpdmVyIG5hbWUgZm9yIGZkIC0xCj4gU2VwIDE3IDIxOjM0OjExIGJ1aWxkcm9vdCBjb2dbMTE1
NThdOiBsaWJFR0wgd2FybmluZzogTUVTQS1MT0FERVI6Cj4gZmFpbGVkIHRvIHJldHJpZXZlIGRl
dmljZSBpbmZvcm1hdGlvbgo+IFNlcCAxNyAyMTozNDoxMSBidWlsZHJvb3QgY29nWzExNTU4XTog
bGliRUdMIHdhcm5pbmc6IGZhaWxlZCB0byBnZXQKPiBkcml2ZXIgbmFtZSBmb3IgZmQgLTEKPiBT
ZXAgMTcgMjE6MzQ6MTEgYnVpbGRyb290IGNvZ1sxMTU1OF06IGxpYkVHTCB3YXJuaW5nOiBlZ2w6
IGZhaWxlZCB0bwo+IGNyZWF0ZSBkcmkyIHNjcmVlbgo+IFNlcCAxNyAyMTozNDoxMSBidWlsZHJv
b3QgY29nWzExNTU4XTogbGliRUdMIHdhcm5pbmc6IGVnbDogZmFpbGVkIHRvCj4gY3JlYXRlIGRy
aTIgc2NyZWVuCj4gU2VwIDE3IDIxOjM0OjExIGJ1aWxkcm9vdCBjb2dbMTE1NThdOiBDb3VsZCBu
b3QgY3JlYXRlIFdQRSBFR0wKPiBkaXNwbGF5OiBFR0xfTk9UX0lOSVRJQUxJWkVELiBBYm9ydGlu
Zy4uLgoKVGhpcyBzaG91bGQgZml4IHRoZSBjcmFzaDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjYwMjE4MDYzMTIzLjU0NjA2Ny0xLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDIxODA2MzEyMy41NDYwNjctMi1qYW1lcy5o
aWxsaWFyZDFAZ21haWwuY29tLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
