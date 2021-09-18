Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8838EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:54:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2317E61283
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2317E61283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCAD5415E8;
	Sat, 18 Sep 2021 15:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmdgt2L95R4z; Sat, 18 Sep 2021 15:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 077FD40204;
	Sat, 18 Sep 2021 15:54:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 890BD1BF964
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73B5140204
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpF_I7HVNe5O for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:54:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB04640202
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:54:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AE259B0057C;
 Sat, 18 Sep 2021 17:54:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631980466;
 bh=qBI+ISItMH7mvyypw+AJUkjmv8erqsT1yO2PS2P2fyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iaSca6MKCK1x5MYMMsiBkB7MaZ1TCLGBP2AqRkM4eqxclCOi5O67FTrr6dzlpwhd1
 uX8U4yT5l+7c09sFieQUKp4Xmkai/oaI5dHA7bFuTPLWH0vId5v4053/Blcj4OgqNO
 MyvIfrVcj7ETdO7WDnXKlyoaK2IFeQdN51HLHA2eoVnEIkBjDWwVYSZUM4U0sumpDO
 75MN5VBCxXHAN8qkOXgZiAhPfVpfBM96ersv24xIU5JAX8de/NV/Nkkp4TrLVqu1kr
 ylhUi5YAsWpnsUdLvms7cI5vdIZwO8BQeV+GRq4yjqj+8DD2YDcg6HJBr7Wx+Y3NgK
 k5Z8CnTZdlUwQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 17:54:19 +0200
Date: Sat, 18 Sep 2021 17:54:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20210918155419.GD1053080@scaer>
References: <20210915000423.1521236-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210915000423.1521236-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gstreamer1/gstd: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

James, All,

On 2021-09-14 18:04 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch b/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch
> new file mode 100644
> index 0000000000..18498a90e9
> --- /dev/null
> +++ b/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch
> @@ -0,0 +1,70 @@
> +From 325699be7119312d8a910e624e35c6fb089404c8 Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Tue, 14 Sep 2021 02:49:10 -0600
> +Subject: [PATCH] Use relative symlink for gstd/gst-client exe.
> +
> +This should fix the symlink path when cross compiling.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[Upstream status:
> +https://github.com/RidgeRun/gstd-1.x/pull/249]
> +---
> + gst_client/gst_client_symbolic_link.sh | 2 +-
> + gst_client/meson.build                 | 4 ++--
> + gstd/gstd_symbolic_link.sh             | 2 +-
> + gstd/meson.build                       | 2 +-
> + 4 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/gst_client/gst_client_symbolic_link.sh b/gst_client/gst_client_symbolic_link.sh
> +index d8d7617..9e85694 100755
> +--- a/gst_client/gst_client_symbolic_link.sh
> ++++ b/gst_client/gst_client_symbolic_link.sh
> +@@ -4,4 +4,4 @@
> + # $1: target
> + # $2: link name
> + rm -f ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
> +-ln -s ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
> ++ln -s ./$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2

As I suggested in your upstream PR [0], why not using:

    ln -s --relative ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2

and then for Buildroot, add $(BR2_COREUTILS_HOST_DEPENDENCY) in
GSTD_DEPENDENCIES.

[0] https://github.com/RidgeRun/gstd-1.x/pull/249#discussion_r711606110

[--SNIP--]
> +diff --git a/gstd/gstd_symbolic_link.sh b/gstd/gstd_symbolic_link.sh
> +index d8d7617..9e85694 100755
> +--- a/gstd/gstd_symbolic_link.sh
> ++++ b/gstd/gstd_symbolic_link.sh
> +@@ -4,4 +4,4 @@
> + # $1: target
> + # $2: link name
> + rm -f ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
> +-ln -s ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
> ++ln -s ./$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2

Ditto, use:  ln --relative

[--SNIP--]
> diff --git a/package/gstreamer1/gstd/Config.in b/package/gstreamer1/gstd/Config.in
> new file mode 100644
> index 0000000000..3f73dbd1c4
> --- /dev/null
> +++ b/package/gstreamer1/gstd/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_GSTD
> +	bool "gstd"
> +	depends on BR2_USE_WCHAR # libglib2 -> gettext, libsoup
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libsoup
> +	depends on BR2_USE_MMU # libdaemon, libglib2
> +	select BR2_PACKAGE_JANSSON
> +	select BR2_PACKAGE_JSON_GLIB
> +	select BR2_PACKAGE_LIBDAEMON
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBSOUP
> +	select BR2_PACKAGE_READLINE
> +	help
> +	  GStreamer Daemon, also called gstd, is a GStreamer framework for
> +	  controlling audio and video streaming using an InterProcess
> +	  Communication protocol
> +
> +	  https://developer.ridgerun.com/wiki/index.php?title=GStreamer_Daemon

    $ make check-package
    package/gstreamer1/gstd/Config.in:13: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Regards,
Yann E. MORIN.

> diff --git a/package/gstreamer1/gstd/gstd.hash b/package/gstreamer1/gstd/gstd.hash
> new file mode 100644
> index 0000000000..6ec84bd58d
> --- /dev/null
> +++ b/package/gstreamer1/gstd/gstd.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  94c10c798d3618b63cc68cbe053fabd19335a57f982a47b3d66c27c37d325da3  gstd-0.13.0.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
> new file mode 100644
> index 0000000000..2e785853cd
> --- /dev/null
> +++ b/package/gstreamer1/gstd/gstd.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# gstd
> +#
> +################################################################################
> +
> +GSTD_VERSION = 0.13.0
> +GSTD_SITE = $(call github,RidgeRun,gstd-1.x,v$(GSTD_VERSION))
> +GSTD_LICENSE_FILES = COPYING
> +GSTD_LICENSE = GPL-2.0+
> +
> +GSTD_DEPENDENCIES = \
> +	gstreamer1 \
> +	jansson \
> +	json-glib \
> +	libdaemon \
> +	libglib2 \
> +	libsoup \
> +	readline
> +
> +GSTD_CONF_OPTS += \
> +	-Denable-tests=disabled \
> +	-Denable-examples=disabled \
> +	-Denable-gtk-doc=false \
> +	-Dwith-gstd-runstatedir=/var/run/gstd \
> +	-Dwith-gstd-logstatedir=/var/log/gstd \
> +	-Dwith-gstd-systemddir=/usr/lib/systemd/system
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +GSTD_CONF_OPTS += -Denable-systemd=enabled -Denable-initd=disabled
> +GSTD_DEPENDENCIES += systemd
> +else
> +GSTD_CONF_OPTS += -Denable-systemd=disabled -Denable-initd=enabled
> +endif
> +
> +$(eval $(meson-package))
> -- 
> 2.25.1
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
