Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6ABEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 13:23:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05C6860BD3
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 13:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05C6860BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9A0D607FB;
	Mon,  6 Sep 2021 13:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MVkCfRrUWAYG; Mon,  6 Sep 2021 13:23:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32977607AE;
	Mon,  6 Sep 2021 13:23:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 398D81BF2BA
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 13:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F0A040455
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 13:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GwNG318DqNYT for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 13:23:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD57F40248
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 13:23:40 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id lc21so13493181ejc.7
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 06:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=WJwml06+sJGmDDOYBGNA+LOFPRN51xh/4Z6Bs9axbvs=;
 b=RRgLmbHZ+9kbKGVxV5k4PRYwmuPt2/b9bZK63gm8uwB3GJKpOc7HNJkgOlZtP5Tf89
 0BJTKSBDRdK16qyjGv4ama+ombxpU89I1nbHT4nWdGxAv9hlwH3K8MfpxJbzBAgjtAqA
 Wh82gfAfWsz/hvEhPBdUBwFxSF0C1pbqeuKNlYgCmEXsJI336BgrVfq20jMO5bINGoiR
 7T6VsGCsA2PvOcHzqE7kBOKU6Isry3BlCtOiF2bFbrYWXTxz49yvsTMyW5Jz2zZKGZwg
 TNKm/S5EmG1R0KBY3W1s6Kw/oDEPTjYgnsFufA018h3yS0yLAJtZk18g9PlJetr/y3D0
 jk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=WJwml06+sJGmDDOYBGNA+LOFPRN51xh/4Z6Bs9axbvs=;
 b=GQcYC/R47TaRGfkebd5xFfZF3nPb6uSpVUpNawgvyWvFLhMyrJMAbQOaX3bqxWi6Sx
 gl+tLWaicH4ETYzGDXr/YmTa3xRFsrClPc7+f7QWWGX+T6CQ0avLUWzGVIVRwecxtAO4
 LLlLuIAgv7MWlAleJI2ZLe6f9NxL+yovV4Eg5MmMm9LFHW1ru4ypxMvjGU6cvrE23W9i
 ovGc9sNrjPPBe/WDObp6+OVkGlLWoyWLGtMo4mUCZcfgomF1NXpNZ0wPaE3Bs/NSzQTd
 2lvClYrc+E+79lviLSim984B2kAFtQu39NjkE6FBjepBGyfXN4mQdqF/REPsQBgS0Vls
 HHrA==
X-Gm-Message-State: AOAM533q9nm/5POoFzLegbvp763UOYq/o4RJi/G21B0n4fT5DSUjk49w
 PTh68iDxyrDbv3MaKy146t/pxQAwwjk=
X-Google-Smtp-Source: ABdhPJzEKXsdaR0dnDNlL6mwFFC3HjlrCCgiSfahUatF8KngeVPEE62xz7C3rReKbkg4CuRv9C4ENA==
X-Received: by 2002:a17:906:31cf:: with SMTP id
 f15mr13606823ejf.272.1630934619071; 
 Mon, 06 Sep 2021 06:23:39 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 dj25sm4692741edb.51.2021.09.06.06.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:23:38 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNEb3-0000ts-8H; Mon, 06 Sep 2021 15:23:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210818235907.906265-1-giulio.benetti@benettiengineering.com>
Date: Mon, 06 Sep 2021 15:23:37 +0200
In-Reply-To: <20210818235907.906265-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Thu, 19 Aug 2021 01:59:07 +0200")
Message-ID: <87mtopkfc6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/openvmtools: fix time_t build
 failure on 32-bit platforms
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
Cc: Karoly Kasza <kaszak@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Add upstream pending patch[1] to fix time_t on 32-bit platform.
 > [1]: https://github.com/vmware/open-vm-tools/pull/387

 > Fixes:
 > http://autobuild.buildroot.net/results/eb3dfe679536b578a0f16762312a96ada7162095/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
