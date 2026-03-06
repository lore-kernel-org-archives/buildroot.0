Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DF2FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA87C614A4;
	Fri,  6 Mar 2026 19:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qSQZgqbQR7m; Fri,  6 Mar 2026 19:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C537B614C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826822;
	bh=sbCjyW3MbowMwgRGErxjuqcvrEFyY/1kOArnOJUIzqo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AzcCF6KYNELOCZ1zfYUr67pQNJn8j+nAALt+wFHzq1OuqDA6D0u66GuVQvZhYErlE
	 I+EhaHQ2AbKqC4ojVl99pcOJZcsP7fOk4WRiRC4ce7P1sNhq3aUVH64e84yeOd4ofA
	 ko0H4ghREdFOg+KWzjs93ueZDLU5g+N0/PtUd2u1a+BQ9WCcy/SSMsdDfizT5za8Ed
	 ZBrvINCEc5NpXg6/2yZhpwb0MesrBdtDT8WVAGdusFaSmgpecX/eY3AowytKFYfYIu
	 ZJBCfgv04zjZ8FClhJF+0v6RPMKmGPfPpDiKggMqeo9vFBTT10aqxAU2eXLS2rNhE2
	 NrWolSVIYCICg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C537B614C1;
	Fri,  6 Mar 2026 19:53:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26D7B169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4AE783D75
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BovGJkf4pMyx for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB55F83D65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB55F83D65
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB55F83D65
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:29 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so4362633f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826808; x=1773431608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KVVJCboORGr11XQo8sZTzMKcRrT/2Y21qB8jbZk/9is=;
 b=n1w9ogi0D904G9UBo5ulBWQ97tDSjeI3Yz0Y589p3CaCKQEURACP+i6FiYionHgfeS
 I9T7c+kJg1g5z8yO0MQhBI8p8sVCebtC2s7fkJ990HaOnKF8ZwSuseeMiPTHLpEp/i9T
 niEBbKjB7KIWCQHe1cuD4K0YwpqrLrvwTNJV76AM4d471z6cJ8fEyKGBAvFyuHH6aPvM
 oBcNpS2BE1GqAvXpJO64TgwB4SJAmzrwpdol/1ajdPiWhu0LYriZlZJbTFrDK8wNYuqa
 ciT+XMhuQ5NuDC3y1Nwxpiyi0PKY7qpxZl4PsnlLuhDBXe19N3W51J9Mmpac64dGw5X7
 kWQg==
X-Gm-Message-State: AOJu0Ywe/ksFAaPvv5Jc7+NpjIUqX8q6TPBw5CWOU3vfUzHl7BFT8sn6
 4kj3jvILXUcE950vKkS7fQ4uKaD3lZc/UKpOSnFbyOrSoOb23FbPS8iF9bl1e8JucCX9QOrEqRO
 wSKU/
X-Gm-Gg: ATEYQzyEzyvpUY96poUmIfAPAWF7625/vXHbw3FSWPPZR4cj9Pdvqv4MJsvy3Q+tDJc
 V/9qT4anTHLxLBtXaipp/dnTjxrM3XsoKF3132GXGBQYluaHjdWnqhF4xwfNVPZR9cyOrkp7vLX
 IgZcOF30T0XleQy5ITt5fqbKyPRSfFI6zwmFheRvBHqmVv5LBuj5tXvqJy8CjQvSvJMWKe1k27b
 vTj8/IETj/kb2aJMwyQ0/chtzD5FqvEUT7uxJ15RJPk0pY/3vDJB0DmE085mUrQHb6RuGDE1rvi
 +Hc4l53U5r02SJFtkmTckEBMADSdPf4MuAgRyt/wkqN7O4xuIGojfjpMAsjVlfe2x6NX9odFovi
 nsojuDxIIYeFowRCldXpmvaozzJ/x7u74UPiVqslZVa1yRK+za1q+x8cxRWk1ygmVKfk5GIKEuP
 rxEHjROFPMEdLKvch+piZMxyY8JA==
X-Received: by 2002:a05:600c:8218:b0:480:69ae:f0e9 with SMTP id
 5b1f17b1804b1-48526958b30mr68850545e9.16.1772826807707; 
 Fri, 06 Mar 2026 11:53:27 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb27a20sm263105855e9.9.2026.03.06.11.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:27 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:26 +0100
Message-ID: <20260306195327.8533-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303081323.53405-3-thomas.perale@mind.be>
References: <20260303081323.53405-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826808; x=1773431608; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KVVJCboORGr11XQo8sZTzMKcRrT/2Y21qB8jbZk/9is=;
 b=hITJ+7Afo8oO+uNnZo9jgW5+PphALksjPL15JwOER165lqklCPEwoaYTTxGa756vRT
 C1XD2ZMsL0NDVhR77i9UPHO6uQNoSdZ8SO3t6Xx0ZOQbie23XmSgEXejjTgmh8FRjYPq
 mA8Iqut8MKqiGSm9T7o+R4CBea5HgbtIW1B3+3mfuqpdzGROL01k7lSWxa6xIxigDS//
 e+xzORcKSjaG8CeSpZoZ6HvmACJJ2G5V6MYDbh7DksReoz3HwNG3JlhUEJDIrPEMzPzW
 7f1Jy7IotTpLhaqIA6+N/FhoAnwkcB5MIv1j4qLH4vFKHjiqeUIDjVDrkGeDKrty52z2
 E0DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hITJ+7Af
Subject: Re: [Buildroot] [PATCH 3/4] package/graphicsmagick: add patch for
 CVE-2025-27796
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following vulnerability:
> 
> - CVE-2025-27796:
>     ReadWPGImage in WPG in GraphicsMagick before 1.3.46 mishandles palette
>     buffer allocation, resulting in out-of-bounds access to heap memory in
>     ReadBlob.
> 
> For more information, see
>   - https://www.cve.org/CVERecord?id=CVE-2025-27796
>   - https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/883ebf8cae6dfa5873d975fe3476b1a188ef3
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...er-is-allocated-and-the-current-size.patch | 55 +++++++++++++++++++
>  package/graphicsmagick/graphicsmagick.mk      |  3 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch
> 
> diff --git a/package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch b/package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch
> new file mode 100644
> index 0000000000..8a98034833
> --- /dev/null
> +++ b/package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch
> @@ -0,0 +1,55 @@
> +# HG changeset patch
> +# User Bob Friesenhahn <bfriesen@GraphicsMagick.org>
> +# Date 1734634653 21600
> +#      Thu Dec 19 12:57:33 2024 -0600
> +# Node ID 883ebf8cae6dfa5873d975fe3476b1a188ef3f9f
> +# Parent  cf7cd5ebabb0ca40204de7539f4fb9ae02121958
> +ReadWPGImage(): Assure that palette buffer is allocated and the current size.
> +
> +CVE: CVE-2025-27796
> +Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/883ebf8cae6dfa5873d975fe3476b1a188ef3f9f
> +[thomas: remove changelog and binary]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +
> +diff --git a/coders/wpg.c b/coders/wpg.c
> +--- a/coders/wpg.c
> ++++ b/coders/wpg.c
> +@@ -1704,28 +1704,23 @@
> +                 ThrowReaderException(CorruptImageError,InvalidColormapIndex,image);
> +               }
> + 
> +-              if(pPalette!=NULL &&
> +-                 PaletteAllocBytes < 4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries))
> +-              {
> +-                MagickFreeResourceLimitedMemory(pPalette);
> +-                PaletteAllocBytes = 0;
> +-              }
> ++              /* Assure that buffer is allocated and the current size */
> ++              if (PaletteAllocBytes != Max(4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries),4*256))
> ++                {
> ++                  PaletteAllocBytes = Max(4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries),4*256);
> ++                  MagickReallocateResourceLimitedMemory(unsigned char *,pPalette,PaletteAllocBytes);
> ++                }
> +               if(pPalette==NULL)
> +-              {
> +-                PaletteItems = WPG_Palette.NumOfEntries;
> +-                PaletteAllocBytes = 4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries);
> +-                if(PaletteAllocBytes < 4*256) PaletteAllocBytes = 4*256;
> +-                pPalette = MagickAllocateResourceLimitedMemory(unsigned char *,(size_t)PaletteAllocBytes);
> +-                if(pPalette==NULL)
> +-                    ThrowReaderException(ResourceLimitError,MemoryAllocationFailed,image);
> +-                for(i=0; i<=255; i++)
> ++                ThrowReaderException(ResourceLimitError,MemoryAllocationFailed,image);
> ++
> ++              PaletteItems = WPG_Palette.NumOfEntries;
> ++              for(i=0; i<=255; i++)
> +                 {
> +                   pPalette[4*i] = WPG1_Palette[i].Red;
> +                   pPalette[4*i+1] = WPG1_Palette[i].Green;
> +                   pPalette[4*i+2] = WPG1_Palette[i].Blue;
> +                   pPalette[4*i+3] = OpaqueOpacity;
> +                 }
> +-              }
> +               if(ReadBlob(image,(size_t) PaletteItems*4,pPalette+((size_t)4*WPG_Palette.StartIndex)) != (size_t) PaletteItems*4)
> +               {
> +                 MagickFreeResourceLimitedMemory(pPalette);
> diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
> index 6c2885b7d8..e329e51b70 100644
> --- a/package/graphicsmagick/graphicsmagick.mk
> +++ b/package/graphicsmagick/graphicsmagick.mk
> @@ -26,6 +26,9 @@ GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27795
>  # 0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
>  GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-32460
>  
> +# 0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch
> +GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27796
> +
>  GRAPHICSMAGICK_INSTALL_STAGING = YES
>  GRAPHICSMAGICK_CONFIG_SCRIPTS = GraphicsMagick-config GraphicsMagickWand-config
>  
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
