Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570B2C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:07:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DF7260E9B
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DF7260E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F175838B2;
	Sat,  7 Aug 2021 17:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8CHI1nAGpFD9; Sat,  7 Aug 2021 17:07:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A65AB836F6;
	Sat,  7 Aug 2021 17:07:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F6B91BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 073B783759
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dtK-gn0C1mdm for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:07:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D030836C5
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:07:12 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id h9so169740ejs.4
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 10:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=EZzAHP26jPtlzYfhdvSTVvAjt3eAcvEMXocbHhfR6LY=;
 b=itNxGMg4Nxbi7rrtcI0kS3whacvuDJR46BjQIfLx4LzH9ch/dWOib2t/tssx4M+HtD
 DkJM0yJj0KkvjN/UtAIJSaqiKQu3hNwKQoK3jm+81SShnu7k54IONdhFilvbCePmdzw1
 4jP9l9Vh8frVvr4BDbzDa/6mqayjxXfCoLJ8FM+oLFWWSDe0rR8ZwxoN9H++MqKKabRN
 HEQfoFngcv6Z3GzJtJODjUGgJxfMMBgAdDAQMBDphgSce5aii3cq2PEbxZ3rB2uFmDio
 GL0kD2KruTGms+ySkLo50JUfkfQcRbJXBH9rZDXAV3+PxKdC2uxx6fyYUQ6lzaRkZL9E
 u2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=EZzAHP26jPtlzYfhdvSTVvAjt3eAcvEMXocbHhfR6LY=;
 b=gRF0SNcFMoDh5oP0/+ObM5BuU0oDAn/NW1CHbRagFpZLz9uqj84T5aXz6CVQ69obAe
 3W8U1iEYzmyboYeWhZCHne8nBAbkgCmEaqiKR1S8QTNbH6qIXjp2Dmgr2A8UCXtOrvIa
 obGYM/kEwchAO5h2zc4+xW76zCsKxMSP6LZLRiLhYtRijD4Nvbyu12K2tN/Dcth1MLOI
 Y2Sr9Kp3YrdHhuwrNY4UjixPuwXbUQs34zxwSO8cObqxEa1v6lFjJp5Rq/O5E1z0tmxZ
 56fEHQo9bRx/XpZp82cWqOgCRsqa0DT/lWErsW1mLuMfiFIWcQbvm+newGcDQQq21Hoo
 Yn+Q==
X-Gm-Message-State: AOAM533zpZ5OQ8/DcHM6rfB5ldZkng3Ldt7iX+zb2kf2/SOvc1Ia4Eeo
 nWW5d3ZgpuKpl68eNkeAK5c=
X-Google-Smtp-Source: ABdhPJww5oS8nbXX7Iq8SLn6FUT4x8h+ULD/9HQthyW+MdbU7HG/RUyEcLdTrSgGIshpD0pilr443w==
X-Received: by 2002:a17:906:eb4b:: with SMTP id
 mc11mr15541569ejb.474.1628356030518; 
 Sat, 07 Aug 2021 10:07:10 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id b11sm542907eja.104.2021.08.07.10.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 10:07:09 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCPmu-0003Vv-Q9; Sat, 07 Aug 2021 19:07:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210731144622.66168-1-buildroot@heine.tech>
 <20210801000716.5759d501@windsurf>
Date: Sat, 07 Aug 2021 19:07:08 +0200
In-Reply-To: <20210801000716.5759d501@windsurf> (Thomas Petazzoni's message of
 "Sun, 1 Aug 2021 00:07:16 +0200")
Message-ID: <87y29dfakj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/neard: update url
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
Cc: Michael Nosthoff via buildroot <buildroot@busybox.net>,
 Michael Nosthoff <buildroot@heine.tech>, Simon Dawson <spdawson@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Sat, 31 Jul 2021 16:46:20 +0200
 > Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

 >> 01.org url is permission denied. There seems to be no project page
 >> anymore. Use kernel.org repo with cleaner https url.
 >> 
 >> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 >> ---
 >> package/neard/Config.in | 4 +---
 >> 1 file changed, 1 insertion(+), 3 deletions(-)

 > Applied to master, thanks.

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
