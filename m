Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126CFC001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B8F801ED;
	Thu, 27 Jul 2023 21:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B8F801ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voEvlNtVByYg; Thu, 27 Jul 2023 21:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A04C83B95;
	Thu, 27 Jul 2023 21:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A04C83B95
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA1731BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D90C83B95
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D90C83B95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n_GSixAIngAZ for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:33:22 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AC8A812B4
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AC8A812B4
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fe11652b64so2550967e87.0
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 14:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690493599; x=1691098399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfDIM/Hrypx6qSTdDSeqj/c1KTA75tiHRipE+r7/k8Y=;
 b=hW6rW/PnMyNuNbf3CZKnmO0shbvmeUm+4NF/t1i0NORQV+vBo06F2aEBCe0PNcnpga
 IpXj97BneAHa2xfXKp4IQVrqTPhFioddwGP6ZN6tk7YojpyH32/AX+h7LatkYIq/c+ag
 hNJawWJ5uMpM9m9H2M/DVo6ogzZkzj/IB0DAdFVzgMboyq8PE/kwloQOhkY69e9ZKwNI
 cIs2IEO/MvCM3owHmlMnQMua0PTJ/ny64O4EOG4x1DPxIHgCzkoolBdFtWMfkZRlOJIR
 ovztihAygkDEUGgp7B0LcCdj5HkrxqsHWl7hku8dQADgMsufH0t4yzdvdnJMZl2Gbhht
 MC+A==
X-Gm-Message-State: ABy/qLY+19RcKjz2+FuwNo1tDWaWWof1Bgn76IwVKYuIkMw6ZOUmsdAN
 z/xPeo3TKCUzTR4dOpiFuOuhJicsjJtNrWrrj/PgQA==
X-Google-Smtp-Source: APBJJlFTjcGEnCd/QGpbVTZmlNzixFce4irFjf3voZNigHu/+DdrubSQhYV3Bdvan5sJcrH8bWI0bA==
X-Received: by 2002:a05:6512:ba5:b0:4fb:744e:17db with SMTP id
 b37-20020a0565120ba500b004fb744e17dbmr359001lfv.1.1690493598781; 
 Thu, 27 Jul 2023 14:33:18 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 h5-20020a05651211c500b004fe152278f4sm486735lfr.164.2023.07.27.14.33.18
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 14:33:18 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-4fe1a35a135so1705459e87.1
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 14:33:18 -0700 (PDT)
X-Received: by 2002:ac2:530a:0:b0:4fd:fe8f:4108 with SMTP id
 c10-20020ac2530a000000b004fdfe8f4108mr242168lfh.62.1690493597628; Thu, 27 Jul
 2023 14:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230721213121.178783-1-romain.naour@gmail.com>
 <20230722232630.1c759813@windsurf>
 <CA+h8R2qhnFzK8WQOVQNi=etMhKyg=hFhyBcRHPu7NYg5S=kjWA@mail.gmail.com>
 <dbadbf67-797f-ad6f-d519-35567417a291@smile.fr>
 <CA+h8R2oZ=oEr8hrJbHqw1K6AnBb__w1u6PGPmDUSONVb0Q0f6g@mail.gmail.com>
In-Reply-To: <CA+h8R2oZ=oEr8hrJbHqw1K6AnBb__w1u6PGPmDUSONVb0Q0f6g@mail.gmail.com>
Date: Thu, 27 Jul 2023 14:33:06 -0700
X-Gmail-Original-Message-ID: <CA+h8R2p0VrrNpSA=sMqs5C8bpe41L9sOfo_5z6E8X9z6T_m9-w@mail.gmail.com>
Message-ID: <CA+h8R2p0VrrNpSA=sMqs5C8bpe41L9sOfo_5z6E8X9z6T_m9-w@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690493599; x=1691098399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfDIM/Hrypx6qSTdDSeqj/c1KTA75tiHRipE+r7/k8Y=;
 b=WYvSR9OxrQwY9j90ykmBC9269TrZK0Le5ilBF0ZB5/kjNFr9jDy1U3UrHAS64EoVP0
 denh0ykuY5JZHpycVKfY7O4GjK/oI+9+5wnHsjrmMIxz44fd6mE4KyzVnSecOi36KlIi
 ug9j8v/BE7IUsTSv6hHeEezQd6pAwRq3DnVr6N+uqetSRRkwsyb0oSoKP2yLZdMFjdbR
 loIVpcHTZpewH2oMGnzd+p7gNoYrmwJwHb+YOfsargGSnl6n58tY4BxBdp7hPKnGEVZB
 lj3iEXyyr/nfHHvbUbT3ZrgTRkdhVYJhnSvnAeziDjgnKCHkgytD+RWLLRSypGQ2Xgoc
 mq5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=WYvSR9Ox
Subject: Re: [Buildroot] [PATCH] package/util-linux: bump version to 2.39.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLAoKT24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMjoyMOKAr1BNIENocmlzdGlhbiBTdGV3
YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+IE9uIFRodSwgSnVsIDI3LCAyMDIz
IGF0IDE6NDfigK9QTSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6
Cj4gPiBJdCBzZWVtcyB0aGUgZ28gYm9vdHN0cmFwIGRvZXNuJ3Qgd29yayBldmVuIGFmdGVyIEdv
IDEuMjAueCBtZXJnZSwKPiA+IHNlZSBbMV0KPgo+IEl0IGRlZmluaXRlbHkgd29ya3M7IEknbSBy
dW5uaW5nIG1hbnkgYnVpbGRzIGEgZGF5IHdpdGggaXQuCj4KPiBXaWxsIGNoZWNrIGludG8gd2h5
IHRoaXMgQ0kgam9iIGZhaWxlZCByaWdodCBhd2F5Lgo+Cj4gPiA+Pj4gaG9zdC1nbyAxLjIwLjYg
QnVpbGRpbmcKPiA+IC4uLgo+ID4gQnVpbGRpbmcgR28gdG9vbGNoYWluMSB1c2luZyBbLi4uXXRl
c3Qtb3V0cHV0L1Rlc3RNZW5kZXIvaG9zdC9saWIvZ28tMS4xOS4xMC4KPiA+IGVycm9yIG9idGFp
bmluZyBWQ1Mgc3RhdHVzOiBleGl0IHN0YXR1cyAxMjgKPiA+ICAgICAgICAgVXNlIC1idWlsZHZj
cz1mYWxzZSB0byBkaXNhYmxlIFZDUyBzdGFtcGluZy4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy80NzI1MTg2NTI1Cj4KPiBJcyAi
Z2l0IiBpbnN0YWxsZWQgYnkgYW55IGNoYW5jZT8KCkkgYmVsaWV2ZSB0aGlzIGlzc3VlIGlzIGEg
cmVncmVzc2lvbiBpbiBHbyByZWxhdGVkIHRvIHRoaXM6CgpodHRwczovL2dpdGh1Yi5jb20vZ29s
YW5nL2dvL2lzc3Vlcy81NDg1MgoKT3JpZ2luYWxseSB0aGUgR2VudG9vIG1haW50YWluZXJzIGFz
a2VkIGZvciB0aGUgYnVpbGQgdG8gbm90IG5lZWQgR2l0LAoKVGhlcmUncyBjb2RlIHdoaWNoIGxv
b2tzIGZvciBhIFZFUlNJT04gZmlsZSBpbiB0aGUgcm9vdCBvZiB0aGUgR28gc291cmNlczoKCmh0
dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vYmxvYi9iMmZmYzIzYTgyOGM5Yjg2NTAxZmVkNzE0
OGRlOWEzZjU1OGM2MTYyL3NyYy9jbWQvZGlzdC9idWlsZC5nbyNMNDEwCgouLi4gYnV0IG9ubHkg
d2hlbiBpc0dpdFJlcG8oKSByZXR1cm5zIGZhbHNlIChub3QgaW4gYSBHaXQgd29ya2luZyBkaXJl
Y3RvcnkpLgoKSXQgc2VlbXMgdGhhdCAtYnVpbGR2Y3M9ZmFsc2UgaXMgbm90IHNldCBpbiB0aGUg
ImdvIGluc3RhbGwiIGNvbW1hbmQKcmVnYXJkbGVzcyBvZiBpc0dpdFJlcG8oKS4KCkdlbnRvbyBk
b2VzIG5vdCBkbyBhbnl0aGluZyBzcGVjaWFsIGhlcmU6CgpodHRwczovL2dpdHdlYi5nZW50b28u
b3JnL3JlcG8vZ2VudG9vLmdpdC90cmVlL2Rldi1sYW5nL2dvL2dvLTEuMjAuNi5lYnVpbGQjbjE0
OQoKLi4uIHNvIEkgYmVsaWV2ZSB0aGF0IEdlbnRvbyB1c3VhbGx5IGhhcyB0aGUgLmdpdCB0cmVl
IHNldHVwIGNvcnJlY3RseQpvbiBidWlsZCB3aXRoIGdvMS4yMC42LgoKSSBiZWxpZXZlIHRoZXJl
J3MgYSBmZXcgdXBzdHJlYW1hYmxlIGZpeGVzIGhlcmU6CgogLSBTZXQgLWJ1aWxkdmNzPXtpc0dp
dERpcigpfSBpbiB0aGUgImdvIGluc3RhbGwiIGNvbW1hbmQgaW4gbWFrZS5iYXNoCiAtIEFkZCBh
biBlbnZpcm9ubWVudCB2YXJpYWJsZSBHT0JPT1RTVFJBUF9CVUlMRFZDUyB3aGljaCBjYW4gb3Zl
cnJpZGUgdGhpcy4KCkFuZCB0byBmaXggaW4gQnVpbGRyb290OgoKIC0gQWRkIEdPQk9PVFNUUkFQ
X0JVSUxEVkNTPTAKCkknbGwgc3VibWl0IGEgcGF0Y2ggc2VyaWVzIHdpdGggdGhlIEdvIHBhdGNo
IHNob3J0bHkgYW5kIHdpbGwgbG9vawppbnRvIHVwc3RyZWFtaW5nIGFzIHdlbGwuCgpCZXN0LApD
aHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
