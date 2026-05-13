Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DDDCD37AC
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 21:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F47B812CA;
	Wed, 13 May 2026 21:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ws7lvy4YxFCM; Wed, 13 May 2026 21:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B873B811FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778707730;
	bh=dM5I5ogtil5zH366gC2sVEbWvBurit2p4US8j1aAg90=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NExoCob6Cau9NAskP0vDZfgJvozKvdbhTSsYPd6XzcRbRd5ZuZo7esT7NIn+NRX0d
	 rAklnAx6ZL7bHlB8dKuv8X6inZDQ6U40Aavqh7uh2i+vB/NaYmf8YVckjc2WsDR4mr
	 cy4nYkyqaRaCYNj4dKlZOOSnZ9lC0xfcYcZX3aH3nKIL3EYuSXtQASJrahnJDnNP9o
	 PweChATpoouEQeZelXQQrdLLdZsOjXmZbnYqEeTOQj6zNLo5OshVOOYmH29EC74WxT
	 XVVhKRlmoFBrfi9sQtgw336ex3tt/kMkaa0pJKPUzakjnn8Kt4MvA/sZIoYxPaFAQC
	 zSc13M9VxRqEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B873B811FC;
	Wed, 13 May 2026 21:28:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 425CB223
 for <buildroot@buildroot.org>; Wed, 13 May 2026 21:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3261E40A6B
 for <buildroot@buildroot.org>; Wed, 13 May 2026 21:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFy-YCke1gU2 for <buildroot@buildroot.org>;
 Wed, 13 May 2026 21:28:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2B73040A66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B73040A66
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B73040A66
 for <buildroot@buildroot.org>; Wed, 13 May 2026 21:28:48 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-42c08cbae4cso5759531fac.2
 for <buildroot@buildroot.org>; Wed, 13 May 2026 14:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778707727; cv=none;
 d=google.com; s=arc-20240605;
 b=VLH+xUECOT8d5miDFm9ct9WGWk+6z+EqjH3KP8khEj1xuLvtJfLRxXBiVVHKS1bgFu
 gGjeKA0qdnMmXnCxdwkcqru0pVLqm9wBuVZCfyd8AVDHCVWkG5fqmEJCR6AxFx3GUZm1
 /KodM8rbpdOnYn2pntqafXkntiyLx//Pd0lo6RPUtSosz/2s/fZn3qvVVDOk4pFtqA8R
 GYKIuiBKXkdyhpYDZSSGpfzvh4oQxbA9zXGw6sr2Zm2bNrdluXBKVB3I++oZ6N+/SGJO
 o85/zwWfFNiGrOs3jIyTzFNJaxj92MRxTLTnE+YtIwaIBubbdFHcXXzXYBpi2MRh5txH
 zL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wFRuwR/rjlP6w2DrjLlu+gRrdNMUPgDtZmcqfU78ND4=;
 fh=vqI4HZAeDLA61/B+Lw/9MOP6+wMkwdbrtiLhDiBqY2w=;
 b=dOofAa3jAX6MfX3hc52z6HwM7h8Bg5jjkuB4/RZFvTg4YmLfUfOphnknGBoIm+WAQY
 LSipegg8DY9u4ce22M2iGVT1hkZlcBpOVZqukWo+qaU5w0hUQ4LI/vexyPTKDpaBkz87
 Ckb62VKko7vFIvNWMdEF17Mo5C/l5BPrGwICiqPQFZ+rwaizKQyOCsmg9GfMKOjGiv+B
 CiXeFLHM8TWnDbaYLIpeakZ75DCzaOeOUpd9CbvKT2jPT5UB+RCV+/mp/HDmvJU9MZFy
 A0A/B3OlKdtFymv8l4pVTSeDU6rAIvTwSczrXrU17FOpmXSZqWFYShLjB/qmYBbKWsyb
 ynPQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778707727; x=1779312527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wFRuwR/rjlP6w2DrjLlu+gRrdNMUPgDtZmcqfU78ND4=;
 b=LSH+zNZ5MIuQUp7iA2oNw0YgquQ6F2n2oD3IiB569MQm/tSyQBd3a3QbXCxMKH2kk3
 DBHsuk2xYkxToNZ1acQrLJ59gYDySrDqyWjLut37ollIm1AX1eszEqOhzSuLm2qoQxt+
 gSjKxpST727vGXzIo5/6Q5TmKcmGBcXSmAhwIgPh5mSVkRHf3sU/lT95mUXbNS8TuuJy
 UG6feboQnlq8w9aEbdCdLCB2isYHESvN451KFqrvf8wgVLBB/nPdVecsCQR+XWA0NNpy
 unsUsDOe6BF3OJEaOvrIbvEadVi/CRTMgoTix5Pd+IdXoMFSelg8VaBtZF+3+8RGxQbg
 C4ZQ==
X-Gm-Message-State: AOJu0Yz8Lcxg9hxVQDnOQvbWT+JWEdZ1pn+07Er0ggN8oNumyYifL3aw
 JTUFEAT81Rq8YKTdxfJw1c6LdootZ3BBJ7dUBxQusDFNVLCt1lxS98Kb6Va1i5Xeev9xzeVvQlD
 UiWMMFmEgkFLBRd6vs4kgN1UJWIU2iNg=
X-Gm-Gg: Acq92OGhc+Fcpydc15FfWBbPnUhfqx83hghBB7uLPBV6hxPWw50A3qfu96OvhX2D9ap
 ZDY98ScP3D93AHYM8YFaI3Qcda54ej69N1vuPDWctSoc+MoqpXnyESSVp+uZxezzcJGBbBRZoV5
 g2UV3ZJNaOpdGaauJkPin4dTFHQlj+SEvcyTaippVZiwdKIllmowaFhz2QygcECPZIpyIcuxgY6
 JU+BIEZaPBV6uAXLnEigxh9kDWpyG9MKpoy/Rg2Z+YZv8FYeQcYNuBQDmm7AKlGp3ngXxSHdVA0
 0xoUN1VW+aOnFL8=
X-Received: by 2002:a05:6820:2d04:b0:69b:3683:92c3 with SMTP id
 006d021491bc7-69b7aa38603mr2561148eaf.23.1778707727011; Wed, 13 May 2026
 14:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
 <20260512-virglrenderer-v5-1-1806e588eb59@gmail.com>
 <90f566b2-c146-4f37-b5b2-838bccce48ef@smile.fr>
 <CAMWSM7jt8FLNmkHmee8iVGkKzj5k4XjzsufvjV9EnAgzyjLRsA@mail.gmail.com>
 <5141fcf4-70e4-4f2a-bc3b-7e16367bdf65@smile.fr>
In-Reply-To: <5141fcf4-70e4-4f2a-bc3b-7e16367bdf65@smile.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 13 May 2026 14:28:09 -0700
X-Gm-Features: AVHnY4LcM5QWvjsERCISWR2udofuzCsex0SU-XRr7tq__vhXU4tf3fnTBZcvbY8
Message-ID: <CAMWSM7iWgwKxvnxW4uj5PNMvULH=bXGirK_=jB58gshLpWbRBA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778707727; x=1779312527; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wFRuwR/rjlP6w2DrjLlu+gRrdNMUPgDtZmcqfU78ND4=;
 b=kf6tZCOe1lfof3hS9GUSPnM4OyDhpj3mS//g29dkfUCG1z1CpTWtdjo5DCSq32iIQF
 BOgpNGx7CApMULycsGyyONwcFydSUe6bU66BGC3uonPfNRC24OnpiA+H4pqS73vul1P9
 P+Jm9OkvpHypqB9CuNm+AIQDYMLBWSxBnxK5DQqEMpTPdvGIqDeGvuDF9aVDG/+HdswF
 qm+J6h+MfQoGw3ICItcEGf7fAPw35EupAS7xscdtGXpjne4LXaITIhOs8NdgkF5n3fDM
 8DjdSGeV/ib21K1CT4Pv1CyOurPFd4GiclgnbC1LprXF3F1PjLcKVWM+i8vuHNyPqZHM
 r6oA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=kf6tZCOe
Subject: Re: [Buildroot] [PATCH RESEND v5 1/5] package/libepoxy: remove
 gl/egl dependency
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMjoxM+KAr1BNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQHNtaWxlLmZyPiB3cm90ZToKPgo+IEhlbGxvIEpvc2VwaCwKPgo+IExlIDEzLzA1LzIwMjYg
w6AgMjA6MzUsIEpvc2VwaCBLb2d1dCBhIMOpY3JpdCA6Cj4gPiBIZWxsbyBSb21haW4sCj4gPgo+
ID4gT24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgODozNeKAr0FNIFJvbWFpbiBOYW91ciA8cm9tYWlu
Lm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPiA+Pgo+ID4+IEhlbGxvIEpvc2VwaCwgQWxsLAo+ID4+
Cj4gPj4gTGUgMTIvMDUvMjAyNiDDoCAyMTozNiwgSm9zZXBoIEtvZ3V0IGEgw6ljcml0IDoKPiA+
Pj4gTGliZXBveHkgaXMgYSBsaWJyYXJ5IGZvciBoYW5kbGluZyBPcGVuR0wgZnVuY3Rpb24gcG9p
bnRlciBtYW5hZ2VtZW50Lgo+ID4+Pgo+ID4+PiBJdCBoYXMgYmFja2VuZHMgZm9yIGVnbC9nbHgs
IHdoaWNoIG1heSBhdCBvbmUgcG9pbnQgaGF2ZSBiZWVuIG1hbmRhdG9yeQo+ID4+PiB0byBlbmFi
bGUsIGJ1dCB0aGUgbGlicmFyeSBub3cgYnVpbGRzIHdpdGggbm9uZSBvZiB0aGUgYWJvdmUgZW5h
YmxlZAo+ID4+PiBmZWF0dXJlcywgYXMgc2VlbiBiZWxvdy4KPiA+Pj4KPiA+Pj4gICBsaWJlcG94
eSAxLjUuMTAKPiA+Pj4KPiA+Pj4gICAgIFVzZXIgZGVmaW5lZCBvcHRpb25zCj4gPj4+ICAgICAg
IENyb3NzIGZpbGVzICAgICAgICAgICAgOiAvaG9tZS9qb3NlcGgvYnItdGVzdC1wa2cvYXJtLWFh
cmNoNjQvYnVpbGQvbGliZXBveHktMS41LjEwLy9idWlsZHJvb3QtYnVpbGQvY3Jvc3MtY29tcGls
YXRpb24uY29uZgo+ID4+PiAgICAgICBiX3BpZSAgICAgICAgICAgICAgICAgIDogZmFsc2UKPiA+
Pj4gICAgICAgYl9zdGF0aWNwaWMgICAgICAgICAgICA6IHRydWUKPiA+Pj4gICAgICAgYnVpbGR0
eXBlICAgICAgICAgICAgICA6IHJlbGVhc2UKPiA+Pj4gICAgICAgYnVpbGQuY21ha2VfcHJlZml4
X3BhdGg6IC9ob21lL2pvc2VwaC9ici10ZXN0LXBrZy9hcm0tYWFyY2g2NC9ob3N0L2xpYi9jbWFr
ZQo+ID4+PiAgICAgICBkZWZhdWx0X2xpYnJhcnkgICAgICAgIDogc2hhcmVkCj4gPj4+ICAgICAg
IGRvY3MgICAgICAgICAgICAgICAgICAgOiBmYWxzZQo+ID4+PiAgICAgICBlZ2wgICAgICAgICAg
ICAgICAgICAgIDogbm8KPiA+Pj4gICAgICAgZ2x4ICAgICAgICAgICAgICAgICAgICA6IG5vCj4g
Pj4+ICAgICAgIGxpYmRpciAgICAgICAgICAgICAgICAgOiBsaWIKPiA+Pj4gICAgICAgYnVpbGQu
cGtnX2NvbmZpZ19wYXRoICA6IC9ob21lL2pvc2VwaC9ici10ZXN0LXBrZy9hcm0tYWFyY2g2NC9o
b3N0L2xpYi9wa2djb25maWcKPiA+Pj4gICAgICAgcHJlZml4ICAgICAgICAgICAgICAgICA6IC91
c3IKPiA+Pj4gICAgICAgc3RyaXAgICAgICAgICAgICAgICAgICA6IGZhbHNlCj4gPj4+ICAgICAg
IHRlc3RzICAgICAgICAgICAgICAgICAgOiBmYWxzZQo+ID4+PiAgICAgICB4MTEgICAgICAgICAg
ICAgICAgICAgIDogZmFsc2UKPiA+Pj4KPiA+Pj4gUmVtb3ZpbmcgdGhlc2UgZGVwZW5kZW5jaWVz
IGFsbG93cyBmb3Igc29tZSBhcHBsaWNhdGlvbnMgdGhhdCByZXF1aXJlIGl0Cj4gPj4+IGFzIGEg
YnVpbGQgZGVwZW5kZW5jeSwgYnV0IG90aGVyd2lzZSBjYW4gcnVuIGhlYWRsZXNzIG9yIHdpdGhv
dXQgR0wsIHRvCj4gPj4+IGJ1aWxkIGFuZCBmdW5jdGlvbi4KPiA+Pgo+ID4+IEknbSBub3Qgc3Vy
ZSBhYm91dCB0aGlzIGNoYW5nZS4gSGF2aW5nIGVnbCBvciBnbHggYmFja2VuZCBzdGlsbCBzZWVt
cyBoaWdobHkKPiA+PiByZWNvbW1lbmRlZC4gT2sgaXQgYnVpbGRzIGJ1dCB3aHkgdXNpbmcgbGli
ZXBveHkgaW4gdGhpcyBjYXNlIChoZWFkbGVzcyk/Cj4gPgo+ID4gSXQgc2VlbXMgYSBjbGVhbiB3
YXkgZm9yIGFwcGxpY2F0aW9ucyB0byBzdXBwb3J0IHZhcmlvdXMgR0wKPiA+IGNvbmZpZ3VyYXRp
b25zIChHTC9HTFgsIEdML0VHTCwgR0xFUy9FR0wpIGF0IHJ1bnRpbWUuIEkgc3VwcG9zZSAibm9u
ZQo+ID4gb2YgdGhlIGFib3ZlIiBpcyBvbmUgdmFsaWQgY29uZmlndXJhdGlvbi4KPgo+IFllcywg
dGhhdCdzIHdoeSBpdCdzIGNvbmZ1c2luZyA6KQo+Cj4gPgo+ID4gRm9yIHZpcmdscmVuZGVyZXIs
IHRoYXQncyBzdGlsbCBhIHVzZWZ1bCBjb25maWd1cmF0aW9uLiBJZiB3ZSBhdHRlbXB0Cj4gPiB0
byBidWlsZCBhIG1pbmltYWwgdGFyZ2V0IHRoYXQgY2FuIHJ1biBhIFZNTSBsaWtlIHFlbXUgb3Ig
bGlia3J1biB3aXRoCj4gPiBoYXJkd2FyZSBhY2NlbGVyYXRlZCBncmFwaGljcy9jb21wdXRlLCB0
aGlzIGN1dHMgb3V0IG1vc3Qgb3IgYWxsIG9mCj4gPiB0aGUgaG9zdCdzIGdyYXBoaWNzIHN0YWNr
LCBkZXBlbmRpbmcgb24gb3VyIG5lZWQgdG8gZGlzcGxheSBmcmFtZXMKPiA+IGxvY2FsbHkgb24g
dGhlIGhvc3QuIEkgY291bGQgZW52aXNpb24gYSB2aXJ0dWFsaXplZCBndWVzdCB1c2luZyBlLmcu
Cj4gPiBtb29ubGlnaHQgWzBdIHRvIHN0cmVhbSBncmFwaGljYWwgb3V0cHV0IHRvIGFub3RoZXIg
bWFjaGluZS4KPiA+Cj4gPiBMb29raW5nIGF0IG90aGVyIHVzZXJzIG9mIGxpYmVwb3h5LCBXZXN0
b24gY2FuIHVzZSBwaXhtYW4sIEdMLCBvcgo+ID4gVnVsa2FuIGZvciByZW5kZXJpbmcsIGFuZCBj
YW4gdXNlIERSTSwgeDExLCB3YXlsYW5kLCBvciB2bmMgYXMgZGlzcGxheQo+ID4gYmFja2VuZHMs
IG9yIGV2ZW4gcnVuIGhlYWRsZXNzLiBObyBHTC9FR0wgaXMgYWdhaW4gYSB2YWxpZAo+ID4gY29u
ZmlndXJhdGlvbiBoZXJlLCBpdCBqdXN0IGdyYWNlZnVsbHkgZGlzYWJsZXMgR0wgYXQgcnVudGlt
ZS4KPgo+IE9rLCBJJ20gY29udmluY2VkLgo+Cj4gPgo+ID4gSSBkb24ndCBrbm93IGFib3V0IGxp
YmNhbWVyYS1hcHBzLCBsaWJndGszLCBsaWJndGszLCB3ZWJraXRndGssIG9yCj4gPiB3cGV3ZWJr
aXQuIEN1cnJlbnRseSwgdGhleSB3aWxsIGFsbCByZXRhaW4gdGhlaXIgZGVwZW5kZW5jeSBvbgo+
ID4gSEFTX0xJQkdMIHx8IEhBU19MSUJFR0wuIEkgc3VwcG9zZSBpZiB0aGVzZSBkZXBlbmRlbmNp
ZXMgd2VyZSByZW1vdmVkLAo+ID4gaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gYnVpbGQgc29tZSBh
cHBsaWNhdGlvbnMgaW4gcG9pbnRsZXNzCj4gPiBjb25maWd1cmF0aW9ucyB0aGF0IGxhY2sgZGVz
aXJlZCBmdW5jdGlvbmFsaXR5Lgo+Cj4gSSdtIGZpbmUgaWYgd2Uga2VlcCBIQVNfTElCR0wgfHwg
SEFTX0xJQkVHTCBkZXBlbmRlbmNpZXMgZm9yIHRoZXNlIHBhY2thZ2VzIGJ1dAo+IGF0IGxlYXN0
IHlvdSBzaG91bGQgdXBkYXRlIHRoZSBjb21tZW50IGFib3V0IGxpYmVwb3h5IGRlcGVuZGVuY3kK
Pgo+IC0gIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX0xJQkVHTCB8fCBCUjJfUEFDS0FHRV9I
QVNfTElCR0wgIyBsaWJlcG94eQo+ICsgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX0xJQkVH
TCB8fCBCUjJfUEFDS0FHRV9IQVNfTElCR0wgIyBuZWVkcyBsaWJlcG94eQo+IHcvIEVHTCBvciBH
TAo+Cj4gQ2FuIHlvdSByZXNlbmQgYSB2NiB3aXRoIGltcHJvdmVkIGNvbW1lbnRzPwo+CgpBYnNv
bHV0ZWx5LCBhbmQgdGhhbmtzIHNvIG11Y2ggZm9yIHRha2luZyB0aGUgdGltZSB0byB3b3JrIHRo
cm91Z2gKdGhpcyB3aXRoIG1lLiA6KQoKPiA+Cj4gPiBbMF0gaHR0cHM6Ly9tb29ubGlnaHQtc3Ry
ZWFtLm9yZy8KPiA+Cj4gPiBCZXN0LAo+ID4gSm9zZXBoCj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
