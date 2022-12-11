Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA15C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 21:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E51594056B;
	Sun, 11 Dec 2022 21:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E51594056B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jikfH3DnYSeA; Sun, 11 Dec 2022 21:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3687E40528;
	Sun, 11 Dec 2022 21:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3687E40528
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2BCA1BF309
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C9CE4054A
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C9CE4054A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQpeE7TQGoTx for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 21:51:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBDFE402E0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBDFE402E0
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 21:51:02 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id i15so10459749edf.2
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:51:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xbEMX7O9hfo0Wl3nZgSZyfulGC+DCT8jHe/i2z4uUIw=;
 b=YWN2q9yBP26ZMkFyTPuqTFDCfBfZIHoQG01oiHmiJAQ66O1WMzDBksY8YO5saSX7qN
 fOvrkBlYFxPa9MFYfZC59VZzMR98KP7I1J73v2B4N4RN7zXZWQSfksKsgFGMx1XKbt4z
 /OleyffxH6dmnBMZT6V3itGYMQQ7aiU22YE7H2LD1h9dPWJb4519Uv4RqnLL8nLpeZzT
 sMP7dLEgxmP+cDxxNOVOt/qgwLY5AMahNF0lgAM5mcc/AJTGHk7q+KFlqDh/k6xEkYeZ
 7UuMFfukLrK49UZUAZx4U3zOc6n+RtZoxopbr6dYLfS3+re7jx/CzdtSlIG+rZnsLOCu
 BWMg==
X-Gm-Message-State: ANoB5pmy/FWttesm3hq1mlhWdj1dZsIVvGKbY/61Mjfsw8+UIP2P528C
 gjGlaW3AfUjNOF7Po8AwpBH+NZM4/IIKdh4H3h/78gd8YspFAA==
X-Google-Smtp-Source: AA0mqf6N7YZ8K1kz+WkdK0GHiIGfkvNjOFAiq/3s8pcV/kQYnZXw6JeKEKQ5wCP29OBbE+/kAexMY4Mhx+qhAMWTpCI=
X-Received: by 2002:a05:6402:4027:b0:468:fc39:e89 with SMTP id
 d39-20020a056402402700b00468fc390e89mr69530863eda.170.1670795461111; Sun, 11
 Dec 2022 13:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20221209075104.1168297-1-etienne.carriere@linaro.org>
 <20221209075104.1168297-3-etienne.carriere@linaro.org>
 <20221210101150.GS2855@scaer> <20221211140326.GO1044805@scaer>
In-Reply-To: <20221211140326.GO1044805@scaer>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Sun, 11 Dec 2022 22:50:50 +0100
Message-ID: <CAN5uoS8bW33RXTKb5=7Ssmu_jF43qjwaKA3BXKrtQawz=4p12Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xbEMX7O9hfo0Wl3nZgSZyfulGC+DCT8jHe/i2z4uUIw=;
 b=ujMcc4iTd23Tbw50Kr7TZmXgFYPjh3vNfYZIzgDokX++jGXmgChQLe34JpzjjQ05ca
 rV+6TH6nETDY+oa6jyzSftoUoXj1vOBjh69qHo6uwknhu3xC7R6Ijzi7MkFT6lJFNg2x
 vMzKQ+MNNRoDH4fHee4KI2NbYT0/NPcUGKd1q3TaYnF6eqxMgxU/G82dffgiJ3fqOsmd
 5dvnl3975R8WFpBOtZQhRdrGLK8DAEqL3QDEJjitCZwjg78HgpDTFRadXFb9qNvU22Ee
 Ai2lKVEY3pbaf9nUdHhpyLTWBRu3ULvPQ5pHM7t6YgfCJ4sMIiVR/XN2Xc+7x38qLm6D
 7yIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=ujMcc4iT
Subject: Re: [Buildroot] [PATCH v2 3/5] package/optee-client: bump to
 version 3.19.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKClRoYW5rcyBmb3IgYWxsIHRoZSBmaXh1cHMgYW5kIG1lcmdpbmcgdGhlIHVw
Z3JhZGUuCkknbGwgdHJ5IHRvIGJldHRlciBmb2xsb3cgQlIncyBjb2Rpbmcgc3R5bGUgaW4gdGhl
IGZ1dHVyZS4KCkJlc3QgcmVnYXJkcywKRXRpZW5uZQoKCk9uIFN1biwgMTEgRGVjIDIwMjIgYXQg
MTU6MDMsIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+
IMOJdGllbm5lLCBBbGwsCj4KPiBPbiAyMDIyLTEyLTEwIDExOjExICswMTAwLCBZYW5uIEUuIE1P
UklOIHNwYWtlIHRodXNseToKPiA+IE9uIDIwMjItMTItMDkgMDg6NTEgKzAxMDAsIEV0aWVubmUg
Q2FycmllcmUgc3Bha2UgdGh1c2x5Ogo+ID4gPiBCdW1wcyBPUC1URUUgY2xpZW50IHBhY2thZ2Ug
dmVyc2lvbiB0byBPUC1URUUgcmVsZWFzZSAzLjE5LjAuCj4gWy0tU05JUC0tXQo+ID4gPiAraWZl
cSAoJChCUjJfUEFDS0FHRV9PUFRFRV9DTElFTlRfVEVFQUNMKSx5KQo+ID4gPiArT1BURUVfQ0xJ
RU5UX0VYVF9ERVBFTkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYgdXRpbC1saW51eC1saWJzCj4KPiBJ
IG1pc3NlZCBjaGFuZ2luZyB0aGUgZGVwZW5kZW5jeSB0byB1dGlsLWxpbnV4IGhlcmUsIGFzIG5v
dGljZWQgYnkKPiBUaG9tYXMsIHNvIEkganVzdCBwdXNoZWQgYSBmb2xsb3ctdXAgY29tbWl0IHRv
IGZpeCB0aGF0Lgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gLS0KPiAuLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVk
IHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3
NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAg
ICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5p
cy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJh
Y3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
