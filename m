Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA98C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 09:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FE9E82D2F;
	Tue, 31 Oct 2023 09:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FE9E82D2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yyOU2Tqi81fn; Tue, 31 Oct 2023 09:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FBEE82D07;
	Tue, 31 Oct 2023 09:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FBEE82D07
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4ACFB1BF329
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 09:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30481421FE
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 09:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30481421FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pkTzeqeBAIkT for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 09:01:00 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA2D0421E0
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 09:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA2D0421E0
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c523ac38fbso79581371fa.0
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 02:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698742858; x=1699347658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3+AVtmlYKEDS4ANxzad/A23Y3fhx89XQDw0PBNzL01I=;
 b=bhCJ4f69nZsuybHkz0saCjdr6pMqQC4ZXlvNFKAf7nYuu5qQpUffadET7Fa8gcn99E
 VlaRI7cWratw45tU8BhqyTWxHGeXP446s8uSCNkHJ/V80OqozlRLD2lh55YZtGWjHhnA
 aeKHI5EMIkY+xVZ623jbjYZUgAcZ1q50ET8Qi6YRMUDBiTE4xjqYQmPmtid6pnxHBXaT
 Y42KuT2UZJ4M1Nh/OlAK0opEaC3ka4pW7NcrPvoqt1nJ8HHFlAS6RuBQcT6V24rR+qVR
 mAXLKm3heXcYeVB2jRtVBGIujjSpu3S/ToudTN3zC7dSEenhFlElUuVlO9go0i3rlYwi
 9p3A==
X-Gm-Message-State: AOJu0YxhCxUpZssW4Yk0f0uPlZJqylOUsrHPhBxYfaKZ2W1P3IuGIeZF
 kHB1TEHeXxAqXt4WvXfY35Z4BKh7XLyY7ZM/BHXoYda5
X-Google-Smtp-Source: AGHT+IGwBbSD+g7BMAN8XlRa778h3LnjeomLvMGPGHyT5xXaZCInUqRHNwnJByDfA/CHL/qRhSNs529xUny3HyGMwJ0=
X-Received: by 2002:a2e:2c11:0:b0:2c5:1e3f:7379 with SMTP id
 s17-20020a2e2c11000000b002c51e3f7379mr9371095ljs.48.1698742857578; Tue, 31
 Oct 2023 02:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231026181904.3218122-1-bernd@kuhls.net>
 <87o7gf1b6h.fsf@48ers.dk>
In-Reply-To: <87o7gf1b6h.fsf@48ers.dk>
From: Scott Fan <fancp2007@gmail.com>
Date: Tue, 31 Oct 2023 17:00:46 +0800
Message-ID: <CAFkzVZacX8bhs_2qKcSKifXm7JkUSLpg5ZaVKfz7Zvq7FBbQLw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698742858; x=1699347658; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3+AVtmlYKEDS4ANxzad/A23Y3fhx89XQDw0PBNzL01I=;
 b=YTciggtoUZSbbyHjAhGYMEMeHfPp5Sv2yOBnMh3TfcsQxmjb3smH7/PunvV2HBTNaR
 pcf399hXP7BoS3Ubdk1ooFPRuXYMGUBuV7tiILfX26WCGPA8+uKGLQ4KuprYcpsaJ0lz
 Z3YMbzzVAue6JxkH0hnDmzc2uozP2V0RHjlLtMd42g8+l/v+tqjvOiA6uOCeQVl9mbrJ
 xED2sA6MehJAtxl7Hq/7B74P3dsbV0eLWTvPKNK9wgyfesYThhwQ72gFPd1F5DT3eie+
 D4dRx7ojY5Y6D7DRcEBukqTXMOxA9FtPQtsJSQvy/Qa/JRB4IspYZz33m5l/xKbsOQR/
 lW3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YTciggto
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump
 version to 3.1.4
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIDIwMjMuMDIueCBicmFuY2gsIGl0IG5lZWQgYnVtcCB0byAxLjEuMXcgdmVyc2lvbi4KClNj
b3R0IEZhbgoKT24gVHVlLCBPY3QgMzEsIDIwMjMgYXQgMzo1MuKAr1BNIFBldGVyIEtvcnNnYWFy
ZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4KPiA+Pj4+PiAiQmVybmQiID09IEJlcm5k
IEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+IHdyaXRlczoKPgo+ICA+IEZpeGVzIENWRS0yMDIzLTUz
NjM6Cj4gID4gaHR0cHM6Ly93d3cub3BlbnNzbC5vcmcvbmV3cy9zZWNhZHYvMjAyMzEwMjQudHh0
Cj4gID4gaHR0cHM6Ly93d3cub3BlbnNzbC5vcmcvbmV3cy92dWxuZXJhYmlsaXRpZXMuaHRtbAo+
Cj4gID4gQ2hhbmdlbG9nOiBodHRwczovL3d3dy5vcGVuc3NsLm9yZy9uZXdzL2NsMzEudHh0Cj4K
PiAgPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+Cj4gRm9y
IDIwMjMuMDgueCBJIHdpbGwgaW5zdGVhZCBidW1wIHRvIDMuMC4xMiwgd2hpY2ggY29udGFpbnMg
dGhlIHNhbWUKPiBmaXguCj4KPiAtLQo+IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
