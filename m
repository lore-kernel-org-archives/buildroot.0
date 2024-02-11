Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DF8C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 09:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66DC140291;
	Sun, 11 Feb 2024 09:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ha1FBRbih8_w; Sun, 11 Feb 2024 09:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10483402E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10483402E5;
	Sun, 11 Feb 2024 09:38:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48A7A1BF3C6
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 09:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35E9F82784
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 09:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-iaiqfTOWEZ for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 09:38:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C48482778
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C48482778
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C48482778
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 09:38:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0FBBA13F8B5;
 Sun, 11 Feb 2024 10:38:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Feb 2024 10:38:43 +0100
Date: Sun, 11 Feb 2024 10:38:43 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZciVo-rjrUTfwtsF@landeda>
References: <20240210222659.805747-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240210222659.805747-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707644327;
 bh=SbysmTDQdzXD7P14A+1fTVhiGsp2FhH+yCqxsCTYq2I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eDopNn2JnwWy5+xjUS+05CBovO61+uSa7h0dB0MTS0gyYurlPfz7E8CeieJ7ri7xY
 eiWCRHLoSioujI06/xEtjd1PTsZSoJaAdodFPaD6NYX52fIJ/LL/LxW0j+hM6mEzi5
 ECCDIsaCcWYqVjZgaG4+OMfWM2BYLr/If2YXq+emNFs68b2Cye8aBNtrQTpJUO5CPM
 j4/RmgBJfQXqMgRo0/cxBegulmQJhjppYN3FlqAu5FTT0qDYMXZl0thqKlF/s+Lm6z
 ARdt6SkGVFTdp4ossvY9++P6j31CWOmfRLgM+sDzC3ShU12kdB2N5tXyyIRKdbKPYm
 cW5nzPTwf4Y8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eDopNn2J
Subject: Re: [Buildroot] [PATCH 1/1] package/jailhouse: install files to /usr
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
Cc: Carlo Caione <carlo.caione@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2024-02-10 23:26 +0100, Julien Olivain spake thusly:
> The jailhouse package installs files in the /usr/local prefix. This is
> not convenient, because the jailhouse binary ends up in /usr/local/sbin,
> which is not in the default Buildroot PATH. See [1]. Moreover, all
> other Buildroot packages install files in /usr.
> 
> This is because the Buildroot package recipe does not set any prefix
> value, and the upstream Jailhouse Makefile has a default to /usr/local.
> See [2].
> 
> This commit sets the prefix value in the JAILHOUSE_MAKE_OPTS and also
> updates other installation commands to put all the files in /usr.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/blob/2023.11.1/system/Config.in#L495
> [2] https://github.com/siemens/jailhouse/blob/v0.12/scripts/include.mk#L22
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/jailhouse/jailhouse.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
> index c239e75e76..e7de40cf8c 100644
> --- a/package/jailhouse/jailhouse.mk
> +++ b/package/jailhouse/jailhouse.mk
> @@ -15,7 +15,8 @@ JAILHOUSE_MAKE_OPTS = \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
>  	ARCH="$(KERNEL_ARCH)" \
>  	KDIR="$(LINUX_DIR)" \
> -	DESTDIR="$(TARGET_DIR)"
> +	DESTDIR="$(TARGET_DIR)" \
> +	prefix=/usr
>  
>  ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
>  JAILHOUSE_DEPENDENCIES += \
> @@ -60,8 +61,8 @@ define JAILHOUSE_INSTALL_TARGET_CMDS
>  	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/jailhouse
>  	$(INSTALL) -D -m 0644 $(@D)/configs/*/*.cell $(TARGET_DIR)/etc/jailhouse
>  
> -	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/local/libexec/jailhouse/demos
> -	$(INSTALL) -D -m 0755 $(@D)/inmates/demos/*/*.bin $(TARGET_DIR)/usr/local/libexec/jailhouse/demos
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/libexec/jailhouse/demos
> +	$(INSTALL) -D -m 0755 $(@D)/inmates/demos/*/*.bin $(TARGET_DIR)/usr/libexec/jailhouse/demos
>  
>  	$(JAILHOUSE_INSTALL_HELPER_SCRIPTS)
>  endef
> -- 
> 2.43.0
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
