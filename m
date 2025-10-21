Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282C2CCD19F
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 05:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D3AF80874;
	Tue, 21 Oct 2025 05:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rf8iWdMcuQAu; Tue, 21 Oct 2025 05:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C602F80885
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C602F80885;
	Tue, 21 Oct 2025 05:09:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73CE8277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64B0B80874
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9i152uxHAVK8 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 05:09:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9370480865
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9370480865
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9370480865
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:09:32 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-57a604fecb4so5788708e87.1
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761023370; x=1761628170;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9PQh3nwhzoRu9rnTff3ldZfvaIBusUNKyIOTEsBgvTw=;
 b=MSOfbAv0yy9TJoDpm1jvMTViJKPFtJ3Glig6wHXPmRm3enS0rIXt13ksnqdwb1BH2b
 XRFQKrG+bm4HOsdwyBueSW38KBniCac6WzWwZYOs1jOxvcJD+g2EMTxG7OGak9ADcumR
 1/OI6q3N7D3WA/Rzb75iAKbuYg9yUJHqq10iYH/3ruWWvnlndF6WcRCIHW81fnkslSCP
 D6GRC9h0U42RJcn0cop4cyqy8/F7m1zVYjQIwUGd6pZYgosg/GBc2mWQO0jr5K2IYR3q
 C105zrOjl0nj7irBfAYYh+suehSuahHusEeUzuSa2WjQuJg93UUJZ8LvfJbpJlsyEWPv
 3lLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD5IPeFojJhZMKxs+w0TQ25jz2/5mbSvSG+O8wi1HbgYdT11yCZrVqLdRWEvDXV9faLWsMCAND0jc=@buildroot.org
X-Gm-Message-State: AOJu0YyacV9nbcMEg4ny3FwRrVovrAPadxpZS+dVvXoldpmSLgE9TN84
 E6uknneEalCPLhTkWKAoeHJN68tICqt5089WySRyvStUAjx2WLkTs9+e3u9t9ePqsEUMDQkLRgr
 3bHAlTIoycA==
X-Gm-Gg: ASbGncuUE2iiLZVju6AMWiEJJCBqXglQ4IYO8AgRIjpX5e+aAVZaNLtLn1c6RWFK4Y0
 O1ROCWjzXFA9u/lM/y5IhOCNvtL3DShO9y4uvkPNYVSHkeHK2tHUQMpjNsbMXYkDP5UOkszgwQb
 2NrbErbI/ceuq5JeVkdSgykOreIE7yQHhOKiG0unbG8nF8is1yIQ3ksxwvP5IP3bxQBTwjESKeX
 1zxXXFj27IPUDFjDYuJrXkkuwrvtxeSMS5N/Qneoi82rSGo31cRfM9FXB0EheRopzTxCzb2aCKG
 KNprfp5U9Mm+9pQq3J1MEff6q82iUctG8G0BbzbRwAx5v+4yZYYlFo4Y5oNCi2JlhUt5C+8uZE4
 DpFQa1Rd8v2MO7y8j1KgL1Cjxtl+OIVd0ZEdNVbUvFOzOZpUu1rnrkju6LG/N5zR8BoJGeKCCuB
 AcPeNobBoX5OPvnkygiaNZAVqGBoqjwSVDUgeuQfg=
X-Google-Smtp-Source: AGHT+IGyh4Po/3xx5sKv4CkEKvbrFegcg2DraL8aFUKKE0dDzwKN5EvrjgoFpuDPpB2gsgAT4pOYWQ==
X-Received: by 2002:a05:6512:220f:b0:57a:640a:11b4 with SMTP id
 2adb3069b0e04-591d8569ab8mr5502943e87.39.1761023369910; 
 Mon, 20 Oct 2025 22:09:29 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591deeae43esm3194790e87.25.2025.10.20.22.09.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 22:09:29 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-57d5ccd73dfso4902001e87.0
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:09:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX3KCbgkD65qF2Ehcp1oUI9y+Ds1MCvMmLFZDqu3O3Jtxbu7Qz/pMIbOL+nMb9GLIdqgS0NBfGxfOI=@buildroot.org
X-Received: by 2002:a05:6512:33c6:b0:55f:4f1f:93fa with SMTP id
 2adb3069b0e04-591d856a9b8mr4803513e87.42.1761023368892; Mon, 20 Oct 2025
 22:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251020225424.98853-1-james.hilliard1@gmail.com>
 <aPcNRwNOMOrNTLUB@yd-6wlzhs3>
In-Reply-To: <aPcNRwNOMOrNTLUB@yd-6wlzhs3>
Date: Mon, 20 Oct 2025 22:09:17 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rkGCQeJbEvR6wHRX8q5s1D2EP2OXk9ieMr326TqTofaw@mail.gmail.com>
X-Gm-Features: AS18NWAd6gefqzUUa_7u6_9AZBRx1EPjK29llEMfTMZJhzLfVWKVy_VWa4SskYA
Message-ID: <CA+h8R2rkGCQeJbEvR6wHRX8q5s1D2EP2OXk9ieMr326TqTofaw@mail.gmail.com>
To: yann.morin@orange.com
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1761023370; x=1761628170; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9PQh3nwhzoRu9rnTff3ldZfvaIBusUNKyIOTEsBgvTw=;
 b=0CwZOCEnLxUMM1MwVQbusISnv5p1Ux8QFhkMtTuM4j0ZiZtDyrqy3Yc0Bn55HX6Azs
 0vSyP6WZjRAf0iicTM6Y/2OHiNxPGlLfuwwNFS9kqzYNG3p9RzAHrmEZa8JiXcjhlYPx
 vL8JwA1lLUal47dtZgEEAilUN+BltZKpby5F3T/XKHMYeYImzSWFaN3oL3bE+0PIs4bo
 u5aEBjynYlzu2WuPUzPP/FxDY6QZXtTWxqdPaboE47QgBxzPlu3ptM2Jj2SB14s54NPM
 Det8IUqKjhwrYP9otTY7zVoU5Gx42XuEQ7/IVztWALAA8Jxif6kUdAClI4UAEXOiPdfR
 CVkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=0CwZOCEn
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pkg-golang.mk: make GOPROXY
 configurable
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIE1vbiwgT2N0IDIwLCAyMDI1IGF0IDk6MzTigK9QTSA8eWFubi5tb3JpbkBv
cmFuZ2UuY29tPiB3cm90ZToKPiA+IC0gQXZvaWQgcGFja2FnZSBicmVha2FnZXMgZHVlIHRvIG1p
c3NpbmcgbW9kdWxlIHNvdXJjZXMKPgo+IEhvdyBjYW4gc291cmNlcyBiZSBtaXNzaW5nIHdoZW4g
ZmV0Y2hlZCAiZGlyZWN0Imx5PwoKV2UgaGFkIHNpdHVhdGlvbnMgd2hlcmUgR2l0IHRhZ3Mgd2Vy
ZSBmb3JjZS1wdXNoZWQgcG9zdC1mYWN0byBjYXVzaW5nIGJyZWFrYWdlcy4KCkkgcmVtZW1iZXIg
YW5vdGhlciBjYXNlIGFzIHdlbGwgd2hlcmUgR2l0IExGUyBmaWxlcyB3ZXJlIGhhbmRsZWQKaW5j
b3JyZWN0bHkgbGVhZGluZyB0byBicmVha2FnZXMuCgo+IERvIHlvdSBoYXZlIGEgbmVzeGFtcGxl
IG9mIGEgcGFja2FnZSB3aGVyZSB0aGlzIGFjdHVhbGx5IGZpeGVzIHRoZQo+IGRvd25sb2FkIChi
YXJyaW5nIHVzaW5nIHMuYi5vLikgPwoKSSB3aWxsIGxlYXZlIHRoaXMgdG8gSmFtZXMgdG8gYW5z
d2VyIC0gbm90IHN1cmUuCgpGV0lXIEkndmUgb3ZlcnJpZGRlbiBpdCB0byAiZGlyZWN0IiBpbiBt
eSBvd24gQnVpbGRyb290IGJyYW5jaCBhcyBJCnN0aWxsIHByZWZlciBmcm9tLUdpdCBzb3VyY2Vz
LgoKPiA+IC0gQmV0dGVyIGFsaWdubWVudCB3aXRoIHVwc3RyZWFtIEdvIHRvb2xjaGFpbiBkZWZh
dWx0cwo+ID4gLSBGYXN0ZXIgZG93bmxvYWRzIHZpYSB0aGUgcHJveHkgY29tcGFyZWQgdG8gZGly
ZWN0IEdpdCBjbG9uZXMKPiA+IC0gTWFpbnRhaW5zIHJlcHJvZHVjaWJsZSBidWlsZHMgdGhyb3Vn
aCBHbydzIG1vZHVsZSBjaGVja3N1bSB2YWxpZGF0aW9uCj4KPiBJbiB0aGUgcGFzdCwgd2Ugb2Jz
ZXJ2ZWQgdGhlIHJldmVyc2U6IHRoZSBnb3Byb3h5IGhhZCBhIHN0YWxlIHZlcnNpb24KPiB0aGF0
IHdhcyBub3QgbWF0Y2hpbmcgdGhlIHVwc3RyZWFtIG9uZSwgc28gd2hlbiB3ZSB0cmllZCB0byB2
ZW5kb3IgYQo+IHBhY2thZ2UsIHRoZSBoYXNoZXMgd291bGQgbm90IG1hdGNoLiBVc2luZyAiZGly
ZWN0IiBmaXhlZCB0aGUgaXNzdWUKPiAoc29ycnksIEkgY2FuJ3QgcmVtZW1iZXIgd2hhdCBwYWNr
YWdlIHRoYXQgd2FzLi4uKQoKSSB0aGluayBpdCB3YXMgdGhlIG90aGVyIHdheSBhcm91bmQsIEdP
UFJPWFkgaGFkIHRoZSBzdGFsZSB2ZXJzaW9uIHllcywKCi4uLiBidXQgdGhlIGRvd25zdHJlYW0g
ZGVwZW5kZW5jaWVzIG9mIHNhaWQgcGFja2FnZSBhbHNvIGV4cGVjdGVkIHRoZQpzdGFsZSB2ZXJz
aW9uLgoKPiA+IFRoZSBkZWZhdWx0IHZhbHVlIGZyb20gdGhlIHRvb2xjaGFpbiBjYW4gYmUgcmVh
ZCB3aXRoICJnbyBlbnYgR09QUk9YWSIKPgo+IEkgZGlzYWdyZWUuIFRoZSBkZWZhdWx0IHNob3Vs
ZCBiZSB0aGUgc2FtZSBhcyB0aGUgcHJldmlvdXMgc2V0dGluZywgdGhhdAo+IGlzICJkaXJlY3Qi
LiBBdCBsZWFzdCBpbiB0aGlzIHBhdGNoLgo+Cj4gSWYgeW91IHdhbnQgdG8gc3VnZ2VzdCBhIGNo
YW5nZSBvZiB0aGUgZGVmYXVsdCwgcGxlYXNlIGRvIHRoYXQgaW4gYQo+IHNlcGFyYXRlIHBhdGNo
LgoKQWNrCgpCZXN0IHJlZ2FyZHMsCkNocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
