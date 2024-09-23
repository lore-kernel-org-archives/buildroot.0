Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649A0CF9C6F
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 19:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CEA180DAB;
	Mon, 23 Sep 2024 19:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6tZO0rEuq8F; Mon, 23 Sep 2024 19:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E07680F1D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E07680F1D;
	Mon, 23 Sep 2024 19:48:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F8631BF307
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DD4740B3E
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOZj0uzY4un2 for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 19:48:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DBE2B406C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBE2B406C0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBE2B406C0
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 19:48:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3811D5FFAF;
 Mon, 23 Sep 2024 21:48:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 21:48:38 +0200
Date: Mon, 23 Sep 2024 21:48:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <ZvHGFr9P7eP1NS9p@landeda>
References: <20240922204145.3704517-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922204145.3704517-1-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727120920;
 bh=0am2XjFz7rOWIqfeZtgIMnkL3uMVLtL844kc2rdkLd8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZf7ArIYOGCUkhsj22SFH9/Ek6PN4T3o/vfFNMb71i2lmNPM/hOpPXHFYsw7qFlAZ
 y0HtTVASJFcNF+etq7pmnHJ5RCluAVGBV19w7T4sOjFlGAIGWhxG20x2FG+r2nYvfa
 1mN0IBqqW8WiRoahj3no76jL+wl+dSoOSTJkMx09socG7NcI4VavH8ICpl6Bu1Lo/9
 V6oKvORoExT3tG1FKOyIy24zxIsY2j9E1tVN38kfgJJLw6nZ+lW2m1/ZgeihWyWT9p
 1w1sUx79zh/81zYtHaHqz7PDK7/aWDNelNl3f2L18XZY6N2nd8tpgm1ZgKRD53glDv
 3VfljjAZwyCGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MZf7ArIY
Subject: Re: [Buildroot] [PATCH 1/1] package/tcpdump: bump version to 4.99.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Akhilesh Nema, All,

On 2024-09-22 13:41 -0700, Akhilesh Nema spake thusly:
> Changelog: https://github.com/the-tcpdump-group/tcpdump/blob/4a789712f187e3ac7b2c0044c3a3f8c71b83646e/CHANGES
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tcpdump/tcpdump.hash | 4 ++--
>  package/tcpdump/tcpdump.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
> index 1a22889851..b29ac06060 100644
> --- a/package/tcpdump/tcpdump.hash
> +++ b/package/tcpdump/tcpdump.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature at
> -# https://www.tcpdump.org/release/tcpdump-4.99.3.tar.gz.sig
> +# https://www.tcpdump.org/release/tcpdump-4.99.5.tar.gz.sig
>  # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
> -sha256  0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea  tcpdump-4.99.4.tar.gz
> +sha256  8c75856e00addeeadf70dad67c9ff3dd368536b2b8563abf6854d7c764cd3adb  tcpdump-4.99.5.tar.gz
>  sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
> diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
> index 91643e7bea..f4086ef124 100644
> --- a/package/tcpdump/tcpdump.mk
> +++ b/package/tcpdump/tcpdump.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TCPDUMP_VERSION = 4.99.4
> +TCPDUMP_VERSION = 4.99.5
>  TCPDUMP_SITE = https://www.tcpdump.org/release
>  TCPDUMP_LICENSE = BSD-3-Clause
>  TCPDUMP_LICENSE_FILES = LICENSE
> -- 
> 2.25.1
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
