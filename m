Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB58C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:55:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5527611C7
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5527611C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C12E683EFD;
	Fri, 10 Sep 2021 17:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMPYo25rVbl4; Fri, 10 Sep 2021 17:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F63A84A59;
	Fri, 10 Sep 2021 17:55:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 041431BF83C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E883D6064A
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EwUDuhLaDimK for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 17:54:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D10660071
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 17:54:02 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id t6so2182886edi.9
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=BprDFzwuU0lQUrXY6eazxG9UYzRAMX9g+AtFWIUSkF8=;
 b=b4YM4ykbgy/XWTMv++HAuxXxgf6h7HJTmpRzm+klVIesXOtm2kmfyMhbz20XXXsF+Q
 wJQtKetB2+T49mq9eI+j3AH2P2MPQUZqGu9oBpRjHHAR/RveNyZChS06FH0AxMNX/gsu
 UxhtbE6S8W4QFZknAlymgr+zQ5RWOYYvV6kNMK/FxJZ/Tz5YMfQ09AKdp1RrAzp80sww
 m2Y4Lp6mYaDSPQHIjlHoB5cfSs36FFlzrtIBASrJryvi0gHygje1YWj4NpBYCipWJ277
 +VBcjyKCQ/QKTWHwU3RR5s+StLm4ZS0cyhHLzsDMvy0gx+5PkgobRtD7fRAkKdkj9Y0q
 h6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=BprDFzwuU0lQUrXY6eazxG9UYzRAMX9g+AtFWIUSkF8=;
 b=lWye0VXUmCW+qwEU0D9AP5uXTrpL0Yp2b0uuc6cW28xcZDrzWvCQLrK+6gGS2a/DxE
 yF5qpCNjmX5KySU+sOGZRXwhz9Fw8Gmd+6wDu73coaP1LxC9B6Ko4i1PoZk7KpGA5/v5
 zoyA7+7MTSCgPEg1TCFjT6uEkZJ1AOTTRch2ubbX/bfheRylYlkkrWFl+ygQVVdoRVQU
 nT8tvR8rNyqxetnSHzMrBmUAOdBbT4ul64HeoDkoDO1dX4ZG7uvTihtCjYRK5D446HG9
 6YUVkmpehOASnnCbDCkiWqalZxbXLp5NKatT+NwCYfLXY4ZYxm71kiFo8Z18tkg/Ko3T
 oUwA==
X-Gm-Message-State: AOAM53355lPeTCzCQ+L40xupfVB4+2lJQatmfb3dLtA196lpVqJSkctn
 qJPfpUUVChHTAVFGFj5oTOM=
X-Google-Smtp-Source: ABdhPJzXsXPXTjDbxV/8jjABVzF5XYHravhADDXCmcHmE5MiTLaIdyWRxCT4wCRSxZK+qYqpOQh/nA==
X-Received: by 2002:a05:6402:42d5:: with SMTP id
 i21mr10483535edc.198.1631296440389; 
 Fri, 10 Sep 2021 10:54:00 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 r2sm939414edo.59.2021.09.10.10.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 10:53:59 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOkit-0001G7-7i; Fri, 10 Sep 2021 19:53:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210910065532.31730-1-bernd.kuhls@t-online.de>
 <20210910065532.31730-4-bernd.kuhls@t-online.de>
Date: Fri, 10 Sep 2021 19:53:59 +0200
In-Reply-To: <20210910065532.31730-4-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 10 Sep 2021 08:55:31 +0200")
Message-ID: <87o89071vs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/5] package/x11r7/xapp_xwd: bump version to
 1.0.8
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://lists.x.org/archives/xorg-announce/2021-August/003102.html

 > Removed md5 and sha1 hashes, reformatted hashes, updated _SITE.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
