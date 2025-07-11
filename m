Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED32AC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE85C8219A;
	Fri, 11 Jul 2025 10:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKle3jj1jIbt; Fri, 11 Jul 2025 10:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E862983252
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E862983252;
	Fri, 11 Jul 2025 10:44:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6118E1E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 469E88236E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bccCcCU_u15N for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4D0C8219A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4D0C8219A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4D0C8219A
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:50 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so15178735e9.1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230689; x=1752835489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H8SizKKo85b38YUr6ru1opSh4ak0p9Ij7Lj5gaVJ+cU=;
 b=kuSFr2C6r9y0iaSAbaDZpHLjcZEp1oOhfdR/aq3dTXBfc1d+KKvtaCtYNpxpSX1fjs
 CRkM4vdwOZJs9ZoR5gEPByefciB8pwZrBquTk6uO5oIiOe850rIYNL9sU1RSVwlP0n4+
 aIeMcblpo4T4aV+ePk/gePM3cX3mbvXAi8xdfNlEqTTLmt6eVNG4HOL38stAgxqsjQpn
 YwB0rXBQ9FWrEh+ua+SwB1pTzW/45kkg8g+TNbGLqAvNt5hm+KHR+ohlR5xPFg1pVNcL
 nay13xx8PyLxfuGcUxLFYebV93gDTgtERrnKSJ11bdhvzipAnlZouJj9xM3nGyYCNx5D
 DByQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY6Pr4Ll1B0P13jGY+zrF6txfNpq6tSPMpq/w+qU9UVNS5DbkvMHBlUoKDcVg2uYp3YUivUtXDcKI=@buildroot.org
X-Gm-Message-State: AOJu0YxB4QFY8xHh3dUTR4qefcdh88HLCJYeHzkcpgK14l2k4GSs5z43
 Z5QUj0FbEr9FXdp78xNiNXk3YNpzjpHYAnI3VPIy8iknbyKIM4bg1zK7MhyA2x5d+hv2MmBqQTp
 8aGgi
X-Gm-Gg: ASbGncvUhNbYTa41HBid/h9ngxjaownnYzI5bKOcFkk//1lSgFP/5wVcn2YraANXP+K
 8FunrbTE5w2t5pCRNvwqO/HA7Tx0Sex0i+WP6sif9UZKBQ/l+toVggEMcTAfQinAPwmRPiwBO+q
 fkoGXYKPY9Mq7BAC6EHXBcp81C22qe5oagNz2sdfdUHlSX14p+DL+UlOXk88wzIz7s9hoMyLE8b
 4horlPvdFdv8M/zeduCsfwjYKhS+Z0uin/dmHFpfUpjuq8PkIZq8nC/6uObbu87woT1IMzguxMk
 YNPmI38puTvV3DEhZR/SpXjqbO4eIEBMRuSzauWMHKZDsnBoLHlYe9H/lN8mLFpThUpMlTb01sZ
 Xre17mifjjEXYBA==
X-Google-Smtp-Source: AGHT+IEwTHCPLblICbI4VbFaQhRrSAdJ3zZez3dinWKMwBgM97eV1gc+8PXLvRVsMY1dqM202O0vRA==
X-Received: by 2002:a05:600c:3d89:b0:450:d30e:ff96 with SMTP id
 5b1f17b1804b1-455f30bfc7dmr4152695e9.0.1752230688723; 
 Fri, 11 Jul 2025 03:44:48 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-455f2d3a1b5sm2437665e9.30.2025.07.11.03.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:48 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:47 +0200
Message-ID: <20250711104447.823772-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250702083805.1553261-2-titouan.christophe@mind.be>
References: <20250702083805.1553261-2-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230689; x=1752835489; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H8SizKKo85b38YUr6ru1opSh4ak0p9Ij7Lj5gaVJ+cU=;
 b=McquGP/l9q9kEVIJqTh9UOSOHkML1ntj0fnIEVkb/pwn95ot2uZm5hlMdcNnJbkfj+
 qovW4JxvItg1Jd+1fDk84W3mY95CTHDCTMw7iY5EdYy4FqBC6sjhu2vSVtkQYnt3tR4W
 clCifvxO1TIgSo3fMIWkx6IQsCKAKI10olwsgPt67KqjzQqeY8lRyZ1xeeOUb/voSP4e
 2Qv7MesHoqM2do/+OywQHRTKFQJshdmQSDo65vKCJaNXLHftHCq92xaE1NxSlW3gCH3S
 3TCGRO02jRbIz2ouxUdJ45pi2He/TruoFRIsHwNz6HAcz/SylYd8h27pOBCf4hv/ldu8
 F8sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=McquGP/l
Subject: Re: [Buildroot] [PATCH 2/2] package/gvfs: update website URL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The website URL was outdated, resulting in an HTTP error 403 Forbidden
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/gvfs/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
> index 68ad291436..720b8e6c20 100644
> --- a/package/gvfs/Config.in
> +++ b/package/gvfs/Config.in
> @@ -15,7 +15,7 @@ config BR2_PACKAGE_GVFS
>  	  all applications using the gio API. It also supports exposing
>  	  the gvfs mounts to non-gio applications using fuse.
>  
> -	  https://wiki.gnome.org/action/show/Projects/gvfs
> +	  https://wiki.gnome.org/Projects/gvfs
>  
>  comment "gvfs needs a toolchain w/ wchar, threads, dynamic library"
>  	depends on BR2_USE_MMU
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
