Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA416C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 19:51:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CED5601FA
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 19:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CED5601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9A5741581;
	Thu, 16 Sep 2021 19:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uSdzjba1jPoH; Thu, 16 Sep 2021 19:51:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 472F741586;
	Thu, 16 Sep 2021 19:51:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FFE71BF873
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 19:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CBE541586
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 19:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZ9mFHrlnBMI for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 19:51:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A6EA41581
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 19:51:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id y132so5639942wmc.1
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 12:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=e8cF1NP03yvoRbjQbWaGyQxFUpMcv0Q4NJPykQoUcaI=;
 b=SlEpm3jisTRL1u38n7OFiqBYlEKkfx8wz0777CdaCapW12vNzn4riHbvnnRA6pk1QR
 rihQHPKzXjCMNTMHr0KrWpanQv2OsHbfm38yYAv7hcThJ7UnHkob86aWnwJaM6tasUML
 KtlHEcsc4E4ch//aU5Ork2UMT7nZpdlg24+W26Q49OGf/tjyPhfQUoY1CF73s64Tyj9o
 IfrgNkZ9O15UNiGuOdJshr6DIE8r5zU9k5r2h9kTHU17kmF7GCtI3tTI1svPZUQnl+pq
 AjnzZ/H3sYPe/WDE9COEI/4aCLd1VUrIxpOIcKGu1dtam5mqW+b3YHulkxtYdUv7zyhE
 0HpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=e8cF1NP03yvoRbjQbWaGyQxFUpMcv0Q4NJPykQoUcaI=;
 b=Qtunea+g/F5+be1bKG3s3xxShE0ygQszkVIrlCl/CaYWmogl4/8yxZx8jEMUPbbKM8
 hKT7YCx/TedyQdWcOVDrFArH9lBB6ZNjlLC3i1etCvgzETf33ZIzckGhZ558wIPe+weS
 b0buW0GLPMHiVJPqfgFXLQGlJ1Td/Z/2Cfd1qbDLNIqurjIv1v9VgJrpmAAL9QHbJLCa
 +Xd+E2IbH2yZMDENG8GUTf0buX41eF3hJncrkGIepdM0F6Yp6+htpEOemjWhprBlDM1Q
 TDGwDhJyddcLRyQ/8mXedPuvLjy6DllK5U9LRdkS8OYxMUOQwRiMIjOCzjo5IVL2aaZA
 xnBQ==
X-Gm-Message-State: AOAM532ZtARWbdteubUcqi33azr1nh7R9B4JUFIi2viKpZZp2hmCrDWf
 WkdsiVGDJWhfyB3MepwMKvQs08RSQmM=
X-Google-Smtp-Source: ABdhPJz9kW4Nx+G8FYqtqQ0eFY2M/izHSQRi0ejNi3jB3a8kiRPD4AKTNHwyTw27Gjr6H/D21J4v4Q==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr6883977wml.55.1631821906484; 
 Thu, 16 Sep 2021 12:51:46 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id o12sm3642097wms.15.2021.09.16.12.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 12:51:45 -0700 (PDT)
Date: Thu, 16 Sep 2021 21:51:42 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <YUOgTgt5Rrzaw1ap@pevik>
References: <20210915194839.22122-1-petr.vorel@gmail.com>
 <20210915194839.22122-4-petr.vorel@gmail.com>
 <56e9b208-6590-eaa7-35ce-55cec55e499a@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56e9b208-6590-eaa7-35ce-55cec55e499a@mind.be>
Subject: Re: [Buildroot] [PATCH v2 3/4] utils/getdeveloperlib.py: use
 python3 explicitly
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: David Laight <David.Laight@aculab.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Arnout,

> On 15/09/2021 21:48, Petr Vorel wrote:
> > + remove python2 compatibility imports

> > library is used by support/scripts/pkg-stats and utils/get-developers
> > which both use python3. Although library does not require shebang,
> > it's better to state python3 use.

>  Do you have some supporting evidence of this claim "it's better to add a shebang"?
No.

>  Looking at a few random projects with python files, I see none that do it.
I'm sorry, I was obviously wrong.

>  And it seems like a lot of noise to add this for no obvious gain. If it's about
> documenting the minimum python version, it's not even correct: some of these
> scripts will require python3.4 or python3.5 and that's not documented...
Agree => setting this commit and the 4th commit in patchwork as Rejected.

Thanks a lot for your input.

Kind regards,
Petr

>  Regards,
>  Arnout
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
