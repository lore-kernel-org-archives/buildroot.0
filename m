Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F653ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 07:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D385D416D6;
	Wed, 21 Sep 2022 07:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D385D416D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xplImQK6H53Y; Wed, 21 Sep 2022 07:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6E4A41694;
	Wed, 21 Sep 2022 07:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6E4A41694
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2C81BF3E3
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 07:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D971B41694
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 07:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D971B41694
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EV36f_3dbyU6 for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 07:54:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83FF440A02
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83FF440A02
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 07:54:00 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id p18so4832264plr.8
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 00:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=4r0/2rYF+ryDv0Cz/xVGlbxkG5yJ2+d3z2OVC3dGhSE=;
 b=FXuVjuxLpfpkUUiQIZ0jaVk6NqAGPPIczCaCXfbcQAh+s5m+5ZtL3wikw/FSogtXUg
 evA4LW58BadlUY+9WrnGHPM+lsf/b5FXw608kI1JdWSY22DG4cK03+AcsGXpzkHci+Rg
 1baHBaOsLeXzmgwxhJl6hMQ7x++h7r5VLkid4qDqO1hEvfBbDFS1+hyRlQ/+Ps5CzHOv
 x0TECoTlsp6XTAzyZ0h9qdlWU2TqngDHpEIb7PEiuZHexKH6aMbcHBRI8JxskTJwWzn+
 jl5OIojmQLKwC4ooX9LpNUAb3q6ss3q078tXAieGAp5P7c+vGbqJhkU+3BzaLW0MxN7i
 J6EQ==
X-Gm-Message-State: ACrzQf0op9rBtv58zmUauhPY45jj57raBgmprPfh6j01LGJYe/m3xJ4W
 GeWj+SjXYkJFcjxNuoomE7WErsg5oYrF9A==
X-Google-Smtp-Source: AMsMyM6C43pRXhhFONlmpDDDZfu4MrSkAbTB7T5VKeczmyDu1MY5062gCL0WMV1/2DWnLUgYqFJkTQ==
X-Received: by 2002:a17:902:ab17:b0:177:e928:8cb2 with SMTP id
 ik23-20020a170902ab1700b00177e9288cb2mr3422830plb.62.1663746839790; 
 Wed, 21 Sep 2022 00:53:59 -0700 (PDT)
Received: from p1g2 (2a01cb000f8924009b068b28497d15f3.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f89:2400:9b06:8b28:497d:15f3])
 by smtp.gmail.com with ESMTPSA id
 r28-20020aa79edc000000b0053e62b6fd22sm1362093pfq.126.2022.09.21.00.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 00:53:58 -0700 (PDT)
Date: Wed, 21 Sep 2022 09:53:53 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Lang Daniel <d.lang@abatec.at>
Message-ID: <YyrDEeMJ3/zFj1Md@p1g2>
References: <VI1P190MB0493C482B0410D1BA4C37F849F4C9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1P190MB0493C482B0410D1BA4C37F849F4C9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=4r0/2rYF+ryDv0Cz/xVGlbxkG5yJ2+d3z2OVC3dGhSE=;
 b=CP0uW/B4x4O+u7FZDrqgZYlHj+HDXdCD4MNP/4QPCQSaM6MtleHt7no+RO5Lei9iHo
 Vgsn9sV3L+1iVAoqfQEEHHjs2eYPUIZe2wA8NLQj0p2TB4ahDOeM/GtMQZtbaWcVmKGs
 fs208sooQzZ2u0UGuUttqWuoIgbUt+YzwNFxk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=CP0uW/B4
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-gpu-viv: fix
 gbm.pc
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
Cc: "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Daniel,

On Tue, Sep 20, 2022 at 08:17:13AM +0000, Lang Daniel via buildroot wrote:
> libgbm isn't output/target specific, only one version is included
> in gpu-core/usr/lib/libgbm.so.
> Similarly only gbm.pc is included and not gbm_x11.pc.
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>

Good catch! Thanks for your contribution.
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
