Return-Path: <SRS0=IJqM=OO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3113C433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 20:28:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E26611C8
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 20:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23E26611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE763402F1;
	Fri, 24 Sep 2021 20:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0XVBF7qUy3kD; Fri, 24 Sep 2021 20:28:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3937040294;
	Fri, 24 Sep 2021 20:28:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCB041BF865
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 20:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7FFB400D4
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 20:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfakHoPnLd5K for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 20:28:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF80040168
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 20:28:31 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b20so45402089lfv.3
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RFLAHWwseNcjj6pKJQJ7lalWp6sz80+4/RojJihUraY=;
 b=Y/Z181yX7hVRgsola9BBK9Fi4wHFslvsMHwCxu/TE798ITeJung9OTTKrk2YWQJAVf
 pwa/LpP9zdb0DgArYDutKWpmzpbHq8D3i4IVZfYcmf/ZiKDiJ/oBu+9vn2jO7hBOlj7H
 cuQWDePdtE1dYcEO1cNSM5DXLm5RlxODU1t4r86uxLjVE7W/U96dJuJS6Ng06+dARsIq
 bblTycp+MKAXEPiafv+1/U9D8sotF6BfD5WAuKdt5uiZ96r0e97VqIsWZzLxhCodd3Hn
 JryMFRiUqIqQp7IddDVLpnbYFEQX8pIShj8XQg2i1+2R2u8os13zgNdBzhIVFxjtyEFr
 AVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RFLAHWwseNcjj6pKJQJ7lalWp6sz80+4/RojJihUraY=;
 b=pH3fnn6xYM8suKI/NAQh0dqi4z1Ztzz5tqTGut+HSlWuLunsvq7aRw5PKewQaplELT
 nk0f7TTVfx/OwHJet5z3YDIkLvXAiRJgKN6154bzmi6OwuYvhFyw2EFQbVTclNas8WVm
 0HdVDz8CINPSGrCTp9ltPIZhsvSjc4HfTc9N/HIGDDG/Mz5PElvx0IUHmJWH9C0OAuuS
 E9HtQVTANldvq2ShwycQFYLvOdhnwXKkZiraiJemb4QuoiRupv+eFJycyCDx23a8vadq
 1mD4Ej247OYerFgo6MeCW3Z5r3IpZbCqpc/H+/CxGZIqWdqcGWeHgkrH9LoLSLW+LDbX
 aiOQ==
X-Gm-Message-State: AOAM5309bFoWc0t3tEHjfXKujAAdXAFJK2G/XjKEkGYh6XcnM93qjaWf
 jKxHos8YR5xtVY98E8F547WbNUGqRT3fyCiAy8E=
X-Google-Smtp-Source: ABdhPJzMUb7FiUoA6ohwU/Ae/4DrZS0i+xdeht5+YV8iA5+mE5fIKQmiUpSZQ/VHDjlM4SUWdzIH3w3mHhNDcr4EtGU=
X-Received: by 2002:a19:6a0b:: with SMTP id u11mr11514539lfu.383.1632515309771; 
 Fri, 24 Sep 2021 13:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-2-kory.maincent@bootlin.com>
 <20210923200640.GE3176@scaer>
In-Reply-To: <20210923200640.GE3176@scaer>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 24 Sep 2021 22:28:18 +0200
Message-ID: <CAK4VdL0E-SjUJ9b9B6VSFPdGfu7eR9yxMtx83q+c5DOukqe9xg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v3 1/7] board, boot,
 package: remove usage of startup.nsh in EFI partition
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
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Nicholas Sielicki <sielicki@yandex.com>, buildroot <buildroot@buildroot.org>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBTZXAgMjMsIDIwMjEgYXQgMTA6MDcgUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gS8O2cnksIEFsbCwKPgo+ICtEaWNrLCBFcmljbywg
R2Vyb21lLCBOaWNob2xhcywgUGV0ZXIsIFJvbWFpbjoKPgo+IFRoaXMgcGF0Y2ggdG91Y2hlcyBi
b2FyZHMgZm9yIHdoaWNoIHlvdSBhcmUgcmVnaXN0ZXJlZCBpbiB0aGUgREVWRUxPUEVSUwo+IGZp
bGUuIENvdWxkIHlvdSB2ZXJpZnkgdGhhdCB0aG9zZSBib2FyZHMgc3RpbGwgYm9vdCB3aXRoIHRo
aXMgcGF0Y2gKPiBhcHBsaWVkLCBwbGVhc2U/CgpUaGUgcGF0Y2ggbG9va3Mgb2sgYW5kIG9uIGEg
cXVpY2sgdGVzdCwgYm90aCBhYXJjaDY0X2VmaV9kZWZjb25maWcgYW5kCnBjX3g4Nl82NF9lZmlf
ZGVmY29uZmlnIGNvbnRpbnVlIHRvIHdvcmsgYXMgdXN1YWwuIFNvIGxvb2tzIGdvb2QgdG8KbWUu
CgpFcmljbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
