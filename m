Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25826CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C650284C53;
	Thu, 11 Sep 2025 20:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZNSyE1TdMtU; Thu, 11 Sep 2025 20:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFB8A84C57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFB8A84C57;
	Thu, 11 Sep 2025 20:21:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F281425B
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D838C84C57
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4z-lxZVU36Nl for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:21:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 841D284C53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 841D284C53
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 841D284C53
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:21:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DAA88B9787FA; Thu, 11 Sep 2025 22:21:20 +0200 (CEST)
Message-ID: <af137a57-1cb8-4d97-9ee5-b9e6e0d50a3b@rnout.be>
Date: Thu, 11 Sep 2025 22:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-17-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-17-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757622081; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=SqdGNwt8SlIvrcZDU0pfu/9lAF/QtWfyiSe/cxVlOXs=;
 b=cOZWtRiqitC1ZZMWoyS87/8yg4NKhdIOmBCZKK5nv3/YnM+huEAt2MZh7zzD3jnP/jfrMK
 KuGsh36Y7r59q9TZBN5hjIhQ7JFfVXJxiiYWTFMNTb1QEGx9S4Y5GAz7KVS8+ZG0MLI0Z5
 R4bllHFx2GMIjDMmQvZXNpszcTCmVZWiM6/HzOOLL0Jljbm4euMp0ggxU/ckheOfcj7Zjf
 9wlSpzBKzve53H/QrR8BUC4Pb3GegnMihUbphGff/nSvEba/8H4z8tjQgpyiv2Ml0mD8Dm
 KO3HwIBTCFyJIAWIgzxaQ7MBVoKHSPNQs3CYLv1XiBd3YcsqHj11VTel09hlsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cOZWtRiq
Subject: Re: [Buildroot] [PATCH 16/23] package/opencv3: drop optional
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
> As we're about to remove libgtk2, we need to drop libgtk2 support from
> opencv3. gtk3 support remains in place.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, after adding legacy handling, thanks.

  Regards,
  Arnout

> ---
>   package/opencv3/Config.in  |  9 ---------
>   package/opencv3/opencv3.mk | 14 ++++----------
>   2 files changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
> index a672497108..c4c5d22a54 100644
> --- a/package/opencv3/Config.in
> +++ b/package/opencv3/Config.in
> @@ -63,15 +63,6 @@ choice
>   config BR2_PACKAGE_OPENCV3_GUI_NONE
>   	bool "none"
>   
> -config BR2_PACKAGE_OPENCV3_WITH_GTK
> -	bool "gtk2"
> -	depends on BR2_PACKAGE_LIBGTK2
> -
> -comment "gtk2 support needs libgtk2"
> -	depends on BR2_USE_MMU # libgtk2 -> glib2
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_PACKAGE_LIBGTK2
> -
>   config BR2_PACKAGE_OPENCV3_WITH_GTK3
>   	bool "gtk3"
>   	depends on BR2_PACKAGE_LIBGTK3
> diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
> index 218174c17e..8a862a47b1 100644
> --- a/package/opencv3/opencv3.mk
> +++ b/package/opencv3/opencv3.mk
> @@ -215,6 +215,7 @@ OPENCV3_CONF_OPTS += \
>   	-DWITH_GDAL=OFF \
>   	-DWITH_GPHOTO2=OFF \
>   	-DWITH_GSTREAMER_0_10=OFF \
> +	-DWITH_GTK_2_X=OFF \
>   	-DWITH_LAPACK=OFF \
>   	-DWITH_MATLAB=OFF \
>   	-DWITH_OPENCL=OFF \
> @@ -244,18 +245,11 @@ else
>   OPENCV3_CONF_OPTS += -DWITH_GSTREAMER=OFF
>   endif
>   
> -ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GTK)$(BR2_PACKAGE_OPENCV3_WITH_GTK3),)
> -OPENCV3_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GTK),y)
> -OPENCV3_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
> -OPENCV3_DEPENDENCIES += libgtk2
> -endif
> -
>   ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GTK3),y)
> -OPENCV3_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
> +OPENCV3_CONF_OPTS += -DWITH_GTK=ON
>   OPENCV3_DEPENDENCIES += libgtk3
> +else
> +OPENCV3_CONF_OPTS += -DWITH_GTK=OFF
>   endif
>   
>   ifeq ($(BR2_PACKAGE_OPENCV3_WITH_JASPER),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
