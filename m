Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EBBC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 16:02:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C94561288
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 16:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C94561288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5452381987;
	Fri, 20 Aug 2021 16:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yvW2WjN_pyrp; Fri, 20 Aug 2021 16:01:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3B1181A16;
	Fri, 20 Aug 2021 16:01:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA0171BF2B0
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 16:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D58FB40105
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 16:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIUc41KR_gTl for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 16:01:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 520F4406CD
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 16:01:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:fd65:b012:ebca:84c0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 887C25FFA3;
 Fri, 20 Aug 2021 18:01:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629475306;
 bh=0GpQ3NP6DjCBcvquWFrV29+3ATaj2AXgtT4x2RxYhvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DwsGFGXk6RyYmIZSwNaivMiFZDndayHmL6o3twJ6IraOx6g9FMLqcaKSwVTzdEfqt
 HKBvv7blcLgQbnmN+lQrB0b5/mTWFIyan/rYTtIUq14Qg9HczvftsdTPHpyepp1o5x
 BVidmarcKrr5LwXxD4b2Qb3GMKsoFLcTRLUxEEKbIH5U9bZSqqUp7RE/tqu0jO/a0F
 jEVpYNlFzk0hBaUwvgd/b21bEtGk+lsaDKdg+1NTV6Pfes0btl4k/RTyIDDR7VWYdw
 oqeKj9ZhJNBO3LxFsrHUhklZ/PTwwllYayvIX828ePt20/v0oarF9AVCMOTRvlK4mq
 i+t7/YxLTrLMQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 20 Aug 2021 18:01:42 +0200
Date: Fri, 20 Aug 2021 18:01:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Titouan Christophe <titouanchristophe@gmail.com>
Message-ID: <20210820160142.GQ27036@scaer>
References: <20210820101747.193382-1-titouanchristophe@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210820101747.193382-1-titouanchristophe@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libvirt: fix syntax error in
 Config.in
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Titouan, All,

On 2021-08-20 12:17 +0200, Titouan Christophe spake thusly:
> The typo was introduced in 6aa318d91e66731d66dca485c4c30391fe0e2423

I double- and triple-checked the truth table of the condition, but it
was obviously too late for me to at least try a menuconfig before
pushing (actually I tried, but my vim buffer was not saved, so the
menuconfig succeeded, *before* my change, meh...)

> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

Applied to master, thanks for fixing my mess!

Regards,
Yann E. MORIN.

> ---
>  package/libvirt/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> index 9308d2a6ac..8c3021242a 100644
> --- a/package/libvirt/Config.in
> +++ b/package/libvirt/Config.in
> @@ -9,7 +9,7 @@ comment "libvirt needs udev /dev management, a toolchain w/ threads, dynamic lib
>  	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
>  	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || !BR2_USE_MMU || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || \
> -		!(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 &&
> +		!(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 && \
>  		  (BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64))
>  
>  config BR2_PACKAGE_LIBVIRT
> -- 
> 2.32.0
> 

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
