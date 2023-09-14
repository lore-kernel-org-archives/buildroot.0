Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31064EEAA7A
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 22:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A1EE831F1;
	Thu, 14 Sep 2023 22:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A1EE831F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EoQHV8emTbZW; Thu, 14 Sep 2023 22:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0632822A1;
	Thu, 14 Sep 2023 22:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0632822A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A4641BF5A4
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 22:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 035C560C14
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 22:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 035C560C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9B9prUV47lkH for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 22:44:02 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA92D60C07
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 22:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA92D60C07
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so24984711fa.2
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 15:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694731439; x=1695336239;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fixowdTJAmRNeVeYHy/8of0TnCq2NWtjYRYB0/cXaOY=;
 b=J/7iwieYjPGClcQeverrVu6Ul2EuWsjuxxY1U2OVp2Td/ZNDrHtBoup8ZkbOhqS8eW
 izbzMK1tFwK34rGJ/xCC7/GItUNsMs/mp3nQf//hU047vxW5wslu71X5O0zcwNNxaJX9
 ZuKiYcWuPE4IUfyyjhND7dFa5TJQkX+EgdjJkJw+TBjDrF/sg2tgArChFYlXCcGfv7Y4
 apyW0f8YHSnWDaml6W3JDQ8YoTdP/RsxLnr7wsBfi4aPrTootdNCzxdtkjKk8ClKZsk9
 jm7TxRi3ZTk94IW5Ig8jAmLPhrhRhfI375LE9MOUNqcDlLNASQDk4kzimpc2TBo7EaKi
 wQcw==
X-Gm-Message-State: AOJu0YyaENhbHoAP4Cuby0JizLiKSZKCwA6CNrbX8vn1Dp1ErjG8mpeA
 70WVhqDtPqaqLg1e7HiCul3DAA/XpI66q9Ml52TNGLxOR3j8Xg==
X-Google-Smtp-Source: AGHT+IEmsIYdIviLDLLkhnCNULREzmHXEMLU3MJOVEe1aOVJQOI4XE/RK+Jvnsg5+tQPA1mgV8X5kOONj/b+P+Kg39o=
X-Received: by 2002:a2e:7c18:0:b0:2bc:e51d:89a3 with SMTP id
 x24-20020a2e7c18000000b002bce51d89a3mr93794ljc.29.1694731439263; Thu, 14 Sep
 2023 15:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230913040924.3702830-1-judge.packham@gmail.com>
 <20230914232958.76942b8d@windsurf>
In-Reply-To: <20230914232958.76942b8d@windsurf>
From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 15 Sep 2023 10:43:47 +1200
Message-ID: <CAFOYHZBG5deH2R7T4MbrAdeP5nZTf-hgSRycOkw265VZiXDknQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694731439; x=1695336239; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fixowdTJAmRNeVeYHy/8of0TnCq2NWtjYRYB0/cXaOY=;
 b=gp7/+ECn/vbY0oRUv0HBD2YpLIj/V82BW+QBNPk/WUiKqSWWKoV53XKA/cGpIIpG5Q
 otZvz3B+l5hV30aU3+VWE+BBTW+/USLVURbpj4JToEF3gvMru0UvY/tta0nRXRfBhYip
 8Tmg7wVE3vQ4yqsrv4cpCSWcxeocR4FuXsLWQYk8h3akhz5kY0gjSrbher1nzGfj2riN
 RdlSkBTAnzJMZxzof+6c1xatEFxXWoU3nH1npevKfPW5Obf3hGWYVjc58a3nfhkd8fR9
 q4ZFcZtttS1TYO6sciBa5+zRdBiMC6uTq+fYqHaSgVsskzNrzoyQcYzSPAZhSiFPoEqX
 TviQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gp7/+ECn
Subject: Re: [Buildroot] [PATCH v2] syslog-ng: bump version to 4.3.1
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

T24gRnJpLCBTZXAgMTUsIDIwMjMgYXQgOToyOeKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCAxMyBTZXAgMjAyMyAx
NjowOToyNCArMTIwMAo+IENocmlzIFBhY2toYW0gPGp1ZGdlLnBhY2toYW1AZ21haWwuY29tPiB3
cm90ZToKPgo+ID4gVXBkYXRlIHRvIGxhdGVzdCB2ZXJzaW9uLgo+ID4KPiA+IFJlbGVhc2Ugbm90
ZXM6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vc3lzbG9nLW5nL3N5c2xvZy1uZy9yZWxlYXNlcy90
YWcvc3lzbG9nLW5nLTQuMy4xCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hhbSA8
anVkZ2UucGFja2hhbUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAt
IERyb3AgcmVmZXJlbmNlIHRvIGlycmVsZXZhbnQgQ1ZFCj4KPiBUaGFua3MgQ2hyaXMgZm9yIHRo
ZSBuZXcgdmVyc2lvbi4gUGxlYXNlIG5vdGUgdGhhdCB5b3VyIGNvbW1pdCB0aXRsZQo+IGFyZSBj
b25zaXN0ZW50bHkgc2xpZ2h0bHkgaW5jb3JyZWN0OiB3ZSB3YW50ICJwYWNrYWdlL3N5c2xvZy1u
ZyIgYXMgYQo+IHByZWZpeCwgYW5kIG5vdCBqdXN0ICJzeXNsb2ctbmciLiBJdCdzIHBlZGFudGlj
LCBidXQgbW9zdCBjb2Rpbmcgc3R5bGUKPiBydWxlcyBhcmUgcGVkYW50aWMgOi0pCgpPdGhlciBw
cm9qZWN0cyBJIGNvbnRyaWJ1dGUgdG8gd291bGQgYmUgZXF1YWxseSBwZWRhbnRpYyBhbmQgc2F5
IHRoYXQKInBhY2thZ2UiIGlzIHJlZHVuZGFudCAoZS5nLiBmb3IgTGludXggSSdkIHNheSAiaHdt
b246IiBvciAiYXJtOiIgbm90CiJkcml2ZXJzL2h3bW9uOiIgb3IgImFyY2gvYXJtOiIpLiBCdXQg
SSBiZWxpZXZlIHRoZSBiZXN0IHJ1bGUgaXMKImZvbGxvdyB0aGUgbG9jYWwgY3VzdG9tIiBzbyBJ
J2xsIHRyeSB0byBkbyBzbyBmb3IgdGhlIGZ1dHVyZS4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
