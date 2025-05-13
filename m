Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CE6C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 08:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AA388041B;
	Tue, 13 May 2025 08:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziTU_K8hCg1p; Tue, 13 May 2025 08:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5747682002
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5747682002;
	Tue, 13 May 2025 08:56:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CFE8153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 08:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DC7A40D5D
 for <buildroot@buildroot.org>; Tue, 13 May 2025 08:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMS-I26qZdMR for <buildroot@buildroot.org>;
 Tue, 13 May 2025 08:56:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17F1140D52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17F1140D52
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17F1140D52
 for <buildroot@buildroot.org>; Tue, 13 May 2025 08:56:34 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a1fa0d8884so2405260f8f.3
 for <buildroot@buildroot.org>; Tue, 13 May 2025 01:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747126593; x=1747731393;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZLrSOGfd9Nmda9J5oMcj0Q6jCm0ueX0DLrkbnclI1ZY=;
 b=gjLFF14SwjqazEPJbMqvW6uWV/e1bK8krDRsIV419/y6FpEg9henC4UXZecJ8oFWFa
 XlveD3VI6Nl9PnhDSgBh/JCR4b9D+12g9iPSXul89hUCfU/kPOSIvSbyy0woVBuf9Jzl
 LV3wGRDxoC3QmxvJYFxXwszggeW3EAoztWSnyUdltt84xvnVG8IydnrUi1vOPvM2OYN8
 5edrXj9jCUckkE/6e+qcSeGBPEnbzHR0wHdUJ4LlPDZz9JgbPKvJ8bfWG93DwjMyB8hr
 4vqFjQxtbsQ+zxfMCWgiQwC9UwbfhwcYyIvo5vpvKa0X1ytJ8PynjDKXb1jVFXQFXjY3
 PSfA==
X-Gm-Message-State: AOJu0YyQ+egQrFmqBym+5W1cV8h1juqGK4jfafo8Uelpo7xYnDAPaVg2
 T6QU+3Nt9e+4H5N/MOSCpiM4I8v0gqks0z/5ciHYn8a5pAURKP69Micbyg==
X-Gm-Gg: ASbGncshGRUvFoVASqeilX+QJrEKmzkqTrgR3SYIjCMzHbk4RVV2BUg24BiCsS0dOkc
 fSFfj0DVOt1GiSiLOdgUh4H6BIobptWt994wCViMLssJLN2mBLcTO97yEyqVQuFDuJfKi1BMjUi
 1aa35uF/O+PFuGbAzZQfqCM1omQGrrZ1K5rmVvuFKi/NZ3fZLsrpuKXIEghUtjA/WC/+Bn+yU6N
 uF/PgK+l+DXikm6zQIwwFc7rl4RSbotgXC+zDifWLeSIk/mhjCk/2bHMw5bP3CQa4fyADQY2xok
 nF0MPfP/8Scp1zr305qHdjlwiNb0R3fR/1QyAjlX9DOX
X-Google-Smtp-Source: AGHT+IG8D7rz5x0A/++7PA3dMBPC12LjB33Rzs0OO5K34IlFnawGA4lOFutfeda27+pVJna8x7YWvA==
X-Received: by 2002:a05:6000:2502:b0:3a0:b941:dc24 with SMTP id
 ffacd0b85a97d-3a1f6429658mr12232756f8f.11.1747126592567; 
 Tue, 13 May 2025 01:56:32 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:b478:b417:f636:165c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f194sm203748035e9.10.2025.05.13.01.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 01:56:32 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com,
	Maxime Leroy <maxime@leroys.fr>
Date: Tue, 13 May 2025 10:56:27 +0200
Message-ID: <20250513085628.38864-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747126593; x=1747731393; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLrSOGfd9Nmda9J5oMcj0Q6jCm0ueX0DLrkbnclI1ZY=;
 b=bTSPUfWM6NSes+TGGlZ4929QraOp0fhy70rrafLaVdUI9ihgGmrWFSwT1KksaMuiAv
 bPa9zZSxKokLtgZPdLvVCLpkbjdRgYsJUbYWdsaFPkIqq+N/TttJxSe3J41u76cOBfpa
 8lni2V7SswmpZekD8+xwUd+JJ8l2SKHvun/NGX03F4kgNO4yPj+QQrgWWThnocfTD3Ow
 uiNUsDIICzjuZY5ADVwh/rrVLMsQuxHhkCBSbaO2gu23wTwAPUUJ2AUqMpK2J2Hwl9ph
 JK7GN6sK7w9ZsPuXDKqAw0oKw5aEj80HmfbbMWcJhM/0Iag5bj2kUiQzwhDWPkkEXOGM
 yGBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bTSPUfWM
Subject: [Buildroot] [PATCH 1/2] package/grout: bump to 0.10.0 version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release note of the new version:
https://github.com/DPDK/grout/releases/tag/v0.10.0

Libcap is not needed anymore for this new version, thus dependencies has
been updated in consequence.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/grout/Config.in  | 3 +--
 package/grout/grout.hash | 2 +-
 package/grout/grout.mk   | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/grout/Config.in b/package/grout/Config.in
index 4b3e89210f..0ebf772e51 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_GROUT
 	bool "grout"
 	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS # dpdk
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dpdk
-	depends on BR2_USE_MMU # dpdk, numactl, libecoli, util-linux-smartcols, libcap
+	depends on BR2_USE_MMU # dpdk, numactl, libecoli, util-linux-smartcols
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # dpdk
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19 # dpdk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # dpdk
@@ -10,7 +10,6 @@ config BR2_PACKAGE_GROUT
 	depends on !BR2_STATIC_LIBS # libecoli
 	depends on BR2_USE_WCHAR # libecoli
 	select BR2_PACKAGE_DPDK
-	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_NUMACTL
 	select BR2_PACKAGE_LIBECOLI
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index 66b993efc4..388f600a73 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0470754b31922645177f4d15654fd345882fb6af4c415229b50b185eeeb8aa95  grout-0.9.1.tar.gz
+sha256  95918642f8bebcaa298bc4128a1522ad837ccfcf3f06b6d9979e0a62c76688d0  grout-0.10.0.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  LICENSE
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 3466f84865..228601dbec 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.9.1
+GROUT_VERSION = 0.10.0
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = LICENSE
@@ -15,7 +15,6 @@ GROUT_CONF_ENV = GROUT_VERSION=$(GROUT_VERSION)
 GROUT_DEPENDENCIES = \
 	host-pkgconf \
 	dpdk \
-	libcap \
 	libevent \
 	numactl \
 	libecoli \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
