Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AD1C25B7E
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 20:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 069E9843A2;
	Thu, 30 May 2024 20:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ge5hL-3rs9P; Thu, 30 May 2024 20:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDBEE843A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDBEE843A4;
	Thu, 30 May 2024 20:47:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2881D4ACF
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 20:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9825441980
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 20:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQIc29JxvfO5 for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 20:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4213A41971
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4213A41971
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4213A41971
 for <buildroot@buildroot.org>; Thu, 30 May 2024 20:47:17 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-420180b5897so3433535e9.3
 for <buildroot@buildroot.org>; Thu, 30 May 2024 13:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717102035; x=1717706835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3keDdEfi/k2uJj0Aualm7czM5u5w9i5dakVjLEMlTU=;
 b=PvtBHsogVvpIIhQQ+OkizwGTkGBT2H9XJr3J7cRBSCPExeYSAoh3x4KXiiy+jo0peJ
 JZbzF3eWSWJvit4Ot6629KS0Lksvlv0IpAIoxsZ0QMlblfFi/BzcpXUSWZVLdzynL4OQ
 /fhvRV1DAJIsL8VrGgV1j6G24QVXfqjmAGF6lBKL8MJmEmHCT635+SggfwMLmK2MuC9B
 jQNBIKfI2wgelgaf8d/epm4CYL5BMsgNubI13HsDlvRHfZUXNkgJMSGP3+imauAIly8f
 PMH77LaVuXkbq+dIsoT10DDe05wBqtcrwfOGkjUyP5EsOtis7en0YcoXX02/Ne90N8rW
 keqw==
X-Gm-Message-State: AOJu0YxgfNlG3GlWO0/otZTfhucQ0fHOCoa8TxUiBt34UbInKKkJPsu3
 diQdhGSNIMSb6iBmJdW884Eerp1HLYxkzVD8Z1HJK6PPnu9sg+oQHy/nWK5f4YrOwcA+N1GY8MI
 G96k=
X-Google-Smtp-Source: AGHT+IHWCuhcDGDXdZ1tAgrBATrh7bdcwCUtSxPyKxqEdBVsOGbe74Xhz7/Am/C2DDvMa6+14I04Vw==
X-Received: by 2002:a05:600c:5101:b0:421:2985:bf44 with SMTP id
 5b1f17b1804b1-4212985c059mr23399085e9.13.1717102035160; 
 Thu, 30 May 2024 13:47:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.40])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b84ae09sm4736375e9.18.2024.05.30.13.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 13:47:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 30 May 2024 22:47:04 +0200
Message-ID: <20240530204706.2132204-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240530204706.2132204-1-dario.binacchi@amarulasolutions.com>
References: <20240530204706.2132204-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717102035; x=1717706835;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3keDdEfi/k2uJj0Aualm7czM5u5w9i5dakVjLEMlTU=;
 b=CD0TTsKqMZlpqbfXXVrpbjvZ8sspEyyEDCKibJE19PTTVnciAxmdnf3H2lmzzNvgG0
 V5kSu3AVdTXsbUXNOIbSDQoeJ9yLvT0mBR4DwF3jMWmcBea9zdjp8rNWL3A62Zj5ylPe
 FQllHkudtDxHwR6Gwid/BzcH3WxGPtEiVJrlA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=CD0TTsKq
Subject: [Buildroot] [PATCH 2/4] configs/acmesystems_aria_*: add hashes for
 at91bootstrap3/Linux/headers
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                             | 2 --
 .../aria-g25/patches/at91bootstrap3/at91bootstrap3.hash         | 2 ++
 .../aria-g25/patches/linux-headers/linux-headers.hash           | 1 +
 board/acmesystems/aria-g25/patches/linux/linux.hash             | 2 ++
 configs/acmesystems_aria_g25_128mb_defconfig                    | 2 ++
 configs/acmesystems_aria_g25_256mb_defconfig                    | 2 ++
 6 files changed, 9 insertions(+), 2 deletions(-)
 create mode 100644 board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash
 create mode 120000 board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash
 create mode 100644 board/acmesystems/aria-g25/patches/linux/linux.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 8f5fc0a47686..5d15fa8046f6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -117,8 +117,6 @@ boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch lib_p
 boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch lib_patch.Upstream
 boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch lib_patch.Upstream
 configs/aarch64_efi_defconfig lib_defconfig.ForceCheckHash
-configs/acmesystems_aria_g25_128mb_defconfig lib_defconfig.ForceCheckHash
-configs/acmesystems_aria_g25_256mb_defconfig lib_defconfig.ForceCheckHash
 configs/acmesystems_arietta_g25_128mb_defconfig lib_defconfig.ForceCheckHash
 configs/acmesystems_arietta_g25_256mb_defconfig lib_defconfig.ForceCheckHash
 configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash
new file mode 100644
index 000000000000..6edf3d3345ec
--- /dev/null
+++ b/board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash b/board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/acmesystems/aria-g25/patches/linux/linux.hash b/board/acmesystems/aria-g25/patches/linux/linux.hash
new file mode 100644
index 000000000000..81824a41ee4c
--- /dev/null
+++ b/board/acmesystems/aria-g25/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  6c5e4d3c87feadbfdb9f7d2e46f3f120b00286ba380491c5956708e0b94232c8  linux-4.19.315.tar.xz
diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
index acf24d1fed51..261a2c9fa365 100644
--- a/configs/acmesystems_aria_g25_128mb_defconfig
+++ b/configs/acmesystems_aria_g25_128mb_defconfig
@@ -6,6 +6,8 @@ BR2_arm926t=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # System configuration
+BR2_GLOBAL_PATCH_DIR="board/acmesystems/aria-g25/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
index 2713c3ca79c1..183c4f7b7300 100644
--- a/configs/acmesystems_aria_g25_256mb_defconfig
+++ b/configs/acmesystems_aria_g25_256mb_defconfig
@@ -6,6 +6,8 @@ BR2_arm926t=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # System configuration
+BR2_GLOBAL_PATCH_DIR="board/acmesystems/aria-g25/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
