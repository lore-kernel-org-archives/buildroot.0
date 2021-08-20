Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33894C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 13:41:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF330610CB
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 13:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF330610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1C954035A;
	Fri, 20 Aug 2021 13:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2RmazqdUf1aS; Fri, 20 Aug 2021 13:41:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13368403ED;
	Fri, 20 Aug 2021 13:41:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5041BF35C
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 13:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AD9C606E9
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 13:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8i1HTMYrelAX for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 13:40:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B5A860618
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 13:40:59 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so13660255otf.6
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 06:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q4kFYYhMfRqxyTUjRC5f5VZMpoMOkuSsvOl40r7/qJc=;
 b=Tav9t5WsFk/6L+WM0cTiSCqw1NVG+mPuD4ZLpWa33dd+Q2ngV+eMX14f8uyA4deSNu
 sZvV8XOH0QZ+UCKvp7UYhnn0Sd3AnMFoiSYw9/00Pa0pbNWiHRU2BNZp4uauYh8FOueu
 /+V5swNmdggOas70+xbiVhc8Y4A37rylX8WZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q4kFYYhMfRqxyTUjRC5f5VZMpoMOkuSsvOl40r7/qJc=;
 b=DAkFShaOQzls0pxFdbVFJgf4sikadIu19aoCD0XgPQO18VXLabT/5TLTxUv1RG3ZQP
 aZXUGq9ftOq33ey8GdkPoZ8N1kKjLceWml8vwQ+Qoi9XKYPtq4JS35cG+o5uIjo4T47+
 r6bEHJvVLkVaZhQogDflVzdc+04sjrk/JJGM6Z6mWogTsAEo7X1uraJbOaQGaR6IiWNT
 7xES6u6lu6c3NfyA53ljEGlVU+VC0eqBWsVjKRKerFioV5TOZCeIyp5wu4h8dksDyX2Q
 wAYPNrYEvC2qPyDEGUvuDcq8ZcsrCtwPXT88HReO3NFIkw2ATrlkv2+JJvFDchdpJd9h
 O/dQ==
X-Gm-Message-State: AOAM532jOrhzM0uzBmiEYW47eFu54dyo7PbABia+m/KaUuD9xaZflmuO
 UW8nHA02cs7YMhDN+Oyve9e+Iw==
X-Google-Smtp-Source: ABdhPJw9NFIYIpYLjZkfACbN0UiFWc9vtjfmN7rqjLmu7rezbl7qRHKi6lFI0+tOtQ0ClkXctJMtrw==
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr3003550oiw.112.1629466858247; 
 Fri, 20 Aug 2021 06:40:58 -0700 (PDT)
Received: from p1g2 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id m1sm1261126ooo.45.2021.08.20.06.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 06:40:57 -0700 (PDT)
Date: Fri, 20 Aug 2021 15:40:54 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YR+w5sy+/i8j4Qwd@p1g2>
References: <20210805212736.2799576-1-thomas.petazzoni@bootlin.com>
 <20210805212736.2799576-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805212736.2799576-2-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 2/4] package/freescale-imx/imx-gpu-viv: drop
 pkg-config files installation
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

On Thu, Aug 05, 2021 at 11:27:33PM +0200, Thomas Petazzoni wrote:
> We manually install pkg-config files from
> $(@D)/gpu-core/usr/lib/pkgconfig to the STAGING_DIR right after
> copying the entire $(@D)/gpu-core/usr/* files to STAGING_DIR. This
> makes the manual copying of pkg-config files pretty useless.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Indeed, this step can be removed. I checked the .files-list-staging.txt
file and confirm nothing has changed with this patch.

Maybe a cleaner way would be to not copy everything first and only copy
the .pc files that are needed but this could be done later. At least
this patch doesn't change the behavior and makes the package simpler.

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
