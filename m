Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519F5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:08:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6D7861042
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6D7861042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E932840F4;
	Wed,  6 Oct 2021 19:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgHICtm-6knd; Wed,  6 Oct 2021 19:08:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1A5683BA2;
	Wed,  6 Oct 2021 19:08:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57F631BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5325C40789
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNQmQTj_RDuo for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:08:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 801CA400EB
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:08:09 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k7so11716099wrd.13
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=UjqJqLLIonyBl/fEnrRc3ZDS8QCjcSTphhs9Epv9YFs=;
 b=Om2t+2C9YHz6R1IPkz+0F+fJExUS2ltaLwjW/Dytdc0O8BmX1Gm5kI8GZL/gvuAu4X
 qThGa3FGpc/6K/HOcsLPlOJNTDrhDHc35kItqhXlLcKJMOcVbm14/rLOPuQxz37oJJbH
 TlLFF3xGuWD6L/nRBGDq0A2XnN4l270T95HpzsY0Ch0pTSD2iim++YxshJT2/FQakxsL
 owvgieZneuL2M4+FabpawBcwrRRHqQAJkxF9ak6kHBPqQJNSPPPJDWFOSFmOhNGuJFqP
 ZsNQuCnzocbpPbHZ6t0wGlLe2jvAIfU0qfKuRrn5yaeR/pAIO91lMQLrKmkNwI1OG6K/
 KnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=UjqJqLLIonyBl/fEnrRc3ZDS8QCjcSTphhs9Epv9YFs=;
 b=HGcu/ZOjCyyFSD/3TafUQ0EJYzz2BcJQUmCtPbjElhcS2zUtisDRBNMaYg0oHAgASB
 qa+gcnEa8GODcMZ+7iJdHusyqbAk54qT5I6HWA40JKbC1NXyvmGjzSD136uoNN2jIUJn
 68JUKz/QidV/SSN9jj+wiWYI4s2IK5a2hsd7IFqavbgXBu6qLlkWrUZbYCYYMTANGnGc
 ApDhzzQ2cM5HslYnPtu8ns2y9sjnYlWojgbFHz9jzixcG60YakAFGEj97ORYVowT5824
 qINqUM5kDYehzCV1G5hUzFZ1ZrsRAxU255yDjUFpNXxuZ3oziiBNbgtar0VmHYxOnrqd
 w6uw==
X-Gm-Message-State: AOAM533BCEgKo1+XRUhrNQH0/t6lBh/Atv1TIoHz/cpN3lqTvH2kRMVk
 qGnEClOYfPZv/9w8DEWnd/s=
X-Google-Smtp-Source: ABdhPJwXWH13biCav+++X52+kE2gMqbg4HD/RVb+8bNBaLgsSjjPQ40xtCIOzEbMhfuNOtc6HIwzZg==
X-Received: by 2002:adf:b1d7:: with SMTP id r23mr18539389wra.145.1633547287719; 
 Wed, 06 Oct 2021 12:08:07 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id b13sm4881952wmj.3.2021.10.06.12.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:08:07 -0700 (PDT)
Date: Wed, 6 Oct 2021 21:08:03 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YV30E/UL73VJ3AYf@pevik>
References: <20210930183058.5240-1-petr.vorel@gmail.com>
 <20210930183058.5240-4-petr.vorel@gmail.com>
 <YV2r5IvFeiVIoY9a@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YV2r5IvFeiVIoY9a@yuki>
Subject: Re: [Buildroot] [RFC PATCH v2 3/3] lapi/if_addr.h: Define IFA_FLAGS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Li Wang <liwang@redhat.com>, Martin Doucha <mdoucha@suse.cz>,
 ltp@lists.linux.it, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Cyril,

> Hi!
> Looks good, as long as it passed CI:
Sure, I tested it not only for affected buildroot, but for LTP CI.

Thus fixed commit message and merged.
Thanks a lot both for review.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
