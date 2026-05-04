Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E580ECD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C20BC41C16;
	Mon,  4 May 2026 14:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9A6Mi6DZgMm; Mon,  4 May 2026 14:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E362A41BEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906078;
	bh=KJKfkZ3HPo+zfbaccuncbbRpq8RrfKgbf86UZAe44y4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nejC9Z9Fu+uqfdxc4KyJoKNk3H1xQ14iJ2MRJ7pH5Ta4tQBBmGt8syhYuhKddvn0O
	 ceIm83SpDm+nel2Bte6PnQyF+ryDqkRVVDdf18IThIaC+ViOj6XCEKMsCQtWJHy5L0
	 C+s1vfdq2jBpl5t+hGRHNUPuwyX56uTmw/1INWdhcl7xV3BgJAjXrhi0zAmNaJ+/JY
	 dArVX9wTXjRJlir5zDhwLKHFcea7nssm9b9CY8UpS33myHuUONA6ac76EPvCrfQF3A
	 jkcWTUzeyir7gbmCIHyeyFxqIlSX5WNAEGwH2DLvN9yVSaHX//QmB4XbDOuxYVfN3c
	 /3ajBh97aWTFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E362A41BEC;
	Mon,  4 May 2026 14:47:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FA8825D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6B2041C03
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IfzdHee-lCK for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2B7741BFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2B7741BFE
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2B7741BFE
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:53 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-44e1ebb3122so520697f8f.2
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906072; x=1778510872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wkADTii6ex/nhVQjEqOaYt2a4xFlKp/RP/IMcjplmp0=;
 b=rb/SF/NzQKE/0321RrEPQ82JIKAP+f9GQ7GPBbph3wZTP4HSg6l9cHzEMcY9f9Kn3K
 UobqfSELqX1EsYWbVFGSV/NK3dI63+Kqk4hwOPOH8SSRCIrBL5SWZXWWFuzWGAHh7PPu
 zscm9XsS7Dx010k/Ts4BXw5tKfDjsN7PWRDvRTPkl7KwW0dkDgFhZqt/EH9vSiwYyusl
 FWFf56WeKxWPPZmrvmEkxoOJQENJf04PfjpfEh0AVbfuDpQbj5+Zuouaf6ndwslzfYlY
 ac84E/gvzmx6+kjTOlaLepJ8+N5qXgUc58c5Hn67TTDeN01T6NwjLZ1P+ZTXs3TZnF1q
 +xSw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8trIt0TcJmpIt9o3NjQvd6AfcUKda5Bh7a6yBOAYH3sjdrm1Wz2fH7zJ1DtaMjcpKRGx/Zp14U/6k=@buildroot.org
X-Gm-Message-State: AOJu0Yx6mvxLeJXU+VzFC+Pk1YRrZc2/jDceQKlFaxvd/k4YmtsrB2K/
 wGAk/wsutoDEJkXT7LZ29VzwloNS/y4ABKJnyAvwzmElLh5oYqkxT69ESH7IGsKhgZRODlYlIkO
 5HUty
X-Gm-Gg: AeBDiesbfUu2SvF4COCQ8wbx57Se7mkFeFwucd2bQfMQ/0p4iNxYwvdZQTJPdo8S31V
 CjJrIif1RCZlNnsu91ROMnYMQwe5IEL4eaLUdrvfx4Ojg313UkoAqyIFJMqikbrL4C7bBfchvZs
 Vyz3DSiWyHAzFZ+MZyAWx/EGusxBH1SnXW5+5Gk4kBWAoP1Oz0wO2gPeY+8fvb/bENX3Oa3DvnJ
 o4/keqlf7XJpQyyOTO3Qc0nfGtliZyC2yeb6j97/rAX4qBi+4vblxu6sexLWons6oMnLz8Jaw8r
 kGOnpEbmOKSVGihkXTK0yqAtX/P8Ra6yUEIj/10CPVQY/zhpt2ndoZRl4bEc+o4v/hv9zDquWou
 SklneOAJfjFfHdSZM5i2vqwP5MAYCBsJlv7eN0+Wtzq/+ds9/J/cesrlZ47gy7Osd3jDIrwYQmr
 yqv96GtY4VsSMoWv8t7JFHKmo/+g==
X-Received: by 2002:a05:6000:288e:b0:43d:781d:37b9 with SMTP id
 ffacd0b85a97d-44bb707877bmr17338699f8f.42.1777906071634; 
 Mon, 04 May 2026 07:47:51 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44acad8f974sm24029529f8f.23.2026.05.04.07.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:51 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:50 +0200
Message-ID: <20260504144750.10604-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426071953.397621-1-bernd@kuhls.net>
References: <20260426071953.397621-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906072; x=1778510872; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wkADTii6ex/nhVQjEqOaYt2a4xFlKp/RP/IMcjplmp0=;
 b=idZXyMgeoTKkKR2TLTPWX1N5jl37vZPpD2cIHThIIkLGdPMpQHZkcMSTiFvzEEAoE4
 THx4vpG3YWndyYMu4AOu3VXtP2IIgB0WBZzMmzonVCERvgXWYMuNj9mCY6US+ywnqFil
 ppxbGlGIThmAv7jsiazCcGt5idskbgUQqPSGUdlwX/oBhUGXr56VvmJ+wRUE42cxhqWM
 vcdJMkE9Eo/Kz0CiOdvmwQm3XOuXQeMHMaeFYg7kXQRQ3eOp3GIt4IqFMCZFBTTmsMnQ
 xK8TId/d991juwGmBmdrWPsefU7+910inbfyQh61FRfsFuSxaQKA03E2G7pNt+z351XO
 7OWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=idZXyMge
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: bump to version 1.6.58
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
> https://github.com/pnggroup/libpng/blob/v1.6.58/ANNOUNCE
> "Fixed a regression introduced in version 1.6.56 [...]"
> 
> A backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libpng/libpng.hash | 6 +++---
>  package/libpng/libpng.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
> index 977f8fcca4..c387ffbf02 100644
> --- a/package/libpng/libpng.hash
> +++ b/package/libpng/libpng.hash
> @@ -1,5 +1,5 @@
> -# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.57/
> -sha1  866fb81e3355088bb885bb4ded39093ef80eb686  libpng-1.6.57.tar.xz
> +# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.58/
> +sha1  6263409a6907d180e7b990827ca84ee944c6cc17  libpng-1.6.58.tar.xz
>  # Locally computed:
> -sha256  d10c20d7171569804cae8dfc13ba6dcd0662c41ed39d43d4d429314aafb10a80  libpng-1.6.57.tar.xz
> +sha256  28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775  libpng-1.6.58.tar.xz
>  sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
> index 0081406300..96afc684db 100644
> --- a/package/libpng/libpng.mk
> +++ b/package/libpng/libpng.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPNG_VERSION = 1.6.57
> +LIBPNG_VERSION = 1.6.58
>  LIBPNG_SERIES = 16
>  LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
>  LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
