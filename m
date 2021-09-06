Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B360DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 17:08:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C98261004
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 17:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C98261004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E57FA40493;
	Mon,  6 Sep 2021 17:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBZpvqjDqh8u; Mon,  6 Sep 2021 17:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 130E6401CE;
	Mon,  6 Sep 2021 17:08:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DF7E1BF574
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 17:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D368401F2
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 17:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id orHzk51Jt0ES for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 17:08:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0569A401D1
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 17:08:47 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id x11so14722366ejv.0
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 10:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=vprasNPD4ZDlpHfVYNYYaQfC4HGDCXq2aSaQ2I+3l+w=;
 b=fv0mVyWuv3XTLKLgQ9u9FxMVMW2LseOq8Vk3rElaAIsoetavX32B0KR1fNE5dkAPTM
 htix+qUaoQVvQUxb5t+nLlwqQkYjxk8DDDcYOAP+/Uein+F5zH7iJnS7vv7L6y5RGpOa
 8KnTQDnjIuJ1sciFn13LIBSpR9jGphm2aS6p9AtUjT38Lw7LMyy8WOsXd711Db4A2DqU
 0w0jHh8/37cxBJrf1wihqf2hzlC/sfjTz0NC6M2OT06aaYEJtcI9aMklIcx/jHC5ijMJ
 qYCy7mwSxsinbmsLLaIW1gAcXX9AE3hcoABkD5nubgEzKG8Vw6c6apTVTf2ZAmkAgHyq
 5rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=vprasNPD4ZDlpHfVYNYYaQfC4HGDCXq2aSaQ2I+3l+w=;
 b=YZYzQOc3pBKw2gYWIv2I+4Lv42KQ1wr9lBT8HjFnve2VC0mzwveZiI2wftlspbGY35
 vmkF2GMH0HSThnkmOQ+qdCRx/MuupJChvwdAsjdZgd7bf6N8a1/G9bz0w5ft7PpqdK9r
 KqgRq+gAbgN5Qq3js0bX3rk9Ikf6fdmAdpq3eeMtcXHswDt2FzBhNE9ELDziUEjXrLOo
 SFVHnZieRLeQ/ojQCS9UlCw7OFlFmbVVculKs/PkeR1PPsh/7FwWv9IvR205zHD5RZyy
 aRHncHzavSty8alf7/U2WIbpUw24Tk0vXn1lSqrthL1EOht9KB2KB7A0KF8QluqNiGMe
 24Pw==
X-Gm-Message-State: AOAM533YqT0yc71bGV/9iIRtPKg2Uf0ip6notaaORc9UKQu0bSygwrQf
 SXGsTOilAXZioMxvxaUQAbn3UCyShAQ=
X-Google-Smtp-Source: ABdhPJz8+TSTUGXSlbw8lgj8orBxgDs0d2Ka8tbbyDmQmtN1lpATwuyAICNaPxQm4ZNtveQVUPH1DQ==
X-Received: by 2002:a17:906:544f:: with SMTP id
 d15mr14688400ejp.520.1630948126131; 
 Mon, 06 Sep 2021 10:08:46 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 s3sm4303971ejm.49.2021.09.06.10.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 10:08:45 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNI6u-00020P-BH; Mon, 06 Sep 2021 19:08:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210821160509.1514047-1-fontaine.fabrice@gmail.com>
Date: Mon, 06 Sep 2021 19:08:44 +0200
In-Reply-To: <20210821160509.1514047-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 21 Aug 2021 18:05:09 +0200")
Message-ID: <87a6kpiqcj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: fix build on riscv32
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure on riscv32:
 > ../src/util/futex.h: In function 'sys_futex':
 > ../src/util/futex.h:39:19: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
 >    39 |    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
 >       |                   ^~~~~~~~~
 >       |                   sys_futex

 > Fixes:
 >  - http://autobuild.buildroot.org/results/692700a5f967760a0b8cd358b1712f1d5a7b681e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
