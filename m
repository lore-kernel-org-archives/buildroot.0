Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655F5CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B8AD6F48D;
	Thu, 11 Sep 2025 20:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYUiGb9uw-jq; Thu, 11 Sep 2025 20:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DA486F5B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DA486F5B1;
	Thu, 11 Sep 2025 20:21:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AB9825B
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7768F40522
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wh_agdeor_lL for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:21:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74CEB4234C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74CEB4234C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74CEB4234C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:21:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1217CB978576; Thu, 11 Sep 2025 22:21:38 +0200 (CEST)
Message-ID: <6b37f501-e9ae-4279-9751-46ecc2d75f10@rnout.be>
Date: Thu, 11 Sep 2025 22:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-18-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-18-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757622098; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=grnqDRvt5PbLJ2PC70NFPxtS7CWaRkG7VUvHTSdJ4iQ=;
 b=dmBaOLNfQu0R6WZXKgrZkbLdsXsLIlhCTBP5e80D62QbiWXhXtfX/rvkuEm0ahASCZHxXS
 pnJQH0bsNTRJpP97Qg3bpw6o+c1GkqF7Ax4mDMFZz8xKss7j8X4sgEqauZ9p/BJKiUiNRe
 zYcSSy0ZzO+//XoQBkcwqxC2UcORBC4vm6oUy03dZGepcTLWFacvgK/N4KwMAVvKnIMDqY
 hxdfLDShsZRfAyt84MdavMshvJY1RAljp/6QIDV8NDgk4QEw5/7x0qFk8a5e7yfIjnig++
 BFguKbYvgVGhJQqXw+cn7NDCeeJM5YfcyIjFXanNhaO+VSBDmkIDhC65rxzD8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dmBaOLNf
Subject: Re: [Buildroot] [PATCH 17/23] package/opencv4: drop optional
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
> As we're about to remove libgtk2, we need to drop libgtk2 support
> from opencv4. gtk3 support remains in place.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, after adding legacy handling, thanks.

  Regards,
  Arnout

> ---
>   package/opencv4/Config.in  |  9 ---------
>   package/opencv4/opencv4.mk | 14 ++++----------
>   2 files changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
> index f71ceba2c5..a553411e1a 100644
> --- a/package/opencv4/Config.in
> +++ b/package/opencv4/Config.in
> @@ -81,15 +81,6 @@ choice
>   config BR2_PACKAGE_OPENCV4_GUI_NONE
>   	bool "none"
>   
> -config BR2_PACKAGE_OPENCV4_WITH_GTK
> -	bool "gtk2"
> -	depends on BR2_PACKAGE_LIBGTK2
> -
> -comment "gtk2 support needs libgtk2"
> -	depends on BR2_USE_MMU # libgtk2 -> glib2
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_PACKAGE_LIBGTK2
> -
>   config BR2_PACKAGE_OPENCV4_WITH_GTK3
>   	bool "gtk3"
>   	depends on BR2_PACKAGE_LIBGTK3
> diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
> index 01f70dfe49..d3df1a39f7 100644
> --- a/package/opencv4/opencv4.mk
> +++ b/package/opencv4/opencv4.mk
> @@ -211,6 +211,7 @@ OPENCV4_CONF_OPTS += \
>   	-DWITH_GDAL=OFF \
>   	-DWITH_GPHOTO2=OFF \
>   	-DWITH_GSTREAMER_0_10=OFF \
> +	-DWITH_GTK_2_X=OFF \
>   	-DWITH_LAPACK=OFF \
>   	-DWITH_MATLAB=OFF \
>   	-DWITH_OPENCL=OFF \
> @@ -316,18 +317,11 @@ else
>   OPENCV4_CONF_OPTS += -DWITH_GSTREAMER=OFF
>   endif
>   
> -ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK)$(BR2_PACKAGE_OPENCV4_WITH_GTK3),)
> -OPENCV4_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK),y)
> -OPENCV4_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
> -OPENCV4_DEPENDENCIES += libgtk2
> -endif
> -
>   ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK3),y)
> -OPENCV4_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
> +OPENCV4_CONF_OPTS += -DWITH_GTK=ON
>   OPENCV4_DEPENDENCIES += libgtk3
> +else
> +OPENCV4_CONF_OPTS += -DWITH_GTK=OFF
>   endif
>   
>   ifeq ($(BR2_PACKAGE_OPENCV4_WITH_JPEG),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
