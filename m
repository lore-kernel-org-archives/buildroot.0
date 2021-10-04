Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA67C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:15:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32CE561166
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32CE561166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0151E4085C;
	Mon,  4 Oct 2021 12:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJev3FUle6wx; Mon,  4 Oct 2021 12:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BEB940867;
	Mon,  4 Oct 2021 12:15:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 656741BF330
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 623284071B
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGVGMdZvWb0R for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 12:15:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE8054051D
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 12:15:08 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y26so70941825lfa.11
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 05:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qH/fPf6y2pZ2Xj+Ub4zGz4gCWjbMtt//uAEkAL5Aq+A=;
 b=RmCZS7T01eJJ6yPLiZCjHe9pyIDD8q1+CJ7zk+sOQMhYu5ImR+ErGDcCoPbiTTFx/i
 GIWKQxB/TvOyLcRvtEXfDtkd9DRdHw7buauP5JnMV3lkjhsxPM1DbmSzm5ijuv5TClYX
 Gozk+tQuCOhg83jbnX16dFx/3FvzEL4lEEM8l6edg2vnZc9JhOVYvsDcp6jgfyvYQN2E
 THrKJdOP8Zy0WOLy1rMzP6NgD/lXZayZY3LhkMXq/0ifqAYD3rzKAk0G1GXhIPEEY5kN
 rQtAtp1aQku3zp9SRU5HOrLvmxj/3gWPzkUhmJFLyQtqWKs7TU1UzRQDU9Dxj9Vy3Ar/
 3dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qH/fPf6y2pZ2Xj+Ub4zGz4gCWjbMtt//uAEkAL5Aq+A=;
 b=LIO+puKXGXpnl5eBvdoGhnox/7iaP1BbUYQkKxOhwa1o9cLcAId8CpQOXr1AahL06R
 1rWGi/ZvIlmYIavT2JPMViikg+tP3keSV2cxgINO/N5NxtUKz+6eZmdoH+p22MaMBx3f
 TUESSwzci4bPv+rjHKdeTAyg1xgr2SbAI5YYA84VWLZfFPoVOQK28bFj8JQnKgyuY1xP
 z9kPcwsiiUZ9UeBJ9ekxYJ1dc4iAKMW4VrL1165y/XP8F8d6Igey/K372qEbuLUxI1Fp
 jViKEINov9oi7QgaLmNSxXxtvynL6yQtYXzdif1bkyEgnpWt3wtF8liQ6OejesFa4vAZ
 GTfA==
X-Gm-Message-State: AOAM532Gz8XhUsL9S/An451hedB8vU2ri5Pvq7D8AkH8HHMIxBnTMGoy
 2awJXnfp3sDipP1/2PoxCzuNrMc/cMnrU0458zSBFkf+TK4=
X-Google-Smtp-Source: ABdhPJyu3bLzmycVVtDclGgU71njtRFez7cIJ3V/xIUgijjLwRIIuhEXYYXTMJH0hUuEVBtU2u8MAeo59Xb20zLcVME=
X-Received: by 2002:a2e:4812:: with SMTP id v18mr15458228lja.213.1633349706597; 
 Mon, 04 Oct 2021 05:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210919100842.2071860-1-fontaine.fabrice@gmail.com>
 <874k9xj8iy.fsf@dell.be.48ers.dk>
In-Reply-To: <874k9xj8iy.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 4 Oct 2021 14:14:17 +0200
Message-ID: <CAPi7W83=ocwDu6LUCx9A16R2Q8zm1+SPbL1kb_PQySbOrU+Giw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptopp: bump to version 8.5.0
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
Cc: Julian Scheel <julian@jusst.de>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbHVuLiA0IG9jdC4gMjAyMSDDoCAxNDowOSwgUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3Jz
Z2FhcmQuY29tPiBhIMOpY3JpdCA6Cj4KPiA+Pj4+PiAiRmFicmljZSIgPT0gRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyaXRlczoKPgo+ICA+IGh0dHBzOi8v
d3d3LmNyeXB0b3BwLmNvbS9yZWxlYXNlODUwLmh0bWwKPiAgPiBodHRwczovL3d3dy5jcnlwdG9w
cC5jb20vcmVsZWFzZTg0MC5odG1sCj4KPiAgPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRh
aW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPgo+IEhtbSwgc28gOC40LjAgcmV2ZXJ0
ZWQgdGhlIHNlY3VyaXR5IGZpeCBpbiA4LjMuMD8gV2hhdCBkbyB3ZSB0aGVuIGRvPwo+IEJ1bXAg
dG8gOC41LjAgaW4gYWxsIHN0YWJsZSBicmFuY2hlcz8KSSB3b3VsZCBhZHZpc2UgdG8gYnVtcCB0
byA4LjYuMCBpbiBhbGwgc3RhYmxlIGJyYW5jaGVzIGFzIDguNi4wIGlzIGEKc2VjdXJpdHkgcmVs
ZWFzZSB0aGF0IGNsZWFycyBDVkUtMjAyMS00MDUzMC4KPgo+IC0tCj4gQnllLCBQZXRlciBLb3Jz
Z2FhcmQKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
