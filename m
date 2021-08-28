Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CD3C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 16:04:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5695D60E8B
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 16:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5695D60E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 191B340319;
	Sat, 28 Aug 2021 16:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6bEeIYNLHa0; Sat, 28 Aug 2021 16:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9442C4032C;
	Sat, 28 Aug 2021 16:04:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D0851BF3C9
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 16:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B8CB6069A
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 16:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4l8Q7E2yjET3 for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 16:04:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADC4C605CE
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 16:04:14 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d26so15469962wrc.0
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 09:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C+RSEEgK4jQMBJQfCQlKKNFnw13XVn4AfTfgwiUqnZc=;
 b=aV5NGSRTynKK8mxaCkl0pk2QOIu7HkNm50+twBNGNN4/79fEHCOIARbIOZz8I3MXXc
 I3xfEgx+DRFqcM8pwEmgTCFVoYb0XNk9adm4HlifHjJ4d4p2lXfDu/eINxTotXqf/5RL
 m5rmW5LBxAA1BOCHinms/ONRQZCqeOW6awcNrNab0mrO92UL24n5jxllYNJ8q81ORU5P
 kIA+uohJbNBHKXUCrsVAvEOu9t7//L8HwcJcmlW0cqI9bvNi2oWvGnHc/TYaxsgb3A1P
 n6yGgdQqG+FRNEv15SwXoS7Zp68w0jewu91EEzXN22gd15gz3s1rYCERfOfmNlmWGAH0
 QzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=C+RSEEgK4jQMBJQfCQlKKNFnw13XVn4AfTfgwiUqnZc=;
 b=ev6TKJ/f9Fo2IwDJ7jXpIcXcEvdK9bLQyX7WgSb9G29BYnB9sp8t1ORMYeAaWgbjUz
 owm6q9bcfXmK3xovULX/g2thNEWq2QC48Q+tVXyam5+4nXYCIwwuoK711kI1G5AiJSnj
 K47NjmAGGfa6h6OnoCnhAIu8jUKYkY4JoURe7MYUUgBVBZl0LFUDufj9EcAYH1yEy3If
 OvzV74Qe4pwUHLZ73AzYBpm13FwpkjyusMiK8tHdSv4AnkHQE9P3bYv6V5wyAms/nmkx
 bSyei1Lpzj6MVJ7+cA3c19U47huQR0AcQoa+ENiow5rZ9lGqo9Hxgovy6zvQoneH9F0U
 9h3Q==
X-Gm-Message-State: AOAM530K8YnphlJY5ppyJmh3TXZU5oFE2p2YURTzhdBXpx6vAMn6fLS+
 1FWumzSlIeKyxp5VR/GJg9a0lU4d2rEhXQ==
X-Google-Smtp-Source: ABdhPJzVhg8w2udIRhaptIfX8CLuPY5GcCEXcq2AjwxTNGRCo6PD2vppXKpBDVGQ+NRmwuHqvA0giw==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr16338358wrz.369.1630166652854; 
 Sat, 28 Aug 2021 09:04:12 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id l19sm1341306wmj.34.2021.08.28.09.04.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 09:04:12 -0700 (PDT)
To: yegorslists@googlemail.com, buildroot@buildroot.org
References: <20210826140258.8435-1-yegorslists@googlemail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <5d26145a-c414-cd64-4a1e-5503cde22b91@mind.be>
Date: Sat, 28 Aug 2021 18:04:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826140258.8435-1-yegorslists@googlemail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v4] package/libqmi: bump to version 1.30.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 26/08/2021 16:02, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> This release introduces meson build system support.
> 
> As meson files are only available in git, switch the location to
> https://gitlab.freedesktop.org.
> 
> Add support for bash-completion.
> 
> Add an upstream patch fixing the compilation without gobject-intorspection.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

 Applied to next, thanks.

 Regards,
 Arnout


> ---
> Changes v1 -> v2:
>   - add a patch fixing the compilation without gobject-intorspection (Aleksander Morgado)
> Changes v2 -> v3:
>   - rebase against next branch (Thomas Petazzoni)
> Changes v3 -> v4:
>   - remove comments about the build fixing in the commit log (Thomas Petazzoni)
> 
>  ...build-meson-fix-introspection-option.patch | 33 +++++++++++++++++
>  package/libqmi/libqmi.hash                    |  2 +-
>  package/libqmi/libqmi.mk                      | 37 ++++++++++++-------
>  3 files changed, 58 insertions(+), 14 deletions(-)
>  create mode 100644 package/libqmi/0001-build-meson-fix-introspection-option.patch
> 
> diff --git a/package/libqmi/0001-build-meson-fix-introspection-option.patch b/package/libqmi/0001-build-meson-fix-introspection-option.patch
> new file mode 100644
> index 0000000000..0528868025
> --- /dev/null
> +++ b/package/libqmi/0001-build-meson-fix-introspection-option.patch
> @@ -0,0 +1,33 @@
> +From bfb066419f288764edbade1e27e93a5dda59a5f4 Mon Sep 17 00:00:00 2001
> +From: Aleksander Morgado <aleksander@aleksander.es>
> +Date: Fri, 6 Aug 2021 10:32:22 +0200
> +Subject: [PATCH] build,meson: fix introspection option
> +
> +Using -Dintrospection=false would actually not disable it. There is no
> +longer an "auto" option for the introspection support, it will be
> +either enabled or disabled depending on what the user asks
> +for (default enabled).
> +
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + meson.build | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index b25bca57..d28e5601 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -218,7 +218,10 @@ version_conf.set10('QMI_QRTR_SUPPORTED', enable_qrtr)
> + version_conf.set10('QMI_RMNET_SUPPORTED', enable_rmnet)
> +
> + # introspection support
> +-enable_gir = dependency('gobject-introspection-1.0', version: '>= 0.9.6', required: get_option('introspection')).found()
> ++enable_gir = get_option('introspection')
> ++if enable_gir
> ++  dependency('gobject-introspection-1.0', version: '>= 0.9.6')
> ++endif
> +
> + random_number = qmi_minor_version + meson.version().split('.').get(1).to_int()
> +
> +--
> +2.17.0
> diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
> index 0bfc63f4a4..0373bb4e75 100644
> --- a/package/libqmi/libqmi.hash
> +++ b/package/libqmi/libqmi.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> -sha256  cbb890893de1dee06ea5ebdac2d22f0469314a6f93f15f61f2f1206a1c9ae5fd  libqmi-1.28.6.tar.xz
> +sha256  c0421684c12697c448077dd5c0a66c6f745deab3558af578e3f10307c8a0c564  libqmi-1.30.0.tar.gz
> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> index 35a41e5bd0..05fd3ae9af 100644
> --- a/package/libqmi/libqmi.mk
> +++ b/package/libqmi/libqmi.mk
> @@ -4,9 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBQMI_VERSION = 1.28.6
> -LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
> -LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
> +LIBQMI_VERSION = 1.30.0
> +LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
>  LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
>  LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
>  LIBQMI_CPE_ID_VENDOR = libqmi_project
> @@ -14,40 +13,52 @@ LIBQMI_INSTALL_STAGING = YES
>  
>  LIBQMI_DEPENDENCIES = libglib2
>  
> -LIBQMI_CONF_OPTS = --disable-Werror
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +LIBQMI_DEPENDENCIES += gobject-introspection
> +LIBQMI_CONF_OPTS += -Dintrospection=true
> +else
> +LIBQMI_CONF_OPTS += -Dintrospection=false
> +endif
>  
>  # if libgudev available, request udev support for a better
>  # qmi-firmware-update experience
>  ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
>  LIBQMI_DEPENDENCIES += libgudev
> -LIBQMI_CONF_OPTS += --with-udev
> +LIBQMI_CONF_OPTS += -Dudev=true
>  else
> -LIBQMI_CONF_OPTS += --without-udev
> +LIBQMI_CONF_OPTS += -Dudev=false
>  endif
>  
>  # if libmbim available, request QMI-over-MBIM support
>  ifeq ($(BR2_PACKAGE_LIBMBIM),y)
>  LIBQMI_DEPENDENCIES += libmbim
> -LIBQMI_CONF_OPTS += --enable-mbim-qmux
> +LIBQMI_CONF_OPTS += -Dmbim_qmux=true
>  else
> -LIBQMI_CONF_OPTS += --disable-mbim-qmux
> +LIBQMI_CONF_OPTS += -Dmbim_qmux=false
>  endif
>  
>  # if libqrtr-glib available, enable support for QMI over QRTR
>  ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
>  LIBQMI_DEPENDENCIES += libqrtr-glib
> -LIBQMI_CONF_OPTS += --enable-qrtr
> +LIBQMI_CONF_OPTS += -Dqrtr=true
>  else
> -LIBQMI_CONF_OPTS += --disable-qrtr
> +LIBQMI_CONF_OPTS += -Dqrtr=false
>  endif
>  
>  # if ModemManager available, enable MM runtime check in
>  # qmi-firmware-update (note that we don't need to build-depend on
>  # anything else)
>  ifeq ($(BR2_PACKAGE_MODEM_MANAGER),y)
> -LIBQMI_CONF_OPTS += --enable-mm-runtime-check
> +LIBQMI_CONF_OPTS += -Dmm_runtime_check=true
> +else
> +LIBQMI_CONF_OPTS += -Dmm_runtime_check=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> +LIBQMI_DEPENDENCIES += bash-completion
> +LIBQMI_CONF_OPTS += -Dbash_completion=true
>  else
> -LIBQMI_CONF_OPTS += --disable-mm-runtime-check
> +LIBQMI_CONF_OPTS += -Dbash_completion=false
>  endif
>  
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
