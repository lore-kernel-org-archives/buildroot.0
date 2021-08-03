Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD343C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:28:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1E060BD3
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A1E060BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BCFD607BC;
	Tue,  3 Aug 2021 14:28:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-VpblMB0GLD; Tue,  3 Aug 2021 14:28:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75B4760727;
	Tue,  3 Aug 2021 14:28:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C3C71BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BC67607AF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:28:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQI77c-uAeyD for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:28:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 856F660643
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:28:36 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso1869313wmg.4
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 07:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=nacqrqSt1iu74q4zIXH2EiMgMWIYTTeHrnxedBWEqWE=;
 b=OZh3f8FFoVOzRllik2B59Ugwzt14cLTvE2JWOtw5MUbOmONsoBy+a62wVFq7JO+LeP
 xezgGhw3gVqGcHWrrzbX0gYv6v1spiVjDYS2C/CcY8iCumnsJStiPtyBDYzapglKSxLT
 2ZcycFfqo5DnXuuWQtmk3qTbsO1exMuAoD0C9xZ9PisZYC8KBJy7M88jR5PjYXOIBmYe
 O4W+YqZaazjVSWYf+gJuU9WZLe2rH2os/0wnpsIxsZuRoob6dDRzJzcyuXWfLqCHaEzY
 hoikBSv5OMWOZqRtmFWLIILyGjCwXoSt9qDw37MuQn8IcKqLnflXnYyt2/Mnyi8jPzRj
 nyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=nacqrqSt1iu74q4zIXH2EiMgMWIYTTeHrnxedBWEqWE=;
 b=A6I18RPtx7Yn6tspnPU/oUUcVOVxSBQ6KJOMS3gskxp2foOf8yrijyKP/mefbQUoEP
 tLndxXkVUOeFJ4L/cp4HPQ41QqUAzjIuZjw72RZfps6x4zdVyD+D4QIPb20Oyfl8eKz9
 XmvaYAWtobaBocDRy9QybqlZ4vVUK/HRt5AFwZvzo8pQcrx8RDXsVtOl+/oRh3Kxhj5I
 fgL8dNbqOUQYx/wneyo+4ZoRMLYxScrkFGEjeQHdLU8mRU/e8ojxwZhh4aNDJifB+fxC
 yFpLhPLp+cajqIESaQhpmD0NY+hOgEr8jJNRRPW/QZyLu5p62OVs/fEI5zrL7D6Pctoj
 R7lw==
X-Gm-Message-State: AOAM532aQbJ3X1+wRtrx3ruVZeP4ZUwursLsUXVuSBj6dHlV77FpxbQo
 r8NEVr/uv2PWwpvUUCxuUkG1Pv6uw5IrUw==
X-Google-Smtp-Source: ABdhPJw6GM7foQpg+dljK1s6GPMEo7gwosRjSyIdonrS8nxktGwzP2/b33sADUFwbwHl5Tcwzj7aJA==
X-Received: by 2002:a7b:c7c3:: with SMTP id z3mr1004424wmk.96.1628000914810;
 Tue, 03 Aug 2021 07:28:34 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id h9sm14719608wrw.38.2021.08.03.07.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:28:34 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAvPF-0001wa-Hk; Tue, 03 Aug 2021 16:28:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210702192548.956881-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 16:28:33 +0200
In-Reply-To: <20210702192548.956881-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 2 Jul 2021 21:25:47 +0200")
Message-ID: <8735rqy54e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/libhtp: bump to version 0.5.38
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > https://github.com/OISF/libhtp/releases/tag/0.5.38
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
