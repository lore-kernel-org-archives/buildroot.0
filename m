Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE05ECD11DF
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 20:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CE9A400B5;
	Thu, 28 Mar 2024 20:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fg0Zradxreb3; Thu, 28 Mar 2024 20:54:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B22B417ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B22B417ED;
	Thu, 28 Mar 2024 20:54:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BBB351BF2F6
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 20:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A80B0415FF
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 20:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7M3GQPvPtjb for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 20:54:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48AFB4167D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48AFB4167D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48AFB4167D
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 20:54:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A625B13F880;
 Thu, 28 Mar 2024 21:53:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Mar 2024 21:53:53 +0100
Date: Thu, 28 Mar 2024 21:53:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <ZgXY4brxHcFDwxzJ@landeda>
References: <20240328140919.157664-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328140919.157664-1-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711659238;
 bh=PVG+xqo10HMbIPLSlObklbPUfp2xT66s2vIQ+dl2v+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LrPSbLLoUEzyb5pYXPAWgyqiHgPS2suRjhZxaseEkWSwtVvCJYtC3911auc5bMDF6
 BnkNxUhsR+2OhvZkRWj89czJ9Kp2jOacDW26BU26DRe0ATSf+8rR7MMst5anx9f8BT
 /kwpqNxNNUJvpALYWfloK0DCdMGjUqDDcAgbPXZMO8FvM1ls3qehC9P6j2CEVI7a/5
 N1K3pDZiouNJ6eIlhHvAljMnLpOKZKqEzJMNH6dyp22DefMWQRZ+ts0/Afp3fPYkNR
 lvgLLhP0KohgP4eWNNn9DSj1XJKU9CFDw4q+hovSBlRqwHUoL2AFQ4LVHSPa33crpn
 iFvSyHAF8pmzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LrPSbLLo
Subject: Re: [Buildroot] [PATCH v2] Add
 BR2_ROOTFS_POST_{PRE_BUILD|POST_BUILD|FAKEROOT|IMAGE}_SCRIPT_ARGS
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
Cc: Michael Walle <michael@walle.cc>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Heiko, All,

iReply v2, because I'm dumb and too hasty...

On 2024-03-28 15:09 +0100, Heiko Thiery spake thusly:
[--SNIP--]
> diff --git a/system/Config.in b/system/Config.in
> index 33ca69b933..1bb4c89b36 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -695,20 +695,60 @@ config BR2_ROOTFS_POST_IMAGE_SCRIPT
> 
>  config BR2_ROOTFS_POST_SCRIPT_ARGS
>  	string "Extra arguments passed to custom scripts"
> -	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != "" \
> +	depends on BR2_ROOTFS_PRE_BUILD_SCRIPT != "" \
> +	        || BR2_ROOTFS_POST_BUILD_SCRIPT != "" \
>  		|| BR2_ROOTFS_POST_FAKEROOT_SCRIPT != "" \
>  		|| BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
>  	help
> -	  Pass these additional arguments to each post-build or
> -	  post-image scripts.
> +	  Pass these additional arguments to each pre-build, post-build,
> +	  post-fakeroot and post-image scripts.

Those two huinks were unrelated to the change: in fact they were a fix
for an actual issue that pre-existed.

I've split those into their own commit, wrote a commit log that explains
the issue, and applied that commit before adding the new options.

This will make it easier to backport to stable branches.

Applied to master, thanks.

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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
