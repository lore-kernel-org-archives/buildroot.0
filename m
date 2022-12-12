Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F86CC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 09:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE77440874;
	Mon, 12 Dec 2022 09:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE77440874
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZ5peSAZXGkM; Mon, 12 Dec 2022 09:53:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0FFE4086E;
	Mon, 12 Dec 2022 09:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0FFE4086E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E28F81BF2C0
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9B6160706
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9B6160706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QToYeHHkLLuT for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 09:53:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EA01605A4
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EA01605A4
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 09:53:11 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so11603517pjj.4
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 01:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EHI8HkHJaJkYcVBAwXcUjBb1H6V+fULJgKop6MpJgTk=;
 b=72JhNFZeQOHi+BH5k1JT/xHTOUvB7hZ1nGH9DdIKJWkN1itrnung4Ewqupc/OzGiNu
 uVa3Tp/In3mnClynaFBRW9Myl/d3uwF94Vp70hZMqHqzexhQUD7VspS6hriiD4rcNVwu
 NqvfYslsH1biRa3URv7GEEUodWJ4kiv/MDMpIEEVMsjkz0ep9o6s7NGsUliF+727Gr7m
 CaZdd0+PVioYEiHaRdZhN/E8qG+6P0ueYR9k9hLeSDHvvO0C7UKv8cVv4M8d/fMhPHxA
 CzSYCdtx2OIDbWqr1hmOa1zdwOOjT/YyuQMjUqlSl39qrOVZxuhZ7GzCd++Gss0kHJHI
 4gGA==
X-Gm-Message-State: ANoB5plrGO+gghU1npEb8dfqFIRaqpBMOMnmesJgEyqtB8d4TkGGsP57
 uadEWyOXykkv2EYh4scTxMf1CA4KpAbDZfxgPRA=
X-Google-Smtp-Source: AA0mqf4JHBdHvl/OgQH4+hNnvevZoMJPNktk6XNlrPvgmIaaLKWBctlZeS3i59gwI8gR4A09Ohh0HVVxQGcJLiGNdYo=
X-Received: by 2002:a17:90a:4894:b0:218:a96f:9eec with SMTP id
 b20-20020a17090a489400b00218a96f9eecmr92831775pjh.159.1670838790972; Mon, 12
 Dec 2022 01:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20221208133928.303101-1-heiko.thiery@gmail.com>
 <20221208133928.303101-3-heiko.thiery@gmail.com>
 <20221211144611.437eda70@windsurf>
 <CAA3JqEceuWkLuDjCviOdHmi12X96+KMfPb0s2Us8a5WgwKa-rw@mail.gmail.com>
 <20221212102949.5cb69b6c@windsurf>
In-Reply-To: <20221212102949.5cb69b6c@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 12 Dec 2022 10:52:58 +0100
Message-ID: <CAEyMn7YSey0TJE5eC+Rc1CFN+=NzOEDH2NQomfhe1cwtwM8jww@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHI8HkHJaJkYcVBAwXcUjBb1H6V+fULJgKop6MpJgTk=;
 b=NoXxHSpWsjcAlNAsqkMo712EDMgBzAAFG6rzulZ6Bm8rzxH6le9PLdfBtunAT9Q6ti
 xcgfBGVQuqJjY6CwExY+qsykZUl7UnXYVf9HhZoqxibyhNgxLEM/OK5aTyaI8UKYQz7/
 XHPmjkQukVjuF2/LxVcKN8Wpau+7LXcvEiuj3MMVi8u6vto11eBCGkjjEOxRwsmw6+9y
 TZzQPs0UNrUKfhtpy9e5NA+lNwIWUkHImUu8sI5iUb4Kfi9hGrFiXF0Cjcph3qE8d1NZ
 2v2vNF2wt/lnuBKHegtDFOmzz1G08gYWMT5gXzM2Af/RpkHiyjVHu2gmEi+HURfrOGdE
 Zrhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NoXxHSpW
Subject: Re: [Buildroot] [PATCH v2 3/3] package/modem-manager: bump version
 to 1.20.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLCBIaSBBbGVrc2FuZGVyLAoKQW0gTW8uLCAxMi4gRGV6LiAyMDIyIHVtIDEwOjI5
IFVociBzY2hyaWViIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5j
b20+Ogo+Cj4gT24gTW9uLCAxMiBEZWMgMjAyMiAxMDoxOTozMiArMDEwMAo+IEFsZWtzYW5kZXIg
TW9yZ2FkbyA8YWxla3NhbmRlckBhbGVrc2FuZGVyLmVzPiB3cm90ZToKPgo+ID4gVGhlIGJ1aWxk
LXRpbWUgZGVwZW5kZW5jeSBvbiBEQnVzIGlzIGV4Y2x1c2l2ZWx5IHRvIHJlYWQKPiA+ICJpbnRl
cmZhY2VzX2RpciIgYW5kICJzeXN0ZW1fYnVzX3NlcnZpY2VzX2RpciIgZnJvbSB0aGUgcGtnLWNv
bmZpZwo+ID4gKC91c3IvbGliL3BrZ2NvbmZpZy9kYnVzLTEucGMpIGZpbGUgaW5zdGFsbGVkLiBJ
IGFncmVlIHRoaXMgaXMgbm90Cj4gPiB2ZXJ5IHByZXR0eSwgYXMgd2UgZG9uwrR0IHJlYWxseSBy
ZXF1aXJlIGEgZnVsbCB3b3JraW5nIERCdXMsIGp1c3QgdGhlCj4gPiBwa2djb25maWcgZmlsZSA6
Lwo+Cj4gQUNLIQo+Cj4gPiBObywgdWRldmRpciBpcyByZXF1aXJlZCBldmVuIGlmIC1EdWRldj1m
YWxzZS4gVGhlIHJlYXNvbiBpcyB0aGF0Cj4gPiB1ZGV2ZGlyIGlzIHVzZWQgdG8gaW5zdGFsbCB0
aGUgdWRldiBydWxlcyBmaWxlcywgYW5kIE1vZGVtTWFuYWdlciBoYXMKPiA+IGEgYnVpbHQtaW4g
dWRldiBydWxlcyBwYXJzZXIgdXNlZCB3aGVuIHRoZSBkYWVtb24gaXMgYnVpbHQgd2l0aG91dAo+
ID4gdWRldiBzdXBwb3J0IChlLmcuIGRlZmF1bHQgaW4gb3BlbndydCkuIFRoZSB1ZGV2IHJ1bGVz
IHNwZWNpZnkgcG9ydAo+ID4gdHlwZSBoaW50cyBhbmQgb3RoZXIgdGhpbmdzLCBNTSB3b24ndCB3
b3JrIGZpbmUgd2l0aG91dCB0aG9zZSBydWxlcy4KPgo+IE9LLCB0aGFua3MgZm9yIHRoZSBpbmZv
cm1hdGlvbi4KPgo+IEhlaWtvOiB3aWxsIHlvdSBmb2xsb3ctdXAgd2l0aCBhbiB1cGRhdGVkIHBh
dGNoPwoKSSB3aWxsIHVwZGF0ZSB0aGUgcGF0Y2ggdG8gY3JlYXRlIHRoZSBydW50aW1lIGRlcGVu
ZGVuY3kgaW4KcGFja2FnZS9tb2RlbS1tYW5hZ2VyL0NvbmZpZy5pbi4KCi0tCkhlaWtvCgo+Cj4g
VGhhbmtzIQo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQg
Q0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQg
dHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
