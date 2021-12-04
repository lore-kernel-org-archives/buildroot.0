Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE82C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 20:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC3F7403D9;
	Sat,  4 Dec 2021 20:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2DMIrJSXX9u; Sat,  4 Dec 2021 20:33:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0844401F6;
	Sat,  4 Dec 2021 20:33:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 334471BF861
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 235F083F0E
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NzEoE0FyDJZ7 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 20:33:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4CE283F0D
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 20:33:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 37EA7200002;
 Sat,  4 Dec 2021 20:33:25 +0000 (UTC)
Date: Sat, 4 Dec 2021 21:33:24 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211204213324.100dab45@windsurf>
In-Reply-To: <20211201093727.67883-1-james.hilliard1@gmail.com>
References: <20211201093727.67883-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.32.12
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Wed,  1 Dec 2021 02:37:27 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate autotools build system to meson.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Why is the migration to meson tied to the version bump? The current
version of network-manager packaged in Buildroot, 1.32.2, already has
the meson build infrastructure. So really the bump to 1.32.12 has
nothing to do with the meson migration it seems.


>  NETWORK_MANAGER_VERSION_MAJOR = 1.32
> -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
> +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
>  NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>  NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>  NETWORK_MANAGER_INSTALL_STAGING = YES
> -NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
> +NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus gnutls libglib2 \

Why is dbus now a build-time dependency?

>  NETWORK_MANAGER_CONF_OPTS = \
> -	--disable-introspection \
> -	--disable-tests \
> -	--disable-qt \
> -	--disable-more-warnings \
> -	--with-crypto=gnutls \
> -	--with-iptables=/usr/sbin/iptables \
> -	--disable-ifupdown \
> -	--without-nm-cloud-setup
> +	-Ddocs=false \
> +	-Dtests=no \

Sometimes "false", sometimes "no", is this logical?

> +ifeq ($(BR2_PACKAGE_IWD),y)
> +NETWORK_MANAGER_DEPENDENCIES += iwd
> +NETWORK_MANAGER_CONF_OPTS += -Diwd=true
> +else
> +NETWORK_MANAGER_CONF_OPTS += -Diwd=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +NETWORK_MANAGER_DEPENDENCIES += audit
> +NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=yes
> +else
> +NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=no

Ditto. Is there a reason why it's sometimes yes/no and sometimes
true/false?


> +ifeq ($(BR2_PACKAGE_POLKIT),y)
> +NETWORK_MANAGER_DEPENDENCIES += polkit
> +NETWORK_MANAGER_CONF_OPTS += -Dpolkit=true
> +else
> +NETWORK_MANAGER_CONF_OPTS += -Dpolkit=false
> +endif

Is the polkit optional dependency new in 1.32.12 ? If not, it should be
a separate commit.

> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +NETWORK_MANAGER_DEPENDENCIES += systemd
> +NETWORK_MANAGER_CONF_OPTS += \
> +	-Dsystemd_journal=true \
> +	-Dconfig_logging_backend_default=journal \
> +	-Dsession_tracking=systemd \
> +	-Dsuspend_resume=systemd
>  else
> -NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
> +NETWORK_MANAGER_CONF_OPTS += \
> +	-Dsystemd_journal=false \
> +	-Dconfig_logging_backend_default=syslog \
> +	-Dsession_tracking=no \
> +	-Dsuspend_resume=upower

This whole systemd logic also seems new, is it related to the version
bump?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
