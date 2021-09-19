Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40ACCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:56:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DBDE60FF2
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DBDE60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4971740533;
	Sun, 19 Sep 2021 08:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lIZqWGrgnzan; Sun, 19 Sep 2021 08:56:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A73F34052B;
	Sun, 19 Sep 2021 08:56:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 314E71BF842
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E29882FA9
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id alatYo6UxIcO for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 08:56:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C00B80EE5
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 08:56:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id F2D99200390;
 Sun, 19 Sep 2021 10:56:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632041808;
 bh=N+kCTmf5rD/pbMecmU7gp5LAH6U+jWKP7jZrXeEB7JY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YRvWvrlJy8mAvRTazPMOSr8F4JBGVkEkwogiU8QgfozY70uV7lIwxf8lsG+IFA2WW
 t8apuV4TE7SZVxJ0EeCdeea5dzovfbvy3J1irQwPyx0YIBEr5LUr162RApk4I5+4bw
 KHFYVb3T3zqbAK27jBgrvFMGYaZWorEuXhha2SfmbkwUfov43lTbvzRjSUa4seh/m7
 E7nGb1QVSxju0VZ7ppgKmDR86Xjt6iU1jo3LvaSowOKmiA/j9V4A9APU9hRslomIQy
 xDC9ROdpmB5BYgR/ni/SB4qAfW0h1EJsBacVEzqF+zDUrkb7d8JyGQzVocO3DlOUoD
 7etBZP6NGj5IA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 10:56:41 +0200
Date: Sun, 19 Sep 2021 10:56:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210919085641.GL1053080@scaer>
References: <20210919083606.1607325-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210919083606.1607325-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/wayland-protocols: add host-wayland dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-19 10:36 +0200, Fabrice Fontaine spake thusly:
> host-wayland is needed to avoid the following build failure raised since
> bump to version 1.23 in commit 7eedc9cc1e0c3cce1c18cb150157cb2346075b23:
> 
> Build-time dependency wayland-scanner found: NO (tried pkgconfig and cmake)
> 
> ../output-1/build/wayland-protocols-1.23/meson.build:11:0: ERROR: Dependency "wayland-scanner" not found, tried pkgconfig and cmake
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2744e50465a9cd9d3726d23298ad6c943ef49a21
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

So, you were too fast respinning this. ;-) I was looking at the code for
wayland-protocols, and wayland-scanner is only needed for the tests:

    $ grep -r dep_scanner .
    ./tests/meson.build:prog_scanner = find_program(dep_scanner.get_pkgconfig_variable('wayland_scanner'))
    ./meson.build:dep_scanner = dependency('wayland-scanner', native: true)

And we explicitly disable tests, so it would be too bad to add a
dependency for something that is not used...

Probably, we should patch it out, like:

    --- meson.build.orig	2021-09-19 10:54:11.685408228 +0200
    +++ meson.build	2021-09-19 10:54:13.321430159 +0200
    @@ -8,8 +8,6 @@
     
     fs = import('fs')
     
    -dep_scanner = dependency('wayland-scanner', native: true)
    -
     stable_protocols = [
     	'presentation-time',
     	'viewporter',
    @@ -116,5 +114,6 @@
     meson.override_dependency('wayland-protocols', wayland_protocols)
     
     if get_option('tests')
    +	dep_scanner = dependency('wayland-scanner', native: true)
     	subdir('tests')
     endif

Can you look into that?

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Use host-wayland dependency instead of wayland
> 
>  package/wayland-protocols/wayland-protocols.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
> index 41ab1e1c99..ea1639ea2d 100644
> --- a/package/wayland-protocols/wayland-protocols.mk
> +++ b/package/wayland-protocols/wayland-protocols.mk
> @@ -11,6 +11,7 @@ WAYLAND_PROTOCOLS_LICENSE = MIT
>  WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
>  WAYLAND_PROTOCOLS_INSTALL_STAGING = YES
>  WAYLAND_PROTOCOLS_INSTALL_TARGET = NO
> +WAYLAND_PROTOCOLS_DEPENDENCIES = host-wayland
>  
>  WAYLAND_PROTOCOLS_CONF_OPTS = -Dtests=false
>  
> -- 
> 2.33.0
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
