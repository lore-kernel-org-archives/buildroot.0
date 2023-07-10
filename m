Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B12DC0015E
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 20:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E89C740B91;
	Mon, 10 Jul 2023 20:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E89C740B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P2Rvfnwg9yZ4; Mon, 10 Jul 2023 20:18:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11CFD40A65;
	Mon, 10 Jul 2023 20:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11CFD40A65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 451411BF399
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DD8540256
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD8540256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uaY-NaJud0NF for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 20:18:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE29F40104
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE29F40104
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 20:18:08 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1b049163c93so2977048fac.3
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 13:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689020287; x=1691612287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rEYburIDErKBiM1EhnnT7ZcMsuVpP8pMH+0LRKpjhzg=;
 b=mCoOC5z8WUO7Ts6W4TlbAJIw5W8EledfnoAYmGwQDhepOs+5FFwoGsjeO5kij8WtxP
 GuHPktBVxD+V7OyVtAdbirj6J/lPeHvtHf8GGB+aL2sQ97VZUFQ9h++Yl82jSbI7w5zb
 AamCjPz1UnuNVEWEEOajxQ7tywE0KRh7/edElvGSNg4Ngr/GhJlFf9eFkBGM92u2bN6J
 wqwz8iQzE6Kkuk1I27M+NowsMZueFnsHigYSUEpuCKKmpuDAKnpkKAMytOmqyVcOtRe9
 BdmePPgA4a+T4hnJ/QYi2TO4xStrEoUPPZl9tgmom69DrgziUKvtgFWw9QKoO2yMO5tX
 sedA==
X-Gm-Message-State: ABy/qLasiurIO3hXYoDIAG4CihLNPn1U/c6UD1y9wfL1QY379H3a7+mI
 /WJk29CHEdfsRqxXWmNwT+i+U5S/JGZIPjh+GTFBCX37j60=
X-Google-Smtp-Source: APBJJlGLTfRk/WRCSVqqhAKDBpAfWieXcwnYk8g2GerxlniMJB60urnNtimaxuijgbJ0BZrErjuSrM7YpFWo7MakQHc=
X-Received: by 2002:a05:6870:b506:b0:1ad:4a74:9d63 with SMTP id
 v6-20020a056870b50600b001ad4a749d63mr11621226oap.53.1689020287396; Mon, 10
 Jul 2023 13:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230626080016.2182278-1-james.hilliard1@gmail.com>
 <20230710200350.5c72bcab@windsurf>
In-Reply-To: <20230710200350.5c72bcab@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Jul 2023 14:17:55 -0600
Message-ID: <CADvTj4qQ1m9ehmGs6pPMmPUQumeKewq-n3c7rY20PHnT=2TETA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689020287; x=1691612287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rEYburIDErKBiM1EhnnT7ZcMsuVpP8pMH+0LRKpjhzg=;
 b=fq6FhXmnsmuY0BMJ52nh+C1kAZnqhGHAaB7DNQpm11qPdxE1lH3i8+57Ir5p58Y65n
 Dh71clzfWwQSvTs05y736I0xmivtPl0QSfERFvctZRKtgOrxajhjtKlI87dIvji7p9yV
 kq2GIc6Z74fQdkNyzDb+2c1NDArR3z6vO8/p24eAJ7hIW8HGaf1A1MveQuyhvXAReoN6
 eCV4KuZyrOXuKYiMAjBcLYShZjvxB/fKlqDO1/7AnxozEgktH84P+hE/agaxhhcJ/uzr
 bHuLcsGVRtKc4Plb64MzdmeF2rkqyYd1eThbfnKaxVP2LZovTgFLRrTOmxrwuRZ93iE4
 BPXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fq6FhXmn
Subject: Re: [Buildroot] [PATCH 1/1] package/python-msgpack: add host cython
 dependency
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgMTI6MDPigK9QTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgMjYgSnVuIDIwMjMg
MDI6MDA6MTYgLTA2MDAKPiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiA+IFdlIG5lZWQgaG9zdC1weXRob24tY3l0aG9uIGZvciBweXRob24tbXNn
cGFjayB0byBidWlsZCBjb3JyZWN0bHkuCj4gPiBUaGlzIGlzIGEgaGFyZCBlcnJvciB3aGVuIHVz
aW5nIGEgcGVwNTE3IGZyb250ZW5kLgo+ID4KPiA+IEZpeGVzOgo+ID4gKiBHZXR0aW5nIGJ1aWxk
IGRlcGVuZGVuY2llcyBmb3Igd2hlZWwuLi4KPiA+IHJ1bm5pbmcgZWdnX2luZm8KPiA+IHdyaXRp
bmcgbXNncGFjay5lZ2ctaW5mby9QS0ctSU5GTwo+ID4gd3JpdGluZyBkZXBlbmRlbmN5X2xpbmtz
IHRvIG1zZ3BhY2suZWdnLWluZm8vZGVwZW5kZW5jeV9saW5rcy50eHQKPiA+IHdyaXRpbmcgdG9w
LWxldmVsIG5hbWVzIHRvIG1zZ3BhY2suZWdnLWluZm8vdG9wX2xldmVsLnR4dAo+ID4gcmVhZGlu
ZyBtYW5pZmVzdCBmaWxlICdtc2dwYWNrLmVnZy1pbmZvL1NPVVJDRVMudHh0Jwo+ID4gcmVhZGlu
ZyBtYW5pZmVzdCB0ZW1wbGF0ZSAnTUFOSUZFU1QuaW4nCj4gPiB3YXJuaW5nOiBubyBmaWxlcyBm
b3VuZCBtYXRjaGluZyAnKi5jJyB1bmRlciBkaXJlY3RvcnkgJ21zZ3BhY2snCj4gPiBhZGRpbmcg
bGljZW5zZSBmaWxlICdDT1BZSU5HJwo+ID4gd3JpdGluZyBtYW5pZmVzdCBmaWxlICdtc2dwYWNr
LmVnZy1pbmZvL1NPVVJDRVMudHh0Jwo+ID4KPiA+IEVSUk9SIE1pc3NpbmcgZGVwZW5kZW5jaWVz
Ogo+ID4gICAgICAgQ3l0aG9ufj0wLjI5LjMwCj4KPiBDb3VsZCB5b3UgY2xhcmlmeSBpZiB0aGlz
IGlzIGEgY3VycmVudCBpc3N1ZSBpbiB0aGUgcHl0aG9uLW1zZ3BhY2sKPiBwYWNrYWdlIHRoYXQg
Y2F1c2VzIGJ1aWxkIGZhaWx1cmVzLCBvciBpZiB0aGlzIGlzIGluIHByZXBhcmF0aW9uIHRvCj4g
bW92ZSBmcm9tIHNldHVwdG9vbHMgdG8gcGVwNTE3IHRvIGJ1aWxkIHB5dGhvbi1tc2dwYWNrPwoK
SXQncyBhIGhhcmQgZXJyb3Igd2hlbiBtb3Zpbmcgc2V0dXB0b29scyB0byBwZXA1MTcgYnV0IHNo
b3VsZCBiZSBhcHBsaWVkCnJlZ2FyZGxlc3MgYXMgaXQncyBuZWVkZWQgZm9yIG9wdGltaXplZCBl
eHRlbnNpb25zIHRvIGJ1aWxkIHByb3Blcmx5IEFGQUlVCmV2ZW4gd2hlbiB1c2luZyBsZWdhY3kg
c2V0dXAucHkgYnVpbGRzLgoKPgo+IElmIHlvdSB3YW50IHVzIHRvIG1lcmdlIHlvdXIgcGF0Y2hl
cyBmYXN0ZXIsIHBsZWFzZSBoZWxwIHVzOiBleHBsYWluIGluCj4gdGhlIGNvbW1pdCBsb2cgdGhl
ICJXSFkiIHlvdSBhcmUgZG9pbmcgdGhlIGNoYW5nZS4gWW91ciBjb21taXQgbG9nCj4gZmFpbHMg
dG8gZXhwbGFpbiBpdCwgYW5kIHRoZXJlZm9yZSBJIGRvbid0IGhhdmUgdGhlIGNvbnRleHQgdG8K
PiB1bmRlcnN0YW5kIHRoZSBtb3RpdmF0aW9uIG9mIHRoZSBjaGFuZ2UuCgpJIGRpZCBtZW50aW9u
IGluIHRoZSBjb21taXQgbG9nIHRoYXQgdGhpcyBmaXhlcyBhbiBlcnJvciB3aGljaCBvY2N1cnMg
d2hlbgp1c2luZyBhIHBlcDUxNyBmcm9udGVuZCwgd2hpY2ggaXMgd2hhdCB0aGUgcGF0Y2ggZG9p
bmcgdGhlIHNldHVwdG9vbHMKcGVwNTE3IG1pZ3JhdGlvbiBjaGFuZ2VzLCBJJ20gbm90IHN1cmUg
d2hhdCBjb250ZXh0IGlzIG1pc3NpbmcgaGVyZS4KCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzA2MjYxODE1MzEuMjMxMjAwMi01LWphbWVz
LmhpbGxpYXJkMUBnbWFpbC5jb20vCgpXZSBhbHJlYWR5IHVzZSBhIHBlcDUxNyBmcm9udGVuZCBm
b3Igb3RoZXIgcGFja2FnZXMoaS5lLiBwYWNrYWdlcyB1c2luZyBmbGl0CmluZnJhc3RydWN0dXJl
KSBzbyBJIHdhcyBhc3N1bWluZyBmYW1pbGlhcml0eSB3aXRoIHBlcDUxNyBidWlsZApmcm9udGVu
ZHMvYmFja2VuZHMKaGVyZS4gVGhlIHBlcDUxNyBkb2N1bWVudGF0aW9uIGhhcyBhZGRpdGlvbmFs
IGJhY2tncm91bmQgb24gaG93IHRoaXMgYWxsIHdvcmtzLgoKaHR0cHM6Ly9wZXBzLnB5dGhvbi5v
cmcvcGVwLTA1MTcvCgpUaGlzIHNob3VsZCBiZSBtZXJnZWQgYmVmb3JlIHRoZSBwZXA1MTcgbWln
cmF0aW9uLCBJIGhhZCBvbmx5IGRpc2NvdmVyZWQKdGhpcyBpc3N1ZSBhZnRlciBzbyBJIGhhZCBz
ZW50IGl0IGFzIGEgZm9sbG93IHVwIGluc3RlYWQgb2Ygd2l0aGluIHRoZQppbml0aWFsIHBlcDUx
NwpzZXR1cHRvb2xzIG1pZ3JhdGlvbiBzZXJpZXMuCgo+Cj4gVGhhbmtzIQo+Cj4gVGhvbWFzCj4g
LS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jv
b3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
