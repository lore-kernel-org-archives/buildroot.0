Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB320C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:37:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87499604AC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87499604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6678160B0C;
	Wed,  4 Aug 2021 20:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMINN94QgyGI; Wed,  4 Aug 2021 20:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 624D960B23;
	Wed,  4 Aug 2021 20:37:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6D11BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DDCF60A62
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6XGegS2sqox6 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:36:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3935608D0
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:36:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id u15so1920865wmj.1
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=DbPW+G0FGD+KNKau0lIp1dFn1j8GeHYob4KMbjQJXz0=;
 b=QmSe8RBWN4oE7bvsuCfIG8L0sjL6UQWd9ddWihJ4U4eCHP8Y7XN+9lTQOk7Vemngkd
 a8jjAfdIQ08CddIynDxLmi5iord6Te6deIWTp7imk46Ybg3cvTAJOOu+mPEnQISE5r2O
 AW9svbVNRpPi/tOWlRUb4pBStgOgs4H9tKszVF/deSDJfNa1n57CzbIb9POBeePGFpJt
 qVtTQf1IkppJT+rQaDwUnVJ70WTvpOYi4X+7AKja5D9z7/+ZyGSvo9AwmHzEC1TBta5W
 8U0xNreXTBumocRorG1TM0/DHlqt+8ADWVRNt/abKt2+aee0rjZ7oZjqgZrOtVj86qX0
 td0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=DbPW+G0FGD+KNKau0lIp1dFn1j8GeHYob4KMbjQJXz0=;
 b=rzVGXreIL0LVcPHum4ootSFc95DKeJz9Tq+wYKvJ5P0gHnSlLa++eHFB9Zcz4hEAWK
 lAg6Dax81CDpMNNwsOhTYfolS0bn6wY7IIMHdntaVZUM7hh92tT1uHZlN2sT5t51KbkQ
 O1yP2R28oEZpSPeE2pax3yEhtad1e35lFr8stHejIu6T0QoLf9REj7wo39pZprZwlf5K
 c8FYOtscEJNFvWeRgx4TRhkDrtUiCe++6BipRf+hADzX2Hc+qXoeNNmJgikN6YxOPbKQ
 YzwKY3m2VbuywvNVqxcj8J6cbxgwRygARG/k98Z2AbouKdKfhE7Unagrf7ZzwbYeLrHd
 hhRQ==
X-Gm-Message-State: AOAM532yjVq0fVb4jVt2TFPiwNGya6b6xq8YMGO8o9eIyCEJ928IRx1K
 HByb9gqkiZGVTIRcBuo2QkrwTNx8hSY=
X-Google-Smtp-Source: ABdhPJwYpLyZ7gp6xX0IobT+BuWOSji4s8FkRQDpBnzaxme5BNTd7r8yC+pvOyN6XLPYt/YQYpwtlQ==
X-Received: by 2002:a05:600c:293:: with SMTP id
 19mr1232446wmk.179.1628109376729; 
 Wed, 04 Aug 2021 13:36:16 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id q7sm3284134wmq.33.2021.08.04.13.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:36:15 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBNcd-0007hW-2v; Wed, 04 Aug 2021 22:36:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210724122122.634455-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 22:36:15 +0200
In-Reply-To: <20210724122122.634455-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 24 Jul 2021 14:21:22 +0200")
Message-ID: <871r79ne0w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mono: needs host-python3
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > host-python3 is needed to avoid the following build failure since bump
 > to version 6.12.0.90 in commit 4be06fa8aa054e59d97866dc5568f4e10762e353
 > and
 > https://github.com/mono/mono/commit/0f47ea5d8088ede472650da47bf58e5a0e063ad4:

 > checking for a Python interpreter with version >= 3.2... none
 > configure: error: no suitable Python interpreter found

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6a185e69fe8e123ba26c26b69091d001656693c7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
