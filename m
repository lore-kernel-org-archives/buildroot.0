Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9738DC021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 08:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C9796128F;
	Thu, 13 Feb 2025 08:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_LOO7vUQoMc; Thu, 13 Feb 2025 08:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30BC26129F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30BC26129F;
	Thu, 13 Feb 2025 08:50:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EE8C12D
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ADAE8356E
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZYw5SBBZHDt for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 08:50:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92C2983546
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92C2983546
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92C2983546
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:50:42 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5450b91dbc8so557614e87.3
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 00:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739436640; x=1740041440;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t4TWIvej/4L6k+j4m8Wb2ZeyRH+yOzpnAhSIizi62Jc=;
 b=Jtizlsgb4qU/kFBEGG32rfqBWmRhCJVnE0CvKEBnOSPyPAsTCkDr31W/FayoxrwHjO
 fmIfFNFkHnnT1eC0U6LoK4ZYNRxKu5vXpoA97r2uRQaoDA5JdGTR8g9VmBRfCKDDb6rH
 9erAj9r3lP3yS047jau3zGNtRHtYfFYV76zXQGTP3V6i4Z8lE+K66NP+dK4x7S92Wizz
 Vj5PZ9OZMO/hBYcYLQfn5kTIx0dSYH8D+PtRiPGGy6oMi0kPAO4n/XcWZR8sHK+6emMe
 rdlpo+mgA4NoyWl5nAFq3+7liwGkuaSLc+BCNMpf0dg/8YeMyWIWOZ8QriC0uzQFbz6X
 o1FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcAxsVNGwPLvErq6lEtOttgEbAMB5tHsjKHN02idnrm60AV2kc7cKJaQK7+d+okYFlfzMo44BKbwM=@buildroot.org
X-Gm-Message-State: AOJu0YxsoHX/QCnDpZfnGUwMsoEfMZzckusxKAvKYb4rDmqaO9ycTdao
 7piGf2DmxW4/72wfQt3khDrJKZLZrxbWQsnSI5XZke93xs77kl79p/GxrO/n
X-Gm-Gg: ASbGncu7cTZK2Y0q/rt4/jAPxVrKcj+1jhYj5gBmOhWGgrrTs3KRPmKSmbPBgVGRGaE
 h1s71T6+XWm0Dx1rFZQN589iJj3lNl+3dkWzTQdd9SrlC9X0qoonRpTvTT5W8C+fkUQLWUKY6vp
 N5cr+e7DcVTbEZv1SGrJZEDfuvTI5FadHIPHzjPpS1w0fUsogPVSeZSnx2OEMR4xJd94Sa3cv0t
 pBZPOepHx5gFX8Mjgo/U1w1fTJnkqx4I07TzVMtch2yz+ZinfB56mbjq7epbm8i9comlPZ+oXjo
 qgT4YxI=
X-Google-Smtp-Source: AGHT+IGU2Ms7Z0dxmnS/rtUoPhTUC4+pPMB96fH/K3PIOrec9qzbNAYh/wcaGky91wcaChgvSet1FQ==
X-Received: by 2002:a05:6512:3992:b0:545:93b:30ab with SMTP id
 2adb3069b0e04-54518123286mr2241164e87.31.1739436639973; 
 Thu, 13 Feb 2025 00:50:39 -0800 (PST)
Received: from curiosity ([5.188.167.4]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f10e837sm106076e87.181.2025.02.13.00.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 00:50:38 -0800 (PST)
Date: Thu, 13 Feb 2025 11:50:35 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 linux-amarula@amarulasolutions.com
Message-ID: <Z62yW6nlzZw2OlpB@curiosity>
References: <20250207231203.3952765-1-dario.binacchi@amarulasolutions.com>
 <96b69abb843dc7292777c64f6787f134@free.fr>
 <a023971c7c8bfa4826a9a8721500c7ff@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a023971c7c8bfa4826a9a8721500c7ff@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739436640; x=1740041440; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t4TWIvej/4L6k+j4m8Wb2ZeyRH+yOzpnAhSIizi62Jc=;
 b=jTvSMazuF4waTp+lsn0AnTKwm9KZBF3qFc6A+yVELyhlYSFCAWA8ktJxgUKjInlG5K
 4Hlw0PDPTEO8/v5xRNktW3ozY02zCTjJHSzXmdiIIsf/8rwrK3EO82dFCGDiIOqnYHmr
 Q9qJG1KDcykBU5w1APJ0Bo1SI6tgpNUKkvoiZhNFW+vLB2SbvXipUtU02k1UaM7Yiv6T
 Mrv55hHtxkMikGdctDkJT2fi0QTRlBH8GZeY+Hf14V18W5XqkKgKWiY+rouCYWJwHnds
 lwem7tz+mYdTmMf4S5vnSxHDE/xoup8pk8cXnq8bD3a+YemyP+eIBwxHYDkitdtBedcz
 5noA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jTvSMazu
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: fix binman failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien and all,

On Mon, Feb 10, 2025 at 10:16:05PM +0100, Julien Olivain wrote:
> Hi Dario, All,
> 
> On 10/02/2025 20:33, Julien Olivain wrote:
> > Maybe we could introduce a new u-boot Kconfig option string such as:
> > BR2_TARGET_UBOOT_SCP_FIRMWARE and properly set the u-boot SCP
> > variable to this value (and set it to /dev/null if empty).
> 
> After quickly testing, it seems u-boot and binman can take
> an empty string without failing. So there is no need to
> set it to /dev/null if empty. So if a new Kconfig is added
> with an empty default value, just adding
> "SCP=$(BR2_TARGET_UBOOT_SCP_FIRMWARE)" in UBOOT_MAKE_OPTS
> should be fine.

Am I correct assuming that there will be no generic fix and
the recommended solution is to add the following line to all
the impacted configs:
- BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
