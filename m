Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9982CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82A0D40298;
	Mon,  1 Apr 2024 13:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlktuZqmPr6v; Mon,  1 Apr 2024 13:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AC454043E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AC454043E;
	Mon,  1 Apr 2024 13:11:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0B8E1BF966
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDA1760885
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIbNvBTufvfu for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C95FC6087D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C95FC6087D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C95FC6087D
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 13:11:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D97BC13F8A9;
 Mon,  1 Apr 2024 15:11:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 15:11:29 +0200
Date: Mon, 1 Apr 2024 15:11:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <Zgqygdv46BMeq29-@landeda>
References: <20240331065931.12195-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240331065931.12195-1-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711977093;
 bh=vHBI8LEoZgbxU8l/jvI7SZ+5pKSTT8r2s9ZN8foALEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qJstXnjnK97aFkgws3Pz4zIp1XDXbrAEjG3iKPW6fTshJPgnS9B7VN7XsIozyhIjm
 j3swfEq713J1QBxvAyOTsxOY1VGAAL/fFT6Isjjn8Yyzvf2pKSuUfjRU9VImHEsX7o
 Gbj/QIu3ZWgas6j2J65UGDtHGJnjGTMS32yiLSQRXqTB/bmrtOa0h1GK9o/3PpM3aV
 DMf2mkXyQ4Fj8yfun9C6h19EjMBZQaS0uxfpxmgdsdR8y7sJdVtdvHFsOxjYqcDJBn
 kNR6k0upe88hNO8MNDaxOVVDD/OR6HVI0UD+sYSv/FWLP3Sdx/Lszz7L0fLxi/r4Hd
 iFmhHThYywE1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qJstXnjn
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.7.14
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2024-03-30 23:59 -0700, Christian Stewart via buildroot spake thusly:
> Updates containerd to v1.7.14.
> 
> Highlights
> 
>     Fix various timing issues with docker pusher
>     Register imagePullThroughput and count with MiB
>     Move high volume event logs to Trace level
> 
> Container Runtime Interface (CRI)
> 
>     Handle pod transition states gracefully while listing pod stats
> 
> Runtime
> 
>     Update runc-shim to process exec exits before init
> 
> https://github.com/containerd/containerd/releases/tag/1.7.14
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/containerd/containerd.hash | 2 +-
>  package/containerd/containerd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
> index 25dc7ff55d..193003e5a3 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>  # Computed locally
> -sha256  ae2b914bff0ddbb9b29d5fc689a51e1ce89ea4edfc4df9ae10517c6f5d2d5aaf  containerd-1.7.13.tar.gz
> +sha256  ae55b25fb04b45dfbbde8280b034783a48ae7c40350d17fd272be5cbf0284cf1  containerd-1.7.14.tar.gz
>  sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index 9bf51c93ae..81875f763c 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CONTAINERD_VERSION = 1.7.13
> +CONTAINERD_VERSION = 1.7.14
>  CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
>  CONTAINERD_LICENSE = Apache-2.0
>  CONTAINERD_LICENSE_FILES = LICENSE
> -- 
> 2.43.0
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
