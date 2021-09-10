Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A4EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 09:59:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3607361026
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 09:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3607361026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E22B40531;
	Fri, 10 Sep 2021 09:59:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7hJ6VGd4PcR; Fri, 10 Sep 2021 09:59:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5905F404F6;
	Fri, 10 Sep 2021 09:59:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94BB01BF2AE
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 09:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82BFF405F4
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 09:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XDiJQLl9qmlm for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 09:59:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85D5D40131
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 09:59:31 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id kt8so3058910ejb.13
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 02:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=HPw65x++Vvd5ZhmAKqxhg81PLtOMLEke/f5AtbLaMFI=;
 b=dg8bzr7Hi11Ru/3fCQs5EM9mv40khHaJIv0py6EVW7oANuMzeF9gDIe6Dk4ca4rkv+
 +MZgkWtVaaLx1lJ1YThyfva+GoUuiAXlyv2JoITPnb3FSITt8I0HbGtZKS40nYs1z0Pl
 JBQfBggCn0qKTYAPB2cS7i5aprDaPnXxUKtaPXh66skmt+Y2PP+GXjJ7epwyA04bEuuh
 pZGwuN/mkgLtIzfxhSyq67+cKhNa1QLoD4VF4kB+zvFxlXb7R+DyhBbBIfTwFHIbvo3y
 eaxDBgr2+vq2RSh1D+uI6cqUsmF+GHQrgrgIrNgyslZZLW1SJRAphGvImLA4kSHp81Xc
 NhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=HPw65x++Vvd5ZhmAKqxhg81PLtOMLEke/f5AtbLaMFI=;
 b=0QBfjr6cj85EiWBIF4qsyabGm4ss1g1vb/8GeFLMfqdvMdbwLFzs0HdD9X7BiL10dR
 KenFuSzjuwje0BKN6rczhE+7PMNtV10IzSMc16NaxUHBhPZlhA1jqz91C+/0Fb9lvpWk
 7tmdsp18gpHMz3NRLCDJY6Cssk9sVRfcui3Wer0R3hG86h6uIyXl9Np88RrOv0dhrR5/
 CflFN0xq9lYDnPXYQZPZxDMLlB7kVf5+VA8NScqR1+fKvdZnsGG14BUiSkQ70a47bCsX
 4/I1e67hkhG3dCVH89NRbTf87YjpgzDtBR4MEnMmAhBq5fOfBSZ2FBnqS54v7iNsEYdG
 YmIg==
X-Gm-Message-State: AOAM532uu60LEZOGExFisQa5jjCo1I0zjwB0mc0+/HIYDaM2ZRNJlulf
 5oYtPhwlPFwF9Uv0VmWySP9xtgVbWTg=
X-Google-Smtp-Source: ABdhPJxgxoWdL9q9cJCdDVVhefZbfGDo5czZT81axUE4Xq7vAw0bQd2H3yRZhLpRnSod5C5g4hp6oA==
X-Received: by 2002:a17:906:38db:: with SMTP id
 r27mr8554411ejd.338.1631267969806; 
 Fri, 10 Sep 2021 02:59:29 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 o21sm2406967edc.47.2021.09.10.02.59.29 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 02:59:29 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mOdJg-0005w2-KU
 for buildroot@buildroot.org; Fri, 10 Sep 2021 11:59:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210903150715.425E2881ED@busybox.osuosl.org>
Date: Fri, 10 Sep 2021 11:59:28 +0200
In-Reply-To: <20210903150715.425E2881ED@busybox.osuosl.org> (Peter Korsgaard's
 message of "Fri, 3 Sep 2021 17:07:03 +0200")
Message-ID: <87czpgbvjz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/openmpi: fix fortran build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=fc7eaf3bee861a0e211f7382487e36466c6f6550
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fix the following build failure with fortran raised since bump to
 > version 4.0.0 in commit 366e7f1ecb4343ef8b18aef2a11c49055cc89abe and
 > https://github.com/open-mpi/ompi/commit/99730f798b7aef4c87d282aa24b98916fea45bb6:

 > checking size of Fortran type(test_mpi_handle)... (cached) 4
 > checking alignment of Fortran type(test_mpi_handle)... configure:
 > error: Can not determine alignment of type(test_mpi_handle) when
 > cross-compiling

 > Fixes:
 >  - http://autobuild.buildroot.org/results/86ffde2f67ffc0bfaeebe72fe742a5c241bc580b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
