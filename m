Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF3FC83F1D
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 15:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA9141196;
	Sat, 12 Jul 2025 15:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuBQglC4YLZV; Sat, 12 Jul 2025 15:17:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8F1441168
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F1441168;
	Sat, 12 Jul 2025 15:17:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D0C51CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03F8260600
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EcInMWyzl2Bu for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 15:17:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C85160607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C85160607
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C85160607
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:17:23 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-74ad4533ac5so3411342b3a.0
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 08:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752333442; x=1752938242;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NFy3k1NG/lnmS4WK8W0/m5L0+hX1NcRfqIvdTnipI+o=;
 b=hFJI1sRp2owVehgICs/1b8rpGskYNeo0AGSJBdueexelYrH7roqUyiThklT/089XjN
 2/xg14G7zjZ9DixR/URBlN9PuT92/dOmWIAG/WjG1u2Jy8ECfQflsv9byggZxPLthmM0
 4fHhvWB00DYw3uYyan2SwHXCB1/MURTG8Hr1zcRfsx8Pb53QJ4+IbG96WU/EIKNsBtFn
 F1ItKjSXwc8shgiGRCY6iTPiWNBCzkRukasr7cDMJR5iCt6Vk+cp/SvYBB51xX+l3u6Y
 hrBds4e3chJirnlgvtyXyL4tHEuFOwCOfl8V0BWrPFI8kuy8IKuecMZWRq4laGlBZBHM
 H36g==
X-Gm-Message-State: AOJu0Yxu4xfuLFx9zyMcr1gW5OB4+BjWO4JuXrVgvfLS9Qrc8w38D27r
 7U8UwTDVQRuUfvKLNkDKnIVovcbh1d0n5/BSp/Z8XK2ZUmwEq62uK2UtYrv50Wt/TkderdLfjkC
 E9qBUm8KrJoFaNErunbK7/a1OlvV9H2KLH+Cz4v8ZqQ==
X-Gm-Gg: ASbGncum7HlwyE1EZ1iTIyIemW/ci7tJlpuU6XksVGt6vYoSxHsEDNq57YEz02ZtUH4
 2+ghdobGJ0ayFB8cMHvCV92eGzUtdJuJ6pOeD2qQzQuqKwQIcBpL6yuuyRzbjuGKle+CrFbdOjF
 Ps+XpA+9BQfGCXh2zd/n6DtnEyv/kbayQ2wxlUmKJQp/kFQ9nS46Aq9wd+IJtPYmP8siD3s6xKm
 FxwDGG2zA==
X-Google-Smtp-Source: AGHT+IGhtLMdekLwWtz6lEhfPUyt9zBLFBuqC6PwDFm21A97UAAJk88iaaUE0b1hLSLzN5jeK705j15/jYwkFfHMpZA=
X-Received: by 2002:a17:902:d4c3:b0:234:1e11:95a3 with SMTP id
 d9443c01a7336-23de2fc72f0mr169613425ad.13.1752333442404; Sat, 12 Jul 2025
 08:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250707060509.617632-1-michael@amarulasolutions.com>
 <83eaeb2bb828dbee6df88117947d6676@free.fr>
In-Reply-To: <83eaeb2bb828dbee6df88117947d6676@free.fr>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 12 Jul 2025 17:17:09 +0200
X-Gm-Features: Ac12FXx4YIHtqqA__vDDviDTI_jq9WtlAIF6FI5JniKpZoNdlOx7sKkBDhlZudw
Message-ID: <CAOf5uwm-9GCyp+LdhS2PpbAgL-FncLJb1_FZrJOkuimyp=_VfA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1752333442; x=1752938242;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NFy3k1NG/lnmS4WK8W0/m5L0+hX1NcRfqIvdTnipI+o=;
 b=Wj9LxLq1MJn557M2pmg1ZB8+qCSz/b5+lShn8qmJTXwDPHw48S8DZ0k0SoXRFi1Kyp
 m8yqmZZrzUebvJiHJ+Z+3b01lYp5qmcRIY4YKfnGz8+84WuAhjqOVR0WCvDBLJ32dNub
 NFOu1SiXP4+hD2aXlEfMaopzgJWeQFNifl3VY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Wj9LxLq1
Subject: Re: [Buildroot] [PATCH] package/python-spidev: bump to version 3.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuCgpPbiBNb24sIEp1bCA3LCAyMDI1IGF0IDc6MDTigK9QTSBKdWxpZW4gT2xpdmFp
biA8anUub0BmcmVlLmZyPiB3cm90ZToKPgo+IE9uIDA3LzA3LzIwMjUgMDg6MDUsIE1pY2hhZWwg
VHJpbWFyY2hpIHdyb3RlOgo+ID4gVGhpcyBpcyBqdXN0IGEgbWlub3IgdXBncmFkZSBmb3IgZml4
ZWQgZGVwcmVjYXRpb24gd2FybmluZwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgVHJp
bWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+Cj4gQXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KPgo+IEZvciBpbmZvLCBJIGZpeGVkIHRoZSBoYXNoIGZpbGUgc3BhY2luZyB0
byByZXNvbHZlIGEgY2hlY2stcGFja2FnZQo+IGVycm9yLgo+IFNlZToKPiBodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvM2M0NjU0OWY4OTA5NzdhODA1
ZWNiZjQ2MGJiMmYwMjJmNDgyZmVhYQo+CgpUaGFuayB5b3UgLCBJIHdpbGwgdHJ5IHRvIHB1dCBt
b3JlIGF0dGVudGlvbiBuZXh0IHRpbWUKCk1pY2hhZWwKCj4gQmVzdCByZWdhcmRzLAo+Cj4gSnVs
aWVuLgoKCgotLSAKTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCkNvLUZvdW5kZXIgJiBDaGll
ZiBFeGVjdXRpdmUgT2ZmaWNlcgpNLiArMzkgMzQ3IDkxMyAyMTcwCm1pY2hhZWxAYW1hcnVsYXNv
bHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKQW1hcnVsYSBT
b2x1dGlvbnMgQlYKSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBBQiwgQW1zdGVyZGFtLCBOTApU
LiArMzEgKDApODUgMTExIDkxNzIKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQp3d3cuYW1hcnVs
YXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
