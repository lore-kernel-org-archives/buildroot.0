Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346EAC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:59:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF423610CC
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF423610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7521A403A0;
	Thu,  5 Aug 2021 10:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TZyAtoFerz7a; Thu,  5 Aug 2021 10:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DFFC403B2;
	Thu,  5 Aug 2021 10:59:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95A251BF852
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AE5E40336
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qhl5PvMoR9GH for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 10:59:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E42C40417
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 10:59:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id n12so5969795wrr.2
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=J+/tVFDZahIwzLUkrsVGOuCNNB9WWjQ9FE4Llf0lLec=;
 b=l5u6mlU5zoOMF2T1zJpHuspsy30Vq0xOq9tWL0ROsLGBQGGBnYO0rkZujlSIaxI81u
 lr5oxYywVEF+AgaAgDq470lacPmIUyOajczsAM41LhQv7IC2BIzmxSPXyyOWBn9Zvnju
 Ia1/KV7oPU5QNvJRdW2SbMf5Us67fs19bItbN1bAy5AqEHk14kz3GSF9Hx9uV9tBABW6
 VXmg/b3koWGuMBdEtUd3GSdc1pk6JsPMLqEWHkXMqvQpmoyEEt976KyWXThJEb4fPNTc
 hGSmcIFvRbmbqFVjFDVN5QTHinhyxndtrdRQtgGiGq8Q+NmXm/yD21ESRB11yknfjNfb
 W6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=J+/tVFDZahIwzLUkrsVGOuCNNB9WWjQ9FE4Llf0lLec=;
 b=Z3zhiW+PNHkNvs2sehvqLPfj0kA4ROnLMUmb069UhhF0a0nV/TQfFNkgiFlPlM4a2l
 i97qsolPSW8gruGbZIx3aqIQYgLZfps8pHrAA8/2jnNFwxYst1SV8AlB9+fkhNfx5F68
 Tqtt88q+OcbR0Zur810StflMG8Ydp0KEo8ouE/4gjA1PeSlSMorUYjuGeCwi7pmRNdOn
 6YkwYXn1hdb+ugBRGEyO77eSvS11cOtUdkEum5klNu7in6l/FXdXfGLqt3+i/v61jVCp
 mEOr8wKRr5zaf5mV8kvlYo+5GTkfNSkyXYwFptIwfobeYBkUok2HnWCRJm+GTKT3bFj1
 s8tQ==
X-Gm-Message-State: AOAM530Tv/E8DMMlDkWbJNKNyjGLeEdq7aSCJlnHaEl4rnMBsTXuGCFG
 2qmMvr7a0v8Ig4rp86XVIEg=
X-Google-Smtp-Source: ABdhPJzaFEjg2JRIibBT7rYPA4zM0TXZtjXslWcH6rsNzOcYDpP9+WccpKWIWQK7GEQTJIhBi7Mdkw==
X-Received: by 2002:a5d:44c8:: with SMTP id z8mr4541754wrr.291.1628161151398; 
 Thu, 05 Aug 2021 03:59:11 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id j5sm5563268wrs.22.2021.08.05.03.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:59:10 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBb5i-0000eX-4Q; Thu, 05 Aug 2021 12:59:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210725131350.DDB3B8636F@busybox.osuosl.org>
Date: Thu, 05 Aug 2021 12:59:10 +0200
In-Reply-To: <20210725131350.DDB3B8636F@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 25 Jul 2021 15:48:13 +0200")
Message-ID: <87czqskvi9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] Config.in: disable PIC/PIE for
 microblaze
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=d120f844604da2295bb7bd8fc6c1f4efbe8b5792
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > As reported by Toolchain-builder project [1], the system doesn't
 > boot when PIC/PIE is enabled for glibc based toolchain (the init
 > process hang).

 > Also, hardening features may not be wanted or possible for such
 > slow soft-core cpus [2].

 > Like for NiosII, disable BR2_PIC_PIE.

 > [1] https://gitlab.com/bootlin/toolchains-builder/-/pipelines/318038406
 > [2] http://lists.busybox.net/pipermail/buildroot/2021-June/312416.html

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
