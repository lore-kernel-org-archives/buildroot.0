Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DF7C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:05:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFA9760FC1
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFA9760FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AA1E60607;
	Sun,  8 Aug 2021 19:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Su_mFxH0hjV3; Sun,  8 Aug 2021 19:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EFB360601;
	Sun,  8 Aug 2021 19:05:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16C971BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1332440296
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ugPz7A4J31FX for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:04:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D113340235
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:04:55 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id bo19so1903513edb.9
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=YeM24lYG476VaiKxvhFy/TDI/KdPjSL4eIrZ3SMzCGw=;
 b=IoJFNsYZZ+oMiEYo8OfU8s2l7TIKq/ZaWXnJAzSc96eN+A2gUuzzdmxGFUywFTGpSs
 VdCBpqo73UXvqNXQ/xgPV4LnaYqOurPZ3G4+DHIh+c0PLcAKGRtvAWe7pKI0YEsAcbX8
 ABPyALW3wyP0SkROHoKkw5U+R+3la+VMjtW4zgdlOJ3yCKFiC37/v4CF2p1col207+6I
 q9xEppcB8WwsKZndc3fZaqt2OCUR7Virg7RWAHeGZufxqWdJ+s2Qn9t3xZ3fGgB4yn0M
 2ebJkNxyfhkelGrhVTxYHX/uFO0k3hNBLBFVb/8dvC/dXu8TKOFQVJJlPSYU10DEuUBu
 AtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=YeM24lYG476VaiKxvhFy/TDI/KdPjSL4eIrZ3SMzCGw=;
 b=VBaTpFBOFmIOF7LfYAkkL4b6edPjxeReCm8W6E2/jh90rI35rAJPHwcEzpC67diM5P
 WtPLwztjfYXl6OkAGDGX8Fcucm1T9N03Ea6faQ+FVuXl64TQkNX6Ln4Wcrt+LTU14bRh
 DviQOaThAlceOCoLE/G7e3bZuXwL3F+85RxxK2p8LAaWMTj8P/1VsjUdXZ4wlVZUoinU
 NuW9gtwL0/WC6/cGjCl1quQRlmJpJ6vqPTYzpE2YvDCXhHvik8f7GkfX3TOIRR6Q2SE8
 DhVPxqT6GHGJmo9p1EVQocv6UqlwDR+4bLPDymrKi2FLyh+Vi2HF8t/uQF8NGb4KJdIX
 9+kQ==
X-Gm-Message-State: AOAM531/67xVHzvflA51n0vn61OE9gtWfxvFtaCPlUq9VALnNhw46F0u
 yXgTdGKTQRO0jdoprm4EBDRtwoPdJjydmw==
X-Google-Smtp-Source: ABdhPJycKS3tZg5rZTF2Q2IYnBp1BruNkTSinWIxe0EcUpzGphwA2haxkE6hTV2gVl6T6HRGMcSyoQ==
X-Received: by 2002:a05:6402:c8a:: with SMTP id
 cm10mr24450265edb.192.1628449494070; 
 Sun, 08 Aug 2021 12:04:54 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id l19sm421805edb.86.2021.08.08.12.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:04:53 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCo6O-0003D3-UD; Sun, 08 Aug 2021 21:04:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210803084245.2740449-1-giulio.benetti@benettiengineering.com>
 <20210803084245.2740449-3-giulio.benetti@benettiengineering.com>
Date: Sun, 08 Aug 2021 21:04:52 +0200
In-Reply-To: <20210803084245.2740449-3-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Tue, 3 Aug 2021 10:42:45 +0200")
Message-ID: <877dgvbvvv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/pixman: fix build failure due
 to gcc bug 101737
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > The pixman package exhibits gcc bug 101737 when built for the SH4
 > architecture with optimization enabled, which causes a build failure.

 > As done for other packages in Buildroot work around this gcc bug by
 > setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101737=y.
 > Also let's add PIXMAN_CFLAGS and pass the Codesourcery work around CFLAGS
 > to it for consistency like we do for the rest of the packages.

 > Fixes:
 > http://autobuild.buildroot.net/results/b20/b20869bbb48edb1f0a847ea9e2e1a0462d6350be/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
