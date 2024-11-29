Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CDFD6EC05
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 12:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5451080DAF;
	Fri, 29 Nov 2024 12:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M73zlNGtxHUL; Fri, 29 Nov 2024 12:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6876380DF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6876380DF0;
	Fri, 29 Nov 2024 12:39:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AB3871F
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 12:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 486E180DAF
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 12:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QRiAu7mS_kfP for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 12:39:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43B2580D9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43B2580D9A
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43B2580D9A
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 12:39:45 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 54705440F29;
 Fri, 29 Nov 2024 14:35:51 +0200 (IST)
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,  Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20241129111156.629528-1-fido_max@inbox.ru> (Maxim Kochetkov via
 buildroot's message of "Fri, 29 Nov 2024 14:11:56 +0300")
References: <20241129111156.629528-1-fido_max@inbox.ru>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 29 Nov 2024 14:39:41 +0200
Message-ID: <87ed2u6woi.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1732883751;
 bh=BhUdzWO0bxi12VKUa7s9+hopT4GOyXQKEc6tnEZu2bQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EW5BO0XOBFFvQpyNUaY9qPB8k8o9rHnaPs/72FoU54QLB6xp4LBIccl080C/5H6SL
 n2YRbv4dNjZ8Fm7gw9+kTyELK+OzII2YSw1TrUNcnnHKfIbR9JrJd6RKnnsaG+CQOV
 NqTlLGRdnxcdQgiREb/qKcmewqDn6YEhItBOPNBR4f3HMEOeQmLzwcYy0zgk1sKIjL
 IsqpC9xBwussyeUXcqsrFltyUHEqiHJT1lxpG/w8JRrZEVnJzpKhkxIu239iEApzT8
 V1WCtOiTYuEyfi4Sw0KDeMTSgKSIx0mCwmxOvwi5aS5dnxYAHomeflDg8ttwKzQ0/I
 APczc5zRyuHSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=EW5BO0XO
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-lib: add BR2_USE_MMU
 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxim,

On Fri, Nov 29 2024, Maxim Kochetkov via buildroot wrote:
> Build fails with:
> ucm_exec.c: In function 'uc_mgr_exec':
> ucm_exec.c:229:13: error: implicit declaration of function 'fork' [-Wimplicit-function-declaration]
>   229 |         p = fork();
>       |             ^~~~
>
> ucm uses fork() so add BR2_USE_MMU dependency for it.
>
> Fixes: https://autobuild.buildroot.org/results/a287d3eef7ea5ea9a85b5b35d14e3698df4ecd01/build-end.log
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/alsa-lib/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
> index 447916a29f..98b61896d4 100644
> --- a/package/alsa-lib/Config.in
> +++ b/package/alsa-lib/Config.in
> @@ -69,8 +69,12 @@ config BR2_PACKAGE_ALSA_LIB_SEQ
>  config BR2_PACKAGE_ALSA_LIB_UCM
>  	bool "ucm"
>  	default y
> +	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_ALSA_LIB_MIXER
>  
> +comment "ucm needs a toolchain w/ fork support"
> +	depends on !BR2_USE_MMU
> +

BR2_USE_MMU describes the target platform. This is not a toolchain
option user can change. For this reason we don't add comments for this
dependency.

See section 18.2.4 in the Buildroot manual:

  https://buildroot.org/downloads/manual/manual.html

baruch

>  config BR2_PACKAGE_ALSA_LIB_ALISP
>  	bool "alisp"
>  	default y

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
