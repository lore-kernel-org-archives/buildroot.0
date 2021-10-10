Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C33BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 15:07:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A96C60F24
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 15:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A96C60F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3492780F75;
	Sun, 10 Oct 2021 15:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_bsHtJj-4fg; Sun, 10 Oct 2021 15:07:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9367380EDD;
	Sun, 10 Oct 2021 15:07:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D7751BF2F3
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 15:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D0D480EDD
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 15:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8dKioPEjEoj for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 15:07:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48A0280EC5
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 15:07:02 +0000 (UTC)
Received: from smtpclient.apple ([151.18.149.226])
 by Aruba Outgoing Smtp  with ESMTPA
 id ZaPkmajzoXvvIZaPkmu3qo; Sun, 10 Oct 2021 17:07:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633878421; bh=dLycwT6qTm4xrAw31eeX1Zo2rCTHdj2ukuxz97S771s=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=DElCLOiL/n3FtK8goP25NlGZ8bwdbAZyoCB2kuHEApdds4rp71numJPHG3EhCUogD
 9hQ0E1zJ8rup54ThvHAUnbq9eR0eRH75T97u3dje+D8yixK8vkqs8hfRuSAaxXsQKx
 So7nGy0t0uMfdkZjjmUWJW1xKQCFseQbbvNGIt477X8VPRu60IOFmcnvBkZUUX+FNK
 jZWYT0UuTjv2RojNYGPR4SQHfRdZJOQLG8FDqxWLrMpNmRqkm/BDShuoHFYctCI5Of
 WTGc29CGZmx5xs7Libi8O65bkJg+iCTBeuh//2fkLsn476D4gPYb/pp5S/ypnq17t2
 RZUH0eDaiEpIA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 10 Oct 2021 17:06:59 +0200
Message-Id: <7AF20EC5-910D-4A55-8B1B-C3686516BCBA@benettiengineering.com>
References: <20211010160318.6fab0072@windsurf>
In-Reply-To: <20211010160318.6fab0072@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfBEzYoJ10PljgKM+fZPn6OuOv+zCoVM1IA/THkxvCnm9GX4updYbeJwPAQEg2C+O21EG/TqL7rIv8U5bBNUaptber/z9/dRIXrBwKbwfhiNT37NlH2zD
 Uy+YdnVuZ2Q05xtsPL3QpUmC1/QNgkfgcGLTB38Hd3FnXx8jd/mhtMjMf+V7quMELk2zl2SW9yhNaY5Ovw8qthfktywms+wNjfBOHQuKdHnoISZSJj9V5X8u
 fr8MFsM/rbTSeHfrZSu7BOHRlgFtLa4NVoeOjL0Aq1n1I1wMerc0E/MzTDyymSP2lXPZ3KMRLspEl++qkgx0vymczu/bQ5GoGnVrcYbqC4d//CjqiZqfiCOp
 t/9Jajd8FXH0FSQqoDa80KhjHox/Dj+R+Pj2lasB+sTnCH63U6xw6FSaN9QwNZWE0Z16jpqA
Subject: Re: [Buildroot] [PATCH 2/2] package/gnuradio: disable package if
 affected from gcc bug 43744
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDEwIG90dCAyMDIxLCBhbGxlIG9yZSAxNjowMywgVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu79PbiBT
dW4sIDEwIE9jdCAyMDIxIDEwOjIzOjA3ICswMjAwCj4gUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBr
b3JzZ2FhcmQuY29tPiB3cm90ZToKPiAKPj4gV2hhdCBhYm91dCB0aGUgcmV2ZXJzZSBkZXBlbmRl
bmNpZXMsIEUuRy4gZ3FyeD8KPj4gCj4+IHBhY2thZ2UvZ3FyeC9Db25maWcuaW46IHNlbGVjdCBC
UjJfUEFDS0FHRV9HTlVSQURJTwo+IAo+IEdhYWguIEkndmUgc3RvcHBlZCByZXZpZXdpbmcvbWVy
Z2luZyBCdWlsZHJvb3QgcGF0Y2hlcyBmb3IgdG9vIGxvbmcsCj4gYW5kIEkndmUgZm9yZ290dGVu
IGV2ZW4gdGhlIG1vc3QgYmFzaWMgY2hlY2tzLi4uIEknbGwgdHJ5IHRvIGJlIG1vcmUKPiBjYXJl
ZnVsLgo+IAo+IEdpdWxpbzogSSBzdXBwb3NlIHlvdSB3aWxsIHByb3ZpZGUgYSBmb2xsb3ctdXAg
cGF0Y2ggdGhhdCBhZGRyZXNzZXMgdGhlCj4gcmV2ZXJzZSBkZXBlbmRlbmNpZXM/CgpTdXJlLCB0
b25pZ2h0IEnigJltIGdvaW5nIHRvIHNlbmQgYSBwYXRjaC4gRXZlcnkgdGltZSBJIGZvcmdldCB0
aGUgcmV2ZXJzZSBkZXBlbmRlbmNpZXMgOi0vCgpHaXVsaW8KCj4gCj4gQmVzdCByZWdhcmRzLAo+
IAo+IFRob21hcwo+IC0tIAo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJv
b3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmlu
Zwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
