Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D889FCD6E43
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 10:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 758514230F;
	Fri, 29 May 2026 10:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQanM-jAKHG9; Fri, 29 May 2026 10:34:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4611942267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780050845;
	bh=drOIwT6YyMksslwDaYslRu3Hges5ZubntNEt6K9a6KM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gEo+NSd2Jo+SvG5qoOOgolMdIyNXR90CqFPSMhrVaUHhK/IvoarE1PkM95su5wNqY
	 Ld+kGwfL4tmJKD8fQ/tDoPPkjNolcrFg1H/0BQ6IoTkYI7eipBdl5rEk8wd1AOV04P
	 qzYo7CCG7eSNkD5hHlHDOOJNJvoCClGyb6FpoDP/M2hHB9U+Z3tNIqqJi7F2kGCPvN
	 XTsvoPiySFUy1l65eRtyF/LKDROaqMQusMbKpraITUPXEZJTt4t+vIWF9BL9FcUPLD
	 1RC3PsRPdOShOJJeAZJ5K+4MgJzJ3e4883jQW/lKvgVa5L0TDSAc3tPir7EUF9+6jx
	 890NHcXyS/xSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4611942267;
	Fri, 29 May 2026 10:34:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CFB9288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DBF442267
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jv2kwdHN7oBN for <buildroot@buildroot.org>;
 Fri, 29 May 2026 10:34:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B1B842266
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B1B842266
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B1B842266
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:34:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AB8C9B97C6DC; Fri, 29 May 2026 12:33:58 +0200 (CEST)
Message-ID: <50d86374-e46f-4d9c-8332-f1426ee821fb@rnout.be>
Date: Fri, 29 May 2026 12:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260506184057.665854-1-bernd@kuhls.net>
 <20260506184057.665854-2-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260506184057.665854-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780050840; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=J656To1NFzI2feqp2Pv6VdqptYtLNDdFgJAmapCD4RA=;
 b=IhyA2V1yFs9zI5N1LWimePWvw0TcJCtzK5QhHqpwrCvxCit4y9kFjb7RiUxNERBq6uPcv9
 Iwnb05Jnbw7Pwk1nsy+Bwv36PGxSvLe6227ier17/gl06yLL+l50HjiL1z/JI7cXNPqb2p
 lQH8xHRmGDEpS9GBVM9QeiWmBIOd50z1HfZHycUeZ5byWKL8I3qH4jf7TNioOYfBDWFWay
 jV8SdXYOZS6O5W7W3RgInsB58IQDoJHWsG2YtgskAR/dPSpilSz6J3EDT+c+zJhHh3lKcZ
 iElka7l1WQmcrcjNqCmYaiDRW2J5H2ioc2lhyM31B4S7UjXahDNbZ6CtvR4YaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=IhyA2V1y
Subject: Re: [Buildroot] [PATCH 01/12] package/libudev-zero: new package
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



On 06/05/2026 20:40, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[snip]
> diff --git a/package/libudev-zero/libudev-zero.mk b/package/libudev-zero/libudev-zero.mk
> new file mode 100644
> index 0000000000..122ed2b7bf
> --- /dev/null
> +++ b/package/libudev-zero/libudev-zero.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# libudev-zero
> +#
> +################################################################################
> +
> +LIBUDEV_ZERO_VERSION = 1.0.3
> +LIBUDEV_ZERO_SITE = $(call github,illiliti,libudev-zero,$(LIBUDEV_ZERO_VERSION))
> +LIBUDEV_ZERO_LICENSE = ISC
> +LIBUDEV_ZERO_LICENSE_FILES = LICENSE
> +LIBUDEV_ZERO_INSTALL_STAGING = YES
> +
> +define LIBUDEV_ZERO_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(TARGET_CONFIGURE_OPTS)
> +endef
> +
> +define LIBUDEV_ZERO_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> +		$(MAKE) DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/ install

  The TARGET_CONFIGURE_OPTS is passed in the environment here, while in the 
build step it's passed on the command line. That is subtly different w.r.t. 
overrides and how it's propagated to subcommands. So to avoid surprises, I 
rewrote it to be the same (following the pattern of the build step everywhere).

  Regards,
  Arnout

> +endef
> +
> +define LIBUDEV_ZERO_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> +		$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/ install
> +endef
> +
> +$(eval $(generic-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
