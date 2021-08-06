Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E87C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 07:19:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35FB660BD3
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 07:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35FB660BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7526608A8;
	Fri,  6 Aug 2021 07:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B1TveeFJmy76; Fri,  6 Aug 2021 07:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 328206087B;
	Fri,  6 Aug 2021 07:19:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D23E1BF83B
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 07:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CA2083611
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 07:19:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjE1x3yl7cND for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 07:19:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D685835D3
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 07:19:52 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b13so9797410wrs.3
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q5KT405gGmsTqWQTsyEgs4NcUldOVjaaQNIsDuyjnxU=;
 b=MjiODqLp52TqE9wgyl4do3wuGNao3kl43V0i68SDHIGVMnrsXwISLmrG85fKXl6FPb
 izgPcnkNtEFtssdRMtiwz7hp0o3QWxUTbXclKu06TL6sD8M0Q4asIU8dyWDHUL1zwvLS
 0JP6P6WQgiDpT/RWBrHfxnBuVkE1jW7vHUqRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q5KT405gGmsTqWQTsyEgs4NcUldOVjaaQNIsDuyjnxU=;
 b=dqbWpsWvgpzt48BY5j+JqiyR7kPSDy4DxHrhnq8bufClEbElbEUgPSxA/tbBn18fP6
 OhrdAi0e0FFXA1vExhJhTci465CHljS4qEhOS85WBYnOfXMZLj9X7qjbWVBABrKGamUE
 yqo4jjas2+PpxknkQ3LgfjhV+CVOfb4XrsD9Mzbug46DBuniz/XsRjEM5b1umB410gC9
 Yug6GohaF4om48tahldJEHwhLZDIvD6c4bYqCu08kzg2Dlnbs9/0QxPX9ZVD6uY+KJrg
 8Y/CNb7LtkwSrxDauZrEvcH22WVIOu4edquNcNcYyG1wLJWE+KyaZA11riDKPPF0UT8+
 9BSA==
X-Gm-Message-State: AOAM533zpwce5Z1r4pfjkWAbjFrcerbs/Ls8AZ5u9ssBDynknk7BS0Ms
 XeMdYCPNazFAd4IJr4EKRHUdyA==
X-Google-Smtp-Source: ABdhPJxEyt9kXns/GJixTnROEOOnY73AMDd89LU3fBEnLZxhnI8wNLdtqhiXbCQB4Mdcv3QANAEf7Q==
X-Received: by 2002:adf:9084:: with SMTP id i4mr9275124wri.23.1628234391074;
 Fri, 06 Aug 2021 00:19:51 -0700 (PDT)
Received: from p1g2 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id l33sm10154419wms.12.2021.08.06.00.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 00:19:50 -0700 (PDT)
Date: Fri, 6 Aug 2021 09:19:48 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YQzilLdPZDdxwR+t@p1g2>
References: <20200208134950.28582-1-tuzakli.refik@gmail.com>
 <20210805224726.22f6d200@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805224726.22f6d200@windsurf>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/freescale-imx/imx-dpu-g2d:
 new package
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,

On Thu, Aug 05, 2021 at 10:47:26PM +0200, Thomas Petazzoni wrote:
> Hello Refik,
> 
> On Sat,  8 Feb 2020 16:49:50 +0300
> Refik Tuzakli <tuzakli.refik@gmail.com> wrote:
> 
> > imx-dpu-g2d package is used by i.MX 8 and i.MX 8X series instead
> > of imx-vpu or imx-vpu-hantro. With this commit, imx-dpu-g2d is added
> > and is enabled for i.MX8 and i.MX 8X.
> > 
> > Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
> 
> So I wanted to apply this, but except Gary's feedback, there is still
> one issue. When I look at the libraries libg2d-dpu.so.1.6.0 is linked
> with, I see:
> 
>  0x0000000000000001 (NEEDED)             Shared library: [libdrm.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libOpenCL.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
>  0x0000000000000001 (NEEDED)             Shared library: [ld-linux-aarch64.so.1]
> 
> So libc/ld-linux-aarch64 are part of the C library, libdrm.so is taken
> care of by the libdrm dependency... but what about libOpenCL ? What
> package is supposed to provide that in this context ?
> 
> Gary: I know you said this imx-dpu-g2d package is independent of the
> GPU, but here it links against OpenCL... which I guess is provided by
> imx-gpu-viv.

Yes I said that ;) But to be honest I've never used any i.MX 8QM / 8QXP
CPUs, mainly the M series.
So the DPU package, on paper, is supposed to provide the same G2D API as
the other package using the Display Controller (DPU) of those processors
to do the 2D operations.
So the theory is that it has nothing to do with the GPU. But in recent
releases they indeed added a runtime dependency to OpenCL as the package
needs it for HEVC tile format coming out of the VPU [1].

Regards,
Gary

[1] https://github.com/Freescale/meta-freescale/commit/0661394c
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
