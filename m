Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C10C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2827482319;
	Wed,  7 Feb 2024 16:01:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwRx2eEZm9P4; Wed,  7 Feb 2024 16:01:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30A98832B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30A98832B3;
	Wed,  7 Feb 2024 16:01:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 300361BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D39D832C2
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJaLuCpKFy8p for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:01:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1AD8F832B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AD8F832B3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AD8F832B3
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:01:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A04C213F8AE;
 Wed,  7 Feb 2024 17:01:39 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 17:01:39 +0100
Date: Wed, 7 Feb 2024 17:01:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZcOpY6BjPUgrj5r-@landeda>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
 <20240202093625.1409559-6-antoine.coutant@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240202093625.1409559-6-antoine.coutant@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707321705;
 bh=UH+cwmDXkVPQrJrQEl5M7HPgXK5D0tqYC25wYHRe2Jw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y9L+82f+MDirZUgJ1G6IzHnTWseJ5+JTKyka1PkE8bQ3TnWoicQB4kDUj/R8WixFn
 EKxXclre0NvnwUSh3O35twNxuQYGMnE6q0r1JH7taCRi/ypm2Lrciili3A+jcO+29y
 y470y12c6PUM+9UkyEXh4O5bqVRBrY6EhO5LHBzQy0bhUGY19Rb3XRrqV/WhktpLYM
 DZEelEgYOcsG7iFaU3JCIwhuh8psDXerCF9NW7Wjw6/6lMssWfp51mHSqh+kNYHfi3
 rdS4iyq6aiPpIZDA2yZar+n539uyFK3V7HH7EMNJ0xP9azKLQAklPJrBf3O9HfZGP3
 R1NKsgsE0yUIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y9L+82f+
Subject: Re: [Buildroot] [PATCH v4 5/7] package/opencl-icd-loader: new
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
Cc: sebastian.weyer@smile.fr, bernd@kuhls.net, romain.naour@smile.fr,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Antoine, All,

On 2024-02-02 10:36 +0100, Antoine Coutant spake thusly:
> From: Sebastian Weyer <sebastian.weyer@smile.fr>
> 
> With this package it is possible to have multiple implementations of
> OpenCL at the same time. This package provides a libOpenCL.so file that
> captures the OpenCL API calls and forwards them to the correct
> implementation of OpenCL. OpenCL implementations can be manually
> registered by creating a file containing its full file path in
> /etc/OpenCL/vendors/<implementation>.icd[1]
> 
> This package is required by certain OpenCL implementations, for example
> Mesa3D's Clover implementation if it is not built in standalone mode.
> 
> [1] https://github.com/KhronosGroup/OpenCL-ICD-Loader#registering-icds
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> ---
[--SNIP--]
> diff --git a/package/opencl-icd-loader/Config.in b/package/opencl-icd-loader/Config.in
> new file mode 100644
> index 0000000000..405dc5401a
> --- /dev/null
> +++ b/package/opencl-icd-loader/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_OPENCL_ICD_LOADER
> +	bool "OpenCL-ICD-Loader"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_HAS_LIBOPENCL
> +	select BR2_PACKAGE_OPENCL_HEADERS

Following on the review of the previous patch: maybe that could rely on
mesa3d-headers, and if so, we'ds not need to introduce a new
opencl-headers package.

Regards,
Yann E. MORIN.

> +	help
> +	  OpenCL defines an Installable Client Driver (ICD) mechanism to
> +	  allow developers to build applications against an Installable
> +	  Client Driver loader (ICD loader) rather than linking their
> +	  applications against a specific OpenCL implementation.
> +
> +	  https://github.com/KhronosGroup/OpenCL-ICD-Loader
> diff --git a/package/opencl-icd-loader/opencl-icd-loader.hash b/package/opencl-icd-loader/opencl-icd-loader.hash
> new file mode 100644
> index 0000000000..1c894f1293
> --- /dev/null
> +++ b/package/opencl-icd-loader/opencl-icd-loader.hash
> @@ -0,0 +1,3 @@
> +# locally generated
> +sha256  af8df96f1e1030329e8d4892ba3aa761b923838d4c689ef52d97822ab0bd8917  OpenCL-ICD-Loader-2023.12.14.tar.gz
> +sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/opencl-icd-loader/opencl-icd-loader.mk b/package/opencl-icd-loader/opencl-icd-loader.mk
> new file mode 100644
> index 0000000000..04f6fb4b85
> --- /dev/null
> +++ b/package/opencl-icd-loader/opencl-icd-loader.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# opencl-icd-loader
> +#
> +################################################################################
> +
> +OPENCL_ICD_LOADER_VERSION = 2023.12.14
> +OPENCL_ICD_LOADER_SOURCE = OpenCL-ICD-Loader-$(OPENCL_ICD_LOADER_VERSION).tar.gz
> +OPENCL_ICD_LOADER_SITE = $(call github,KhronosGroup,OpenCL-ICD-Loader,v$(OPENCL_ICD_LOADER_VERSION))
> +OPENCL_ICD_LOADER_LICENSE = Apache-2.0
> +OPENCL_ICD_LOADER_LICENSE_FILES = LICENSE
> +OPENCL_ICD_LOADER_INSTALL_STAGING = YES
> +
> +OPENCL_ICD_LOADER_DEPENDENCIES = opencl-headers
> +
> +OPENCL_ICD_LOADER_CONF_OPTS += -DOPENCL_ICD_LOADER_HEADERS_DIR=$(STAGING_DIR)/usr/include
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
