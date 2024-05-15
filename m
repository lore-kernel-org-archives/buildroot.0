Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4902C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 11:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7052E605C6;
	Wed, 15 May 2024 11:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DvZ-kKa_eQV; Wed, 15 May 2024 11:08:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91EE460650
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91EE460650;
	Wed, 15 May 2024 11:08:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 493581BF23B
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 11:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35A6D405F5
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 11:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xErNbK_LmJqY for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 11:08:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5959940154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5959940154
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5959940154
 for <buildroot@buildroot.org>; Wed, 15 May 2024 11:08:22 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2b370e63d96so1693355a91.3
 for <buildroot@buildroot.org>; Wed, 15 May 2024 04:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715771302; x=1716376102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z7ov2k7HS7avI1JO5GAeficJYLNRH/m5bg7jcasTl/Y=;
 b=LXZMjq4zZ35hIG8fTgKvmFuVJ8uTuROb/wMQG2BnECNnYWZYh+H+0AzjfOl2acsxU1
 fJAadE83W+B0emVzFvc25jWEcfuCoLxaTTWEuA6OpzxM1u/FkIDL1gBguyvA1YpBrPwH
 CcZBI/Tt8Sw6PjTsO27pyls08JncgOJq8KGB3ed6/e6x3WDkrCDDNfdzvJMWBLOnTfsn
 9pMH5O2RgG/SJxsyQ+2RxEMC8jAdlnjxE2ANp79Lv7kmGdXrTfe+jqXfWpVlcykUhapS
 2ASZDpxN6I6Ekvj5cUEdI6u3D0OW0UQx2aj95QwT4W1nBdtIMEmt1iCS+Byfk52KCpcv
 Ogqw==
X-Gm-Message-State: AOJu0Ywg9YrZLGOkP1IBlGJgzwqaeZD7NFoJnWn7jnCPjScTK4in9hde
 VLodRI8frpHxtdDWKg1YdJfcmCs1fpOWU00mdVSx3wYb7OAN6Pf60hruIhC4kJRs7KF87V4sh1O
 3VELBZKbj8igH/tnVpJLRXxmAYls=
X-Google-Smtp-Source: AGHT+IEJ3N2lZQ9gXfwups/Rema4xMtWZfnzaWXwAA+qmGF9/8J0mkQ6u1wNRrnsH6bp7rfoc9OBx+BAryBhRkQRI7c=
X-Received: by 2002:a17:90a:8c7:b0:2b6:20a0:441e with SMTP id
 98e67ed59e1d1-2b6cd1f1b31mr14334029a91.4.1715771301608; Wed, 15 May 2024
 04:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240515100209.24769-1-sebastien.szymanski@armadeus.com>
In-Reply-To: <20240515100209.24769-1-sebastien.szymanski@armadeus.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 15 May 2024 08:08:09 -0300
Message-ID: <CAOMZO5AvCmYZDD_0DfcuBZqyS0Fu9Se5PdtjfohH2yPPGQdbjg@mail.gmail.com>
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715771302; x=1716376102; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z7ov2k7HS7avI1JO5GAeficJYLNRH/m5bg7jcasTl/Y=;
 b=CZPSHwg0ME9yKnXnMRZ8YC6Pk6feFqM3JGa7o+A57F1LycCY+Y2WlW8F2+ESuK34Zn
 vXyc8i+NOH/CcxrQZwYJKkJ+7lslB2lBmc0K425UOvTH+hvfbgkUIQfL0JKaOJJz2gLp
 mmlKaR0Ejkj2RMXhIoIZpQAvZ8GAvrcH0Isp5pSGOcjFMgCvrMzB5H48xSU274ICmrlu
 XE9YeDBtT0i3ZNaIALY/4ZrIoLEKhZsg5b1x+H+X4kXRKEhSLFmColS+3TqJlTPnrfgC
 4U2vIbHmqahZHAswPaaPnzIbUa0gxZ94JsOLVJf5VHCWgKPGzl6AQKpnDDYKTo9Enddn
 d5Og==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CZPSHwg0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/nxp-bt-wifi-firmware: new
 package
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
Cc: Julien Olivain <ju.o@free.fr>, Gilles Talis <gilles.talis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU8OpYmFzdGllbiwKCk9uIFdlZCwgTWF5IDE1LCAyMDI0IGF0IDc6MDLigK9BTSBTw6liYXN0
aWVuIFN6eW1hbnNraQo8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+IHdyb3RlOgo+
Cj4gVGhpcyBwYWNrYWdlIHByb3ZpZGVzIGZpcm13YXJlcyBmb3IgTlhQIFdpRmkgKyBCbHVldG9v
dGggY2hpcHNldHMuCj4gSXQgaXMgbmFtZWQgIm54cC1idC13aWZpLWZpcm13YXJlIiBzbyB0aGF0
IGl0IGlzIG5vdCBjb25mdXNlZCB3aXRoIHRoZQo+IHBhY2thZ2UgZmlybXdhcmUtaW14LgoKVGhh
bmtzIGZvciB0aGUgcGF0aC4KCklzIHRoZXJlIHN1cHBvcnQgaW4gQnVpbGRyb290IGZvciB0aGUK
aHR0cHM6Ly9naXRodWIuY29tL254cC1pbXgvbXdpZmlleCBrZXJuZWwgbW9kdWxlcyB0b28/CgpJ
IHdhbnQgdG8gdGVzdCB0aGUgSVc2MTIgV2lmaSBvbiB0aGUgaW14OTMtZXZrIGJvYXJkLgoKVGhh
bmtzLAoKRmFiaW8gRXN0ZXZhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
