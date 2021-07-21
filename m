Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54065C6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:19:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5E716121E
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5E716121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A657140289;
	Wed, 21 Jul 2021 20:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NllF7DpZSvwT; Wed, 21 Jul 2021 20:19:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B007402E3;
	Wed, 21 Jul 2021 20:19:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 315ED1BF38E
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D5BC40134
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mq3LHear-41x for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:19:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEA8B400E1
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 20:19:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AD13FFF805;
 Wed, 21 Jul 2021 20:19:21 +0000 (UTC)
Date: Wed, 21 Jul 2021 22:19:20 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20210721221920.635a5667@windsurf>
In-Reply-To: <20210615005923.51837-1-charles.hardin@chargepoint.com>
References: <20210615005923.51837-1-charles.hardin@chargepoint.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-plugins: add new package
 alsa-plugins version 1.2.5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Charles,

On Mon, 14 Jun 2021 17:59:23 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> From: Charles Hardin <ckhardin@gmail.com>
> 
> During testing of bluez-alsa in particular, there is no compilation
> dependency - but, some configurations against boards will request
> the load of a particular plugin:
> 
>     ALSA lib dlmisc.c:337:(snd_dlobj_cache_get0) \
>       Cannot open shared library libasound_module_rate_samplerate_best.so \
>       (/usr/lib/alsa-lib/libasound_module_rate_samplerate_best.so: \
>        cannot open shared object file: No such file or directory)
> 
> Adding in the alsa-plugins package will build the appropriate dlobject
> for loading and configuration.
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

Thanks for your patch. I have applied, but after doing a number of
changes, see below for the details.

First of all, alsa-plugins 1.2.5 did not build against alsa-lib 1.2.4,
as it uses a new API that only appeared in alsa-lib 1.2.5, so I'm not
sure how you could have built alsa-plugins 1.2.5. So as a preparation
patch I have bumped alsa-lib to 1.2.5.1.

>  package/Config.in                      |  1 +
>  package/alsa-plugins/Config.in         |  8 ++++++++
>  package/alsa-plugins/alsa-plugins.hash |  4 ++++
>  package/alsa-plugins/alsa-plugins.mk   | 23 +++++++++++++++++++++++
>  4 files changed, 36 insertions(+)

You forgot to add an entry in the DEVELOPERS file.

> diff --git a/package/alsa-plugins/Config.in b/package/alsa-plugins/Config.in
> new file mode 100644
> index 0000000000..44aaa7997c
> --- /dev/null
> +++ b/package/alsa-plugins/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_ALSA_PLUGINS
> +	bool "alsa-plugins"
> +	depends on BR2_PACKAGE_ALSA_LIB

	select BR2_PACKAGE_ALSA_LIB_HWDEP

was missing.

> +	select BR2_PACKAGE_LIBSAMPLERATE

This is not needed: libsamplerate is not a mandatory dependency.

> diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
> new file mode 100644
> index 0000000000..70d3cdb87c
> --- /dev/null
> +++ b/package/alsa-plugins/alsa-plugins.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# alsa-plugins
> +#
> +#############################################################

The formatting of this comment was not matching our coding style: make
sure to use "make check-package" when you create a new package.

> +ALSA_PLUGINS_VERSION = 1.2.5
> +ALSA_PLUGINS_SOURCE = alsa-plugins-$(ALSA_PLUGINS_VERSION).tar.bz2
> +ALSA_PLUGINS_SITE = https://www.alsa-project.org/files/pub/plugins
> +ALSA_PLUGINS_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (samplerate)
> +ALSA_PLUGINS_LICENSE_FILES = COPYING COPYING.GPL
> +ALSA_PLUGINS_INSTALL_STAGING = NO

This was not needed as it's the default.

> +ALSA_PLUGINS_AUTORECONF = YES

Not needed, there is an already generate configure script in the
tarball.

> +ALSA_PLUGINS_DEPENDENCIES = alsa-lib libsamplerate
> +
> +ALSA_PLUGINS_CONF_OPTS += \
> +	--enable-samplerate \
> +	--disable-jack \
> +	--disable-usbstream \
> +	--disable-pulseaudio \
> +	--disable-avcodec \
> +	--with-speex=builtin

Then the major change was to make the libsamplerate dependency
optional, as such:

+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+ALSA_PLUGINS_CONF_OPTS += --enable-samplerate
+ALSA_PLUGINS_DEPENDENCIES += libsamplerate
+ALSA_PLUGINS_LICENSE += , GPL-2.0+ (samplerate plugin)
+ALSA_PLUGINS_LICENSE_FILES += COPYING.GPL
+else
+ALSA_PLUGINS_CONF_OPTS += --disable-samplerate
+endif

And also I adjusted the list of options to disable a few other things,
or differently.

See the final commit at
https://git.buildroot.org/buildroot/commit/?id=e85bde9cc672fc228eeb079e23ef302468ae3826

If there are build failures on alsa-plugins, you will receive an
e-mail, and it would be nice if you could investigate those build
failures and submit patches fixing them.

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
