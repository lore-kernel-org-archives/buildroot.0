Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B89C5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 501BF40FA3;
	Fri, 31 Jul 2026 12:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oY9oi87B77ch; Fri, 31 Jul 2026 12:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF2D540F84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499488;
	bh=myBOJivAR6igGlM7Njxpv9DIPjBs/xyvUQWoNQ+J7Bs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=evFEQY+QfR858fqSUfH3/3Chh/r9GwrNQavBqp0WFuGIkRxWRbtpyV8UzDBExbsC2
	 kKmsKtapUEvlQBWmiu3YQsNxJgwCo6pHgGIwmqa9HaOM52+dzHm1ugAMbpZU73/5bu
	 3ZHxVSgzNqSDnVIT2WZgBJ9OE4tJ9fzwQ0b0yXhaiel8KMp1WkzWMVqRyq3IFHkPSx
	 tsOCWR/RdCc592CFm60btK0fNnLk1FD2q0TbLiN2aac2/IDJYmy5HYzHs4vdVPditY
	 J0s4fUpD0Zf/dROsjdpn/+1l1ylSjQeYlUGFlfELGNsV1YZDzhOP0oyfK/49EEiqaD
	 wM+bkIsEKClhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF2D540F84;
	Fri, 31 Jul 2026 12:04:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6769527B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E0EE400DA
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KAvXWIVzRw0 for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D5B040463
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D5B040463
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D5B040463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:04:44 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso944918f8f.3
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499482; x=1786104282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=L3onD23Y0Z7kKd/eywUqYlqz1q4+FG1wLxJM145tMI0=;
 b=rydt8KI+vZZk8F7z5w7EKhZF0whswI4uqaIT9T0Mdo0rFD23IPqzFISHUVKeDB2BYe
 s/xAugq0Cq0q0ZjQewp3Gvu2eEvzVXh/zN7VZnyMedqlI3jBeLcjZKdkJu/NVmLNKNfP
 NbPgBxTQabKpQ5WjT8lvq7eaCBfqhMCOx8+fzYpPV2t5SEBKsKg3VMq/nR1SZx4LeZ1A
 k+QzgD5GyKx/V8ezHjH4HPMAXroo1eJSuwkYd36sk40jIK00EJYuz/Oc2Poph0Wir0oh
 qAgJz4L2Lay78AxctKt2qCQ0df/6od3ZJfOaKYsqqGCH9L22qgpLDf8dCn383Dph90DY
 dF2A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrpXtpQNCDmkRNdSbOUy2nyFqIIpiZ32rBK4QzOV8EkMRmz6J/TJVS0OQV6Ymf4uXaraAvlbIDYG1A=@buildroot.org
X-Gm-Message-State: AOJu0YwXm/ZznK+DmfnxfLn0WStYl8jw7SlGmnL2yx15a/HsUq2m8obW
 bP8qrDiaCWzxyJ0tSWHTzZ7hjdlmv4BdNRAOb4p5O7Ev0IqWSuaFyWfBsM35eOpbHvx2s3WM5Y4
 GjVS3
X-Gm-Gg: AR+sD11UH0gdJ5AtKUDI/lyPMBdwkQgfccwLiMzHOev/ZMwF5U5Tggh8FBO4uElsPwy
 kxCE/T0OGQm5QFNLmKQbS7St564T7ehcgvyDFUhwyWvS1HCCoDIMPci6CWXR8JYUKiOOFck5yuk
 s9zB5OBi6mh//36tIcRvqB9UZ8wkWCZQJ7JagnC2d4NQ82EuLAQGX0AKEX0PRUI7Wnm4bCWTfiE
 0jTVn/4Z3lTzhXxkwBEmOnu3gz3mPEX5a4xqshxxygLVDK5qJHOuZHRRy8fDBvrHH0NfM0hj9xe
 GOW7sE+4CxuMrxZgTtycqS9biueNBWVhO9akhCYdOk45xEeabj68Nrf0FoZ2572vlYjZl4P1Y8W
 N7ZQgISZllx04GYux3RynPcID8Of4t156ukQpv4EhbFEs+vhVaOI31YPPh0F3KJZSKwnnVBSS2y
 1KXRebZ84qHo/Dlgfobz7+tmdCjs2BHns/FhqMl16F/K3SEA00c9UvXRiI/RngVEDHs/NG3a2nX
 yRFAp6X/9KhnBFZbRy3IRCzbA==
X-Received: by 2002:a5d:5c89:0:b0:475:3a97:8e2c with SMTP id
 ffacd0b85a97d-47fd2ac9f98mr4126580f8f.16.1785499482116; 
 Fri, 31 Jul 2026 05:04:42 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd4562a38sm3897788f8f.21.2026.07.31.05.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:04:41 -0700 (PDT)
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Buildroot development <buildroot@buildroot.org>
Date: Fri, 31 Jul 2026 14:04:40 +0200
Message-ID: <20260731120440.3136-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <fb861da0-a232-43e4-923e-15a1ece7017c@grenoble.cnrs.fr>
References: <fb861da0-a232-43e4-923e-15a1ece7017c@grenoble.cnrs.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499482; x=1786104282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L3onD23Y0Z7kKd/eywUqYlqz1q4+FG1wLxJM145tMI0=;
 b=dsVIaCBAVD2Ol+fxPnX/bv8TVBGJWSXsMu81D1GiGsWFj5YN01zq35eAsXBR2nCC9a
 eOm5mWj5F2USS5kjIRD2E4OPLPce8tBkw0SjxOvKfP/Rnihh23KkCRXQagN4HJ+3L44u
 Z3HUpsO5O6PH0a7T7jntjt/HG2kypHkNFWrMOu8BaPcxCf04HrhCBq48c7r5M23doSEH
 Qh/yDgpILYBYKPBk4AHqZgM0DOr57NYDwE7EiFa9w5APxGw+qDtEpZZb0yueeaye8wF3
 XfjYLm2gxofdP1bs9c2VAPdaUTAIKmOak7P7AGT9hrRLwbePesHodnaibpfyHvFhfg3J
 U7Iw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dsVIaCBA
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/1]
 configs/acmesystems_acqua_a5_*: bump to Linux 6.12.98
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
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Applied to 2025.02.x. Thanks

> ---
>  board/acmesystems/acqua-a5/patches/linux/linux.hash | 4 ++--
>  configs/acmesystems_acqua_a5_256mb_defconfig        | 2 +-
>  configs/acmesystems_acqua_a5_512mb_defconfig        | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
> index 2c86a53263..6ce8a07bdc 100644
> --- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
> +++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
> -# Locally calculated
> -sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
> +# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> +sha256  a62b6a2d207ff72510e5f47156b7078e1e71797357412411b8e4fff97fc8f4c7  linux-6.12.98.tar.xz
> diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
> index e3cca2408c..71a559df96 100644
> --- a/configs/acmesystems_acqua_a5_256mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_256mb_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.41"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.98"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
> diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
> index 1a38c742d8..32d7692ce4 100644
> --- a/configs/acmesystems_acqua_a5_512mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_512mb_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.41"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.98"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
> -- 
> 2.43.0
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
