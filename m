Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826F7C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 12:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3158781754;
	Sun,  6 Feb 2022 12:31:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gbuf3vp0lLY0; Sun,  6 Feb 2022 12:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AE0381493;
	Sun,  6 Feb 2022 12:31:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B2871BF5F5
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 12:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F7ED40289
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 12:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8AexJZIVct8 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 12:30:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D142E400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 12:30:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id s18so20075608wrv.7
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 04:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=jsfYiOkPFWelDoz/myMNsMGQJ3WR2NdWrTsfITDxBKM=;
 b=HcOYkDzr+Y9P7ChbxL+uHVtPBIwY+X9YIDVVJ7pE8WtbilZJ/ohy3EnrBbJNyzfIyS
 kREEXFRrdaIwEBJfFuz82daOZ26yKs/Uiv2/jEyRfdfbV6ws7EkE4Dq2j66Rl0iPoFyx
 nXZlLqsjzS21KLpQDVZ05gBox+5oheKscEU20N/Y/3gQe0IQ7aSJ6mHdAfWm5s4gji7L
 RkbYt8mbtitnTs7isdiu30XKoWbjd8ExkmAL0ICOYS4PGCUfcPs3fR8Bo1o8GiDd88Vk
 cTF6J2KxqXZ4qImt/IMt/bEhGBB0QUVRwMBnLiPS32cpU+LqKDnu60s1xo9pf/yJHMNu
 WRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=jsfYiOkPFWelDoz/myMNsMGQJ3WR2NdWrTsfITDxBKM=;
 b=utg/4bz3QvJwbaJTLC2gly1ArRSjMIe7KUjQWCydjVfGyI9YLJbADJWY/Dw4spjtH4
 an4qK1txqNY7viqOpbdxmHS2Yv58KQmZt/LvAfkOOG4M0+pFWrIr0TMH3vEvBXMVVf7P
 x+mPoeZ0ToXgk5grh+RYmXehxMdWkCbS0I84EbTwmMnTzLXQ5miWDzISOJEOknKXWyFJ
 95AHyvIYFjCWdbh5MNwyk9RTaXrdfOclEISrLx8FLyaDuL2eImQL5wtuax6VSMc2uMCe
 LcwDg17fXzMKGfosLv2ary2m58V0BVJ/tbcxgt4cXxQkYGy7K/L46UizzjT/skpgZ6Oy
 +TZg==
X-Gm-Message-State: AOAM5330XVHrHJlJ+Kny3f3CXvkr+2fZnS+sTTYwfWw315b0y9Udn5n2
 2Kbpg5IlzFHBkB9VuLvYZBw3VeNrrcwunQhb
X-Google-Smtp-Source: ABdhPJznCEZ0tAGjCqsogaABYCuCstb8CNAQQOiLLSDFu2eG1U74uF8sWeittOPcr5VDbyoBgCVNdA==
X-Received: by 2002:adf:ed09:: with SMTP id a9mr6302973wro.411.1644150653889; 
 Sun, 06 Feb 2022 04:30:53 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id o14sm7851163wry.104.2022.02.06.04.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 04:30:53 -0800 (PST)
Date: Sun, 6 Feb 2022 13:30:50 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Yf+/erzrVPQCgspn@pevik>
References: <20220126235652.25712-1-petr.vorel@gmail.com>
 <af12e67d-974c-262b-8b65-c923ae5ea48b@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af12e67d-974c-262b-8b65-c923ae5ea48b@mind.be>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: bump version
 to 20220121
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> On 27/01/2022 00:56, Petr Vorel wrote:
> > LTP now builds metadata directory as host target.
> > It's mandatory, therefore adding HOST_CFLAGS and HOST_LDFLAGS to make
> > (adding to configure does not work) to avoid adding -mlongcalls
> > -mauto-litpools for some targets (e.g. bootlin-xtensa-uclibc).

>  Since it apparently wasn't clear enough (cfr. Baruch's comment), I've tried
> to explain a bit better. Hopefully it indeed is better :-)

Thanks a lot!

Kind regards,
Petr

>  Applied to master, thanks.

>  Regards,
>  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
