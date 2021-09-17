Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B2DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 21:33:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ABF2610E9
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 21:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4ABF2610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C33F407E3;
	Fri, 17 Sep 2021 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ihCZSfRUzVS; Fri, 17 Sep 2021 21:33:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFC4E407D9;
	Fri, 17 Sep 2021 21:33:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 315B21C1135
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 21:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E2A86F69A
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 21:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d2hcaX_2Ovzo for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 21:33:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18AD96F8AC
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 21:33:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4db3:5a06:f3b2:1f85])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5E9125FF20;
 Fri, 17 Sep 2021 23:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631914402;
 bh=Ao+n9mybndL2OuHFFlvTWaQ2qt60+p09/XwZ0MypOJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OgDuY+PqhcvyvtbsnSlRjP2sJc0ixZvXOtoZuhFDUnaVO81HMtXvzvxbddrzQcXi9
 uTWZ6A17qKWz9i/P+7xyGdJpTHtkRoDIhXcYbFTlwIV9ydR5DMdNLAH+VhtItBfTa6
 mV/PCe/09Jzaz5nK3pGEwuYVClG8iWUm8xh/tYe/sP+MWOtk52LB0pBJj/6OHQuxR6
 WNStRKhXmWfpXzO6x6yjjf1a8GJoKagsuPoquphhrUyog1TaZ+Q/I08ULBc2qerxsX
 5h48inkt72toczSOx246ShdCIuQ6qLxyLokmosuuyeYbwADBWbPEphJpYkuB1UjGNP
 qkHEbXW9Is6fw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 23:33:17 +0200
Date: Fri, 17 Sep 2021 23:33:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bartosz Bilas <b.bilas@grinn-global.com>
Message-ID: <20210917213317.GA1053080@scaer>
References: <20210917205254.30134-1-b.bilas@grinn-global.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210917205254.30134-1-b.bilas@grinn-global.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH]  boot/barebox: bump version to 2021.08.0
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

Bartosz, All,

On 2021-09-17 22:52 +0200, Bartosz Bilas spake thusly:
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/barebox/Config.in    | 4 ++--
>  boot/barebox/barebox.hash | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index af4c1f816c..71c855bb60 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -12,7 +12,7 @@ choice
>  	  Select the specific Barebox version you want to use
>  
>  config BR2_TARGET_BAREBOX_LATEST_VERSION
> -	bool "2021.07.0"
> +	bool "2021.08.0"
>  
>  config BR2_TARGET_BAREBOX_CUSTOM_VERSION
>  	bool "Custom version"
> @@ -40,7 +40,7 @@ endif
>  
>  config BR2_TARGET_BAREBOX_VERSION
>  	string
> -	default "2021.07.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
> +	default "2021.08.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
>  	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
>  	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
>  	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
> diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
> index a82edef63b..34d34eece2 100644
> --- a/boot/barebox/barebox.hash
> +++ b/boot/barebox/barebox.hash
> @@ -1,8 +1,8 @@
> -# From https://www.barebox.org/download/barebox-2021.07.0.tar.bz2.md5
> -md5  df3651a395e1420c2818dd464c63069d  barebox-2021.07.0.tar.bz2
> +# From https://www.barebox.org/download/barebox-2021.08.0.tar.bz2.md5
> +md5  eddcd7bc7e9d3836f0d68e3abce210ec  barebox-2021.08.0.tar.bz2
>  
>  # Locally calculated
> -sha256  ce5d9d8953a2e3c21f1e6a72b1499962170bb41c4750ce8129ef44bf7860992d  barebox-2021.07.0.tar.bz2
> +sha256  6b29f2f23d1b0c279f2ee680dcf29900c3d85367fbb107038f54b577d8a616dc  barebox-2021.08.0.tar.bz2
>  
>  # License files, locally computed
>  sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
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
