Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD49C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:27:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9DEF60238
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9DEF60238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84581402AD;
	Wed,  4 Aug 2021 20:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zUrDUGK10fb6; Wed,  4 Aug 2021 20:27:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B91E40203;
	Wed,  4 Aug 2021 20:27:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 601B01BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DFD4406AF
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABOF82YIakWf for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:27:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 732AF4068D
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:27:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id k4so1906190wms.3
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=qeU1d6swEKKebu7gHwUTtWFFMGH3wYVKTn0MoQ4l5jA=;
 b=chuyfvzDHQsnoVTGDq0dm77qI6HJ6maL4jYKvcB2dkOct8/iNWm5OJEh1N0Lw79crh
 Dfv+tR/IR9GYP9L2k1R8Y4easiW8l/zO4Gfzshq9Ocj6Q+TV2m9xVnD00wx+mOfpZQO1
 76x/0yN/7DlqQgyzauU8+cIqF+03RTNXd5RRdH2Nqb513+5jkw0PdqliuM166pssAJfx
 33bxVOFtLxrgHn5MiFMBCT4x5lIi38I+NRGmvv9/b6q9KD0XZSJMfi3qgTsvTOutr0H8
 XvX9xFaxANxwYvhQMWf8WCQhz3svApvPxZj67ZU1prGEkMusUiKp3BSAkAYHXK1b2vvm
 X9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=qeU1d6swEKKebu7gHwUTtWFFMGH3wYVKTn0MoQ4l5jA=;
 b=VwH58hP9UgDtSl53wsdRB42GKsqt37S5qpzkMyXa/34Jx2TTm+tGKU36i1t+BqvO6i
 ilstQgxV3Ok2UWlBF//4gCIByRECdprExNP7h5m64pt3ripK+08d73j4c9BN0IrLsBzh
 Xt6m7Gikg0ipGpZbX7Wdq2J44/CBiCXW24NhFiKLVOBu3lOWSy2Ohg2N8BynKh5CxnHE
 f44wGdP75g5VED7y5jBrUM0DBxpL6NYNTfcMZUYpb9NWZbXO+w3AdMF5GGGCTxal8SYA
 nn4xoDsoxd7XBKoWSe+3VTS5Dr4XS2OJTj5LVYY47/f30Zi1ckmyRqAz1w/zkKKQ6+PV
 2zoA==
X-Gm-Message-State: AOAM5325QpG4AfpuptZXAlwUN/Eml6qYbKK4BYNwTMeqXFM0OvZrUUfl
 QwzuFRTNDE9YYroDBdHIArw=
X-Google-Smtp-Source: ABdhPJyE5LUR0ZJF7XJnXq7CSh6Ji1haeb2ca2eUBKVp67OKYtngy5hjwBQ3w3VEQJ25ooxxKDHosA==
X-Received: by 2002:a1c:c918:: with SMTP id f24mr1257462wmb.88.1628108841571; 
 Wed, 04 Aug 2021 13:27:21 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id c12sm3980506wrm.29.2021.08.04.13.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:27:19 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBNTz-0007Tp-2b; Wed, 04 Aug 2021 22:27:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20210608194926.14477-1-ps.report@gmx.net>
Date: Wed, 04 Aug 2021 22:27:19 +0200
In-Reply-To: <20210608194926.14477-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 8 Jun 2021 21:49:25 +0200")
Message-ID: <87a6lxnefs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/2] package/libinput: bump version to
 1.17.3
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

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > For details see [1].
 > [1] https://lists.freedesktop.org/archives/wayland-devel/2021-May/041834.html

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
