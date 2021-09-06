Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D7FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:41:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 932C360F13
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 932C360F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E3F782496;
	Mon,  6 Sep 2021 15:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3zkrQngaWuZ; Mon,  6 Sep 2021 15:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99036824CE;
	Mon,  6 Sep 2021 15:41:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B32831BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFC0260883
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jY_CvRHKLD0N for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:41:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C128F6072C
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 15:41:37 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id e21so14183394ejz.12
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 08:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=CnpJW54peAw+aGwvaPkZ7CzpTZ1Xnoa9PJi7rp0L41c=;
 b=kd0qxBK0Vw5wDfC5gZwMkZaUP44f+wfu2zuBWPtkhuUnPbu/A6c7GfNRm4LGgLHhrV
 gyNUPDDK4biZQlTb4RW2mjoFydAlsIO/nExhjSdXpW5LYjcVHri4BsNMMhrNaiIm0x8Y
 4oKZA6Mw/2b/q/rS0sywEKMM3zzDc19ZTlpIizNnlUR2FavuqLltsKrAR5Yq5VqqPNag
 eVAU5hqglrny63GUov1oXFhle2Firl3HsA4U9rjYahBkqsHER2LbPJIvmIajQa7geD7i
 osBdnBzmE9GtPGmYbrd7m+gwuHFqCuzOb5nwj4Wct/lzosSe43qdgBkuXGgcja2TLEWT
 rRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=CnpJW54peAw+aGwvaPkZ7CzpTZ1Xnoa9PJi7rp0L41c=;
 b=bTNEyA90BncO8biBv6yZRroukRmYwXXcthnmWuMxgoPuNl0NljthqD8wCuMwSiMegA
 5lwYzkgcINmb62GjApQxFzSMgAGn1KUEv3DLblLP0LzcCXltvr32n1V3ff0eVBEC5TZ7
 Z/rnvKz/DNTt+f4DWQ7Pj9xamIWKLp3RgCE7bpsnXsJHEWpIMAz9y25B2bb3K4sosmUh
 02s9oQGiyt6m1xoXoX4DWmVlbwiGmee+yB2eC1/Znhz0VZlBrGUrBc7klg79dqeu3cuO
 43NRchrQuyu+Rh0pqc1PnDcXUTm0AD9GTun8cl5PR9MG0FRAV3wPQs6JLuVj5qIXGZV0
 Ju7w==
X-Gm-Message-State: AOAM530K6iBgayiJYUdrWiUYESRQdiWN5v6ujA6zH6ERO/g1mTur91UM
 MOt20jpixhl6aBa9YH+5hQ4=
X-Google-Smtp-Source: ABdhPJwExPuZDA/XydcoBMjE0t+evw9+PuI7zMXyD35gk3YLeACGqFEBHcWrDh4VkHc/36PVigr50A==
X-Received: by 2002:a17:906:d113:: with SMTP id
 b19mr14176951ejz.366.1630942896038; 
 Mon, 06 Sep 2021 08:41:36 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 x13sm4141654ejv.64.2021.09.06.08.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 08:41:35 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNGkY-0008RB-TA; Mon, 06 Sep 2021 17:41:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210821093908.677218-1-fontaine.fabrice@gmail.com>
 <20210821093908.677218-2-fontaine.fabrice@gmail.com>
Date: Mon, 06 Sep 2021 17:41:34 +0200
In-Reply-To: <20210821093908.677218-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 21 Aug 2021 11:39:08 +0200")
Message-ID: <87eea1iudt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/sdl2: fix build with kmsdrm
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
Cc: Michael Fischer <mf@go-sys.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build with kmsdrm is broken since bump to version 2.0.14 in commit
 > 5e0da5c40da82d90c3f6ca037170838a6689b65b. Indeed, first patch was
 > already applied in this version:
 > https://github.com/libsdl-org/SDL/commit/9354aea19834ada7ffb90d379600a242a7aa820f
 > but upstream made other changes that requires EGL so add an upstream
 > patch to fix the build failure

 > Moreover, run autogen.sh instead of autoreconf as it breaks the build
 > and is not recommended by upstream:
 > https://github.com/libsdl-org/SDL/pull/4214

 > Fixes:
 >  - http://autobuild.buildroot.org/results/355c7e5092e7641d8b04ecb550e2671d70720bd2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
