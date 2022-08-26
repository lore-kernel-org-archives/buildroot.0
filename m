Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32B5ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 19:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EC41607CA;
	Fri, 26 Aug 2022 19:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EC41607CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qq3PmCjcZZCt; Fri, 26 Aug 2022 19:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 842F7607BC;
	Fri, 26 Aug 2022 19:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 842F7607BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B62B11BF2F2
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 19:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97C0A607BC
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 19:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97C0A607BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ou3NjluZUNif for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 19:48:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 845A860769
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 845A860769
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 19:48:23 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d12so2434956plr.6
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=nUlGeIFTBRtHBEcUwzzV2+RYjwZc0ejgevK1YgRB3dI=;
 b=RhEGWtZNJwoKPYg+kxECZxIRWgJFrwmhYGREIaocfhlyFWS9BWn6Bxu/mPBBgssD2G
 h8Ey1kXiYflKn3Ng2Xn8GM54AnNqpKAl7+m6sYCywLIzzPdNQxEqAM09Jed/GLVFQWBk
 xBYWesFJoWzPXP1Hf8EAt00NnEyJ/KytV7i7mKebCbR9W4K1X/M/64kVlcedkdAUN22A
 auOC2vzRI+JdnnpbfuBhY0UUXU45+gItN25MTgw3NkgCWN44zzFkEZzxmJoFHzhUHxhP
 LK1T6JBFQZmQeww3Ql6FmFMEBxcH4gICL/598v/w5+u+hHe+QkJvjlUy6bjOCMkXpQYm
 UhIQ==
X-Gm-Message-State: ACgBeo16CnsBTp74DlTzHOTRFKS04OV4v1GXoAS0qhTyYJrnkDunbNvn
 ue/tE296NmU9YiqHKQmiR4YBjRSsPMzdtPMikGI=
X-Google-Smtp-Source: AA6agR4DkZCwAY8Pvyv0i9BWAYRtRQw+hy2LGJamtFh0awBUE59iTdRJ3p3QmkLq1VuZU+7ZfXi85vfh0TjqK3jeYuM=
X-Received: by 2002:a17:90b:3c0a:b0:1fb:129a:a5eb with SMTP id
 pb10-20020a17090b3c0a00b001fb129aa5ebmr5748254pjb.94.1661543302916; Fri, 26
 Aug 2022 12:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <DU0PR07MB85459BB1EDF225A093FA55A6CB759@DU0PR07MB8545.eurprd07.prod.outlook.com>
In-Reply-To: <DU0PR07MB85459BB1EDF225A093FA55A6CB759@DU0PR07MB8545.eurprd07.prod.outlook.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 26 Aug 2022 21:48:12 +0200
Message-ID: <CAB1t1Cw8RNLbLE7aMByNWnDguvfF3=Z_ew_aRqyVdRG3TC0g4A@mail.gmail.com>
To: "Van Den Eede,
 Olivier (EXT - BE/Antwerp)" <olivier.van_den_eede.ext@nokia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=nUlGeIFTBRtHBEcUwzzV2+RYjwZc0ejgevK1YgRB3dI=;
 b=NfBb2uxBzu9WY9nqbTXiPTT/+gdUcWRNSOIJ05brtyTIZsMoyAoZZRUymurKbMpX22
 URvULx0GtD4dB0r7mIwpPQBp2d51+z2ef7gYpvE/L/9Q4/Gwlzk94mS1PjkBHaQj0HKw
 gWWTnoj7OmNDNKlgoxpXeeSedOiwk//Xe4J0qNGdvOyWJL1uSPERrGciddSn0YNL1Sou
 kkKLMz1ZvYQTTSDvhtYakREDmd/XsexbY3wB2T3aj6fUTtVZdBkQF4xavuyK7RGcnbR2
 IwJyTUs69s/PJnVXwvSex0z3oZny88IGIL1kkp3aZXm1aqzvo5xtVM8aq938cZS/jKOD
 lc9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NfBb2uxB
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: bump version to 1.3.3
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
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6599130120681282328=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6599130120681282328==
Content-Type: multipart/alternative; boundary="0000000000005970df05e72a3256"

--0000000000005970df05e72a3256
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks!
BTW I don't see this patchset on patchwork nor even on ML or lore.

Kind regards,
Petr

--0000000000005970df05e72a3256
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@g=
mail.com">petr.vorel@gmail.com</a>&gt;<br><div><br></div><div>Thanks!</div>=
<div>BTW I don&#39;t see this patchset on patchwork nor even on ML or lore.=
</div><div><br></div><div>Kind regards,</div><div>Petr</div></div>

--0000000000005970df05e72a3256--

--===============6599130120681282328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6599130120681282328==--
