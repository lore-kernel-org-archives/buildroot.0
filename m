Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE9CC54E5D
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 09:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A0AD60620;
	Tue, 19 Mar 2024 09:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJeJsLL4DONy; Tue, 19 Mar 2024 09:57:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47DB860737
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47DB860737;
	Tue, 19 Mar 2024 09:57:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 853E31BF2C3
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 09:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71ABC60737
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 09:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXbSOC6OTk2U for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 09:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B625560620
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B625560620
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B625560620
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 09:57:22 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3c38eced701so770870b6e.1
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 02:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710842241; x=1711447041;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PjPuklQ7lIhF6rPOL+dwpF/gY+r5eSxQSnv3SPo5pPI=;
 b=tnOwWGvfCCQD+AYKc1MsujFRbWBI/8ZzCaX7ZjuLX1gJMtM0aXipMyQwkY3ZO/2fJQ
 S32fC71zaFsKm8/jI6ChmS0r3CdSckaCxHUQbpYywBVTAEvIs0Uz0MKruZVtIYNWJo6D
 Ji+RsvjkG9J7DOSxfK/7TxNir4deMLu/B2xOZExW3QBj3MTjMj2KxANlNO20E+oYvgIJ
 F0ZVYPPbhs6YRQB1HUPrdCf4dDcHoo2hjcDXjcZjDmV3TlEk68/KFEOt5hptZumXfFRZ
 1pC+MNEGLMLitF23MMIx4NIPIvVujaB4qAFEEKFPObMfKEscCuOWt0FyQueQfLgyu73P
 qiJA==
X-Gm-Message-State: AOJu0YxiYfDUqi/+ASxDG3ZcrHraCtMjC0TsJV/Tgpl5k1ugstbcBc57
 OU5KhmO3DlZHc+GrxNqQoqH26uA2GUcA2tElr7x0BzO8x781Nwhu5rffaGyHQePgdQ7JxQfGYxM
 HasYUn26zbZ77PNYpWFMsrH4xEJ3v5nxmZkuXSYpwmzZGh00S2vE=
X-Google-Smtp-Source: AGHT+IGYslTheJ0cl223t1XrBadBEZdVm1SPtJCBJb7sarZ2WNBMPJm4wwpYs40coBqWstLIFj0LpouzkKRR44MlLCU=
X-Received: by 2002:a05:6808:384b:b0:3c3:899a:6adb with SMTP id
 ej11-20020a056808384b00b003c3899a6adbmr6223381oib.51.1710842241396; Tue, 19
 Mar 2024 02:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240319070554.1323606-1-javad.rahimipetroudi@mind.be>
 <20240319070554.1323606-3-javad.rahimipetroudi@mind.be>
 <87v85id634.fsf@48ers.dk>
In-Reply-To: <87v85id634.fsf@48ers.dk>
Date: Tue, 19 Mar 2024 10:57:10 +0100
Message-ID: <CAP_ewpNZeDF0f1Xx+RbQ6zcQuvwdqkq1iB_=6ozGmr2J1Ex5xA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1710842241; x=1711447041; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PjPuklQ7lIhF6rPOL+dwpF/gY+r5eSxQSnv3SPo5pPI=;
 b=G9BY77jRtFBIG+X7gIzy5EqORv76yRfXCpecI9mPn1jYc3IFJlQYc4skTje6dg/KFt
 O303GayJS1f9sWBC8z71BDFOzf8OipEceSzlYn+gTMK0/lp0P9ctAgUaQcz8CdyH/1Qo
 3ZS1MSBx1eJqfV1JkzgdlO0xhgG9JWWGK54Tx4RmE9cFlmkHeVbkPDKM4MRwTh3eYnCN
 kdZt2TeJyo+e082iqcorOiHk5stIv/GQc8u3iJNZ/ZsztdQNgMOtUPC+0D8wpaYCus8p
 n9R8VivZIXgDxNWSuPjmFBoGR2VTs44jfOBOawxOJ88ZGOGP4uqGNApCQVd91cf9FVEw
 MY/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=G9BY77jR
Subject: Re: [Buildroot] [PATCH v3 3/3] configs/avenger96: bump ATF version
 to v2.8
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
From: Javad Rahimipetroudi via buildroot <buildroot@buildroot.org>
Reply-To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiBUdWUsIE1hciAxOSwgMjAyNCBhdCA4OjM44oCvQU0gUGV0ZXIgS29yc2dh
YXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+ID4+Pj4+ICJKYXZhZCIgPT0gSmF2
YWQgUmFoaW1pcGV0cm91ZGkgPGphdmFkLnJhaGltaXBldHJvdWRpQGVzc2Vuc2l1bS5jb20+IHdy
aXRlczoKPgo+ICA+IFRoaXMgcGF0Y2ggdXBncmFkZXMgdGhlIEFURiB2ZXJzaW9uIHRvIHYyLjgu
IFBsZWFzZSBub3RlIHRoYXQKPiAgPiBkdWUgdG8gRFRTIGNoYWdlcyBmcm9tIGNvbW1pdCA1MWUy
MjMwNThmZTcwYjMxMTU0MjE3OGYxODY1NTE0NzQ1ZmE3ODc0Cj4gID4gKCJmZWF0KHN0bTMybXAx
NS1mZHRzKTogYWRkIEF2ZW5nZXI5NiBib2FyZCB3aXRoIFNUTTMyTVAxNTdBIERIQ09SIFNvTSIp
Cj4gID4gVGhlIEFURiBhZGRpdGlvbmFsIGJ1aWxkIHZhcmlhYmxlIGFsc28gbW9kaWZpZWQgdG8g
dXNlIHRoZSBuZXcgRFRTIGZpbGUuCj4KPiAgPiBTaWduZWQtb2ZmLWJ5OiBKYXZhZCBSYWhpbWlw
ZXRyb3VkaSA8amF2YWQucmFoaW1pcGV0cm91ZGlAbWluZC5iZT4KPgo+IFdoYXQgYWJvdXQKPiBi
b2FyZC9hcnJvdy9hdmVuZ2VyOTYvcGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS8wMDAxLXN0
bTMybXAxNTdhLWF2ZW5nZXI5Ni5kdHMtZW5hYmxlLWhhc2gtZGV2aWNlLXRvLXVuYnIucGF0Y2g/
Cj4gQ2FuIHRoYXQgYmUgZHJvcHBlZD8KPgpJIHRoaW5rIHdlIGNhbiBkcm9wIGl0LiBJIHdpbGwg
bW9kaWZ5IHRoZSBjb21taXQuCj4gLS0KPiBCeWUsIFBldGVyIEtvcnNnYWFyZAoKUmVnYXJkcywK
SmF2YWQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
