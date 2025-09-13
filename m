Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35604CAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 19:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 018A74174A;
	Sat, 13 Sep 2025 19:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dryPhCBq66Uv; Sat, 13 Sep 2025 19:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01C98416CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01C98416CE;
	Sat, 13 Sep 2025 19:04:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48AA212D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 19:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 462AD400AA
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 19:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOb-XDHBE7UK for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 19:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.46;
 helo=mail-ej1-f46.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B1BA40098
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B1BA40098
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B1BA40098
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 19:04:44 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b042eb09948so624322066b.3
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 12:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757790282; x=1758395082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LI54RZCcstw4mknUR9DOX1WePkANEhnzCgYCxkryqXs=;
 b=dvPwWUN0SOLH5k+m1lzixW2/cexoFoDRgjj2jnCOwgbdkphrqb/0gSvvyNHzpLWWNN
 KcIPpwQWHb3dCUStwudaQtPHKC+yFcB2U2qn2OabyDwn5HO5Xad1iHI4fM6WTuRGbD8O
 6HCAIF0dgUgnzPvsxMrLyrz77/hIUdL6Fw8IolvlmEpXvwNCaHkmGovwDZ8DLyUW9ab5
 liOxMAONdHvVFM3zwAAyUnRJEDCJnd6ILuCEBZbASrQbya4SwTuBcz551foHTHd7dmyk
 iaBSAbwEZgLiB1Mz+sZkc7xfMrNvHvlNvi2uO87y4ydaYTbgW7CZ8oEtkD1N1pTlvp8T
 hXuA==
X-Gm-Message-State: AOJu0YzQbhcVXa6UM9GTlcwQcnxxqothIDczZYv1Rc3wc1fKImq5xq6y
 q2nGYkA922TTOSs25PEkr5hfHFx4eHRdrmHZyLedZSo7kUWSWBC308jdDXsTL3V3
X-Gm-Gg: ASbGncs1HXsVgzl65rTAlNgugFYOkqiHNOA3EP+x8k/sgX1SnVuoiTsxVD9jEibwVzd
 FCN326TUbPXnXTQbJOXpiEec/I9UWCnXv6YnlQ+UHHPzuaMdHZKvNCjPcKKyka1l0Chz++gjzqh
 dau/SitSk+MWe8WWMMi8FqB4+2+LL6K0bSC3SKPaVC+RFTIcR5ZxDAO5JVHfb5pz1HotUxP4gfH
 pEFk1SvvcstYcZaZEFYHD+JFAHi2CwPJvsYpzTX+9wQuEmHIvpa04kBxyc9gMZyIbiEVy34nLza
 GYK8UktA5M3NjnhDq9rfFXYQkXyKFR1PkR5WT0bbdGkQTUk2RT9M2CqM7V6eJH92XzI2bXZooZG
 4eFvEC4dCorHG88YDX7nixWM9PkLHLo1fJG8WtvY3g9Uo0ZG7/FmOqxX6iGUSgp2Af4uzIEpRJe
 utG1uLixA+QORizInYJ04trql4
X-Google-Smtp-Source: AGHT+IFiiNn9vDScSjwQvNru95K9yK3LNKH4lgz3XqjdoFSEezBr9Xzq1O4FGDgIA8cnuwDGz8aUKg==
X-Received: by 2002:a17:907:3f9a:b0:b04:31c6:a41f with SMTP id
 a640c23a62f3a-b07c37dbfdfmr675468466b.41.1757790281864; 
 Sat, 13 Sep 2025 12:04:41 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb6f:7900:f67f:75ec:aef0:e4f5])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b07da7a8918sm243901366b.56.2025.09.13.12.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 12:04:41 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 13 Sep 2025 21:04:33 +0200
Message-ID: <20250913190434.2224911-4-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250913190434.2224911-1-thomas@devoogdt.com>
References: <20250913190434.2224911-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 4/4] package/libgtk4: bump to 4.20.1
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.20.1/NEWS

Also select librsvg as it is required now. (See changes in 4.19.2)

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
$ ./utils/test-pkg -p libgtk4 -c libgtk4.config -a
                             arm-aarch64 [ 1/35]: OK
                   bootlin-aarch64-glibc [ 2/35]: OK
               bootlin-arcle-hs38-uclibc [ 3/35]: SKIPPED
                    bootlin-armv5-uclibc [ 4/35]: SKIPPED
                     bootlin-armv7-glibc [ 5/35]: OK
                   bootlin-armv7m-uclibc [ 6/35]: SKIPPED
                      bootlin-armv7-musl [ 7/35]: FAILED
                bootlin-m68k-5208-uclibc [ 8/35]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/35]: SKIPPED
             bootlin-microblazeel-uclibc [10/35]: SKIPPED
                bootlin-mipsel32r6-glibc [11/35]: SKIPPED
                   bootlin-mipsel-uclibc [12/35]: SKIPPED
                 bootlin-openrisc-uclibc [13/35]: SKIPPED
        bootlin-powerpc64le-power8-glibc [14/35]: OK
           bootlin-powerpc-e500mc-uclibc [15/35]: SKIPPED
                   bootlin-riscv32-glibc [16/35]: SKIPPED
                   bootlin-riscv64-glibc [17/35]: SKIPPED
                    bootlin-riscv64-musl [18/35]: SKIPPED
                 bootlin-s390x-z13-glibc [19/35]: OK
                      bootlin-sh4-uclibc [20/35]: SKIPPED
                   bootlin-sparc64-glibc [21/35]: OK
                    bootlin-sparc-uclibc [22/35]: SKIPPED
                    bootlin-x86-64-glibc [23/35]: OK
                     bootlin-x86-64-musl [24/35]: FAILED
                   bootlin-x86-64-uclibc [25/35]: SKIPPED
                   bootlin-x86-i686-musl [26/35]: FAILED
                   bootlin-xtensa-uclibc [27/35]: SKIPPED
                            br-arm-basic [28/35]: SKIPPED
                    br-arm-full-nothread [29/35]: SKIPPED
                      br-arm-full-static [30/35]: SKIPPED
                   br-i386-pentium4-full [31/35]: SKIPPED
                      br-mips64-n64-full [32/35]: SKIPPED
                 br-mips64r6-el-hf-glibc [33/35]: SKIPPED
               br-powerpc-603e-basic-cpp [34/35]: SKIPPED
               br-powerpc64-power7-glibc [35/35]: OK
35 builds, 24 skipped, 3 build failed, 0 legal-info failed, 0 show-info failed

$ cat libgtk4.config 
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_LIBGTK4=y

/home/thomas/br-test-pkg/bootlin-armv7-musl/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/14.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ./.libs/librsvg-2.so: undefined reference to `open64'
/home/thomas/br-test-pkg/bootlin-x86-64-musl/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/14.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: ./.libs/librsvg-2.so: undefined reference to `open64'
/home/thomas/br-test-pkg/bootlin-x86-i686-musl/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-musl/14.3.0/../../../../i686-buildroot-linux-musl/bin/ld: ./.libs/librsvg-2.so: undefined reference to `open64'
---
 package/libgtk4/Config.in    | 3 +++
 package/libgtk4/libgtk4.hash | 4 ++--
 package/libgtk4/libgtk4.mk   | 5 +++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 99553fc44e..259226e0e4 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -1,4 +1,5 @@
 comment "libgtk4 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
@@ -12,6 +13,7 @@ comment "libgtk4 needs an OpenGL(ES) EGL backend"
 
 config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
@@ -27,6 +29,7 @@ config BR2_PACKAGE_LIBGTK4
 	select BR2_PACKAGE_GRAPHENE
 	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_TIFF
 	# At least one backend is required
diff --git a/package/libgtk4/libgtk4.hash b/package/libgtk4/libgtk4.hash
index 636b675d15..6c07161eff 100644
--- a/package/libgtk4/libgtk4.hash
+++ b/package/libgtk4/libgtk4.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk/4.14/gtk-4.14.5.sha256sum
-sha256  5547f2b9f006b133993e070b87c17804e051efda3913feaca1108fa2be41e24d  gtk-4.14.5.tar.xz
+# From https://download.gnome.org/sources/gtk/4.20/gtk-4.20.1.sha256sum
+sha256  bf32fac019171c45681b2c45d05658ee8598c6341572e32a6a6bcb0b5673998d  gtk-4.20.1.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index b00a2facad..029eb5920c 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTK4_VERSION_MAJOR = 4.14
-LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).5
+LIBGTK4_VERSION_MAJOR = 4.20
+LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).1
 LIBGTK4_SOURCE = gtk-$(LIBGTK4_VERSION).tar.xz
 LIBGTK4_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK4_VERSION_MAJOR)
 LIBGTK4_LICENSE = LGPL-2.0+
@@ -21,6 +21,7 @@ LIBGTK4_DEPENDENCIES = \
 	graphene \
 	libepoxy \
 	libglib2 \
+	librsvg \
 	pango \
 	$(TARGET_NLS_DEPENDENCIES)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
