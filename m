Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83040C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:37:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3B5B61165
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3B5B61165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C293460AE1;
	Wed, 13 Oct 2021 19:37:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lObrWjNCE0AP; Wed, 13 Oct 2021 19:37:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEC6060AFC;
	Wed, 13 Oct 2021 19:37:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E61591BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF54682D0F
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwvUopg5v-TW for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:37:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72BEF82CFA
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:37:19 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id ec8so14658101edb.6
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3YWtKj5gVpDCvsZNXnobIYASnD04G8omglRoQ1ly6n4=;
 b=UBjYpY0hD/v6Ou1sGG+mf9ni4IZgHHE/f4dYMukYXwwwGjJ47T61L47CenYNkjm19M
 /1o7cNcNDAGKofne2afygtoLbTl/Ibjuzt2zHhjnF2P3DxmhqBqmFIFPHpdRYYJxwXDl
 eZHWP7RHuzW4Dl3/NGd0ZJiETr02Si/3yj1+QHBdhv0n+kOS1wISFKD7BNwPeSQV1CGe
 sPpQ8tOW52bjFGblqX75g9hJpj+IKEY/mXT4k3KbJOP8fOzZQ/hhELlqWyFoQi8gCp+e
 cJThQwwwrfTT8F/3MRXoQBrJ3jWBhn+EevK67Opk8MNDZZ2wbCQFzjLSiwjrhtH2z9YF
 rDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3YWtKj5gVpDCvsZNXnobIYASnD04G8omglRoQ1ly6n4=;
 b=H+HxX/meJcJZ2V9ZsxcHMKgkn5SAC1cf2/hIYpcN8hRldLbyIRrWHvWyHg/5J3UadU
 jaH6BCh7fxxPa+07CW8kCJNnoAdw7B89YKJOkCpzyVk2zEIrRgcCGIjJMh4i2kvfdx3D
 9gODQnJYUJduLz4IUrPHbR18UHp453wk0WQG8KHzISmf5WPh2IaFHSpCDGCoGaQftdXj
 22qFPWQpBiGT5Tp/13lITwxln3CCMq6/fGXZMRo2+02vIZsHJ1vagMsl/iSyVnvJfAhu
 UefHLeu/zZglXgG4zmwci/eK7L1s120n/weM7T8LHu4EHgYBQFzDxVfAyJuPCc/uzAVV
 zlPg==
X-Gm-Message-State: AOAM5301Zyd1CdtTEMkIBvafv3z7DOIamKhZimvGwYvgBp+HRAaXLlPa
 +a8THPlL2D9+RGX32U/GBy3J8FgNrYocVg==
X-Google-Smtp-Source: ABdhPJxpcy02UwCcJ4eTh9Gx3LYd5IMwBsm53H9Yp7jJe55ZMVYFHcFVapfuTgv47KTs9POPvgMFjg==
X-Received: by 2002:a17:906:3ac6:: with SMTP id
 z6mr1413439ejd.196.1634153837483; 
 Wed, 13 Oct 2021 12:37:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g17sm394200edv.72.2021.10.13.12.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:37:17 -0700 (PDT)
Message-ID: <39871ee2-d339-702c-ca4f-d57366b339c4@mind.be>
Date: Wed, 13 Oct 2021 21:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
 <20211006204135.2813745-8-chris.dimich@boundarydevices.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006204135.2813745-8-chris.dimich@boundarydevices.com>
Subject: Re: [Buildroot] [PATCH 08/12] package/freescale-imx/isp-imx: add
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 22:41, Chris Dimich wrote:
> i.MX Verisilicon Software ISP.

  Same as for vvcam, I wonder if it makes sense to add a symbol for this in 
freescal-imx/Config.in

> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>   package/freescale-imx/Config.in               |   1 +
>   .../isp-imx/0001-run.sh-fix-bashisms.patch    | 201 ++++++++++++++++++
>   ...rt_isp.sh-refine-device-tree-parsing.patch |  28 +++
>   package/freescale-imx/isp-imx/Config.in       |  15 ++
>   package/freescale-imx/isp-imx/S80isp          |  18 ++
>   package/freescale-imx/isp-imx/isp-imx.hash    |   4 +
>   package/freescale-imx/isp-imx/isp-imx.mk      |  65 ++++++
>   7 files changed, 332 insertions(+)
>   create mode 100644 package/freescale-imx/isp-imx/0001-run.sh-fix-bashisms.patch
>   create mode 100644 package/freescale-imx/isp-imx/0001-start_isp.sh-refine-device-tree-parsing.patch
>   create mode 100644 package/freescale-imx/isp-imx/Config.in
>   create mode 100755 package/freescale-imx/isp-imx/S80isp
>   create mode 100644 package/freescale-imx/isp-imx/isp-imx.hash
>   create mode 100644 package/freescale-imx/isp-imx/isp-imx.mk
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 5f02d24909..0f0f5c50fd 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -117,6 +117,7 @@ source "package/freescale-imx/imx-sc-firmware/Config.in"
>   source "package/freescale-imx/imx-seco/Config.in"
>   source "package/freescale-imx/imx-vpu-hantro-vc/Config.in"
>   source "package/freescale-imx/isp-vvcam-module/Config.in"
> +source "package/freescale-imx/isp-imx/Config.in"
>   if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
>   source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
>   source "package/freescale-imx/libz160/Config.in"
> diff --git a/package/freescale-imx/isp-imx/0001-run.sh-fix-bashisms.patch b/package/freescale-imx/isp-imx/0001-run.sh-fix-bashisms.patch
> new file mode 100644
> index 0000000000..cbbc31906c
> --- /dev/null
> +++ b/package/freescale-imx/isp-imx/0001-run.sh-fix-bashisms.patch
> @@ -0,0 +1,201 @@
> +From 7c5c07a24c9e77d69002c6a9aefd1cc5a7a0615f Mon Sep 17 00:00:00 2001
> +From: Chris Dimich <Chris.Dimich@boundarydevices.com>
> +Date: Tue, 28 Sep 2021 17:27:33 -0700
> +Subject: [PATCH 1/1] run.sh: fix bashisms

  Again: remove the 1/1 part.

  The patch needs your signed-off-by as well.

  Please send the patch upstream, and add something like

Upstream: <URL>

If there's no upstream to send to (likely, in this case), add something like:

Upstream: nowhere to send it to

[snip]
> diff --git a/package/freescale-imx/isp-imx/Config.in b/package/freescale-imx/isp-imx/Config.in
> new file mode 100644
> index 0000000000..04d17284d4
> --- /dev/null
> +++ b/package/freescale-imx/isp-imx/Config.in
> @@ -0,0 +1,15 @@
> +comment "isp-imx requires aarch64"
> +	depends on !BR2_aarch64
> +
> +comment "isp-imx requires g2d library"
> +	depends on !BR2_PACKAGE_IMX_GPU_G2D
> +
> +config BR2_PACKAGE_ISP_IMX
> +	bool "isp-imx"
> +	depends on BR2_aarch64 # Only relevant for i.MX8
> +	depends on BR2_PACKAGE_IMX_GPU_G2D

  Instead of depending on g2d, you should select it (and copy its dependencies, 
with a comment behind them to show where they come from).

> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_LINUX_IMX_HEADERS
> +	select BR2_PACKAGE_PYTHON3
> +	help
> +	  i.MX Verisilicon Software ISP.
> diff --git a/package/freescale-imx/isp-imx/S80isp b/package/freescale-imx/isp-imx/S80isp
> new file mode 100755
> index 0000000000..a41028fde8
> --- /dev/null
> +++ b/package/freescale-imx/isp-imx/S80isp
> @@ -0,0 +1,18 @@
> +#! /bin/sh
> +
> +case "$1" in
> +	start|"")
> +		/bin/sh /opt/imx8-isp/bin/start_isp.sh &
> +		;;
> +	stop)

  Is there really no stop?

> +		;;
> +	restart|reload)
> +		$0 stop
> +		sleep 1
> +		$0 start
> +		;;
> +	*)
> +		echo "Usage: $0 {start|stop}" >&2
> +		exit 1
> +		;;
> +esac
> diff --git a/package/freescale-imx/isp-imx/isp-imx.hash b/package/freescale-imx/isp-imx/isp-imx.hash
> new file mode 100644
> index 0000000000..03bc61347f
> --- /dev/null
> +++ b/package/freescale-imx/isp-imx/isp-imx.hash
> @@ -0,0 +1,4 @@
> +# Locally computed:
> +sha256  e775975684aab4211f0bf8c5e2c6604ba46b83c5586937000675e044a50d77b8  isp-imx-4.2.2.13.0.bin
> +sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
> +sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
> diff --git a/package/freescale-imx/isp-imx/isp-imx.mk b/package/freescale-imx/isp-imx/isp-imx.mk
> new file mode 100644
> index 0000000000..a05b7749b1
> --- /dev/null
> +++ b/package/freescale-imx/isp-imx/isp-imx.mk
> @@ -0,0 +1,65 @@
> +################################################################################
> +#
> +# isp-imx
> +#
> +################################################################################
> +
> +ISP_IMX_VERSION = 4.2.2.13.0
> +ISP_IMX_SITE = $(FREESCALE_IMX_SITE)
> +ISP_IMX_SOURCE = isp-imx-$(ISP_IMX_VERSION).bin
> +ISP_IMX_DEPENDENCIES = linux linux-imx-headers python3 libdrm imx-gpu-g2d
> +ISP_IMX_LICENSE = NXP Semiconductor Software License Agreement
> +ISP_IMX_LICENSE_FILES = EULA COPYING
> +ISP_IMX_REDISTRIBUTE = NO
> +ISP_IMX_SUBDIR = appshell
> +
> +ISP_IMX_CONF_OPTS += \
> +    -DCMAKE_BUILD_TYPE=release \
> +    -DISP_VERSION=ISP8000NANO_V1802 \
> +    -DPLATFORM=ARM64 \
> +    -DAPPMODE=V4L2 \
> +    -DQTLESS=1 \
> +    -DFULL_SRC_COMPILE=1 \
> +    -DWITH_DRM=1 \
> +    -DWITH_DWE=1 \
> +    -DSERVER_LESS=1 \
> +    -DSUBDEV_V4L2=1 \
> +    -DENABLE_IRQ=1 \
> +    -DPARTITION_BUILD=0 \
> +    -D3A_SRC_BUILD=0 \
> +    -Wno-dev
> +
> +ISP_IMX_CONF_ENV += SDKTARGETSYSROOT=$(STAGING_DIR)
> +
> +define ISP_IMX_EXTRACT_CMDS
> +	$(call FREESCALE_IMX_EXTRACT_HELPER,$(ISP_IMX_DL_DIR)/$(ISP_IMX_SOURCE))
> +endef
> +
> +define ISP_IMX_INSTALL_TARGET_CMDS

  A CMake package usually has a working install command. If it doesn't work in 
this case, please explain in the commit log why not.

  If the cmake install just misses a few files, then you can install those in a 
post-install hook.

> +	mkdir -p $(TARGET_DIR)/opt/imx8-isp/bin

  We don't install stuff in /opt. In fact, we go out of our way to patch scripts 
etc. so we can install things in /usr. There could be an exception for this 
package, but then there needs to be a *very* good explanation in the commit message.

  Regards,
  Arnout

> +	cp -r $(@D)/$(ISP_IMX_SUBDIR)/generated/release/bin/*2775* $(TARGET_DIR)/opt/imx8-isp/bin
> +	cp -r $(@D)/$(ISP_IMX_SUBDIR)/generated/release/bin/isp_media_server $(TARGET_DIR)/opt/imx8-isp/bin
> +	cp -r $(@D)/$(ISP_IMX_SUBDIR)/generated/release/bin/*_test $(TARGET_DIR)/opt/imx8-isp/bin
> +	cp -r $(@D)/$(ISP_IMX_SUBDIR)/generated/release/bin/vvext $(TARGET_DIR)/opt/imx8-isp/bin
> +	cp -r $(@D)/dewarp/dewarp_config $(TARGET_DIR)/opt/imx8-isp/bin
> +	cp -r $(@D)/mediacontrol/case/ $(TARGET_DIR)/opt/imx8-isp/bin
> +	cp -r $(@D)/$(ISP_IMX_SUBDIR)/generated/release/lib/*.so* $(TARGET_DIR)/usr/lib/
> +
> +	cp $(@D)/imx/run.sh $(TARGET_DIR)/opt/imx8-isp/bin
> +	cp $(@D)/imx/start_isp.sh $(TARGET_DIR)/opt/imx8-isp/bin
> +
> +	chmod +x $(TARGET_DIR)/opt/imx8-isp/bin/run.sh
> +	chmod +x $(TARGET_DIR)/opt/imx8-isp/bin/start_isp.sh
> +endef
> +
> +define ISP_IMX_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 $(@D)/imx/imx8-isp.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/imx8-isp.service
> +endef
> +
> +define ISP_IMX_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 package/freescale-imx/isp-imx/S80isp \
> +		$(TARGET_DIR)/etc/init.d/S80isp
> +endef
> +
> +$(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
