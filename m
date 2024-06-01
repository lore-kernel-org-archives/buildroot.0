Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D52C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 19:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D223F8460F;
	Sat,  1 Jun 2024 19:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQtur7LsLKbY; Sat,  1 Jun 2024 19:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B5EF845A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B5EF845A6;
	Sat,  1 Jun 2024 19:37:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F16691BF2C2
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE3678455A
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkbOhsFrZPTb for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 19:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4793E845A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4793E845A6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4793E845A6
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 19:37:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F1EDE13F899;
 Sat,  1 Jun 2024 21:37:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 21:37:25 +0200
Date: Sat, 1 Jun 2024 21:37:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <Zlt4daualKvkYAUw@landeda>
References: <20240529202425.469185-1-brandon.maier@collins.com>
 <20240529202425.469185-3-brandon.maier@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240529202425.469185-3-brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717270648;
 bh=CyyPpql33/svky8ycnyzMi3SULktKYknCvHzw4GHYzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=emtXpj3LmCZK+EQcvpStTGvcVFpg3U6XRJPrHSjRc73+A7JLzu0Mq+qfru9GGtdZW
 7tbMME0DvdspuuHjWWiedtqiyNJB/zPUsMOT8kr6TQ40ZQAOQbGFlqZ1VFWXfdXM6z
 P+zsjDe/JRHk/AkWLUEGQuQNN/bFUu7PgKkqhPO+hSCEJVlT0ZwE/984+WryEVJ+zb
 w1KVfI9coveR6tBw1BExO9KWwBRgnOgPJrGpn00RkyU7N/LIfPyFlYLPPqEg2vlGse
 p/zvIu0/LziAxW+O1ocMuMnw+3+JyNXZKpdmWYmWE02roV/nDliDa4mLFNFTUE56JL
 yEwMmC8RT1+kQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=emtXpj3L
Subject: Re: [Buildroot] [PATCH 3/4] package/mtd: bump to version 2.2.0
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

Brandon, all,

On 2024-05-29 20:24 +0000, Brandon Maier via buildroot spake thusly:
> https://lists.infradead.org/pipermail/linux-mtd/2024-March/104058.html
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mtd/mtd.hash | 4 ++--
>  package/mtd/mtd.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
> index 9926a34a80..1efb06f490 100644
> --- a/package/mtd/mtd.hash
> +++ b/package/mtd/mtd.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://infraroot.at/pub/mtd/mtd-utils-2.1.6.tar.bz2.asc
> -sha256  c1d853bc4adf83bcabd2792fc95af33bdd8643c97e8f7b3f0180af36af76f0e5  mtd-utils-2.1.6.tar.bz2
> +# https://infraroot.at/pub/mtd/mtd-utils-2.2.0.tar.bz2.asc
> +sha256  250d082f67375ca8451b5fcfc9a23a53ced3ebebd8312c288daf2507bbab1324  mtd-utils-2.2.0.tar.bz2
>  sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 39b9f2a523..a20e00e9da 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MTD_VERSION = 2.1.6
> +MTD_VERSION = 2.2.0
>  MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
>  MTD_SITE = https://infraroot.at/pub/mtd
>  MTD_LICENSE = GPL-2.0
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
