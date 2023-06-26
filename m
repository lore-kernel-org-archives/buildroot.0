Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2309AEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 21:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D8EB81911;
	Mon, 26 Jun 2023 21:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D8EB81911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IOIyTEQySmN6; Mon, 26 Jun 2023 21:34:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAE238151E;
	Mon, 26 Jun 2023 21:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAE238151E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55D281BF2FC
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 21:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C4A98151E
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 21:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C4A98151E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isBQrG53zFSe for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 21:34:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37D4D8143D
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37D4D8143D
 for <buildroot@busybox.net>; Mon, 26 Jun 2023 21:34:30 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1b03fb998c8so1293165fac.3
 for <buildroot@busybox.net>; Mon, 26 Jun 2023 14:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687815270; x=1690407270;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lr6oUwKwVp+wqp2/Lg1XrqPRFsl584LLiVnI/gBDHJY=;
 b=F3ubw/UQXjcP3e0Up8JdwW1PHxJDvGnOdp5y+XxxDJ8k0+LHPT2V7hHGktPE6sGYxt
 TlfFpCNedt/89K4v8qsyuQDdJpLv/X16rzZvKbZXN/zHNW77ERjsK6Ogvut7tndKuC3v
 HqV80u+MOADdCYPj6VnypgG3DrPSCAEVUZQdd56mfR8ExCd8hvJvhGLSo3QWdOsSWqkS
 DvIF1L7DLi5v9bG7WSD9yrxrL5h7YjnwrLJHI7p2wN2kPI0+KkEILqgwYpvNwqrlXg6W
 cV8odx/xTOvJSjCtN/Q4jVTLr38ZHjQzWKWjAy3nhlhsUiSJVoOmAybFSX+vrf8FGqyc
 U+Lg==
X-Gm-Message-State: AC+VfDwK0MeqyX74sckV3MCQz1x3B74VjRWRS/9WHQ5hZYfXmIanCtix
 Ikpvu0FPJhBYSGflsarwbwPqXwAzxuaaDAqhteY=
X-Google-Smtp-Source: ACHHUZ6ZLOf9s99PrGKEKLAAgxhQhafV/h03vVQS4E4UpB+wLS1BCNpkBWXH+2vV/Ps9WpnibDBljDYEymZhgZe1w28=
X-Received: by 2002:a05:6870:7707:b0:1b0:39c1:e84 with SMTP id
 dw7-20020a056870770700b001b039c10e84mr4139652oab.6.1687815269819; Mon, 26 Jun
 2023 14:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
In-Reply-To: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Jun 2023 15:34:18 -0600
Message-ID: <CADvTj4odK4i-+KXc-Gmb=Z_WD-Ypt-xDBnPTX=_=Yv0S_BrBtg@mail.gmail.com>
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687815270; x=1690407270;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lr6oUwKwVp+wqp2/Lg1XrqPRFsl584LLiVnI/gBDHJY=;
 b=buYLl5w1yv573BcNnTMy9WyQyCce1749cTUUI+jnZhb2T71+d+Wc/yq9HoL0uNXlhw
 53TDv4CBxcb2XSYniNuP50g7o4UrSrYHpAX7xk+dhxJF1oL/Q8g9CfH2TlA2uhHYOUo9
 fHG7HV6EERK6EROs5cEElp19J/MWrNT+nm2R4nsModKUgViR5P4sBof/Q2xcaFRsSMUZ
 vrJIjbTo6+jcLcfA8VInllYwHPJxJ48WrmIcGCFF39sYKe2qlkk1yNFl3ooUj2KP/qdI
 ss/cyRuCOr6KdOrPHCgkgGay6orQbKdxJNT6aX+XmhgVU/6LZR9rmPUcPlortasIYVTg
 Z46Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=buYLl5w1
Subject: Re: [Buildroot] [RFC v3 1/2] package/pkg-meson.mk: support fortran
 cross-compilation
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBBdWcgNSwgMjAyMiBhdCA4OjM34oCvQU0gR3VpbGxhdW1lIFcuIEJyZXMKPGd1aWxs
YXVtZS5icmVzc2FpeEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gcHl0aG9uLXNjaXB5IGlzIG1vdmlu
ZyB0byBhIG1lc29uIGJ1aWxkIGluZnJhc3RydWN0dXJlLAo+IGFuZCByZXF1aXJlcyBmb3J0cmFu
IGNyb3NzLWNvbXBpbGF0aW9uCgpJIGhhdmUgYSBwYXRjaCBtaWdyYXRpbmcgc2NpcHkgdG8gbWVz
b24gaGVyZToKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9w
YXRjaC8yMDIzMDYyNjE4MTUzMS4yMzEyMDAyLTQtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8K
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBHdWlsbGF1bWUgVy4gQnJlcyA8Z3VpbGxhdW1lLmJyZXNzYWl4
QGdtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9wa2ctbWVzb24ubWsgICAgICAgICAgICAgICAg
ICAgfCAyICsrCj4gIHN1cHBvcnQvbWlzYy9jcm9zcy1jb21waWxhdGlvbi5jb25mLmluIHwgMyAr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3BrZy1tZXNvbi5tayBiL3BhY2thZ2UvcGtnLW1lc29uLm1rCj4gaW5kZXggMTU2YjAw
NWZkZC4uMzJkNDExNzBmMyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BrZy1tZXNvbi5tawo+ICsr
KyBiL3BhY2thZ2UvcGtnLW1lc29uLm1rCj4gQEAgLTc2LDEwICs3NiwxMiBAQCBkZWZpbmUgUEtH
X01FU09OX0NST1NTQ09ORklHX1NFRAo+ICAgICAgICAgIC1lICJzJUBUQVJHRVRfQ0NAJSQoVEFS
R0VUX0NDKSVnIiBcCj4gICAgICAgICAgLWUgInMlQFRBUkdFVF9DWFhAJSQoVEFSR0VUX0NYWCkl
ZyIgXAo+ICAgICAgICAgIC1lICJzJUBUQVJHRVRfQVJAJSQoVEFSR0VUX0FSKSVnIiBcCj4gKyAg
ICAgICAgLWUgInMlQFRBUkdFVF9GQ0AlJChUQVJHRVRfRkMpJWciIFwKPiAgICAgICAgICAtZSAi
cyVAVEFSR0VUX1NUUklQQCUkKFRBUkdFVF9TVFJJUCklZyIgXAo+ICAgICAgICAgIC1lICJzJUBU
QVJHRVRfQVJDSEAlJChQS0dfTUVTT05fVEFSR0VUX0NQVV9GQU1JTFkpJWciIFwKPiAgICAgICAg
ICAtZSAicyVAVEFSR0VUX0NQVUAlJChHQ0NfVEFSR0VUX0NQVSklZyIgXAo+ICAgICAgICAgIC1l
ICJzJUBUQVJHRVRfRU5ESUFOQCUkKGNhbGwgcXN0cmlwLCQoY2FsbCBMT1dFUkNBU0UsJChCUjJf
RU5ESUFOKSkpJWciIFwKPiArICAgICAgICAtZSAicyVAVEFSR0VUX0ZDRkxBR1NAJSQoY2FsbCBt
YWtlLXNxLWNvbW1hLWxpc3QsJCgkKHN0cmlwICQoMikpKSklZyIgXAo+ICAgICAgICAgIC1lICJz
JUBUQVJHRVRfQ0ZMQUdTQCUkKGNhbGwgbWFrZS1zcS1jb21tYS1saXN0LCQoJChzdHJpcCAkKDEp
KSkpJWciIFwKPiAgICAgICAgICAtZSAicyVAVEFSR0VUX0xERkxBR1NAJSQoY2FsbCBtYWtlLXNx
LWNvbW1hLWxpc3QsJCgkKHN0cmlwICQoMykpKSklZyIgXAo+ICAgICAgICAgIC1lICJzJUBUQVJH
RVRfQ1hYRkxBR1NAJSQoY2FsbCBtYWtlLXNxLWNvbW1hLWxpc3QsJCgkKHN0cmlwICQoMikpKSkl
ZyIgXAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L21pc2MvY3Jvc3MtY29tcGlsYXRpb24uY29uZi5p
biBiL3N1cHBvcnQvbWlzYy9jcm9zcy1jb21waWxhdGlvbi5jb25mLmluCj4gaW5kZXggMjM1ZTVh
ODQ5NS4uNzA1M2RmNDcyYiAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L21pc2MvY3Jvc3MtY29tcGls
YXRpb24uY29uZi5pbgo+ICsrKyBiL3N1cHBvcnQvbWlzYy9jcm9zcy1jb21waWxhdGlvbi5jb25m
LmluCj4gQEAgLTksNiArOSw3IEBAIGNwcCA9ICdAVEFSR0VUX0NYWEAnCj4gIGFyID0gJ0BUQVJH
RVRfQVJAJwo+ICBzdHJpcCA9ICdAVEFSR0VUX1NUUklQQCcKPiAgY21ha2UgPSAnQEJSMl9DTUFL
RUAnCj4gK2ZvcnRyYW4gPSAnQFRBUkdFVF9GQ0AnCj4gIHBrZ2NvbmZpZyA9ICdAUEtHQ09ORl9I
T1NUX0JJTkFSWUAnCj4gIGctaXItY29tcGlsZXIgPSAnQFNUQUdJTkdfRElSQC91c3IvYmluL2ct
aXItY29tcGlsZXInCj4gIGctaXItc2Nhbm5lciA9ICdAU1RBR0lOR19ESVJAL3Vzci9iaW4vZy1p
ci1zY2FubmVyJwo+IEBAIC0xOCw2ICsxOSw4IEBAIGNfYXJncyA9IFtAVEFSR0VUX0NGTEFHU0Bd
Cj4gIGNfbGlua19hcmdzID0gW0BUQVJHRVRfTERGTEFHU0BdCj4gIGNwcF9hcmdzID0gW0BUQVJH
RVRfQ1hYRkxBR1NAXQo+ICBjcHBfbGlua19hcmdzID0gW0BUQVJHRVRfTERGTEFHU0BdCj4gK2Zv
cnRyYW5fYXJncyA9IFtAVEFSR0VUX0ZDRkxBR1NAXQo+ICtmb3J0cmFuX2xpbmtfYXJncyA9IFtA
VEFSR0VUX0xERkxBR1NAXQo+ICB3cmFwX21vZGUgPSAnbm9kb3dubG9hZCcKPiAgY21ha2VfcHJl
Zml4X3BhdGggPSAnQFNUQUdJTkdfRElSQC91c3IvbGliL2NtYWtlJwo+Cj4gLS0KPiAyLjMwLjIK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
