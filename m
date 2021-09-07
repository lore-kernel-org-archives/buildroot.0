Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D558C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:35:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1657610C7
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1657610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C63B40294;
	Tue,  7 Sep 2021 06:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p83a7ULNLJzv; Tue,  7 Sep 2021 06:35:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8619D404BD;
	Tue,  7 Sep 2021 06:35:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 524111BF2A5
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FBEA40294
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cFYSatpYzuSM for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 06:35:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21EEB4028E
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 06:35:11 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g22so12374871edy.12
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 23:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=LlWwkWmrfLYl9xHMnXq/uc6FSAvC+bCvhQwtfB+zr1c=;
 b=IqLvrxuYjADMCvK70C7Lu7LJmYx6xdgZ4QwGgHqdAP08fkKkyBHsGYzGQRlrWQYcL8
 JcqawMKNWnDun0ZzWoPJT+XmB+7QwTqF++dWJcRIDfG08U5PDpzFGfseqmgAc1Fum4nl
 zIZwTxefgeEfj96ikuxLMEZpJugn26VeB9kkzENLbcVgDbpyGVKl/1yXAHYfLbvl3Uun
 ea0iC5zO4oSw2b4DqoT5fFYZB4d0pUAlIbwTYnN6HMCiPQd/De4ANyV0CWmJDjql984x
 7Hbuz1FaoVkrC5eTswy2fBsHoxp4MG9ohTeIjyeN65wATz8sF+JNv1MpzYHBmtNPrwbH
 Zu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=LlWwkWmrfLYl9xHMnXq/uc6FSAvC+bCvhQwtfB+zr1c=;
 b=Q1mAzaKm8kFXHcctFVKwUzlDkePmiLlxJaR8BUYUq2McmKF14foBKDZnar9xeYz2Sf
 Eras6xJ44HeR08ZP+4ovu+XiExN/ZB92uDB4dV3ggpIb3YbPGRHsF01/bN2i18uRovJh
 mLKzxSLWZOM9LErzaOCl7ycBvzh3p2KJ1Vzt3/NjdbKhauwmIIFT7w6kZTYQ26ZNUMge
 DDUpnKhQPF2KcjgjAFzy47QY1s20kZkRK5B9GgiBrkbuAxzCRO5PHXkXQyH/gXAy31WM
 lgQ9LcZuPnUzDVOkOqsT3Hi7/QigBgBeGoVwnYJzuuC9sdhfFF1OYKAFy0F8U7cLC7Zq
 YbmQ==
X-Gm-Message-State: AOAM530qfA8SLJLcRKcHWv7sE1Q/hvPJNZud6/+DHHo+i7nLgRPv6UxS
 A75IqY+F2EKObNmL2qvZwQ0=
X-Google-Smtp-Source: ABdhPJyQjNCIGsATWHuH1vJnrD6ZrNKEWT8cwc2wLt38p0B22HpDbWsKwszlgsGbkeSeXcjya6HsqQ==
X-Received: by 2002:a05:6402:455:: with SMTP id
 p21mr16958843edw.309.1630996509395; 
 Mon, 06 Sep 2021 23:35:09 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 j22sm5035993ejt.11.2021.09.06.23.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 23:35:08 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNUhI-0001MS-4h; Tue, 07 Sep 2021 08:35:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210822093428.2018189-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 Sep 2021 08:35:08 +0200
In-Reply-To: <20210822093428.2018189-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 22 Aug 2021 11:34:28 +0200")
Message-ID: <87lf48hp0j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-pam: add libxcrypt
 optional dependency
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add libxcrypt optional dependency and fix the following build failure
 > with libxcrypt and uclibc-ng raised since the addition of libxcrypt in
 > commit 464bbe26ff5fb9e5bfe26a26ea65c700b90598f5:

 > /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: unix_chkpwd-passverify.o: in function `verify_pwd_hash':
 > passverify.c:(.text+0xab4): undefined reference to `crypt_checksalt'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/65d68b7c9c7de1c7cb0f941ff9982f93a49a56f8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
