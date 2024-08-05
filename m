Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC27C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 22:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E2F84019E;
	Mon,  5 Aug 2024 22:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5IkyP38gwXC; Mon,  5 Aug 2024 22:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECB5340257
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECB5340257;
	Mon,  5 Aug 2024 22:01:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 468361BF2EB
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 22:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40383402C3
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 22:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqL7tfdP13Y6 for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 22:01:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EBDBA40022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBDBA40022
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBDBA40022
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 22:01:21 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5d5d077c60aso64535eaf.1
 for <buildroot@buildroot.org>; Mon, 05 Aug 2024 15:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722895281; x=1723500081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h5Ys8cTl7S5z4paSRX6+Q6U1vYqoOn3DXYq8XD8TBSg=;
 b=p0gmFxHBtxARqBPs1KsITN56yJBWFIQEeXJu2FK1pD+0sla5H5QYvVCdVu7b4hwlGx
 SsNXLE/Mu+4n5mWJKMjrhMHz1vW9UmytmzagBdX8UNXD6BV5ajrQxyRP854ro+y9mTSz
 NvfXf05zTKGNB/gvB1aqC8lTDbiNbtWRmLB0KiA/D4u7u1hn8TYUGn8yfKP/WObUEkAy
 AqvBjTabJft55vh7bNrUXisobltcyCAyaX6RsH5vSSq8i1Et8P82p6bhfO5bAYWVlVwW
 FZdjl8p9xelPadVE8gFk3uHLcJ9UEOPX0XvLnf0r9O89NgYkzSDrrChhINFg+8+8rhB7
 cjHw==
X-Gm-Message-State: AOJu0YySNQWm6KqfffWtzRnBWcw6BmHMbY4YG0U+4Yp0bY8vIUxdBfCy
 A/7eFSb49jqsAWLpCG35Po6hE8TB0pdJfkfUHOWPQ4urNF1uM3OQU9zZgj9xBfRXykqblXwRTjR
 LQYUfd8I4iZNaxJ/1/0ybgZrrxO8=
X-Google-Smtp-Source: AGHT+IGhGxzyxj0JaSgvXSx6CNR8NPoweuDZSK+Xdm9nFjcgbXa+wWUum2lVlDc1t9vLVwVPhGHJKYb906m84aEc6HY=
X-Received: by 2002:a05:6358:52c8:b0:1ac:ed54:224d with SMTP id
 e5c5f4694b2df-1af3ba5e021mr1486223455d.11.1722895280623; Mon, 05 Aug 2024
 15:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
In-Reply-To: <20240805223152.09ed915b@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Aug 2024 16:01:09 -0600
Message-ID: <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722895281; x=1723500081; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5Ys8cTl7S5z4paSRX6+Q6U1vYqoOn3DXYq8XD8TBSg=;
 b=nMWAcFkGcJRw4cfmPyxgXu+JHEWbSL6h6XAQ9yJSKmC6VUHFqOT6KPU1slwmyfPPVx
 VkrExYw3TGKUYsSP34QAv5LJB/CX7Dd9zYFZAKKH7vdka+PZx0kxnsy2WJvYkpPJd8st
 4rSHBWKmRyE7t5gEhTQxetkrId8DnCPA1XYYcWodQMb3OLpeeRD1OPDKhCxZu8g2rn6F
 CgUlvRlkmcihb4Afz0GeItt/4okP7SyTfvtoxwOhgOjvebsfwgqsJtaCo42fD2z/gVGu
 lNZ3WRWCypXqqcUQ0BhfH22M/KYvP66KGbTuvvZ55z195DKwop1gtwnh2jMkLJE9pdSf
 C5bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nMWAcFkG
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBBdWcgNSwgMjAyNCBhdCAyOjMx4oCvUE0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBDaHJpc3RpYW4sCj4KPiBP
biBNb24sIDUgQXVnIDIwMjQgMTA6MzQ6NDQgLTA3MDAKPiBDaHJpc3RpYW4gU3Rld2FydCB2aWEg
YnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiA+IEkgc3RpbGwg
aGlnaGx5IGRpc2FncmVlIHdpdGggc2V0dGluZyBHT1BST1hZIHBlciBwYWNrYWdlLgo+ID4KPiA+
IEkgaGF2ZSBiZWVuIHdvcmtpbmcgd2l0aCB0aGUgdGFpbHNjYWxlIGRldnMgdG8gZml4IHRoZSBk
ZXBlbmRlbmN5IGlzc3Vlcy4KPiA+IFdlIGZpeGVkIG1vc3Qgb2YgaXQuCj4gPgo+ID4gQWRkaXRp
b25hbGx5IEknbSB3YWl0aW5nIGZvciB0aGUgYW5jaG9yZS9xdWlsbCBkZXZlbG9wZXJzIHRvIGdl
dCBiYWNrIHRvIG1lCj4gPiBhYm91dCByZW1vdmluZyBzb21lIEdpdCBMRlMgZmlsZXMgZnJvbSB0
aGVpciBtb2R1bGUgdGhhdCBhbHNvIGJyZWFrIEdPUFJPWFkuCj4gPgo+ID4gVGhlIGRlY2lzaW9u
IHRvIHVzZSB0aGUgcHJveHkgb3Igbm90IChydW4gYnkgR29vZ2xlKSBzaG91bGQgYmUgdXAgdG8g
dGhlCj4gPiB1c2VyLiBJZiBJIHdhbnQgdG8gZG93bmxvYWQgZXZlcnl0aGluZyBmcm9tIEdpdCwg
dGhhdCBzaG91bGQgYmUgZnVsbHkKPiA+IHBvc3NpYmxlLiAoQW5kIHVzdWFsbHkgaXMgd2l0aCBH
T1BST1hZIGRpcmVjdCkKClNvIHRoaXMgYWxsb3dzIHBhY2thZ2VzIHRvIGNob29zZSB0aGUgR09Q
Uk9YWSBzZXR0aW5ncywgcHJldmlvdXNseQp0aGF0IHdhcyBub3QgcG9zc2libGUgYXMgaXQgd2Fz
IGhhcmQtY29kZWQgYXMgZGlyZWN0LgoKSSBkb24ndCByZWFsbHkgc2VlIG11Y2ggd3Jvbmcgd2l0
aCBzaW1wbHkgc2V0dGluZyBjb21wYXRpYmxlIEdPUFJPWFkKc2V0dGluZ3MgYXMgcmVxdWlyZWQg
Zm9yIGEgc3BlY2lmaWMgcGFja2FnZS4gSXQncyBub3QgcmVhbGx5IG11Y2ggZGlmZmVyZW50CmZy
b20gc2V0dGluZyB0aGUgZG93bmxvYWQgbG9jYXRpb25zIGluIGdlbmVyYWwgZm9yIHBhY2thZ2Vz
IElNTy4KCj4gPgo+ID4gSSdsbCBmb2xsb3cgdXAgd2l0aCB0aG9zZSBHaXRIdWIgaXNzdWVzIHRv
ZGF5IGFuZCBzZWUgaWYgSSBjYW4gZ2V0IHRoZSBiYWxsCj4gPiByb2xsaW5nIG9uIGFub3RoZXIg
dGFpbHNjYWxlIHJlbGVhc2Ugd2l0aCBmaXhlZCBkZXBlbmRlbmNpZXMuCj4KPiBUaGFua3MgYSBs
b3QgZm9yIHlvdXIgZmVlZGJhY2suIFdoZW4gc2VlaW5nIHRoZSBuZXcgaXRlcmF0aW9uIGZyb20K
PiBKYW1lcywgbXkgaW5pdGlhbCByZWFjdGlvbiB3YXMgIkkgbmVlZCB0aGUgZmVlZGJhY2sgZnJv
bSBDaHJpc3RpYW4gb24KPiB0aGlzIiwgYW5kIHlvdSBoYWQgYWxyZWFkeSBnaXZlbiB5b3VyIGZl
ZWRiYWNrLgo+Cj4gVGhhdCBiZWluZyBzYWlkOiBzaG91bGQgd2Ugc3RpbGwgaGF2ZSBhIHdheSB0
byBwYXRjaC9maXggdGhvc2Uga2luZCBvZgo+IGlzc3VlcyBvbiBvdXIgc2lkZSwgdW50aWwgdXBz
dHJlYW0gZml4ZXMgaXQ/IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdAo+IHRoaXMgY291bGQgYmUg
Zml4ZWQgb24gb3VyIHNpZGUgaWYgd2Ugd2VyZSBhYmxlIHRvIGFwcGx5IGEgcGF0Y2ggYmVmb3Jl
Cj4gdGhlIEdvIHZlbmRvcmluZyBoYXBwZW5zLiBJcyB0aGF0IGNvcnJlY3Q/CgpXZWxsIEkgdGhp
bmsgc2luY2UgdXBzdHJlYW1zIG9mdGVuIGV4cGVjdCB0aGUgZ29vZ2xlIGdvcHJveHkgdGhlbiBp
dCdzCmVhc2llc3QgdG8ganVzdCBoYXZlIHVzIHNldCB0aGF0IHdoZW4gcmVxdWlyZWQgcmF0aGVy
IHRoYW4gdHJ5IGFuZCBwYXRjaApwcmlvciB0byB2ZW5kb3JpbmcuCgo+Cj4gVGhvbWFzCj4gLS0K
PiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3Rs
aW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
