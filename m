Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100E9C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 12:44:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D9D1600D1
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 12:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D9D1600D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA084427D2;
	Sat, 28 Aug 2021 12:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfCs_LJO1Yef; Sat, 28 Aug 2021 12:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7873B42818;
	Sat, 28 Aug 2021 12:44:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 655771BF319
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 12:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D47642818
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 12:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gph5mmi5cfth for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 12:44:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 011F2427D2
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 12:44:05 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso11166822wmg.4
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G85EuLzT4XdWCeAU2OV5s2D6PNDXE3cTbv1BScEDchY=;
 b=Nfd0rJO/HOI8+/dHJJmV9Km5VW4WV9RWquz9psaLTHJ/m7nXHHdUNXS67WaiKm3Sj8
 IF0zV3ANPgTz1eYXD8d691h8sbJb7Qf+WwNFVVSBYkSXda2V5RZcxKxn1TY8AT5Od1Cx
 Ie+zEjD4czpnR+Mrf5MOCEWA4O9IcNl6qY/sUI1P69IICW/ARDW7bZUBLwnhZotO+Gy9
 q2S1dxHu2TZIIfW+EZ34MDpTwCkJZfMB9fkyVDj+S1zIGgIx91j+9mky8Thw9IfNc7rM
 emcTjXwpfXSBXOSpe1BXtjfedDbQKJu0IgDZnZJETkbPYcYoL0SUM8ivQPFrrIvQa1XU
 /Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=G85EuLzT4XdWCeAU2OV5s2D6PNDXE3cTbv1BScEDchY=;
 b=AXC7VezwQ43L+NnEsdauYLoBzYE8xXG4Qb7YWC1gG5vPUNpbKq02c3G9l161xMSLjQ
 gLpGk269SBrrQPmzFT/9pVxWyxocKNyWnHaLiMw61wnzZGE4l/9LCR/Os+GLHATApXdJ
 6F6aEuRsgOrrfuYHITSzj1oExc40C2M97pJKrsWSP8BJ+0wNYYuyBbvSbPkphn5WEHZo
 N9v5MjlHR8X0LfMGkKFMd/L6E5iJoVOHhYm7xKXfDOrj9Xve7FHr/OMxU+qs/0isrBk2
 IrWmVYDed7X0vm8jLU80gqHrVSouKKqN7cAnyZLJORrkyw0S7fuZbtf/NWjKsnV9hCKG
 AXdw==
X-Gm-Message-State: AOAM5336kHwlfPsJQFcuENzm9vGU1jNHzK3FGrPaue9KmlQJDMJuPghx
 tNw1YZgXCLuBZdkU1leZZyuZsv9NheBDUA==
X-Google-Smtp-Source: ABdhPJzRujTwI3g1t0MWu4hS5asU3ZhBDIKNx++/yIvNtqDy1zNtuG4tBpcu7ndodqTrnaCsHj2Faw==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr6688829wml.143.1630154643930; 
 Sat, 28 Aug 2021 05:44:03 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id r20sm9752281wrr.47.2021.08.28.05.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 05:44:03 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210828044626.3170348-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <48045f87-380b-6f11-95a4-7fc6e7520936@mind.be>
Date: Sat, 28 Aug 2021 14:44:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210828044626.3170348-1-james.hilliard1@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: update service/init
 configs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

 Hi James,

 "update" in the subject is not really helpful.

On 28/08/2021 06:46, James Hilliard wrote:
> Set SKIP_STRIP=y so that the swupdate binary isn't stripped.

 We can see that from the patch - instead you should explain why we want to skip
strip.

 Also, this has nothing to do with systemd configs, so should be a separate patch.

 In this case for sure, because I think it might be something for master.


> Introduce BR2_PACKAGE_SWUPDATE_WEBSERVER so that we can control
> the required webserver config installation when enabled.

 This also should be a separate patch (though less important in this case).


> Ensure swupdate systemd support is always set based on buildroot
> using systemd as this is required for the systemd services.
> 
> Use swupdate's make install so that we install swupdate tools needed
> for services.
> 
> Adapted from:
> https://github.com/sbabic/meta-swupdate/tree/abc520d97482232302046459715845a025aca7d6/recipes-support/swupdate/swupdate
> https://github.com/sbabic/meta-swupdate/blob/abc520d97482232302046459715845a025aca7d6/recipes-support/swupdate/swupdate.inc
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/swupdate/10-mongoose-args          |  1 +
>  package/swupdate/90-start-progress         |  1 +
>  package/swupdate/Config.in                 |  7 ++++
>  package/swupdate/swupdate-progress.service |  9 +++++
>  package/swupdate/swupdate-usb.rules        |  2 +
>  package/swupdate/swupdate-usb@.service     |  8 ++++
>  package/swupdate/swupdate.mk               | 43 +++++++++++++++++++---
>  package/swupdate/swupdate.socket           | 11 ++++++
>  package/swupdate/tmpfiles-swupdate.conf    |  2 +
>  9 files changed, 79 insertions(+), 5 deletions(-)
>  create mode 100644 package/swupdate/10-mongoose-args
>  create mode 100644 package/swupdate/90-start-progress
>  create mode 100644 package/swupdate/swupdate-progress.service
>  create mode 100644 package/swupdate/swupdate-usb.rules
>  create mode 100644 package/swupdate/swupdate-usb@.service
>  create mode 100644 package/swupdate/swupdate.socket
>  create mode 100644 package/swupdate/tmpfiles-swupdate.conf
> 
> diff --git a/package/swupdate/10-mongoose-args b/package/swupdate/10-mongoose-args
> new file mode 100644
> index 0000000000..896e66ba86
> --- /dev/null
> +++ b/package/swupdate/10-mongoose-args
> @@ -0,0 +1 @@
> +SWUPDATE_WEBSERVER_ARGS="-r /www ${SWUPDATE_MONGOOSE_EXTRA_ARGS:--p 8080}"

 Is this correct? The webserver is installed in /var/www, not /www...

> diff --git a/package/swupdate/90-start-progress b/package/swupdate/90-start-progress
> new file mode 100644
> index 0000000000..3b0eb5e7d7
> --- /dev/null
> +++ b/package/swupdate/90-start-progress
> @@ -0,0 +1 @@
> +exec /usr/bin/swupdate-progress -w -r &
> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
> index f601e45fcd..6b832cfcbf 100644
> --- a/package/swupdate/Config.in
> +++ b/package/swupdate/Config.in
> @@ -60,9 +60,16 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
>  	  I you wish to use your own modified swupdate configuration
>  	  file specify the config file location with this option.
>  
> +config BR2_PACKAGE_SWUPDATE_WEBSERVER
> +	bool "swupdate webserver"
> +	default y
> +	help
> +	  Enable update from remote using a web server on the target.
> +
>  config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
>  	bool "install default website"
>  	default y
> +	depends on BR2_PACKAGE_SWUPDATE_WEBSERVER

 I could be mistaken, but isn't the website perfectly usable with an external
webserver as well? You just have to provide the upload endpoint IIRC.

>  	help
>  	  Install the provided website to /var/www/swupdate.
>  
> diff --git a/package/swupdate/swupdate-progress.service b/package/swupdate/swupdate-progress.service
> new file mode 100644
> index 0000000000..0d464bb420
> --- /dev/null
> +++ b/package/swupdate/swupdate-progress.service
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=swupdate progress service
> +After=swupdate.service
> +
> +[Service]
> +ExecStart=/usr/bin/swupdate-progress -r -w
> +
> +[Install]
> +WantedBy=swupdate.service

 I suspect this is copied verbatim from meta-swupdate... It's good form to then
add a comment in the beginning of the file that specifies the upstream copyright
and license (in SPDX) and an upstream link.

 Same for all other files you copied, of course.

> diff --git a/package/swupdate/swupdate-usb.rules b/package/swupdate/swupdate-usb.rules
> new file mode 100644
> index 0000000000..b4efd0b733
> --- /dev/null
> +++ b/package/swupdate/swupdate-usb.rules
> @@ -0,0 +1,2 @@
> +ACTION=="add", KERNEL=="sd*", SUBSYSTEM=="block", ENV{ID_BUS}=="usb", ENV{ID_FS_USAGE}=="filesystem", TAG+="systemd", ENV{SYSTEMD_WANTS}+="swupdate-usb@%k.service"

 Hm, I wonder if it's a good idea to install this unconditionally... It feels to
me that this is a possible attack vector that the user should be aware of - and
the best way to do that is to make the whole thing optional.

 But really, I kind of wonder if this is something that Buildroot should
provide. Ideally, this should be part of the swupdate documentation, and if you
actually want automatic updates when a USB storage device is plugged in, you can
put that stuff in an overlay.


> diff --git a/package/swupdate/swupdate-usb@.service b/package/swupdate/swupdate-usb@.service
> new file mode 100644
> index 0000000000..eda9d1539c
> --- /dev/null
> +++ b/package/swupdate/swupdate-usb@.service
> @@ -0,0 +1,8 @@
> +[Unit]
> +Description=usb media swupdate service
> +Requires=swupdate-progress.service
> +
> +[Service]
> +ExecStartPre=/bin/mount /dev/%I /mnt
> +ExecStart=/bin/sh -c "swupdate-client -v /mnt/*.swu"
> +ExecStopPost=/bin/umount /mnt
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index 402aa0a91f..3368b6ef6a 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -22,7 +22,7 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
>  # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
>  # available in all external toolchains, and use CC for linking. Ensure
>  # TARGET_CC is used for both.
> -SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)"
> +SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)" SKIP_STRIP=y
>  
>  # swupdate bundles its own version of mongoose (version 6.16)
>  
> @@ -139,6 +139,13 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  SWUPDATE_DEPENDENCIES += systemd
> +define SWUPDATE_SET_SYSTEMD
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_SYSTEMD)
> +endef
> +else
> +define SWUPDATE_SET_SYSTEMD
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_SYSTEMD)
> +endef
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
> @@ -180,6 +187,16 @@ ifeq ($(BR2_PACKAGE_LIBRSYNC),y)
>  SWUPDATE_DEPENDENCIES += librsync
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SWUPDATE_WEBSERVER),y)
> +define SWUPDATE_SET_WEBSERVER
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_WEBSERVER)
> +endef
> +else
> +define SWUPDATE_SET_WEBSERVER
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_WEBSERVER)
> +endef
> +endif
> +
>  SWUPDATE_BUILD_CONFIG = $(@D)/.config
>  
>  SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
> @@ -192,14 +209,17 @@ SWUPDATE_MAKE_OPTS = \
>  
>  define SWUPDATE_KCONFIG_FIXUP_CMDS
>  	$(SWUPDATE_SET_LUA_VERSION)
> +	$(SWUPDATE_SET_SYSTEMD)
> +	$(SWUPDATE_SET_WEBSERVER)
>  endef
>  
>  define SWUPDATE_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) $(SWUPDATE_MAKE_OPTS) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) $(SWUPDATE_MAKE_OPTS)
>  endef
>  
>  define SWUPDATE_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
> +	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(SWUPDATE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
>  	$(if $(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE), \
>  		mkdir -p $(TARGET_DIR)/var/www/swupdate; \
>  		cp -dpfr $(@D)/examples/www/v2/* $(TARGET_DIR)/var/www/swupdate)
> @@ -213,23 +233,36 @@ $(error No Swupdate configuration file specified, check your BR2_PACKAGE_SWUPDAT
>  endif
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE),y)
>  define SWUPDATE_INSTALL_COMMON
>  	mkdir -p $(TARGET_DIR)/etc/swupdate/conf.d \
>  		$(TARGET_DIR)/usr/lib/swupdate/conf.d
>  	$(INSTALL) -D -m 755 package/swupdate/swupdate.sh \
>  		$(TARGET_DIR)/usr/lib/swupdate/swupdate.sh
> +	$(if $(BR2_PACKAGE_SWUPDATE_WEBSERVER), \

 Not saying that adding the Buildroot config option is bad, but another option
would be to simply check the setting of the webserver option in the swupdate config:

	if grep -q '^CONFIG_WEBSERVER=y' $(SWUPDATE_BUILD_CONFIG); then \
> +		$(INSTALL) -D -m 644 package/swupdate/10-mongoose-args \
> +			$(TARGET_DIR)/usr/lib/swupdate/conf.d/10-mongoose-args)
>  endef
>  define SWUPDATE_INSTALL_INIT_SYSTEMD
>  	$(SWUPDATE_INSTALL_COMMON)
>  	$(INSTALL) -D -m 644 package/swupdate/swupdate.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
> +	$(INSTALL) -D -m 644 package/swupdate/swupdate.socket \
> +		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
> +	$(INSTALL) -D -m 644 package/swupdate/swupdate-usb@.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
> +	$(INSTALL) -D -m 644 package/swupdate/swupdate-progress.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
> +	$(INSTALL) -D -m 644 package/swupdate/tmpfiles-swupdate.conf \
> +		$(TARGET_DIR)/usr/lib/tmpfiles.d/tmpfiles-swupdate.conf
> +	$(INSTALL) -D -m 644 package/swupdate/swupdate-usb.rules \
> +		$(TARGET_DIR)/lib/udev/rules.d/swupdate-usb.rules
>  endef
>  define SWUPDATE_INSTALL_INIT_SYSV
>  	$(SWUPDATE_INSTALL_COMMON)
>  	$(INSTALL) -D -m 755 package/swupdate/S80swupdate \
>  		$(TARGET_DIR)/etc/init.d/S80swupdate
> +	$(INSTALL) -D -m 644 package/swupdate/90-start-progress \
> +		$(TARGET_DIR)/usr/lib/swupdate/conf.d/90-start-progress
>  endef
> -endif
>  
>  $(eval $(kconfig-package))
> diff --git a/package/swupdate/swupdate.socket b/package/swupdate/swupdate.socket
> new file mode 100644
> index 0000000000..2b756714c5
> --- /dev/null
> +++ b/package/swupdate/swupdate.socket
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=SWUpdate socket listener
> +Documentation=https://github.com/sbabic/swupdate
> +Documentation=https://sbabic.github.io/swupdate
> +
> +[Socket]
> +ListenStream=/tmp/sockinstctrl
> +ListenStream=/tmp/swupdateprog
> +
> +[Install]
> +WantedBy=sockets.target
> diff --git a/package/swupdate/tmpfiles-swupdate.conf b/package/swupdate/tmpfiles-swupdate.conf
> new file mode 100644
> index 0000000000..4743672fcc
> --- /dev/null
> +++ b/package/swupdate/tmpfiles-swupdate.conf
> @@ -0,0 +1,2 @@
> +X /tmp/datadst
> +X /tmp/scripts

 Why are these needed? Are they only needed for systemd? If not, the S80swupdate
init script should also be updated to create those directories.

 Regards,
 Arnout
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
