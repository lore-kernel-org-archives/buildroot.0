Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1971CC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:24:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE01560EAF
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE01560EAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52C4660727;
	Sun,  8 Aug 2021 19:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcuFa7hfWOGi; Sun,  8 Aug 2021 19:24:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A126C606D0;
	Sun,  8 Aug 2021 19:24:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB7D51BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C918A4019A
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jA7PE-o4nqk0 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:24:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64EB0400AE
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:24:19 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id n11so9137992wmd.2
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=0VA6kICTs7RklwYzVL8OrbegkmDgXInSz7I0Kgqolx0=;
 b=vcCidpimZazpw7C+9pfsogR5bejXXNuFfmFJ9Vck1SSwtLzbZK95XK/WiGTphxhVOA
 mjDm0P0XOERXmlFGd0gPZ4Mgx1tsQJvBwGgmW2FfL9RuMcKf6jo76n3+dJVopjt2lIov
 TDxycNmjx3eGeWvl5H9absEFUCf5lWJ6osi4uD7ICUQaNzzHjaSsVgFeUGMzhr6nxW5F
 JWim9Y0InxfuegpNZws/gg4a4q/LpoF9rKw2HQEc+qlTKdmjTuu9C4gRUtHoQLyy2tb2
 9zuOvHOJDF9Y8rF5Em7ls1ylCsLTwllBPfpfQI4NqQkKkcMAZfIm8mWiy+xCcBsDkQi1
 F/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=0VA6kICTs7RklwYzVL8OrbegkmDgXInSz7I0Kgqolx0=;
 b=tEGyr9Whq2YJTVyox9+w4Dydy9AuBt9d6eeLKTiQPRnyS72QRjqK7KkY6P4KSnYMKP
 jlwPfU3G6OgTkPlz9dF8sdUzQCIkeT2GPS1MLrTiA1EZUQ6n/BcHkp9PRxzxamsQp1wB
 4MwPsPMD6F1EcWNp+u29LqeB7qpISdPNASyw7kDuvyjZDo9e9GE0p+lfUYcWyRPS8f0+
 HOasVSJGwD7LFxRV8hFU/7pX5OV4SypexQ58ucd5IXmyrlcSeqY6yVwSizylO2JIGDhc
 qIl32PwClyBZ8zgVrFtpvXiqKQzqzHHJg58uR6fUC0CiXA+iE2JwD216SLoqSbhRZW6+
 m/Fg==
X-Gm-Message-State: AOAM5304elcPWfJLlTCGhxl43GPsxR4v6gJ2pUyMIIe0tSppgpUFUNOL
 ReQgDQCbdD2NltM8I7Gl4FL6mZlTGDLqxA==
X-Google-Smtp-Source: ABdhPJyH/KZjlB3tLMgE1CS3NKZ3m0ioQlbMOrbp7HyoacP/rCdVJjYtAB0Lyk/v/cyCS6jGFLcX2w==
X-Received: by 2002:a7b:c1cf:: with SMTP id a15mr3583547wmj.72.1628450657394; 
 Sun, 08 Aug 2021 12:24:17 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id h4sm2327197wrt.5.2021.08.08.12.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:24:16 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCoP9-0003mq-EZ; Sun, 08 Aug 2021 21:24:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210807103255.A9D5E82D86@busybox.osuosl.org>
Date: Sun, 08 Aug 2021 21:24:15 +0200
In-Reply-To: <20210807103255.A9D5E82D86@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 7 Aug 2021 12:33:03 +0200")
Message-ID: <87h7fzagf4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit]
 configs/microchip_sam9x60ek_mmc_dev_defconfig: add missing options
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=28803d38e571250d599b1c59054f09cfef6a7a04
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This defconfig needs wchar, thread debugging, and udev support to be
 > able to use all the packages it enables.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738516

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
