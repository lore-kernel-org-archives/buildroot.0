Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895F0C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:23:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CA8460F13
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CA8460F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCE706084D;
	Mon,  6 Sep 2021 15:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgV3ika5t918; Mon,  6 Sep 2021 15:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FD826081A;
	Mon,  6 Sep 2021 15:23:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38DD41BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DFE74047D
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yofq7nSsSOQB for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:23:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 091A14015C
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 15:23:26 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id t12so14063559lfg.9
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 08:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8wmDpgojZbr/5EPUwnLGFs8g7vEbXVYjhaFTssO7iZQ=;
 b=kjHLdodSdnlFM21YK8W/xC1coxkLyDhuPDibR3t583ufSWW5Z6mXy27FdHGgCJGJoO
 fzTFevaTxcd/fzxgT5uGuQsGz1Re5LqiYhDy7Z8x4gJ0RG6DO1xHKkrWRaDqIx9LMYIM
 Fa7t3okzxE1adUYGXX1sf/bgCNZM3hpLmCMUaEnha1kEjLyS/KRaPLc5nxVfGuRuE2q3
 MG6XX+wubVaiqiHW6ktHhl3HqL3lTHjx7fobumksBzxt/i+2A2iwlQhZE5t+eFZScaMg
 9wx6/C27u7gVI6/jcCTk0HLQ8Cyg92YrjS01+pwHJoLLNLzcZGDAMGNLsRbulmvjOfri
 eEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8wmDpgojZbr/5EPUwnLGFs8g7vEbXVYjhaFTssO7iZQ=;
 b=a8wytkNKW335Bw1cwZebvK4mEG5JPUNdZaXvyNhjuCKNcD+TvEn3goWkYU63TjOxPf
 BBnWYKIFpMSkVrbferSgVdO3f2s+yvs61M9W0zWAmc4y/AJESfpdJQup0nehc5GHUJjJ
 PssMZSQ0bXwRQEV7Z6DApFQlJ57w1bj+E7wi/pRVsbFCUkwWqytnBGxWPd2HQo+uhllc
 7IrdDEwunyTvIWFyY2txoLnxIPkPPfhlx8h0V9ygYpka+TOWY7FCc7FaIl2dl8zxiPp/
 3mmzod0YqNbxQiy0lfHDZ0dJ3lNzecZYPRUGOrcPFnLdDD6wYirjpIbaa3a+pY2kFTUF
 HHHg==
X-Gm-Message-State: AOAM5329Io9H4yF9HFCGLdri2Xkqo1iGm1ZWXHpqdGXiWuSSmw6rWETP
 YT/2NO491ZLqdaR+k9OdmwI02j5aVtlqzpmdgJw=
X-Google-Smtp-Source: ABdhPJwHk5V6I2L79JQLOtirXgayQGJNkQ5TQjDDAj9l8c4AZDui6sDWf6jEZbTadPuUBytEAK//xuf2Yl3qBT3VGgs=
X-Received: by 2002:a19:4817:: with SMTP id v23mr9933640lfa.154.1630941805005; 
 Mon, 06 Sep 2021 08:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <CAOMZO5A4FXz+3M1m+aQT4hfWtBCgLo7-3c+pOV8XXrrGGY4-=Q@mail.gmail.com>
 <CAEyMn7ZpntE-ZFPrU09oiB5LStkbf-7BBTV1PqJZ3X48pjmCEQ@mail.gmail.com>
In-Reply-To: <CAEyMn7ZpntE-ZFPrU09oiB5LStkbf-7BBTV1PqJZ3X48pjmCEQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 6 Sep 2021 12:23:13 -0300
Message-ID: <CAOMZO5ACyWzrmLjnB5M0We_grP7DMXYUkiTTeghz_EH_6Z0Y_A@mail.gmail.com>
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

On Mon, Sep 6, 2021 at 10:32 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:

> What board are you exactly asking for? the nxp imx8mm evk? I have a
> tree for the kontron pitx-imx8m [1] that has an i.MX8MQ.
>
> Maybe this also answers your question ;-/
>
> [1] https://github.com/hthiery/buildroot/tree/uboot-imx

This helps, thanks.

I am wondering if we could make the files below generic?

board/kontron/pitx-imx8m/post-build.sh
board/kontron/pitx-imx8m/post-image.sh
board/kontron/pitx-imx8m/genimage.cfg

Thanks
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
