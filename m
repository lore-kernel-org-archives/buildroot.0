Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6837FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:29:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDFA16108E
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDFA16108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C80A60BE3;
	Tue,  7 Sep 2021 08:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lXz3b0-ombIF; Tue,  7 Sep 2021 08:29:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD2D60BF4;
	Tue,  7 Sep 2021 08:29:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E25B1BF48D
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14C6A80E53
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jusRLvdUS3Ll for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 08:29:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 873E780E0D
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 08:29:11 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d17so5349620plr.12
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 01:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IrfZ2+2cc60pWt+6QDtbAL9KGhYTR3UwW2L5Og1qgTE=;
 b=QF2KOaooyhXCeA+nGvqiaAjLERBnxNmY0r7ktup6cvrsVeK+3yz7QnFB0g46l6d0RF
 QMfIvSZ3wW/1s/IPOo2GGoEXzNAwbIFQwvO/zQWAfCqWpYr67CD/RHMP/8nrZhWPwjj8
 GxOf2Yziib8GStZwc3A1M8KxyeCICNwhpLIPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IrfZ2+2cc60pWt+6QDtbAL9KGhYTR3UwW2L5Og1qgTE=;
 b=gCAoqS0aEZabxAXe0L2dt07Aftz4GppWyGwpafJh4fbTXW+q+beZ0vrvhQkaP2aPo1
 XkXz5ZyyYBx6rs3kMR7Goy6Dn2jhhZyusEzG391je8wvvtG3kddPShu3QkAiKBrca6MO
 yszjnse5K/fHoKuybjEaqfYghI90fBELDp+TqAWgHWvHq7cAm24j6yjgWXl3zmxOk7VL
 9DxUTKLcVYCPqZMDnRczvnRlOF+RgX45mgJ/hDMrEH8WT+KKIzdkG+rSgykc9ML71sj1
 FLk7itmifydDG7w2vs1k8+mmswoVtEwVJJYytf5oW67+4u6zxZcxeA+jvAtzOKYhk0yD
 i+iA==
X-Gm-Message-State: AOAM533xQ3n/edmtqE+BiY8I6bNsMU3LCkmULctSBw7NGQuK94xxPATE
 Vv02st3Xda8a2zwORbuJhOz2qw==
X-Google-Smtp-Source: ABdhPJzmttehGq4p4NRNa893dbyDuU18bDb9FtEJP/4MxfC0JXEGIuwTu6MPVaXUY7Lq2Uk1N5M6VA==
X-Received: by 2002:a17:90a:194a:: with SMTP id
 10mr3225768pjh.221.1631003350632; 
 Tue, 07 Sep 2021 01:29:10 -0700 (PDT)
Received: from p1g2 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id j11sm10007780pfa.10.2021.09.07.01.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:29:10 -0700 (PDT)
Date: Tue, 7 Sep 2021 10:29:05 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <YTci0Tb9VnyrGjd7@p1g2>
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <20210906094214.6142-2-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210906094214.6142-2-heiko.thiery@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/3] package/freescale-imx/firmware-imx:
 copy all (lp)ddr files unconditionaly
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabio Estevam <festevam@gmail.com>, Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Thiery,

Thanks for looking into this.

On Mon, Sep 06, 2021 at 11:42:14AM +0200, Heiko Thiery wrote:
> In mainline u-boot more and more imx8 boards are switched to binman
> to create the imx specific image (flash.bin). To support this the
> (lp)ddr firmware training files are needed. For this to work all files
> should be made available to the U-Boot build.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Hopefully after all configs switch to that mechanism we could get rid of
the old way of creating 1 ddr binary from the package.

Regards,
Gary
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
