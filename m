Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4D1C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 10:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3763F40698;
	Sun, 16 Jun 2024 10:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0-Q2Z45H5be; Sun, 16 Jun 2024 10:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AA0240681
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AA0240681;
	Sun, 16 Jun 2024 10:36:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 904E61BF31B
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79C8940681
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjnwoUyi3dTn for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 10:36:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 157504067F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 157504067F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 157504067F
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 10:36:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A3AEC13F8A7;
 Sun, 16 Jun 2024 12:36:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Jun 2024 12:36:09 +0200
Date: Sun, 16 Jun 2024 12:36:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: lancethepants <lancethepants@gmail.com>
Message-ID: <Zm7AGV6zIzfbVtm7@landeda>
References: <20240613134451.3523957-1-lancethepants@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613134451.3523957-1-lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718534173;
 bh=FCm0LKCfgjvxhTW5tcHCwLmwdjCgYWHIZYbqmpGZrG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f0BZTAkQzUkucU663126M5zlDo25ITMGfDsp2OpIcjiaHeBdaOWulEPf+ptjFsf2i
 zGXBGVbjz9aN8goF2xUkYI/EglV2hGwEUzPL3qUIkvrlLZbSSO6CviYXHUgQy8hmy3
 zb9YKyXqOXSqrMHLVwpks7ESggck9nRcG6dlGTKwBwf4ryXgWiVycmfZRytyubBlxx
 8nLl1FPpQ/PqlUyiMb/m8uaL+WplfyzL39jhIOsVMPW9VLGoZvajRZJvq6TjQARq/b
 5U7vJ0IpZEaA47ZyZSMFBD+1xlynWteq6EoSWa13KK3Drr7AMO91Dcx4JXd7+4Kxvk
 axmr3Dj2qwXXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=f0BZTAkQ
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: Add additional
 firmware fo Intel iwlwifi 9xxx
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Lance, All,

On 2024-06-13 07:44 -0600, lancethepants spake thusly:
> Intel Wireless-AC 9560 looks for iwlwifi-so-a0-jf-b0-*.ucode.
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>

The authorship (i.e. the From of the email) does not match the SoB line;
they both should be identical, meaning the author signed off their work.

In this case, the email address was the same in both case, juts the
human-readable part was missing in the From, so I took the liberty of
fixing the authroship when applying the patch.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-firmware/linux-firmware.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 8dcd57fb7c..13dbc6d98c 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -583,6 +583,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_9XXX),y)
>  LINUX_FIRMWARE_FILES += iwlwifi-9???-*.ucode
> +LINUX_FIRMWARE_FILES += iwlwifi-so-a0-jf-b0*.ucode
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
>  endif
>  
> -- 
> 2.39.2
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
