Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876B2C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 15:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4919D60A9F;
	Thu, 25 Jul 2024 15:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C35b_iVRf7e3; Thu, 25 Jul 2024 15:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A58C60AAF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A58C60AAF;
	Thu, 25 Jul 2024 15:27:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3866B1BF357
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 248184034C
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUFGrB4vEC2k for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 15:27:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=jp.baltazar.mendes@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E0784033C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E0784033C
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E0784033C
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 15:27:29 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e05f25fb96eso971475276.1
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 08:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721921248; x=1722526048;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lVqNXgFyUmzdrLAmI2bVY94KxoNUbxMUnEKF1K8+XeQ=;
 b=McswSWlhIXQoeg8FPXD8J3f0jCgXxPNtxRY6KnuQtStTRopmBNdue8zPCNozLjx+zV
 98nbkUR665wHKXYWrka3WH4qdlrwlSRJXNugp8Oosdxf6zBvyGnDkORWogoo/DtI0RP7
 0CLzgnNHQ0UYZVLM1ccAwfc/1yB5ITgCAg1Esi+qQutMw/OTZmZQzJs+PKnOIGhPho4p
 ypUk5Th0JYFk/EsYCTb6/lgzJk3E7S9I9Kpb+qfLOuAGhEgjj9gxFsytGvEJfvTmeJSn
 4MEbU2yUREq5RAlmPuNvh5THUrijYFhnYeRgYH0AWl7fcHf8EdoewoGQOnPPPggCRSZL
 Ixrw==
X-Gm-Message-State: AOJu0YzxmnHwS0bhk0iBxVVIzpBbzhxBBBMTdtct/DSGAiz1HuZrwLG6
 WFTZstaTyPFvzIm1qOGTdIf1GNuNryVR9DnWw1xf2dbYBa40z8GcLPzS/FTL81LIXIS9zz5N1yy
 b8+4J+O6ueXAk1DKIJxEy8vWqqphE
X-Google-Smtp-Source: AGHT+IEc3WKqg+06f9gujBB9sgsyOI63NogKobBJxnerHEZkMTzgr0vZQtzPvyRgUoXvVzGRt8lsbmZ9iRNvItVNK/M=
X-Received: by 2002:a05:6902:2b88:b0:e08:5934:4bbf with SMTP id
 3f1490d57ef6-e0b2cad14e2mr2910696276.25.1721921247827; Thu, 25 Jul 2024
 08:27:27 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Sm9zw6kgTWVuZGVz?= <jp.baltazar.mendes@gmail.com>
Date: Thu, 25 Jul 2024 17:26:51 +0200
Message-ID: <CAFAK9+cYzvio3MuLh+WKJ6y1dJi+BMU_ywRoyH9wG8XFPMtD-A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721921248; x=1722526048; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lVqNXgFyUmzdrLAmI2bVY94KxoNUbxMUnEKF1K8+XeQ=;
 b=dItrVkfLSAMhE14Gfhb13Sa8ssnF8ow5iCT+vp9vf/mJvMijePq4qWzdMuflGaM6kf
 ANA3OEx42cOJo/XNB75sCU11Fe5ww69MRg4mApIHtJiM1p91GRz0OqWtTZp7Syefjj4v
 Gq7aKchqJx/Z/v/czZP3ohlGGeNP26aKZ1cVBTb2bxrIHI8p15Y8Ay+hLFoI8PHFyifE
 7FUpkIqflvxCnYp0YxE6pmknxNp5mLms7yPVAzN7wZRFcKFmyeTzYiI0XFXI2SHI0cvz
 N5qN0Hos3TBIuKZp/jUxOIYIgnalr2YdgUKYid+T9ci1VDs0WTXUSFRZfzXkgr9lU2dW
 BItg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dItrVkfL
Subject: [Buildroot] Individual package configs
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
Content-Type: multipart/mixed; boundary="===============3633914200913606325=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3633914200913606325==
Content-Type: multipart/alternative; boundary="0000000000004ee215061e140805"

--0000000000004ee215061e140805
Content-Type: text/plain; charset="UTF-8"

Hi all,

I've noticed that the configs produced by individual package commands don't
ever get written to the .config.

Is there a way to produce a defconfig with the individual package changes?

I specifically need:
- U-Boot
- swupdate
- linux

--0000000000004ee215061e140805
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br><div>I&#39;ve noticed that the configs prod=
uced by individual package commands don&#39;t ever get written to the .conf=
ig.<br><br>Is there a way to produce=C2=A0a defconfig with the individual p=
ackage changes?<br><br></div><div>I specifically need:<br>- U-Boot<br>- swu=
pdate<br>- linux</div></div>

--0000000000004ee215061e140805--

--===============3633914200913606325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3633914200913606325==--
