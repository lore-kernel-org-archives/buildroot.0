Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA410C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 11:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B048605EF;
	Thu,  6 Jun 2024 11:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZbCV0_6MyQl; Thu,  6 Jun 2024 11:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CDD160797
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CDD160797;
	Thu,  6 Jun 2024 11:09:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 480B71BF591
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41C8D4031D
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47QdyGRi6x-1 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 11:09:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1FA44030E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1FA44030E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1FA44030E
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 11:09:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 61B8513F8A7;
 Thu,  6 Jun 2024 13:09:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 13:09:41 +0200
Date: Thu, 6 Jun 2024 13:09:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <ZmGY9TM0vZez-rCf@landeda>
References: <20240606104813.1514-1-jarkko@kernel.org>
 <20240606104813.1514-3-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606104813.1514-3-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717672187;
 bh=WnSyN423syUAyrVpvG/BHnxAKCKVbH2nGVswy+++a4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kc/hjvzLKFn1unJeq0SwX1fD3YfOfYT9TF6TlytNyn5Wk5VWjyON7gQ6zd0c9psZz
 34NF39uEOWASby1atEWe/kzHsdK81Lx9UOu5OIJncGeUlVlT3MPll2eYPrKQBEr1mZ
 PmFof8CJme7kgqu9zEjrbCHBq9tHYaQn8ppCnAhzfXsZdTx/UGO15oNK/JWERiMPVM
 0lPkPnT5YOBpHiTbnxWV5oV0sZknQACWsEoAH/LsyYCDkQh4urTImUcEiBmVvCQzX4
 bqUppnaiLFjdPS67qyE+5bD+m1/wZuwFsCGSuX/KSdrePAIN7mWI7yvWjDWDisFzdP
 MZvselZPEKxJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Kc/hjvzL
Subject: Re: [Buildroot] [PATCH v2 2/3] package/systemd: bump to version 255
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
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Karkko, All,

On 2024-06-06 13:48 +0300, Jarkko Sakkinen spake thusly:
> The last version with System V init scripts

As far as I know, in Buildroot we do not use that compatibility layer,
as we do pass the followign option at build: -Dsysvinit-path=

So we should not be impacted by that removal, correct?

> and cgroups v1 support.

It's not entirely clear to me how dropping cgroups v1 suport will be
impactful... AFAIK, the kernel has long had cgroups v2, so virtually all
systems where we would deply systemd 256+ would have a recent-enough
kernel.

> After
> this version the upgrade will take mostly a longer period of time.
> 
> Link: https://github.com/systemd/systemd/releases/tag/v255
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cd: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
[--SNIP--]
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 6b3553723c..e74eb9e830 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>  # - Diff sysusers.d with the previous version
>  # - Diff factory/etc/nsswitch.conf with the previous version
>  #   (details are often sprinkled around in README and manpages)

Did you address the comments above? If so, can you elaborate (even
slightly) in the commit log why nothing changed in those respects,
please?

Regards,
Yann E. MORIN.

> -SYSTEMD_VERSION = 254.13
> +SYSTEMD_VERSION = 255
>  SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = \
>  	LGPL-2.1+, \
> -- 
> 2.45.1
> 
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
