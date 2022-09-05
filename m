Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3E0ECAAD3
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 10:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47B3F40187;
	Mon,  5 Sep 2022 10:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47B3F40187
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MHCemLf8Jc9b; Mon,  5 Sep 2022 10:06:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16EE34014B;
	Mon,  5 Sep 2022 10:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16EE34014B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43DE81BF9AD
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 10:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2611960B78
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 10:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2611960B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HicXz6KkF_GK for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 10:06:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72BCC60670
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72BCC60670
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 10:06:39 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id s11so10633175edd.13
 for <buildroot@buildroot.org>; Mon, 05 Sep 2022 03:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IJZuUFx65l3nMoZBLp8QenZuLVqsyGRfdglwyAmxthw=;
 b=P/A6qU6ip0QeHvjgxoroLowicTbtSzmgZhU298C4Vnpc8D6YgV3H1eX2SvHo3pI+rG
 k90gpKWxfLxPat5+BSVNezFQ/gVHtfxLjWUEnQ/YtgjM6SNrcvEv/4lTjSHyL1t20Nyz
 x2W9TIE9YEVTLi01FzcOjC+T//vdOfrc4AFCMsFzn0j3qOHT5TzssH2h896GQYbJ6XwI
 30D0PlX4xBUTR5aI/wW53CCTMnrjT+M72Iq1d0Yp1OFNbFUN6EIiID/kjJrwWBnKQly0
 VIRdMudoqpZZPV+03wFwQx05FRGdWK/bYynFy3cLmZH3EKogShunhFkwlmITds/i/5BC
 xj+A==
X-Gm-Message-State: ACgBeo1OV4cES7hgoKik3wHmDiuxJoHiztcC9x3Q+tyYGlXPrYS+CxXA
 73masTIeCuax/2Fou0O7DNwZPA==
X-Google-Smtp-Source: AA6agR5N3xC8Q1CsoYAG5YG/M9pcD3e7SX/XS/Rk5O0yHpSsHlbM4txL0r4IcfxLlsOxCzkp5bX8EA==
X-Received: by 2002:a05:6402:3907:b0:431:6776:64e7 with SMTP id
 fe7-20020a056402390700b00431677664e7mr42488099edb.0.1662372397567; 
 Mon, 05 Sep 2022 03:06:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a17090618a900b0072b7d76211dsm4903073ejf.107.2022.09.05.03.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 03:06:34 -0700 (PDT)
Message-ID: <e305347d-b691-e925-6ce5-dbf69adb249d@mind.be>
Date: Mon, 5 Sep 2022 12:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
References: <20220904124315.12728-1-raphael.pavlidis@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220904124315.12728-1-raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IJZuUFx65l3nMoZBLp8QenZuLVqsyGRfdglwyAmxthw=;
 b=OJS3zQGi5nbmI4da1QbJyTUkdlqMefGbqGj+NtPaSp9io19ZvS+Mwah3nSO7qlV1Yx
 Uc3Os5o83IJwSldz41eFem0FhIPBsPLaikhxFI1s8d684TCleUTClLxn8Ut8XHaUnRar
 duTeyrIC4gARnKJhd5xGQQqvcPzooLrwvVeR6xZc11/cvlOdQXOqCYyGpRZbAYiu2+Oq
 9Xy4bcW9w0ufhWFlleHGdGWixr2wfETlmep9r7d6074C+kOGrwtw0xloHTccW/r1hKYT
 yA2xLxtFqkDh4fPu0uqluCjtV8sO41lXldw0fu1U0qovQYniOk1kKq1+xpq30KWOdUFl
 9M4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OJS3zQGi
Subject: Re: [Buildroot] [PATCH v2 1/1] package/shadow: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Raphael,

On 04/09/2022 14:43, Raphael Pavlidis wrote:
> shadow provides utilities to deal with user accounts.
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

  Not a full review, but just a small comment: I believe the shadow package 
installs (or may install) some files that also have a busybox equivalent. If 
this is the case, a dependency has to be added to busybox, to make sure that the 
busybox version doesn't overwrite the one from shadow when per-package 
directories are enabled. See the large list of other dependencies already 
present in busybox.mk.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
> - DEVELOPERS: add Raphael Pavlids for shadow
> 
>   DEVELOPERS                 |   3 +
>   package/Config.in          |   1 +
>   package/shadow/Config.in   |  81 ++++++++++++++++++
>   package/shadow/shadow.hash |   3 +
>   package/shadow/shadow.mk   | 171 +++++++++++++++++++++++++++++++++++++
>   5 files changed, 259 insertions(+)
>   create mode 100644 package/shadow/Config.in
>   create mode 100644 package/shadow/shadow.hash
>   create mode 100644 package/shadow/shadow.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d2bd0d809a..38c25a0ae2 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2506,6 +2506,9 @@ F:	support/testing/tests/package/test_python_jmespath.py
>   F:	support/testing/tests/package/test_python_rsa.py
>   F:	support/testing/tests/package/test_python_s3transfer.py
>   
> +N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
> +F:	package/shadow/
> +
>   N:	Refik Tuzakli <tuzakli.refik@gmail.com>
>   F:	package/freescale-imx/
>   F:	package/paho-mqtt-cpp/
> diff --git a/package/Config.in b/package/Config.in
> index d1c098c48f..c13ba09056 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2635,6 +2635,7 @@ menu "System tools"
>   	source "package/sdbus-cpp/Config.in"
>   	source "package/sdbusplus/Config.in"
>   	source "package/seatd/Config.in"
> +	source "package/shadow/Config.in"
>   	source "package/smack/Config.in"
>   	source "package/start-stop-daemon/Config.in"
>   	source "package/supervisor/Config.in"
> diff --git a/package/shadow/Config.in b/package/shadow/Config.in
> new file mode 100644
> index 0000000000..616f002618
> --- /dev/null
> +++ b/package/shadow/Config.in
> @@ -0,0 +1,81 @@
> +menuconfig BR2_PACKAGE_SHADOW
> +	bool "shadow"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
> +	help
> +	  Utilities to deal with user accounts.
> +
> +	  https://github.com/shadow-maint/shadow
> +
> +if BR2_PACKAGE_SHADOW
> +
> +config BR2_PACKAGE_SHADOW_SHADOWGRP
> +	bool "shadowgrp"
> +	default y
> +	help
> +	  Enable shadow group support.
> +
> +if BR2_PACKAGE_LINUX_PAM
> +
> +config BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID
> +	bool "account-tools-setuid"
> +	help
> +	  Install the user and group management tools setuid and authenticate the
> +	  callers.
> +
> +endif # BR2_PACKAGE_LINUX_PAM
> +
> +config BR2_PACKAGE_SHADOW_UTMPX
> +	bool "utmpx"
> +	help
> +	  Enable loggin in utmpx / wtmpx.
> +
> +config BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
> +	bool "subordinate-ids"
> +	default y
> +	help
> +	  Support subordinate ids.
> +
> +config BR2_PACKAGE_SHADOW_SHA_CRYPT
> +	bool "sha-crypt"
> +	default y
> +	help
> +	  Allow the SHA256 and SHA512 password encryption algorithms.
> +
> +config BR2_PACKAGE_SHADOW_BCRYPT
> +	bool "bcrypt"
> +	help
> +	  Allow the bcrypt password encryption algorithm.
> +
> +config BR2_PACKAGE_SHADOW_YESCRYPT
> +	bool "yescrypt"
> +	help
> +	  Allow the yescrypt password encryption algorithm.
> +
> +config BR2_PACKAGE_SHADOW_NSCD
> +	bool "nscd"
> +	default y
> +	help
> +	  Enable support for nscd.
> +
> +config BR2_PACKAGE_SHADOW_SSSD
> +	bool "sssd"
> +	default y
> +	help
> +	  Define to support flushing of sssd caches.
> +
> +config BR2_PACKAGE_SHADOW_GROUP_NAME_MAX_LENGTH
> +	int "group-name-max-length"
> +	default 16
> +	help
> +	  Set max group name length. (0 equals infinity)
> +
> +config BR2_PACKAGE_SHADOW_SU
> +	bool "su"
> +	default y
> +	help
> +	  Build and install su program.
> +
> +endif # BR2_PACKAGE_SHADOW
> +
> +comment "shadow needs a toolchain w/ headers >= 4.14"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
> diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
> new file mode 100644
> index 0000000000..6b9faac10f
> --- /dev/null
> +++ b/package/shadow/shadow.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  41f093ce58b2ae5f389a1c5553e0c18bc73e6fe27f66273891991198a7707c95  shadow-4.11.1.tar.xz
> +sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
> new file mode 100644
> index 0000000000..140d830cb9
> --- /dev/null
> +++ b/package/shadow/shadow.mk
> @@ -0,0 +1,171 @@
> +################################################################################
> +#
> +# shadow
> +#
> +################################################################################
> +
> +SHADOW_VERSION = 4.11.1
> +SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/v$(SHADOW_VERSION)
> +SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
> +SHADOW_LICENSE = BSD-3-Clause
> +SHADOW_LICENSE_FILES = COPYING
> +
> +SHADOW_CONF_OPTS += \
> +	--disable-man \
> +	--without-btrfs \
> +	--without-skey \
> +	--without-tcb
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +SHADOW_CONF_OPTS += --enable-static
> +else
> +SHADOW_CONF_OPTS += --disable-static
> +endif
> +
> +ifeq ($(BR2_SHARED_LIBS),y)
> +SHADOW_CONF_OPTS += --enable-shared
> +else
> +SHADOW_CONF_OPTS += --disable-shared
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SHADOW_SHADOWGRP),y)
> +SHADOW_CONF_OPTS += --enable-shadowgrp
> +else
> +SHADOW_CONF_OPTS += --disable-shadowgrp
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID),y)
> +SHADOW_CONF_OPTS += --enable-account-tools-setuid
> +SHADOW_ACCOUNT_TOOLS_SETUID = \
> +	/usr/sbin/chgpasswd f 4755 0 0 - - - - - \
> +	/usr/sbin/chpasswd f 4755 0 0 - - - - - \
> +	/usr/sbin/groupadd f 4755 0 0 - - - - - \
> +	/usr/sbin/groupdel f 4755 0 0 - - - - - \
> +	/usr/sbin/groupmod f 4755 0 0 - - - - - \
> +	/usr/sbin/newusers f 4755 0 0 - - - - - \
> +	/usr/sbin/useradd f 4755 0 0 - - - - - \
> +	/usr/sbin/usermod f 4755 0 0 - - - - -
> +else
> +SHADOW_CONF_OPTS += --disable-account-tools-setuid
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SHADOW_UTMPX),y)
> +SHADOW_CONF_OPTS += --enable-utmpx
> +else
> +SHADOW_CONF_OPTS += --disable-utmpx
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SHADOW_SUBORDINATE_IDS),y)
> +SHADOW_CONF_OPTS += --enable-subordinate-ids
> +SHADOW_SUBORDINATE_IDS_PERMISSIONS =  \
> +	/usr/bin/newuidmap f 4755 0 0 - - - - - \
> +	/usr/bin/newgidmap f 4755 0 0 - - - - -
> +else
> +SHADOW_CONF_OPTS += --disable-subordinate-ids
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ACL),y)
> +SHADOW_CONF_OPTS += --with-acl
> +SHADOW_DEPENDENCIES += acl
> +else
> +SHADOW_CONF_OPTS += --without-acl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ATTR),y)
> +SHADOW_CONF_OPTS += --with-attr
> +SHADOW_DEPENDENCIES += attr
> +else
> +SHADOW_CONF_OPTS += --without-attr
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +SHADOW_CONF_OPTS += --with-audit
> +SHADOW_DEPENDENCIES += audit
> +else
> +SHADOW_CONF_OPTS += --without-audit
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CRACKLIB),y)
> +SHADOW_CONF_OPTS += --with-libcrack
> +SHADOW_DEPENDENCIES += cracklib
> +else
> +SHADOW_CONF_OPTS += --without-libcrack
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +SHADOW_CONF_OPTS += --with-selinux
> +SHADOW_DEPENDENCIES += libselinux libsemanage
> +else
> +SHADOW_CONF_OPTS += --without-selinux
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> +SHADOW_CONF_OPTS += --with-libpam
> +SHADOW_DEPENDENCIES += linux-pam
> +else
> +SHADOW_CONF_OPTS += --without-libpam
> +endif
> +
> +ifeq ($(BR2_ENABLE_LOCALE),y)
> +SHADOW_CONF_OPTS += --enable-nls
> +else
> +SHADOW_CONF_OPTS += --disable-nls
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SHADOW_SHA_CRYPT),y)
> +SHADOW_CONF_OPTS += --with-sha-crypt
> +else
> +SHADOW_CONF_OPTS += --without-sha-crypt
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SHADOW_BCRYPT),y)
> +SHADOW_CONF_OPTS += --with-bcrypt
> +else
> +SHADOW_CONF_OPTS += --without-bcrypt
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SHADOW_YESCRYPT),y)
> +SHADOW_CONF_OPTS += --with-yescrypt
> +else
> +SHADOW_CONF_OPTS += --without-yescrypt
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SHADOW_NSCD),y)
> +SHADOW_CONF_OPTS += --with-nscd
> +else
> +SHADOW_CONF_OPTS += --without-nscd
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SHADOW_SSSD),y)
> +SHADOW_CONF_OPTS += --with-sssd
> +else
> +SHADOW_CONF_OPTS += --without-sssd
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SHADOW_GROUP_NAME_MAX_LENGTH),0)
> +SHADOW_CONF_OPTS += --without-group-name-max-length
> +else
> +SHADOW_CONF_OPTS += --with-group-name-max-length=$(BR2_PACKAGE_SHADOW_GROUP_NAME_MAX_LENGTH)
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SHADOW_SU),y)
> +SHADOW_CONF_OPTS += --with-su
> +SHADOW_SU_PERMISSIONS = /bin/su f 4755 0 0 - - - - -
> +else
> +SHADOW_CONF_OPTS += --without-su
> +endif
> +
> +define SHADOW_PERMISSIONS
> +	/usr/bin/chage f 4755 0 0 - - - - -
> +	/usr/bin/chfn f 4755 0 0 - - - - -
> +	/usr/bin/chsh f 4755 0 0 - - - - -
> +	/usr/bin/expiry f 4755 0 0 - - - - -
> +	/usr/bin/gpasswd f 4755 0 0 - - - - -
> +	/usr/bin/newgrp f 4755 0 0 - - - - -
> +	/usr/bin/passwd f 4755 0 0 - - - - -
> +	$(SHADOW_ACCOUNT_TOOLS_SETUID)
> +	$(SHADOW_SUBORDINATE_IDS_PERMISSIONS)
> +	$(SHADOW_SU_PERMISSIONS)
> +endef
> +
> +$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
