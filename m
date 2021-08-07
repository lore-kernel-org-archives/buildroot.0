Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB4FC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 19:30:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59FA760F44
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 19:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59FA760F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A5F2403F4;
	Sat,  7 Aug 2021 19:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WSCFPYLGUezD; Sat,  7 Aug 2021 19:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 757EF40361;
	Sat,  7 Aug 2021 19:30:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F055A1BF3AB
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 19:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA96482F51
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 19:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3PvF6KdHl5d for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 19:30:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A68FC82EA4
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 19:30:42 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id p21so18255577edi.9
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 12:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Z64shwPcKQ6nVoHN1ms86UqvIY3vfKmIxYgwdzzS9KU=;
 b=PmJSf+RXUcg2Ws8P9WFN3jlDxqTM4SHbvsHz/AKGeqLG2d36cQGDLYGyBa2Xt4KRkp
 Qo5kBqX5RaVnKVLdlCmBeIv4UEBZmyhuzs4aGPL4YVfnDMEiWKnigKudyUD9zMk83FXt
 qisLQZqmDhnmOTokd1XcU4YxI3Um09gfmcZn7xwgD+x6ukZTOq2Isv/F6Mdiuvo+ejYS
 qiYcH5Si8Wyicy3sCLArAQSKxX3qaZhWfPikJEKfSD6V/7NaohCfi64qRVhO+P3WNr2y
 UpirmbOkzM5b3x5HruDSAbdoYIwGdBcED7gNTrpW2s17bEqaDL59gvI5JaQLEx0kk5HM
 r7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Z64shwPcKQ6nVoHN1ms86UqvIY3vfKmIxYgwdzzS9KU=;
 b=qNQzLd3ZbRFXvdg08mQhd5UGf+J3pdHpc/o7RtilWzAqQBUEJ1zlJ9A7M7SoElk1kf
 3fJxymAeAG6c1fy1kOL1WWXat24gcKUbLSpKg3F986R92FXuy6psaj7aE8/9mXxl5hlY
 J5VQC7Kmq2pUFLcUibRyULLaNa9pF2H9gVAyZgC/PbLaVWV+Nc61sBAZic0PYtm2byMW
 OVbHt/yGFw7bAyPRGzAaBTUT/Cy7e5qWfC89YS1/ymghR1qpOq/cGIEe/OgkR5Ne4hcl
 M6XrjXXMXAYcNCg+BO0PFi1XRrHyquLKCrVkifyQAWHDqv1Y0C3TcfXxXDHGkjgzqptn
 dXdg==
X-Gm-Message-State: AOAM533Imnlf3b7tIN4QbCaaGGwD8stTuBpv26B3P54GKOsYl1eO/WoB
 jQzDN0tyPme97ZIJd9mZ24b5ioQ3BLfkNA==
X-Google-Smtp-Source: ABdhPJzjbxEDoJEBIAtRaVlukk8QqFbhKNFEnttI9J38n5qCLeOVbdUQejlvlELFcRIWOFZpJWfL6g==
X-Received: by 2002:a05:6402:1d30:: with SMTP id
 dh16mr19988962edb.224.1628364640955; 
 Sat, 07 Aug 2021 12:30:40 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id e27sm4078193ejc.41.2021.08.07.12.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 12:30:40 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCS1n-0005ax-CB; Sat, 07 Aug 2021 21:30:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210720172911.15840-1-bernd.kuhls@t-online.de>
Date: Sat, 07 Aug 2021 21:30:39 +0200
In-Reply-To: <20210720172911.15840-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 20 Jul 2021 19:29:11 +0200")
Message-ID: <87czqpdpcw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: DRI drivers need either
 glx, egl or gbm
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes build error:
 > ../output-1/build/mesa3d-21.1.5/meson.build:520:4:
 >  ERROR: Problem encountered: building dri drivers require at least one windowing system

 > OSMesa is not seen as a valid windowing system for DRI drivers anymore:
 > https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=21.1&id=ee802372180a2b4460cc7abb53438e45c6b6f1e4

 > Fixes:
 > http://autobuild.buildroot.net/results/46e3a66ddc13a064e512aad0f3afd8655889ab9d/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
