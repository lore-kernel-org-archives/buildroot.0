Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB4DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 09:27:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69EFE6108F
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 09:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69EFE6108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 267D4824DC;
	Sun, 12 Sep 2021 09:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9ZU3K6MIXZN; Sun, 12 Sep 2021 09:27:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DCFF82496;
	Sun, 12 Sep 2021 09:27:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15BBF1BF47E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 09:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11B1640542
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 09:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id imo7AeLIV2Pc for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 09:27:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC9CE40506
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 09:27:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bc3c:8ee4:eb9c:c13b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 5865E20039C;
 Sun, 12 Sep 2021 11:27:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631438845;
 bh=N8Tjt7wAwKTkC/aJI9FJEk0IZDFuJodVJpRTczej3w4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KzcB+rgVbxaPpA7BnT6oj7txIzWHi6mgqsFJU3QYTAOb17F8tZFqMrkZLKDRwzQq3
 piFCb5AhlwZ/cFxZSjBRC6ThCq2BPau8ju46gybWImLqBs1FZ2g3j9bsnN6kWzk42b
 I72l0IRPbdZYhKZhQ9A29xJXLOyfPGeOWTRZ4ztMZ+Y7mPbU7NArhFXMM9uz0lv6cl
 9KPA80c47poFg7LJCnRr7TyhPUOIbZxgO9U37/seZI4VEUm22hnK7zwFDPJ5uq79fb
 jLuGRpBAStGnIa43fNXxjddkqBi1iZfVsHQUPPobIGVBPOLSTnwW0Ev5xl7U5jWV0K
 8wbJ9wnw+7dcA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Sep 2021 11:27:21 +0200
Date: Sun, 12 Sep 2021 11:27:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210912092721.GD1053080@scaer>
References: <20210912091136.1048360-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912091136.1048360-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: disable raw with
 kernel >= 5.14
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-12 11:11 +0200, Fabrice Fontaine spake thusly:
> raw has been dropped from kernel since version 5.14 and
> https://github.com/torvalds/linux/commit/603e4922f1c81fc2ed3a87b4f91a8d3aafc7e093
> resulting in the following build failure:
> 
> configure: error: raw selected, but required raw.h header file not available
> 
> https://github.com/karelzak/util-linux/issues/1442
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d009d663a7c3c75872b19a92d3eadd3ecee2df63
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/util-linux/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index 1f33eb5514..f045361ab5 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -291,9 +291,13 @@ config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
>  
>  config BR2_PACKAGE_UTIL_LINUX_RAW
>  	bool "raw"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
>  	help
>  	  Build a linux raw character device
>  
> +comment "raw needs a toolchain w/ headers < 5.14"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
> +
>  config BR2_PACKAGE_UTIL_LINUX_RENAME
>  	bool "rename"
>  	help
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
