Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A71C433F5
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 21:18:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D75761181
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 21:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D75761181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E23CE404FD;
	Thu, 18 Nov 2021 21:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NKtnqqGD3u82; Thu, 18 Nov 2021 21:18:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 317BB404BD;
	Thu, 18 Nov 2021 21:18:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75D7E1BF397
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 21:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DCF660668
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 21:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6c9RgZNoctgI for <buildroot@lists.busybox.net>;
 Thu, 18 Nov 2021 21:18:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D562060664
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 21:18:42 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m27so32455962lfj.12
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 13:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IXJfwr/qpl9ofagy5AZkD7hfkpMpgsRB2aGUtIo2liI=;
 b=Gd+oEEbCq72uwL3bsqCCLsWtJLlU8aLm7fB2jzXLVOyjyoC58h/pg6a1F0gzqTY2bn
 AIwmhZnyKgCvDPtOBD/CAu6FwB52xIm1UvxfX7MHRrCh6UoCsqwWjfPA/oHxf/FKN7v0
 5ZDn2heVqcYA8XuFQXdTT5SG0JKhYDEai0NDbGWx7BIOFct4TZ3nYrf+k5kivOjpKjhR
 /o+CfYrKKYepYgAKdFxCUEtqgQFrjms33PDpS9ZpSZ0BymAXDc3322xWWZ6JA6niawb3
 J1jhZGhuR5pzth0fYm65CgduS0DcEcH0DTU7/t/kYgVB3VH8scgLmwgg+YgJMzuolaaR
 Bbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IXJfwr/qpl9ofagy5AZkD7hfkpMpgsRB2aGUtIo2liI=;
 b=ilWoYZtUdoyIiLkvvQ/c2Tx25oJWTrDb06YOfxKFg0Z67TodzjxvtWZAPlAByxqOAr
 3z7eJ9b59T0qTKZcoyKOH8NYBcPPffmDcU9O+BRJUBB4AJXd9DN4GfHX86PFVcjuDOGr
 gzeu61QwNnpLg6EdI7RseQk1gskzPqrbKYlog/lovpGgUAwrMxjnNq12n+KPLMdZ3jyZ
 fSxfRJqe/cCd7r6o78wOVbkTAL/At0e09V8BMNC8rOJMM0hKe3KvtMGKrrk0YMG90Wnh
 fZIIPoGwHTCNhnjXGom8XtS3GtgoeaGZA3kZauYFNnNpew88XkDF75XWMOoHB1fZ17oD
 HipQ==
X-Gm-Message-State: AOAM532jqjap19Rod3/r8eeDt8CdoUQXk+zpZ7+b0cnI/EofAPbDjsDb
 auCR2Wf48NdnNBE+fUi19HGRmGoYSRd9yulD7sCB/FTf
X-Google-Smtp-Source: ABdhPJzPFgQX/kfEd7bsTgf7NKOw792I+FGX14TtTWDyDRuIrc54XyLCJ9XPz+5xfvIOzOlQ67wKt0Yb20uBRdm9XJI=
X-Received: by 2002:a2e:a370:: with SMTP id i16mr20340261ljn.336.1637270320598; 
 Thu, 18 Nov 2021 13:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20211113163241.547023-1-fontaine.fabrice@gmail.com>
 <874k8atos5.fsf@dell.be.48ers.dk>
In-Reply-To: <874k8atos5.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 18 Nov 2021 22:16:21 +0100
Message-ID: <CAPi7W80e+E94i7g_Bv+8e18vAGHC3nf=oaZOxw7jKBeSze4bdA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: security bump to
 version 5.62
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiAxNyBub3YuIDIwMjEgw6AgMjM6MTIsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cml0ZXM6Cj4KPiAgPiAtIERyb3Ag
c2Vjb25kIHBhdGNoIChhbHJlYWR5IGluIHZlcnNpb24pCj4gID4gLSBGaXggQ1ZFLTIwMjEtNDM0
MDA6IEFuIGlzc3VlIHdhcyBkaXNjb3ZlcmVkIGluIGdhdHQtZGF0YWJhc2UuYyBpbiBCbHVlWgo+
ICA+ICAgNS42MS4gQSB1c2UtYWZ0ZXItZnJlZSBjYW4gb2NjdXIgd2hlbiBhIGNsaWVudCBkaXNj
b25uZWN0cyBkdXJpbmcgRC1CdXMKPiAgPiAgIHByb2Nlc3Npbmcgb2YgYSBXcml0ZVZhbHVlIGNh
bGwuCj4KPiAgPiBodHRwOi8vd3d3LmJsdWV6Lm9yZy9yZWxlYXNlLW9mLWJsdWV6LTUtNjIKPgo+
IFRoaXMgc3RhdGVzICJJdCByZWNvbW1lbmRzIHVzaW5nIHRoZSBFTEwgdmVyc2lvbiAwLjQ0LiIu
IERvIHlvdSBrbm93Cj4gaG93IGltcG9ydGFudCB0aGlzIGlzPyAyMDIxLjA4LnggaGFzIDAuNDEg
YW5kIDIwMjEuMDIueCBoYXMgMC4zNS4gRG9lcwo+IGl0IG5lZWQgdG8gYmUgYnVtcGVkIGFzIHdl
bGw/Ck5vcGUsIEkgZG9uJ3Qga25vdy4KPgo+IC0tCj4gQnllLCBQZXRlciBLb3JzZ2FhcmQKQmVz
dCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
