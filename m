Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA30FF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 20:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D563940BD9;
	Tue,  5 May 2026 20:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyjeAkQ2jOxe; Tue,  5 May 2026 20:12:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C820540BC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778011969;
	bh=36aJ8zHH5YRVDnLqgN+GMJF3siZxOgClxPyr9Wu0yiA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=mE4kmNI2VJq769GDs/tcr3zj2gheEXrhf+EPqW+mByMpxl6OXP2kP0DXk2kDpxmJL
	 6E4dELiQNkmb0M3MZ890a04xOVCJdi5ep/ldqO+lK4QJOnbBmKUsMRaHMO1xOqkXUQ
	 900clJgBe0ooZm+5By0xVj9Dn8cfzqyNG/PtgR24Uw5d5u3GoRS+c7D9K2hp5NxDGP
	 IRM/hCNMozoeLMaiLr6/1sWVSTCEItviPLqWvHE0NGF39EsShbD49qe4lJ11THUKGQ
	 eUJ/ueJwfy18aW5RT/BFny+8pxJMWXyTKaIgJqnLuWyziWGHVlPgzAUDRaWvyrFuIg
	 qm7spUShg8JuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C820540BC8;
	Tue,  5 May 2026 20:12:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D09D1280
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C229D4040A
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZotalmWO8Nz for <buildroot@buildroot.org>;
 Tue,  5 May 2026 20:12:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A81B403F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A81B403F7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A81B403F7
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:12:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D8D15B97C2BC; Tue,  5 May 2026 22:12:45 +0200 (CEST)
Message-ID: <9e09615e-68c5-4128-a17a-f2436f3e154b@rnout.be>
Date: Tue, 5 May 2026 22:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Buildroot development <buildroot@buildroot.org>
References: <eabb6434-6827-48cb-bd2c-964b94ea07ba@grenoble.cnrs.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <eabb6434-6827-48cb-bd2c-964b94ea07ba@grenoble.cnrs.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1778011965; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Mbrpy0qTN03T7tCGYgN/+rrkUp2OIgOisDOPTNK2Qes=;
 b=plHDap94LcmX3Hit0E8gYOGfc+RkzL95MBjqs5VpmPOYIwuVecfISfro7qSIWGVi/31Jn0
 jIDyM/YP42WbwasPkTCYtH6xeDQWro3pAmvAUNfy9waeFfNjU2puAhZTgvGOhbZnaagCgw
 HY9LUBPonrmR2YVR5Mbz+L679qgPCi+LGrS0hVj9ZNFdN2il02x2OuppyzxBRU9CYEVvbg
 AByRHKiRCfTUSnyx7/5c6u3JhV4OUeWE1RoPV/oEY8uClRVvBBVegbDOAMhR02DCk9kZKp
 h6xXISNpoSpVdA90XlvHVCAhMhuu1R6u4UWAZYy6BDpxf2uuvyxJfqPfRbNbEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=plHDap94
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpiod: enable the kernel
 GPIO ABI v1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/04/2026 16:09, Edgar Bonet via buildroot wrote:
> Unlike libgpiod2, this version of libgpiod relies on the deprecated GPIO
> ABI version 1. This ABI used to be enabled by default. However, since
> Linux 7.1-rc1 (commit 7673e4c7f7f9 "Do not enable the v1 uAPI by
> default"), this is not the case anymore. Failing to enable the ABI
> results in a non-functional libgpiod. For instance:
> 
>      # gpioinfo
>      gpioinfo: error creating line iterator: Invalid argument
> 
> Fix this by enabling the ABI v1 in LIBGPIOD_LINUX_CONFIG_FIXUPS.

  This option only exists since 5.10. But that doesn't matter, 
KCONFIG_ENABLE_OPT doesn't complain if the option you set doesn't end up in the 
.config after all.

> 
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> ---
> I noticed the problem on an Acmesystems Acqua-A5 board. Tested the patch
> in qemu as follows:
> 
>      sed -i -e '/# CONFIG_GPIOLIB is not set/d' \
>          board/qemu/arm-versatile/linux.fragment
>      make qemu_arm_versatile_defconfig
>      utils/config -d PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18
>      utils/config -e PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_0  # "7.0 or later"
>      utils/config -d DOWNLOAD_FORCE_CHECK_HASHES
>      utils/config --set-str LINUX_KERNEL_CUSTOM_VERSION_VALUE 7.1-rc1
>      utils/config -e PACKAGE_LIBGPIOD
>      utils/config -e PACKAGE_LIBGPIOD_TOOLS
>      make
>      output/images/start-qemu.sh
> ---
>   package/libgpiod/libgpiod.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
> index f669643b39..f5584a9f1e 100644
> --- a/package/libgpiod/libgpiod.mk
> +++ b/package/libgpiod/libgpiod.mk
> @@ -24,6 +24,10 @@ else
>   LIBGPIOD_CONF_OPTS += --disable-tools
>   endif
>   
> +define LIBGPIOD_LINUX_CONFIG_FIXUPS
> +    $(call KCONFIG_ENABLE_OPT,CONFIG_GPIO_CDEV_V1)

  This should be indented with tab instead of spaces (check-package warning).

  Please run check-package before submitting!

  Applied to master with that fixed, thanks.
  Regards,
  Arnout

> +endef
> +
>   ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
>   LIBGPIOD_CONF_OPTS += --enable-bindings-cxx
>   else

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
