Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6F9C282D2
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 17:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFA4A40D56;
	Mon,  3 Mar 2025 17:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvJJPvRyyxYH; Mon,  3 Mar 2025 17:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB00640EC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB00640EC2;
	Mon,  3 Mar 2025 17:02:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B686B91
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 17:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FC3540D56
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 17:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69YHowE7THlW for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 17:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6EB040D49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6EB040D49
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6EB040D49
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 17:02:52 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e4bed34bccso6432244a12.3
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 09:02:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741021370; x=1741626170;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=58C6mEFwvdxC1pdayFmx7z0zMQsKq+ZDW4YYc1gNtJI=;
 b=jP+/ZE6NPqGNNJEFFxb1lmXyf7GoOMzBTWqVdeYWM+4oZpX+eiyBvmlbfxutOqV8Rr
 B/HiWpe5hTW4nOaiFFozYqcNgK1qvYpXeZNdqaJyxEIhFID6goUPehH3rnPACYeYoQBx
 UI/IWv3wGT9mYAXuoioXN0FwRpjVwbovH62M3CXyPqHr0LDbpYm0wiVSOLbc8SdTGpZP
 hsS0D5aac6u31QH1Vg8KD/2AOKraV1L35s8SwIWZIQs4dH7LhqCunfZmHQWNqJuEgEIl
 E1AnJbcj2AKS+Khy7RTFM1SNgssltE1nOnd5yH4mzG/RCUAMlLhRdXPni0k/EXHMmss8
 4Cuw==
X-Gm-Message-State: AOJu0YzGNLk4U0+xViaKjpukP8PZ6S0U+nfLMQVFx30fF/LGJUBcLY1M
 2RCqRjXCer0Nx1Rwa5oF5PlVypBYokurYSqqHdV+iuaGVkcVX+GzfOpl80KIKq6p6XD2ObY8MP9
 Y
X-Gm-Gg: ASbGncsYIsJ4RCjT7B3dByDuQzKUkKx+GPBRm2OFMKgPeW24tgrIdpgQiS2a03/J72d
 7MInEhyf7fUlH8sMt9Fd/rT5R1+pelCoGodBFiAjtY8cMA8jQeZfX84iDv1iYii7tXeEZg5qgGF
 gr/46UG5U33kSx1aQ+MXXXENVN5VHl4CuUteTwiK2SzTyex6zPIFmkkMzU+x5RWAJfGbVkSZ+2T
 PVRuYXmqubJiXDDq/I776H/OgrbJZFRVZR2G37ipWUh3piZL4b8MTApoGJfJjBivzF+cfEiJA+Y
 1i509kyhETKUt81JpIEXtuwqDmervDl0X4MBM/+4yR/aCd3s5b7u68jwu59QI/oN2EDJ7s47KGd
 NloUbLcjKITnvmvcR08RdSSOCUm8fxMGN6js=
X-Google-Smtp-Source: AGHT+IGdK90SW424ZXsOKXk9rXESqvXVYzUglAmO8MVjj0l0JAsOOOcLnolb+ZKTm7lXSq5vIMJqXA==
X-Received: by 2002:a05:6402:234e:b0:5dc:c9ce:b029 with SMTP id
 4fb4d7f45d1cf-5e4d6acd607mr17468731a12.5.1741021370426; 
 Mon, 03 Mar 2025 09:02:50 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.213])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e533a89a21sm3169278a12.60.2025.03.03.09.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 09:02:50 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Mar 2025 18:02:45 +0100
Message-ID: <20250303170245.3657781-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1741021370; x=1741626170;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=58C6mEFwvdxC1pdayFmx7z0zMQsKq+ZDW4YYc1gNtJI=;
 b=bX0ntb1WALcsOgwAIsAvQG7OY4bVKLOFuE1fp1D9VcMoyl3++shuCckTr2qsKgwMsn
 jO70QUpI2MScjpIkTmpU1DL+45ePGY/GLri3gCa61GPYrRXnN66dYbdFcgOJLdqYbmln
 gskM/G3sm+Aa2xtXRF/Kekrrob3hZTrzawZKM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=bX0ntb1W
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add lts-v2.12.x
 selection
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is a new lts-v2.12.x branch. Add it to the selection

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/arm-trusted-firmware/Config.in                         | 6 ++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk           | 2 +-
 .../lts-v2.12.1/arm-trusted-firmware.hash                   | 3 +++
 3 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100644 boot/arm-trusted-firmware/lts-v2.12.1/arm-trusted-firmware.hash

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index c8deede9cd75..becc3f69c3f2 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -16,6 +16,11 @@ choice
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	bool "v2.12"
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION
+	bool "latest lts-v2.12.x"
+	help
+	  Select the latest LTS v2.12.x version available
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION
 	bool "latest lts-v2.10.x"
 	help
@@ -53,6 +58,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
 	default "v2.12"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "lts-v2.12.1"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION
 	default "lts-v2.10.5"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION
 	default "lts-v2.8.20"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 172a930b5c7c..dca16d396044 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -20,7 +20,7 @@ ARM_TRUSTED_FIRMWARE_SITE = https://git.trustedfirmware.org/TF-A/trusted-firmwar
 ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
 # The licensing of custom or from-git versions is unknown.
 # This is valid only for the latest (i.e. known) version.
-ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION),y)
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION),y)
 ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
 ARM_TRUSTED_FIRMWARE_LICENSE_FILES = docs/license.rst
 endif
diff --git a/boot/arm-trusted-firmware/lts-v2.12.1/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/lts-v2.12.1/arm-trusted-firmware.hash
new file mode 100644
index 000000000000..649ae8df44be
--- /dev/null
+++ b/boot/arm-trusted-firmware/lts-v2.12.1/arm-trusted-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3ab7e90d6fc3364815ad7770d7aa7af9cfd68edde43da7123f5f38f80e034c44  arm-trusted-firmware-lts-v2.12.1-git4.tar.gz
+sha256  b2c79635797bafcde84c6edadadde290b9d5e05deb3ea16a847210fd2ca83669  docs/license.rst
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
