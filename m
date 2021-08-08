Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90208C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:31:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 422D260C41
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 422D260C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAE774037A;
	Sun,  8 Aug 2021 09:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Ixc2qYhuqTq; Sun,  8 Aug 2021 09:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61064402FD;
	Sun,  8 Aug 2021 09:31:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60E961BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 509CC606E0
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TnW9cprIflW7 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:31:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9A04606C4
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:31:35 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b7so20007621edu.3
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 02:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=8wRm/vz2Gn4IH/Q84Wq8sWio2lJZwt80p7eiC4rRnlw=;
 b=N/0Y5LyQBgduC7Oo5sf61iulSCyi5akCkAL4uTsqBvLvcYVlnf87FKj9tcl6hpmSDO
 M8hVbBWJpBp8I4JXJ+k2olEfTE8qp9wPwpHGgX9lNudVH/3bMNuVyWqo1cKYyEILmKde
 Vrp4wlm+xyI7v3Tyh1U5LdNVhL+t+rNK/PcMpDJ4wiL62LApUBZ1kQMmkbOJqVo9BQgT
 OKPb1Jx1Gk8aKF/ZUbbrQZyoNqkhGp9N1/DA1DdNBSp9Z4QmKLN85n51aWVtpQhsB5X8
 UvXyXTTOAGZ9Ts4Teiiz0YwE2JIPJfsOeGGY+MU6tOmp6m+IGpTKcXXrOk2Ju9c5zMWA
 UeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=8wRm/vz2Gn4IH/Q84Wq8sWio2lJZwt80p7eiC4rRnlw=;
 b=Hta/8dx2mBaK4q2z2e7atD/ucyXKm/IyXqNRGxODGuKWIc8QKamjJSn+WQfgageQvm
 jAYvVvP3Abh8WtLreP/OzWf50AHIQc40pgmP/k8P/k+OwkCEU1drXjfrkrwVeKN6PlSW
 rg1+BMcQyW0PnJIX1bAwauT1kW6TXd/z3K9J96uxBw/3sbMYJ34ZHdWhQmCVzcIPFJag
 jT/PvpNKtC4jk7Ay3UDVKNeS5wkY3BcfFOUNM43NGP5MqwIXqvf62vor2I+3NPnLoi/P
 7UdyqJfrxGj76PKiLyyeWFRR3E8/MVErYo2z/+mdD7l0Na2A0UdJ2HraavbxpvaVV3a4
 U0qw==
X-Gm-Message-State: AOAM532WWcD6wEVU5LtnY9Tw5Ia792crMVPQokRMdNkH4kSaFl3tXE+8
 f0E3vlD122oVhKRBhnZ/hT2lfbaKRopSSw==
X-Google-Smtp-Source: ABdhPJzaeam5WLhxRZ9LmQQ6u2YQ5+kLSA73twsQ5AOByl2lGhuSVN4CP0SHbFOPJG6zkcogURZWhw==
X-Received: by 2002:aa7:dc49:: with SMTP id g9mr22803714edu.301.1628415093885; 
 Sun, 08 Aug 2021 02:31:33 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id w6sm6495875edq.58.2021.08.08.02.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 02:31:33 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCf9Y-0002xo-Qj; Sun, 08 Aug 2021 11:31:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210803135447.32589-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 Aug 2021 11:31:32 +0200
In-Reply-To: <20210803135447.32589-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 3 Aug 2021 15:54:47 +0200")
Message-ID: <875ywgcmff.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libodb-boost: fix build with
 gcc 11
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - No autobuilder failures yet

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
