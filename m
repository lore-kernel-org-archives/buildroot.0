Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848D9C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:17:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E8A1600D3
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E8A1600D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6228402F9;
	Tue, 17 Aug 2021 07:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AlCUKaKcAzvZ; Tue, 17 Aug 2021 07:17:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E1D40320;
	Tue, 17 Aug 2021 07:17:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 631261BF33E
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F7B880F4A
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qpF0lmN9hHTD for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 07:17:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F96080E1B
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 07:17:44 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id hs10so36792153ejc.0
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 00:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=0nBC/o+9Bqw4zm75PCVjBFcVeRWklFpcGDcK/7nUOAY=;
 b=mbuQ09gHMxOrrjfn9lyTfEMYdJm8HOsyQksY+43zeW/SBpyXkW/rlmRCXpteaGQhES
 3I9XHm9stmOk9vbO9TpPjXt0FuYg0dzM/gbBPA+gFtYHFlLHrZfvQgHQCsGrtco/CDRY
 +pOO9vEoJfw6NLRrbJwzldXulLB1sN/abYAM5Grjhy61vwC5zKc7mwHozT3E+Tbr9ODo
 muLCRzqcZdJNYSf1Z/Dy4nA5KBW4Xf6oqH66+EC4w8aVzCu8PFe+9h7qJ0/Mqm6lXtVB
 UinXcXUEt2X+CbMy4zEx6UiHqc/JVzNbg9ZzSGLcIJCGt0vF0Qdybyc9H0PJuvtFDczP
 Wlhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=0nBC/o+9Bqw4zm75PCVjBFcVeRWklFpcGDcK/7nUOAY=;
 b=EOyFQxfE0cUft5fpTsNN76RgZJCkvgho2v5U+zf2Pg/gOGwf/F/Lbr0UcVzIKNUHIM
 yFQrqYHyKJaAT3b20YW2mw4dQhZwg2CCYpQXimPFERrArP8czBPiiUjSME6f3jb+tfl7
 40igypaVBD82zCU5kYQkofdkNoPTmvlnkduQAZqJBlMvJpu20VF6rAlWKnrppIQOYPHt
 8J1uhAAgsrOy90OkKptiEocKCjIdr3KthoVh3bhohxEU+BUOinr+DuyZ7PxaL44UeE9m
 FDcOV/ZlBFAzXi7+YORne6L+hc5AulW1XTT2I1ADqZhYEPyHLN5qouU6P2faiyF3gMDn
 bJBA==
X-Gm-Message-State: AOAM531ZH9Ru9oiGWaugcUq46qntMDScf+non8steuOzp8mufKPffGNB
 uBTd5bin7ujTYvXXzVuTYbo6OwJrI+8=
X-Google-Smtp-Source: ABdhPJzQL0p7U7oU7AQKE0RHNPTbE+mr311LvCBinTWKEVMqUQWvw9RsII+gY4PcehGxBO+qRNDR1A==
X-Received: by 2002:a17:906:c043:: with SMTP id
 bm3mr2397521ejb.420.1629184663161; 
 Tue, 17 Aug 2021 00:17:43 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 be23sm579139edb.68.2021.08.17.00.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:17:41 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mFtLx-0002cQ-3n; Tue, 17 Aug 2021 09:17:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Kyle Harding via buildroot <buildroot@busybox.net>
References: <CAMgvH3qJwXkinSjkSVvRLvgvfrm4S_gvHXSTAo_AcpT-NrsgtA@mail.gmail.com>
Date: Tue, 17 Aug 2021 09:17:41 +0200
In-Reply-To: <CAMgvH3qJwXkinSjkSVvRLvgvfrm4S_gvHXSTAo_AcpT-NrsgtA@mail.gmail.com>
 (Kyle Harding via buildroot's message of "Mon, 16 Aug 2021 13:40:43
 -0400")
Message-ID: <878s107d62.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/unbound: update to release 1.13.2
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
Cc: Kyle Harding <kyle@balena.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Kyle" == Kyle Harding via buildroot <buildroot@busybox.net> writes:

 > The release contains a bugfix to fix the make install of the python
 > module after build changes introduced in this release RC1.

 > This release contains a number of bug fixes. There is a crash fix for
 > broken internal structures in stream reuse, that is used when many TCP
 > or TLS upstream connections are made. Also a number of features are added.

 > https://github.com/NLnetLabs/unbound/releases/tag/release-1.13.2

 > Signed-off-by: Kyle Harding <kyle@balena.io>

Committed, thanks. Your mailer had unfortunately badly scrambled the
patch, so I had to fix that up manually to be able to apply it.

Please verify (by sending a patch to yourself) that your mail setup does
not corrupt patches.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
