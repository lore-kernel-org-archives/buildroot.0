Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76FAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 09:59:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 688FA61153
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 09:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 688FA61153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A17382881;
	Fri, 10 Sep 2021 09:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nmMi6jt7oCMI; Fri, 10 Sep 2021 09:59:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BEA982735;
	Fri, 10 Sep 2021 09:59:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3D801BF2AE
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 09:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 927C2825C3
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 09:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jY-pdl8cmrfw for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 09:59:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDD1782735
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 09:59:18 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id q3so1679916edt.5
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=cpoA1CG9Xj2OWqPiELX2ZnbVax7ArAr/nYg49SPAL9U=;
 b=SxUiJLwUGa8iyvtE6wSHZbPIIftx3yUQuVs+XD6Bn/Mczu12TkBJS9e0g/ktvhddSm
 4spHYZw8HaIpLwJoCUzq86Dr3+086zkhTXiI1UNglpTi9qUEXMvis56vQstSjlVEnh6h
 ZQ0Ba5fk0AokXZyxEJyEZI64yz2/zC1FmzHRzkBsrcMEhM3qCpCD3vk75V32yZ8w7w8b
 YxohMUduz45rWFUkFFVrfi5oQiCGY3Uy8cv/7PaMWd6vMoiTEfY09EOgfeigfO1hou6X
 1SJETirGclQ67XyzdkmwVv3so/Vb0zncwZujSHcByODszlynbVlkwyqFizlaWkuu1vH4
 gbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=cpoA1CG9Xj2OWqPiELX2ZnbVax7ArAr/nYg49SPAL9U=;
 b=p24lsPtAtac3b33fKKAjWTIIJO5NZt7LaYECTZtHqo8WQN4xorghFctEzY15gum8mu
 CIGhheEXTyUWbgnoL6TufQhdgBoA34XfCXCLq9CRg3EWjnYsu4pjk/NARUy0LMdBQ40F
 PlbQtLGagZCGx0n+YYAIi1etUnWHARGeHrdeNlSq6tDFE9Q71L81J1Dg8vaI+DSHTlgF
 sE10KdGw77reYbgVqj6x/TUe3MfoCd+CZ/k/H7lIk7d2xXLzNRQr914rrwNdtppU4vbT
 BJ5aGmdSzt1EAQR6Qii828Dv8X+wYihkKC7x2FC5IpSbNvf5FssLnG3N6lPiGJfjgkDA
 jqjA==
X-Gm-Message-State: AOAM532KZV4ix1+hg6Ea1NB49fBt01smfEaAIldWoqzcfmwUb1R2OaUW
 jqI44R3nYXJaVzuXIzFa7og=
X-Google-Smtp-Source: ABdhPJzZ8Vzp3TT4rZO6PfeGsSFH2A8IKgb9hyuLiDluk+m8Sq9S5fJLHSbnC7GjRH4i+Pz4BURDZQ==
X-Received: by 2002:a05:6402:1057:: with SMTP id
 e23mr8268248edu.352.1631267957025; 
 Fri, 10 Sep 2021 02:59:17 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 t12sm2176812ejc.63.2021.09.10.02.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 02:59:15 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOdJS-0005vg-BU; Fri, 10 Sep 2021 11:59:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Nevo Hed <nhed+buildroot@starry.com>
References: <20210831202450.18238-1-nhed+buildroot@starry.com>
 <20210831202450.18238-2-nhed+buildroot@starry.com>
Date: Fri, 10 Sep 2021 11:59:14 +0200
In-Reply-To: <20210831202450.18238-2-nhed+buildroot@starry.com> (Nevo Hed's
 message of "Tue, 31 Aug 2021 16:24:50 -0400")
Message-ID: <87h7esbvkd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nginx: override endianness
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Nevo" == Nevo Hed <nhed+buildroot@starry.com> writes:

 > Though several cross-compilation patches exist in buildroot's nginx
 > package dir they do not seem to address endianness.

 > The test program generated by the configure script compiles but fails
 > to run (as it is built for another architecture) but the script does
 > not distinguish between the failure to run the program and an
 > indication of certain endianness.  As such the fallback of big-endian
 > is used.  This setting then causes http2 headers (anything not in the
 > static dictionary) to come out as undecipherable trash on 64bit
 > targets (see ngx_http_v2_huff_encode_buf()).

 > This commit includes a patch to the configure script to allow a
 > `--force-endianness=big|little` flag as well as setting that flag in
 > buildroot's package makefile.

 > Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
