Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25928C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77D4C610A3
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77D4C610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48DBA824EF;
	Sat, 11 Sep 2021 20:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1kkDMfUlCqI; Sat, 11 Sep 2021 20:35:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6E3181C6F;
	Sat, 11 Sep 2021 20:35:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4C4A1BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3F9D607D0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YmRe6MxKxOEP for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:35:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DB8F605E5
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:35:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 58F8BB00535;
 Sat, 11 Sep 2021 22:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631392510;
 bh=pS+kO9lMcwcwxYy3/NHoNIS+YpvyGiaxE7xgVfM0Yjw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LnfXtmN4xhwCvs7QkyaSlO8XX56L4+nkHharqh8TPjJsnEoLotimOPx4Yur/npFtJ
 QjtKe3vWXTkxjhtKxPquB6EZgWPmbCDUSIOkBCGxh5O273fWZBTXeTWH4MWlPH1Cre
 lO8O5lVjdk3qcK6QxMpUJdp9Hw+moMLiHEtALFyH8nzFYhESPml1lxowbjnPI1P/Dy
 hSXSRTWG7Prr4eNwRrwCmWwUZNoUik459F5ukJJwAU90d8BoHtFidcNDRl8ingz7iS
 eOC6443oRZVfqSpBRRo2/K9dy2wkkR8Ly14+pneQ0xGQAvV9KHGPTrXZZnr0ZP5kyB
 vT+8mdHRpOEBw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 22:35:04 +0200
Date: Sat, 11 Sep 2021 22:35:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210911203504.GX1053080@scaer>
References: <20210908164536.474998-1-fontaine.fabrice@gmail.com>
 <20210911125500.GN1053080@scaer>
 <CAPi7W82x1VFV2Lb+=m=7fhzV7MDc0743TjkDN9n0nXNYefPUsg@mail.gmail.com>
 <20210911161614.GR1053080@scaer>
 <CAPi7W81wz0Tr1wtV0BLTEg3FfT+6bs0A2p=7MYKJ+WSp4CUtKg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W81wz0Tr1wtV0BLTEg3FfT+6bs0A2p=7MYKJ+WSp4CUtKg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/uboot-tools: fix MKIMAGE_ARCH handling
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMS0wOS0xMSAxODoyNSArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgc2FtLiAxMSBzZXB0LiAyMDIxIMOgIDE4OjE2LCBZYW5uIEUu
IE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+ID4gT24gMjAyMS0w
OS0xMSAxODowNyArMDIwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4gPiA+IExl
IHNhbS4gMTEgc2VwdC4gMjAyMSDDoCAxNDo1NSwgWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4x
OTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPiA+ID4gPiBPbiAyMDIxLTA5LTA4IDE4OjQ1ICswMjAw
LCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiA+ID4gPiA+IEZpeCBNS0lNQUdFX0FS
Q0ggaGFuZGxpbmcgdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlOgo+ID4gWy0t
U05JUC0tXQpbLS1TTklQLS1dCj4gSSdtIHdvbmRlcmluZyBpZiB0aG9zZSBidWlsZCBmYWlsdXJl
cyBhcmUgcmFpc2VkIGJlY2F1c2Ugb2YgdG9vbGNoYWluIGFsaWFzZXMuCj4gSW5kZWVkLCBpdCBz
ZWVtcyB0aGF0IG9wZW5yaXNjIGNhbiBiZSBkZWZpbmVkIGFzIGEgYWxpYXMgdG8gb3IxazoKPiBo
dHRwczovL2dpdGh1Yi5jb20vdS1ib290L3UtYm9vdC9ibG9iL2JiY2FjZGY0Y2QyM2YyZTVkZWI5
ZWY5MTYwOTZjOTU2Yzk1NTI0M2QvdG9vbHMvYnVpbGRtYW4vUkVBRE1FI0wxOTYKPiBodHRwczov
L2dpdGh1Yi5jb20vdS1ib290L3UtYm9vdC9ibG9iL2E5NGFiNTYxZTJmNDlhODBkODU3OTkzMGU4
NDBiODEwYWIxYTEzMzAvdG9vbHMvYnVpbGRtYW4vYnNldHRpbmdzLnB5I0w4OAo+IAo+IEJ1dCBJ
IGRpZG4ndCBmaW5kIHRoZSByb290IGNhdXNlIG9mIHRoZXNlIGJ1aWxkIGZhaWx1cmVzLCBwZXJo
YXBzIHRoZQo+IHRvb2xjaGFpbi1hbGlhcyBpcyBvdmVyd3JpdHRlbj8KPiBTbyBJIGdhdmUgdXAg
YW5kIHRob3VnaHQgdGhhdCB0aGlzIHBhdGNoIHdhcyBhbiBhY2NlcHRhYmxlIGxvbmctdGVybSBz
b2x1dGlvbi4KCkFncmVlZC4gSSBiZWxpZXZlIHRoZSBwYXRjaCBkb2VzIHRoZSBjb3JyZWN0IHRo
aW5nIGFuZCBpcyBzb3VuZC4gS25vd2luZwp0aGUgdW5kZXJseWluZyBjYXVzZSB3b3VsZCBoYXZl
IGJlZW4gbmljZSwgYnV0IEknbSBub3QgZ29pbmcgdG8gY29tcGxhaW4KdG9vIG11Y2guIDstKQoK
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlz
dHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
