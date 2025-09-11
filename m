Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A92CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9145D84814;
	Thu, 11 Sep 2025 20:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zD4sBtNuo5o; Thu, 11 Sep 2025 20:00:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E62468481D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E62468481D;
	Thu, 11 Sep 2025 20:00:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A2A2443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E49BC6F56A
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZCZXNjHMQgL for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:00:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40DC76F566
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40DC76F566
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40DC76F566
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:00:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 633E2B978815; Thu, 11 Sep 2025 22:00:23 +0200 (CEST)
Message-ID: <93208e24-7a2c-4c2e-85a0-204797aff05b@rnout.be>
Date: Thu, 11 Sep 2025 22:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Takumi Takahashi <takumiiinn@gmail.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-9-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-9-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757620824; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=eMP203xecygdG2xo46Pg8Uj0MVpMxhxJW30FFszahik=;
 b=hUeNhnkolpdtNSscqKufY1+9w/bNxoYvHTlM3g8qJn2x1XVMykMeI6jptnaGgn4ndVqYnP
 r1vHAYa2ZOEO/cy6f5ZHlp82DjJtBDs/3a6LTEkDlIAFpQdgA1A//HHdPgF3dkmVFp7lXI
 GdeQezEBeb217gZsGSJ2Kzx6ifQmZ1RMwqpesacpE/I2lQI8FhYciWnx7GWKIzxcdrUYiU
 qLIHjFSZcFDlV8xZM3SMe3o+prxP/kepAHP8tzZYnYnGZNRHxddSHkpkfCWzOv11Vnqlxx
 DAF1XS9mrO1CSnBEQx/S07M4Fm8WwY4gmTWF8oydAUQ5zMtFYzrTiH+xpeJpMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=hUeNhnko
Subject: Re: [Buildroot] [PATCH 08/23] package/libcanberra: remove optional
 dependency on libgtk2
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
> As we're about to drop libgtk2, let's remove the optional dependency
> of libcanberra to libgtk2.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcanberra/libcanberra.mk | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/package/libcanberra/libcanberra.mk b/package/libcanberra/libcanberra.mk
> index 2505e58eb0..456d08563b 100644
> --- a/package/libcanberra/libcanberra.mk
> +++ b/package/libcanberra/libcanberra.mk
> @@ -12,7 +12,12 @@ LIBCANBERRA_LICENSE_FILES = LGPL
>   LIBCANBERRA_INSTALL_STAGING = YES
>   
>   LIBCANBERRA_DEPENDENCIES = host-pkgconf libtool libvorbis
> -LIBCANBERRA_CONF_OPTS = --disable-oss --disable-null --disable-tdb --disable-lynx
> +LIBCANBERRA_CONF_OPTS = \
> +	--disable-oss \
> +	--disable-null \
> +	--disable-tdb \
> +	--disable-lynx \
> +	--disable-gtk
>   
>   ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
>   LIBCANBERRA_CONF_OPTS += --enable-udev
> @@ -42,13 +47,6 @@ else
>   LIBCANBERRA_CONF_OPTS += --disable-gstreamer
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBGTK2),y)
> -LIBCANBERRA_CONF_OPTS += --enable-gtk
> -LIBCANBERRA_DEPENDENCIES += libgtk2
> -else
> -LIBCANBERRA_CONF_OPTS += --disable-gtk
> -endif
> -
>   ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
>   LIBCANBERRA_CONF_OPTS += --enable-gtk3
>   LIBCANBERRA_DEPENDENCIES += libgtk3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
