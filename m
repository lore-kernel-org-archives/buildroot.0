Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBFBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:34:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B1360F50
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00B1360F50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE4DB60684;
	Sun, 19 Sep 2021 08:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zkvj4t_i1Mqd; Sun, 19 Sep 2021 08:34:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DD146067F;
	Sun, 19 Sep 2021 08:34:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44D651BF2AB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FC8B402AA
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1t9xlEWRlBsf for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 08:34:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2476B401D1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 08:34:08 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id p29so52296004lfa.11
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 01:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uKMyszpzJtIcCIciEVeazOoo/IiMRTxTMcwC+lbEjsQ=;
 b=GumUXX8QWr2TJ2HP9ZBamuszsg6EEVbdCv+uzK3HYsdqhNTaeeTdDVNR/Oh5wBlQJZ
 XSYV9kjhWjDw91CClOY6uuqLFOriAxks8LH6iyynH065ALVYpIG1XaR0M5T4mc6UnBsC
 Jl61tX8aTG7RPtREbmx35tcg/rVhFP2o32ut4np1xSub+EbPi5UXNRNzPM+OZN8nRfPt
 1lkRxP/e25+LjMt/RQFTLF/8UbhjyCtmdd+nk6rBY8NR/RdBNZWf+kWP8UFw/vxt5lOo
 uywc0xOvB7cwCDvyFJLfJ6Wva6W/BvRLnb1aUHvlF49zEzrk9p1XAxKImFutDOaCP3cy
 lpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uKMyszpzJtIcCIciEVeazOoo/IiMRTxTMcwC+lbEjsQ=;
 b=dtfwu2fE/OJqyyo5xbMxOmhg4gFGgtgjAExUeJUOft5VMGI+xeWcKKQDlq6lTx+WIk
 OK3EEH/1pmzhaJng+bXFxsTlXMolz6nLzFuX3CPVWsZxa86CA6nopk1jMyPqjp3mOTnR
 qTi5wwE/VOeXhKiqCvFvT3qvZaCFfA9wYPw5Mt0xficdC4XB7W+z+iCkhMJCbeKL1sVy
 Hv++Jb0+Ih2vZCXz6/ihG1VBCL+u3gmXJELqN/DOJgMEEjtK1rgnSNlhotLqt36tLtP2
 sEksdAXYxO3Ebky+oDfVSaYYDvaovq7SXznzpLg5SA/AXgDxEh7ZxC6UYLEo5a5BVdEs
 RTSQ==
X-Gm-Message-State: AOAM532fpGxs46L/WXRo4WMEnOD5BGBlPna6WVDilYiQVa6GwU9Yi4EQ
 aKP9NlqznL1cs6duegFQa5UeW8Gt411lrRFyOVM=
X-Google-Smtp-Source: ABdhPJw2KwK+BBtkDz1q+e6BkL5NNrPcJ1HAtq5GbIgR/X1BYyiV4EIgiEg88CFV7Qba1fBxB19wnxOIGQhZqZXAa4g=
X-Received: by 2002:a2e:a80d:: with SMTP id l13mr6847361ljq.213.1632040446667; 
 Sun, 19 Sep 2021 01:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210919081552.1415522-1-fontaine.fabrice@gmail.com>
 <20210919083145.GK1053080@scaer>
In-Reply-To: <20210919083145.GK1053080@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 Sep 2021 10:33:45 +0200
Message-ID: <CAPi7W80vXF89Y177YQLDgyQG8+B8-=yFJN3VawehBG+2=KFrsA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland-protocols: add wayland
 dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

WWFubiwKCkxlIGRpbS4gMTkgc2VwdC4gMjAyMSDDoCAxMDozMSwgWWFubiBFLiBNT1JJTiA8eWFu
bi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPgo+IEZhYnJpY2UsIEFsbCwKPgo+IE9u
IDIwMjEtMDktMTkgMTA6MTUgKzAyMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+
ID4gd2F5bGFuZCBpcyBuZWVkZWQgdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJl
IHJhaXNlZCBzaW5jZSBidW1wCj4gPiB0byB2ZXJzaW9uIDEuMjMgaW4gY29tbWl0IDdlZWRjOWNj
MWUwYzNjY2UxYzE4Y2IxNTAxNTdjYjIzNDYwNzViMjM6Cj4gPgo+ID4gQnVpbGQtdGltZSBkZXBl
bmRlbmN5IHdheWxhbmQtc2Nhbm5lciBmb3VuZDogTk8gKHRyaWVkIHBrZ2NvbmZpZyBhbmQgY21h
a2UpCj4gPgo+ID4gLi4vb3V0cHV0LTEvYnVpbGQvd2F5bGFuZC1wcm90b2NvbHMtMS4yMy9tZXNv
bi5idWlsZDoxMTowOiBFUlJPUjogRGVwZW5kZW5jeSAid2F5bGFuZC1zY2FubmVyIiBub3QgZm91
bmQsIHRyaWVkIHBrZ2NvbmZpZyBhbmQgY21ha2UKPgo+IEkgZ3Vlc3Mgd2hhdCBpdCByZWFsbHkg
bmVlZHMsIGluIGZhY3QsIGlzIGp1c3QgaG9zdC13YXlsYW5kLCB3aGljaAo+IHByb3ZpZGVzIHdh
eWxhbmQtc2Nhbm5lciwgbm8/CkluZGVlZCwgSSdsbCBzZW5kIGEgdjIuCj4KPiBSZWdhcmRzLAo+
IFlhbm4gRS4gTU9SSU4uCj4KPiA+IEZpeGVzOgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvMjc0NGU1MDQ2NWE5Y2Q5ZDM3MjZkMjMyOThhZDZjOTQzZWY0OWEy
MQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJp
Y2VAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS93YXlsYW5kLXByb3RvY29scy93YXls
YW5kLXByb3RvY29scy5tayB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dheWxhbmQtcHJvdG9jb2xzL3dheWxhbmQt
cHJvdG9jb2xzLm1rIGIvcGFja2FnZS93YXlsYW5kLXByb3RvY29scy93YXlsYW5kLXByb3RvY29s
cy5tawo+ID4gaW5kZXggNDFhYjFlMWM5OS4uODQ1YjdlMGQ1ZSAxMDA2NDQKPiA+IC0tLSBhL3Bh
Y2thZ2Uvd2F5bGFuZC1wcm90b2NvbHMvd2F5bGFuZC1wcm90b2NvbHMubWsKPiA+ICsrKyBiL3Bh
Y2thZ2Uvd2F5bGFuZC1wcm90b2NvbHMvd2F5bGFuZC1wcm90b2NvbHMubWsKPiA+IEBAIC0xMSw2
ICsxMSw3IEBAIFdBWUxBTkRfUFJPVE9DT0xTX0xJQ0VOU0UgPSBNSVQKPiA+ICBXQVlMQU5EX1BS
T1RPQ09MU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ID4gIFdBWUxBTkRfUFJPVE9DT0xTX0lO
U1RBTExfU1RBR0lORyA9IFlFUwo+ID4gIFdBWUxBTkRfUFJPVE9DT0xTX0lOU1RBTExfVEFSR0VU
ID0gTk8KPiA+ICtXQVlMQU5EX1BST1RPQ09MU19ERVBFTkRFTkNJRVMgPSB3YXlsYW5kCj4gPgo+
ID4gIFdBWUxBTkRfUFJPVE9DT0xTX0NPTkZfT1BUUyA9IC1EdGVzdHM9ZmFsc2UKPiA+Cj4gPiAt
LQo+ID4gMi4zMy4wCj4gPgo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlh
bm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVy
aWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwg
LyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBs
aXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
