Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEBAC433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 19:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2764282871;
	Fri,  7 Oct 2022 19:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2764282871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOKzvW9SBm8T; Fri,  7 Oct 2022 19:10:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 622078284B;
	Fri,  7 Oct 2022 19:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 622078284B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B97E1BF3A9
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 19:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34C51417B7
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 19:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34C51417B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WzWIn8gj3TuO for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 19:10:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38540415FA
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38540415FA
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 19:10:26 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id x6so5339680pll.11
 for <buildroot@buildroot.org>; Fri, 07 Oct 2022 12:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbKfxLS0geow3ZiXztYPc2MbM0LJZwp6r3k9kigyRQg=;
 b=QX0XimnOn9pWZDzqBa8fTw8wR7KD3n1sMxzlNCNofsBQpAJxgF2Jl/TrXtEB2+du73
 /mSs3DHtdMCHt942/EVN/Tolx46asQpo/tB3DjywoLI7fk+kRMPUCh87O4tyQxXk+Oxy
 GHDVWV3r2lM/HFLkR+EBr6nn0mXGuJi1u4r6Az/pHEAPwJJ/FtHG166YllaFoMzcB5mJ
 dBj/bXdMuqwDXl28TNgR2xmlJJjVsccoVSFGNsdYVJir677XE3AVQ4/ioymHjqI3HlqF
 QYFwnM0kYZxoSQetrtWJHyD65OwMqLJ+zBK9VVM6jI6NVmvmOgAvqqi0TjA6t8zfeSnz
 fJug==
X-Gm-Message-State: ACrzQf1hJypx8cHSfieJvKm5YeJVRg98B5KwTimGDgzeCGkepDmA4cK/
 XQifMyeImifW6drPamMCENfRpg==
X-Google-Smtp-Source: AMsMyM6+VR2rZXa0Gg0q+TKy+zSQBjkBDmnYpq36XGjv7mBE3UmTLmQ19ZNmkwEWPb4ZMmZ4pmK7Cg==
X-Received: by 2002:a17:902:dac4:b0:178:2a6f:bc7f with SMTP id
 q4-20020a170902dac400b001782a6fbc7fmr6697158plx.129.1665169825149; 
 Fri, 07 Oct 2022 12:10:25 -0700 (PDT)
Received: from p1g2 (2a01cb000f892400bac0522898b75ff0.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f89:2400:bac0:5228:98b7:5ff0])
 by smtp.gmail.com with ESMTPSA id
 a1-20020aa78e81000000b00561c55c56a7sm2039231pfr.94.2022.10.07.12.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 12:10:24 -0700 (PDT)
Date: Fri, 7 Oct 2022 21:10:21 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <Y0B5nQEjiMFg/oSv@p1g2>
References: <20221004133057.2003750-1-aperez@igalia.com>
 <20221006095833.1116173-1-aperez@igalia.com>
 <20221006095833.1116173-6-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006095833.1116173-6-aperez@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vbKfxLS0geow3ZiXztYPc2MbM0LJZwp6r3k9kigyRQg=;
 b=Lqg487wkKvMv+ngKZnr/4MO3IsQAHq6jjEVJmPqSfGu0dMfNDWzct6Ji9co+yIBbuH
 T49CT8KsgUKHt4JkcXKqigfhzQS9qdHrX+oYUUd3AiqPFWo4J+8is6ahPhGj/R5sdu3B
 i42uaapCdZeqFGzs9IS5SNmnEXCN6hY/y8HqA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=Lqg487wk
Subject: Re: [Buildroot] [PATCH v3 5/5] package/cog: bump to version 0.16.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 06, 2022 at 12:58:33PM +0300, Adrian Perez de Castro wrote:
> This new version includes support for setting proxy options and gamepad
> support. Release notes:
> 
>   https://wpewebkit.org/release/cog-0.16.0.html
> 
> This imports a small patch to properly pick libdrm compiler flags,
> fetched from the upstream repository.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Actually applies to the whole series, tested on i.MX 8M Plus platform
(Vivante GPU libs) and everything worked fine.

Regards,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
