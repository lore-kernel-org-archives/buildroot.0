Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87659E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 22:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1FE580CC1;
	Sat, 28 Dec 2024 22:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQxxgyhYKQxr; Sat, 28 Dec 2024 22:40:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 721B280CA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 721B280CA3;
	Sat, 28 Dec 2024 22:40:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E36F1C8
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B19614012A
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqZC_0QKkPPA for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 22:40:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 257F440217
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 257F440217
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 257F440217
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:40:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 129CB1BF203;
 Sat, 28 Dec 2024 22:40:40 +0000 (UTC)
Date: Sat, 28 Dec 2024 23:40:40 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, Jan
 =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>
Message-ID: <20241228234040.54baae9d@windsurf>
In-Reply-To: <20241219152105.298310-2-heiko.thiery@gmail.com>
References: <20241219152105.298310-1-heiko.thiery@gmail.com>
 <20241219152105.298310-2-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735425641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cAQLKG1gklcl0HOY8GcvSduaFoX51PmF5iv8ihpPeRE=;
 b=cwDVkm4Zv/278omYgzwg/8KzE9TR/Hokj/y7RpOPiQYH9HoxGlmS8UNSHktTpe+udKV51t
 eGOQnnIgn7Fsn5kFNKRoib8wGoBu1dcNmwQY/+zL157PcGBlR0x/F7sBniho/OT0h4Hqoq
 OeuQ50LHfF6WxGVAi2wF0pwcRW+7/hWJnxrwjN2se0JHQVGn6q9CbFZ2rcAjS+IixGivV2
 LcTwIXXBelFVFLxKNYhEdXpLvHiEo0+UzKACJ+V88hfhzalUKwmkTbQvWwzMXGX1kueIp0
 A4o5CXGtzQnrXYwo6evOr5zBL2qcK5BukV1CN3oXPtWZiQADF6a3OG3DdXUbzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cwDVkm4Z
Subject: Re: [Buildroot] [PATCH 2/6] package/libnetconf2: bump to version
 3.5.1
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

Hello Heiko,

On Thu, 19 Dec 2024 16:21:03 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Since version 3.x the options for TLS and SSH are merged to SSH_TLS. Thus
> we also require LIBCURL. The openssl package dependency is now mandatory
> and only selected when libssh-server and libcurl is selected.

This last sentence doesn't match what is done in your code I'm afraid,
so I'm unclear what you're trying to achieve.

> diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
> index 675c76a500..78fc5c8400 100644
> --- a/package/libnetconf2/libnetconf2.hash
> +++ b/package/libnetconf2/libnetconf2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  72e9a6461fadbd22f0cf0d23ba68d62b297c8f564f7f2bee069748fb67fc3a24  libnetconf2-2.1.28.tar.gz
> +sha256  0d49e796798015e35a08bfbd53a3dd4004cb9a26d4b1dd1f90940a427d483bbb  libnetconf2-3.5.1.tar.gz
>  sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
> diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
> index 88163926c0..40812cc0f0 100644
> --- a/package/libnetconf2/libnetconf2.mk
> +++ b/package/libnetconf2/libnetconf2.mk
> @@ -4,41 +4,29 @@
>  #
>  ################################################################################
>  
> -LIBNETCONF2_VERSION = 2.1.28
> +LIBNETCONF2_VERSION = 3.5.1
>  LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
>  LIBNETCONF2_INSTALL_STAGING = YES
>  LIBNETCONF2_LICENSE = BSD-3-Clause
>  LIBNETCONF2_LICENSE_FILES = LICENSE
> -LIBNETCONF2_DEPENDENCIES = libyang
> +LIBNETCONF2_DEPENDENCIES = libyang libxcrypt openssl

Here you add openssl in your mandatory dependencies, but you don't
select it. This is going to fail badly, as you cannot depend on a
package that isn't enabled in your configuration.

>  HOST_LIBNETCONF2_DEPENDENCIES = host-libyang
>  
>  LIBNETCONF2_CONF_OPTS = \
>  	-DENABLE_TESTS=OFF \
>  	-DENABLE_VALGRIND_TESTS=OFF
>  
> -ifeq ($(BR2_PACKAGE_LIBSSH_SERVER), y)
> -LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=ON
> -LIBNETCONF2_DEPENDENCIES += libssh
> +ifeq ($(BR2_PACKAGE_LIBSSH_SERVER)$(BR2_PACKAGE_LIBOPENSSL)$(BR2_PACKAGE_LIBCURL),yyy)

And here it is extremely weird to have a test for
$(BR2_PACKAGE_LIBOPENSSL). Either it's mandatory for the package, and
therefore there's no point in testing if it's enabled... or it's not
mandatory and openssl shouldn't be unconditionally added to
LIBNETCONF2_DEPENDENCIES above.

Could you clarify this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
