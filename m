Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78CAD6A238
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 21:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 767F5402DA;
	Thu, 14 Nov 2024 21:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKY_FARGo0yv; Thu, 14 Nov 2024 21:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 741C24063A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 741C24063A;
	Thu, 14 Nov 2024 21:43:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01C271ED5
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 21:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E406C84491
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 21:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgC0FTJ2JtXb for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 21:43:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E4DDA84485
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4DDA84485
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4DDA84485
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 21:42:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso12560465e9.0
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 13:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731620578; x=1732225378;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fm1L0Cxk+Ry1eS2JghUrL/DK34yewSneY2iu3eOE/wQ=;
 b=J11ixB3BgzW2xLY0vqSdgcDEoa4X1lIdWgk4syzhsQiwVNpm4nNJb+e1E6aUlkyyJG
 dGitCJItgsUqEOtpRvTqMC4lob3XVYtKJc17r7gcgyiRYcDXuBu5NVWJwjui6eQTIKd/
 Vq6uIZ2sMHqgB8ilsFniVvDGc4PV39wQTJpMmILLhsbEGcm3hPH2nLRs+WRFNJBKRvJO
 DAQDtXc+pc+Z01QR/rzfbidF/xFNKHa537eBX1WMJPBNXIysfTwuB7MqTVRVx+jTZ1r4
 aWhPrwhBRHjllMS4lG32WIimWO85I7qbEIkGe9kctccXyDCifpGKKNezWb8voTX1Zhux
 yImg==
X-Gm-Message-State: AOJu0YwrZeiMkW0RGKp0DEoB1h4zR4pl8W0/wcZ4WC8QslBMzTVfm33V
 iCN2GeeKA7CkcrUX/F0QBEFtk+PuhrafhIgnk0+3zHleX6Q4X4Yt
X-Google-Smtp-Source: AGHT+IFeXo+JHtpgIpehhOY5IvYs30JlZfsgBNT8nxgln/dubVEvn/exO+iBTsQUAVSQmbMMlxJxWQ==
X-Received: by 2002:a05:600c:1d97:b0:426:59fe:ac27 with SMTP id
 5b1f17b1804b1-432df78f3demr2199145e9.26.1731620577421; 
 Thu, 14 Nov 2024 13:42:57 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adbbc80sm2530472f8f.51.2024.11.14.13.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 13:42:56 -0800 (PST)
Date: Thu, 14 Nov 2024 22:42:53 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Anssi Hannula <anssi.hannula@bitwise.fi>
Cc: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20241114214253.GB372474@pevik>
References: <20241106100210.1547916-1-anssi.hannula@bitwise.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241106100210.1547916-1-anssi.hannula@bitwise.fi>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731620578; x=1732225378; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fm1L0Cxk+Ry1eS2JghUrL/DK34yewSneY2iu3eOE/wQ=;
 b=fywiEyY/QXS2eLlc/ImBLaKCFTf1DUSFOrq2hCmuQGvCRFSo64+wTIQfEu8oDGiC8l
 mcP7grIS+NrSWmAi9zsEX2/JSnQQC3LjB/iyq3Nms2cEC9YDp7jkBcnUtL8SFFNXeRiE
 Kw3bHuAnM4cI8cKGsZlmvtRnjjOS/HvjalAaPQvrMhjvYZMhxOTs5hvQk6wCZOLY3bMp
 BJKPA+GPGcqu0zHkzKSVWC+1H6qL47+eQMAMsfa3hf+hWYu55srzJsOR/rVuluCPu/dy
 g07L5GFmyWVJdY4Iwt7fYCOW6Mr4a3bjXIR2ZQ8JeYVWYNykvK34hNztp75RVTm4hHSp
 AY2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fywiEyY/
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: fix unit
 dependencies without systemd on build host
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Anssi,

> nfs-utils configure script uses "systemd-escape" to determine the
> rpc_pipefs mount point unit name in the non-default case.

> If the host build system has no systemd this will silently result in an
> empty name, causing rpc_pipefs.target to incorrectly depend on ".mount".

> Fix that by depending on host-systemd for build.

I dared to send a patch upstream to detect systemd-escape. Feel free to put
there more info (I wonder what distro you use for development).

https://lore.kernel.org/linux-nfs/20241114214044.1099257-1-petr.vorel@gmail.com/T/#u

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
