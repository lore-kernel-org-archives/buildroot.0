Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA5FC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:59:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6F6A601FD
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6F6A601FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6100740384;
	Wed,  4 Aug 2021 13:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDHkxY8LFKWx; Wed,  4 Aug 2021 13:59:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6121A40159;
	Wed,  4 Aug 2021 13:59:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D01A51BF20B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C008383366
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1o9qj5ggBvY for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 13:59:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7B28831B0
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 13:59:39 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 n12-20020a05600c3b8cb029025a67bbd40aso4039378wms.0
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 06:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=oMz4gJAHxHChR5dXdfAGjuMl9MwQTXPzEc65ydoZyS8=;
 b=YGljLCxLINAERR0fT5ph9U53Oazz0lu+1xr7NB8KubWe8wQ9cgP7Z90s6lZ4omUzNg
 hrsONl/1O3heCh4vFu+oQeIAKdfTVgPEMzF18TSTFdKvqYK7jV95uiobpJtu1TpYVb9r
 Knyka+nXluM52ekgy3mz0KTOlz2Lalb8t9eS5cidjL7lbk3dXXxnb5Pj3FqjlMAztrRF
 iXdASq5Q9yjJCxMFW39gCWpf8fz/XYlpnzdHNexBiIk+xmKXaeOheRuS2RCxZfur4h3C
 RIGSVHNLYYfSekD0FEQrZ3SaPLOsIm0mR59z6ngUPqWYhVIoxppdPD5j4Im5PkjYBql9
 HwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=oMz4gJAHxHChR5dXdfAGjuMl9MwQTXPzEc65ydoZyS8=;
 b=beQYEfZxs8+JZk5lgZkTecWRdaOLg/DRf2j2JeqCM+4OPWndkNqT07UJlRkbZM2NKv
 cSVSkdDoslfITTwUn13bEaTe++XDTa86vSL7j23ecILDlbS3md08FworKkifvTfIPDMY
 t3mo75SfMtZbb22zYaTTewhFEn+VEzrDGmjirhGrU/i4vYB1sVqMm+ITpiEnL5ytL1wQ
 Cu8qktUA49LaAztSTJXAI28SeYWN42cVi90oVeA3OmZl226qDQbrk0AgziejTdwiURvR
 qJQ7npTbid29FqXOHfp6EXtatX6NNWfINN7Z2Cn0b2pWVLImlB+U3kG4ITGQGQqqWJF3
 8Xsg==
X-Gm-Message-State: AOAM533MUxu0t6iUR2FsL1OsLWCCoqwXcVWXLJge8LdRL+nO1cGnvyGL
 6Cexnrk8jSNZ70sXxJ2Iv0Q=
X-Google-Smtp-Source: ABdhPJwCtqZK5D109Ltzf6zljul5WRCcOlmoay18b9ueuJagPyLb2TtCnDotin7KAH7nG90Ijrq2KQ==
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr9788431wmm.120.1628085577948; 
 Wed, 04 Aug 2021 06:59:37 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id q14sm2809349wrm.66.2021.08.04.06.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 06:59:36 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBHQm-0003BD-5q; Wed, 04 Aug 2021 15:59:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210704171734.67620-1-bernd.kuhls@t-online.de>
Date: Wed, 04 Aug 2021 15:59:36 +0200
In-Reply-To: <20210704171734.67620-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 4 Jul 2021 19:17:34 +0200")
Message-ID: <877dh1s43b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gptfdisk: bump version to 1.0.8
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://sourceforge.net/p/gptfdisk/code/ci/master/tree/NEWS

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x and 2021.05.x given the fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
