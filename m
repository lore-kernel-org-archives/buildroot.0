Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D80C19F21
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 11:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E51B607D1;
	Wed, 27 Jul 2022 11:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E51B607D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQ71SajIhWjL; Wed, 27 Jul 2022 11:10:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C93960A7B;
	Wed, 27 Jul 2022 11:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C93960A7B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A8161BF46D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAD9380B5F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAD9380B5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGbIpTN5cfob for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 11:08:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F2FC81257
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F2FC81257
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:08:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id bn9so12802173wrb.9
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 04:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lDgRq4QQl1ikwHH/tLidgKVCr5QTk10451soqFXpuik=;
 b=65yqRaBHg4H0kVOQFNtbkr17rnoD3yLzuQ3qIPPlzohkv/V7YrCh/kwY7WWRzSY7ov
 28Ub65zXsEdpvxf49KyiY9MUdNTfsWD+yBWEwYDtO6f9TcM8rQdDGrxt9M1BiRnBe1Sw
 iebu9diz9IB1OuwrgSeDwRbpSMskwUFvURqlFb40fm/Ha5z66sjEWpZUFR+rhtaba/no
 GPDuE1YMRHmIVwpmjPbx49Mk5UlAvZ16+fibNWO2B4Ua3hKPCwq7GfnPFHZuePoYHkHU
 eKkTXIdkT9+V313Jm90xWihou/GdQ+aMUa9KKCcJz8hqZOcNMEq/eU7+MwjdoQ0CGHLG
 R24Q==
X-Gm-Message-State: AJIora/ojPYzub6dzwLbGxNgpCVCiGj+Aip7nZLWR2IhAETUm7UeWk7/
 bdqSwiQ4r96g+KhfSZsUx0otjA==
X-Google-Smtp-Source: AGRyM1tdVwWjzpfb04+LgA3cU/9zojuZnK2nwZJopD+vi3YhGVZ0hshH3bNiFUDpc5IywoW7rJt/rA==
X-Received: by 2002:adf:ec02:0:b0:21e:8e67:d0f9 with SMTP id
 x2-20020adfec02000000b0021e8e67d0f9mr8357386wrn.114.1658920120633; 
 Wed, 27 Jul 2022 04:08:40 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a5d4305000000b0021ec503075fsm1980059wrq.31.2022.07.27.04.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 04:08:40 -0700 (PDT)
Message-ID: <2288ff34-d140-a1a0-3f8e-86baf04f4dee@mind.be>
Date: Wed, 27 Jul 2022 12:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
References: <20220109221650.777610-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109221650.777610-1-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lDgRq4QQl1ikwHH/tLidgKVCr5QTk10451soqFXpuik=;
 b=TNf/CxkAzvEtBR7yHjwB9EE6qyw7TV6jzoLJVFKS4mGYJE2e7Llv4f//RE/q1JLELl
 5T4Kq+q9y99FYhUBHYEXtMDVjDcsjw2zC+lmnZEmV4wCB2Y3136gbx9EjOH9UpuHVH3W
 jKJrxxdiypyUH+UiiTfKPcI+uBO8Y7How5U5R/kgZg4AHiXtOAOZ76a62ZH+EFYY5Xs/
 gh31uCX+a5NEtmEsoFs0Kc8DBiLCucvNQ3EYZzQ/5JamUK4djNHXnkfetuxKQisiCLso
 jZsaTfd+S7+1HweiZlsvwrAzWwlngkGahChTWg8ucOD0VrNaFqKdjWZIV0CVZrjBMgBG
 exKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TNf/CxkA
Subject: Re: [Buildroot] [PATCH v6 1/4] package/dbus-broker: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Norbert, Yann,

  As usual, apologies for taking so long to review this. It's because it's a bit 
complicated. I actually tried to look at it just after our hackaton in January 
but it was too complicated to quickly get my head around.

On 09/01/2022 23:16, Norbert Lange wrote:
> dbus-broker is an alternate implementation of a dbus dameon. It can be
> used as a drop-in replacement for the system bus daemon, as well as the
> session bus daemon.
> 
> dbus-broker is (basically, and as far as we're concerned in Buildroot)
> split in two components:
> 
>    - the actual message bus daemon, that relays messages across clients
> 
>    - a launcher, which is responsible for setting various aspects of the
>      bus, like setting the policy et al. and opening the socket(s) the
>      message bus daemon will have to listen on...
> 
> The launcher can only be used in a systemd setup (it makes heavy use of
> systemd facilities), while the message bus is generic. However, the
> message bus daemon is useless without a launcher. There does not exist a
> non-systemd launcher, which makes dbus-broker actually a systemd-only
> package; this can be revisited when/if a non-systemd launcher appears.
> 
> Note, however, that libdbus is not provided by dbus-borker. People who
> want to use dbus-broker as the bus daemon, and need libdbus, will have
> to enable both, see below.
> 
> There are two cases:
> 
>   1. original dbus disabled
> 
>      Here, we install the config files and systemd socket activation
>      units; dbus-broker provides the system and sessions bus daemons.
> 
>      In this case, libdbus is not available.
> 
>   2. original dbus enabled
> 
>      In this case, we do not install the config files and systemd socket
>      activation units, or define a user: they all are provided by the
>      original dbus, and we piggy-back on those.
> 
>      In this situation, the default system and sessions message bus are
>      the original dbus, and libdbus is available; dbus-broker is not
>      enabled.
> 
>      So far, we believe it would be over-engineered to provide a way
>      to allow choosing the bus daemon in the configuraiton. However,
>      users may opt-in to use dbus-broker in a few ways:
>        - at build-time: by calling systemctl enable/disable from a
>          post-build script (preferred), or by providing drop-in units
>          or presets in an overlay (less preferred) or custom skeleton
>          (as a last resort),
>        - at runtime (on a RW filesystem): by calling systemctl
>          enable/disable

  I don't know... To me it seems logical that if both are enabled, that you use 
dbus-broker for the bus and only use original dbus for libdbus.

  So to me the proper approach seems to change dbus itself so the daemon is 
optional, i.e. only libdbus is installed if the daemon is not enabled, similar 
to e.g. libcurl. BR2_PACKAGE_DBUS_DAEMON should default to y because that's what 
most people want. We'd have to go through existing packages to check if they 
depend on libdbus or on the daemon - mostly it will be the first. If there is a 
package that really needs the daemon (I don't actually think so), then we might 
need to introduce a virtual package for the daemon. Regardless, dbus-broker 
should depend on !BR2_PACKAGE_DBUS_DAEMON.


> Note about the user: the path to the system bus socket is a so-called
> "well-known location": it is expected to be there, by spec. Moving it
> elsewhere is going to break existing programs. So, the user running the
> system bus daemon must be able to create that socket.
> 
> As we may have two packages providing a system bus daemon, they have to
> be both able to create the socket, and thus must both be able to write
> in the directory containing the socket. And since they can be switched
> at runtime, they must be running as the same user.
> 
> We can't just reference the original dbus user, so we duplicate the
> entry. What is important, is that the user be named 'dbus', as that's
> what we use in both cases.

  If it's a virtual package, then the user could be created by the virtual 
package itself.


> Finally, the licensing terms are pretty trivial for dbus-broker itself,
> but it makes use of third-party code that it inherits as git submodules
> (that are bundled in the release archive). 

  Ugh, bundling...

> Thus the licensing is a bit
> convoluted... The third-party codes claim to be licensed as "Apache-2.0
> and LGP-2.1+" in their AUTHORS files, but at the same time claim
> "**Apache-2.0** OR **LGPL-2.1-or-later**" in their README files. The
> individual source files (that are used) do not seem to have any
> licensing header to clarify the situation. So we represent the situation
> with "Apache-2.0 and/or LGPL-2.1+".

  That's rather f**d than convoluted :-)

> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> [yann.morin.1998@free.fr:
>    - don't select systemd; depend on it instead
>    - only install config files and systemd units without original dbus
>    - install a user to run the message bus as
>    - fix licensing info
>    - entirely reword and extend the commit log
>    - add myself to DEVELOPERS as well
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

[snip]
> diff --git a/package/dbus-broker/Config.in b/package/dbus-broker/Config.in
> new file mode 100644
> index 0000000000..c7206232da
> --- /dev/null
> +++ b/package/dbus-broker/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_DBUS_BROKER
> +	bool "dbus-broker"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
> +	depends on BR2_PACKAGE_SYSTEMD
> +	select BR2_PACKAGE_EXPAT
> +	help
> +	  Linux D-Bus Message Broker.
> +
> +	  The dbus-broker project is an implementation of a message bus
> +	  as defined by the D-Bus specification. Its aim is to provide
> +	  high performance and reliability, while keeping compatibility
> +	  to the D-Bus reference implementation.
> +
> +	  It is exclusively written for Linux systems, and makes use of
> +	  many modern features provided by recent linux kernel releases.
> +
> +	  https://github.com/bus1/dbus-broker/wiki
> +
> +comment "dbusbroker needs systemd and a toolchain w/ threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_SYSTEMD

  It's a nitpick, but: I think since dbus-broker is so tightly integrated with 
systemd, there's no point really to show the comment if systemd is not enabled.

> diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
> new file mode 100644
> index 0000000000..26ebab7ac1
> --- /dev/null
> +++ b/package/dbus-broker/dbus-broker.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  4eca425db52b7ab1027153e93fea9b3f11759db9e93ffbf88759b73ddfb8026a  dbus-broker-29.tar.xz
> +sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
> diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
> new file mode 100644
> index 0000000000..547b79eb84
> --- /dev/null
> +++ b/package/dbus-broker/dbus-broker.mk
> @@ -0,0 +1,71 @@
> +################################################################################
> +#
> +# dbus-broker
> +#
> +################################################################################
> +
> +DBUS_BROKER_VERSION = 29

  By now we're at 31 already.

  The new version uses meson's wrapgit feature instead of submodules, but 
fortunately the release tarball still include them.

> +DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
> +DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
> +
> +# For the third-party code, the licensing legla-info is inconsistent between
> +# the AUTHORS and README, so keep both
> +DBUS_BROKER_LICENSE = \
> +	Apache-2.0, \
> +	Apache-2.0 and/or LGPL-2.1+ (c-dvar, c-ini, c-list, c-rbtree, c-shquote, c-stdaux, c-utf8)
> +DBUS_BROKER_LICENSE_FILES = \
> +	LICENSE \
> +	subprojects/c-dvar/AUTHORS subprojects/c-dvar/README.md \
> +	subprojects/c-ini/AUTHORS subprojects/c-ini/README.md \
> +	subprojects/c-list/AUTHORS subprojects/c-list/README.md \
> +	subprojects/c-rbtree/AUTHORS subprojects/c-rbtree/README.md \
> +	subprojects/c-shquote/AUTHORS subprojects/c-shquote/README.md \
> +	subprojects/c-stdaux/AUTHORS subprojects/c-stdaux/README.md \
> +	subprojects/c-utf8/AUTHORS subprojects/c-utf8/README.md
> +
> +DBUS_BROKER_DEPENDENCIES = expat systemd
> +DBUS_BROKER_CONF_OPTS = -Dlauncher=true
> +
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +DBUS_BROKER_DEPENDENCIES += audit
> +DBUS_BROKER_CONF_OPTS += -Daudit=true
> +else
> +DBUS_BROKER_CONF_OPTS += -Daudit=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +DBUS_BROKER_DEPENDENCIES += libselinux
> +DBUS_BROKER_CONF_OPTS += -Dselinux=true
> +else
> +DBUS_BROKER_CONF_OPTS += -Dselinux=false
> +endif
> +
> +# We must be using the same user as the original dbus, so we can share
> +# the home directory and create a socket there. As a consequence, the
> +# username and groupname must be dbus:dbus, and they both need to have
> +# the same home.
> +define DBUS_BROKER_USERS
> +	dbus -1 dbus -1 * /run/dbus - dbus DBus messagebus user
> +endef
> +
> +# Only install units for system bus daemon socket if original dbus is not present
> +# Only install config and service files if original dbus is not present
> +#
> +# Note: BR2_COREUTILS_HOST_DEPENDENCY to be able to use ln --relative
> +ifeq ($(BR2_PACKAGE_DBUS),)
> +DBUS_BROKER_DEPENDENCIES += $(BR2_COREUTILS_HOST_DEPENDENCY)
> +
> +define DBUS_BROKER_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/session.conf \
> +		$(TARGET_DIR)/usr/share/dbus-1/session.conf
> +	$(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/system.conf \
> +		$(TARGET_DIR)/usr/share/dbus-1/system.conf
> +	$(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/dbus.socket \
> +		$(TARGET_DIR)/usr/lib/systemd/system/dbus.socket

  I'm surprised that these files either isn't needed for original dbus, or that 
it's included in original dbus but not in dbus-broker...

> +	$(HOST_MAKE_ENV) ln -sf --relative \
> +		$(TARGET_DIR)/usr/lib/systemd/system/dbus.socket \
> +		$(TARGET_DIR)/usr/lib/systemd/system/sockets.target.wants/dbus.socket

  Is it really useful too include the coreutils dependency and HOST_MAKE_ENV, 
just to avoid having to put

	ln -sf ../dbus-socket \
		$(TARGET_DIR)/usr/lib/systemd/system/sockets.target.wants/dbus.socket


  I'm going to work more on and hopefully merge this series later today. I have 
some local changes already (spelling mistakes), so please don't resend just yet.

  Regards,
  Arnout


> +endef
> +endif # !BR2_PACKAGE_DBUS
> +
> +$(eval $(meson-package))

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
