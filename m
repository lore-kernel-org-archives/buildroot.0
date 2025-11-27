Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEBED111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5B0B616F3;
	Thu, 27 Nov 2025 20:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXIOy8zHB4OG; Thu, 27 Nov 2025 20:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCF2F615A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCF2F615A8;
	Thu, 27 Nov 2025 20:00:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63F48708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55A5D615A8
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MtMoC0jginS for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:00:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DB6D60A5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DB6D60A5D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DB6D60A5D
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:00:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 884C1B979CA9; Thu, 27 Nov 2025 21:00:40 +0100 (CET)
Message-ID: <a5eabc60-ead7-4ea8-b92a-fa3470014c39@rnout.be>
Date: Thu, 27 Nov 2025 21:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: Tudor Holton <buildroot@tudorholton.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
References: <20251114140519.541039-1-thomas@devoogdt.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251114140519.541039-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273641; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=PuwB5X1JCyzVprpl9ujB0plbuy5ffy5puHyF2gJb53s=;
 b=ocKfMAUVG1knlbIQ4ZZovo6L+i+ECW43DR9zEAa2kZBk6GjL8jyhVuB2gZG6vpN3w1U/Xz
 ISh6RNniV28iSGNfEFB9DPKwrrrX4Icx4U7qj7JAu9NAY4JwjemHDn6bgPXTaxeZzwqo3l
 leh+tWbR4bDnL7BcOwzJLsoZmN9bQm2AQdV970zTj66dmUh5nr19KhbFPsdKnYr0nT4cmh
 5ycke1SSnhELw8CudA9wjH7u+L8uo3O8a1pr/rzQ4DtxgG46qVNzWBNyygyitKNyIo1bN9
 YJZhKG6gOW+95dP/jfMmw6gmXC5iUYHySXu1RJoBp/Sr7qihsZgSu8RVHgYmkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ocKfMAUV
Subject: Re: [Buildroot] [PATCH] package/openjdk{,
 -bin}: fix wrong version reporting
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



On 14/11/2025 15:05, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Before:
> 
> $ java --version
> openjdk 17 2024-07-16
> OpenJDK Runtime Environment (build 17+17)
> OpenJDK 64-Bit Server VM (build 17+17, mixed mode)
> 
> After:
> 
> $ java --version
> openjdk 17.0.12 2024-07-16
> OpenJDK Runtime Environment (build 17.0.12+7)
> OpenJDK 64-Bit Server VM (build 17.0.12+7, mixed mode)
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/openjdk-bin/openjdk-bin.mk |  8 +++++---
>   package/openjdk/openjdk.mk         | 13 ++++++++-----
>   2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
> index 17056e80b7..e6c74cf6d8 100644
> --- a/package/openjdk-bin/openjdk-bin.mk
> +++ b/package/openjdk-bin/openjdk-bin.mk
> @@ -6,10 +6,12 @@
>   
>   ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
>   HOST_OPENJDK_BIN_VERSION_MAJOR = 21
> -HOST_OPENJDK_BIN_VERSION_MINOR = 0.4_7
> +HOST_OPENJDK_BIN_VERSION_MINOR = 0.4
> +HOST_OPENJDK_BIN_VERSION_BUILD = 7
>   else
>   HOST_OPENJDK_BIN_VERSION_MAJOR = 17
> -HOST_OPENJDK_BIN_VERSION_MINOR = 0.12_7
> +HOST_OPENJDK_BIN_VERSION_MINOR = 0.12
> +HOST_OPENJDK_BIN_VERSION_BUILD = 7
>   endif
>   
>   ifeq ($(HOSTARCH),x86_64)
> @@ -19,7 +21,7 @@ ifeq ($(HOSTARCH),aarch64)
>   HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = aarch64
>   endif
>   
> -HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
> +HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)_$(HOST_OPENJDK_BIN_VERSION_BUILD)
>   HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
>   HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
>   
> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> index f59eb69782..1ec9863e98 100644
> --- a/package/openjdk/openjdk.mk
> +++ b/package/openjdk/openjdk.mk
> @@ -6,12 +6,15 @@
>   
>   ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
>   OPENJDK_VERSION_MAJOR = 21
> -OPENJDK_VERSION_MINOR = 0.4+7
> +OPENJDK_VERSION_MINOR = 0.4
> +OPENJDK_VERSION_BUILD = 7
> +
>   else
>   OPENJDK_VERSION_MAJOR = 17
> -OPENJDK_VERSION_MINOR = 0.12+7
> +OPENJDK_VERSION_MINOR = 0.12
> +OPENJDK_VERSION_BUILD = 7
>   endif
> -OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
> +OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)+$(OPENJDK_VERSION_BUILD)
>   OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
>   
>   OPENJDK_LICENSE = GPL-2.0+ with exception
> @@ -102,8 +105,8 @@ OPENJDK_CONF_OPTS = \
>   	--with-native-debug-symbols=none \
>   	--without-version-pre \
>   	--with-sysroot=$(STAGING_DIR) \
> -	--with-version-build="$(OPENJDK_VERSION_MAJOR)" \
> -	--with-version-string="$(OPENJDK_VERSION_MAJOR)"
> +	--with-version-build="$(OPENJDK_VERSION_BUILD)" \
> +	--with-version-string="$(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)"
>   
>   # If building for AArch64, use the provided CPU port.
>   ifeq ($(BR2_aarch64),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
