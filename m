Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69D1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 12:23:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EDDD60FA0
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 12:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EDDD60FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F137384349;
	Sat, 18 Sep 2021 12:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3B3JdXhntqaD; Sat, 18 Sep 2021 12:23:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ABCB84345;
	Sat, 18 Sep 2021 12:23:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91C7F1BF364
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 12:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81676606A6
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 12:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-iE2uT3Fzrp for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 12:23:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DC3E60619
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 12:23:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E7802B00563;
 Sat, 18 Sep 2021 14:23:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631967817;
 bh=iNLTZSAsyCBSn2Bmof3+Nvu1131u4Kx/YNwmNzIneqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p9M8lW6hYH5HUDLxq7Dv/hXmqEzaSQ9mRm6/37j7sueMmZD1SNP+xLmJnZ8c4XPS0
 exdyzyUJa/UOSph24uwIT7Szlo2rBbPtYwJoMQhLcIeEf+4v76/xi94Q4zmkTccKL0
 tUOMq+uSvo5vxfJY2iWN3a1dczfEViSRdFnWOA/6WvL7uHtFnBuVBv8ciQsZzKw7yk
 SifxXVHnjoAWoIAWuRzYQp0tX8zy5AwKVdYKH76hgkRHgiUDvWvNCyQ14Eg1ZjVRhC
 ZUAhAnGk8aQkUzycBATwSCQ1ScBWdqaV03cm7yGA9/J1ObwP0NzoBpoEyIXDk4hk45
 vgYqrIXDwKo8w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 14:23:30 +0200
Date: Sat, 18 Sep 2021 14:23:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210918122330.GM1053080@scaer>
References: <20210916173703.26938-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210916173703.26938-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/libiio: fix compile without
 thread support
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
Cc: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Peter, All,

On 2021-09-16 19:37 +0200, Peter Seiderer spake thusly:
> - fix compile without thread support (add configure option
>   '-DNO_THREADS=ON' as requested)
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/2cca5952e7d677cd0d5fa97aa1a7bf3e722df3a2
> 
>   CMake Error at CMakeLists.txt:409 (message):
>     Unable to find pthread dependency.
> 
>     If you want to disable multi-threading support, set NO_THREADS=ON.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libiio/libiio.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
> index 4ce933a0cd..f706298c22 100644
> --- a/package/libiio/libiio.mk
> +++ b/package/libiio/libiio.mk
> @@ -17,6 +17,12 @@ LIBIIO_CONF_OPTS = -DENABLE_IPV6=ON \
>  	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF) \
>  	-DWITH_DOC=OFF
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +LIBIIO_CONF_OPTS += -DNO_THREADS=OFF
> +else
> +LIBIIO_CONF_OPTS += -DNO_THREADS=ON
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBIIO_XML_BACKEND),y)
>  LIBIIO_DEPENDENCIES += libxml2
>  LIBIIO_CONF_OPTS += -DWITH_XML_BACKEND=ON
> -- 
> 2.33.0
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
