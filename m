Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD276C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 13:42:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C83260FE6
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 13:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C83260FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 482C7400EC;
	Fri, 20 Aug 2021 13:42:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YXCnbEovQXbp; Fri, 20 Aug 2021 13:42:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EA3740194;
	Fri, 20 Aug 2021 13:42:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 244C71BF35C
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 13:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14595606E9
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 13:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYmHY-fyLein for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 13:42:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 040B860618
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 13:41:59 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so13651530otk.9
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 06:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Y13CfFwnsW9rd3DRCC7DNpW+HZEB9bREfg3p2t0XmF0=;
 b=BUCG62iPTjDua3XigpothQjtjpYOCeyyGXs9fRFRWt/Vnqn0a+ycZp4c7xQ7/2WMMo
 LdhFXsGvwb1WFezQfspHIyXWcX4t+Q0kzCX8Ncf13qRolu98z1piVwhAwhpf+zA3TFvh
 6sI9oontKu4oyE1ofNJNyDReYX4rChcrveExk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y13CfFwnsW9rd3DRCC7DNpW+HZEB9bREfg3p2t0XmF0=;
 b=KsShXuauUCKEX8aoRmpAbVJ97CsfV60L0QdlO8bMVpa7hPxSMEQWFNZ96EuQxog+Tp
 eS1X6T8zawalm86PVmFe5DFtJzVx7hCAkdqASditLccutISZKqoWcuDnoWHnm4MtNmYL
 ONZp+pBGfq/cO1CBKRKJ5xTEyvYfObDG1/g2HzWrFfSSPca2oa44N1fe44EslqT7TkHC
 LTPFahho2WIegyrrgmlvma+ErhmfvvMGiSvAMcpex+55bKYTryrDbNZlfmBGg8HgH/mC
 3tPpUvx9L9kDw3A1h/nIC0CqyKyNrc8rE5hXzGBpPVLOM8hkBCU7jyVO/0oPkc236wcz
 rg8A==
X-Gm-Message-State: AOAM531vjh4X3q/i+XQSsJ+iu71ov6OadrTUE4CBuVybyVvuJpuHbP/w
 b8XdZOZIKtKk25w3kB39c3yspA==
X-Google-Smtp-Source: ABdhPJwRNPMDubpnV9jKHJ3QhCPZzFpFU2SMBWoz+IoYxkxf92s+EdUcxpPPmdWoss+PFg2efCYS0w==
X-Received: by 2002:a05:6808:2193:: with SMTP id
 be19mr3085037oib.102.1629466919142; 
 Fri, 20 Aug 2021 06:41:59 -0700 (PDT)
Received: from p1g2 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id i1sm265192oiy.25.2021.08.20.06.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 06:41:58 -0700 (PDT)
Date: Fri, 20 Aug 2021 15:41:55 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YR+xIx0OGnpr39Op@p1g2>
References: <20210805212736.2799576-1-thomas.petazzoni@bootlin.com>
 <20210805212736.2799576-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805212736.2799576-3-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 3/4] package/freescale-imx/imx-gpu-viv: make
 pkg-config fixups mutually exclusive
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,

On Thu, Aug 05, 2021 at 11:27:34PM +0200, Thomas Petazzoni wrote:
> The IMX_GPU_VIV_FIXUP_PKGCONFIG fixup is defined conditionally
> depending on the value of IMX_GPU_VIV_LIB_TARGET, which means that
> obviously only one of the definitions is possible. Make this clear by
> using a ifeq ... else ifeq ... else ifeq ... endif logic.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Good point, not sure why it wasn't like this since day one.

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
