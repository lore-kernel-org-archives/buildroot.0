Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DC4C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 16:57:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B9676023F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 16:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B9676023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D976560665;
	Sun,  8 Aug 2021 16:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vH7QHBNzwmrf; Sun,  8 Aug 2021 16:57:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 501D460637;
	Sun,  8 Aug 2021 16:57:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 291671BF281
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 16:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 227FD40314
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 16:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXWhuBe7pqmz for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 16:57:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9BC240309
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 16:57:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso12762120wmq.3
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 09:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=6AKfdBZzMYbLeBMIQydgLIN5XC3Q8WcX4YPRhJmare8=;
 b=brMoEFMOkCwWz3jAqX3l2Pz+ctcNcS9F9MbMRra14qbNcB+uCaOdX3tY1bG8ZJn1XX
 jqzC+6AD9wYslYGSQzcNxnR46bYLP7Gg1eH3VG65SJuIA+xmobzA7KBe8JyMpHIu1sWx
 LdNgljiTp45CRyb5qZiBepswKaMskmK/B/Y3A19bEeuZ/dXmMeaqA5AZmuCglTRCOcxs
 LDSVvCIDEki2FM78vHqM70HoH5mHBxbOi9loNuVA/At1RgiDJ24exAojBcEL8fBjwH8W
 kNTGykpg9WouGKypHsavBo+gtAu3tlhAHrrmIuufvIgRv238Tk7RDjkJ0YoO1D2q26MU
 6zKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=6AKfdBZzMYbLeBMIQydgLIN5XC3Q8WcX4YPRhJmare8=;
 b=VWEhTfYulpVj0wbt3D8pZ/xYpSJIOzNze2edys6bpqkqnZwnZXTpm+4lNM8YCWrZBX
 T2/xCd+1XLKLF1b0foZa7hOVMZXHOFEoyo2SuHrFWiVR3rEoRYGPIulvoPySJcO/0rYp
 pt6CbP3CU3V51Lr8s2W4Tk0+onqeU3vIfIACgdT8HlD3HIrEzn3s2v/ifULEsMA6XKrB
 sAWJzplvxlcNnsKWZSGGGlFLkhxyPU+DoAn34d4pGQise2GPgr0XYtsYsx4r/B2du7OM
 rdy5SupxtBjqmnR8k23VJV1Y0l6itqGGU4ZACJrLDX2MND6e+SRUNWwRZ4jTR6ErSwnk
 wrvQ==
X-Gm-Message-State: AOAM5310J9M7meGVBgabUaaZ9ksxQtqwiS9AkVB6Yqwmi8LpGXPcMXx3
 wMlUe3hSmikKC8lHPuBys0A=
X-Google-Smtp-Source: ABdhPJz9Heb24fhrz7TyLvaC3Cm+xR0ARb2j385duf72DVk+l16IHm2ZZJgsyU9wz+51MoB5jg74Gw==
X-Received: by 2002:a1c:7503:: with SMTP id o3mr16344089wmc.129.1628441819049; 
 Sun, 08 Aug 2021 09:56:59 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id e3sm16822113wrw.51.2021.08.08.09.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 09:56:58 -0700 (PDT)
Date: Sun, 8 Aug 2021 18:56:56 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <YRAM2Hgv61/0ZWef@pevik>
References: <20210808104549.3651744-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210808104549.3651744-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/iputils: fix rdisc server option
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Fabrice,

> Commit 95b0078cc089b48be8973b9507599cc836397869 wrongly added
> BUILD_RDISC_SERVER instead of ENABLE_RDISC_SERVER:

> WARNING: Unknown options: "BUILD_RDISC_SERVER"
Good catch, thanks!

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
