Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9808C2BB85
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 09:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C249403B7;
	Mon, 17 Jun 2024 09:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LzPkbZA3XGjM; Mon, 17 Jun 2024 09:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29655403CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29655403CC;
	Mon, 17 Jun 2024 09:39:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D07E1BF2A4
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 09:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B7E760708
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 09:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id keQxqJInVxmn for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 09:39:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79CCC60704
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79CCC60704
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79CCC60704
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 09:39:06 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52bc121fb1eso4970370e87.1
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 02:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718617144; x=1719221944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6BGNDFPyelUnzpAsOMuqNflngWyWDgE/T2DmDtyVT3Y=;
 b=JoegEOK9rceHQbNZIFhu4BgS/j0oVsPRSfTTMsn70KZIsamXrmrMrcLDAnbE5lXu3P
 8VGIS4exGmniB1z6YPMUb2zraowIASaiMK99oBBjJiJvBvw2LLQLicm8ZhUA52LmhBpu
 Da3KI0j4NXSHmN658Va2Ad9XgRB1H0/hU9+x0V3V+nxibTGpNNOvCXxRPiA4U8cVv6HN
 NM9Fb50iKIz3plA5okCer699Q/pYgawRWNHwM369IsA44a/fMT2l6RKQurQ2ToBqq9UP
 pQSAs3Efnvq6Wj4thcwkuM3kRYC/EKY9BuHodt2X+W3TFg37YvuwUQMBKWRpL4k+kgbC
 mVPg==
X-Gm-Message-State: AOJu0Yx9am3WIYiV3N3+W8lhKjFY36ab9r5TWzhqiDYsYSopzB5/ebIV
 m3qIZLvy3X4LJi9qOtN/kydlfprDZjm3XnWQtKBuvVf7yxJzKXB98vhwpmx2oMMkql5lxtT51K0
 4EeRnRvp82ZqV6rGpVcOX3c6lPu8eVw==
X-Google-Smtp-Source: AGHT+IE2iOYmjCfF449Fvo0a6qVDjRVic36u+3IgaNprcKOxcPEZ5y/wOEEk+yWKloQzPUkZnHeVqzaVSNGX3cnp1vA=
X-Received: by 2002:a05:6512:3aa:b0:52c:9421:e986 with SMTP id
 2adb3069b0e04-52ca6e6556dmr5259800e87.23.1718617143900; Mon, 17 Jun 2024
 02:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240613113924.3778837-1-yegorslists@googlemail.com>
 <Zm7K9fkXOlLrekgS@landeda>
 <CAGm1_ktfU00dOE7n7SdnK25-1AB0ca5KSYYtQPKUaOy+1vob5A@mail.gmail.com>
 <Zm7Syz8a9T09RrRf@landeda>
In-Reply-To: <Zm7Syz8a9T09RrRf@landeda>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 17 Jun 2024 11:41:30 +0200
Message-ID: <CAGm1_ktf6=TgqyzBadMUX1d+jqB4Qtrsp4H8TD=54DjSGcpE0Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1718617144; x=1719221944; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6BGNDFPyelUnzpAsOMuqNflngWyWDgE/T2DmDtyVT3Y=;
 b=k4NrTc2COq5Mea3ThPGs81vJ7Z6VgFMwOoNtNKnZZ9XLvR+kkv1Hjvrw14VkOSqc4T
 ilbNq8dKnExgvGe6WtXpQ7O1EqGbMR+Cncq1C9jSlgqDNBM1JbVD4wUKp/4VCLdfxypc
 ve0ss15DEgjI2l2bT7621BD8IOQS3sLurrvH9nDJPewFtXJe6VRKOCkuSYiBmmtwWvnY
 4/P88KJf/CFj2rMALBc66GOMik74tE3f/tx4M53JPTiN9sXpyNBWdXdV5ggUklO1X6Dt
 g9d5iA8lvGH1rzDisfQmxP9ycSZgt3IxuZQ9oNadwtGHptMXCTzTDgJOCAkjq7OY6lwa
 zreg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k4NrTc2C
Subject: Re: [Buildroot] [PATCH] package/ncftp: fix GCC 14.x related build
 errors
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgQWxsLAoKT24gU3VuLCBKdW4gMTYsIDIwMjQgYXQgMTo1NeKAr1BNIFlhbm4gRS4gTU9S
SU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IFllZ29yLCBBbGwsCj4KPiBP
biAyMDI0LTA2LTE2IDEzOjQyICswMjAwLCBZZWdvciBZZWZyZW1vdiBzcGFrZSB0aHVzbHk6Cj4g
PiBPbiBTdW4sIEp1biAxNiwgMjAyNCBhdCAxOjIy4oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5t
b3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+IFstLVNOSVAtLV0KPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvLmNoZWNrcGFja2FnZWlnbm9yZSBiLy5jaGVja3BhY2thZ2VpZ25vcmUKPiA+ID4gPiBpbmRl
eCBkZDFmZDMxZTg2Li41MmI1MDkwMDM0IDEwMDY0NAo+ID4gPiA+IC0tLSBhLy5jaGVja3BhY2th
Z2VpZ25vcmUKPiA+ID4gPiArKysgYi8uY2hlY2twYWNrYWdlaWdub3JlCj4gPiA+ID4gQEAgLTEw
NjcsNiArMTA2Nyw4IEBAIHBhY2thZ2UvbXVzbC8wMDAxLWF2b2lkLWtlcm5lbC1pZl9ldGhlci5o
LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ID4gPiA+ICBwYWNrYWdlL211c2wvMDAwMi1wYWNr
YWdlLW11c2wtTWFrZS1zY2hlZHVsZXItZnVuY3Rpb25zLUxpbnV4LWNvbXBhdGliLnBhdGNoIGxp
Yl9wYXRjaC5VcHN0cmVhbQo+ID4gPiA+ICBwYWNrYWdlL25hbm8vMDAwMS1saWItZ2V0cmFuZG9t
LmMtZml4LWJ1aWxkLXdpdGgtdWNsaWJjLTEuMC4zNS5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0K
PiA+ID4gPiAgcGFja2FnZS9uYW5vY29tLzAwMDEtZml4LWJ1aWxkLXdpdGgtZ2NjLTEwLnBhdGNo
IGxpYl9wYXRjaC5VcHN0cmVhbQo+ID4gPiA+ICtwYWNrYWdlL25jZnRwLzAwMDEtbmNmdHAtMy4y
LjctZml4LWdjYzE0LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ID4gPiA+ICtwYWNrYWdlL25j
ZnRwLzAwMDItbmNmdHAtMy4yLjctZml4LWNsYW5nLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+
ID4gPgo+ID4gPiBEbyBub3QgYWRkIGFuIGV4Y2x1c2lvbiBmb3IgbmV3IHBhdGNoZXM7IGluc3Rl
YWQsIGFkZCBhbiBVcHN0cmVhbSB0YWcuCj4gWy0tU05JUC0tXQo+ID4gVGhlIHJlYXNvbiBmb3Ig
dGhlIG1pc3NpbmcgVXBzdHJlYW0gdGFnIGlzIHRoYXQgdGhlcmUgaXMgbmVpdGhlciBidWcKPiA+
IHRyYWNrZXIgbm9yIG1haWxpbmcgbGlzdC4gVGhlIG9ubHkgY29tbXVuaWNhdGlvbiBjaGFubmVs
IGlzIGFuIGUtbWFpbAo+ID4gYWRkcmVzcy4gSSBoYXZlIGFscmVhZHkgc2VudCBib3RoIHBhdGNo
ZXMgYW5kIGFza2VkIGdhemlsbGlvbnMgb2YKPiA+IHF1ZXN0aW9ucyBidXQgYWxsIHdhcyBpbiB2
YWluIDotKAo+Cj4gQWgsIG5vdyB0aGF0IEkgbG9va2VkLCBpdCBpbmRlZWRzIGxvb2sgYmxlYWsu
Li4gOi0oCj4KPiBJbiB0aGF0IGNhc2UsIHN0YXRlIGJyaWVmbHkgc286Cj4KPiAgICAgVXBzdHJl
YW06IE4vQSwgdW5yZXNwb25zaXZlIGNvbnRhY3QgZW1haWwgYWRkcmVzcwo+Cj4gVGhhbmtzIGZv
ciB0cnlpbmchIDotKQoKSSBoYXZlIHNlbnQgdjIuIE1lYW53aGlsZSwgSSdsbCB0cnkgdG8gZml4
IHRoZSBzdGF0NjQgaXNzdWUuCgpZZWdvcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
