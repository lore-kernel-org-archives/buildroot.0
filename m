Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27C9C432BE
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:53:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CC2760F35
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CC2760F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F47640519;
	Wed,  4 Aug 2021 17:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUrO1hJI_Fqv; Wed,  4 Aug 2021 17:53:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BB94401AE;
	Wed,  4 Aug 2021 17:53:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C01A21BF41B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACB33403D0
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q0aPru6XIajC for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 17:53:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBF41403CD
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 17:53:24 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso4466144wmq.3
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=9I/HzPPzb88DbGNPCdWSzQffM7yUaiSyNEoFLZ5mM44=;
 b=Ku5sgnzhRmrq4ov0J9Zlp4ILvPBbUz10tM7jJCDt5c3ng8vaH5NK5I/pk8BTqJR99a
 +yjSutQTY9evxsa08cjitBFJHQvXVFqeewJz79D2/tmvMw3pvvEEIN2PPf0e7qduWpFU
 agdEdTUbBot0QLXgiSr+pYukmzErzIP60sn722mdaNf1QWUus7Gf/v0dcMFcdGg9z9b+
 CkS2EGyuB8WnR1lwuwbY2v7kwR8Xh1uu7ISnQbz63a57OBbnzyvWNGnqhTYnhulfTRlv
 6qLKRVOiWWCyWiZ0E2A4s4yOFRCZRpQ2sEZkABlRew012kc6gRRAlekiSX7oJZwZuRqj
 L2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=9I/HzPPzb88DbGNPCdWSzQffM7yUaiSyNEoFLZ5mM44=;
 b=nFTZVzpub07Z0U/y4CK2PifFTM5AThXc2I1tWiXfYyiWlh9/J8kAd+lRMe58lFLt/T
 U4PMaY9jLr/aEDuS4vpzRrK5RPJ+WE5LvU31MOWyJ7WtZkVlZ7v9t6HtTVvoITXKSwst
 5Sc7MzJaJSHk6VAHPygKZ2yX31RF4rlCOJKTqPHuE1r+okrr1RZEiNC9SHtwP8Y7gqDM
 kVlw0zX3bxeNHtj8jLHRvzgGmvtU21NKHRKH4YKKnkvO4nRMiSFsejK+2dTu/9bN6IQS
 wxxoLzGOCLnL/lRlT86rKNzb4XGYQkkTARMiilqvQzqewMpzmf6C/c39apgmfowkSz5o
 jM3Q==
X-Gm-Message-State: AOAM532tR35QYDziIpDOWHxWLolDd7FrC6vyuwKzQMtnjGRj3BokYrhs
 WLcsiyjE/ZHth2nH+oMTT3w=
X-Google-Smtp-Source: ABdhPJx61muEnZykagLZ11FaQ3CUZVYLg7l2ddb+iD4LLDVVK0sgjenySD2LA9HhhSg6g8Xyl5N1Qw==
X-Received: by 2002:a05:600c:5108:: with SMTP id
 o8mr728488wms.97.1628099602988; 
 Wed, 04 Aug 2021 10:53:22 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id b6sm3899556wrn.9.2021.08.04.10.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 10:53:22 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBL4z-0005sy-2x; Wed, 04 Aug 2021 19:53:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721171839.496782-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 19:53:21 +0200
In-Reply-To: <20210721171839.496782-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Jul 2021 19:18:39 +0200")
Message-ID: <87eeb9p04u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/proxychains-ng: bump to version
 4.14
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

 > https://github.com/rofl0r/proxychains-ng/blob/v4.14/README
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x given the fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
