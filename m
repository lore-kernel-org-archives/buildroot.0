Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127F7C5DF7D
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 19:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D483881157;
	Fri, 21 Aug 2026 19:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAP_L79f0Z8l; Fri, 21 Aug 2026 19:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787341621;
	bh=5l0tftaP1TNtqoM/g1fDERxJyqn+TBvxa7vUCXG0fas=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cB6ybBSWQlqjB7Ecz+z72XmPg9s85uxLnhGr9iMe8tk0XKLWVGL1fFV+acdyvm+k2
	 2bpIjWo5X0gNqT+y0R9PL7MYfCTnOO4Z67WR5QOc5M2dbOGdy/LPbeIo1v1+RBG+/0
	 yCk0UK8tjCHyyGLubSr8E3xoUJfauqxNRgAXml+r1w1pmxFKHSbuUIhwJsQGaaaO73
	 hOAFsrIxpNlLy6l+2EQGIJ9jFUwiRTMjDb3a2Bryk0eEY+jU22ChRpQ0DMMGlXCmwc
	 pSxbUyDlsEM3UYA1Uc/ZIq66I5QfOKYifBrfHMSwRNj599Nr3CQd1id4/NA6fysKHx
	 dTs5Ps78uJkpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0328E81167;
	Fri, 21 Aug 2026 19:47:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D196093F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C34244099B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzufbQyI5haj for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 19:46:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E108E40996
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:46:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1B8A84E4131C;
 Fri, 21 Aug 2026 19:46:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CCB88604AA;
 Fri, 21 Aug 2026 19:46:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8815411C775B2; 
 Fri, 21 Aug 2026 21:46:49 +0200 (CEST)
Mime-Version: 1.0
Date: Fri, 21 Aug 2026 21:46:47 +0200
Message-Id: <DKUVPZAR4HWR.AD1PLPGNKXCE@bootlin.com>
To: "Julien Olivain" <ju.o@free.fr>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
Cc: <buildroot@buildroot.org>, =?utf-8?q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260811-heaptrack-v3-1-772180a6e654@bootlin.com>
 <9de991fb9ed19fb13d2079c3dafde7d5@free.fr>
In-Reply-To: <9de991fb9ed19fb13d2079c3dafde7d5@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3] package/heaptrack: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

On Sat Aug 15, 2026 at 9:25 PM CEST, Julien Olivain wrote:

>> +++ b/package/heaptrack/Config.in
>> @@ -0,0 +1,37 @@
>> +config BR2_PACKAGE_HEAPTRACK
>> +	bool "heaptrack"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libunwind, elfutils
>> +	depends on BR2_USE_WCHAR # boost, elfutils
>> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS #
>> boost-filesystem
>
> This package is failing to build with uclibc toolchains. See:
> https://gitlab.com/jolivain/buildroot/-/pipelines/2762905573
>
> heaptrack uses LM_ID_BASE which is not supported by uclibc:
> https://invent.kde.org/sdk/heaptrack/-/blob/master/src/track/heaptrack_env.cpp#L33
> https://github.com/wbx-github/uclibc-ng/blob/v1.0.59/include/dlfcn.h#L46-L54
>
> You could either try to fix that issue, or disable the package for
> uclibc toolchains by adding:
>
>      depends on !BR2_TOOLCHAIN_USES_UCLIBC # no dlmopen() support
>
> with the corresponding comment.

Thanks for the review and testing!

>> +HEAPTRACK_DEPENDENCIES = host-pkgconf boost libunwind zlib elfutils
>
> Could you sort dependencies, please?

Ah, sure! By a quick look into existing packages I had concluded sorting is
not required.

I'm sending v4 with all the changes you suggested.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
