Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CD7C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:47:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2029660F21
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2029660F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAE1240415;
	Mon,  6 Sep 2021 14:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0KOgnypR9cgV; Mon,  6 Sep 2021 14:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 271F34040F;
	Mon,  6 Sep 2021 14:47:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17EB01BF34D
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00D9981B53
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gB_sAHiGckS5 for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 14:47:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAEB781AF6
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 14:47:16 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id lc21so13948748ejc.7
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=0rkZJRvVcDg0J5Un91ddUh3WVVm3GocElUR4AO3oFG8=;
 b=q0y2DWUpD+Jk1mx/7QR/9lpqDUOlLOV1xcjTjJ68XnD98lGPlLOqWsF2HaQBYr0WrP
 9VftHyDPAG3OegEyXrFi5MtDVs+/aApFpcrABd9PU19grvllqGWPjzamdI1RiukjLAj2
 5Smboe7VM9yAv/ozKGwAY3sJ34bm55XUII4/hZhZShMr6CBRnAykRqI5ATZdY7PnNshu
 pbiz5qKO7edXxCUnjopFmat7I6F2z1kH+Fi33SN+Phhvt9lNGxxBAKbYG/JzyEwwuzjA
 t3pBYTcOazzZYA1Djm3O8UIcMMKiESFTmKUOVuRfggu7earBu6fWqEDUl3jIT8YQGj9O
 73qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=0rkZJRvVcDg0J5Un91ddUh3WVVm3GocElUR4AO3oFG8=;
 b=bywUh8YRwbZxr1/6X6dMNGWSyw6eyUV1caE2j5jp+yOb/LAbj59EL+BzZgWSxeLWAC
 KgkG/VhMbQvootO9Vd80QEzthN9Rb86OjmcrzJ4DZv5JeuMN+MzUrGGLOMAGXE2hn2yc
 //83zEswFNxNxdLIEmoeb1NKV8/NLW3yVfaHSl9MqVHq1a3lkMwaSqEcqQHQHwAsSt/3
 X1pzsmDSJT1xfBVJwAtM8Gn4i9x4VGmTgY6d9Kk8DONylDCwJQ2Q+gafLvHmw+8/phTm
 vRLCQnXK5hbInOmRPZAA/ricJ8YhYsPQ7c0CI8qZcJipD0JZAD23zQktbBHUZ+OMerLp
 XQ4Q==
X-Gm-Message-State: AOAM530p9IO/p3j3qMBcsCGxJTSzlCUvvkTrdDFwYSCWFGB3L2w7+ynL
 eMUmwgrIQgD/YAyxIohPxXlXQw+/Gf0=
X-Google-Smtp-Source: ABdhPJw0Wgnc6PwzIRy3c0myEkSW9y8H6CjDxrcB2CU9IhAbVlaC03s0seosw2SWVSV/LAvD2kSBTQ==
X-Received: by 2002:a17:906:7a0d:: with SMTP id
 d13mr14248448ejo.70.1630939634921; 
 Mon, 06 Sep 2021 07:47:14 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 c25sm4051267ejm.9.2021.09.06.07.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 07:47:14 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNFtx-0006mt-Q9; Mon, 06 Sep 2021 16:47:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210819205405.2BCBF8D5E7@busybox.osuosl.org>
Date: Mon, 06 Sep 2021 16:47:13 +0200
In-Reply-To: <20210819205405.2BCBF8D5E7@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 19 Aug 2021 22:54:30 +0200")
Message-ID: <874kaxkbgu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] linux: bump CIP kernel to version
 4.19.198-cip54
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=595209da939022e01515bb274fba4f1eb62cb9ca
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This patch bumps Linux CIP to version 4.19.198-cip54.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
