Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2856C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:43:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B276101B
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39B276101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0612F40439;
	Sun, 12 Sep 2021 18:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nEpf-6COs_6m; Sun, 12 Sep 2021 18:43:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7558C40426;
	Sun, 12 Sep 2021 18:43:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B944B1BF40E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3313818DC
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_kfm-wYkojC for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 18:43:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD3FF80F8A
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 18:43:16 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id b10so9324195ejg.11
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 11:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=27MDpdF0JSp2232yJTcqFG9M9GIRBCbcqSU7Sz85myg=;
 b=cmbp7q2WComOPd5wOVLcegNZhkPY0EQveWn5kB3NGLFdRYBIWeXGpLNaRZl7ySo854
 K5zcw41QHu2HBXnSyi86VQ4uesEv+PDiAia843j8oE4LwM0duFne7ZuL7KzaO/SGMPNU
 cRA3YMHyVDwlEED/5DpKuFIldMTSpyAYAdPepiT5+qc+NzCyTCKBhdAxojK0urG9koA2
 Fm9RrPSKfy/IuwegJHLN1yfnUIeroi7TneqZ8gW0WWdeRr5bNE+VAhGp9HwQyE39KeEV
 JPD5AaatB0wB+5xvaqOR7g0k/7vSqV4YspdftHr4Wb5DYSD8HzXULM3qZwMGSF+fPAek
 a6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=27MDpdF0JSp2232yJTcqFG9M9GIRBCbcqSU7Sz85myg=;
 b=PKvAAyN8yz3SCjJVWExQxiiXZy/BO7aJ2jWzXZVGh6yXb1TACremLupVIOe6clxGSF
 KACNiGFkvQuIjw3SiHu4Nx81a6CFVi/bg5+22tulUCI3od+RqYfGf2ntmttzfk547/gh
 MgbLGVbKWiPZPg3BGWM0ufpFxcmRy8OhfVqHbpmAwlhJZZSYrG4MjA/xv5+xAjkDBmue
 sDUAvuSABZRyYSxsVV78/b6D630qnk7tf++VeprS299Q29WtkmNLQurWFsKbbZlfy8al
 jdgJZ7Ko0aHvuuiBkirggbck9VaCHzuYXXgogEJhse1SoUH4wfZW9HRzLXZs62ttzCrF
 M2Aw==
X-Gm-Message-State: AOAM533/KzBVMvpRvra94r3qN9spbk1YG9xPOW/U/bSj1Bpq+5v0R+2D
 +BCzJ6L3/WUZhOoiU+Yo/Hw=
X-Google-Smtp-Source: ABdhPJzwjQKKy/aDVmOnovD0TfDH9mc/5Fqe1aVP26Ee1MQ8NZ0jblPcbFcR5Iujrx2lRC5IDK1Qhg==
X-Received: by 2002:a17:906:fa05:: with SMTP id
 lo5mr8244159ejb.204.1631472195141; 
 Sun, 12 Sep 2021 11:43:15 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 dj8sm1549483edb.53.2021.09.12.11.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 11:43:14 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPURd-0001EB-Um; Sun, 12 Sep 2021 20:43:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210910065532.31730-1-bernd.kuhls@t-online.de>
 <20210910065532.31730-2-bernd.kuhls@t-online.de>
Date: Sun, 12 Sep 2021 20:43:13 +0200
In-Reply-To: <20210910065532.31730-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 10 Sep 2021 08:55:29 +0200")
Message-ID: <87pmtd4ou6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/5] package/x11r7/xlib_libXft: bump version
 to 2.3.4
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://lists.x.org/archives/xorg-announce/2021-August/003104.html

 > Removed md5 and sha1 hashes, reformatted hashes, updated _SITE.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
