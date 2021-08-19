Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088F7C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:14:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E416610D2
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E416610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62FAF40341;
	Thu, 19 Aug 2021 20:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIDUvUkP0FKy; Thu, 19 Aug 2021 20:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59B5740474;
	Thu, 19 Aug 2021 20:13:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 734501BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62BE481992
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GWRU4N9pOeqm for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:13:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DE3481970
 for <buildroot@busybox.net>; Thu, 19 Aug 2021 20:13:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9904:2733:9b91:ffcc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B3E3F2003D0;
 Thu, 19 Aug 2021 22:13:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629404029;
 bh=ctj+VROAnhvZC00eLOjyn450yCa0EbBqMyjZxyJsSnM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DeK+S6M/p7YX3DFcNQH4F6JfmtJ/ak4RCYBvBSd1stfILOxIWuR/tQ3XoB5HkbCXl
 Kuv3ns/J0po2V1gDITLswkDiD9IWs2k+6cEg+/yo9Rfyp5j5/gTFjpMDjSNXvsHbKF
 TT1XYCZB3jSJ9aQmoIzci53YID0eXWsVhoYYYAcqCnKYW6TEzPIHnz46e9CSi1dmJe
 SwnxE6H2UVLhZFggCIYkDcZcEfh5pli0Iqy04cHI5LWt7KiSFijncrcOgZHKs17kKq
 EJDiJ45FKegp7iR4C/+T79WYbKRxJp//m9V6a+eqTP8Z/Ip1QbrJL7exjlDpDHrcaR
 TPiQX7zdpaXzA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 22:13:44 +0200
Date: Thu, 19 Aug 2021 22:13:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Oscar Gomez Fuente <oscargomezf@gmail.com>
Message-ID: <20210819201344.GC27036@scaer>
References: <CALtfCQajW_ZAvVq3J5cA=XgSh1w6u9_Sv+VoRcqLkSMO46aghg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALtfCQajW_ZAvVq3J5cA=XgSh1w6u9_Sv+VoRcqLkSMO46aghg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Issues with SVN keywords and SITE_METHOD = svn
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Oscar, All,

On 2021-08-19 20:26 +0200, Oscar Gomez Fuente spake thusly:
> I am updating my buildroot from 2020.08.2 to 2021.05.1 and I have
> found a problem.
> 
> I have my own package created years ago with SITE_METHOD = svn. There
> are some files in that repository with keyword substitution that with
> buildroot 2020.08.2 works perfectly and the headers of the file is
> downloads from the repository perfectly, as you can see:
[--SNIP--]
> But with buildroot 2021.05.1 doesn't work fine:
[--SNIP--]
> I have check that my subversion is working propelrly in my computer,
> so I donot knoe what to do, to know this Rev keyword is very important
> for me due to the fact I use it for showing when I execute the
> program.
> 
> Does anyone have any idea how to fix this issue?

As Vincent alerady replied, this was done intentionally, because keyword
substitution is dependent upon the settings at export/checkout:
different timezones and/or locales can yield different substitutions,
and this is thus not reproducible.

If knowing the revision is important in your package, you already have
it in the .mk, and so you could try a few things, like pass it at
configure time via a environment variable or via a file...

Altenatively, you could also decide to do the replacement on your own,
with a post-extract hook, something like:

    $(SED) 's,$$Rev$$,$(FOO_VERSION),' $(shell grep -r -l -E '$$Rev$$' $(@D))

But this is not very robust, and keyword substitution is anyway a really
bad idea...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
