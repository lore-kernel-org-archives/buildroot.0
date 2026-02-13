Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0649DEF99D4
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCA1E4203E;
	Fri, 13 Feb 2026 19:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bBobdeZ7PNj; Fri, 13 Feb 2026 19:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5A9B4202A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011500;
	bh=13yGkX3bv/ki/4D33fd9/o/229VS1L5x2Ts87I/4PD4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DD+/DLNkn2K2A/Uhq1gQX+BULcilwDZZDyYNva2HHs8NN3sxDRTIPw0bC1Gwgo1lM
	 v7Mji1cXGhQeRiUN75IFV+sLXyuMnTu3fworWgGaCw/g80eXyHmFdX0MU4K6S8n0Jy
	 3xR/L4V1ufguUNY2D1sOO83C0s9KgsSyLsfWanHZO08MCYrqPXzfpSSr3BDj+yacqI
	 pEarKbaMrPc9anFAH3q5tcsA4572FxweOdtIDcts26uJcBlqDLjru05KdYUyePgZs0
	 ujKyfqeYUnZQliWgkp24bm+kNFl5H9dtYAJv2GWrimoeoVWu3VYtYmx9eqvjKWsD5g
	 /q0qbLGEWmSAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5A9B4202A;
	Fri, 13 Feb 2026 19:38:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA59FEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9895861558
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxEHvC7M0KGz for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 596D5613D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 596D5613D6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 596D5613D6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-437711e9195so918370f8f.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011447; x=1771616247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IGZyBiECbx8Ck0T0/VQjyz2bGYZpnGZBz4zV3EVvs/U=;
 b=mrxD0JHr0oUFMi2eZhG62zo24go824fjfXPTUhIdIMrFCtoa9y20muijwmG0YjmsbL
 FO1ThR9SuiQl+JP42ylN1VlADUd98YAp+LzwdoNJhssY78LCiB4auCxLqe+ylEWkM5gd
 jRMsNPrFt+4JGqdhKnlORZV3Q6aodtdn7BvCJWmSy/H9xAUDq5xIK5TXebHnL7fnCoWK
 86sM8bFmv65hbd7uFnZkss/WWjkIcSJ/HWuah7FgFdD3xhRcgYsvtA7AHCHjtuEbBaZb
 epUPCqVWstyX2FtpwWbfLpt8dbeHxerhnst0hlT4CUo0v59mdbBK0fF33gCpRXwywjDT
 l6hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIV0aL311V9X0Qhvt7kFZrrUYIWmA48y1Lf8ANH5dKb6p80HzdJBc3ODT4iPudw4eslhethBogebA=@buildroot.org
X-Gm-Message-State: AOJu0YwEk8J8eksRUC4OcFOQDP10YpPFVwXh2RsbGfD9jscolr4zEsae
 6DJP3KHAaqrwxpeMEw43U/8rVafR2NDvvdUtHXKZe1BvcfB3RhzqTmN4fk26Nxi5Hrb4lOFvTAL
 /LYMF
X-Gm-Gg: AZuq6aIkvzyN6JHIzesxlIQq/iDCqP+QqcxfHCDKf8/ENtmK8vmGYZ8w7Jxv5fBJW5z
 FZsJ15awlLByNxnNjOZdWi0h0A16noU4Uop4mOzsAcCp21PtnA+CJ6GPGiuFv4BPmq6FLrSaPSj
 LKCTpTPLS4xUYqP1KyklfTm+qcKBImzrbCJxYEy1o0LEsFmVKrFI04cn9hncJQONCeQ443pDPb0
 hPNCMCMeQ1lUl9bqvs68YvlHHReYReScaxm7Ll68tk+ETsVKneqDRSOpJPgcauxcxXdiFv5RA5C
 t7E/c/TZ8NELQcBJ8wJ825H+wCJkAhdiAGEruw3y+LrOXX3i1aIDMIehLOwwxuaBck/jmlU2mm8
 pJr9Y96QsgF5wpXO2x+OkR/nNxzpPL4MOAeRTx1J2Fytc3WiqTf2d0SVD+4SBh+XXp+zeVM9w9r
 EqRfKs9HiiDPp2tOk=
X-Received: by 2002:a05:6000:184f:b0:436:30b0:75a0 with SMTP id
 ffacd0b85a97d-43796aefe7dmr6143059f8f.37.1771011447322; 
 Fri, 13 Feb 2026 11:37:27 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6ba57sm6260168f8f.15.2026.02.13.11.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:26 -0800 (PST)
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:26 +0100
Message-ID: <20260213193726.39456-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251001-fix_license-v2-1-bf18911c835d@bootlin.com>
References: <20251001-fix_license-v2-1-bf18911c835d@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011447; x=1771616247; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IGZyBiECbx8Ck0T0/VQjyz2bGYZpnGZBz4zV3EVvs/U=;
 b=UDJ+VrZ11IsCh1M2fsvhqJ6uZ+n+t4WxfkhuCWp3CaCfwc32U9KVlToEiW2RytdcGH
 GkABLs0qCOyvTgVSSxAN/+V/AojTBFxVZgFlVt3kHexOJ2AfYJLs/QTvKLTtwg+uB9qM
 I5x5a+mMF5Ds7lFrznnEaR7VBiHlKdyU88A1GpLW9DsCv/NonnWkhUE2fWEecpTBOuLN
 D5WIaPQxukvqvayA0wqMygcGW4GHxKztnGbSFYk6u3HHYpfbQypt6tUpILdsqxYgizbd
 l/JMhcmAZ5oS1OfUWSfyN21vrO4WFz6ftw/9Talm4E3tCWe30dxlyciVhdkNUi8oeRq8
 9/5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UDJ+VrZ1
Subject: Re: [Buildroot] [PATCH v2 1/7] linux: Add support for custom
 license files
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
> The Linux package was not providing any license file when a custom
> Linux version was selected.
> 
> Fix this by adding a Kconfig option to specify the license file,
> with a default value set to the commonly used license paths.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
> 
> Change in v2:
> - Do not show license option if it is not a custom repo
> ---
>  linux/Config.in | 16 ++++++++++++++++
>  linux/linux.mk  |  8 ++------
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 1f1c014ba21fe8ca5f06993f08c6707f6501d9af..6352260cd7d90520964d5ea6fb2714fbf827557d 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -150,6 +150,22 @@ config BR2_LINUX_KERNEL_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
>  		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
>  
> +config BR2_LINUX_KERNEL_CUSTOM_LICENSE_FILES
> +	string "Kernel license files"
> +	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
> +	depends on BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || \
> +		   BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_TARBALL
> +	help
> +	  A space-separated list of license files related to the Linux
> +	  kernel package.
> +
> +config BR2_LINUX_KERNEL_LICENSE_FILES
> +	string
> +	default BR2_LINUX_KERNEL_CUSTOM_LICENSE_FILES \
> +		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || \
> +		   BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_TARBALL
> +	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
> +
>  #
>  # Patch selection
>  #
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 0520394931ce7950a750d4f57dab451377886612..c61089bfe040ba9dee9efc00c0ec3cf4f9ef0167 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -6,12 +6,8 @@
>  
>  LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
>  LINUX_LICENSE = GPL-2.0
> -ifeq ($(BR2_LINUX_KERNEL_LATEST_VERSION),y)
> -LINUX_LICENSE_FILES = \
> -	COPYING \
> -	LICENSES/preferred/GPL-2.0 \
> -	LICENSES/exceptions/Linux-syscall-note
> -endif
> +LINUX_LICENSE_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_LICENSE_FILES))
> +
>  LINUX_CPE_ID_VENDOR = linux
>  LINUX_CPE_ID_PRODUCT = linux_kernel
>  LINUX_CPE_ID_PREFIX = cpe:2.3:o
> 
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
