Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC874C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 13:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64D12402FE;
	Tue, 26 Jul 2022 13:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64D12402FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdgSZcjx6oxc; Tue, 26 Jul 2022 13:05:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE6E9410B4;
	Tue, 26 Jul 2022 13:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE6E9410B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2A51BF2B4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 735624035C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 735624035C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQZv-gdTKajL for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 13:05:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88B64410B4
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88B64410B4
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:05:23 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id ku18so13420185pjb.2
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 06:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26m4L52dykCXWqezeqMhG1GU85ALz2297b1spGAPfxA=;
 b=faW9q8+rKuMwIdeyyQQss55KqxhRU9t5jAsKd4Cgrv3WisZsmpkZrqGtSi0oBcXXme
 TXWMJ3yTzmksnP5r7y3jwfvchevKXMHA8VcbIZ+J390DoPMDeNp4EeiQpVwBf3hdONMo
 7URP9WQkzkNGch/5CtwLwGPzBhnj+blxeeH1nTqNP4NcQeeaZ2Um5508a3g/7D3/DZBX
 mfWRKxKCmJLflryvdw7F64iK7olMc9uxknmA2iSyOyUZlEsntHywFMUjEwrvanQF3Me/
 XEoKxRb6bAlLbrbhGEw74LrKADHr/iQcm+Fq1YBCYlH7cPPvuh+JD+Os/zHjeZSCUVww
 FyVw==
X-Gm-Message-State: AJIora+wMQj5M2wyhEmNr/58kBhhBudCFpJnSY5mGbPZgCplhTeCDVPU
 S+KjK3xGjS9fjI9YVly/T7ANMV0g839N1tm19OvJ4ZGs
X-Google-Smtp-Source: AGRyM1thVfvbFNb3dInsTBPbH5ZQpy7AM0vCgLekoBlfev8eMLA2XjBDXp7/3q9HdXVycwPSUq0s1BCQb/BeQuS5oPA=
X-Received: by 2002:a17:902:d582:b0:16d:612c:2d6a with SMTP id
 k2-20020a170902d58200b0016d612c2d6amr13312713plh.168.1658840722765; Tue, 26
 Jul 2022 06:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <CABPiF0=6w4ZGfZidXFuaikLw=M_MkoSou=8tFmrP80WWGWHDSA@mail.gmail.com>
In-Reply-To: <CABPiF0=6w4ZGfZidXFuaikLw=M_MkoSou=8tFmrP80WWGWHDSA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 26 Jul 2022 10:05:10 -0300
Message-ID: <CAOMZO5DqxwGsNAXsimRy8q1DqT=PNVD=C3ezGu-KR7vUmQRqdg@mail.gmail.com>
To: bob mcgrath <bobwmcgrath@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=26m4L52dykCXWqezeqMhG1GU85ALz2297b1spGAPfxA=;
 b=Ff6xybSRdyZbw4IxkSf02pPR5BJyYeKm5D14aIShUpy1h3HxLnA2oRFxmflobWXYRO
 4IpLdgmDGYaHW3Sgh8VCKB5o3xKa6KOjXfg5zamLVk7yMiSVXC0Bidb/eWeZsEDPpBrD
 EU4vTVxA844BytAwi/xvbveAA/OGgswRqQwnfKHoLN56qudRAH1duoh8LbuwgTvmPRWj
 C6m8z8Ewh2TyWYTnsqGNT5EVKDwGp5SU26+DXft8SQahk3eVT0MgIlcub3PG+kVWTIWM
 KqY10vOpZqez+2yikEMc76ISx2ED43XGiVCDuFkDFOb5dVYMLlekpeIuSSJelJShnuTL
 TY9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ff6xybSR
Subject: Re: [Buildroot] google coral devboard defconfig.
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bob,

On Tue, Jul 26, 2022 at 10:02 AM bob mcgrath <bobwmcgrath@gmail.com> wrote:
>
> I am trying to get a google coral devboard to boot with buildroot.  Starting with the freescale_imx8qmmek_defconfig I have been able to get an error from uboot over the serial port.
>
> U-Boot SPL 2020.04 (Jul 25 2022 - 03:14:51 -0500)

I suggest you use mainline U-Boot 2022.07 instead.

> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"

Use a mainline kernel, such as 5.18 as well.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
