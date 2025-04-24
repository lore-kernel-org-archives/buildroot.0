Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7199CC369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 21:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F369D60B1F;
	Thu, 24 Apr 2025 21:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOFpzZs9_rgR; Thu, 24 Apr 2025 21:51:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 032C16067C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 032C16067C;
	Thu, 24 Apr 2025 21:51:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75B75968
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CA74401AD
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhsVxE5VdNT6 for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 21:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4028E4015A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4028E4015A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4028E4015A
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:51:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E50B41BC0;
 Thu, 24 Apr 2025 21:51:47 +0000 (UTC)
Date: Thu, 24 Apr 2025 23:51:46 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>, Robin Jarry
 <robin@jarry.cc>, Julien Olivain <ju.o@free.fr>
Message-ID: <20250424235146.4ab41fce@windsurf>
In-Reply-To: <20250403153950.6407-3-maxime@leroys.fr>
References: <20250328084743.8759-1-maxime@leroys.fr>
 <20250403153950.6407-1-maxime@leroys.fr>
 <20250403153950.6407-3-maxime@leroys.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedvjedvgfffveetieffudegieevleeigfffteefhefhtefhueelfeekjefgfedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepmhgrgihimhgvsehlvghrohihshdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtt
 hhopehvjhgrrhguihhnsehfrhgvvgdrfhhrpdhrtghpthhtoheprhhosghinhesjhgrrhhrhidrtggtpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745531507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+ZVrjRgU/zJc4wthAnFsdNCgNwFiEmEsyYPflVk6js=;
 b=UghAayQRW2NTXn8KJ57xXqDxfU1nevn76SD5OPqSuBXEDbfwjjs+8kj66av7bFAUCCIzmX
 Dh+xMZQGPzUV3meUjQqT/UXQJOpb1yRTMjpgTQq/iFzJgzT8P+0II/PVaqhL7aQ1mvLUSU
 N/ZdrEp2a502BobAGKZzetrPvwXqbTpyl3hqd8gUF3gnWY/cilwYv/KYgFY4kAuJizgHgd
 FF0fwYiIg7rkztMBDKS/gh9vnS9x7Ph4RgLqUBbI6dSnOKNHQKErhgfR+eI9xXKRM+73MW
 uSLP9b7tVGtBO0FT+cXQWmFHQF1JNnfmJmDhjjQ9scVzuHntlrsX3l66IyKddA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UghAayQR
Subject: Re: [Buildroot] [PATCH v4 2/3] package/grout: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Maxime,

Thanks for your patch! I have applied it, after doing a number of
changes, see below.

On Thu,  3 Apr 2025 17:39:49 +0200
Maxime Leroy <maxime@leroys.fr> wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1c84f95943..1cbbf829c5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2384,6 +2384,9 @@ F:	package/libtraceevent/
>  F:	package/libtracefs
>  F:	package/linux-tools/linux-tool-rtla.mk.in
>  
> +N:	Maxime Leroy <maxime@leroys.fr>
> +F:	package/grout

                     ^^ Nit: missing final slash.


> diff --git a/package/grout/Config.in b/package/grout/Config.in
> new file mode 100644
> index 0000000000..a39c3283eb
> --- /dev/null
> +++ b/package/grout/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_GROUT
> +	bool "grout"
> +	depends on BR2_ENABLE_LOCALE

I really wasn't sure about this dependency, because that doesn't
guarantee you that a UTF-8 locale is present, only that the toolchain
has locale support, which is different. So I dropped this dependency.

However, you had forgotten to replicate the dependencies of the options
you select, so I had to add:

+       depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS # dpdk
+       depends on BR2_TOOLCHAIN_HAS_THREADS # dpdk
+       depends on BR2_USE_MMU # dpdk, numactl, libecoli, util-linux-smartcols, libcap
+       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # dpdk
+       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19 # dpdk
+       depends on BR2_TOOLCHAIN_USES_GLIBC # dpdk
+       depends on BR2_TOOLCHAIN_HAS_ATOMIC # numactl
+       depends on !BR2_STATIC_LIBS # libecoli
+       depends on BR2_USE_WCHAR # libecoli

> +	select BR2_PACKAGE_DPDK
> +	select BR2_PACKAGE_LIBEVENT
> +	select BR2_PACKAGE_NUMACTL
> +	select BR2_PACKAGE_LIBECOLI
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS

libcap was missing here, it is required by grout, so I added:

+       select BR2_PACKAGE_LIBCAP

(at the proper location to preserve alphabetic ordering)

> +	help
> +	  Graph router based on DPDK
> +
> +	  NOTE: grout needs a working UTF-8 locale (BR2_GENERATE_LOCALE)

The Config.in comment about the dependencies was missing, so I added
this:

+comment "grout needs a glibc toolchain w/ dynamic library, threads, wchar, gcc >= 4.9, headers >= 4.19"
+       depends on BR2_USE_MMU
+       depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
+       depends on BR2_TOOLCHAIN_HAS_ATOMIC
+       depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+               !BR2_TOOLCHAIN_USES_GLIBC || \
+               !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+               !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19

> diff --git a/package/grout/grout.mk b/package/grout/grout.mk
> new file mode 100644
> index 0000000000..a75af27978
> --- /dev/null
> +++ b/package/grout/grout.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# grout
> +#
> +################################################################################
> +
> +GROUT_VERSION = 0.9.0

Since 0.9.1 was out, I used this one instead.

> +GROUT_SITE = https://github.com/DPDK/grout/archive/refs/tags
> +GROUT_SOURCE = v$(GROUT_VERSION).tar.gz

I used the github macro instead, because you're anyway using the
auto-generated tarball:

+GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))

> +GROUT_LICENSE = BSD-3-Clause
> +GROUT_LICENSE_FILES = LICENSE
> +
> +# Avoid using buildroot commit hash
> +GROUT_CONF_ENV += GROUT_VERSION=$(GROUT_VERSION)
> +
> +GROUT_DEPENDENCIES = \
> +	host-pkgconf \
> +	dpdk \

I added libcap here.

> +	libevent \
> +	numactl \
> +	libecoli \
> +	util-linux
> +
> +$(eval $(meson-package))

Applied with all those changes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
