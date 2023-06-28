Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE29EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 15:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D98AB408FE;
	Wed, 28 Jun 2023 15:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D98AB408FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AakArVQEQJhz; Wed, 28 Jun 2023 15:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4C834089A;
	Wed, 28 Jun 2023 15:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4C834089A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E98C01BF38D
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 15:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFFE760BCC
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 15:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFFE760BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6zFm82t9qghz for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 15:15:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AEE860672
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AEE860672
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 15:15:46 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fa48b5dc2eso6748889e87.1
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 08:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687965344; x=1690557344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T91TEETS1sdV5xnFi8sCd2Jj/be6EL/CzA8xnSzzDII=;
 b=dkbWykaPndaR9cIcluaykeO45QCBpHyA7+UUQsGBhTu59jmH7h/+ps1Dr9mxVMvh57
 Q82PJb8i2hYgPMZGtNoj0PTwP+ejHEzA4i9V0HBtCkHkKZoGAMJQuFPxs5GCegZ3p9HN
 vhVpNcHPDcXft0Nfl4XrVe5f122Rs0TdhXGReLXeL1tW4TdYiEvliuAeChUrentajIXi
 kukwGxsjcmC/Mz9UPROOagt5297uOIt5I72g5fsBhKBxo15iXp+v/YcdGt4gRTZCwuZ0
 bdMrAeK4r+B2YTlcc2Kl4aR5PxfCUwTVoodHolHJQj/7oY0D6Sl8XRZJ/SxJdCYobogr
 AmoA==
X-Gm-Message-State: AC+VfDzkypZCey/WtcKu0xfNhxoBrs7+QV+2dPZ4EQiYzNmuOq7nEI5z
 pJMQu5H1m5lmUg0qfcbl6y/Q/SLuoKrME/jqQmw=
X-Google-Smtp-Source: ACHHUZ4jbTOsRxJeaMpFo2MolWrCl3Ubr930oGmIhNR/AVKXvfIDEs3CKtfvuhZLdB2+vIDDhrJeUCZCuUdWbZkdmco=
X-Received: by 2002:a05:6512:a84:b0:4fb:89f2:594c with SMTP id
 m4-20020a0565120a8400b004fb89f2594cmr3648370lfu.56.1687965343822; Wed, 28 Jun
 2023 08:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
 <20230626160030.93063-11-bmeng.cn@gmail.com>
 <20230626172109.GG646621@scaer>
 <CAKmqyKMa8OHWNWCH2_mFAin0_igrX5TSiKFxqX41=2-dD5RWPw@mail.gmail.com>
In-Reply-To: <CAKmqyKMa8OHWNWCH2_mFAin0_igrX5TSiKFxqX41=2-dD5RWPw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 28 Jun 2023 23:15:32 +0800
Message-ID: <CAEUhbmVKkGr4bJsgpgctCaLXsC354t=AJn2dw5xZ3Vfpz87cSQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687965344; x=1690557344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T91TEETS1sdV5xnFi8sCd2Jj/be6EL/CzA8xnSzzDII=;
 b=RLAdxdCE0D/qi8+3YO4DKnkdaQ3pJkSWMxhkWDy55s1SJdwQrAU+RcD3+rmiCvAUnV
 EukEHwPAzpWtc/P267nwIs+BPmrV1ADTYdnju+Dl757g+jCIT42qzAp3PuSCBBmMVggx
 b7jiIH6TewukaWpfpBHifF0/ZJH50MhTn8azkYUGBKB0QJ9X0d8IH4PyQqldaCj25cxe
 kHqXBi1PHMbWF20YehlzPs4tyK0YZq0IBo39S774h1yo4hExjU38S6fUkPH9w9Ecu3G3
 26aqN0hc9YrqRP4S3nn2qfcZBmdx+3+KaOM14v0M88RzlnxTo9S52yhHj8h3O8J5JBog
 B+aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=RLAdxdCE
Subject: Re: [Buildroot] [PATCH 10/10] board/sifive: hifive-unleashed:
 Include QEMU instructions in readme.txt
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFR1ZSwgSnVuIDI3LCAyMDIzIGF0IDg6MzLigK9BTSBBbGlzdGFpciBGcmFu
Y2lzIDxhbGlzdGFpcjIzQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAyNywgMjAy
MyBhdCAzOjIx4oCvQU0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
b3RlOgo+ID4KPiA+IEJpbiwgQWxsLAo+ID4KPiA+IE9uIDIwMjMtMDYtMjcgMDA6MDAgKzA4MDAs
IEJpbiBNZW5nIHNwYWtlIHRodXNseToKPiA+ID4gRnJvbTogQmluIE1lbmcgPGJtZW5nQHRpbnls
YWIub3JnPgo+ID4gPgo+ID4gPiBUaGUgdXBzdHJlYW0gUUVNVSAnc2lmaXZlX3UnIG1hY2hpbmUg
c3VwcG9ydHMgcnVubmluZyB1cHN0cmVhbSBVLUJvb3QKPiA+ID4gZm9yIHRoZSBTaUZpdmUgSGlG
aXZlIFVubGVhc2hlZCBib2FyZCBvdXQgb2YgdGhlIGJveC4KPiA+ID4KPiA+ID4gQWRkIHRoZSBR
RU1VIGluc3RydWN0aW9ucyBmb3IgdGVzdGluZyBpbiByZWFkbWUudHh0Lgo+ID4KPiA+IEFoLCBp
cyB0aGUgNjRNaUIgU0RjYXJkIHJlcXVpcmVkIHRvIGJlIGJvb3RhYmxlIHVuZGVyIHFlbXU/Cj4K
PiBZZXMsIFFFTVUgcmVxdWlyZXMgdGhlIFNEIGNhcmQgdG8gYmUgYSBwb3dlciBvZiAyCj4KPiBo
dHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9jb21taXQvYTliY2VkZDE1YTU4
MzRjYTlhZTZjM2E5NzkzM2U4NWFjN2VkYmQzNgo+CgpIb3cgYWJvdXQgdGhlc2UgMiBwYXRjaGVz
PyBEbyB0aGV5IGxvb2sgZ29vZD8KClJlZ2FyZHMsCkJpbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
