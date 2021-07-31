Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B48C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:34:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0578D6044F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0578D6044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7FD260758;
	Sat, 31 Jul 2021 11:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYXqlsnq_JEo; Sat, 31 Jul 2021 11:34:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D7BA60754;
	Sat, 31 Jul 2021 11:34:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DD641BF846
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AB344027E
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSUd94fesvws for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 11:34:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 973864027D
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 11:34:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bd5f:2690:7a2e:30fd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4E2DE78034D;
 Sat, 31 Jul 2021 13:34:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627731286;
 bh=i8/mAIQgei0dmq/FxmsUHTE2gYW7inSA1sAWeI1oNSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SdBVVJulnb3IlckTrGAadFiT1MjZFXKMGzqaF8PPfIt1z6j60e39+zV/obFm7rS0X
 JqiiphbrdCgl8lYKxyk186MFE9ShqegMTyzwnNH2VbRAw1WWKMu8dlLuC0i1WkDz2w
 5su+GlV/36RuXBCjtHB/GJvt4oe73TIMEm7NAbt+971DFwPTTXPiTPF7JdBcFYdKRd
 sadK+fKZAWhetz2q4OJllS4CxGdlbWMjyrwUP/a2D7EwHxTV2YU3Tb7UgZnEq+M0NZ
 kXMMsf7z3iGx/HsqI6ogp0MK9WbdPj+G+DMR/Lzni8ZDkcuPcraWw+0JzI1ovG+FHx
 Rt6Oj1pIpnYOw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Jul 2021 13:34:42 +0200
Date: Sat, 31 Jul 2021 13:34:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210731113442.GN3189549@scaer>
References: <20210701174719.112866-1-fontaine.fabrice@gmail.com>
 <20210731095320.GJ3189549@scaer>
 <CAPi7W80vYLg88Tf1H0J0YFWvSQJgCpjBr8AV0VbAk+a9RRdRLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W80vYLg88Tf1H0J0YFWvSQJgCpjBr8AV0VbAk+a9RRdRLQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/exiv2: fix build without SSP
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RmFicmljZSwgQWxsLAoKT24gMjAyMS0wNy0zMSAxMzoyOSArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgc2FtLiAzMSBqdWlsLiAyMDIxIMOgIDExOjUzLCBZYW5uIEUu
IE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+ID4gT24gMjAyMS0w
Ny0wMSAxOTo0NyArMDIwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4gPiA+IEJ1
aWxkIHdpdGhvdXQgU1NQIGZhaWxzIHNpbmNlIGJ1bXAgdG8gdmVyc2lvbiAwLjI3LjQgaW4gY29t
bWl0Cj4gPiA+IGJjYWNlNDI5NDI2ZWU5MWFhYzU2ZjNkY2MzM2I2OWUyMjE0MWQzODQKPiA+ID4K
PiA+ID4gVGhpcyBpcyBkdWUgdG8gdGhlIGZhY3QgdGhhdAo+ID4gPiBodHRwczovL2dpdGh1Yi5j
b20vRXhpdjIvZXhpdjIvY29tbWl0L2JiZTBiNzA4NDBjZjI4YjdkZDhjMGI3ZTliYjFiNzQxYWVk
YTJlZmQKPiA+ID4gcmVtb3ZlZCB0aGUgd3JvbmcgR0NDXyBwcmVmaXggZnJvbSBIQVNfRlNUQUNL
X1BST1RFQ1RPUl9TVFJPTkcgdmFyaWFibGUKPiA+ID4KPiA+ID4gRml4ZXM6Cj4gPiA+ICAtIGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2FlNDYzNTg5OTEyNGM2MDJjNzBk
MmIzNDJhNzZmOTVjMzRhYTRhM2QKPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgLi4u
ZGQtQlVJTERfV0lUSF9TVEFDS19QUk9URUNUT1Itb3B0aW9uLnBhdGNoIHwgNTIgKysrKysrKysr
KysrKysrKysrKwo+ID4gVGhpcyBwYXRjaCBkb2VzIG5vdCBhcHBseToKPiA+ICAgICA+Pj4gZXhp
djIgMC4yNy40IFBhdGNoaW5nCj4gPiAgICAgQXBwbHlpbmcgMDAwMS1hZGQtQlVJTERfV0lUSF9T
VEFDS19QUk9URUNUT1Itb3B0aW9uLnBhdGNoIHVzaW5nIHBhdGNoOgo+ID4gICAgIHBhdGNoaW5n
IGZpbGUgQ01ha2VMaXN0cy50eHQKPiA+ICAgICBIdW5rICMxIHN1Y2NlZWRlZCBhdCA0NyB3aXRo
IGZ1enogMSAob2Zmc2V0IC01IGxpbmVzKS4KPiA+ICAgICBwYXRjaGluZyBmaWxlIGNtYWtlL2Nv
bXBpbGVyRmxhZ3MuY21ha2UKPiA+ICAgICBIdW5rICMxIEZBSUxFRCBhdCA0NCAoZGlmZmVyZW50
IGxpbmUgZW5kaW5ncykuCj4gPiAgICAgMSBvdXQgb2YgMSBodW5rIEZBSUxFRCAtLSBzYXZpbmcg
cmVqZWN0cyB0byBmaWxlIGNtYWtlL2NvbXBpbGVyRmxhZ3MuY21ha2UucmVqCj4gPiAgICAgbWFr
ZVsxXTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjIyNzogL2hvbWUveW1vcmluL2Rldi9i
dWlsZHJvb3QvTy9idWlsZC9leGl2Mi0wLjI3LjQvLnN0YW1wX3BhdGNoZWRdIEVycm9yIDEKPiA+
ICAgICBtYWtlOiAqKiogW01ha2VmaWxlOjIzOiBfYWxsXSBFcnJvciAyCj4gSSBjYW4ndCBmaXgg
aXQgYXMgaXQgaXMgZHVlIHRvIGdpdCBzZW5kLWVtYWlsIHdoaWNoIHJlcGxhY2VzIExGCj4gbGlu
ZS1lbmRpbmdzIGJ5IENSTEYuCgpBaCwgaW4gc2VlLiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4K
ClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAg
WWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwg
RXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5
OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhl
cmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3li
b3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
