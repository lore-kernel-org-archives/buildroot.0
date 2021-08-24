Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C615C4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 19:27:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D50560FD8
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 19:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D50560FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C25DC60BCB;
	Tue, 24 Aug 2021 19:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RclrFEZEURIp; Tue, 24 Aug 2021 19:27:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09A2F60BF8;
	Tue, 24 Aug 2021 19:27:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E54811BF5DF
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 19:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D488260BF8
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 19:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPv9bJveaI2q for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 19:27:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6606C60BCB
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 19:27:01 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id o10so47739053lfr.11
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 12:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kOYuk7SO+xmVSuu0OOUvrD62hQi2mTtHWGmC85j+tSI=;
 b=R7i8hZVcYrVDl1Bm9Kj24Qo2s2d6e7V95+JHIIoUCEh/wvGOdy+zI1qx36O+Ohna+D
 ZyXPShR0QDDF+EK2/pCzJ/vqOVu8OwpGgMr3EkIEGR4K7F3PG5xW8jcDVroKGGGzfK/w
 qQt+RX/+E3upw4bmB9cvnYlNKp234O8nRbSL1q/3i04jPLBeQm3tfZnmQ58tCKCyZ5Gu
 MGgwHL6U/w4sbERwhsIkuT11ZSDWBZo0pveEUonwas2TjuWq5f3gjKqpEDtjOLHD9Iwk
 aQoOHqQHUuhwItRpA4LVwvXVgfPXtO9e2r+H7UGKQ5E39y8PW1LDP0OnuVx0mYBHdh/f
 GnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kOYuk7SO+xmVSuu0OOUvrD62hQi2mTtHWGmC85j+tSI=;
 b=huPEfLo2tcnR0RAWeSGNSKPnGpqq1eeTIOzFhTEE8v2ha8VlwdmwuRtijsovLgnJzh
 Qfb4M/V8QgFHeU0s/gwCNV8MUbXENdYv9HIXBYEDNVMsed/d4BPuYOZ+DnT2jFiY3wWf
 j9o4qWyZbPfd1z8WMDTcZKtjilPL9sceMehKvrB5UBxZ5tJYrtnykGpCz01ccUGJMu4U
 JZav4rP2Od0F3w9ZYwqMEIXGy5RSGQwviNX4v/C2BdXJajuLE20RkHUwKn9kw0olGibY
 qBRM0MQYcjD46S3z0EQdPcTHIXbnvX51S1t3ED+cUgkSkGTkA0H0MfFle4uQs0bJ1J5n
 sCwA==
X-Gm-Message-State: AOAM532H4zXphs8msuv51/C5G4auZGQPwtEUb9gBdMN7syn7xRlJyU9X
 SsHa/nVVW+XUHaPIzEsYUBjEPTYTiSwTvPOAxDI=
X-Google-Smtp-Source: ABdhPJwpxZiH23oBQbYl5v/Vov+UWGNWw9tUiprrP4arXO2Mlz7V3tlfsenRnzwsLBbqLxVpCWWAQzYlUtWRq87vsw0=
X-Received: by 2002:a19:f719:: with SMTP id z25mr29723977lfe.339.1629833218942; 
 Tue, 24 Aug 2021 12:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210824070141.94164-1-fontaine.fabrice@gmail.com>
 <8e359c85-595c-ca73-3827-758bef460ac1@gmail.com>
In-Reply-To: <8e359c85-595c-ca73-3827-758bef460ac1@gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 24 Aug 2021 21:26:46 +0200
Message-ID: <CAPi7W81cMpgYHSDYgGudkyqLfVJEb4Um80z746iCBGV=SaBQ0g@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d-demos: use
 BR2_PACKAGE_MESA3D_GBM
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gUm9tYWluLAoKTGUgbWFyLiAyNCBhb8O7dCAyMDIxIMOgIDE5OjIzLCBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+IGEgw6ljcml0IDoKPgo+IEhlbGxvIEZhYnJpY2Us
Cj4KPiBMZSAyNC8wOC8yMDIxIMOgIDA5OjAxLCBGYWJyaWNlIEZvbnRhaW5lIGEgw6ljcml0IDoK
PiA+IFVzZSBCUjJfUEFDS0FHRV9NRVNBM0RfR0JNIGludHJvZHVjZWQgYnkgY29tbWl0Cj4gPiBi
NmMwNTFhY2Y3ODdjODA0ZTczMmJjNThiYThkN2U0NDA3MDFhMTY4Cj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+ICBwYWNrYWdlL21lc2EzZC1kZW1vcy9tZXNhM2QtZGVtb3MubWsgfCAyICstCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkLWRlbW9zL21lc2EzZC1kZW1vcy5tayBiL3BhY2thZ2Uv
bWVzYTNkLWRlbW9zL21lc2EzZC1kZW1vcy5tawo+ID4gaW5kZXggNDI4OWFjZmZmYi4uNmI1MjYy
YTJlOSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvbWVzYTNkLWRlbW9zL21lc2EzZC1kZW1vcy5t
awo+ID4gKysrIGIvcGFja2FnZS9tZXNhM2QtZGVtb3MvbWVzYTNkLWRlbW9zLm1rCj4gPiBAQCAt
NDMsNyArNDMsNyBAQCBlbHNlCj4gPiAgTUVTQTNEX0RFTU9TX0NPTkZfT1BUUyArPSAtLWRpc2Fi
bGUtdmcKPiA+ICBlbmRpZgo+ID4KPiA+IC1pZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9PUEVO
R0xfRUdMKSx5KQo+ID4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTUVTQTNEX0dCTSkseSkKPgo+IEJS
Ml9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRUdMIHNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfR0JN
LCBidXQKPiBCUjJfUEFDS0FHRV9NRVNBM0RfR0JNIGNhbiBiZSB1c2VkIHdpdGhvdXQgQlIyX1BB
Q0tBR0VfTUVTQTNEX09QRU5HTF9FR0wuCj4KPiBIYXZlIHlvdSBjaGVja2VkIHdpdGhvdXQgQlIy
X1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FR0wgZW5hYmxlZCA/ClllcywgIG1lc2EzZC1kZW1vcyBp
cyBidWlsZGluZyBmaW5lIHdpdGggYSBEUkkgZHJpdmVyIChpLmUuIHdpdGgKQlIyX1BBQ0tBR0Vf
TUVTQTNEX0dCTSBidXQgd2l0aG91dCBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VHTCkuCkhv
d2V2ZXIsIEkgd291bGQgYWR2aXNlIHRvIGFwcGx5IHRoaXMgY29tbWl0IGZvciBuZXh0IGluc3Rl
YWQgb2YgbWFzdGVyLgo+Cj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+Cj4KPiA+ICBNRVNBM0Rf
REVNT1NfREVQRU5ERU5DSUVTICs9IG1lc2EzZAo+ID4gIE1FU0EzRF9ERU1PU19DT05GX09QVFMg
Kz0gLS1lbmFibGUtZ2JtCj4gPiAgZWxzZQo+ID4KPgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5l
dC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
