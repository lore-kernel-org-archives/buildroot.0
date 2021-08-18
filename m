Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22505C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:16:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2E3E61051
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2E3E61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90E93404E2;
	Wed, 18 Aug 2021 21:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzLlsvf-eotS; Wed, 18 Aug 2021 21:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1112E40578;
	Wed, 18 Aug 2021 21:16:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9826F1BF2C7
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8756D60B85
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P24azdbOmhqI for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 21:16:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80E41605E9
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 21:16:46 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id y7so7625209ljp.3
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 14:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fphIAUI5huKw8r/LnuyXW5FzcYlHld+MdcNdgKkg+Dg=;
 b=jploXC2EZIKyi4EXzr8K0O6Wkt509z5U40UC8MH7DcQuQNo5gmEN0cjFJB58I2aNi+
 3NMmbGUiXoOlUkvkQUtsaTf0TdlYvrkK/LtRlgUlxOxfgUoNg7kyGc5kATIQo2xFezGf
 cYbF6u2WJnnQ5P629sqXX1xPTe/U/6Oju21VJ8zJK8mScQCsswlxKBYKNx/ieHh68v7M
 iHmYCZdDo/Y5JbqlHrP4TeCgI/LsA6CllvyoocudkcSUgQtP4ad5FJAMWCAYUMb424LL
 lcqYPaPoNq7kajn95VYj8C35kwQWtOCUKkQ1wSWnBDNpkj+TD6ZJucnVdxzxqwfm5KPq
 Pzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fphIAUI5huKw8r/LnuyXW5FzcYlHld+MdcNdgKkg+Dg=;
 b=i7jg8b8mcctTtI8xqyXt7pLNg0mbjQQdPjejmxU0V6dIStroiFK3V6eU3Myv6DOz2w
 8VpWg+GPOBmmImIw2nDm8NE0nczO6Kd6LgAcQtzCS26RfmLaYv5vTEqgREqBpPWs3Vrk
 /rda61fKd8iPWXksNujMwaHz8QN/YYb6m7yDImA576xkeukawXdGFjhMA5HHtbt37ZDt
 2mlP7tRye85uyLRfXg9F6p7qY4GQ4amJ3DR2JKYyE72l2bOOBiH1EPNYP07zKWyFBNsi
 9m7lnXoW/g8LU57ie+UsJj5UbMsDQ9WybszXI6fjcL+BrC2b7lusXq9mo66ta4Qn4dwp
 Zdwg==
X-Gm-Message-State: AOAM5318N0Ujw6WWQEJiMrRNHtdN3wiHHy36f4908IROGxtgJUdNGFJI
 dBgb5Ew3baOTmS1JmluNpqJdJ4alR3jxJ3fgg0Y=
X-Google-Smtp-Source: ABdhPJzOZkTCV8lkHXh5lvu79qLrIPVOapIUt9WJzZbh9DEUbpSHmYFTYyf9CRncoGMu28zNdnmve6JBeMlboQj5/Fs=
X-Received: by 2002:a2e:9852:: with SMTP id e18mr9345197ljj.173.1629321404404; 
 Wed, 18 Aug 2021 14:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210813142626.2941588-1-fontaine.fabrice@gmail.com>
 <20210815175743.012d125f@windsurf>
 <CAPi7W80M_AFXgmMqK8DkLaNQV3O+BcLR+Wsv0rRarhpk47_dYQ@mail.gmail.com>
 <20210818223319.6575da17@windsurf>
In-Reply-To: <20210818223319.6575da17@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 18 Aug 2021 23:16:33 +0200
Message-ID: <CAPi7W83-5G5Nd-4Q3YpxShPN60M4A4EtKzbY3E+aLiSe_0kRdw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: fix build of gdb on riscv
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gVGhvbWFzLAoKTGUgbWVyLiAxOCBhb8O7dCAyMDIxIMOgIDIyOjMzLCBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxs
byBGYWJyaWNlLAo+Cj4gT24gU3VuLCAxNSBBdWcgMjAyMSAxODowNzo1NiArMDIwMAo+IEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gPiBX
aGlsZSBJIHVuZGVyc3RhbmQgdGhlIGlkZWEsIEknbSBub3QgZW50aXJlbHkgc3VyZSBpdCdzIHRo
ZSBtb3N0Cj4gPiA+IGxvZ2ljYWwgd2F5LiBXaGF0IGFib3V0IGluc3RlYWQgY2hhbmdpbmcgdGhl
IGN1cnJlbnQ6Cj4gPiA+Cj4gPiA+IGlmZXEgKCQoQlIyX0dEQl9WRVJTSU9OXzEwKSx5KQo+ID4g
PiBHREJfR0RCU0VSVkVSX1RPUExFVkVMID0geQo+ID4gPiBlbmRpZgo+ID4gPgo+ID4gPiBieToK
PiA+ID4KPiA+ID4gaWZlcSAoJChHREJfVkVSU0lPTl8xMCksMTAuMSkKPiA+ID4gR0RCX0dEQlNF
UlZFUl9UT1BMRVZFTCA9IHkKPiA+ID4gZW5kaWYKPiA+IFRoaXMgb25lIHdvbid0IHdvcmsgYXMg
R0RCX1ZFUlNJT05fMTAgaXMgbm90IGRlZmluZWQgaWYgaG9zdC1nZGIgaXMKPiA+IG5vdCBzZWxl
Y3RlZC4KPgo+IFNvcnJ5LCBJIG1lYW50IHRvIGRvOgo+Cj4gaWZlcSAoJChHREJfVkVSU0lPTiks
MTAuMSkKPgo+IHdoaWNoIHdvdWxkIHdvcmsgaW4gYWxsIGNhc2VzLgo+Cj4gPiA+IFRoaXMgd2F5
LCBpdCByZWFsbHkgZXhwcmVzc2VzIHdoYXQgd2Ugd2FudDogZ2RiIHZlcnNpb24gMTAueCByZXF1
aXJlIGEKPiA+ID4gZGlmZmVyZW50IGJ1aWxkIGxvZ2ljLgo+ID4gPgo+ID4gPiBBbHRlcm5hdGl2
ZWx5LCB3ZSBjb3VsZCBkbyBhIGhpZGRlbiBDb25maWcuaW4gYm9vbGVhbjoKPiA+ID4KPiA+ID4g
Y29uZmlnIEJSMl9QQUNLQUdFX0dEQl9UT1BMRVZFTAo+ID4gPiAgICAgICAgIGJvb2wKPiA+ID4g
ICAgICAgICBkZWZhdWx0IHkgaWYgQlIyX0dEQl9WRVJTSU9OXzEwCj4gPiA+ICAgICAgICAgZGVm
YXVsdCB5IGlmICFCUjJfUEFDS0FHRV9IT1NUX0dEQiAmJiBCUjJfcmlzY3YKPiA+Cj4gPiBJJ2xs
IHRlc3QgdGhpcyBvbmUgYnV0IEkgdGhpbmsgdGhhdCBpdCBzaG91bGQgd29yay4KPgo+IEJ1dCBJ
IGZpbmQgdGhpcyBhbHRlcm5hdGl2ZSBhIGJpdCBiZXR0ZXIuIExvb2tpbmcgZm9yd2FyZCB0byB0
aGUgcGF0Y2ghCkl0J3MgYXZhaWxhYmxlIGhlcmU6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMTA4MTUxNjIxMDYuMTQ5Mjk2Ny0xLWZvbnRh
aW5lLmZhYnJpY2VAZ21haWwuY29tLwo+Cj4gVGhhbmtzLAo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9t
YXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KQmVzdCBSZWdhcmRz
LAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlz
dHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
