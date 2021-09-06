Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D302CC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:25:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A77461039
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A77461039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2AF2403D4;
	Mon,  6 Sep 2021 12:25:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5C_RQ-4-DJ7; Mon,  6 Sep 2021 12:25:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C4D7403E6;
	Mon,  6 Sep 2021 12:25:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 451181BF2A0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40D8B40227
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlZTPXwQhx5u for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 12:25:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29BA5400CF
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 12:25:51 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id h1so11082315ljl.9
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 05:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gonysBadUNPeEIE/kf5X7jw+aUGWA0ko53/p6R+0jD4=;
 b=EupAnrp+cLmZ6SenSQ+ymZRqwSusUR4//iM7UbWFshK3aAU9n1UFlWtFYC3bhzvON3
 DG0Ug42BWTAWY3eDfK16LNSnSItiOtMhyZ2XRPgqtmPW3PGkYQBiLfrMFOvlb4Dt7n/2
 Vq639LamKePw/p8sE/sEuVxsgRkThGbmed7gzCgpL8XKNybkMIwjkpoE9cBzsxd3XDK5
 Pfnp4sWsOhu81P3H5CbKz1HHjBNJaBZywJwOFXtG6LEXT2SSHT2yzihc+kC69zARweum
 GGJnt4rrquvc0GhWuL4PwFWgoN4yK4k0u2yCgIIUn+bOAlB3QG71oxDL7v52bNM7ksdr
 JCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gonysBadUNPeEIE/kf5X7jw+aUGWA0ko53/p6R+0jD4=;
 b=XfY3hkIwkKlVWmahjH22NlWiF4b2X8opRf+qXtkTpKWV/FQbY8gowgw26XVyT6dkvn
 V9efNMm+6BbU5zcL/qfYd4VbQURdUUW7iBHB8Jp6ZlZwdifoCUS8ok5VqQq3aZ+zTTjk
 XvB9B89/zxaATRkOg3NtIOJcWbTgdQ/2GI4crvrb4+ZNUYYlcG/5gFEaGUNWkfpJduVA
 3ENU/zm9M3UgWSkwWwunBlkbFuEi71RLuD2RtCBuI/M7kYg89obzpyvMf1NPMCz8LqOs
 EBd/Auzxfzv+JPPawxLPmChYIPpc0gQHnykRVdrwYbFDn3SvIxFI9cvppI5hi4yih9zG
 OL8Q==
X-Gm-Message-State: AOAM530ko69XyYbCfBb5c8GNjID5LtlCwXbHqSDX0QGN8T9Ob28glTRk
 YhBD5o5u5x/sT8ZIYpQ6yO/XOaHIeBqePvvcDms=
X-Google-Smtp-Source: ABdhPJy2tlqsXKBbmiKXopcjI6aXbVRTCJPP3S1kpvN9hCwdsw/RyeRQN3C7WAoMWi4pgZfaHJ/vUHoS800QOpq2Mzk=
X-Received: by 2002:a05:651c:4d4:: with SMTP id
 e20mr10341512lji.402.1630931149191; 
 Mon, 06 Sep 2021 05:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
In-Reply-To: <20210906094214.6142-1-heiko.thiery@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 6 Sep 2021 09:25:38 -0300
Message-ID: <CAOMZO5A4FXz+3M1m+aQT4hfWtBCgLo7-3c+pOV8XXrrGGY4-=Q@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [Buildroot] [PATCH 0/3] Add support to build imx8 images using
 mainline uboot
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Heiko,

On Mon, Sep 6, 2021 at 6:42 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> New U-Boot version support building the flash.bin bootimage using
> binman. For that the imx specific firmware files like (LP)DDR and HDMI
> firmware has to be located in the u-boot builddirectory.
>
> Xavier Roumegue already posted a patchset [1] to add this support but did no
> follow up version after getting review comments.
>
> I have taken up these comments and prepared the patchset.
>
> [1] https://lists.buildroot.org/pipermail/buildroot/2020-November/599906.html
>
> Heiko Thiery (3):
>   package/freescale-imx/firmware-imx: copy all (lp)ddr files
>     unconditionaly
>   boot/uboot: copy ATF bl31 binary to uboot package dir
>   boot/uboot: copy IMX firmware files to uboot package dir

Thanks for working on this.

Would you have a git tree with all the required Buildroot patches to
get a bootable imx8mm image?

Thanks,

Fabio Estevam
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
