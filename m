Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DE3C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 07:05:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAB3861101
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 07:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAB3861101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74EA640270;
	Thu,  9 Sep 2021 07:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZdtuCqBH9dh; Thu,  9 Sep 2021 07:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE0C14025F;
	Thu,  9 Sep 2021 07:05:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A14331BF8A8
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 07:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D8F182E95
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 07:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Rfxeof43BU8 for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 07:05:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0670182E4C
 for <buildroot@busybox.net>; Thu,  9 Sep 2021 07:05:34 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id g22so1228261edy.12
 for <buildroot@busybox.net>; Thu, 09 Sep 2021 00:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=L4UpwTZ1wEget1LHDVlPdhUneF6D6ixVekiTMmOe9Us=;
 b=XG5XWnK+4fV1cTkSrYpxJ0n6TvW0MreKnoyeMMQZKYTlk36hVr339rZk4fJDCsqb6/
 mOwmSGA2Rgjm1nvMTT54xaBHzOpKjTvMl173bwYRl/GiSF2nSnb2eJJD4fSGW6emkMoM
 Fzixa4NTg90POmuhnMVAa4Dc61FK2J6SCdB53SD1W7BlYZBLMFnv+SLT1JGLkErF15HB
 g0H5fMDa7b7V+TFm5OlwaY85PZEi6O5KvHJcO9fF+IsxJMzvbucH18gFImIbeWbwKGmY
 fxoMwgal5ATAc9Oq9Ih6K8G2k6SHzHsJc61m8SdFmMaGFtcx7tHxSzVD4sjlVdx7aQ+8
 4Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=L4UpwTZ1wEget1LHDVlPdhUneF6D6ixVekiTMmOe9Us=;
 b=DUr50Z5LfRrD0HXtOuxKwUmKNBiDClATa0UAoYV1RAqeD0fCzYsdGyaJ0dz6ZwbtEl
 WX+8toetW9VcPBmWgGFca7Jb8F8OrokIEKFjC+8Pjr78mGWFNtq4E4gEIcJ7kgSQufya
 D1vxgRYOzgTWbHomKb2bflNb7RY8usSaF0LyP5vOx5lzwg65MHYxKiTRkyofZhDo1PD7
 uWL6y8SbsBxCF9rNsOXvfee+q78vz1Yxv6tXqXAXFWuZCPPaFIpBclnzGgQm5AZb3rnN
 2SyJ4aeiaWTEkKwOKkJ5NygEh6ZzVD284xWOZlnT17bSZAuN5mgmTAEfq4W25Q410thl
 hEBg==
X-Gm-Message-State: AOAM533Tm2J0CS2cWUM06MhTTiB0U7GI0EQAfE7lwsLBj8MJwYcsYSNg
 GgRbqO/pq8PS6JXpOLdrq6k=
X-Google-Smtp-Source: ABdhPJxz+ntL6nlLyg2NM6x3Q9vPizW99Wif/+T/ur3f+eHqw4wAuCRrogMgUjSSm0jQ2YVoa9j5XQ==
X-Received: by 2002:a05:6402:152:: with SMTP id
 s18mr1626614edu.221.1631171133036; 
 Thu, 09 Sep 2021 00:05:33 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 cn16sm489668edb.87.2021.09.09.00.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 00:05:32 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOE7m-0007QV-Rc; Thu, 09 Sep 2021 09:05:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20210817142420.32435-1-mf@go-sys.de>
 <878s09kbnn.fsf@dell.be.48ers.dk> <87bl52l6vu.fsf@tarshish>
Date: Thu, 09 Sep 2021 09:05:30 +0200
In-Reply-To: <87bl52l6vu.fsf@tarshish> (Baruch Siach's message of "Thu, 09 Sep
 2021 07:16:14 +0300")
Message-ID: <875yvacjph.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: bump version 10.x to 10.2
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
Cc: Michael Fischer <mf@go-sys.de>, buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Mon, Sep 06 2021, Peter Korsgaard wrote:
 >>>>>>> "Michael" == Michael Fischer <mf@go-sys.de> writes:
 >> 
 >> > Signed-off-by: Michael Fischer <mf@go-sys.de>
 >> 
 >> Committed to 2021.02.x and 2021.05.x, thanks.

 > Not in 2021.05.x as of commit cb797087e95eb9 ("package/fetchmail: bump
 > version to 6.4.21").

Ups - Fixed, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
