Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B600BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 581FB61B00;
	Sat, 23 Jul 2022 20:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 581FB61B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdkaDhXiLBKi; Sat, 23 Jul 2022 20:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCEDB60E14;
	Sat, 23 Jul 2022 20:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCEDB60E14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD8AF1BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 978C38496E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 978C38496E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VWQ6Px7E94tY for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:10:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6C1D84963
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6C1D84963
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:10:42 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m17so10461150wrw.7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UUGCtD7tAh2W84Z15WoI4mM/2SNmBSxxCjqfxPKnil0=;
 b=LNgElueDN9nOs72zd/U2zqa79naZL15SQk6olvghF8k3+4vMkihG7ibo5mALmfwcTv
 vOc1Oe1ycSwsPU7+qGoWpk/i8HqpHnixO9/sMjK1rANA3dAEk3BFEPX5UBNtA2gHNy9I
 33vDjzXJwH+prrrWcbY+vS143tBk/X2PrPjpYVLxKmZClpJcIbstUYBIePb5/4xxwgpC
 ZKzzLLlBMfI6pNl6AbxyFM8H+BVnNrhf2mRYxh5rtE/8n+LIKVmx9zNdEw4BB4f3tB6L
 2LZoVTKW0k+SH5eDb5JKelpA4tfmKs94AlLjM2Uc4lZXKg1NEGJhM5puAIjhTM71l3e0
 H31Q==
X-Gm-Message-State: AJIora9ZQXEBN+NTbYkKw+JAQLQrlMpovAEYMOndShokb5n4RrpidXKg
 2xVu3uTh687OxqJFbobRqp/21POy4m7w7g==
X-Google-Smtp-Source: AGRyM1unVnkQY06eFQkfCCr59eXge/454K7CsUzfimYoFzEp+5kd/0HVQxq1aftvFKW33khnlekKZQ==
X-Received: by 2002:a5d:6b50:0:b0:21e:298c:caad with SMTP id
 x16-20020a5d6b50000000b0021e298ccaadmr3447683wrw.509.1658607040494; 
 Sat, 23 Jul 2022 13:10:40 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 e10-20020adfe7ca000000b0021dbaa4f38dsm9389359wrn.18.2022.07.23.13.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 13:10:40 -0700 (PDT)
Message-ID: <a31039ea-928b-beb8-e267-7c7c7b1932ef@mind.be>
Date: Sat, 23 Jul 2022 22:10:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20220622184824.289640-1-aduskett@gmail.com>
 <20220622184824.289640-5-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220622184824.289640-5-aduskett@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UUGCtD7tAh2W84Z15WoI4mM/2SNmBSxxCjqfxPKnil0=;
 b=Jc6FrEVmpHpfd6x1t2hm3bay4TbcrnAUpVh46Ox99Kuh6pf8zff00DhnREuIUNrLq2
 5ZxCV0LCIDrzkJzIbvtzUDSKPypvkgEsqyLLEBShEr67qUEPhfVAp006NQrJ+SrHs0/c
 36L77f7PLLF0lq4qAc7Fmzq0/v3wnnDW9xWIC7h3yMPmkO0t5X85l8yjRZwJLImqv1dE
 wtYhsptDqPwJ0G/Z+Ysg6T50Rl/Z+NQj+CRuDUPkFs4cZotcVjollukKN76akppe3baV
 RJcnVVzHh+wbMLUinZXkbIg+wO9g8h8jR5MYeQv+OI9UMXbHS4ZKvEJAkv0zTPsEWR2P
 nU/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Jc6FrEVm
Subject: Re: [Buildroot] [PATCH 5/5] package/mender-connect: new package
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Anisse Astier <anisse@astier.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/06/2022 20:48, Adam Duskett wrote:
> mender-connect is a daemon responsible for handling bidirectional (websocket)
> communication with the Mender server. The daemon is responsible for
> implementing a range of troubleshooting features to the device as well as
> several enhancement to the mender-client.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>   package/Config.in                          |  1 +
>   package/mender-connect/Config.in           | 32 ++++++++++++
>   package/mender-connect/S43mender-connect   | 41 +++++++++++++++
>   package/mender-connect/mender-connect.hash | 34 ++++++++++++
>   package/mender-connect/mender-connect.mk   | 60 ++++++++++++++++++++++
>   5 files changed, 168 insertions(+)
>   create mode 100644 package/mender-connect/Config.in
>   create mode 100644 package/mender-connect/S43mender-connect
>   create mode 100644 package/mender-connect/mender-connect.hash
>   create mode 100644 package/mender-connect/mender-connect.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f09da05be0..284ee55d88 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2558,6 +2558,7 @@ menu "System tools"
>   	source "package/lxc/Config.in"
>   	source "package/makedumpfile/Config.in"
>   	source "package/mender/Config.in"
> +	source "package/mender-connect/Config.in"
>   	source "package/mender-grubenv/Config.in"
>   	source "package/mfoc/Config.in"
>   	source "package/moby-buildkit/Config.in"
> diff --git a/package/mender-connect/Config.in b/package/mender-connect/Config.in
> new file mode 100644
> index 0000000000..0567135d99
> --- /dev/null
> +++ b/package/mender-connect/Config.in
> @@ -0,0 +1,32 @@
> +config BR2_PACKAGE_MENDER_CONNECT
> +	bool "mender-connect"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib
> +	depends on BR2_USE_WCHAR # libglib -> gettext
> +	depends on BR2_USE_MMU # dbus -> fork()

  These two have to be added to the comment as well

> +	select BR2_PACKAGE_DBUS # runtime
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_MENDER # runtime
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  mender-connect is a daemon responsible for handling
> +	  bidirectional (websocket) communication with the Mender
> +	  server. The daemon is responsible for implementing a range of
> +	  troubleshooting features to the device as well as several
> +	  enhancement to the mender-client.
> +
> +	  Mender Connect is loosely coupled with the Mender Client. The
> +	  main information passed between mender-client and
> +	  mender-connect is the device authorization status. Since only
> +	  accepted devices can interact with the Mender Server, the
> +	  Mender Client passes over DBus the authorization token which
> +	  Mender Connect uses to establish a Websocket connection to the
> +	  server.
> +
> +	  https://github.com/mendersoftware/mender-connect
> +
> +comment "mender-connect needs a toolchain w/ threads"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/mender-connect/S43mender-connect b/package/mender-connect/S43mender-connect
> new file mode 100644
> index 0000000000..abcceb0e02
> --- /dev/null
> +++ b/package/mender-connect/S43mender-connect
> @@ -0,0 +1,41 @@
> +#!/bin/sh
> +DAEMON="mender-connect"
> +DAEMON_PATH="/usr/bin/mender-connect"
> +PIDFILE="/var/run/${DAEMON}.pid"
> +DAEMON_ARGS="-daemon"
> +
> +start() {
> +	printf 'Starting %s: ' "${DAEMON}"
> +	umask 077
> +	start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} -- ${DAEMON_ARGS}

  I made some changes here to make it match better with our canonical example in 
busybox/S01syslogd.

> +	status=$?
> +	[ "${status}" = 0 ] && echo "OK" || echo "FAIL"
> +	return "$status"
> +}
> +
> +stop() {
> +	printf 'Stopping %s: ' "${DAEMON}"
> +	start-stop-daemon -Kqp "$PIDFILE"
> +	status=$?
> +	[ "${status}" = 0 ] && echo "OK" || echo "FAIL"
> +	return "$status"
> +}
> +
> +restart() {
> +	stop
> +	sleep 1
> +	start
> +}
> +
> +case "$1" in
> +	start|stop|restart)
> +		"$1";;
> +	reload)
> +		# Restart, since there is no true "reload" feature.
> +		restart;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
> +esac
> +
> +exit $?
> diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
> new file mode 100644
> index 0000000000..cd6cf0f7c0
> --- /dev/null
> +++ b/package/mender-connect/mender-connect.hash
> @@ -0,0 +1,34 @@
> +# Locally computed:
> +sha256  6410bcd76cebd21e9f18fe5768928d67163e4bb2b6ae76d0e20815400d907657  2.0.2.tar.gz
> +sha256  78b3954421ec6499c3f9735b96d52288574ae80c747416a52548d7f526f26e8c  LIC_FILES_CHKSUM.sha256
> +
> +# Vendor licenses
> +# Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
> +
> +#
> +# Apache-2.0
> +sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
> +sha256  3eb823230e5d112e1bd032ccc82ae765cf676d0d6d46a1a1daa2d658b3005b67  vendor/github.com/mendersoftware/go-lib-micro/LICENSE
> +#
> +# BSD-2-Clause
> +sha256  2be1b548b0387ca8948e1bb9434e709126904d15f622cc2d0d8e7f186e4d122d  vendor/github.com/gorilla/websocket/LICENSE
> +sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
> +sha256  1530185dd39cdde7cb2f786a7a5fcf8bc34368b6ae73c15e72bafe88fd80b9a2  vendor/github.com/vmihailenco/msgpack/v5/LICENSE
> +sha256  0f02aac22084ef463aa5f42f566feeec6aa4c99653519744a8c25cb079da5b5d  vendor/github.com/vmihailenco/tagparser/v2/LICENSE
> +#
> +# BSD-3-Clause
> +sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
> +sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
> +#
> +# ISC
> +sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
> +#
> +# MIT
> +sha256  a2a1cea59d9c2d71908082f516f86bb560abf857646ecf69d70c121ead14aef4  vendor/github.com/creack/pty/LICENSE
> +sha256  caa932df46551b53643952fe03b351d55db97be73b5393b986dcf6b05d3c416a  vendor/github.com/go-ozzo/ozzo-validation/v4/LICENSE
> +sha256  92a328e1d5f3269b42e2ce32b4494eafdb3132f204a911c5c95cf3d8465490e4  vendor/github.com/satori/go.uuid/LICENSE
> +sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/github.com/sirupsen/logrus/LICENSE
> +sha256  b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23b6b61b0  vendor/github.com/stretchr/objx/LICENSE
> +sha256  f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189  vendor/github.com/stretchr/testify/LICENSE
> +sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/github.com/urfave/cli/v2/LICENSE
> +sha256  d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/gopkg.in/yaml.v3/LICENSE
> diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
> new file mode 100644
> index 0000000000..bb9cfde236
> --- /dev/null
> +++ b/package/mender-connect/mender-connect.mk
> @@ -0,0 +1,60 @@
> +################################################################################
> +#
> +# mender-connect
> +#
> +################################################################################
> +
> +MENDER_CONNECT_VERSION = 2.0.2
> +MENDER_CONNECT_SOURCE = $(MENDER_CONNECT_VERSION).tar.gz
> +MENDER_CONNECT_SITE = https://github.com/mendersoftware/mender-connect/archive

  AFAICS there's no reason not to use the github helper here, so I did that.

  Applied to master with those changes, thanks.

  Regards,
  Arnout

> +MENDER_CONNECT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
> +
> +# Vendor license paths generated with:
> +#    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
> +MENDER_CONNECT_LICENSE_FILES = \
> +	LIC_FILES_CHKSUM.sha256 \
> +	LICENSE \
> +	vendor/github.com/mendersoftware/go-lib-micro/LICENSE \
> +	vendor/github.com/gorilla/websocket/LICENSE \
> +	vendor/github.com/pkg/errors/LICENSE \
> +	vendor/github.com/vmihailenco/msgpack/v5/LICENSE \
> +	vendor/github.com/vmihailenco/tagparser/v2/LICENSE \
> +	vendor/github.com/pmezard/go-difflib/LICENSE \
> +	vendor/golang.org/x/sys/LICENSE \
> +	vendor/github.com/davecgh/go-spew/LICENSE \
> +	vendor/github.com/creack/pty/LICENSE \
> +	vendor/github.com/go-ozzo/ozzo-validation/v4/LICENSE \
> +	vendor/github.com/satori/go.uuid/LICENSE \
> +	vendor/github.com/sirupsen/logrus/LICENSE \
> +	vendor/github.com/stretchr/objx/LICENSE \
> +	vendor/github.com/stretchr/testify/LICENSE \
> +	vendor/github.com/urfave/cli/v2/LICENSE \
> +	vendor/gopkg.in/yaml.v3/LICENSE
> +
> +MENDER_CONNECT_DEPENDENCIES = \
> +	dbus \
> +	libglib2 \
> +	mender \
> +	openssl
> +
> +MENDER_CONNECT_LDFLAGS = -X github.com/mendersoftware/mender-connect/config.Version=$(MENDER_CONNECT_VERSION)
> +
> +define MENDER_CONNECT_INSTALL_CONFIG_FILES
> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender
> +
> +	$(INSTALL) -D -m 0644 $(@D)/examples/mender-connect.conf \
> +		$(TARGET_DIR)/etc/mender/mender-connect.conf
> +endef
> +MENDER_CONNECT_POST_INSTALL_TARGET_HOOKS += MENDER_CONNECT_INSTALL_CONFIG_FILES
> +
> +define MENDER_CONNECT_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 $(@D)/support/mender-connect.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/mender-connect.service
> +endef
> +
> +define MENDER_CONNECT_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 $(MENDER_CONNECT_PKGDIR)/S43mender-connect \
> +		$(TARGET_DIR)/etc/init.d/S43mender-connect
> +endef
> +
> +$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
