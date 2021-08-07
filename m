Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F7D8C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:56:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67CE560E53
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67CE560E53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2653F403BF;
	Sat,  7 Aug 2021 17:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HYpknGUK7iU5; Sat,  7 Aug 2021 17:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA22F403CA;
	Sat,  7 Aug 2021 17:56:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 858C61BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81E75605AC
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGkj8Dj4yNFf for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:56:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D59C260597
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:56:16 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qk33so21123878ejc.12
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 10:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=8wRm/vz2Gn4IH/Q84Wq8sWio2lJZwt80p7eiC4rRnlw=;
 b=CgTCs+t00J3hJn0AFBrqFi7mQDZ7HrbpYigpYU8zYlaJv1TPi6WSEA1N609gQYT1vW
 KATKtocAYWoJ8ECesuW+CrDPbGzr+JdqbSGsFjO5v8AAS9Hy8EqU4KtuIiWF4cksVcb4
 eFPIMolpv2kMQskR1dttYejxcJYXlyAQxjAxuYpSupA9FI99EVhjBVgCsqzJs/PGp1e+
 /WOeE+CQBwKI0PjKkpcRBrD7xvc90yc5dmKaDMQdlWJ+AEWqDv7mznzsqq2kIJa2v4uc
 IWRcxa25kUcQpTKVTkwdNhC1d2oqW7kn6ce5isCOlY23aHe3u2QudKZ9bZwZdoQ85vxu
 pHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=8wRm/vz2Gn4IH/Q84Wq8sWio2lJZwt80p7eiC4rRnlw=;
 b=So9qg3DNmEJHoxtCIAggTm1IC0YY++9kFQYRcaSoBZE9igHrp4u9MPMZLooBz8BhQa
 ecKFpocLxvNA16hdVWe8Dt6hYDHrRGKDiEhr5VndukFGMhRUlmaTa5pdL26fJC2Xp6S2
 n+aLa0Dq7mjxqhOljsRGbKUQdyhfZOm3sCyMX9cMLPGDuO58bpWQ6UXY3ZxCjvM5brGI
 KKxC11T/HWSx1DKYc4T0ax/3eaBu6f5SjOxhIY2mwuCGmy2PixApnh64qW0k9g8OEMGA
 fqrxigEVr95cXobFObLRduwDD+yEtQ3gPRCV4hmODz9180BRWCnEVaB+t4ltQ4uTyu8r
 ohYg==
X-Gm-Message-State: AOAM533dyZsbM5h+WtFJmIVITu6bqmHCOmX443+xzPs0JEGPIYc2Nh0C
 wHfW+U71Aq7D5P48SyouVTQ=
X-Google-Smtp-Source: ABdhPJx/j9pg7DZ2KPWeiAgr05fMuiY7xojtxcDlPgSSQdh4nmyLVsVZHEJu5HPEeUrp6go23Fcklw==
X-Received: by 2002:a17:906:444:: with SMTP id
 e4mr1658399eja.255.1628358974885; 
 Sat, 07 Aug 2021 10:56:14 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id n16sm5407829edt.31.2021.08.07.10.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 10:56:14 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCQYP-0004IU-Ov; Sat, 07 Aug 2021 19:56:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210801080928.2630353-1-fontaine.fabrice@gmail.com>
Date: Sat, 07 Aug 2021 19:56:13 +0200
In-Reply-To: <20210801080928.2630353-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Aug 2021 10:09:28 +0200")
Message-ID: <877dgxf8aq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ibrdtnd: fix build with gcc 11
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
