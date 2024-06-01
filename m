Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609C8C27C44
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 19:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C69384513;
	Sat,  1 Jun 2024 19:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvfMxRsAVHnJ; Sat,  1 Jun 2024 19:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC59484405
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC59484405;
	Sat,  1 Jun 2024 19:37:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61BCC1BF2C2
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E599608A1
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-CpkkhOImJL for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 19:37:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DCE7B605ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCE7B605ED
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCE7B605ED
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 19:37:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 29A5713F88E;
 Sat,  1 Jun 2024 21:37:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 21:37:09 +0200
Date: Sat, 1 Jun 2024 21:37:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <Zlt4Zb_X6f3dp1qD@landeda>
References: <20240529202425.469185-1-brandon.maier@collins.com>
 <20240529202425.469185-2-brandon.maier@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240529202425.469185-2-brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717270632;
 bh=jqS1s0uaQ+4j6qYkTwkMlxp5dciWZvNqxmUZQzlLYuU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SlWc5PopITmi6URTOpkOJghWOq3VjwMFUYKQ8zjWgHk19sBcVfnrxrl/mMA7cXtJB
 Xh8IG4uy/t7G3JKWtq9zs1Etg8A3KrQal8k/F94s0NUpMFE4LA1j+aa4Fl86IHjTux
 kewD174PEs+ociJqdYtpG3/MxkoU1cw+v6aI+1lNc6rFRMw/uWgaplTYswh3bTKm2N
 Euz+1JVzmZfquoEadli90LYimSX68u0NwSDpJM2ek1sxeYsT7l2Iq3JUFHKpVt+zBi
 +YlxfJo+ynLj8/sQvuBWFIRbwp4e2cXsODC6ETwyCMyzaGslWiMzdws4Asli9KfKDo
 lCCHSPyyDeH8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SlWc5Pop
Subject: Re: [Buildroot] [PATCH 2/4] package/mtd: switch to https mirror
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

Brandon, All,

On 2024-05-29 20:24 +0000, Brandon Maier via buildroot spake thusly:
> As mentioned in the last release notes, there is an https mirror[1].
> Switch to this as ftp is not as widely supported anymore.
> 
> [1] https://lists.infradead.org/pipermail/linux-mtd/2023-August/100922.html
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mtd/mtd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 998cc419b3..39b9f2a523 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -6,7 +6,7 @@
>  
>  MTD_VERSION = 2.1.6
>  MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
> -MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
> +MTD_SITE = https://infraroot.at/pub/mtd
>  MTD_LICENSE = GPL-2.0
>  MTD_LICENSE_FILES = COPYING
>  MTD_CPE_ID_VENDOR = mtd-utils_project
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
