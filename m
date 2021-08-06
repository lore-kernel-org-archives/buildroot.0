Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1183CC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 19:49:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90BE461165
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 19:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90BE461165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51694605CA;
	Fri,  6 Aug 2021 19:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9eXohu8PQvXo; Fri,  6 Aug 2021 19:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACA446067F;
	Fri,  6 Aug 2021 19:48:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE4B1BF5AE
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 19:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E16C40148
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 19:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6AngrhBBnCJX for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 19:48:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22225400DD
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 19:48:56 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id ec13so14669773edb.0
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 12:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=xBKvmC19HFEuRF7fx0iZJS3zgclQz+KitFMgCV4TVQI=;
 b=O7gYL8EjhEytqjHCjLWP/q3DJVDjZ6jKwoJoq2Df5WCfxLTihacFdz7mVTkX5ndafA
 rVFMfI/whh5xV3YpQK9eMn50CkbPShkvsTU9SHnxkFceRSDSDvneTsixcs9Vt7AtJExf
 itxgJkwx11AfySNvgmnUDMUqEA04I69GDQHbM/Edd8QiFQwGjcJ9ssKOnLl5rO3tKU9m
 rpXNyIK4YlGjg4P5esXlLsCk4SJRtXRWwLUofPEkMRMH6uhohNkRUhqupbDn1vz4vxgP
 j005/pm95Jq/TyDGxfSBmF0IoC1LEJWD23r2bmhneHFE3rLb81E9F6HwuT8EuO0T/Fw4
 tL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=xBKvmC19HFEuRF7fx0iZJS3zgclQz+KitFMgCV4TVQI=;
 b=D1kxcjCX6cq2dFOZYAFONjjDXAYMLq8Io6fr+cg4IciXbdrDkBOHU2qse+PWKPkpaz
 swPDO6I1YuromK/GobR0TQ8YLc93aZEuwCnriAo25nHwXEOMQYA8RPi2sVSTQ8MNF+ui
 NvRVLGBg77iZ/sy0JnnDg42/pgPM5uqb3kX0Ckgv1tOrTj94fYn/yCfFa2HnyNbL/S/K
 SQJoZpFovMAJJm0U5/UMZxLR2VPIQA5MiMXs2pTmBoz0HKsDfsM7iiDMxKJJKdE5MtiN
 mfHNT0eN/ua3fjPgJwIBx6mFNb+nf0GGhCkjUoZpQpWIPxlkbXIrPLC2YfMC7n0QATUi
 sXDw==
X-Gm-Message-State: AOAM530aCNpC0lMvEF4xfG68ischRiv82e01DWPuA1abjJ+Ex+tTVlOG
 A0BB9oPChScGpycomaG1M4o=
X-Google-Smtp-Source: ABdhPJxnEPypxoyWkOwH6d3X1jrfuaFET6Q4iC5u64kdUjcMB/s0Jhz4MKyLxn43TLzw+AmraO3HNg==
X-Received: by 2002:a50:f1c2:: with SMTP id y2mr15170828edl.64.1628279334315; 
 Fri, 06 Aug 2021 12:48:54 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id s3sm3149526ejm.49.2021.08.06.12.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 12:48:53 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mC5pt-0005eo-3a; Fri, 06 Aug 2021 21:48:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210726062343.767811-1-bernd.kuhls@t-online.de>
 <20210726062343.767811-2-bernd.kuhls@t-online.de>
Date: Fri, 06 Aug 2021 21:48:53 +0200
In-Reply-To: <20210726062343.767811-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 26 Jul 2021 08:23:43 +0200")
Message-ID: <87czqqicbe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/x11r7/xserver_xorg-server: bump
 version to 1.20.12
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
 > https://lists.x.org/archives/xorg-announce/2021-July/003098.html

 > Follow upstream switch to .xz tarballs.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
