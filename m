Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495D3C0219D
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 09:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EDDC414B6;
	Tue, 11 Feb 2025 09:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vr-3IzkRHgJF; Tue, 11 Feb 2025 09:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E787414B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E787414B2;
	Tue, 11 Feb 2025 09:33:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5960AC2
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 09:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BE71414B2
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 09:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9cClbrM7t2P for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 09:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B091D41488
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B091D41488
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B091D41488
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 09:33:55 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5de4d4adac9so7367547a12.3
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 01:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739266433; x=1739871233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MpmM9AA6Ao9JGy3o8YF/nNgtIVP+l0e3XNb9UpekGQ8=;
 b=sKdd7jSUTKGTq+2la7qj2YDzGOjtXb2SrEQ8UtVqa2CS/MRuqOJLZslS8wUMg2yVxa
 GMdyiicoO0+iMHWA+cKP0A/Z1nmJ6IMcuNbffdQsoazNO05voQP3+ZeGWUFNVOcdvkDz
 01RdpbSyxvYptaTlI5dZydZJLhkFrg+2NYs2rCUpS+PuplSwcKz7JyKOCfsKx7DeQaSv
 +yYVv7cPpjeYPBc1m35tinNwMnyZkMEAwitd/O5t820HG1y9P0XTSJ+RtyLo6O+HJige
 ee9V0gQgO1BK3vOD/iz+qNY+75X5un9axW95UoCtB+LbBAnA8LGTT1BScVO2Q8Atre2f
 o7wQ==
X-Gm-Message-State: AOJu0YxOFvfO90Bnkjvs8YvNyqbzT1Tqn1nZ1ANH9i1vhF6Y+H4H4SYu
 nUeQPJCgRHDZqwQpbyqPG2IxUPKbqvYI+girhz+ZQuwE7iFJqiqEN67ngrE13lqkFxTNoPkWCra
 g
X-Gm-Gg: ASbGncsSEiPX4342lniA+1Lpz0vYqaumMjjWN/4DoQcxawJMuMjBxXNEOkpgSVsMgZb
 PCN29WZNUqEPBQnzQEP6GJE4wIUmmZxwK2wGtsU8T6JfZyZkGDikGnOWuU6qY8DJ+vwihMXvyJ8
 nFbKVVrUNoKaTK4Sao+AHy0pRhQKAKr5fhk9ES2AITgWP5GfylHxoSNVXfKEbHr9hyF7LKShZn+
 RRr2JMIl/hkpgcsELXLFrSE8RzeJi47BNw5xRSkc0vCKzoudp7QmV5UhnWfJyaZTC98ERurKPCY
 KwhfYq+RkTInpVuvsV0w+/kB2WnLPRzdE3mrgDs8rv84+D2oe16r
X-Google-Smtp-Source: AGHT+IHHWXkB24KMGnkFQhWf8x9Vg1STZCNtqfEt3Rd7XrG2W0HvNZdOvGerAQBs7loTUm5fQXygHQ==
X-Received: by 2002:a05:6402:440f:b0:5dc:8b8b:3527 with SMTP id
 4fb4d7f45d1cf-5de45019d7cmr20088030a12.17.1739266433275; 
 Tue, 11 Feb 2025 01:33:53 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:b949:915b:211e:da1b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de525f35b7sm7049320a12.53.2025.02.11.01.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 01:33:52 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Javad Rahimi <javad321javad@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 linux-amarula@amarulasolutions.com, Julien Olivain <ju.o@free.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 11 Feb 2025 10:33:49 +0100
Message-ID: <20250211093349.2153008-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739266433; x=1739871233;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MpmM9AA6Ao9JGy3o8YF/nNgtIVP+l0e3XNb9UpekGQ8=;
 b=Rs+Inbvgk2hOfUdLFOckrkJwJP4UM6PHwDXb1O/j8hiHeu64EVI0KW7NOk3iIPzBW+
 MLvcB5P0bTy2fP6E6271w9PAokDQHLgKeRNuUfN7vpT4pskCZk/VAl6ywnGijmluPQEa
 BSD7ij80j9ncjHBvkBvW4DNAwmpy+nDhla1qs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Rs+Inbvg
Subject: [Buildroot] [PATCH 1/1] boot/uboot: support System Control
 Processor (SCP) firmware blob
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

The commit 4bce3270d680 ("Config.in: timeout earlier when connecting to
download servers"), among other things, adds the connection timeout
parameter to the default scp command:

config BR2_SCP
       string "Secure copy (scp) command"
       default "scp -o ConnectTimeout=10"

Since the package/pkg-download.mk file exports this command using the
SCP variable:

export SCP := $(call qstrip,$(BR2_SCP))

and the U-Boot Makefile uses this variable as the path for the system
control processor (SCP) firmware blob:

cmd_binman = $(srctree)/tools/binman/binman $(if $(BINMAN_DEBUG),-D) \
		$(foreach f,$(BINMAN_TOOLPATHS),--toolpath $(f)) \
                --toolpath $(objtree)/tools \
		$(if $(BINMAN_VERBOSE),-v$(BINMAN_VERBOSE)) \
		build -u -d $(binman_dtb) -O . -m \
		--allow-missing --fake-ext-blobs \
		$(if $(BINMAN_ALLOW_MISSING),--ignore-missing) \
		-I . -I $(srctree) -I $(srctree)/board/$(BOARDDIR) \
		$(foreach f,$(of_list_dirs),-I $(f)) -a of-list=$(of_list) \
		$(foreach f,$(BINMAN_INDIRS),-I $(f)) \
		-a atf-bl31-path=${BL31} \
		-a tee-os-path=${TEE} \
		-a ti-dm-path=${TI_DM} \
		-a opensbi-path=${OPENSBI} \
		-a default-dt=$(default_dt) \
		-a scp-path=$(SCP) \

the following error occurs:

  BINMAN  .binman_stamp
usage: binman [-h] [-B BUILD_DIR] [-D] [-H] [--tooldir TOOLDIR] [--toolpath TOOLPATH] [-T THREADS] [--test-section-timeout] [-v VERBOSITY] [-V]
              {build,bintool-docs,entry-docs,ls,extract,replace,sign,test,tool} ...
binman: error: unrecognized arguments: -o ConnectTimeout=10
make[2]: *** [Makefile:1126: .binman_stamp] Error 2

The issue was already present, as the scp command was being passed
instead of the path to the SCP firmware, but it is now detected due to
the compilation error.

Adding the BR2_TARGET_UBOOT_SCP_FIRMWARE option allows passing the
correct parameter to U-Boot, even if it is not set. This also requires
removing the SCP setting from BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS for
configurations that previously set this variable explicitly.

Fixes: 4bce3270d680 ("Config.in: timeout earlier when connecting to download servers")
Suggested-by: Julien Olivain <ju.o@free.fr>
Co-Developed-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/Config.in                   | 8 ++++++++
 boot/uboot/uboot.mk                    | 3 ++-
 configs/olimex_a64_olinuxino_defconfig | 2 +-
 configs/orangepi_pc2_defconfig         | 2 +-
 configs/orangepi_zero2w_defconfig      | 2 +-
 configs/orangepi_zero3_defconfig       | 2 +-
 configs/orangepi_zero_plus2_defconfig  | 2 +-
 configs/orangepi_zero_plus_defconfig   | 2 +-
 configs/pine64_defconfig               | 2 +-
 support/testing/tests/boot/test_atf.py | 2 +-
 10 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f17f932c9e95..6087534fee2d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -744,4 +744,12 @@ config BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
 	  List of custom make options passed at build time. Can be
 	  used for example to pass a DEVICE_TREE= value.
 
+config BR2_TARGET_UBOOT_SCP_FIRMWARE
+	string "System Control Processor (SCP) firmware location"
+	help
+	  Location of a SCP firmware binary.
+
+	  If not empty, holds firmware for an external platform-specific
+	  coprocessor.
+
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2796b0a31010..18997cbdbe26 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -176,7 +176,8 @@ UBOOT_MAKE_OPTS += \
 	ARCH=$(UBOOT_ARCH) \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
-	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
+	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS)) \
+	SCP=$(BR2_TARGET_UBOOT_SCP_FIRMWARE)
 
 # Disable FDPIC if enabled by default in toolchain
 ifeq ($(BR2_BINFMT_FDPIC),y)
diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
index ad446ea18c82..b63ea51bc6d3 100644
--- a/configs/olimex_a64_olinuxino_defconfig
+++ b/configs/olimex_a64_olinuxino_defconfig
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index 46d04b34c845..d61ffd0f5f24 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -33,5 +33,5 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/orangepi_zero2w_defconfig b/configs/orangepi_zero2w_defconfig
index c2030b05c20a..64c06d42315a 100644
--- a/configs/orangepi_zero2w_defconfig
+++ b/configs/orangepi_zero2w_defconfig
@@ -37,6 +37,6 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/orangepi_zero3_defconfig b/configs/orangepi_zero3_defconfig
index c6aa9c991a6c..78c7d6daff00 100644
--- a/configs/orangepi_zero3_defconfig
+++ b/configs/orangepi_zero3_defconfig
@@ -38,6 +38,6 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 2b7ad2064d96..73b18533a28e 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -45,5 +45,5 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero_plus_defconfig
index 48c8e993f020..c6eee1d4115b 100644
--- a/configs/orangepi_zero_plus_defconfig
+++ b/configs/orangepi_zero_plus_defconfig
@@ -34,5 +34,5 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index 8975f3b1a211..f719cd9d2fef 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 6142dd36c12a..d00bfa0ff931 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -25,7 +25,7 @@ class TestATFAllwinner(infra.basetest.BRTest):
         BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
         BR2_TARGET_UBOOT_SPL=y
         BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-        BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+        BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
         """
 
     def test_run(self):
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
