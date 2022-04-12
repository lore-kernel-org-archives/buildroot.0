Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812E1C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 05:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEFA660F30;
	Tue, 12 Apr 2022 05:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HmXlNG7FiIZ; Tue, 12 Apr 2022 05:58:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01F5B60F04;
	Tue, 12 Apr 2022 05:58:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6BE31BF362
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 05:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDCB840141
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 05:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xvXeRuA8zFxk for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 05:58:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8421400EF
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 05:58:47 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id bn33so22737326ljb.6
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 22:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hHlgPsQPIrAA5Dd5bOHAwA8Yq2y4BjaNC8qCzSkweY4=;
 b=mbubmUO6rXRFUrwy49rw/00/PZDMgrh77h/1HYK05uXsCGET7FZEGWl4HOAo+Rh7J9
 4fA9mTPH2q0SJ1uBJPAZ745u5qS7Qg1mLeBWGIPFs74U+ayoEqHW6e6oOxT/Z3Uux1nE
 7efaS+WWM0svMiuHszwYwPi5artAf1w2duATAie3Vwv+vNri7uw9+SxbVQHb0mmTqOHG
 xH2lDxwbW+WoAiIp6qG+iGrzfmTj6r53EtOmPx8YCEJepP9TP8Xw9KEK7JB6imKHMxLw
 2EsYCU0qj1hl8NMj/Ag7ijssln3YpQg3KY6kg46J3ZkGiOtqOxQdstJJCOpuK/YHBAbd
 EE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hHlgPsQPIrAA5Dd5bOHAwA8Yq2y4BjaNC8qCzSkweY4=;
 b=aHolIEhKBJV84gjPMr5uurexDG7GpPgpHfRZS7VKhMV4gYrnps9hg3DVe8BlydZfm0
 RGV7WBvEY/rsEu+PcZz2tykY669aqJ6EB5rT7oOXFmm9WilXvRupaIXaYgmiCUu2rWP/
 x1eLScRTXAwA6Dzwj5XfwhdhtezDRr4vYNbGzjz2E13j3+7m/Zlr/U0GUYy29n3qpwHT
 +XyYppua1WPGr3Awauq0yyJ3oex42+vxF3E5cVnw5vnfpkV/+qiJplsQrZZyKOzGhKXk
 /X/dSLxzBJ0M5HVnV8nxy3JlXPhxu6rdR/pwN5wl0GZahEUH1IeDAl5h8XauHQPGCA+4
 5ZHQ==
X-Gm-Message-State: AOAM531maeBVzP2QHa3YwIgXFuDMrPuPZkz/yv6p0x2GW7x0MVlTo4Zs
 LQ9gA1lgKEyZchMvuDVhta4=
X-Google-Smtp-Source: ABdhPJyaDENg16VntMJQpIBheQFkLLkZd1EnI/lWa4djPJM2Ui1+ScEardG2ZqmqakAJUIZLB5T1pg==
X-Received: by 2002:a2e:b557:0:b0:247:e509:4a50 with SMTP id
 a23-20020a2eb557000000b00247e5094a50mr22444500ljn.72.1649743125393; 
 Mon, 11 Apr 2022 22:58:45 -0700 (PDT)
Received: from curiosity ([5.188.167.245]) by smtp.gmail.com with ESMTPSA id
 i14-20020a198c4e000000b0044a279d25d2sm3530423lfj.244.2022.04.11.22.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 22:58:44 -0700 (PDT)
Date: Tue, 12 Apr 2022 08:58:44 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: yegorslists@googlemail.com
Message-ID: <YlUVFKENCWDx0gA7@curiosity>
References: <20220411090723.13504-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220411090723.13504-1-yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH] package/wpa_supplicant: enable libnl for
 the WIRED driver
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yegor,

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> BR2_PACKAGE_WPA_SUPPLICANT_WIRED also enables the MACSEC_LINUX
> driver. This driver requires libnl.
> 
> Also fix CONFIG_DRIVER_MACSEC option to enable only the generic
> Linux driver and not QCA extensions.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2dea7dee521794b306cc610601fda322987e6cd0
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks for looking into this issue.

Reviewed-by: Sergey Matyukevich <geomatsi@gmail.com>

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
