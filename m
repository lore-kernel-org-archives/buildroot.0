Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DEAC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 09:50:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FD326113C
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 09:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FD326113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E976A40466;
	Sat,  7 Aug 2021 09:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ECXAUurB4fN; Sat,  7 Aug 2021 09:50:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 509D440458;
	Sat,  7 Aug 2021 09:50:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 228E51BF5E0
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 09:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 117728340C
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 09:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Yumq3_SVY_u for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 09:50:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7D6D82C04
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 09:50:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f16c:16be:6f47:5c9a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2EF9913F87F;
 Sat,  7 Aug 2021 11:50:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628329824;
 bh=VT+SoMEu15AHsfnTQfWtsnHICzO3tkwNpYdDZIiNN98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O138Q0yNIluZiDUZBGN6/9X3DynracNTvNK38Hlx3IkDYw5sjWHpBnQa87L8dRTyc
 eoOPaij4tLvMQoGoWymBtWLMphPNsVF0HNPisSLF2qXh9o9JgRzd2oB0BqfiJ0okQW
 JaLqYu37cTlmZ+okVPo55gzGfZoom3i/X3A2wzHOjj6sg6IxUzjbbvThDL4eEg7/TK
 iqDoTtUrE3eJaswwRPqgq7dxudtisk97V93LpSH6UK7skFIo/4G3mJteEciHhYr8UJ
 xBbIYvRBVACk4fgCWZjgAEtp5zrCwbVvEE78I2WuQ14D86+6gDIVZNP27to1lQT2zk
 BQJgAo3Nw8qzg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 11:50:19 +0200
Date: Sat, 7 Aug 2021 11:50:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210807095019.GZ27036@scaer>
References: <20210806100256.3448996-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806100256.3448996-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libesmtp: requires DES support
 in openssl
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

Fabrice, All,

On 2021-08-06 12:02 +0200, Fabrice Fontaine spake thusly:
> Enable DES in openssl to fix build failure raised since bump to version
> 1.1.0 in commit b72401692e1ea73a37fcf4c0b421b654e8a2100f
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/52bce321552d23c10617c4ba4dc5b290e1d43dd5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libesmtp/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
> index 5c6a412134..c631d127e0 100644
> --- a/package/libesmtp/Config.in
> +++ b/package/libesmtp/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LIBESMTP
>  	bool "libesmtp"
>  	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>  	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  Library for sending emails through SMTP.
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
