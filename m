Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E3FC77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC847415E6;
	Mon,  8 May 2023 20:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC847415E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHPs0-g6YvEh; Mon,  8 May 2023 20:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A38AE40941;
	Mon,  8 May 2023 20:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A38AE40941
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2E7D1BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C7ED60E47
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C7ED60E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ntaHuOANz_-O for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:28:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 971236060A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 971236060A
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:28:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89f6:f9b6:d1a9:3e6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 686C178050D;
 Mon,  8 May 2023 22:28:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 22:28:08 +0200
Date: Mon, 8 May 2023 22:28:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230508202808.GP252090@scaer>
References: <20230428033137.620562-1-xiangyu.chen@eng.windriver.com>
 <CACXRmJio=RfDY7E+ekja9AyjioQQydcVfCRT1TrheV_OvPZmJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACXRmJio=RfDY7E+ekja9AyjioQQydcVfCRT1TrheV_OvPZmJw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683577692;
 bh=+/9moiAqgd1eweNWwVn2tz+U2dldpUnIPe0bjbk0cEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lhbWPE3V6iIA8RLrZIdhVSgnPxR1oWwzHsGU/8HxsCH4IpvujfwWmLkrhfqmlYBaZ
 bEu5skJpctZxq8xWfDgTEc/QiajkN4nkKMfEJ2yuAquZcVHTn3RCPu/8TFS9RDkP7t
 YkmQDdQ68srMrVw41l7BhkeAOFb56wh9Ezmd3PY0/lOzufCJI6SyD7U49DtHC9/dfo
 EMAHN8ldblbmRV8Q7yv4gUxA8N5FZC/jRnZUiFXqrEn8nOTmiaj6NfSPLtwaseXyTa
 kXu90fLAuthrzkNX3c6wdGJJqGCG19uh8vXHxLn0MhPPHsLo5KLBQISIZJcivwffBM
 SFK38zvdhu/5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lhbWPE3V
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcpcd: bump to version 10.0.1
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
Cc: johns@msli.com, xiangyu.chen@eng.windriver.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-05-01 18:19 +0200, Thomas Devoogdt spake thusly:
> Buildroot has a custom site handling for GitHub [1] nowadays.
> So it should be something like this:
> 
> DHCPCD_VERSION = 10.0.1
> DHCPCD_SITE = $(call github,NetworkConfiguration,dhcpcd,v$(DHCPCD_VERSION))

The $(gihub) helper should only be used for autogenetaed archives, i.e.
archives that are generated on-the-fly by Github.

For archives that were uploaded by the maintainers of a repository, the
$(github) helper must not be used, and the actual URL be used.

See the manual:
    https://buildroot.org/downloads/manual/manual.html#github-download-url

For dhcpcd, we are not using an autogenerated archive, but one uploaded
by the maintainer, so we can't use the github helper.

Regards,
Yann E. MORIN.

> And the DHCPCD_SOURCE line can be dropped.
> 
> kr,
> 
> Thomas
> 
> [1]: https://buildroot.org/downloads/manual/manual.html#github-download-url
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
