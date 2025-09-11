Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E79CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F9594228B;
	Thu, 11 Sep 2025 19:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oM7XAdcKB5Nc; Thu, 11 Sep 2025 19:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96D6A422FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96D6A422FF;
	Thu, 11 Sep 2025 19:20:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4197E443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28027404DE
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0JlpGvCmcIS for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25CC5404C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25CC5404C2
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25CC5404C2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:20:35 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b07ba1c3df4so122927066b.3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618434; x=1758223234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tlZ5a8pSVM1VCuewE37LwMneoCwmA/taQT1jv7ER0WI=;
 b=MKwAktRlKyC+awoiXqOa0XIGZl1F5knDt8Y+ORYe+hicO7VlkRf86KsBOJD8oxsJ4I
 +dDjoIsWIKffIwW+e8vq0yT4Yudv7ncn5DN0k2+KYmom6fs/vVFMWCUDlSy82bpVxvNV
 Y4DR/bAxc9nznK+WSB58MwhUPv+Zi1ro1Uk2TE2UBszYW9bZ3snS8f7FJJHrJSHw5MhS
 aevuv7+Agn38EL5G3Ucz4u9FwmlR8SMdGDNQJDvIqCHjfMvuqO3Vsb6TMG2dzwsIzWe6
 Ib/k1AcLnbrUwAhLj5OF7RtaVl/w9j//RUkpyPN3fNhF3Azxg/AENIQp+seQqfU97zoR
 7Dfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVINQaPllbdt6Bu/Lw98/kOhWjYjfEjKYSyEigVflE+sMK2Vt2B8nggAXlUKNF6Bse9Garyt488ks0=@buildroot.org
X-Gm-Message-State: AOJu0YyeGA3msnA5tnttUpt25J/plk8nQjNN2Z+VL6uKjJQ6nIO/KCk7
 5jfzIocgmVKh+X6D73favlrEEXd/7cEPgGWxiehV6HHRno1aUZlSI/lXU90TJIYTXcc=
X-Gm-Gg: ASbGncs4kQy2KHcaI48G7mZUIeJuGUKAxZ0UtP6ReblS32QPsvnt81JMI1D1TsVNeST
 4azaAX4KaFduWuSL6AwSk00CxbvTyXAYYpkbWUIHiCNWDFRnBv46DtbAofiV0KG6ThovU0C0nH4
 3ty6pw7fWAs6vV7AXQ3nNlu3Zpniae6MdJGFMs6SXfZ46cVc53iWN0Yd+AKMsVPJDxaqBfdS2aH
 At8lUAFHEXZRM/RPDbpYV0WLgw3Nb/zP3Wf/LRGgjuD1Iu1HhoeuLxQ146SCurhp6SeLDBHZIE/
 lPB0kovUzl7U8NHIusMQ3zouYdMD53GlrP3R9BU2B/T8kjug6BwFylzMhFV9gNNZcC2paGIKWw+
 IabDnzpA+tIWqy4SWGEbyd8yl9C4vn16aPY4VVwI0Ke1v/gw=
X-Google-Smtp-Source: AGHT+IGhsmqiKhT+84l3puYsixGrNTg8CczBUkQ7FgrE6nsiwnp2yF1GiZxkQGktfL2WlybG2YPMyQ==
X-Received: by 2002:a17:906:f583:b0:b04:7107:9758 with SMTP id
 a640c23a62f3a-b07c383882fmr26091666b.43.1757618434082; 
 Thu, 11 Sep 2025 12:20:34 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b334eb65sm188202066b.97.2025.09.11.12.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:20:33 -0700 (PDT)
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:20:11 +0200
Message-Id: <20250911192011.2671329-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829-bump-6-12-43-v1-1-cbb173f16a63@bootlin.com>
References: <20250829-bump-6-12-43-v1-1-cbb173f16a63@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618434; x=1758223234; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tlZ5a8pSVM1VCuewE37LwMneoCwmA/taQT1jv7ER0WI=;
 b=Nj/j8iOv3KhJas8WsITt3TE85zOqnBk0K7+yJi7M4V2cHXTXPeMGqIukHzKS+ODiz1
 vCT+IYu+NDzYIPd/9ZpJJDEGZdZYQGX9pfqJZeb6WPnRVOjQ81lqVjVHhnkjGMdsKCrZ
 SWpqf5FrBEfY5lYV6Cfd6NRGJ7SMQ1CTwQewsQnWS8tBq+1B0KUr/aqmuw21AI+V9WLa
 2Zfth03lQEdFYfS3N6CXVSCZIw6RO/XLZ82YuMEFbS2y2Md+suzRZkvL9LNfBhFfZ1QA
 4lhtRM6lPZra0HMNaIDzbUuOksozxwE0K/NWJ0cJm9FxxHdR0yH8iH5qpQfRzGd5FV8L
 01wg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Nj/j8iOv
Subject: Re: [Buildroot] [PATCH] configs/ti_am62x_sk: bump Linux to version
 6.12.43
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
> The Cadence QSPI driver is broken in version 6.12.36. It was fixed by a
> subsequent patch:
> 
> https://lore.kernel.org/all/20250730093234.216392179@linuxfoundation.org/
> 
> Which was later backported to the 6.12 stable branch.
> 
> Bump the kernel version to the latest 6.12.x stable version to fix QSPI
> support.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
>  configs/ti_am62x_sk_defconfig              | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
> index 6c7685ad4d0733770e24d6e15537f6ca1d5ca376..df60f9a5823db0966355d3bff8d5ace4e3b6719b 100644
> --- a/board/ti/am62x-sk/patches/linux/linux.hash
> +++ b/board/ti/am62x-sk/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
> +sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index 28e6fc03ba1c1c6e650e7086445b75732350fb5e..211d58a66f3ce032f9ebced7cb3ac523b97dfdde 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
>  BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.43"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
> 
> ---
> base-commit: 0461043a51322ebcf7cdd90b0d2f9b59df17bb9c
> change-id: 20250829-bump-6-12-43-8c2a892078a6
> 
> Best regards,
> -- 
> Romain Gantois <romain.gantois@bootlin.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
