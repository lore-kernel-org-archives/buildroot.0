Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43287C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 08:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAF634186E;
	Wed, 21 Dec 2022 08:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAF634186E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdbgxlkMowsk; Wed, 21 Dec 2022 08:32:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD2E84186B;
	Wed, 21 Dec 2022 08:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD2E84186B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74E011BF3F6
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 08:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F17981F9B
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 08:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F17981F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crKcwL2gucgB for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 08:32:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5739481F95
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5739481F95
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 08:32:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id m19so10607062wms.5
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 00:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aDlvre/FbgGbClEoBVBlhSSnlR7DB1VVbl9MVHefk4w=;
 b=sELZjC+qER5pWrDzYFaoGjywqgXMs8fTmBlqxMBg66AZ274ebh6e0h5kesTaAu9LXi
 pbYAt6ZbujIYbAqkxJLXzZiqUbCFL+oBQw15e5LrwsLXcGmQqIGpcp5LnTig+OlZ5M1Z
 HJqqx0t8vteVtC67XNv2acsEfbP3wK1UIfm+8NLmPe+HIA0I7PSOWQL2wMoE2hqTrWEM
 wBmPe+dbllx6n7dS9pvUr5gFOxgK59faXLv2rOEyUAgmBE4huMG4iKR93siICTJELhNN
 Lt5UfRg0W7aEv9TK/bsyqC9gfQpdQOGVbA4xg+XEp1HuZtzk+GjctO3qiMf2lu4JqFO8
 q3TA==
X-Gm-Message-State: AFqh2kp4qgG+gdmYMcgEwh1IXwpv7K6gXH/Axj2zUYqpdgVRIoU2Ja2/
 WMCm0UBXmJu0sBWmtuTGxPD9nQ==
X-Google-Smtp-Source: AMrXdXvUwgrMZcIOEu5qM9aXca5UzpkIY9gIMHOIjtjzZbvTi4iuHLbdmIbZkmquprOkZb2eh7rRGg==
X-Received: by 2002:a05:600c:1e8c:b0:3d6:2952:679b with SMTP id
 be12-20020a05600c1e8c00b003d62952679bmr967248wmb.34.1671611554298; 
 Wed, 21 Dec 2022 00:32:34 -0800 (PST)
Received: from p1g2 (2a01cb000f892400bac0522898b75ff0.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f89:2400:bac0:5228:98b7:5ff0])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b003c5571c27a1sm2052108wms.32.2022.12.21.00.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 00:32:33 -0800 (PST)
Date: Wed, 21 Dec 2022 09:32:32 +0100
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Christian Hitz <christian@klarinett.li>
Message-ID: <Y6LEoC1iXjhW77XR@p1g2>
References: <20221220133454.1931855-1-christian@klarinett.li>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221220133454.1931855-1-christian@klarinett.li>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aDlvre/FbgGbClEoBVBlhSSnlR7DB1VVbl9MVHefk4w=;
 b=YuVlMnRPMbJMzV2SyLxoqxt623wAKUEeRaYAacJdCKL0N9h1oYpw0DAhLQli2NOKbm
 h1hG54BDkOeAUlIuD7+uzZ7jJR3lZoQbkotGJxzPkOZJM7i+eCt8UQddzPbkFGKi10Qy
 qIzrlsudiyb1eTa1jHR4mlOXMuaRPEiOUepPc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=YuVlMnRP
Subject: Re: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: fix
 installation with merged usr dirs
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Christian Hitz <christian.hitz@bbv.ch>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian,

On Tue, Dec 20, 2022 at 02:34:53PM +0100, Christian Hitz wrote:
> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> Currently, the firmware files are installed to /lib/firmware/imx. With
> BR2_ROOTFS_MERGED_USR=y /lib is replaced with a symlink to /usr/lib
> effectively deleting the installed firmware files.
> 
> Install the firmware files into the /usr/lib/firmware/imx prefix instead.
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
> Backport to: 2022.02.x, 2022.11.x
> ---

Thanks for your contribution, looks good to me! That brings the question
about linux-firmware that doesn't seem to handle that case either.
Thomas, should we have a generic TARGET_FIRMWARE_DIR that switches from
/lib/firmware to /usr/lib/firmware automatically? That way it would fix
it for all packages at once.

Otherwise:
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
