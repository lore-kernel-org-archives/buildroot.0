Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBD1C77B73
	for <buildroot@archiver.kernel.org>; Wed, 31 May 2023 14:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED90981F89;
	Wed, 31 May 2023 14:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED90981F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOFKxzpBB11U; Wed, 31 May 2023 14:20:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A7C481F45;
	Wed, 31 May 2023 14:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A7C481F45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD87A1BF5A6
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 14:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 869D881F45
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 14:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 869D881F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id so63RNVXGSbX for <buildroot@lists.busybox.net>;
 Wed, 31 May 2023 14:20:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83681813D5
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83681813D5
 for <buildroot@buildroot.org>; Wed, 31 May 2023 14:20:55 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-19f8af9aa34so1948267fac.1
 for <buildroot@buildroot.org>; Wed, 31 May 2023 07:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685542854; x=1688134854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9dhq5G5W4H7Ek4IaoTa84OL4ItbZTpWmfTROFE046bc=;
 b=YHp5c0vwfVt41Q2T6pCdj4MnB42vdOYo7/3YwDgnO6PRSVrl5OvOVqIa0MnE0ovrQb
 dlxnxpfpZpfuENcvAl2vexd3F7ji6BbCr5IO8iNUhDIXEdEn/dthvbC2aK4nsAJzZ6Ty
 OrQUjmP1okO/eaqbCWNfRKmnCQGlJ31wYM1VnDCMSDvsxUFFTedzmum9HDmwXabgLIjL
 aIfYMEAhhcqymaAEBcllbFlW/mgAJxVKFqK/eQcMi0ax2sZ2+xvSCq+sr1nGbCSwvfLh
 AzuL2P3UegQEMMDtyW0cB3Fg13wSwVN1RX1XSDCxdTHlluqzHwnXGMz4FIqHpRSPEMoe
 h2gw==
X-Gm-Message-State: AC+VfDxf1icff5bHf2kvyIEoN+1pHxIeFvrCkoa7mHm4zh6VfEzX5S+N
 ggVy0/+lL6YQjZ6gqmDjOSKZ+FvrPgWoNVwzb/7Rp0mdW6I=
X-Google-Smtp-Source: ACHHUZ6azsV1Oo/x0nD/LPHGaz1K8vmFwfMT+27rZwkRTL4yk2IxOuZaKucfuqrhLi47OcvCG/8Bbyu53YSahKljXnk=
X-Received: by 2002:a05:6870:7731:b0:19f:9b81:342c with SMTP id
 dw49-20020a056870773100b0019f9b81342cmr3571256oab.57.1685542854203; Wed, 31
 May 2023 07:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230109042648.2342444-1-james.hilliard1@gmail.com>
 <e7edff90-429c-06fb-8127-263f62e53ede@smile.fr>
 <CADvTj4o-0p0GLyp_LK_zciQACB9L5ZuTZyQU4My0ZcgwR0ym6w@mail.gmail.com>
 <468bf7d8-5ea2-d367-b6dc-65d01beb775c@smile.fr>
In-Reply-To: <468bf7d8-5ea2-d367-b6dc-65d01beb775c@smile.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 31 May 2023 08:20:42 -0600
Message-ID: <CADvTj4okAxHFG_dOdqJYaKAnt_5jOTrtkbHp8KNPkYvN16Tk9g@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685542854; x=1688134854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9dhq5G5W4H7Ek4IaoTa84OL4ItbZTpWmfTROFE046bc=;
 b=ELpa2YscyI8KNt0cP+W/dtMp0aFFrta11qiQXEJwCzvvu2dGw04QlidhV0u3Ak835T
 Y2cTy39R5xu6gaFeAGZUtT54JJo0pk0cgJxwP4OgztNaD1wgyfN5Y4IeBGqHtuGMseC7
 DmKzNs0+xPSEriaBmF7fB9s7RnDEsnmedvtv1y3ZOQej57/291f3J8MlYrblqFUsmvYz
 L7BQOMNEYqpBzmTXcxVF+oiDumJULW5DehNAcL+/BDJmJUdxB2MZkdnvASVwoE/ZohK0
 0eUg56YMf+pX7N2YNEyzWtCHIj1VEAxmpaUdigFdLTt1rL80mTLNIw6+gJoqO32dGAp1
 cvkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ELpa2Ysc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.8.0
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBNYXkgMzEsIDIwMjMgYXQgODoxOeKAr0FNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQHNtaWxlLmZyPiB3cm90ZToKPgo+IEhlbGxvIEphbWVzLAo+Cj4gTGUgMjkvMDUvMjAyMyDD
oCAyMjozOSwgSmFtZXMgSGlsbGlhcmQgYSDDqWNyaXQgOgo+ID4KPiA+Cj4gPiBPbiBUaHUsIE1h
eSAyNSwgMjAyMyBhdCAzOjQ04oCvUE0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUu
ZnIKPiA+IDxtYWlsdG86cm9tYWluLm5hb3VyQHNtaWxlLmZyPj4gd3JvdGU6Cj4gPgo+ID4gICAg
IEhlbGxvIEphbWVzLAo+ID4KPgo+IFsuLi5dCj4KPiA+ICAgICA+IC1QWVRIT05fSVBZVEhPTl9W
RVJTSU9OID0gOC43LjAKPiA+ICAgICA+ICtQWVRIT05fSVBZVEhPTl9WRVJTSU9OID0gOC44LjAK
PiA+Cj4gPiAgICAgVGhlIHRlc3QgVGVzdElQeXRob25QeTMgZmFpbCBbMV0gc2luY2UgaXQgd2Fz
IHVwZGF0ZWQgdG8gOC42LjAgcmVsZWFzZSBqdXN0Cj4gPiAgICAgYWZ0ZXIgMjAyMi4xMS4KPiA+
Cj4gPiAgICAgICBNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBtb2R1bGUgbmFtZWQgJ3N0YWNrX2Rh
dGEnCj4gPgo+ID4gICAgIEluZGVlZCB0aGVyZSBpcyBubyBzdWNoIHB5dGhvbjMtc3RhY2stZGF0
YSBpbiBCdWlsZHJvb3QuCj4gPiAgICAgRm9yIGV4YW1wbGUsIEZlZG9yYSBwYWNrYWdpbmcgYWRk
ZWQgcHl0aG9uMy1zdGFjay1kYXRhIHdoaWxlIHVwZGF0aW5nIHRvIGlweXRob24KPiA+ICAgICA4
LjAuMS4KPiA+Cj4gPiAgICAgQ2FuIHlvdSBoYXZlIGEgbG9vayBwbGVhc2U/Cj4gPgo+ID4KPiA+
IE9oLCBtdXN0IGhhdmUgbWlzc2VkIHRoYXQgd2hlbiB1cGRhdGluZyBpcHl0aG9uIEkgc2VlIHlv
dSBhbHJlYWR5IHNlbnQgYSBzZXJpZXMKPiA+IGZpeGluZyB0aGlzOgo+ID4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjMwNTI4MTkwMTExLjI0MzA1ODAtNS1yb21haW4ubmFv
dXJAZ21haWwuY29tLwo+ID4gPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDIz
MDUyODE5MDExMS4yNDMwNTgwLTUtcm9tYWluLm5hb3VyQGdtYWlsLmNvbS8+Cj4gPgo+Cj4gRG8g
eW91IHRoaW5rIHdlIHNob3VsZCByZXZlcnQgdG8gaXB5dGhvbiA3LnggZm9yIDIwMjMuMDIgYW5k
IDIwMjMuMDU/IEl0IGlzIHNhZmUKPiB0byBkbyBzbz8KCkdvb2QgY2hhbmNlIHRoZXJlJ3Mgc29t
ZSBpbmNvbXBhdGlibGUgZGVwZW5kZW5jaWVzLgoKPiBpcHl0aG9uIDgueCByZXF1aXJlcyA0IG5l
dyBwYWNrYWdlcywgSSdtIG5vdCBzdXJlIGl0J3Mgc2FmZSB0byBhZGQgdGhlbSBmb3IKPiAyMDIz
LjAyIGFuZCAyMDIzLjA1LgoKUHJvYmFibHkgc2FmZXIgdGhhbiB0cnlpbmcgdG8gcmV2ZXJ0LgoK
Pgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
