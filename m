Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DDCC433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 14:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EAB340A43;
	Thu,  3 Feb 2022 14:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7j8FsNEXrpKR; Thu,  3 Feb 2022 14:25:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95DF2403C4;
	Thu,  3 Feb 2022 14:25:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED9CC1BF33B
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 14:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC94382A56
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 14:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id euzk2CHDKF_F for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 14:25:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7E3A827CA
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 14:25:19 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Fd2znagPmNVvLFd2zn1u2B; Thu, 03 Feb 2022 15:25:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643898318; bh=4FkAEBWuRf6Ex683kYFvcEVoD1UKpzcjrzyncOhhMMw=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=BKUz3VaiqnAUtsAOg3IERKAH8i6Ie9L0qu5hdzL5wN9pKaPHWAj1qtnVaZtE4JAok
 E3M2aHteGBgR8muF6mSt3ScQxSCeYEh9RfgsKN7FgTLt0l4tWPU+jjNqkcMHSYt1eT
 hHlUycuzscrOE4qy8Szsfg6nHWsQQ9l22yC2Zlv/HQuLpT8ZEGU0qXCRXc1qvJWAwd
 G2zSn82oijBKPvYjrfwhLRuIgWLFuyFKUi5iDhMMlulrv0LLS7/H4NNYWBiAWWd5jp
 V3RhO/w5hY+Q6s8JidD2hV02XL246/ZP0oBS5ljcfiMiKAOgOp0zDbgOUhP/VMO3xr
 5xLy4lsDR+1Tg==
Message-ID: <1422bf74-c342-fe70-5c2b-43d526118590@benettiengineering.com>
Date: Thu, 3 Feb 2022 15:25:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>
References: <SJ0PR02MB77581316BAA24C0BB61FE03FD7289@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <CDDC50C0-5680-4059-9D5F-0D2AA5F4D462@benettiengineering.com>
 <SJ0PR02MB77589276FD4E46C53D396A60D7289@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <SJ0PR02MB77589276FD4E46C53D396A60D7289@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-CMAE-Envelope: MS4wfJWVXbcgGg1vN80VwSb2K3M0q0c0pu/0RFr4o4yUuOQBBpzLmeSUD4FJDLNqAVpyEgmkDFYnNAlLcc224AyGZBRB7lmk3wbxRoFiRIto+AdIlWF+Tz3y
 JeIK7Qb0v6mXL9EAmhFBWZkUqFgQpz76F0qB0NsI3aEGB9wwUi1voXwOZw/SoXNKFAmvQ4oAKd3JPBfr8kKBwrJU8reCp+I6lhOG1p762jQ73UFLzl25VIDg
 gX9uidLUoMPW0gx/XRfLt9FK/nSmx9sXOoBNKY4znBo=
Subject: Re: [Buildroot] [PATCH 1/1] configs/zynqmp_zcu10x: Bump
 ATF/U-Boot/Linux to Xilinx 2021.2
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDMvMDIvMjIgMTU6MDksIE5lYWwgRnJhZ2VyIHdyb3RlOgpbIFNOSVAgXQoKPj4gWWVzIGl0
IGRvZXMgd29yay4gT25seSByZW1lbWJlciB0byBzZXQgeW91ciBjbGllbnQgdXNpbmcgcGxhaW4t
dGV4dCBvbmx5LiBJ4oCZbSBvbiBtb2JpbGUgbm93IHNvIHByb2JhYmx5IG15IGFuc3dlciBhbmQg
eW91cnMgd2lsbCBiZSBpbiBodG1sLgo+PiBCdXQgd2UgbmVlZCBwbGFpbi10ZXh0LCBwbGVhc2Ug
Y2hlY2sgeW91ciBlbWFpbCBjbGllbnQgYW5kIHNldCBwbGFpbi10ZXh0IGJ5IGRlZmF1bHQuCj4g
Cj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwsIG15IHJlcGxpZXMgYXJlIGFscmVhZHkgaW4gcGxhaW4t
dGV4dCBieSBkZWZhdWx0LiAgTGV0IG1lIGtub3cgaWYgeW91IGNhdGNoIGEgbWVzc2FnZSB3aGVy
ZSB0aGF0IGlzIG5vdCB0aGUgY2FzZS4KPiAKCkFoIHNvcnJ5LCBJIHdhcyBvbiBtb2JpbGUsIEkn
dmUgY2hlY2tlZCBvbiBQQyBub3cgYW5kIHlvdSdyZSBzZW5kaW5nIGluIApwbGFpbi10ZXh0IG1v
ZGUuCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkJlbmV0dGkgRW5naW5lZXJpbmcg
c2FzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
