Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913A4C0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 15:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A90411C6;
	Sun, 26 Jan 2025 15:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxJs7DFNiLbb; Sun, 26 Jan 2025 15:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6FE241197
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6FE241197;
	Sun, 26 Jan 2025 15:48:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1717294A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B697640F48
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KaOsxeRashU3 for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 15:47:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A64214092B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A64214092B
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A64214092B
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:55 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3ce886a2d5bso27626065ab.1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 07:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737906474; x=1738511274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=anoslpGS6MTGf8vQlLQw0F40xwuimgfLPnLLZHd4yBY=;
 b=GPYahIoXlsFREX3/tSp/6v10sC2yKqeFfazSke6u1IgLofePjCDYJWOl/MQ9jk0IPv
 rx6VHXD5XcFXwm9pUifCfy6JR0DhPL2oMDxtra/grtKSSb/ffkwqM2Qk8Lw2nhjvc8b+
 gvKqUht2HtmCaXVC6qGIYIs3XyzqMAfpIuUaV4h8MVUrr+2X+n3be3AisMp+diqSeKhY
 nstsVb/JzjeswCloP0h9Scfn9DdBdAZCS4OU+nEodinIT/w98Jmzp9Z6RHz7biWHOHi8
 Wo1EvrKCLjnBbZt3WuMuYS9hMroDvyuH7w5F8BqlrXXGzFck0RtW5Q22tE+srn03vZ5B
 vBQA==
X-Gm-Message-State: AOJu0Yyf+UcKyuF1LZcLkzmBUI9en/67raiiqkAqIjLuqG3BD6D1o5ZM
 2G3Z5yprud6t6GnIk2kjrTSvo4S2lpjBS0DgCzQTloabZtU5OiRtrc69hgit
X-Gm-Gg: ASbGncsRxXfyCnIitPrDHcNY7O9KfkmDNZsj87YPmubnqId5D94xmUJ+uk52Kms3qNI
 Qttzv+RXMOz8k8Vh+AOgoqtRTOBAdzm2xxTasISRwEzzYUXRAvv7s1yR1P31K7L3aArKKdeC+Km
 RhSuV7Pq1MrkzniWiVU//WrWUhgUfLiO3tsB+7gOfnuF28ew94TVa8OxEGcfGcqLlyhxjceGkIX
 oFymJ2Ew0HSV9wQHKatRUPdBZBdD20owy2sfTFJ3GbSBGr3ma8ajUcvBI1Sp3bA/wKO/l1fVFHL
 VOCWZGhvESjgYoeZZgZ6CsHpae3gGHTujyWYoFbsEw6WghDy4hHaiU9rjOLldw2okw==
X-Google-Smtp-Source: AGHT+IGS2y+/HJMdMOZk8vlpZ1l5+7gfuRgoBTclXqu4LJA/iwsONb+2cRTvCCbfhBBipcV6+rmIkw==
X-Received: by 2002:a05:6e02:1d8b:b0:3ce:78ab:dcd1 with SMTP id
 e9e14a558f8ab-3cf7449415bmr330215855ab.19.1737906474420; 
 Sun, 26 Jan 2025 07:47:54 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc74ea0afsm20900715ab.47.2025.01.26.07.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 07:47:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Jan 2025 08:47:31 -0700
Message-Id: <20250126154732.405055-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250126154732.405055-1-james.hilliard1@gmail.com>
References: <20250126154732.405055-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737906474; x=1738511274; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=anoslpGS6MTGf8vQlLQw0F40xwuimgfLPnLLZHd4yBY=;
 b=QIfn9QyF0PPKUJUej6chtTsGb19/r3V72XkSQVhB0HZvUQKHUEZlWnS1/a1R/QDDAF
 zaouNjKXz+aIfKa+nnJwOXhPfTOWyKr2jK4QZRr2XBijuHf9To1G7q9kFXM8DnoSOfWM
 AixGJAa13c80ZVL9ZYbjPcmnAe2wdjd2H4NJSe7Ql7DkFvcp4JW+mNlVFaARqpYH/zbE
 4YOtxOU1OBtK9BDNOdLaB3N3QCLAT8dAyQTJBw56T90dt1SYajnf8K47WFnkkdE3oeto
 vkePhFnhdvaMYgg6045GW+a8Mi/4XaFozitW3Yq65f3OFg2+C26WSCjeeipcDaSP9OhT
 +y4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QIfn9QyF
Subject: [Buildroot] [PATCH v7 09/10] package/farmhash: new package
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

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - add C++11 dependency
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/farmhash/Config.in     | 12 ++++++++++++
 package/farmhash/farmhash.hash |  4 ++++
 package/farmhash/farmhash.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/farmhash/Config.in
 create mode 100644 package/farmhash/farmhash.hash
 create mode 100644 package/farmhash/farmhash.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 05071e6b46..72a3c3eeee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3034,6 +3034,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/farmhash/
 F:	package/fp16/
 F:	package/fft2d/
 F:	package/gemmlowp/
diff --git a/package/Config.in b/package/Config.in
index 0f35409720..e8e07d37c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2183,6 +2183,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
 	source "package/falcosecurity-libs/Config.in"
+	source "package/farmhash/Config.in"
 	source "package/fft2d/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
diff --git a/package/farmhash/Config.in b/package/farmhash/Config.in
new file mode 100644
index 0000000000..ef22898774
--- /dev/null
+++ b/package/farmhash/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FARMHASH
+	bool "farmhash"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  FarmHash, a family of hash functions.
+
+	  https://github.com/google/farmhash
+
+comment "farmhash needs a toolchain w/ C++11"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/farmhash/farmhash.hash b/package/farmhash/farmhash.hash
new file mode 100644
index 0000000000..afdfc0f994
--- /dev/null
+++ b/package/farmhash/farmhash.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  18392cf0736e1d62ecbb8d695c31496b6507859e8c75541d7ad0ba092dc52115  farmhash-0d859a811870d10f53a594927d0d0b97573ad06d.tar.gz
+# License files, locally calculated
+sha256  4162dd091caae234f72d3b57e138174f733e736b2430a4c51b098b17d866fcb6  COPYING
diff --git a/package/farmhash/farmhash.mk b/package/farmhash/farmhash.mk
new file mode 100644
index 0000000000..6ab7d1a88b
--- /dev/null
+++ b/package/farmhash/farmhash.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# farmhash
+#
+################################################################################
+
+FARMHASH_VERSION = 0d859a811870d10f53a594927d0d0b97573ad06d
+FARMHASH_SITE = $(call github,google,farmhash,$(FARMHASH_VERSION))
+FARMHASH_LICENSE = MIT
+FARMHASH_LICENSE_FILES = COPYING
+FARMHASH_INSTALL_STAGING = YES
+FARMHASH_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
