Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75BCC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 19:24:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3558160F6C
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 19:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3558160F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 048D842561;
	Fri, 17 Sep 2021 19:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuPI0bG8z1-s; Fri, 17 Sep 2021 19:24:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DB964255B;
	Fri, 17 Sep 2021 19:24:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 383CA1BF350
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 19:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27D60421D2
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 19:24:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AC83Op5VK2nv for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 19:24:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A237A4255B
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 19:24:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4db3:5a06:f3b2:1f85])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 382085FF9D;
 Fri, 17 Sep 2021 21:24:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631906666;
 bh=mpjl6+JEsGj8hrxCpTotTBbp//OttDoiucaPGkrIzHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=puKMPE/JoDa8fxQVQpB1BVx6N23xbnu+atPSYjQAHgGyi9sWNKtjkOBhEy/VB0Yaw
 9DOwfOnhra1Zr/9zSqCX5ikftAxxS/vbwx3jSyRQsPQQKUjCyxNvZYPXbIxLshh6FW
 1uioEiCyingq7GfjVBJXi91NeGUQmD3W0bd6mfxQ/J/MhuAsX3y/tXVJp4+TapEixK
 HXshZ4V/AFnwTgBPh56fkj/yKx8jKyzsndlCFL2fhYZmTC2z0yH5LYXs2WFI2zLbCg
 wHtKiY9DVmTwdNKh9b3AigMxrddbpugpPqUvy1Pk9b4sdyIqQTWjKx0FbDqIrPXCQQ
 gpadnEtTDnojw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 21:24:17 +0200
Date: Fri, 17 Sep 2021 21:24:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210917192417.GT1053080@scaer>
References: <20210914093457.1389174-1-kory.maincent@bootlin.com>
 <20210914093457.1389174-8-kory.maincent@bootlin.com>
 <KzkhQpdQv77nQ-S-fjvQle8wMkZhXcU-JWX5SFM4jE6BmEvO24yL_RlALbjiJ5JuOokHs3-WHnc1R32suKq42HrQnqI2Sds16WhnVUGyoEg=@senzilla.io>
 <20210917161443.6962f080@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210917161443.6962f080@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 7/8] package/edk2-images: new package
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

VGhvbWFzLCBEaWNrLCBBbGwsCgpPbiAyMDIxLTA5LTE3IDE2OjE0ICswMjAwLCBUaG9tYXMgUGV0
YXp6b25pIHNwYWtlIHRodXNseToKPiBPbiBGcmksIDE3IFNlcCAyMDIxIDEzOjQzOjM4ICswMDAw
Cj4gIkQuIE9sc3NvbiIgPGhpQHNlbnppbGxhLmlvPiB3cm90ZToKPiA+IE9uIFR1ZSwgU2VwIDE0
LCAyMDIxIGF0IDExOjM0LCBLb3J5IE1haW5jZW50Cj4gPiA8a29yeS5tYWluY2VudEBib290bGlu
LmNvbT4gd3JvdGU6Cj4gPiA+IEluIG9yZGVyIHRvIGFkZCBzdXBwb3J0IGZvciBFRkkgYm9vdCBm
cm9tIHRoZSBlbXVsYXRvciwgdGhpcyBwYXRjaAo+ID4gPiBhZGQgYSBwYWNrYWdlIHRvIGRvd25s
b2FkIHRoZSBFRkkgQklPUyBwcmVidWlsdCBiaW5hcnkgZnJvbToKPiA+ID4gaHR0cHM6Ly93d3cu
a3JheGVsLm9yZy9yZXBvcy9qZW5raW5zL2VkazIvICAKPiA+IFNpbmNlIGEgZmV3IG1vbnRoc1sx
XSBpdCdzIGJlZW4gcG9zc2libGUgdG8gYnVpbGQgRURLMiBmcm9tIHNvdXJjZSBpbgo+ID4gQnVp
bGRyb290LiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBleHRlbmQgdGhlIGV4aXN0aW5nIHBhY2th
Z2UKPiA+IGluc3RlYWQgb2YgZHVwbGljYXRpbmcgdGhlIGVmZm9ydCBieSBtYWludGFpbmluZyB0
d28gcGFja2FnZXM/Cj4gPiAKPiA+IFsxXToKPiA+IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQv
YnVpbGRyb290L2xvZy9ib290L2VkazIvZWRrMi5oYXNoP3Nob3dtc2c9MQo+IAo+IFdoZW4gS8O2
cnkgcGFja2FnZWQgZWRrMi1pbWFnZXMsIEkgaW5kZWVkIHRob3VnaHQgb2YgdGhlIGZhY3QgdGhh
dCB3ZQo+IGNhbiBub3cgYnVpbGQgRURLMiBmcm9tIHNvdXJjZS4gVGhhdCBiZWluZyBzYWlkLCB0
byBxdWlja2x5IGdldCBhbiBFRkkKPiBCSU9TIGltYWdlIHRvIGRvIHRlc3RzIHVuZGVyIFFlbXUs
IGEgcHJlLWJ1aWx0IEVESzIgaW1hZ2UgaXMgcXVpdGUgbmljZS4KPiAKPiBJJ2xsIGxldCBvdGhl
cnMgY29tbWVudCBvbiB0aGlzLgoKSSBzZWUgbm8gcmVhc29uIHRvIGhhdmUgYSBwcmUtYnVpbHQg
dmVyc2lvbiBvZiBlZGsyLgoKU28gSSBhZ3JlZSB3aXRoIERpY2s6IHdlIHNob3VsZCBiZSB1c2lu
ZyB0aGUgZWRrMiBib290IHBhY2thZ2Ugd2UKYWxyZWFkeSBoYXZlIGluLXRyZWUuCgpSZWdhcmRz
LApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4g
TU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBj
b25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAv
IENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAt
LS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5v
ICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJ
TCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
