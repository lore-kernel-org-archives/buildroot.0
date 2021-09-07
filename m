Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51008C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:36:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1184C610FE
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1184C610FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC13340599;
	Tue,  7 Sep 2021 06:36:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ha_NUx9yPYFZ; Tue,  7 Sep 2021 06:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D164405E7;
	Tue,  7 Sep 2021 06:36:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F22E01BF2A5
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1B0380C80
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKtWlMqk8EvG for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 06:36:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D28F480BD0
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 06:36:43 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id l18so14796751lji.12
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 23:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ypd/eh/hasuMX3Fy+1Ya7WrP9hNdpkCcS6ZCV8QD7OE=;
 b=nHNgZhzL1QTAiaQwpaMqo1RRJ/zP8iS0BQazTkVcSkcmRouML5wPRpQFy7iwDAIRP7
 hYs/HhnuyYACRD/wb46hj43ZWmYSskhcuVfMJcXZ5THDYZGnz9DUNf3v6+z/11Qcj1Tq
 d53+2eJC+2UIF3c9W3NLlLBbzQ3F/mF4YQFZoI0Gp7aaXBfJXRpGKm/6zF2IoxNUQREn
 6iGRBb953trKSnTbvJoFNGWejWhMmHuvc+XGL8Ngp/YvgwBa5RpBH1u9AaX1Pn+mMu0W
 Knb8XTHgigQIg2LUzQeBGctZJmrAbCvTw2qJm07HekQd/EhPgaRexXSyd2kHpHcWapni
 rWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ypd/eh/hasuMX3Fy+1Ya7WrP9hNdpkCcS6ZCV8QD7OE=;
 b=NJJK2QFSFwqg2ZTyDB+XqmLe4JbL9MIPHGVfnI+j7tn6iQgnK1bg1x0BxdUI2TJjWp
 xcJqVN9GnYrCgKmFzPXJ4MDfzOjx22+D/nC1T+dsNGQpSaKEVxMQlf2wFRbm595AXvLC
 qwD88SrjpZRNNRymALuWhlWXx87tSgyWh9d4jXNgSy5lQt01ZIhN71KlVl65rSXYxZhr
 y6554BwXf/nO8uaGm7tmo1LDnH58zmITlS7AddgdxIm0B5p5OiscO2FENqdisCE2wOgm
 kePT1O5vVcsNIOKS7smxZAvRXsmlIcSuCyPTv3Sl+gkRHSSYt6Kc1Op5z4lkzgi5Bnro
 Ss0g==
X-Gm-Message-State: AOAM531yZgWa5Vcrz7RYon+rsL1gR62rxud4CPCSS+tcPFaiRKEkQYlQ
 37ynm6WiECBhMNH+thpjTIjgISl5OEiJdlTGZBQ=
X-Google-Smtp-Source: ABdhPJyzrIPEpw3GXLucMC9opsUbSvQ92XDV/ETXZFKq2Kzoiy8oLUJW/2XHH5MAFSsVJBA+9RYHYQ0uGRyunIO81ro=
X-Received: by 2002:a05:651c:160f:: with SMTP id
 f15mr13601963ljq.276.1630996601468; 
 Mon, 06 Sep 2021 23:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <CAOMZO5A4FXz+3M1m+aQT4hfWtBCgLo7-3c+pOV8XXrrGGY4-=Q@mail.gmail.com>
 <CAEyMn7ZpntE-ZFPrU09oiB5LStkbf-7BBTV1PqJZ3X48pjmCEQ@mail.gmail.com>
 <CAOMZO5ACyWzrmLjnB5M0We_grP7DMXYUkiTTeghz_EH_6Z0Y_A@mail.gmail.com>
In-Reply-To: <CAOMZO5ACyWzrmLjnB5M0We_grP7DMXYUkiTTeghz_EH_6Z0Y_A@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 7 Sep 2021 08:36:30 +0200
Message-ID: <CAEyMn7ZKBHc8eCn=Uf_RsmRFrnMAOLVf7m_90fRZi8bCVcZscQ@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
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

Hi Fabio,

Am Mo., 6. Sept. 2021 um 17:23 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
>
> Hi Heiko,
>
> On Mon, Sep 6, 2021 at 10:32 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > What board are you exactly asking for? the nxp imx8mm evk? I have a
> > tree for the kontron pitx-imx8m [1] that has an i.MX8MQ.
> >
> > Maybe this also answers your question ;-/
> >
> > [1] https://github.com/hthiery/buildroot/tree/uboot-imx
>
> This helps, thanks.
>
> I am wondering if we could make the files below generic?
>
> board/kontron/pitx-imx8m/post-build.sh
This is dependent on the boot method used by the board. Here we use a
boot script. But other than that can use e.g. extlinux. I think this
is not a candidate we can make generically.

> board/kontron/pitx-imx8m/post-image.sh
This calls the genimage. This could be removed and added directly into
the defconfig as BR2_ROOTFS_POST_IMAGE_SCRIPT.

> board/kontron/pitx-imx8m/genimage.cfg
Here I', not sure. Because it depends on the used bootmethod how the
image should look like. E.g. do we need to have a boot partion on not.

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
