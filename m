Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E9AC35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 10:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 447F280B7F;
	Sun, 15 Sep 2024 10:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eiZKLxoyoYNp; Sun, 15 Sep 2024 10:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38C8780B86
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38C8780B86;
	Sun, 15 Sep 2024 10:51:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 241311BF29D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1314F80B7F
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ysDiaew_TWj for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 10:51:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8597580B78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8597580B78
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8597580B78
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 10:51:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8DE760002;
 Sun, 15 Sep 2024 10:51:35 +0000 (UTC)
Date: Sun, 15 Sep 2024 12:51:34 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240915125134.2d6a9f55@windsurf>
In-Reply-To: <Zsa6HF+NBfLtnThO@waldemar-brodkorb.de>
References: <Zsa6HF+NBfLtnThO@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726397495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uk8Kc3YWkRmLaG5MYTqlRmoyxDOlSZjBz+Nf0NDiuQE=;
 b=axt+XyX6YLUqfDjR+mRqj4K1mxqkOxpcK/KDg8bK4gqpvm6SfiwsEA0qgbMTALrkmNcktx
 vFpCBqEWXCr+HxDQbFSADyfLiDffHpWVmSW7trzCSyJQeiVBeHXIgm4BnPdCEsf1NfeMWr
 MYbt3fSJyz7nC/k9gXGQ+od8TgmU/qP3uxW1ZQ7t9JME7bRY+dncncTldx/s7dkQnDxqA/
 6e1G1MZsWkaSXE0POCegvDqnEDKnSv33NaD/3TIme5mkthELLLERq0IQn9iknVOY4sZqri
 ITHwwn5tEzCdBwINS7pHFwFp9CzFZOPV2MreKpro7PwyGfP4IozpVR+Werhy3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=axt+XyX6
Subject: Re: [Buildroot] [PATCH next] package/httping: update to 4.1.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 22 Aug 2024 06:10:04 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Changes made to the Buildroot package:
>  - use github url for download
>  - switch to cmake infrastructure
>  - add new option for TUI support
>  - add new option for SSL support
>  - TFO is always enabled now

Specify: "and therefore we don't need to add Config.in.legacy handling
for this option".

>  - remove no longer required patches 0001/0002
>  - update license file to LICENSE
>  - update license to GPLv3
>  - always build without gettext support
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I was about to apply, but there's a major licensing issue: they have
the GPLv3 license text, but all source files contain this:

/* Released under AGPL v3 with exception for the OpenSSL library. See license.txt */

license.txt doesn't exist, and AGPL v3 is obviously not GPL v3.

So could you check this with upstream, and ask them to fix those
inconsistencies?

Also, I have comments below (which I had fixed locally... but need to
drop because of this license issue).


> diff --git a/package/httping/Config.in b/package/httping/Config.in
> index c0e5071ce8..f5057e05d0 100644
> --- a/package/httping/Config.in
> +++ b/package/httping/Config.in
> @@ -16,7 +16,16 @@ config BR2_PACKAGE_HTTPING
>  
>  if BR2_PACKAGE_HTTPING
>  
> -config BR2_PACKAGE_HTTPING_TFO
> -	bool "TCP Fast Open (TFO) support"
> +config BR2_PACKAGE_HTTPING_SSL
> +	bool "enable SSL support"
> +	select BR2_PACKAGE_LIBOPENSSL

Since it builds fine with libressl, this should be:

	select BR2_PACKAGE_OPENSSL

> +	select BR2_PACKAGE_LIBOPENSSL_ENGINES

And so this should be:

	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL

> +	select BR2_PACKAGE_CA_CERTIFICATES # runtime
> +
> +config BR2_PACKAGE_HTTPING_TUI
> +	bool "enable TUI support"
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_NCURSES_WCHAR
> +	select BR2_PACKAGE_FFTW_DOUBLE

This causes a menuconfig warning because BR2_PACKAGE_FFTW_DOUBLE
doesn't exist if you don't select BR2_PACKAGE_FFTW. So please add a
"select BR2_PACKAGE_FFTW".

> diff --git a/package/httping/httping.mk b/package/httping/httping.mk
> index b3a625a8e1..cf1189eeb6 100644
> --- a/package/httping/httping.mk
> +++ b/package/httping/httping.mk
> @@ -4,34 +4,19 @@
>  #
>  ################################################################################
>  
> -HTTPING_VERSION = 2.5
> -HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
> -HTTPING_SITE = http://www.vanheusden.com/httping
> -HTTPING_LICENSE = GPL-2.0
> -HTTPING_LICENSE_FILES = license.txt
> -HTTPING_LDFLAGS = $(TARGET_LDFLAGS) \
> -	$(TARGET_NLS_LIBS) \
> -	$(if $(BR2_PACKAGE_LIBICONV),-liconv)
> -HTTPING_DEPENDENCIES = \
> -	$(TARGET_NLS_DEPENDENCIES) \
> -	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
> -	$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncurses) \
> -	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
> -	$(if $(BR2_PACKAGE_FFTW_DOUBLE),fftw-double)
> -HTTPING_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
> -	FW=$(if $(BR2_PACKAGE_FFTW_DOUBLE),yes,no) \
> -	NC=$(if $(BR2_PACKAGE_NCURSES_WCHAR),yes,no) \
> -	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
> -	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no) \
> -	NO_GETTEXT=$(if $(BR2_SYSTEM_ENABLE_NLS),no,yes)
> +HTTPING_VERSION = 4.1.0
> +HTTPING_SOURCE = v$(HTTPING_VERSION).tar.gz

Please drop this HTTPING_SOURCE so that the default gets used.

> +HTTPING_SITE = $(call github,folkertvanheusden,HTTPing,v$(HTTPING_VERSION))
> +HTTPING_LICENSE = GPL-3.0

Of course, this might need to be adjusted once upstream clarifies their
licensing intention.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
