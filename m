Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95761CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45C27809E7;
	Mon,  2 Sep 2024 20:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZfquWpmPAVf; Mon,  2 Sep 2024 20:04:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 429F980A4C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 429F980A4C;
	Mon,  2 Sep 2024 20:04:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DBF31BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38B0C80A4C
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3enpsEnwMJk for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:04:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7732809E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7732809E7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7732809E7
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 20:04:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 732C913F86E;
 Mon,  2 Sep 2024 22:04:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 22:04:47 +0200
Date: Mon, 2 Sep 2024 22:04:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <ZtYaX6SSyGWOx6ez@landeda>
References: <20240829131232.2132854-2-thomas@devoogdt.com>
 <20240901121122.3113482-1-thomas@devoogdt.com>
 <ZtXcn-Jkl40CoZ5k@landeda>
 <CACXRmJgZSHFDjdsR8hVF1jE+SU=Ske20F2RLts5zLHjzBY8QVw@mail.gmail.com>
 <ZtXnPqjYvzyMJfix@landeda> <20240902223733.GB1449890@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240902223733.GB1449890@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725307490;
 bh=v6hQ5mFvQe2Sq7wc8FqrQR+73bMqTMTqm90+zJQoU0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PSeEjwiviGCWa4DblgVSWj1q5b3rDTeGsNNNwtIGv6ccllWP0jr3v00rFoJhCHJHl
 wBsejl8WcSfBxW5qo5Dg/RM3j9mC6IGq6uoffEWBwwFYspfLHdr0LOAJRDShbmupjB
 4WNfPk0kPWaqURysx0EHQeU+qMg4pKmXubmHVUmZl2gf9Ov+LTDOg3mNkJmLicU2LC
 JIi97p8RsY7DsVlkAUkPzQUE2Zlvi5eYcdsavdUmjt4UMvRg1FSCeupiKQXl/0NqDz
 z+Gmok+kP02Y8aw0C7JxVIoouXq5MLWXDxbclTy0TNQw3CPxyQX+M15Ap4sfyEyI+d
 pn+S6tLjnpKpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PSeEjwiv
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: restore libsoup
 support
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRyacOhbiwgQWxsLAoKT24gMjAyNC0wOS0wMiAyMjozNyArMDMwMCwgQWRyaWFuIFBlcmV6IGRl
IENhc3RybyBzcGFrZSB0aHVzbHk6Cj4gT24gTW9uLCAwMiBTZXAgMjAyNCAxODoyNjozOCArMDIw
MCAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+IE9u
IDIwMjQtMDktMDIgMTg6MDYgKzAyMDAsIFRob21hcyBEZXZvb2dkdCBzcGFrZSB0aHVzbHk6Cj4g
PiA+IExpYnNvdXAyIGlzIHN0aWxsIHN1cHBvcnRlZCBieSB3ZWJraXRndGssIHNvIGhhdmluZyBz
dXBwb3J0IG1ha2VzIHNlbnNlLiBCdXQKPiA+ID4gZ2l2ZW4gdGhlIGZhY3QgdGhhdCBubyBjb21w
bGFpbiBhcm9zZSBzaW5jZSB0aGUgYnVtcCB0byBsaWJzb3VwMywgSSBkb3VidCB0aGUKPiA+ID4g
dXNhZ2Ugb2YgaXQuIFNvIGlmIHNvbWVvbmUgcmVhbGx5IG5lZWQgaXQsIHRoZW4gdGhhdCBwZXJz
b24gY2FuIHJlcGx5IG9uIHRoaXMKPiA+ID4gcGF0Y2ggYXMgd2VsbCBJIGd1ZXNzLgo+ID4gQWdy
ZWVkLiBJJ2xsIGxldCB0aGUgcGF0Y2ggcGVuZGluZyBmb3IgYSB3aGlsZSwgYW5kIGlmIG5vb25l
IGNvbXBsYWlucywKPiA+IHdlJ2xsIGRyb3AgaXQgaW4gYSBmZXcgZGF5cy4KPiBXaXRoIG15IFdl
YktpdCBkZXZlbG9wZXIgaGF0IG9uLCBJIHdvdWxkIGFsc28gcmVjb21tZW5kIGtlZXBpbmcgb25s
eSBvbmUKPiBvcHRpb24sIGFuZCB1c2UgbGlic291cDMgPSkKCkFDSwoKPiBOb3csIHRoaW5raW5n
IGFzIGEgQnVpbGRyb290IHVzZXIsIGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSAqc29tZSoKPiBi
cm93c2VyIHRoYXQgdXNlcyBXZWJLaXRHVEssIGlmIG9ubHkgZm9yIHRlc3RpbmcgdGhpbmdzIGJl
Zm9yZSBzb21lYm9keQo+IHdvdWxkIGdvIG9uIGFuZCBkZXZlbG9wIHRoZWlyIG93biB0aGluZyBv
biB0b3Agb2YgV2ViS2l0R1RLLiBIb3cgYWJvdXQKPiBhZGRpbmcgYW4gb3B0aW9uIHRvIHBhc3Mg
RU5BQkxFX01JTklCUk9XU0VSPU9OIHRvIENNYWtlIGluIHdlYmtpdGd0ay5taz8KPiBUaGF0IHdv
dWxkIGluc3RhbGwgL3Vzci9saWJleGVjL3dlYmtpdGd0ay02LjAvTWluaUJyb3dzZXIsIGFuZCBh
Cj4gcG9zdC1pbnN0YWxsIGhvb2sgY291bGQgYWRkIGEgc3ltbGluayB0byBpdCB1bmRlciAvdXNy
L2Jpbi4gV0RZVD8KClllcywgcGxlYXNlIQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAou
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJl
ZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIg
Mzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAg
ICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMt
YS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5
LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
