Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735BCC4320E
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:34:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A9AC6104F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A9AC6104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E76F54010B;
	Wed,  4 Aug 2021 12:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l3JsU8FqlGnz; Wed,  4 Aug 2021 12:34:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AC1040431;
	Wed,  4 Aug 2021 12:34:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 268D81BF2A9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 157824010B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gI2LPbPcmAhm for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 12:34:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8FE740451
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 12:34:38 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso3808164wmq.3
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 05:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ChdlSFb4ErzCd6iHDItcUkhqGG+UoNJ5G/fzZtpnYF8=;
 b=RVivCl+PUKh4B9haP7rZInaGxGWw2SAU0ZxdQArEV433tqXBrZnuycQHat/YPkW3qY
 thOBfV3MN1EkvNshFKMUF4gusx2KE8rfhQtp92VKfRAovjlfOno82d5Jh5XPko6NYYny
 qL4GFddex94EOz6MTZReXeqyEGgEhwURlcweMsQlcfsIkUOQoR89G4mVBY3InqSLzqAO
 JblCtMHgaMzhAPXlId8Fz5x9TvKF6+U8rUi58oRxUlCZpO8Qs3oUPpFwWafHEkg6U3hb
 c65nqIhVWRNm5RlAOgC1PDSZFhy0xDkQ6o4Ldeg7qO3ykVXGZNHp9qEXEygYR28O+ALd
 EMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ChdlSFb4ErzCd6iHDItcUkhqGG+UoNJ5G/fzZtpnYF8=;
 b=NEKyDnaidT2jvbrGpl9r6HtCY63HIw/gw6fE5I+d1rtoFqYHE8xWEFHGs7Ca0sa+jr
 KamR7/8LkqD4v4JVKUIdUNcM1DpcU668r3DdzQJECpFyDcPGJL2sKs/t7032o5fJQDeL
 qXv0wX7KLtN3qnwE8HCDaufD5zExUN0E/X3eIapPP7IIuVU7n3sDhYZJNQWDDadwgSdL
 1j+35oc29BUziurfDe5FIRXsZKuH4fXivPG/tOefFHhRhrOt4aZH+RcRUVZkNrbw3E03
 G1Ep6TtT4EsbvI/5iixA8Y6U7eVu0ga5SRmU2s6pPy0Bmi7CeOWlzD6vzUj/wxpAegrf
 x0mQ==
X-Gm-Message-State: AOAM532MsbOV4eRIKxK2DzK0T3O0HCQGThEts/QqOOgVltbec1qDSQgq
 OlBuCzvXXbYrSP0OLakMtlU=
X-Google-Smtp-Source: ABdhPJwGBwG1d54cRGehe79PcbGjwM5ejcr+24Q33YrnsCeqUchUYoOkcDGJAb9yj1dVHPCH6xQIhw==
X-Received: by 2002:a1c:c9:: with SMTP id 192mr26382836wma.128.1628080476990; 
 Wed, 04 Aug 2021 05:34:36 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id n3sm2188318wmi.0.2021.08.04.05.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 05:34:36 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBG6V-00027O-Pp; Wed, 04 Aug 2021 14:34:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210616061002.345235-1-fontaine.fabrice@gmail.com>
 <20210616061002.345235-2-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 14:34:35 +0200
In-Reply-To: <20210616061002.345235-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 16 Jun 2021 08:10:02 +0200")
Message-ID: <87o8ads810.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/spice: drop duplicated opus
 handling
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > opus dependency is handled twice since commit
 > f33f7a4f6407f624edb4b4ffe54cb09e029a49b2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
