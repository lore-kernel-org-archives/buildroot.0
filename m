Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F82C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:03:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45EFE60720
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45EFE60720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 116E482CD3;
	Fri, 30 Jul 2021 14:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bKku6s_UPULG; Fri, 30 Jul 2021 14:03:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF81282564;
	Fri, 30 Jul 2021 14:03:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3AFE1BF4E5
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B07FA82564
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AN_qdW0BNvse for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 14:03:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94C0482423
 for <buildroot@busybox.net>; Fri, 30 Jul 2021 14:03:33 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id nd39so17028570ejc.5
 for <buildroot@busybox.net>; Fri, 30 Jul 2021 07:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=nll9jKyAa7AAINvMFceoRVA01OTDFHmkZ3zxNPRdZQI=;
 b=tZOiHiIvLuxgYXzMPueeD5vteVoiJ3ZBtwcGFaLLJwAuUaGdRKhOh3gWL6J/5j3lH1
 g9rjHqw8pqXkUT3+jfx77CgC8raYTpIql+45furff8h/LRYF2VvsHVtszZtPnQukAG5N
 8RnwOgXt64CH+rhoYuL9xeVaeo46XxkkIsMrjv/ENK5LdfYCp+yHwXd8WRZS7qKXsN+s
 brK4n3oH9J+DkO2+gEZqbGOLe05+6Qa8rBmPXqwV58c1BplhokUzNgdENzLD4zUHw2n2
 Zyb3tqddWxdSNFohVvBih1QesLKJ372Lt20+oYEnvGE16Ok2TX2FtyWnC/6ryHMyERZb
 LG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=nll9jKyAa7AAINvMFceoRVA01OTDFHmkZ3zxNPRdZQI=;
 b=mMN4ltuxXGcNbSYXlOGYvfs/afKrUlvoWSInm2ewA5+EvdChrckgJ1oOs4g9UFX+xj
 pbK+wr5xFoTz5SobwHaBgiv7UhHaIT2yv5AFDpAFXc2pGmtqpa/TtUR9BjF3NJX5rZK+
 QjltUOxDENHN9iOHpdmkdI/0mQGWteSqYTerkQUUisaK2KScxbcW5WJPoKqrypKin5w1
 RpdQ3uerfjYJ7tjmmA2mhWWLlfmKgDhnQRhlOj1HoGClOOjVE7Qqmbxj/s52z36GWn2K
 H+dw493GF1YDW2o6nB5gn7WD5yh4DVe5BbaDPW3h4siLYioLFd9nWa6ATbR0eITr62eL
 1v7w==
X-Gm-Message-State: AOAM533xXoxMuWOMXdYDEA79GwrzBcIFUzUcAkYMMShwT9IZUfvncNTe
 VX1H47VWE0yrZgKLasv0wGw7lAD5+Do=
X-Google-Smtp-Source: ABdhPJxGwswi7sVtCiGdu6g1v3hYUACabslsOv9XHjKZePBz5/04TtdbbmQYV5KUs9fZdjCH6f8Kmw==
X-Received: by 2002:a17:906:bc81:: with SMTP id
 lv1mr2746802ejb.413.1627653811667; 
 Fri, 30 Jul 2021 07:03:31 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 q8sm720710edd.43.2021.07.30.07.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 07:03:31 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1m9T6o-0002PE-Ef; Fri, 30 Jul 2021 16:03:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20210713135354.1196171-1-francois.perrad@gadz.org>
Date: Fri, 30 Jul 2021 16:03:30 +0200
In-Reply-To: <20210713135354.1196171-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Tue, 13 Jul 2021 15:53:54 +0200")
Message-ID: <87pmuzzyod.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pango: bump to version 1.48.7
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed to 2021.02.x and 2021.05.x given the fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
