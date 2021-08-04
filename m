Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A23C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:59:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E743360F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E743360F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE2C560744;
	Wed,  4 Aug 2021 19:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FUzTQuc-p8f7; Wed,  4 Aug 2021 19:59:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F24960624;
	Wed,  4 Aug 2021 19:59:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03E2A1BF20B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0097583B54
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:59:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fWK7YDcsmFJ for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 19:59:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7C358322E
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 19:59:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8405:26f6:b20a:5f5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 37777140C04;
 Wed,  4 Aug 2021 21:58:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628107138;
 bh=V8eRHy7ftukb9j8SHy0WiR4YGdDrieRkKorlrtlCLlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XE5UOX6I65p/emRD0OwkGrbDIwlzj85RvRp1sprYkcrwZlXK+7f6BPgpxFKY4qu4s
 knfkzHHwpnTgQFaq6kLhifp+csKsf00q51x4vFTerRCmLp65FL1/2hPl0FjRpWbXiL
 lC8O3mIiGD24qMRgCC0jI/VIo4uW0aICl4pXBNGprg5ypNzrrYdo5ui50dYzCRmXLa
 JLVgLgjoXBcwJA2/20BZi2Gg0g82FN/ScjIRmv8ehQVzD/7GoJdPKqXGlKnwl52bd/
 n8hk7q8hK0tP0giaONfhW5UGDifEkXnaGUrwzaftRP8QLtFtCTC7HzkTLReFyupNcF
 iPDiLMtMSbRGA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 04 Aug 2021 21:58:51 +0200
Date: Wed, 4 Aug 2021 21:58:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210804195851.GI27036@scaer>
References: <20210803164442.169821-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803164442.169821-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/sysdig: fix C++ comment
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-03 18:44 +0200, Fabrice Fontaine spake thusly:
> Replace libjson by jsoncpp for C++ dependency which was wrongly added
> by commit 74fc60a267341879ca71f8eaa64a80f5b5aaf78b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sysdig/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index 7d3c570392..06d20c7f7b 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_SYSDIG
>  	bool "sysdig"
>  	depends on BR2_LINUX_KERNEL
> -	depends on BR2_INSTALL_LIBSTDCPP # libjson
> +	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, jq
>  	depends on !BR2_STATIC_LIBS # elfutils
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
