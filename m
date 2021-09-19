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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8781C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:33:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84C8A60FBF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84C8A60FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C725400D1;
	Sun, 19 Sep 2021 07:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JGCUwHwMYF-9; Sun, 19 Sep 2021 07:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D34F40182;
	Sun, 19 Sep 2021 07:33:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 768E41BF314
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DE8140182
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qyf6K_KkjUhG for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:33:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDF4B400D1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:33:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 82BD22003CE;
 Sun, 19 Sep 2021 09:33:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632036807;
 bh=oG+zer4oaaUDjay2CVH4GRTVKQVCSt94oGMwcq5I4Gg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t4uvFQkU9s43q5wS7NOTCc2nw6OPdiUGdTWH2QqiwKUymDgK7IVx+Daqa2Dj65+Gm
 tCxrRe6Kf8YwgX7VuCEY9ayvKkHUv50NSFGNPHOt2OGEQZyhn54aqr4OrcfK24fLdU
 zaZFswbOBuEmFLbzDqAWOjfFPXvbPCeGgNKau7jBSFS5OuB13KVV1IHVsuaLZRZ3hg
 D8JlreVSGST5/zvu3dMgcBDf4DpSMYAaJXD5LWkpglDdvtE93EwDYg9Vhn0WJDl1Gw
 Ty6snMjc3/gjfHGCItY/BugnV4lhuerJlKv8bk12Q2ucDAJPUoCZLgnzsbivxTJ70V
 pMS2PHu/Su4KQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 09:33:19 +0200
Date: Sun, 19 Sep 2021 09:33:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20210919073319.GG1053080@scaer>
References: <20210918203023.24093-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210918203023.24093-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/modem-manager: bump to version
 1.18.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Yegor, All,

On 2021-09-18 22:30 +0200, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> This release introduces meson build system support.

No, the release itself does not introduce meson buildsystem support:

> As meson files are only available in git, switch the location to
> https://gitlab.freedesktop.org.

as you say, the support for meson is only in git, and not part of the
released tarball. As such, I don't think it should be considered usable,
so we should not use ir.

When upstream does an actual release that contains the meson stuff, then
we can consider switching over. Until then, I think we should stick to
using the buildsystem in the released tarball, autotools.

Regards,
Yann E. MORIN.

> Add support for bash-completion.
> 
> dbus is now a build-time dependency.
> 
> Also add support for systemd and polkit and disable the manpage
> generation.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/modem-manager/Config.in          |  2 +-
>  package/modem-manager/modem-manager.hash |  2 +-
>  package/modem-manager/modem-manager.mk   | 50 +++++++++++++++++-------
>  3 files changed, 38 insertions(+), 16 deletions(-)
> 
> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> index c4c723776d..d211d68ee1 100644
> --- a/package/modem-manager/Config.in
> +++ b/package/modem-manager/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_MODEM_MANAGER
>  	depends on BR2_USE_WCHAR # libglib2 and gnutls
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>  	depends on BR2_USE_MMU # dbus
> -	select BR2_PACKAGE_DBUS # runtime dependency
> +	select BR2_PACKAGE_DBUS
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
>  	help
> diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
> index 14597215df..fb0ddec4a5 100644
> --- a/package/modem-manager/modem-manager.hash
> +++ b/package/modem-manager/modem-manager.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  2ccf1f716c2d121e8e6709bcf8af29ee86971a90adacca2e8d6288b30278862e  ModemManager-1.16.10.tar.xz
> +sha256  79e83f7082d02e72a5c5e7fdf9b67bd3dd71da0da3d02607dee76ae06b9d4aa9  ModemManager-1.18.2.tar.bz2
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index a881edc272..7a7bd3bb4c 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -4,42 +4,64 @@
>  #
>  ################################################################################
>  
> -MODEM_MANAGER_VERSION = 1.16.10
> -MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
> -MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
> +MODEM_MANAGER_VERSION = 1.18.2
> +MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.bz2
> +MODEM_MANAGER_SITE = https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/archive/$(MODEM_MANAGER_VERSION)
>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
>  MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
>  MODEM_MANAGER_SELINUX_MODULES = modemmanager
> -MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
> +MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 dbus $(TARGET_NLS_DEPENDENCIES)
>  MODEM_MANAGER_INSTALL_STAGING = YES
> -MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
> +
> +MODEM_MANAGER_CONF_OPTS = -Dman=false
>  
>  ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
>  MODEM_MANAGER_DEPENDENCIES += libqmi
> -MODEM_MANAGER_CONF_OPTS += --with-qmi
> +MODEM_MANAGER_CONF_OPTS += -Dqmi=enabled
> +else
> +MODEM_MANAGER_CONF_OPTS += -Dqmi=disabled
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +MODEM_MANAGER_DEPENDENCIES += systemd
> +MODEM_MANAGER_CONF_OPTS += -Dsystemd_suspend_resume=true -Dsystemd_journal=true
> +else
> +MODEM_MANAGER_CONF_OPTS += -Dsystemdsystemunitdir=no -Dsystemd_suspend_resume=false -Dsystemd_journal=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_POLKIT),y)
> +MODEM_MANAGER_DEPENDENCIES += polkit
> +MODEM_MANAGER_CONF_OPTS += -Dpolkit=strict
>  else
> -MODEM_MANAGER_CONF_OPTS += --without-qmi
> +MODEM_MANAGER_CONF_OPTS += -Dpolkit=no
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
>  MODEM_MANAGER_DEPENDENCIES += libgudev
> -MODEM_MANAGER_CONF_OPTS += --with-udev
> +MODEM_MANAGER_CONF_OPTS += -Dudev=enabled
>  else
> -MODEM_MANAGER_CONF_OPTS += --without-udev
> +MODEM_MANAGER_CONF_OPTS += -Dudev=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
>  MODEM_MANAGER_DEPENDENCIES += libmbim
> -MODEM_MANAGER_CONF_OPTS += --with-mbim
> +MODEM_MANAGER_CONF_OPTS += -Dmbim=enabled
>  else
> -MODEM_MANAGER_CONF_OPTS += --without-mbim
> +MODEM_MANAGER_CONF_OPTS += -Dmbim=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>  MODEM_MANAGER_DEPENDENCIES += gobject-introspection
> -MODEM_MANAGER_CONF_OPTS += --enable-introspection
> +MODEM_MANAGER_CONF_OPTS += -Dintrospection=enabled
> +else
> +MODEM_MANAGER_CONF_OPTS += -Dintrospection=disabled
> +endif
> +
> +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> +MODEM_MANAGER_DEPENDENCIES += bash-completion
> +MODEM_MANAGER_CONF_OPTS += -Dbash_completion=true
>  else
> -MODEM_MANAGER_CONF_OPTS += --disable-introspection
> +MODEM_MANAGER_CONF_OPTS += -Dbash_completion=false
>  endif
>  
>  define MODEM_MANAGER_INSTALL_INIT_SYSV
> @@ -47,4 +69,4 @@ define MODEM_MANAGER_INSTALL_INIT_SYSV
>  		$(TARGET_DIR)/etc/init.d/S44modem-manager
>  endef
>  
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> -- 
> 2.17.0
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
