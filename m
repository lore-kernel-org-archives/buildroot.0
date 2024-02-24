Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB82C54E41
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 20:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD5F940579;
	Sat, 24 Feb 2024 20:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RA-C60jiHLdX; Sat, 24 Feb 2024 20:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06954408CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06954408CB;
	Sat, 24 Feb 2024 20:58:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58E3C1BF276
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 405FF405F7
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKZ933BvdaBd for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 20:57:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C2C3404FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C2C3404FF
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C2C3404FF
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 20:57:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3e891b5e4eso216741766b.0
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 12:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708808262; x=1709413062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSjGw9f6z6kn4c1jsZC1lUaY+UqUehEPVM2pz+w5v/o=;
 b=IpxNZU/w3BoO2CytkovB90kRfEJbIfShIABz1UKaqqGIsDefqgCpWSgEaGY6ykOTxQ
 bQ+uF8emAd/N0BWKt6HnEvkYAIrIvFETN7jMUNQ0JmFpoOhrawrAPKDiIQLtDKU3qpUx
 xIn9BOthL271BlCdQSZr5o9W+mF1SWqyWd+uquiVljaJZFL2QAaNKuWyWtzhmsvaHumr
 bGVF6U/kgOsgeQT6ECUigrrXHMzxfv4yq8/wjvA4RvV774rCG+1MqGgBKAN8/eRtPeIi
 Fopd7oGy51loZ53ji8vmNwfT0e/EoCjK+2+IFa1mBeXGpfQ29ZmDyf53xWdqT5WwclvS
 3umA==
X-Gm-Message-State: AOJu0YwJwrOqZzyldguusKe4E4ZtqqLvq0coDycJ3B3e2BGBbugCV5Hv
 xXjNEeM9yKcwkDor65aotFYinj4VI3iQIlIeJB/Y+lr3JyZFl7MRTY5k6iSFS/cXqnrVKLt3o7+
 riQQ=
X-Google-Smtp-Source: AGHT+IG96/CImy7PJksbrUkxi8PVKSnqgKuxB0pavBwP1ObZdX0uFovty3Tclv013VrDPjHhQwBbDQ==
X-Received: by 2002:a17:906:3951:b0:a3e:a5b9:d69d with SMTP id
 g17-20020a170906395100b00a3ea5b9d69dmr1978795eje.74.1708808262070; 
 Sat, 24 Feb 2024 12:57:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 tk6-20020a170907c28600b00a4306ac4c77sm425506ejc.197.2024.02.24.12.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:57:41 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 21:56:48 +0100
Message-ID: <20240224205654.1546744-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708808262; x=1709413062;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSjGw9f6z6kn4c1jsZC1lUaY+UqUehEPVM2pz+w5v/o=;
 b=VNVnZvNK54rvPpH0q9eHiP6gPAyhZ+yGNCBZwIBi68XYKp9s44EMH3p3K0M/Zm+IUo
 Z+eMAFsQIkODVP5K9MNrVYujpMeFYf5P3fCCBMYQtO4NQYQh9gHin5Zg9frbnTOspgjO
 +f2pihmXVUGJlzyDajy4tkkj/YuDHDc6SATsE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VNVnZvNK
Subject: [Buildroot] [PATCH v6 11/16] boot/ti-k3-r5-loader: set binman
 environment
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
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts.

The patch set the BINMAN_INDIRS environment variable to provide the
directory to search for binary blobs and select the packages required by
binman.

The dependency of binman is not really easy to follow. First we have the
packages list from binman.rst [1] then we have to install additional python
modules [2]. Maybe in the future it will be necessary to add host-lzma and
host-lz4 in the dependencies list.

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/binman/binman.rst?plain=1#L377
[2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Update the commit message adding the links of requirements.

Changes in v5:
- Add dependecy on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
- Drop runtime dependecies
- Add host-python-pylibfdt dependency without requiring
  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT configuration
- Add host-python3 and host-python-setuptools dependencies
- Add SOB and COB tags of Romain Naour

Changes in v4:
- Drop the BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option

Changes in v2:
- Change commit message
- Add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
- Select packages required by binman if
  BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN is enabled

 boot/ti-k3-r5-loader/Config.in          | 1 +
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 5f86c045c99f..fc71337e80cc 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -1,6 +1,7 @@
 config BR2_TARGET_TI_K3_R5_LOADER
 	bool "ti-k3-r5-loader"
 	depends on BR2_aarch64
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
 	help
 	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
 	  Usually used to build tiboot3.bin with k3-image-gen.
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 0ffcb8235f2e..fdb058f3b72a 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -39,7 +39,12 @@ TI_K3_R5_LOADER_DEPENDENCIES = \
 	host-pkgconf \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	host-arm-gnu-toolchain \
-	host-openssl
+	host-openssl \
+	host-python-jsonschema \
+	host-python-pyyaml \
+	host-python3 \
+	host-python-setuptools \
+	host-python-pylibfdt
 
 TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)
 TI_K3_R5_LOADER_MAKE_ENV = $(TARGET_MAKE_ENV)
@@ -58,6 +63,7 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
 	ARCH=arm \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
+	BINMAN_INDIRS=$(BINARIES_DIR) \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
 define TI_K3_R5_LOADER_BUILD_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
