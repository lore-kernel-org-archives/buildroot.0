Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C09C6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 21:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A6F660A96;
	Tue,  2 Apr 2024 21:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jbF9jnYn3n3; Tue,  2 Apr 2024 21:27:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BEF360BDE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BEF360BDE;
	Tue,  2 Apr 2024 21:27:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2ACC1BF295
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF330607A8
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twLe2WkV4FwF for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 21:27:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EB256066D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB256066D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EB256066D
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 21:27:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 20B9F13F81D;
 Tue,  2 Apr 2024 23:26:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 02 Apr 2024 23:26:56 +0200
Date: Tue, 2 Apr 2024 23:26:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zgx4IOIypDz52cD8@landeda>
References: <20240402052617.153655-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240402052617.153655-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712093219;
 bh=AL0no9VdcrJ1liWDiux3mLwU5YYTKkXOcZgHe9zSa3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M49e2/UVTYG+vAvgdHXdG7i33LqLNCyXlfedxiCj2YwsoknQTfyFMhTtVxGq9KeJi
 19D/V869qGV+nbVbEDYCH9tKQ0HQ/Udtfo1xFWbkYGz5U/QwKmjT1V2PjpBQTWacWp
 ZfmZhDeBAq2+WgUJixOflLBBlQaRMZi4rh1WmmrxfOfF+uUgXNylVtaBUA6gE+iV6b
 zkKKi5N3sCGrvYF0lm0Pa7xBzQhBK1ihfOm0XmSntey0rcJcMWiM2zeYaVGdu0xTsJ
 lUGG3Y7+iYvIh+ltBgHWRmWP0gnlos/+4HawDPX84iwuzP+GQBj0b/yaNu4FWMWyww
 ucOrCCxvJdYbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=M49e2/UV
Subject: Re: [Buildroot] [PATCH 1/1] package/screen: fix build with glibc
 2.39
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-04-01 23:26 -0600, James Hilliard spake thusly:
> When glibc was bumped to version 2.39 in commit
> b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
> libcrypt support.
> 
> As glibc's libcrypt was providing screen's libcrypt dependency this
> broke any screen build using glibc version 2.39.
> 
> To fix this select the libxcrypt dependency for screen when using a
> glibc toolchain and add the dependency if selected.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/screen/Config.in | 1 +
>  package/screen/screen.mk | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/screen/Config.in b/package/screen/Config.in
> index ee4c04ca9e..40cda77b50 100644
> --- a/package/screen/Config.in
> +++ b/package/screen/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_SCREEN
>  	bool "screen"
>  	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_NCURSES
>  	help
>  	  Screen is a full-screen window manager that multiplexes a
> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> index d4052b1191..55fecb89bc 100644
> --- a/package/screen/screen.mk
> +++ b/package/screen/screen.mk
> @@ -16,6 +16,10 @@ SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
>  SCREEN_CONF_OPTS = --enable-colors256
>  SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
>  
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +SCREEN_DEPENDENCIES += libxcrypt
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>  SCREEN_DEPENDENCIES += linux-pam
>  SCREEN_CONF_OPTS += --enable-pam
> -- 
> 2.34.1
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
