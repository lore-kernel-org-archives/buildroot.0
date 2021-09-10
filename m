Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C526C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:27:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5FBC61041
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5FBC61041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EFBB817F2;
	Fri, 10 Sep 2021 11:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k_EgU2s7SMMK; Fri, 10 Sep 2021 11:27:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0E0681865;
	Fri, 10 Sep 2021 11:27:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46FB41BF23C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 436BC817F2
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOrUSxLZ3B1T for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 11:27:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E966817BD
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 11:27:04 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id q3so2000555edt.5
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 04:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=hI7QPZfMtamcS3c2Za4BwI6JTc7Ig0AQAZ7wmT848r8=;
 b=N/69cU38zVyeaWogNUijC0a75zy5EGCgqoOVCtK2iuiFLeR+PwHeUyckr6NbQ3MNYH
 jeJ9t6vtg+NnXEdqmrd7BRsj4ukdPetRDSxS+qn/QAzFmy2n2KzKoFU1dsa8F3DLsb8h
 rLOzGUa6GyTmyoJQZ8o0MlF0GS3QoMOSz3M9kt4oafyuw5ivjRLMWWbuJ7K0Xi87nbbT
 O+1g7aUB1lcTpNM2cxTnba9EXAXs1KfNEM76Jzkj1Vci5tifoUDpOlIJ9nRuHuJaSUBq
 2MBbj62ox9vHWnQbb97Jw2tS17LI21IaISzoeOAi4Jmg2iKesB/r9nADv/5T+zOpS//V
 1f9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=hI7QPZfMtamcS3c2Za4BwI6JTc7Ig0AQAZ7wmT848r8=;
 b=cBSIBYJBG/KxvzDJ0txLsS1BOmySSNzOyjDBLRIXRviZU3UtOL6qH98TjqZekrtslr
 zR3a0zTKJ//f/SOUeUEn0YWViErjUvihMVmQFsCVGapxL3Qkb++gNaL79N2hpspeXn4j
 fmQu0qim8Uimv2wgr15lolVE3P0fQZdwLJv6dJWN5IEQCOo9YQP92cQ6I2b9tTh8EXY2
 3iv7GIYxfBY0WgoxLZTLuIxiKjWFsDbCg2y42pwEB9daBTp/OfJVTUDTBSVbmq1z2Opw
 M3kMBGFd8VqxR5w6ANucjTmWuAs2dl1zfSp4V90AX6xGS8erl4GD3PnO9CyzZZQJTdtR
 WnJg==
X-Gm-Message-State: AOAM531md48Y2PyNt4Vja7ZSE6OlJxV+1pdRXKS3+lDZhFgaVq+NOq83
 JeG+YHAiRvaKXzRhbfCA/Mg=
X-Google-Smtp-Source: ABdhPJxq2b92To4PD/uxbaE3sjma03HWuCxnuCiVwoTI1tKwMAMJrY9upiWodffB/zFfCHYvCkE/Vw==
X-Received: by 2002:aa7:d859:: with SMTP id f25mr8410237eds.247.1631273222549; 
 Fri, 10 Sep 2021 04:27:02 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 ks20sm2254357ejb.125.2021.09.10.04.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 04:27:02 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOegP-00009B-Di; Fri, 10 Sep 2021 13:27:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20210905065808.1828855-1-francois.perrad@gadz.org>
Date: Fri, 10 Sep 2021 13:27:01 +0200
In-Reply-To: <20210905065808.1828855-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sun, 5 Sep 2021 08:58:08 +0200")
Message-ID: <87ee9wacxm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/librsvg: bump to version 2.50.7
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Looks to be fairly important bugfixes in .6 / .7, so committed to
2021.02.x, 2021.05.x and 2021.08.x, thanks.

https://github.com/GNOME/librsvg/blob/2.50.7/NEWS

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
