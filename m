Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BA1C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEDD283AA4;
	Wed,  7 Feb 2024 09:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AkudY2GzzhxP; Wed,  7 Feb 2024 09:08:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FCBD83A9C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FCBD83A9C;
	Wed,  7 Feb 2024 09:08:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 487841BF59A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34A31613A9
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s3fJLF8XIBBE for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:08:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 37DB661399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37DB661399
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37DB661399
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:08:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E8D0913F838;
 Wed,  7 Feb 2024 10:07:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 10:07:51 +0100
Date: Wed, 7 Feb 2024 10:07:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Message-ID: <ZcNIZ3wz9y2GTg9R@landeda>
References: <20240206192543.7179-1-ddrokosov@salutedevices.com>
 <20240206192543.7179-3-ddrokosov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206192543.7179-3-ddrokosov@salutedevices.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707296881;
 bh=s5e9zT1oaJg9K7lhZ8wyU1rXzq2+dvdSIhZbAMNMHkw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s8IC7ADo80UPTZurqNuJBX/bm4Zcd1yxuSjBsC/KyITSf6U4JjcdLy48v3KlZFJdx
 TX9UWFNhxYqrasWxXanJ1tFIiRzg+AJIFEOR9GLHaYGi+jVmF+9Q8U9+3F/38o/M9I
 R9QVn3xYYVjLb1gSxcdXCcvIXxzA4KayTrFS2Pb0Ic4hrDbzSLq71GKuGq6xVPyWFE
 lrJ7FNEEEiL6Qw7URH1CXbdzA9lEHJS0wtpAq7S3N0y07U1P5wTfhuvdH9nd5glROg
 K46MkmdQRZhm5GfTgFOlccJCWmxspjegpL+10I59FL1ePaVQX4owcfutfidcsAKcdG
 fbchCzLr7EWmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s8IC7ADo
Subject: Re: [Buildroot] [PATCH v2 2/2] package/linux-tools: multilib build
 supported
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
Cc: chopps@chopps.org, Herve Codina <herve.codina@bootlin.com>,
 buildroot@buildroot.org, Konstantin Menyaev <KAMenyaev@sberdevices.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 sdfw_system_team@sberdevices.ru, kernel@sberdevices.ru, rockosov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dmitry, All,

On 2024-02-06 22:25 +0300, Dmitry Rokosov spake thusly:
> From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> 
> - LINUX_TOOLS_MAKE_OPTS option introduced:
>     allows to override CROSS_COMPILE param

What is the rationale for this? How is it supposed to be used?

CROSS_COMPILE is already part of LINUX_MAKE_FLAGS, so there is no reason
to pass it explicitly either.

Otherwise, I am not convinced anout the "multilib" title either, because
Buildroot does not do multilib systems anyway, so I am missing the point
of the patch...

If you feel there really is a nedd, please resubmit with an extended
commit log. Thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  package/linux-tools/linux-tool-gpio.mk.in      | 2 +-
>  package/linux-tools/linux-tool-iio.mk.in       | 2 +-
>  package/linux-tools/linux-tool-mm.mk.in        | 2 +-
>  package/linux-tools/linux-tool-pci.mk.in       | 2 +-
>  package/linux-tools/linux-tool-perf.mk.in      | 2 +-
>  package/linux-tools/linux-tool-selftests.mk.in | 2 +-
>  package/linux-tools/linux-tool-tmon.mk.in      | 2 +-
>  package/linux-tools/linux-tools.mk             | 2 ++
>  8 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/package/linux-tools/linux-tool-gpio.mk.in b/package/linux-tools/linux-tool-gpio.mk.in
> index e825db1b1127..dcee11002e8c 100644
> --- a/package/linux-tools/linux-tool-gpio.mk.in
> +++ b/package/linux-tools/linux-tool-gpio.mk.in
> @@ -6,7 +6,7 @@
>  
>  LINUX_TOOLS += gpio
>  
> -GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
> +GPIO_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) LDFLAGS="$(TARGET_LDFLAGS)"
>  
>  define GPIO_BUILD_CMDS
>  	$(Q)if ! grep install $(LINUX_DIR)/tools/gpio/Makefile >/dev/null 2>&1 ; then \
> diff --git a/package/linux-tools/linux-tool-iio.mk.in b/package/linux-tools/linux-tool-iio.mk.in
> index 27ab0ed7ed63..1372faafd1a8 100644
> --- a/package/linux-tools/linux-tool-iio.mk.in
> +++ b/package/linux-tools/linux-tool-iio.mk.in
> @@ -6,7 +6,7 @@
>  
>  LINUX_TOOLS += iio
>  
> -IIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
> +IIO_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) LDFLAGS="$(TARGET_LDFLAGS)"
>  
>  define IIO_BUILD_CMDS
>  	$(Q)if ! grep install $(LINUX_DIR)/tools/iio/Makefile >/dev/null 2>&1 ; then \
> diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
> index 5431e0574b04..51a54026dea4 100644
> --- a/package/linux-tools/linux-tool-mm.mk.in
> +++ b/package/linux-tools/linux-tool-mm.mk.in
> @@ -7,7 +7,7 @@
>  LINUX_TOOLS += mm
>  
>  MM_DEPENDENCIES = linux
> -MM_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CC="$(TARGET_CC)"
> +MM_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) CC="$(TARGET_CC)"
>  
>  define MM_BUILD_CMDS
>  	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
> diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
> index 17246f5d7ed2..48c3435a5c8a 100644
> --- a/package/linux-tools/linux-tool-pci.mk.in
> +++ b/package/linux-tools/linux-tool-pci.mk.in
> @@ -6,7 +6,7 @@
>  
>  LINUX_TOOLS += pci
>  
> -PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
> +PCI_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) LDFLAGS="$(TARGET_LDFLAGS)"
>  
>  define PCI_BUILD_CMDS
>  	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index ee308a85dfd1..38910cda7d75 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -19,7 +19,7 @@ PERF_ARCH=$(NORMALIZED_ARCH)
>  endif
>  
>  PERF_MAKE_FLAGS = \
> -	$(LINUX_MAKE_FLAGS) \
> +	$(LINUX_TOOLS_MAKE_OPTS) \
>  	JOBS=$(PARALLEL_JOBS) \
>  	ARCH=$(PERF_ARCH) \
>  	DESTDIR=$(TARGET_DIR) \
> diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
> index e29c7f59debd..144dd6616f2b 100644
> --- a/package/linux-tools/linux-tool-selftests.mk.in
> +++ b/package/linux-tools/linux-tool-selftests.mk.in
> @@ -22,7 +22,7 @@ SELFTESTS_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_OPENSSL),openssl)
>  
>  SELFTESTS_MAKE_FLAGS = \
> -	$(LINUX_MAKE_FLAGS) \
> +	$(LINUX_TOOLS_MAKE_OPTS) \
>  	ARCH=$(SELFTESTS_ARCH)
>  
>  # O must be redefined here to overwrite the one used by Buildroot for
> diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
> index 56c328c51fd7..7c33915049c2 100644
> --- a/package/linux-tools/linux-tool-tmon.mk.in
> +++ b/package/linux-tools/linux-tool-tmon.mk.in
> @@ -7,7 +7,7 @@
>  LINUX_TOOLS += tmon
>  
>  TMON_DEPENDENCIES = host-pkgconf ncurses
> -TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
> +TMON_MAKE_OPTS = $(LINUX_TOOLS_MAKE_OPTS) \
>  	CC=$(TARGET_CC) \
>  	LDFLAGS="$(TARGET_LDFLAGS)" \
>  	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
> diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
> index 81b1fbc17605..38bb2c83966a 100644
> --- a/package/linux-tools/linux-tools.mk
> +++ b/package/linux-tools/linux-tools.mk
> @@ -26,6 +26,8 @@ LINUX_TOOLS_PATCH_DEPENDENCIES = linux
>  # may install shared libraries and headers (e.g. cpupower).
>  LINUX_TOOLS_INSTALL_STAGING = YES
>  
> +LINUX_TOOLS_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CROSS_COMPILE="$(TARGET_CROSS)"
> +
>  LINUX_TOOLS_DEPENDENCIES += $(foreach tool,$(LINUX_TOOLS),\
>  	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
>  		$($(call UPPERCASE,$(tool))_DEPENDENCIES)))
> -- 
> 2.43.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
