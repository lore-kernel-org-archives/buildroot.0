Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3F0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FFD860D6A;
	Sun, 12 Dec 2021 14:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HfhQ7BI77S6M; Sun, 12 Dec 2021 14:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 646E160D68;
	Sun, 12 Dec 2021 14:09:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8E2C1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9061855FE
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lqe-tiizNGni for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:09:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7FB4855F9
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:09:31 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z5so44949869edd.3
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1zy0v8O07BFfV8kzoUdJRxw5cbniZ5Up3OFkOm7zCTM=;
 b=ecOHtZ8P4g+HNlwJl51XsmnW5W1t0wal807Ky60Xuf79Xj5/VkqDv5f39MIOfVb4ZX
 OsUb/gBeJSOXDHc6RdcgC/R2pdnQMHzMiiakrmSzyVuFPk6+baM0KuBAwtN7cMGvdcfR
 /DDB6PfGxq74C4zWaCM90Vr6SeSskrOuprEX3dtGI0q21yQCYo9rCwosP1V5jicdCrVe
 7qnN7DkxMS1pa+Yk9pVaZdgC6yMVlN1WI9AcLFXcVbxAlh4ybiKZBVA6Dit+KvsmOgd3
 0gDR6C+JlffoDV1n9zw7mBHj7ScHnLyxbIibOkAOlL4ydImmTof2BZcpGarTd7Eniidn
 rS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1zy0v8O07BFfV8kzoUdJRxw5cbniZ5Up3OFkOm7zCTM=;
 b=DO5trDhVewPfVYEN732gWxdblB6Lg6o//d5a9yS3Z4dF7z2D0kpHADHEfW3Kpkb/HG
 KzKqTwwpkAe699BDCbX6Sl2VtqpIj0d9rG/ecoAhydJ1L2HpFXaDmS2VhA4eMVJn39HN
 +21xXjE9wHz14KS0lSn/c8GSJZfgyom72dJhrJQBAqs1IEmiOa1II7HBLiEN6hdvpNC7
 5tuDu/r0hEpWyQoe8vYbsD0FZMsJNM6BbhF92rgPq4e5yq00t2g2X395nVT93JQQ0uaj
 Q1qRRPS9pdHQrG/CH9s8lQBpWJcRhl4VYXbUO4xm8rZT3+GBucm2YdrKX3CrYTP83I3S
 YaHg==
X-Gm-Message-State: AOAM531QoGWR1zLH9EgP9ZxCoFGJ7w0CM0BbTyC1E3+uKaKg67r7I66+
 WehmpYYgeNhBQJVDyk2DoXuk0g==
X-Google-Smtp-Source: ABdhPJwZHbffJQ5vaYoVuArdBQVDlgCqNxDoEfAYIxgyu4BaUTCcjUI/NVzcl4v1uQ8SxhkirK7C1w==
X-Received: by 2002:a50:9b05:: with SMTP id o5mr56959839edi.66.1639318170063; 
 Sun, 12 Dec 2021 06:09:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k21sm4641548edo.87.2021.12.12.06.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:09:29 -0800 (PST)
Message-ID: <1b35aa89-df18-a952-1d12-289846dbadc4@mind.be>
Date: Sun, 12 Dec 2021 15:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211209213206.3918378-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211209213206.3918378-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-rgb-led-matrix: needs -fPIC
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
Cc: Grzegorz Blach <grzegorz@blach.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/12/2021 22:32, Fabrice Fontaine wrote:
> Fix the following build failure raised since the addition of the package
> in commit e821078031e14df69e5142f23e9cb7b5a1ea0e77:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/9.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: led-matrix.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZTVN10rgb_matrix11FrameCanvasE' which may bind externally can not be used when making a shared object; recompile with -fPIC
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/be291d6b0efdc1914babfb4a9be5eb863058eaf5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
> index b220bbc3db..85c1d1a320 100644
> --- a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
> +++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
> @@ -10,8 +10,12 @@ RPI_RGB_LED_MATRIX_LICENSE = GPL-2.0
>   RPI_RGB_LED_MATRIX_LICENSE_FILES = COPYING
>   RPI_RGB_LED_MATRIX_INSTALL_STAGING = YES
>   
> +RPI_RGB_LED_MATRIX_MAKE_OPTS = \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CXXFLAGS="$(TARGET_CXXFLAGS) -fPIC"
> +
>   define RPI_RGB_LED_MATRIX_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lib all
> +	$(MAKE) $(RPI_RGB_LED_MATRIX_MAKE_OPTS) -C $(@D)/lib all
>   endef
>   
>   define RPI_RGB_LED_MATRIX_INSTALL_STAGING_CMDS
> @@ -31,7 +35,7 @@ ifeq ($(BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER),y)
>   RPI_RGB_LED_MATRIX_DEPENDENCIES += graphicsmagick
>   
>   define RPI_RGB_LED_MATRIX_BUILD_IMAGE_VIEWER_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +	$(MAKE) $(RPI_RGB_LED_MATRIX_MAKE_OPTS) \
>   		MAGICK_CXXFLAGS="-I$(STAGING_DIR)/usr/include/GraphicsMagick $(shell $(STAGING_DIR)/usr/bin/GraphicsMagick++-config --cxxflags)" \
>   		MAGICK_LDFLAGS="-L$(STAGING_DIR)/usr/lib $(shell $(STAGING_DIR)/usr/bin/GraphicsMagick++-config --libs)" \
>   		-C $(@D)/utils led-image-viewer
> @@ -46,7 +50,7 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_RPI_RGB_LED_MATRIX_TEXT_SCROLLER),y)
>   define RPI_RGB_LED_MATRIX_BUILD_TEXT_SCROLLER_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/utils text-scroller
> +	$(MAKE) $(RPI_RGB_LED_MATRIX_MAKE_OPTS) -C $(@D)/utils text-scroller
>   endef
>   RPI_RGB_LED_MATRIX_POST_BUILD_HOOKS += RPI_RGB_LED_MATRIX_BUILD_TEXT_SCROLLER_CMDS
>   
> @@ -62,7 +66,7 @@ ifeq ($(BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER),y)
>   RPI_RGB_LED_MATRIX_DEPENDENCIES += ffmpeg
>   
>   define RPI_RGB_LED_MATRIX_BUILD_VIDEO_VIEWER_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +	$(MAKE) $(RPI_RGB_LED_MATRIX_MAKE_OPTS) \
>   		AV_CXXFLAGS="$(shell $(HOST_DIR)/bin/pkg-config --cflags libavcodec libavformat libswscale libavutil)" \
>   		AV_LDFLAGS="$(shell $(HOST_DIR)/bin/pkg-config --libs libavcodec libavformat libswscale libavutil)" \
>   		-C $(@D)/utils video-viewer
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
