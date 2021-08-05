Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84863C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:01:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1DEC60462
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1DEC60462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F3A040287;
	Thu,  5 Aug 2021 08:01:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIu9ORbAnCQi; Thu,  5 Aug 2021 08:01:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B71644026A;
	Thu,  5 Aug 2021 08:01:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8584A1BF578
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7606283455
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7WGiDsTObhXb for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 08:01:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D123833CE
 for <buildroot@busybox.net>; Thu,  5 Aug 2021 08:01:51 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 1F703C02A7F5;
 Thu,  5 Aug 2021 10:01:50 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 05 Aug 2021 08:01:50 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@busybox.net
In-Reply-To: <mailman.2621.1628148096.1752.buildroot@busybox.net>
References: <mailman.2621.1628148096.1752.buildroot@busybox.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0ba2c9e6b21d2c6c59bffb9f6fe50e8c@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.2 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] Common header files / code between packages
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
Cc: Jacques Samoun <jacques.samoun33@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Jacques,

On 2021-08-05 07:21, Jacques Samoun <jacques.samoun33@gmail.com> wrote:

> Hello,
> 
> my development consists of a kernel driver and an companion user space
> layer.
> They are build each in 2 separate packages. Using external tree build.
> 
> The problem is, i would like to share some include files between both
> package (kernel driver and user space layer).

I would:

- build the kernel driver first,
- add an install step that installs common header files into 
$STAGING_DIR/usr/include/<add fancy name here>,
- add this include directory to the configure (if present) or build 
configuration of the user space package(s).

> So far, i solved that by adding a common folder containing the include
> files, and making it part of each package, so it builds OK.

The kernel driver exposes this interface, so should provide the only 
instance of these files.

Kind regards,
Andreas

> 
> Now, a third package, whose code is completely outside the first 2 is
> willing also to use this include file. The only way i found so far, is 
> to
> put explicit relative path referring from one package to the one other, 
> but
> this is ugly. Moreover, the path depends on the version of the 
> packages, so
> can break easily.
> There must be a better way (STAGING DIR ?)  but i couldn't find.
> 
> Can anybody give me an hint ?
> Thanks,
> Jacques
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
