Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB08E748E7
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 21:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80461610B6;
	Sat, 30 Sep 2023 21:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80461610B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1shxqt2Ti4Kd; Sat, 30 Sep 2023 21:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 924E1610BE;
	Sat, 30 Sep 2023 21:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 924E1610BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFC261BF2CE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 21:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C603041C3B
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 21:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C603041C3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eaKggHRXDC3v for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 21:21:55 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 571D941C36
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 21:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 571D941C36
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32336a30d18so7129946f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696108912; x=1696713712;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4J2Zrqg5u5MEXYDn/4XVZtE/ZIy5NqFtxOuHBgcptL0=;
 b=mLqkJ3wuT+YXdIX+zsdgGCpryO1LuIz/TpYgbuQwtq8Zh7hoZR1MFkGGI/DD5ESOHv
 H8fyTZ1Feo/xL2YPcgbhhTidT/18vu++KB2awF9nn2WYHwSIsxhN5l06semvvYo8qQMm
 rmFdkQPuK4EmkKol6wxmZpNpTtME0FjMbG//0OiVOgAZxZfElH0LGYaoXywddwdsX8d1
 bMNJdb/PjmtwhZamKUQ+3NijmXVYiDB+cLIRRHLXr77Nyh/FgZnMSbxQKH2EBORlQgnu
 Mp7lz41oKFc5o0Z3flAJwHF4CIUiPQVXscn7ztvDfWnqbYCStHqpRzOZavNfZ6VXWFot
 SFfg==
X-Gm-Message-State: AOJu0Ywl+O2x3IuoMM59moDdXXc+xnPeSplQ6cqQeUurnaixm1oPUTA9
 G51OSJOIF6tZZIrgp2o4P7Oweg==
X-Google-Smtp-Source: AGHT+IFH9UBqAuAHsY2u1ljZ1duTxhJrNZYD8uU8TGt/ZhzYNjqII8oCOgZbw/3A0tD1b7FeCTpNdw==
X-Received: by 2002:adf:f989:0:b0:31c:8c93:61e3 with SMTP id
 f9-20020adff989000000b0031c8c9361e3mr6048366wrr.60.1696108912220; 
 Sat, 30 Sep 2023 14:21:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264?
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 d29-20020adfa41d000000b003197869bcd7sm19357104wra.13.2023.09.30.14.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 14:21:51 -0700 (PDT)
Message-ID: <b984b03a-67a0-57c6-a9d0-d2a54a24585c@mind.be>
Date: Sat, 30 Sep 2023 23:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
References: <20220904125854.20486-1-raphael.pavlidis@gmail.com>
In-Reply-To: <20220904125854.20486-1-raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696108912; x=1696713712; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4J2Zrqg5u5MEXYDn/4XVZtE/ZIy5NqFtxOuHBgcptL0=;
 b=fHB6LLiib/kM4G8OLP3Xgt3+i0iDszpZaLDA0901UGNSWU4koDDbawiAfv5mVR0IME
 FQmKsYPpQ1XT+UcQBYl5vg0ZwB3B8THW+GrQzYtcgj5NQo2JGg+y/dum9lurozSoncSq
 I1jAd7qWy1fADLgTaGNfRha9IuigOILKBWXK/nRMeCc7awlNLG9V6XwSNvNBBPmugUTo
 3w2rejY9XsjbvXaKhLC3fNkraieAlEByCtCnPb4qAl0gyqwmtz7oCYnM6FbS/OJEFW6N
 7/k93Ks8AQ1JKKt2Ee9gLqp2nRN+BpVLLOJxYeRgoWkKuuuRM8A7F5DZ9itFuqZzgYzB
 C+Ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fHB6LLii
Subject: Re: [Buildroot] [PATCH v3 1/1] package/nvidia-persistenced: new
 package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/09/2022 14:58, Raphael Pavlidis wrote:
> NVIDIA driver persistence daemon.
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

  Applied to master, thanks, with a number of changes:

      - disable on BR2_STATIC_LIBS;
      - only depend on tirpc if toolchain doesn't have RPC;
      - use unstripped binary - the strip support in the makefile is utterly
        broken (and we anyway strip in target-finalize);
      - define NVIDIA_PERSISTENCED_USERS directly rather than with another
        variable;
      - install all the systemd stuff in
        NVIDIA_PERSISTENCED_INSTALL_INIT_SYSTEMD.

  See the actual commit [1] for details.

  Regards,
  Arnout

[1] 
https://gitlab.com/buildroot.org/buildroot/-/commit/d41386a8ac176f3df73418359d097ee16f02df95



> ---
> Changes v2 -> v3:
>    - DEVELOPERS: add Raphael Pavlids for nvidia-persistenced
> 
> Changes v1 -> v2:
>    - fix typo in Config.in
> 
>   DEVELOPERS                                    |  3 ++
>   package/Config.in                             |  1 +
>   package/nvidia-persistenced/Config.in         | 13 +++++
>   .../nvidia-persistenced.conf                  |  1 +
>   .../nvidia-persistenced.hash                  |  3 ++
>   .../nvidia-persistenced.mk                    | 49 +++++++++++++++++++
>   6 files changed, 70 insertions(+)
>   create mode 100644 package/nvidia-persistenced/Config.in
>   create mode 100644 package/nvidia-persistenced/nvidia-persistenced.conf
>   create mode 100644 package/nvidia-persistenced/nvidia-persistenced.hash
>   create mode 100644 package/nvidia-persistenced/nvidia-persistenced.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d2bd0d809a..ff58fb240d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2506,6 +2506,9 @@ F:	support/testing/tests/package/test_python_jmespath.py
>   F:	support/testing/tests/package/test_python_rsa.py
>   F:	support/testing/tests/package/test_python_s3transfer.py
>   
> +N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
> +F:	package/nvidia-persistenced/
> +
>   N:	Refik Tuzakli <tuzakli.refik@gmail.com>
>   F:	package/freescale-imx/
>   F:	package/paho-mqtt-cpp/
> diff --git a/package/Config.in b/package/Config.in
> index d1c098c48f..41f34908ba 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -543,6 +543,7 @@ endmenu
>   	source "package/neard/Config.in"
>   	source "package/nvidia-driver/Config.in"
>   	source "package/nvidia-modprobe/Config.in"
> +	source "package/nvidia-persistenced/Config.in"
>   	source "package/nvme/Config.in"
>   	source "package/ofono/Config.in"
>   	source "package/ola/Config.in"
> diff --git a/package/nvidia-persistenced/Config.in b/package/nvidia-persistenced/Config.in
> new file mode 100644
> index 0000000000..6ade2a5ceb
> --- /dev/null
> +++ b/package/nvidia-persistenced/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_NVIDIA_PERSISTENCED
> +	bool "nvidia-persistenced"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
> +	select BR2_PACKAGE_LIBTIRPC
> +	help
> +	  NVIDIA driver persistence daemon.
> +
> +	  https://github.com/NVIDIA/nvidia-persistenced
> +
> +comment "nvidia-persistenced needs a toolchain w/ threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/nvidia-persistenced/nvidia-persistenced.conf b/package/nvidia-persistenced/nvidia-persistenced.conf
> new file mode 100644
> index 0000000000..48f24cfb1d
> --- /dev/null
> +++ b/package/nvidia-persistenced/nvidia-persistenced.conf
> @@ -0,0 +1 @@
> +u nvidia-persistenced - 'NVIDIA Persistence Daemon'
> diff --git a/package/nvidia-persistenced/nvidia-persistenced.hash b/package/nvidia-persistenced/nvidia-persistenced.hash
> new file mode 100644
> index 0000000000..06c71b35f5
> --- /dev/null
> +++ b/package/nvidia-persistenced/nvidia-persistenced.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256  b84fb8eb86127a725d0134a2c64a64e7844e125dece137e7fe8adf8a33cbe817  nvidia-persistenced-515.48.07.tar.gz
> +sha256  279d814320adc07ca5a4ee101a0b428ddf22a6f3513b8c051f9eb7be47b2e797  COPYING
> diff --git a/package/nvidia-persistenced/nvidia-persistenced.mk b/package/nvidia-persistenced/nvidia-persistenced.mk
> new file mode 100644
> index 0000000000..2a34d3608d
> --- /dev/null
> +++ b/package/nvidia-persistenced/nvidia-persistenced.mk
> @@ -0,0 +1,49 @@
> +################################################################################
> +#
> +# nvidia-persistenced
> +#
> +################################################################################
> +
> +NVIDIA_PERSISTENCED_VERSION = 515.48.07
> +NVIDIA_PERSISTENCED_SITE = $(call github,NVIDIA,nvidia-persistenced,$(NVIDIA_PERSISTENCED_VERSION))
> +NVIDIA_PERSISTENCED_LICENSE = MIT
> +NVIDIA_PERSISTENCED_LICENSE_FILES = COPYING
> +
> +NVIDIA_PERSISTENCED_DEPENDENCIES = host-pkgconf libtirpc
> +
> +define NVIDIA_PERSISTENCED_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		OUTPUTDIR=. ./nvidia-persistenced
> +endef
> +
> +define NVIDIA_PERSISTENCED_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/nvidia-persistenced \
> +		$(TARGET_DIR)/usr/bin/nvidia-persistenced
> +endef
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
> +define NVIDIA_PERSISTENCED_POST_INSTALL_TARGET_SYSTEMD_SYSUSERS
> +	$(INSTALL) -D -m 0644 $(NVIDIA_PERSISTENCED_PKGDIR)/nvidia-persistenced.conf \
> +		$(TARGET_DIR)/usr/lib/sysusers.d/nvidia-persistenced.conf
> +endef
> +NVIDIA_PERSISTENCED_POST_INSTALL_TARGET_HOOKS += NVIDIA_PERSISTENCED_POST_INSTALL_TARGET_SYSTEMD_SYSUSERS
> +else
> +NVIDIA_PERSISTENCED_SYSTEMD_USERS = \
> +	nvidia-persistenced -1 nvidia-persistenced -1 * - - - NVIDIA Persistence Daemon
> +endif
> +
> +define NVIDIA_PERSISTENCED_POST_INSTALL_TARGET_SYSTEMD_SERVICE
> +	$(INSTALL) -D -m 0644 $(@D)/init/systemd/nvidia-persistenced.service.template \
> +		$(TARGET_DIR)/usr/lib/systemd/system/nvidia-persistenced.service
> +	$(SED) 's/__USER__/nvidia-persistenced/g' \
> +		$(TARGET_DIR)/usr/lib/systemd/system/nvidia-persistenced.service
> +endef
> +NVIDIA_PERSISTENCED_POST_INSTALL_TARGET_HOOKS += NVIDIA_PERSISTENCED_POST_INSTALL_TARGET_SYSTEMD_SERVICE
> +endif # BR2_PACKAGE_SYSTEMD
> +
> +define NVIDIA_PERSISTENCED_USERS
> +	$(NVIDIA_PERSISTENCED_SYSTEMD_USERS)
> +endef
> +
> +$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
