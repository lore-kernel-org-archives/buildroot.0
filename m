Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712D5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 08:38:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 920E461040
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 08:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 920E461040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33289605D7;
	Sat, 30 Oct 2021 08:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0y92-aEMhAQ; Sat, 30 Oct 2021 08:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92FB7605CA;
	Sat, 30 Oct 2021 08:38:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBEB11BF3D7
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 08:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBB6380DD2
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 08:38:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gN_c_ddJXaH0 for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 08:38:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C688080DCE
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 08:38:23 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d27so2421671wrb.6
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X25bUA88tihw3gH0AM/Cfl3+j7/bSfF7k60oP9voDT0=;
 b=JUMy+dRFU2ppYwlWMaz33ee4xKfDuKKaEuAgqVPIwVXUYK64iB7E4hilFoneOfI8fC
 ann2Zm1DSkq3AvX5OhfVzm1Kc/ITgwoPii7rh6X8gHbscGMavuaa6tHQjuU0nb5Q/t08
 my/UW5v7EtdD0q3CCBgfpYWbC0YFoWbMj2DXbOwtaJYXEPTMd6h3dsvT7Q028LkMDaVr
 ljcT+5JWnpKc6rNRJUjOmuWQla9QVN+3UiR6ETqcVS2CFVQKM2t6fmnECxNISwdyKl09
 VnkW6+3eByDfgsevBRsOBJkb6x3xlY2tzJzViiwmTzIuNJvr+uGfd6xcczsmixI+ifro
 3KgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X25bUA88tihw3gH0AM/Cfl3+j7/bSfF7k60oP9voDT0=;
 b=saqH4+SU1iT4I2bf1Wb6JD3P6Tr7Yf+oMg3r4izYE/RB5Tn/6+7thcrCKyG+PkNvYV
 hVer9nTvvM9yHFfcWhq3hngSltJ8eZ1mtrI0Y0bSaWnBwqRdowLagIwVBo4GNXhtLjlB
 HYcwrPv3/k/M2TfwB7jcJT5QiDVBy6XG1PidrfcgF6LTeS8C2GOW4T+EY6yfMKVNa1e5
 CprtlG7WDYzeV3Xug+NK9R11BGmPYr6OHNM9V0HbLrHxiAfNgoeqXCG679dmFRqp09Dq
 BRzU/Ss4YM4lluFq3gGhRvEDEYrG6Plf6GGFfDqEil0H5PoYvswFm4yEFkU1QenUGGAk
 ZFBw==
X-Gm-Message-State: AOAM533EZMV+/0TVwMwp5v3KHX5TAThbD4lVguCgqIOMMmKKiF7l0Pel
 YcKqgnhTMkfm3O+vbLH1rME/gSHBVPNYIw==
X-Google-Smtp-Source: ABdhPJwVk43ICT+tiZvGjkB/42W4Yt4D1i0BUGpaqknsERdsVv7OTfGxLKI7O1gRxFEH2BvAL4AU1g==
X-Received: by 2002:adf:c40f:: with SMTP id v15mr11276310wrf.302.1635583101635; 
 Sat, 30 Oct 2021 01:38:21 -0700 (PDT)
Received: from localhost.localdomain (bzq-109-66-15-185.red.bezeqint.net.
 [109.66.15.185])
 by smtp.gmail.com with ESMTPSA id t9sm827280wrx.72.2021.10.30.01.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 01:38:21 -0700 (PDT)
From: "irgstg@gmail.com" <irgstg@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Oct 2021 11:37:50 +0300
Message-Id: <20211030083753.192-1-irgstg@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/glibc: optional MTE support in glibc
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, "irgstg@gmail.com" <irgstg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adding option BR2_PACKAGE_GLIBC_MTE to configure glibc with MTE support.
When enabled, glibcs configuration process runs with `--enable-memory-tagging` [1].

MTE (Memory Tagging Extension) is an ISA extension which aims to improve security on ARMv8.5-A [2].
The linux kernel supports this feature via CONFIG_ARM64_MTE.
In order for glibc's MTE support to work properly, the running kernel has to support that.

dependencies:
 - supported on aarch64 only (BR2_aarch64)
 - requires binutils version 2.33.1 or newer (!B2_BINUTILS_VERSION_2_32_X)
 - requires at least linux 5.4 headers (BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4)

[1] https://sourceware.org/git/?p=glibc.git;a=blob;f=INSTALL;h=02dcf6b1ca3a4c43a17fdcae5e7dae8189c1c50b;hb=HEAD#l145
[2] https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/posts/enhancing-memory-safety

Signed-off-by: irgstg@gmail.com <irgstg@gmail.com>
---
 package/glibc/Config.in | 12 ++++++++++++
 package/glibc/glibc.mk  |  1 +
 2 files changed, 13 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 5ecd058145..6d42aa6771 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -16,4 +16,16 @@ config BR2_PACKAGE_GLIBC_UTILS
 	  Enabling this option will compile and install the getconf,
 	  ldconfig, ldd and locale glibc utilities for the target.
 
+config BR2_PACKAGE_GLIBC_MTE
+	bool "Install glibc support for MTE"
+	depends on BR2_aarch64
+	depends on !BR2_BINUTILS_VERSION_2_32_X
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	help
+	  Enabling this option will configure, compile
+	  and install glibc support for MTE (Memory Tagging Extension).
+	  Please be aware, in order for that to work properly,
+	  kernel support for MTE (CONFIG_ARM64_MTE), and a
+	  supported CPU are needed.
+
 endif # BR2_TOOLCHAIN_BUILDROOT_GLIBC
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 3862e0624b..a44c2828f8 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -124,6 +124,7 @@ define GLIBC_CONFIGURE_CMDS
 		--disable-werror \
 		--without-gd \
 		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
+		$(if $(BR2_PACKAGE_GLIBC_MTE),--enable-memory-tagging) \
 		--with-headers=$(STAGING_DIR)/usr/include)
 	$(GLIBC_ADD_MISSING_STUB_H)
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
