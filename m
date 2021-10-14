Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66140C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:27:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D673610F9
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D673610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D96B940467;
	Thu, 14 Oct 2021 20:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rMvCWDNyFiDO; Thu, 14 Oct 2021 20:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 057C84028E;
	Thu, 14 Oct 2021 20:27:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E29DD1BF599
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF2A783231
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-qi3KNhKf7c for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 20:27:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1045983187
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 20:27:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cd49:1327:25a7:1fb2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CFD7A5FF13;
 Thu, 14 Oct 2021 22:27:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634243241;
 bh=CqtsbeSLNVVS6wpXCeMD8T7W/Zw7jNZrUbW9Z9Lq36g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HmjOZ0gtqM92TFg7X2niwsp1Xr8L4roNjjekYnHM8y+1cB7exo0vDdc2SpXkewTkB
 755vsa8dcQ4sZW0X9NXzybXFsHD/h6LjuNyZkmOSZU97dttakDsvJx1TNuqtcHszyv
 e4Z9Czg69jeWaYwgXh33Y8B6Y3FuCyXQKJU+LpZsjL7v0G1onYnvTgTvJRhT3uSDcD
 1lRS3tX4A4khUU+b8AKYHS1fUWsomzk0/DaWaS7hMO3gpY02MCY1G1c9OPaHRO6+Ru
 lns6QxArNCiEIviQFM7xP2+teUD3JOvkoON5ov3Gc6Voq3IagEd9rq174X3ujUi11U
 h0+OBVtZPZf7Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 14 Oct 2021 22:27:12 +0200
Date: Thu, 14 Oct 2021 22:27:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Message-ID: <20211014202712.GD368016@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-3-kory.maincent@bootlin.com>
 <20211006181104.GD2081069@scaer>
 <20211007102318.556f7fc2@kmaincent-XPS-13-7390>
 <20211007095326.GA2814782@scaer>
 <20211007144351.629d2de0@kmaincent-XPS-13-7390>
 <20211007162931.GH2081069@scaer>
 <20211011122736.3b0df127@kmaincent-XPS-13-7390>
 <20211014200207.GC368016@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014200207.GC368016@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 2/7] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
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
Cc: thomas.petazzoni@bootlin.com, Adam Duskett <aduskett@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMTAtMTQgMjI6MDIgKzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bh
a2UgdGh1c2x5Ogo+IFNpZGUgbm90ZSwgdW5yZWxhdGVkIHRvIHRoaXMgaXNzdWU6IHdlIGhhdmUg
YSBwYXJhbGxlbCBidWlsZCBpc3N1ZSB3aXRoCj4gZ3J1YjI6ClstLVNOSVAtLV0KPiBCdXQgZm9y
dHVuYXRlbHksIGl0IGxvb2tzIGxpZWsgaXQgaXMgZml4ZWQgd2l0aCB1cHN0cmVhbSBjb21taXQK
PiA0MmY0MDU0ZmFmM2MgKE1ha2VmaWxlOiBNYWtlIGxpYmdydWIucHAgZGVwZW5kIG9uIGNvbmZp
Zy11dGlsLmgpLgoKQW5kIG9mIGNvdXJzZSwgc2luY2UgdGhpcyBjb21taXQgdG91Y2hlcyBNYWtl
ZmlsZS5hbSwgYnV0IHdlIGF2b2lkIHZlcnkKaGFyZCByZS1ydW5uaW5nIGF1dG9yZWNvbmYgZm9y
IGdydWIyLCB3ZSBhbHNvIG5lZWQgdG8gcGF0Y2ggTWFrZWZpbGUuaW4KKHRoZSBzYW1lIGh1bmsg
YXBwbGllcyBxdWl0ZSBPSyB0byBib3RoIGZpbGUsIGZvcnR1bmF0ZWx5KS4KClJlZ2FyZHMsCllh
bm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJ
TiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNw
aXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0t
LS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwK
fCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAg
IHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
