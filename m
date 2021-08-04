Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240D1C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:30:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2A4560F25
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2A4560F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93533608B5;
	Wed,  4 Aug 2021 14:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hl8rMkrhZWjZ; Wed,  4 Aug 2021 14:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2C16605EF;
	Wed,  4 Aug 2021 14:30:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3D121BF5E9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C347A40643
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vOnm2FZxFZUW for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:30:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E784540638
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:30:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c16so2473046wrp.13
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=10G1++O1YxOfRfUiWeSxgnfl96cnhKo1miiPKIkG4ec=;
 b=YKwA/D6S92kPYJeNmr3fDpRS2m9FjDnyc46TA/oU2dEELgMvIHsAfkMX+FhodASx65
 npom25CE/jm/sfUWbcYf/rGIcHIQvXvJviu5kn922zsVY785wYLpAlDUfu5pdA9ybugo
 2cbXBJl8EsDeRXP6Bv65Yx+UKBwhsfj++MaCdtlKxErEu8/LxobMadMoUYAhXiMwZkaG
 X52ZJtaF0+kKxZYGlzwCRTxnF5auDJfCdSFstVKvqqHisI0UPFjOaeBBfT2NLIGSAufq
 0srBAtq/3QoGCL0YMf7jGTWXj5M95uvO5+jxdyeMBeF76NX3mparD+T2P/Jm5yjecMXs
 XYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=10G1++O1YxOfRfUiWeSxgnfl96cnhKo1miiPKIkG4ec=;
 b=qhKFc4ynRJEN+mrqCXiZTyMNP9S9mBn8k8/eiT3ZT95st14zpdetHN9LQcoar1JHmk
 +aVaRdd2jQEMdSw/9eZBlwI74eGBB8dmEPhMr8rwRpNhpVGzzwMA8I6FWxEjxkwcT6gd
 WiFQn84xMrZ7huHC7rcmk3FLPRDoRA63KV91he4dqBOKAkALFTBUrrO19Y2t+CxJRGor
 iwNsBwtkD+JUFMzEudmWJDLWXHnUZChVa8D8rUie9oEmeSjBpsSs7S0/Bwi4FoE8+1RF
 s9ddUuogWmWK8LBtRM3yYEGdrkdQv2XBUGA7vmTmRd2LwMklsVuk0qsbaSxPP10XP1wr
 9P/Q==
X-Gm-Message-State: AOAM533NH2JwzcOsTVwt54v3WH4OPdBpKR5OF142RPAg+rLn1mSw0gNc
 5xTpkncS+4jaXmEotXaIU+8=
X-Google-Smtp-Source: ABdhPJy/eguW0uidL8pxz/zdDpLynX/InfYK9VN6YGOGS1CIvYrAFHZEVe7iInEAMBr6Xy181zUcgg==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr28758785wrp.3.1628087447186; 
 Wed, 04 Aug 2021 07:30:47 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id q9sm6148745wmj.2.2021.08.04.07.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:30:46 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBHuv-0003jP-M5; Wed, 04 Aug 2021 16:30:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210704123206.3278173-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 16:30:45 +0200
In-Reply-To: <20210704123206.3278173-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 4 Jul 2021 14:32:05 +0200")
Message-ID: <87lf5hqo2y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/granite: link with -lintl if
 needed
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

 > Link with TARGET_NLS_LIBS if needed to avoid the following build
 > failure:

 > /home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
 > lib/libgranite.so.5.4.0.p/meson-generated_Application.c.o: in function
 > `_vala_array_free.constprop.0':
 > Application.c:(.text+0x340): undefined reference to `libintl_bindtextdomain'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d754cb776a1e11031cef4e66d45619aad5c4575d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
