Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D021CA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4C8A61CBA;
	Thu, 21 Aug 2025 19:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGBM6_IcHpIe; Thu, 21 Aug 2025 19:22:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13EE061BFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13EE061BFE;
	Thu, 21 Aug 2025 19:22:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D9831C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D93A61C27
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMRuy9lxvCdd for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C8A861C13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C8A861C13
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C8A861C13
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:25 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3c380aa1ad0so767390f8f.3
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804083; x=1756408883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MWmySSvsMEUOQVG5lgoj35Bght0o3AS8YjrjrK0uEn0=;
 b=i74AdNejPNb6KkjZ3xocCwA94DFX6mXNbviAQTuf77LJt3eTQzs8o6XcISNXf37kHI
 159P6yjnPtOdVjiY/cf33IDRIWTJ28XxFohsPec59w+0ipsLH4nVGIU3aZ4aCqP0yqNm
 UdJnLwoU+7bTbJ66pvWyVWwhJpD1qLHvuNNdDLyGOBo0Q915OQnZHnoAHNR6uHMs31V+
 HV+7DLOL9FJEww7+QhbKy1zWdinM5sXyE5Dy/b27ZQtrKwp2vjyzmk014mFmXU88KXV2
 +GztxGnB3EmLBmdZHr8aVXrqODlsSOw8d2ttET0t/fzOiZmtQb09TbmhurYIXbalFPZK
 L58Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7EmUY+P6Rg7eXqDpKuPes8GcoVuB5y0JEUOanu0MAZTZae26myTNYZbT5alao3PIwk/N9HYCEBlA=@buildroot.org
X-Gm-Message-State: AOJu0YyisjCc5qXqjcIVdOZ7vrId/UdqIW0diO21PSyM6Yy64HNdBTTl
 l6TbBXFucS1CGGluTtujsdlbTZvFgCWGJLA2rCRd6gwDGzjkoif999KP08XJOvfcMFc=
X-Gm-Gg: ASbGncv9NNX7Uot2lIXdcN5IFIzUSc+iQnzJeFUjsyN6s+8uCUCuzaGgMW+ilaXTiGs
 482F7D/MkcTzKcBadU9tI6R31/Wud49W5eAejMpiVKg5MhvtCSknkUyksAmETDdc6ot3quThJ+J
 oiK/Fb/uRDjfu5x5v39YkdqPyszC7KlbPuBVvu/gE+95sJxNCrmClEOS+0zF9LrmWVI+CDQg2QY
 gD8fQovtWhYff/2e0PxoTPyIej52jv/ldOSYHkU8cA95StjfIGX7xLVtUJUyfaycy6c206Wqrmm
 GtXmLdc1vrOP6g8FiWDqMhtoPRozTE0VCzvL+ukZKlDeZKWi9l3nWnTS4QveAEdJtb/zMBm9vBr
 EAw4Xq8Pc/jtAQg==
X-Google-Smtp-Source: AGHT+IGelCxaQLyzXBx+3IGfWHEjVCZ1lZtN7NdVk1zQHAySdQeVF1Os+kkbUewSYgn5iriVBe5N3g==
X-Received: by 2002:a05:6000:288b:b0:3a5:2653:7308 with SMTP id
 ffacd0b85a97d-3c5dcff7307mr97348f8f.57.1755804083230; 
 Thu, 21 Aug 2025 12:21:23 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c077789d12sm12587898f8f.54.2025.08.21.12.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:22 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:22 +0200
Message-ID: <20250821192122.24565-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815103002.3871929-2-thomas.petazzoni@bootlin.com>
References: <20250815103002.3871929-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804083; x=1756408883; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MWmySSvsMEUOQVG5lgoj35Bght0o3AS8YjrjrK0uEn0=;
 b=YjA81XbTOSn08R82YtymHqUNbo7OGLD8Tgz2BAJWzlmYYgeqeremYSE0baMFbQFCTu
 59c9Zi/E6e67m+q4pvqkMDAmyNgBmqQsVWB4cX/QGpj6KDN8fn6t2uimcgbAfiGnQylX
 Rz9TlOnAOcj96yDZvRnDvn7CH8Hx1w86XGjtZ9jXjrayvTr3yYBsQz2Q5ZGbRmbYllbR
 E+kUVsgX51J8IpHeAm/NAE6tnuC/61HEgVrdlW4FGHygtHS639oW1gmihG2z/+yR4fX3
 A+f2ZVWANzoMopj18/k1jde2BCC2yI3nIdj7TcG+Ng7Jjo+xHcqm0/FwN9rZNrfP+CpS
 xJdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YjA81XbT
Subject: Re: [Buildroot] [PATCH 1/3]
 support/testing/tests/fs/test_iso9660.py: use a more recent toolchain
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
> The ISO9660 tests are currently using an old 2017 toolchain. Let's
> switch to a modern toolchain, which is regularly updated. Also, we use
> a toolchain based on glibc since grub2 doesn't build with recent
> uClibc toolchains.
> 
> It will work around build issues with syslinux.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828975
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828871
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828770
> 
> (Even though those should be fixed separately, as syslinux should
> continue to build with old compilers not supporting std=gnu17)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  support/testing/tests/fs/test_iso9660.py | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
> index 3d08f2e895..1b86bfbfc1 100644
> --- a/support/testing/tests/fs/test_iso9660.py
> +++ b/support/testing/tests/fs/test_iso9660.py
> @@ -4,16 +4,9 @@ import infra.basetest
>  
>  BASIC_CONFIG = \
>      """
> -    BR2_x86_pentium4=y
> +    BR2_x86_core2=y
>      BR2_TOOLCHAIN_EXTERNAL=y
> -    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> -    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2017.05-1078-g95b1dae.tar.bz2"
> -    BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> -    BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
> -    BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> -    # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> -    BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
>      BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>      BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
>      BR2_LINUX_KERNEL=y
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
