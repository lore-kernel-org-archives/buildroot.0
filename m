Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA070C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 19:07:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5309D61051
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 19:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5309D61051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 190CB404A4;
	Mon,  6 Sep 2021 19:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6yW54SKXh57b; Mon,  6 Sep 2021 19:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41E95404A0;
	Mon,  6 Sep 2021 19:07:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8780C1BF34C
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 19:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 734C98249B
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 19:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QjZkctvBI2Gr for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 19:07:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A76D78248F
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 19:07:22 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g21so10655408edw.4
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 12:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=RvpnhLdVCiT7m1XGDdbEVC97byo1fXK5bzWTlJopXNw=;
 b=ipHBQqd+9IzP7XWESvZyvw1xd+9CxKg286On526oxGJGwTfXqa1FRncaqI6FLDyv+G
 oBD1T2+u6VjrUCFQlmFmdV/cNwsOmh1cPi9nY3kjdoeuu+YfZF3BSg+ZOW4tsrXsAC0o
 RAOKfU/Nb0tjssnV3Gwa+gZ3UGb/x5miYZVomiMPEjYvJiasilyIRFHlhUNWido0M8mt
 7Me/mK08DTopy2trjM/0Gq//zcsHYnzObbNBJ/J4n7jKPC08g6+88OW+lAVXryGoaVVT
 8JSXPwKNjLzqfqbIUyjRUaAge+YHBLitRWJ9P5416NIW5k5GZJBIP/dSyUvyA2yCX5HV
 4Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=RvpnhLdVCiT7m1XGDdbEVC97byo1fXK5bzWTlJopXNw=;
 b=LduPaNCj/386SMGh8evNM+XKlAU76FFZlHSfLb84IICXui+VvzdYIp9MDFUcQ6Rs6S
 hWNecBnlMhSQITrMN/7U9kSm6larNqTlpxbYXfRwRoF1R8zl0mZ1jlhBcdT1wa3riNll
 WyJ84LrNm6sE4ED7C0ZLp/fQP3iEC7UKsx+bMVCYc6ol6buBykj8zLBQ4mdc3vENFaVA
 gyBjpcD7+of+/W65R3CKUjDhiERowa67sYNbHK2UOPYrodnM8MN7ZWZXr8sYLCdEg2ZA
 vNoJ1VlJDv34+qRAywgnH1Y0LYYWU0TE0R7w+Y5fAHvaV/aJuMfIYc54PGlIvZFHIQOH
 qE8A==
X-Gm-Message-State: AOAM531Boqul6xrfxjp38Vv/Xbs0PFj/0TVOjLA7FXPCkmaxWnQ5U/wO
 ncqQrn7RbPCPoS+J6vJcq3Xpq22zJG0=
X-Google-Smtp-Source: ABdhPJxNv94B0+AJj5tDosrjCnUwkVPhOI0gr34CT1U7m0TMDrol/wuZP7h9PDgDIJNc30CbuqSChw==
X-Received: by 2002:aa7:ccd1:: with SMTP id y17mr14923960edt.314.1630955240947; 
 Mon, 06 Sep 2021 12:07:20 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 h30sm5180603edz.40.2021.09.06.12.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:07:20 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNJxf-0004ZK-OA; Mon, 06 Sep 2021 21:07:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210824215012.1CCF48D41D@busybox.osuosl.org>
Date: Mon, 06 Sep 2021 21:07:19 +0200
In-Reply-To: <20210824215012.1CCF48D41D@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 24 Aug 2021 23:50:47 +0200")
Message-ID: <87y289h6ag.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] toolchain: improve conditions for gcc
 bug 99140
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=fe4e06d3176b01834fda92d25ae7ece65f3550e0
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Gcc bug 99140 has been fixed on gcc 8.x but reappeared on gcc 9.x while
 > it's been fixed on gcc 10.x+. So let's update
 > BR2_TOOLCHAIN_HAS_GCC_BUG_99140 accordingly.

 > Fixes:
 > http://autobuild.buildroot.net/results/c55/c55f50a8d657695f0d5492c32efa666254cd7f99/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
