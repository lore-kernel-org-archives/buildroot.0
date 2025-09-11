Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDA8CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B20224248E;
	Thu, 11 Sep 2025 19:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3e6gycsK5YRx; Thu, 11 Sep 2025 19:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B46B042472
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B46B042472;
	Thu, 11 Sep 2025 19:52:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20083443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 127656F55A
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZ6lB4O1XA5o for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF3F16F557
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF3F16F557
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF3F16F557
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:52:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 41A71B978822; Thu, 11 Sep 2025 21:52:15 +0200 (CEST)
Message-ID: <a3781b66-1448-43cc-8911-2c6bb53ceb78@rnout.be>
Date: Thu, 11 Sep 2025 21:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-8-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-8-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757620335; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=EwkFzdMtJjDnx1+rn6QBl4BJKFBUvaUupm1W5FjtzSI=;
 b=lgmvjm1jYAnxpR6K7Rr9t4Bdac4esPIcUeaM3n21DtKQCXBeMUaQ6CNU23m5d3aQcdAeZi
 NPNnenFXromOaCjSJZVy7c7SRY8CH/HqHsGFckwCSTONMm5IGatbXwArVlZAtrJIEkbMz+
 NoSYkI24t1ndqHNvKYI3hZwXRKLEzCM220HyJmJg7MN2Psq72orQ17I5/nDMUe6VfD2H56
 FJK91kb9/l2WlsQawZSN1B3FkvddKaG+Ey5ILC/b9CJl1n9eqVioVrSIbxZrqcRyKH6drR
 DBkXMXyoWnEh/iZUoxmNh3D3JMRTcBuWdl+UGxzbB6tL4XJ8Wo8OC2CbYvDQpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=lgmvjm1j
Subject: Re: [Buildroot] [PATCH 07/23] package/leafpad: remove package
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



On 10/09/2025 23:32, Thomas Petazzoni via buildroot wrote:
> This package needs libgtk2, which we are about to remove.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   Config.in.legacy             |  7 +++++++
>   package/Config.in            |  1 -
>   package/leafpad/Config.in    |  7 -------
>   package/leafpad/leafpad.hash |  4 ----
>   package/leafpad/leafpad.mk   | 13 -------------
>   5 files changed, 7 insertions(+), 25 deletions(-)
>   delete mode 100644 package/leafpad/Config.in
>   delete mode 100644 package/leafpad/leafpad.hash
>   delete mode 100644 package/leafpad/leafpad.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index ea23ae1b2c..a30755e608 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>   
>   comment "Legacy options removed in 2025.11"
>   
> +config BR2_PACKAGE_LEAFPAD
> +	bool "leafpad has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The leafpad package has been removed, as libgtk2 has been
> +	  removed as well.
> +
>   config BR2_PACKAGE_GTK2_ENGINES
>   	bool "gtk2-engines has been removed"
>   	select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index b2c1be89a0..4974c32a37 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -401,7 +401,6 @@ comment "X applications"
>   	source "package/dillo/Config.in"
>   	source "package/docker/Config.in"
>   	source "package/feh/Config.in"
> -	source "package/leafpad/Config.in"
>   	source "package/mupdf/Config.in"
>   	source "package/nodm/Config.in"
>   	source "package/pcmanfm/Config.in"
> diff --git a/package/leafpad/Config.in b/package/leafpad/Config.in
> deleted file mode 100644
> index a4408547cd..0000000000
> --- a/package/leafpad/Config.in
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -config BR2_PACKAGE_LEAFPAD
> -	bool "leafpad"
> -	depends on BR2_PACKAGE_LIBGTK2
> -	help
> -	  GTK+ based simple text editor
> -
> -	  http://savannah.nongnu.org/download/leafpad
> diff --git a/package/leafpad/leafpad.hash b/package/leafpad/leafpad.hash
> deleted file mode 100644
> index 4f6e68f0a2..0000000000
> --- a/package/leafpad/leafpad.hash
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# Locally calculated after checking pgp signature
> -sha256  07d3f712f4dbd0a33251fd1dee14e21afdc9f92090fc768c11ab0ac556adbe97  leafpad-0.8.19.tar.gz
> -# Locally computed
> -sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
> deleted file mode 100644
> index 608fa37be4..0000000000
> --- a/package/leafpad/leafpad.mk
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -################################################################################
> -#
> -# leafpad
> -#
> -################################################################################
> -
> -LEAFPAD_VERSION = 0.8.19
> -LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
> -LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
> -LEAFPAD_LICENSE = GPL-2.0+
> -LEAFPAD_LICENSE_FILES = COPYING
> -
> -$(eval $(autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
