Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4C5CD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF6E610FD;
	Fri, 12 Jun 2026 11:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0F77r4fmO-b; Fri, 12 Jun 2026 11:37:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBCFF610C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264244;
	bh=2vE87ovUOfdYV8nVKyZ6TWs8rvzQMnzi+GImAPUsVro=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dFxD/c7XeQOR+u6hAdHPKyxbej+I06YL6MNNd+t1tnpqX8uBVUkn317O+Faqh7Bm9
	 dU+jWLN+hd7o/yC/n0X+z0CTYZ1oaPPdMs9dS2NpZogQHWC/oT3sOx3kXflWbDHXXP
	 lF/BIgYuGZ91mlDFXIUgtu0c61yzMeRMXcVtL8koq0V1i+rQrTHWmr9klJxXMklR52
	 YBV+uhlPxf530X8YObOKtHyDXyBxM6XRAttOvsKVZSmoDDalczLT5mXgyYksPLSmuB
	 +BzNo9yo737SkYhSts6df0z8nu+bI8lufo00qCCxlhmqrFMgpGG79sGkhN3EebwfA9
	 /o3jirPnaFL2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBCFF610C5;
	Fri, 12 Jun 2026 11:37:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BFB82237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B16CD6105B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhojT8NYuAPp for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58FED61062
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58FED61062
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58FED61062
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so6447685e9.2
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264234; x=1781869034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vRfiT+NtM1F7zhll8bkRvF5AWM9FSqIatqkuwBoAy3M=;
 b=Gcg9KXctgyex8XoJoQRH4x/WYqHhw4Mo3wv3B+YK9WMDf3UPhh6PG3TDm4snaHY+xo
 g09iPqqU+gsByD6tT0+rxr5OLbL2res35RMX+f4RnLASf+eHpKWKAgPIBMNK1vI1qVXF
 N7WoXZMvj1mxmnBroUcw2hQzPks9PQmV5QyO8CFNjN782St3NMxAzB3Z0QvXi+B3TZmc
 8rFk2yY2brH1qVNDDeueQATSzz7NtwuDUuoCjic94/iMGwpjjKHpHaLc6U+HBfEmiotj
 FlGvzPo6/ALmwYxBWPZ4SCcWnVxcTw26QaTgfTQSayM/FFZaJHeD+UD39cLMQ5VoI1yn
 78Lg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8F2htT6PzIGwaT+xLng843SMHNblmn+NrHFoRC6+LK1DmDdl2mlw9YGc6vllxW0dOcrhgJbTONgMY=@buildroot.org
X-Gm-Message-State: AOJu0Yxmg2G2/IPTx7Zue1UUZVyKg10DwodHdxVHwV2reoU6ZEdnJM+v
 CW0YOKzGQMjQ5p5uu6Vf6lAPUmPardXkHo4v3oURhi/WDv9B2nbtPouIjLszkKASZ/Y=
X-Gm-Gg: Acq92OGXV2kJbFIo0RltDzYiIzZC1QpGl7XH7al6D8OrUjXqkSDrHWzXB4wW2JxXNDA
 dGSIIB0681IxK0Fs7x7iKK5kUSzR8QmAg56bWupzyDwYST/pEcZ+HiTxV5tWdcy//H/+Xid+YnK
 +aGBGLEOylAK0aIrELP39L701BuKtb0O78F9OIjGlvPqbrRJQMAT4HWpav5N/7+uJMhdBtjVrkS
 gOUpzz/IdsaNeZFhMqQy2GCvm27OW8dVeX//1cTCzEjqMVE9hmXxtHDycRVSkxF2Y4OtFxyBfhq
 AZUp7TFDZxYoOL869QWaeTbiO55cGwENOC8ns6ADizQ6M6TAPlWLyogpxsdW6GvN27Ookqg96Vy
 Z+uGbDuiBseIhZUw7+A2wEdIghkSG6yAsWwGcfARNzgRn2IFlXm4IuyZNJM42QGpenc8oZnjWa0
 hEOtiEZZenfRcvcHU=
X-Received: by 2002:a05:600c:3b26:b0:491:89c2:bf3e with SMTP id
 5b1f17b1804b1-49189c2bf42mr19563585e9.30.1781264234293; 
 Fri, 12 Jun 2026 04:37:14 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2d046d5sm140937505e9.13.2026.06.12.04.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:13 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:13 +0200
Message-ID: <20260612113713.251665-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606225120.409046-7-romain.naour@smile.fr>
References: <20260606225120.409046-7-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264234; x=1781869034; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRfiT+NtM1F7zhll8bkRvF5AWM9FSqIatqkuwBoAy3M=;
 b=QIRva6W1BulePlNlpWh7ht71aYl8dqIHvsXRQ/TdOnVmbe3sHdl6SMd0EwqxLfpdhs
 1m4XZA4Z1IZigKtRXGDK9J68iirfD7T4MFtV2HDcDRzhNRweib49zf6OvgGoZJYj94b4
 hhymAARYC/Rl/Knd3V8scFN+OSXHzJ/l+4MarCiamyr6KK20ks9I2aiOs3bwJoJp2KpB
 s+drzJ1LD3i7baiO+TMFMqCXurwnV9/DcKQUj93FwcHpl1UvtD+K0CmUg7bMkhRWpUKV
 xcWXzxDVr0V2eTl/W1E8KtpRGLp+np4u3wEy/XN3NwkcE64dHYIG8ju3kSPYiYlH01S9
 jcyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QIRva6W1
Subject: Re: [Buildroot] [PATCH 7/7] configs/arcturus_ucp1020: specify Linux
 license file
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
> The used Linux kernel (4.4.144) does not contain the default license
> files as those were only added in 4.16 with commit e00a844aca
> ("LICENSES: Add Linux syscall note exception"), so specify the correct
> license file to fix:
> 
> make legal-info
> ..
> cp: cannot stat '/path/to/output/build/linux-headers-custom/LICENSES/preferred/GPL-2.0': No such file or directory
> 
> And add the sha256sum to the .hash file.
> Enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913808 (arcturus_ucp1020_defconfig)
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Michael Durrant <mdurrant@ArcturusNetworks.com>

Applied to 2026.02.x. Thanks

> ---
> Note: This defconfig still use a vendor 4.4.144 kernel
> (linux-v20190618.tar.gz), a vendor 2019.07-rc4 uboot
> (uboot-v20190618.tar.gz) and a gcc based toolchain since
> the support for ppc SPE has been removed from gcc.
> How long should we keep this defconfig?
> See commits:
> 531b2a10cda6bae78ecc141c9fe48f2024f71dbc (2021)
> 96e80ad214ced86c802d561946fa7da88c1595eb (2020)
> ---
>  .../ppc-ucp1020/patches/linux-headers/linux-headers.hash       | 1 +
>  board/arcturus/ppc-ucp1020/patches/linux/linux.hash            | 2 ++
>  board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash            | 2 ++
>  configs/arcturus_ucp1020_defconfig                             | 3 +++
>  4 files changed, 8 insertions(+)
>  create mode 120000 board/arcturus/ppc-ucp1020/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/arcturus/ppc-ucp1020/patches/linux/linux.hash
>  create mode 100644 board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash
> 
> diff --git a/board/arcturus/ppc-ucp1020/patches/linux-headers/linux-headers.hash b/board/arcturus/ppc-ucp1020/patches/linux-headers/linux-headers.hash
> new file mode 120000
> index 0000000000..5808d92afe
> --- /dev/null
> +++ b/board/arcturus/ppc-ucp1020/patches/linux-headers/linux-headers.hash
> @@ -0,0 +1 @@
> +../linux/linux.hash
> \ No newline at end of file
> diff --git a/board/arcturus/ppc-ucp1020/patches/linux/linux.hash b/board/arcturus/ppc-ucp1020/patches/linux/linux.hash
> new file mode 100644
> index 0000000000..eafb86d8cb
> --- /dev/null
> +++ b/board/arcturus/ppc-ucp1020/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  5ad0192e5cd10eca5f9fabb3234f2bfcbafba3382a9577139cc66be629e5bafa  linux-v20190618.tar.gz
> diff --git a/board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash b/board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash
> new file mode 100644
> index 0000000000..eb9744043c
> --- /dev/null
> +++ b/board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  eba8aaf634affec7c27a55b899c404a85a0c219c3f814d576793e3c21b711b05  uboot-v20190618.tar.gz
> diff --git a/configs/arcturus_ucp1020_defconfig b/configs/arcturus_ucp1020_defconfig
> index 8e489f7f19..c0423032bc 100644
> --- a/configs/arcturus_ucp1020_defconfig
> +++ b/configs/arcturus_ucp1020_defconfig
> @@ -1,6 +1,8 @@
>  BR2_powerpc=y
>  BR2_powerpc_8548=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
> +BR2_GLOBAL_PATCH_DIR="board/arcturus/ppc-ucp1020/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_TARGET_GENERIC_HOSTNAME="UCP1020"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to Arcturus uCP1020 System on Module"
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> @@ -8,6 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCP1020-kernel,v20190618)/linux-v20190618.tar.gz"
> +BR2_LINUX_KERNEL_LICENSE_FILES="COPYING"
>  BR2_LINUX_KERNEL_DEFCONFIG="ucp1020"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="ucp1020"
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
