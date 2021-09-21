Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650D5C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:52:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC43D60F70
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC43D60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73179406DD;
	Tue, 21 Sep 2021 19:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x7iLq94kMdUQ; Tue, 21 Sep 2021 19:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2AFE406D2;
	Tue, 21 Sep 2021 19:52:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C096A1BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B048B40660
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q2Cd08k0sW6i for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:52:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4212406D2
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:52:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9c0d:ff50:12ec:5b50])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D4B03B0051E;
 Tue, 21 Sep 2021 21:52:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632253932;
 bh=/8AGxvROiulSGZl8J4znQn9My+0TVFRu7ezMJkDMXRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BpNZP4NUO9f3TzaGjxN2bV2M48sclh42u2CTc5RqHOIjShUKE9/3CgCC145pNieBi
 zHsmNP4885FQLXhy30ZSAuU77U3iSqUALRVYQF1TBkhISje8lAoxdDscOT0qbrxu/A
 oY8xaAjXrLg1DClMwzdP03oH1QVhPAnsM6jOLf3/OXeSrGoMQqMftxLnWW72/q7IcZ
 +MIriY4taqS5mezMr2K+lxRVAg0HvTs/V1SoM0L3mbmEs8Hq0iXWuDDMBTjmf/jOJM
 pmHKtPTWdG4yqAyB2KIx9c/8GXSxr7hCTZtT/tp9hQiuzMON8Jk7m2TcLZuNCNBHrt
 iEAcj0T9wfvRg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 Sep 2021 21:52:03 +0200
Date: Tue, 21 Sep 2021 21:52:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Message-ID: <20210921195203.GB3176@scaer>
References: <20210921132829.56405-1-kory.maincent@bootlin.com>
 <20210921132829.56405-3-kory.maincent@bootlin.com>
 <20210921153609.GV1053080@scaer>
 <20210921204144.3bce77e3@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210921204144.3bce77e3@kmaincent-XPS-13-7390>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 2/6] fs/iso9660: add support to Grub EFI
 bootloader in the image
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMDktMjEgMjA6NDEgKzAyMDAsIEvDtnJ5IE1haW5jZW50IHNw
YWtlIHRodXNseToKPiBPbiBUdWUsIDIxIFNlcCAyMDIxIDE3OjM2OjA5ICswMjAwCj4gIllhbm4g
RS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6ClstLVNOSVAtLV0KPiA+
ID4gKwktYiAkKFJPT1RGU19JU085NjYwX0JPT1RfSU1BR0UpCj4gPiA+ICtlbHNlIGlmZXEgKCQo
QlIyX1RBUkdFVF9ST09URlNfSVNPOTY2MF9FRklfQk9PVExPQURFUikseSkgIAo+ID4gTm90ZSB0
aGF0IEJSMl9UQVJHRVRfUk9PVEZTX0lTTzk2NjBfQklPU19CT09UTE9BREVSIGFuZAo+ID4gQlIy
X1RBUkdFVF9ST09URlNfSVNPOTY2MF9FRklfQk9PVExPQURFUiBhcmUgbXV0dWFsbHkgZXhjbHVz
aXZlLCBieQo+ID4gZGVmaW5pdGlvbiwgYnV0IHdlIGFsc28ga25vdyBhdCBsZWFzdCBvbmUgd2ls
bCBiZSBzZXQsIGFsc28gYnkKPiA+IGRlZmluaXRpb24uCj4gPiBTbywgdGhlIGVsc2UgY2xhdXNl
IGNhbiBiZSBhIHNpbXBsZSBvbmUsIHdpdGhvdXQgdGhlIGlmZXEuCj4gCj4gZG9oISB5b3UgcmFp
c2UgYSBwb2ludC4gSW4gZmFjdCBpbiB0aGUgY3VycmVudCBjb25maWd1cmF0aW9uIHRoZXkgYXJl
IG5vdAo+IG11dHVhbGx5IGV4Y2x1c2l2ZS4gSSBuZWVkIHRvIGZpeCB0aGF0IHdpdGggYSBLY29u
ZmlnIG1lbnUuCgpBaCwgcmlnaHQhIEFuZCB0aGlzIHBhdGNoIGlzIG5vdCAoeWV0KSBhYm91dCBt
YWtpbmcgYSBmdWxseSBoeWJyaWQKaW1hZ2UsIHNvIHlvdSAqaGF2ZSogdG8gaGF2ZSB0aGUgdXNl
ciBjaG9vc2Ugd2hhdCBib290IHBheWxvYWQgdG8gdXNlLApwcm9iYWJseSBzb21ldGhpbmcgbGlr
ZToKCiAgICBjaG9pY2UKICAgICAgICBib29sICJCb290IHBheWxvYWQiCgogICAgY29uZmlnIEJS
Ml9UQVJHRVRfUk9PVEZTX0lTTzk2NjBfQklPU19CT09UTE9BREVSCiAgICAgICAgYm9vbCAibGVn
YWN5IGJpb3MiCiAgICAgICAgZGVwZW5kcyBvbiBzb21ldGhpbmcgSSBndWVzcy4uLgoKICAgIGNv
bmZpZyBCUjJfVEFSR0VUX1JPT1RGU19JU085NjYwX0VGSV9CT09UTE9BREVSCiAgICAgICAgYm9v
bCAiVUVGSSIKICAgICAgICBkZXBlbmRzIG9uIHNvbWV0aGluZyBlbHNlIEkgZ3Vlc3MuLi4KCiAg
ICBlbmRjaG9pY2UKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVND
SUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0
d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwK
fCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAg
IHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwg
Xy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
