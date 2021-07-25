Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 193BBC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:34:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D047D60E0C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D047D60E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A980C402A9;
	Sun, 25 Jul 2021 21:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWb8Wp135ZO7; Sun, 25 Jul 2021 21:34:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAD6940278;
	Sun, 25 Jul 2021 21:34:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA7551BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C71D460675
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id amubQJtlENw8 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:34:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F681600B6
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:34:55 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id hb6so13319186ejc.8
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=06XMMmMFLAuaDYp8k10ds9cHBQvWtXrkg9FoFkY0cM0=;
 b=ZfxZ+KIKQZajvWyvdRz2QTJUqSxVYAsp5WK6dHQnHR4MS4uE6oatpJzpDFcbk3pi2S
 DjD3C1TFWWhanPl8r9Ci7Nlzcod9tABDwIB//AEVvze71voqbEdbwQuUSNb9/GwoOrjx
 MMxoCHi6bnRhbV6XKVSpl/2ZB6GHD6Hn6d3bgxPATGiiwfOtvu498Xa6LjfZAaRBMyQf
 Gca/yPNoy2FvsUo386h8zRutJqFl+W8wBJE8xuVnrGMdhc1vYe0ZKmf9Sf2Jgt0a6Mb7
 ad5yEM01DPQBbErpF60Ba/6+V7VSxcpBd9UEZiQH/H+/hyIQNh/tbb4FIXcgVqMcWjEO
 1G+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=06XMMmMFLAuaDYp8k10ds9cHBQvWtXrkg9FoFkY0cM0=;
 b=shLjMeGu2AOqbEhf0EoXBrClsT3Csy1atKPx4M656P728RkhCCHY9190KTetKtxrXP
 KJWjJv7JLiklAH7p4qxW4aY/C4Mbpbg01ZFuvn+/oDGWOTdfC1jDRo947pqRjKIMmhpU
 prq42R5FMjNV/fN7/NzmEvghF7XNzG8/UCCUfyosvvg+iQ1s3pCl1E8TQSHa89zUJGQV
 FgsB/IrdfQ8+Vv7I5Lr6qMUSChJCFzYNNgbQY0FYohzultaRc42uEAsbjSBynDFznj5J
 EGcM6WlRMow3943nWY40Gk5zvHoEnEODfMhlZ/6g7rWE6m0Vyg0eXWw8eNA/MD6w+Tg1
 93AQ==
X-Gm-Message-State: AOAM533wIjINZD8L8j6Gzm+P+gNrXODqyXkM1ihRbXWq13/5o5/i/whV
 /xyn8l3mHuDCBkZy3D7dDQ3ZkvybmTszbw==
X-Google-Smtp-Source: ABdhPJz9r+synvGeo0u0s+WI/13ENFVAOPfDMwN/DdlGhmEP0p4nWddp+F3ktBtaGjTEkk0t6Foa+w==
X-Received: by 2002:a17:906:5f99:: with SMTP id
 a25mr14435144eju.101.1627248893354; 
 Sun, 25 Jul 2021 14:34:53 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id n14sm18049841edo.23.2021.07.25.14.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 14:34:53 -0700 (PDT)
Date: Sun, 25 Jul 2021 23:34:50 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YP3Y+q8yyrzhYlwd@pevik>
References: <20210404184126.974098-1-petr.vorel@gmail.com>
 <20210725233220.3196a0f7@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210725233220.3196a0f7@windsurf>
Subject: Re: [Buildroot] [PATCH 1/1] package/modem-manager: enable qcom-soc
 if libqrtr-glib enabled
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,
> On Sun,  4 Apr 2021 20:41:26 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > This plugin makes sense only for Qualcomm MSM phone.
> > Although there is currently no such device defconfig in Buildroot yet,
> > it makes sense to prepare modem-manager for it.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> >  package/modem-manager/modem-manager.mk | 6 ++++++
> >  1 file changed, 6 insertions(+)

> Peter, Alexander, based on your feedback, I have marked this patch as
> Rejected. If that is an incorrect assessment of the situation from me,
> do not hesitate to let me know.
OK for me, I should have done it before myself.
I expect package/libqrtr-glib/ will be used in future for more than just this
driver (now is this package IMHO useless, but that should change in the future).

Kind regards,
Petr

> Thanks!

> Thomas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
