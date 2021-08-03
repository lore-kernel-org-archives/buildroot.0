Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD58C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:08:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1532F60184
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1532F60184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D33654051D;
	Tue,  3 Aug 2021 15:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wt8xF4nYxVHJ; Tue,  3 Aug 2021 15:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C5AD40513;
	Tue,  3 Aug 2021 15:08:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B3251BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B51C606AF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vBiCgr3F_1-E for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:08:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5295460585
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:08:38 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 n12-20020a05600c3b8cb029025a67bbd40aso1989055wms.0
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 08:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=bhJTCvnhVS8IaT82nB+fnhuV8TRPF9r7QOTbgo54ivA=;
 b=vW0lfeKaEWLGk/iv4/RVCG+xq3GejLm4r5bak6eh09HJiVJY4XGUHqys9DEAzQg/X6
 X5Lqt537OS3j41QOzDFWvX+59Od8bd+oqjgUCttCrZJhCfI2R+AXFL79R7bJnbiWCZ8P
 L5moj6y+u0G+6BHTh4sC3BPEZ0ZG949QZVOItdXsGhU8Xso1dSAr4A98xNBWBPireXhf
 xmO02Osb42vct9Dg8r6iUyT8kxlS6t6GoA+h0FzBH17r6+IXPQLnKSZ6Dxt0saR01DRL
 +JMCwJSUsvsNnynhs9BVKUbqnit0P5JZ0XQ0IgF6LE8erfF3KjTMZWM8t1NyhZbd8fQH
 qovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=bhJTCvnhVS8IaT82nB+fnhuV8TRPF9r7QOTbgo54ivA=;
 b=aqpY9/V3zMffYhyeA2caS1571A48/EOaq/x2TIeblajC0M7PaaESe5IBlrsL23DXoI
 w1PMzs1Vn17xli/LVBlkxo+KwUdL1PASm+oqefQRtvJKeOTiXy2fzV6J6EWb3mAg2RzV
 8vrt/1AUefFzQTfeWa/1feCGArQIijnr8iqYMzjmdAd+R0Cn7bM//WxliJYgOWSLHhi+
 0jMARs2vhDNpq5oiZdGi3Pe4bDKwtV337bYAMIah7y899TaTbwgrY/iUfn/eY1DtayW5
 ofRdrFHrADpocCPUSIYKfNE4cxT6WKQMyPFSMs+xpfFy7FupDlOIHKOXih6x23NsVAJK
 /rXA==
X-Gm-Message-State: AOAM533lbIVuTHh1SYoprbgB6KVBCpssdKZtn2PmIiwxpAR3pqlei6pQ
 mGLl69uNxWPwj3CcGbBpti3fBBysU2BAnw==
X-Google-Smtp-Source: ABdhPJwUa8tmOJx+2lNbVtcFCh3h8SKdasaiRaXY7Y8Rm46WETWSlNXiNUYLIKtOHUvLnzMEW1cD4w==
X-Received: by 2002:a7b:c749:: with SMTP id w9mr22538874wmk.98.1628003316536; 
 Tue, 03 Aug 2021 08:08:36 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id t8sm15729379wmj.5.2021.08.03.08.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 08:08:35 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAw1y-0002xV-MA; Tue, 03 Aug 2021 17:08:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210707204114.414040-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 17:08:34 +0200
In-Reply-To: <20210707204114.414040-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 7 Jul 2021 22:41:13 +0200")
Message-ID: <87czquwop9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/libnice: add
 gobject-introspection optional dependency
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > gobject-introspection is an optional dependency which is enabled by
 > default since version 0.1.8 and
 > https://github.com/libnice/libnice/commit/0388646bdba5f91bb6bb509f5a1c6e9e3f068555

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1cba7aa233e19472a69ffc2d8f7324d363a22deb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
