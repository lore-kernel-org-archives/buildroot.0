Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_05,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CFFC6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:44:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEAFF6101B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEAFF6101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84890605CB;
	Wed, 21 Jul 2021 20:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_fMU04y5qzI; Wed, 21 Jul 2021 20:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D342860ADB;
	Wed, 21 Jul 2021 20:44:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5511BF5F5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69075401C3
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fawds0dgDjN for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:44:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1BA0401B4
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 20:44:14 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 x14-20020a7bc20e0000b0290249f2904453so1464194wmi.1
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 13:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=MpSAADsypiuOUn98GYkEtSrYr0PkyXRRUv6hcB80DX0=;
 b=NV80Y3PYWyMUJlhlIg1xwzQ6Q3xDklZ9OdTTyGp4YQ8oPjfCuE5Akq3pwZ80ZN7PdZ
 pAXIpnx5oDXsrFdmnadh+XyO9wPUeTrcZCcsJFGarSwVZyxfHjd6QsK8Lb/q9tkU5qLF
 Rz8LExEOxTVlj0gC7RX1k7B1CrJN2/vIUyVKXtwXsoZsE5T9AobsQ2JlXk8Aawbq4j9e
 Npw69lIWlZoKMyAljLqCWPQAbhOeSFYX577SMDfeNE2v9849QvMyQQwPwGL/1/ul1xJy
 +zJHmRoIWBGoIX+BgW1EGPemsM+LaBMLtRSxkBKvqQa5ud04U9NbnSSnYG60jS66JevI
 qU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=MpSAADsypiuOUn98GYkEtSrYr0PkyXRRUv6hcB80DX0=;
 b=a9nd2SJBIiYXotgG0OpuD7xULMgPNOpc+bX1yyw2e2bLc+NqmZRc/UO4xdUl/clpLv
 nbfRhcMxas5go0TVKM1o+Ddnacsl4B8yZy6oN2vte4J5Q6BEOnFkwuR9wNI+7qhndpI/
 Bnf37j5TMLdSSRjPdl3j1YPJCO2I+i761AjYlXNzhjqtucJXw303SvI2rnl/XDJryFV7
 ggM+3SAyTqS1AkQRletP3q/ORGq089r/slDg1xDx2Fs9T+d07ah5hH3Uc1e6Q49iD0u6
 yUivjKEwXPWEAtCrVmM+9xqlANKcBDQ6Z2wzsg4BjG88L4ykH57s24OnZToTEold2AH3
 jvYg==
X-Gm-Message-State: AOAM530DVq/KLq0JNq3YJ6/UUZBA7uvok8xiXxydpVvBvT0oZeWO0F8n
 lvC0QOPkepfE74oWKTVzgF2MK5wFGnw5Yw==
X-Google-Smtp-Source: ABdhPJxdC/Ur9WHaK/c8gYZeI8YOdcFe1DxoSnnrQkLM4R1r+ZMiS6aMeTHxsbaTwfxga7ns5ckORw==
X-Received: by 2002:a05:600c:2142:: with SMTP id
 v2mr39046416wml.121.1626900253116; 
 Wed, 21 Jul 2021 13:44:13 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id o5sm817735wms.43.2021.07.21.13.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:44:12 -0700 (PDT)
Date: Wed, 21 Jul 2021 22:44:10 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YPiHGpBLkSNj/bol@pevik>
References: <20210721171538.592498-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210721171538.592498-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] docs/website: mention mailing list archives
 at lore.kernel.org
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Nice (I didn't know it's archived on lore :)).

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
