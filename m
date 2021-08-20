Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA02C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 13:43:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 459C061130
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 13:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 459C061130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14AB14051A;
	Fri, 20 Aug 2021 13:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SgSa3DWkdhwA; Fri, 20 Aug 2021 13:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 197E640524;
	Fri, 20 Aug 2021 13:43:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDFDA1BF35C
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 13:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB488613F7
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 13:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojOqNfEenlWH for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 13:43:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B921A60618
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 13:43:26 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so3971552otc.4
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EaRx1Grgx62imgTgKbMHFSLeOJ5ho+stwxuvnkYYZtE=;
 b=WcLF/qXB6DQZJhf0QVBLjR8o3a+Q7uOl+B8Ib0n3i/39aRFScCilYe4UsO0ajRYf1L
 fGU316zdX7BB9YriapTZn77lAzJNsnRppH/3taTRcmBZBEgz4mTeMKt66kzIFpvT+lcM
 DQ127JbupNx69CTx7/YutxLtvMfhF5pYDjzaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EaRx1Grgx62imgTgKbMHFSLeOJ5ho+stwxuvnkYYZtE=;
 b=WVjhIogPOye5xL/7Gz2OZpjax1bwq1nHKqSZKNZZWppCf0jAcOZQ/odxsTMivGmLuA
 1kP7Zz1BwXS+dwEcljP1HDh+mj/BUm2e0MWmHtjmbrCKn5VPy5etlKolV8SNCgu96Hdl
 NBklhqJWoRS8tO7gvxarg0kyL8ZSLlQjFM0OzXkGkry4oGTeh/lyQQXcYCDwCAZy5k8q
 /dd2puO6+PbsDi7YLvtQWIPpPuXIvxFETZ6+RmzYZ4ldXA7IKWZLrujyM7vLCXSApCQh
 BbSZ0HM4owfWvPmynOpjOpJuVKqmgx8a+GI6ZmqU88FjQyGSGR6yWvs8aMof756pNXFC
 CdTA==
X-Gm-Message-State: AOAM533ElJbaUy3s4ZR4mH41ntpRa/qlb4Catp8dAXxEjJM5mrZeQwIa
 3P8KiZZJaTuqytAqz7vwR8gcqQ==
X-Google-Smtp-Source: ABdhPJzSe1Ks94Qk6v+DOjaz3JZZ5hJdLhf+WAxI0weeJqrcB+MtFuX/gVWmXbS2bOEw0s4Fr2/W9g==
X-Received: by 2002:aca:31c1:: with SMTP id x184mr3038236oix.8.1629467005836; 
 Fri, 20 Aug 2021 06:43:25 -0700 (PDT)
Received: from p1g2 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id o68sm1474114ota.33.2021.08.20.06.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 06:43:25 -0700 (PDT)
Date: Fri, 20 Aug 2021 15:43:21 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YR+xeRHpdQYxbnbQ@p1g2>
References: <20210805212736.2799576-1-thomas.petazzoni@bootlin.com>
 <20210805212736.2799576-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805212736.2799576-4-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 4/4] package/freescale-imx/imx-gpu-viv: use
 make loops instead of shell loops
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,

On Thu, Aug 05, 2021 at 11:27:35PM +0200, Thomas Petazzoni wrote:
> We generally prefer using make loops instead of shell loops. They
> bring automatic error handling, as they abort the loop when there is
> an error, without the need for "|| exit 1".
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Same, not sure why shell loops were used in the first place.

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
