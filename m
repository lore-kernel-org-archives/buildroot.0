Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CB4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:32:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85DAF604DC
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85DAF604DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F4961B9E;
	Fri, 10 Sep 2021 20:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rla5Uwbx--0v; Fri, 10 Sep 2021 20:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 893D261B95;
	Fri, 10 Sep 2021 20:32:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F1341BF580
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78B1981B10
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:32:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rKr2brr1p2SP for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 20:32:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D43581AEA
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 20:32:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d014:579:30ce:61f5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4C2672003CA;
 Fri, 10 Sep 2021 22:32:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631305961;
 bh=BOwUyJnX41naRPIq+24NfFWyWZ9xKfNno6vek+URyC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bOckQZUcNx+9MWahxjwq29Q2LkhQNDRdye712CUQMlAkPg1sOPWmQh5ZgrD6G4jWv
 /sfPev0dHm0+q/SMEBnLDq3VzxyHNkhAaO03dsrlZ9w/sORf0S0GcFgNWhskvhmpXt
 gCuNkk8ZxfaPHMz/Y9eas2YG3K7nen7BWofkMKriC0/VKhMRyct8s4UsYH9qQZhhri
 c9CC1fGIaY72g9e00gVINnfKOeV8627aMe5AwQbMvegpjLUhTb5wcnv28XDuk+jXKV
 9rt+F83R6FaSLNTIEn5zg+vNe3MX/YBdxtdGmzL6olZNQYu8f2l5IJHIJo/4ACYF25
 /i6otvoE9NhJw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Sep 2021 22:32:31 +0200
Date: Fri, 10 Sep 2021 22:32:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210910203231.GF1053080@scaer>
References: <20210908213332.1564474-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210908213332.1564474-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] toolchain: reorder gcc bugs by number
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Giulio, All,

On 2021-09-08 23:33 +0200, Giulio Benetti spake thusly:
> Reorder gcc bugs by number

Appealing to my maniacal need to order stuff is a sure bet to get one's
patch applied (rather) promptly! ;-)

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  toolchain/Config.in | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index d6381f64a0..99f0c16c6f 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -189,13 +189,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
>  	bool
>  	default y if BR2_sh4
>  
> -# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101952
> -# ICE: on SH4: unaligned opcodes detected in executable segment.
> -# This bug still exists in gcc = 11.1.0
> -config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
> -	bool
> -	default y if BR2_sh4
> -
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
>  # ICE: in extract_insn, at recog.c:2294 on microblaze.
>  # This bug still exists in gcc = 11.1.0
> @@ -210,6 +203,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101916
>  	bool
>  	default y if BR2_sh4
>  
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101952
> +# ICE: on SH4: unaligned opcodes detected in executable segment.
> +# This bug still exists in gcc = 11.1.0
> +config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
> +	bool
> +	default y if BR2_sh4
> +
>  config BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	bool
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
