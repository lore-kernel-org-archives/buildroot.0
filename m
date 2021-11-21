Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A30C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 17:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0F8480F3B;
	Sun, 21 Nov 2021 17:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8PvYPMzqXS49; Sun, 21 Nov 2021 17:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E0480E2B;
	Sun, 21 Nov 2021 17:10:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA0821BF3E1
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9C064030B
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bBFHq-TZMBNx for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 17:09:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58B0D40306
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 17:09:31 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id w23so31800455uao.5
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 09:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VwKqSEmgzLSYc5x6nKiUlOip3lrrHONXBO1n2wcOKxQ=;
 b=beFb7aSXf1WhFtT50z6ti2uurYs3I6yZOSejh9aOXgm1nklL9pXTIp9tr5H6buvkm/
 jXyifj22giSj3+w6HJkQ3yEzl9iNw7vrC30AH1ml5Cl348KAQ5Rw/NQfQQ3g2nEuuRtN
 bjIeFCUijV50wFUSw8dgEkJclpV6hVaU3nRFr0pl4DSfshac3u8IShBM2B2GrBtVpROw
 nDc5WenP98imvIjerdTwJjbgXahjACdIwMI8GEjce2rakXn6I2C3Ipse4NgEb4CJRd5R
 jTyIPASJgP0b/u4KkP4ksm9575NYe52DZCdgwF85svA+CRLsiu4FrbMgH814TM1zcbkH
 eHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VwKqSEmgzLSYc5x6nKiUlOip3lrrHONXBO1n2wcOKxQ=;
 b=A47QV2an4o4lwXATlaKhcqj5Ml26EiFtkL6sao0aQO43QZkpTZsVuixwMbBAGgc3wE
 1xLK3F7GzAkpauJdTO3FQt7xLgGcMeLc3ZGpMPuSbsWCdGNAxZLsHAPSUArJIzpy1oQ/
 iRPRv3iAuXgkZMYncviAnpSyKCkVeM+zwrCuD+6zjcSV1Dzuh6KGnygxwgek45b82m+1
 rAo5bfItN4HFaSe2cXfJY/2mY19NnqRYRrzs6u4v37u3fXeAm8k7ltGoCxty5tBiG3H2
 xgzwTda0+mEUcDBV0Hj3cLbLdeNWn1mIplWZQs5CQ0CUZ5GUZx8GdglcwA++SOaEHEWK
 zumg==
X-Gm-Message-State: AOAM531xhDBxhFR6skz7XmBr016OgCNy8TS+gjwQiHkbZLBAWTVX/Fj9
 9cyc06c66IrDT8JMUkMFAq/r9niM0KM=
X-Google-Smtp-Source: ABdhPJwJRcmHDNFpMTtjVTK8l0NLv3LXfJ8x4M0OnEjkNnBaA8cS7YAX8vLf/niN5zmsZYSC2Rpvwg==
X-Received: by 2002:a67:c40c:: with SMTP id c12mr118498300vsk.16.1637514569744; 
 Sun, 21 Nov 2021 09:09:29 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id q9sm3159121vkn.44.2021.11.21.09.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 09:09:29 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:07:55 -0300
Message-Id: <20211121170756.3810922-6-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
References: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-next v2 6/7] package: remove numbered subject
 from patches
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported by check-package (by calling it directly):
generate your patches with 'git format-patch -N'

Change all affected files using this command:
$ sed 's,^\(Subject: *\[PATCH\)[^]]*,\1,g' \
    -i $(find * -name '*.patch' -type f)

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
v2: new patch in the series
---
 ...0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch | 2 +-
 .../linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch      | 2 +-
 .../linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch       | 2 +-
 .../0150-Makefile-Make-libgrub.pp-depend-on-config-util.h.patch | 2 +-
 package/arptables/0001-Fix-musl-build-issue.patch               | 2 +-
 .../bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch | 2 +-
 ...1-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch | 2 +-
 package/cwiid/0002-configure-make-wmgui-build-optional.patch    | 2 +-
 package/dmraid/0001-fix-compilation-under-musl.patch            | 2 +-
 package/elftosb/0002-force-cxx-compiler.patch                   | 2 +-
 .../0002-tr_languages-cast-string_ordinal-init-values.patch     | 2 +-
 ...2-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch | 2 +-
 ...3-src-Makefile.in-Really-install-unversioned-solibrary.patch | 2 +-
 ...2-cups-support-replaces-static-with-static-libtool-lib.patch | 2 +-
 ...01-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch | 2 +-
 .../0002-kvm-unit-tests-test-for-rdseed-rdrand.patch            | 2 +-
 package/leveldb/0001-Fix-compilation-with-g-4.8.2.patch         | 2 +-
 .../libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch   | 2 +-
 ...1-cmake-handle-static-library-and-find-required-thread.patch | 2 +-
 package/liblinear/0001-blas-don-t-overwrite-ar-options.patch    | 2 +-
 ...1-log4c.m4-fix-underquoted-definition-of-AM_PATH_LOG4C.patch | 2 +-
 .../0002-Fix-linking-error-without-pthread.patch                | 2 +-
 .../0003-Fix-debug-mode-build-with-uClibc.patch                 | 2 +-
 .../0004-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch          | 2 +-
 package/liblog4c-localtime/0005-Fix-C-support.patch             | 2 +-
 ...1-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch | 2 +-
 ...1-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch | 2 +-
 package/lzop/0001-build-with-gcc6.patch                         | 2 +-
 package/mongrel2/0001-Do-not-run-tests.patch                    | 2 +-
 ...2-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch | 2 +-
 ...3-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch | 2 +-
 ...4-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch | 2 +-
 package/python-setuptools/0001-add-executable.patch             | 2 +-
 .../python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch  | 2 +-
 package/qt5/qt5webkit-examples/0001-Build-examples.patch        | 2 +-
 .../0001-Add-Libs.private-field-to-pkg-config-file.patch        | 2 +-
 .../0001-Fix-link-failure-with-gcc-10.patch                     | 2 +-
 .../0001-Update-to-newer-swap-macros.patch                      | 2 +-
 ...1-configure-Remove-Check-C-compiler-type-optimization-.patch | 2 +-
 package/zip/0002-configure-Don-t-use-host-CPP.patch             | 2 +-
 package/zip/0003-Makefile-Use-CFLAGS-from-command-line.patch    | 2 +-
 package/zip/0004-configure-use-LDFLAGS-from-command-line.patch  | 2 +-
 package/zip/0005-unix-configure-remove-GID-UID-size-check.patch | 2 +-
 ...0006-unix-configure-borrow-the-LFS-test-from-autotools.patch | 2 +-
 44 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch b/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
index 146d23d1af..16207afcb1 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
@@ -1,7 +1,7 @@
 From 321faaf4b78d46a0c77782c1798856746f0619e9 Mon Sep 17 00:00:00 2001
 From: Sergey Matyukevich <geomatsi@gmail.com>
 Date: Fri, 19 May 2017 23:39:48 +0300
-Subject: [PATCH 1/3] ARM: dts: orange-pi-zero: specify XR819 WiFi chip
+Subject: [PATCH] ARM: dts: orange-pi-zero: specify XR819 WiFi chip
  interrupts
 
 The orange-pi-zero board has Allwinner XR819 SDIO wifi chip. The board
diff --git a/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
index fc24e7b8a7..e4c52ab911 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
@@ -1,7 +1,7 @@
 From 068c3baff3048a3db4ef2518ff917ce749cd8169 Mon Sep 17 00:00:00 2001
 From: Sergey Matyukevich <geomatsi@gmail.com>
 Date: Sat, 20 May 2017 11:24:26 +0300
-Subject: [PATCH 2/3] ARM: dts: orange-pi-zero: enable SPI NOR
+Subject: [PATCH] ARM: dts: orange-pi-zero: enable SPI NOR
 
 Enable SPI NOR on orange-pi-zero board.
 
diff --git a/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch b/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
index 553155ce12..ae0ed9ba3b 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
@@ -1,7 +1,7 @@
 From 8dd1b2a696bb7e9914abd11cc6f5c0f54c33d626 Mon Sep 17 00:00:00 2001
 From: Sergey Matyukevich <geomatsi@gmail.com>
 Date: Sat, 20 May 2017 15:36:51 +0300
-Subject: [PATCH 3/3] ARM: dts: orange-pi-zero: enable spidev
+Subject: [PATCH] ARM: dts: orange-pi-zero: enable spidev
 
 On orange-pi-zero board SPI1 pins are accessible via GPIO expansion port.
 This patch enables spidev driver for SPI1.
diff --git a/boot/grub2/0150-Makefile-Make-libgrub.pp-depend-on-config-util.h.patch b/boot/grub2/0150-Makefile-Make-libgrub.pp-depend-on-config-util.h.patch
index 129e814982..97c315406b 100644
--- a/boot/grub2/0150-Makefile-Make-libgrub.pp-depend-on-config-util.h.patch
+++ b/boot/grub2/0150-Makefile-Make-libgrub.pp-depend-on-config-util.h.patch
@@ -1,7 +1,7 @@
 From 42f4054faf3c7f2cd2cab5b43e63f9d97d81f7a1 Mon Sep 17 00:00:00 2001
 From: Peter Jones <pjones@redhat.com>
 Date: Wed, 4 Mar 2020 12:58:42 +0100
-Subject: [PATCH 150/150] Makefile: Make libgrub.pp depend on config-util.h
+Subject: [PATCH] Makefile: Make libgrub.pp depend on config-util.h
 
 If you build with "make -j48" a lot, sometimes you see:
 
diff --git a/package/arptables/0001-Fix-musl-build-issue.patch b/package/arptables/0001-Fix-musl-build-issue.patch
index e9419b0a96..28bfa21fb1 100644
--- a/package/arptables/0001-Fix-musl-build-issue.patch
+++ b/package/arptables/0001-Fix-musl-build-issue.patch
@@ -1,7 +1,7 @@
 From cbf84a0bc377c6a368d30571f37ebfab27784697 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Wed, 2 Dec 2015 04:57:33 +0100
-Subject: [PATCH 4/4] Fix musl build issue
+Subject: [PATCH] Fix musl build issue
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch b/package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch
index 26c7f85e0c..7f1197357f 100644
--- a/package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch
+++ b/package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch
@@ -1,7 +1,7 @@
 From 5158827fded7cb4daf550a5956aff0c74f6c38fc Mon Sep 17 00:00:00 2001
 From: Michael Nosthoff <bluez@heine.tech>
 Date: Thu, 22 Jul 2021 21:36:13 +0200
-Subject: [PATCH BlueZ] tools/mesh-cfgtest: include limits.h
+Subject: [PATCH] tools/mesh-cfgtest: include limits.h
 
 mesh-cfgtest.c uses PATH_MAX so it should include limits.h.
 
diff --git a/package/cwiid/0001-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch b/package/cwiid/0001-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch
index e1e4ec485e..857e745253 100644
--- a/package/cwiid/0001-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch
+++ b/package/cwiid/0001-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch
@@ -1,7 +1,7 @@
 From af6bffb5b8b71e99e0f9bbbd2cf1fbd695a643c2 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Sat, 8 Dec 2012 13:32:40 +0100
-Subject: [PATCH 1/2] wmdemo: fix linking by adding the missing -lbluetooth to
+Subject: [PATCH] wmdemo: fix linking by adding the missing -lbluetooth to
  LDLIBS
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
diff --git a/package/cwiid/0002-configure-make-wmgui-build-optional.patch b/package/cwiid/0002-configure-make-wmgui-build-optional.patch
index f5eff33acb..49fd5faa1f 100644
--- a/package/cwiid/0002-configure-make-wmgui-build-optional.patch
+++ b/package/cwiid/0002-configure-make-wmgui-build-optional.patch
@@ -1,7 +1,7 @@
 From dbb578450974db5decc24560da4aeaed838849a1 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Thu, 2 Jan 2014 14:03:07 +0100
-Subject: [PATCH 2/2] configure: make wmgui build optional
+Subject: [PATCH] configure: make wmgui build optional
 
 So, make gtk-2 and glib2 dependencies optional (only needed by wmgui)
 
diff --git a/package/dmraid/0001-fix-compilation-under-musl.patch b/package/dmraid/0001-fix-compilation-under-musl.patch
index 7cf8792862..a6f5c41075 100644
--- a/package/dmraid/0001-fix-compilation-under-musl.patch
+++ b/package/dmraid/0001-fix-compilation-under-musl.patch
@@ -1,7 +1,7 @@
 From 89c7fc15e064dd407e6d5ccefe78985b86b8a036 Mon Sep 17 00:00:00 2001
 From: Brendan Heading <brendanheading@gmail.com>
 Date: Tue, 1 Sep 2015 12:26:36 +0100
-Subject: [PATCH 1/1] fix compilation under musl
+Subject: [PATCH] fix compilation under musl
 
 Patch borrowed from Void Linux :
 
diff --git a/package/elftosb/0002-force-cxx-compiler.patch b/package/elftosb/0002-force-cxx-compiler.patch
index 14df0dbe46..efa92d1171 100644
--- a/package/elftosb/0002-force-cxx-compiler.patch
+++ b/package/elftosb/0002-force-cxx-compiler.patch
@@ -1,4 +1,4 @@
-Subject: [PATCH 1/1] elftosb: force host C++ compiler
+Subject: [PATCH] elftosb: force host C++ compiler
 
 Because Freescale provides *.cpp sources and elftosb links again libstdc++,
 force to use the host c++ compiler.
diff --git a/package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch b/package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch
index d37e64c6ea..2391fc8c2b 100644
--- a/package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch
+++ b/package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch
@@ -1,7 +1,7 @@
 From 451330d09a6a3500b40bc4f5896ba790ab46cd6c Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sun, 15 Jan 2017 19:37:31 +0100
-Subject: [PATCH 2/2] tr_languages: cast string_ordinal init values
+Subject: [PATCH] tr_languages: cast string_ordinal init values
 
 On some architecture, "char" is signed (x86_64, nios2...) so the
 compiler try to convert int 0xc2 and 0xba to a signed char.
diff --git a/package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch b/package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch
index 6f340c3509..c5547a5e10 100644
--- a/package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch
+++ b/package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch
@@ -1,7 +1,7 @@
 From 36eed08a3783df6bb8d92d3c80cd47d0660eeb12 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sat, 30 Jan 2016 16:27:37 +0100
-Subject: [PATCH 1/1] hpav_cfg.c: do not include linux/if_ether.h for musl
+Subject: [PATCH] hpav_cfg.c: do not include linux/if_ether.h for musl
  compatibility
 
 Fixes a build issue with the musl C library
diff --git a/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch b/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
index 58b260ce24..2591801976 100644
--- a/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
+++ b/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
@@ -1,7 +1,7 @@
 From 445be05fba32c512fd87a0c98b4e9936629ef95e Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sat, 20 Feb 2016 17:59:52 +0100
-Subject: [PATCH 1/1] src/Makefile.in: Really install unversioned solibrary
+Subject: [PATCH] src/Makefile.in: Really install unversioned solibrary
 
 This commit is a follow-up to
 https://github.com/telmich/gpm/commit/06b00d53d8bd513ad5d262dc94a016c6fbf2d3aa
diff --git a/package/gutenprint/0002-cups-support-replaces-static-with-static-libtool-lib.patch b/package/gutenprint/0002-cups-support-replaces-static-with-static-libtool-lib.patch
index d8cfb7d9d7..61ef0269a8 100644
--- a/package/gutenprint/0002-cups-support-replaces-static-with-static-libtool-lib.patch
+++ b/package/gutenprint/0002-cups-support-replaces-static-with-static-libtool-lib.patch
@@ -1,7 +1,7 @@
 From 08a5d355160eb2ac8346ae1b94591418343217f9 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@openwide.fr>
 Date: Sun, 17 Aug 2014 23:43:20 +0200
-Subject: [PATCH 1/1] cups support: replaces -static with -static-libtool-libs
+Subject: [PATCH] cups support: replaces -static with -static-libtool-libs
 
 gutenprint rely on the original behaviour of -static, but since commit
 in buildroot "support/libtool: make -static behave like -all-static" [1],
diff --git a/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch b/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
index b7c1839f75..5cd302c979 100644
--- a/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
+++ b/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
@@ -1,7 +1,7 @@
 From d667b13a87cf3207599a19eb981a893a1d7a67ee Mon Sep 17 00:00:00 2001
 From: Brendan Heading <brendanheading@gmail.com>
 Date: Mon, 14 Sep 2015 23:25:52 +0100
-Subject: [PATCH 1/1] ibrcommon/data/File.cpp: support POSIX basename call
+Subject: [PATCH] ibrcommon/data/File.cpp: support POSIX basename call
 
 Firstly, and somewhat strangely, musl chooses not to provide a basename(3)
 prototype within <string.h> whenever __cplusplus is defined. This can be
diff --git a/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch b/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
index 47f15c6cda..1a1a90ce99 100644
--- a/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
+++ b/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
@@ -1,7 +1,7 @@
 From 8d9a62a5fa89001266352a929c5d40b28c0dda85 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Fri, 12 Jan 2018 19:07:27 -0600
-Subject: [PATCH v2] kvm-unit-tests: test for rdseed/rdrand
+Subject: [PATCH] kvm-unit-tests: test for rdseed/rdrand
 
 The build fails when the host binutils isn't at least 2.23
 (2.22.x introduced RDSEED).
diff --git a/package/leveldb/0001-Fix-compilation-with-g-4.8.2.patch b/package/leveldb/0001-Fix-compilation-with-g-4.8.2.patch
index f39216067c..67a417c17f 100644
--- a/package/leveldb/0001-Fix-compilation-with-g-4.8.2.patch
+++ b/package/leveldb/0001-Fix-compilation-with-g-4.8.2.patch
@@ -1,7 +1,7 @@
 From 8a8016f6d2af335ab205aa40d5274fc9b0c7a566 Mon Sep 17 00:00:00 2001
 From: Steve James <ste@junkomatic.net>
 Date: Sun, 5 Apr 2015 16:29:51 +0200
-Subject: [PATCH 1/2] Fix compilation with g++ 4.8.2
+Subject: [PATCH] Fix compilation with g++ 4.8.2
 
 Where db_iter.cc fails to get a typedef for ssize_t when compiled by
 GCC.
diff --git a/package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch b/package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch
index c91ddbfab3..e0d0beccff 100644
--- a/package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch
+++ b/package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch
@@ -1,7 +1,7 @@
 From 7291289ba0c052e45e2a0330642318798d6a4caf Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Fri, 27 Jan 2017 16:02:27 +0100
-Subject: [PATCH 1/1] asplib_CPUTimer.h: Fix time.h include
+Subject: [PATCH] asplib_CPUTimer.h: Fix time.h include
 
 According to https://linux.die.net/man/3/clock_gettime time.h needs to
 be included instead of sys/time.h.
diff --git a/package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch b/package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch
index cfd7d54523..7f460c131e 100644
--- a/package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch
+++ b/package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch
@@ -1,7 +1,7 @@
 From 46660112b76664473cc98b8ae6c863fd27c27d2d Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Fri, 29 Aug 2014 23:40:59 +0200
-Subject: [PATCH 1/1] cmake: handle static library and find required thread
+Subject: [PATCH] cmake: handle static library and find required thread
  module
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
diff --git a/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch b/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
index 0c13e35c4c..23ed6dd227 100644
--- a/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
+++ b/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
@@ -1,7 +1,7 @@
 From cae4c3b80fee0f3637d70f6d33946888c8105637 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@openwide.fr>
 Date: Sat, 13 Dec 2014 17:16:58 +0100
-Subject: [PATCH 1/1] blas: don't overwrite ar options
+Subject: [PATCH] blas: don't overwrite ar options
 
 ar's rcv options get lost when AR is passed on
 the command line.
diff --git a/package/liblog4c-localtime/0001-log4c.m4-fix-underquoted-definition-of-AM_PATH_LOG4C.patch b/package/liblog4c-localtime/0001-log4c.m4-fix-underquoted-definition-of-AM_PATH_LOG4C.patch
index 1fe0798a3b..5e39b2d4dc 100644
--- a/package/liblog4c-localtime/0001-log4c.m4-fix-underquoted-definition-of-AM_PATH_LOG4C.patch
+++ b/package/liblog4c-localtime/0001-log4c.m4-fix-underquoted-definition-of-AM_PATH_LOG4C.patch
@@ -1,7 +1,7 @@
 From b7290560082e91673431de79e1fa318c9fd90261 Mon Sep 17 00:00:00 2001
 From: Danomi Manchego <danomimanchego123@gmail.com>
 Date: Sat, 25 Oct 2014 19:42:38 +0200
-Subject: [PATCH 1/5] log4c.m4: fix "underquoted definition of AM_PATH_LOG4C"
+Subject: [PATCH] log4c.m4: fix "underquoted definition of AM_PATH_LOG4C"
  warning
 
 When autoreconfiguring liblog4c-localtime, there is a warning from
diff --git a/package/liblog4c-localtime/0002-Fix-linking-error-without-pthread.patch b/package/liblog4c-localtime/0002-Fix-linking-error-without-pthread.patch
index 5b679e38ba..63d35a90ac 100644
--- a/package/liblog4c-localtime/0002-Fix-linking-error-without-pthread.patch
+++ b/package/liblog4c-localtime/0002-Fix-linking-error-without-pthread.patch
@@ -1,7 +1,7 @@
 From 435b28cd90973cc03a533e75e90a46cd9f197dff Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Sat, 25 Oct 2014 19:44:01 +0200
-Subject: [PATCH 2/5] Fix linking error without pthread
+Subject: [PATCH] Fix linking error without pthread
 
 The rollingfile functionality only gets built if pthread support is
 available, but a call to these functions from log4c_fini() was outside
diff --git a/package/liblog4c-localtime/0003-Fix-debug-mode-build-with-uClibc.patch b/package/liblog4c-localtime/0003-Fix-debug-mode-build-with-uClibc.patch
index 4b9a45db68..f4c1314982 100644
--- a/package/liblog4c-localtime/0003-Fix-debug-mode-build-with-uClibc.patch
+++ b/package/liblog4c-localtime/0003-Fix-debug-mode-build-with-uClibc.patch
@@ -1,7 +1,7 @@
 From acbaee34bcb1881db97969dd2c411446f32ca4cc Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 25 Oct 2014 19:45:33 +0200
-Subject: [PATCH 3/5] Fix debug mode build with uClibc
+Subject: [PATCH] Fix debug mode build with uClibc
 
 When --enable-debug is passed, liblog4c-localtime wants to use
 <mcheck.h>. It takes the precaution of testing if __GLIBC__ is
diff --git a/package/liblog4c-localtime/0004-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch b/package/liblog4c-localtime/0004-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch
index 479eb3987f..744187cefe 100644
--- a/package/liblog4c-localtime/0004-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch
+++ b/package/liblog4c-localtime/0004-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch
@@ -1,7 +1,7 @@
 From a2553c203d8b8257dea1d2e2139b220935587144 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 25 Oct 2014 20:03:25 +0200
-Subject: [PATCH 4/5] Add AC_CONFIG_MACRO_DIR to configure.in
+Subject: [PATCH] Add AC_CONFIG_MACRO_DIR to configure.in
 
 Without AC_CONFIG_MACRO_DIR, when autoreconfiguring the package, it
 cannot find AM_PATH_EXPAT which is defined in config/expat.m4.
diff --git a/package/liblog4c-localtime/0005-Fix-C-support.patch b/package/liblog4c-localtime/0005-Fix-C-support.patch
index 6ba25c36ff..5e16b4f904 100644
--- a/package/liblog4c-localtime/0005-Fix-C-support.patch
+++ b/package/liblog4c-localtime/0005-Fix-C-support.patch
@@ -1,7 +1,7 @@
 From bdccec4c374a93480a7fd303d15e20810a5d5b7e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 25 Oct 2014 21:22:40 +0200
-Subject: [PATCH 5/5] Fix C++ support
+Subject: [PATCH] Fix C++ support
 
 Autoreconf fails with the following message:
 
diff --git a/package/libnl/0001-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch b/package/libnl/0001-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch
index 845a593761..2419ae282c 100644
--- a/package/libnl/0001-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch
+++ b/package/libnl/0001-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch
@@ -1,7 +1,7 @@
 From db0d59cd06f3ffd350379847c0885e1bfb85af0f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 7 Mar 2015 11:34:42 +0100
-Subject: [PATCH 2/2] build: add Libs.private field in libnl pkg-config file
+Subject: [PATCH] build: add Libs.private field in libnl pkg-config file
 
 In order to support static linking, the libnl pkg-config file should
 indicate in its Libs.private field the libraries that libnl-3.0.a
diff --git a/package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch b/package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch
index 601b322e54..55e6a1494e 100644
--- a/package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch
+++ b/package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch
@@ -1,7 +1,7 @@
 From 623e2a995d156e115c91f56a3ec691bdc333df8b Mon Sep 17 00:00:00 2001
 From: Chris Dickens <christopher.a.dickens@gmail.com>
 Date: Sun, 13 Dec 2020 15:49:19 -0800
-Subject: [PATCH 1/1] linux_usbfs: Fix parsing of descriptors for
+Subject: [PATCH] linux_usbfs: Fix parsing of descriptors for
  multi-configuration devices
 
 Commit e2be556bd2 ("linux_usbfs: Parse config descriptors during device
diff --git a/package/lzop/0001-build-with-gcc6.patch b/package/lzop/0001-build-with-gcc6.patch
index 774ee54a65..03bd887d51 100644
--- a/package/lzop/0001-build-with-gcc6.patch
+++ b/package/lzop/0001-build-with-gcc6.patch
@@ -1,6 +1,6 @@
 From: Jaap Crezee <jaap@jcz.nl>
 Date: Sat, 25 june 2016 13:13:00 +0200
-Subject: [PATCH 1/1] fix compilation host-lzop with gcc-6
+Subject: [PATCH] fix compilation host-lzop with gcc-6
 
 This patch allows host-lzop to be compiled with host systems containing gcc-6
 
diff --git a/package/mongrel2/0001-Do-not-run-tests.patch b/package/mongrel2/0001-Do-not-run-tests.patch
index 557c27edd8..4a75a470b4 100644
--- a/package/mongrel2/0001-Do-not-run-tests.patch
+++ b/package/mongrel2/0001-Do-not-run-tests.patch
@@ -1,7 +1,7 @@
 From 3cbef2195533f357c8a80c2840108662461273b7 Mon Sep 17 00:00:00 2001
 From: Lionel Orry <lionel.orry@gmail.com>
 Date: Wed, 27 Mar 2013 14:48:19 +0100
-Subject: [PATCH 4/4] Do not run tests.
+Subject: [PATCH] Do not run tests.
 
 This patch is specific to cross-compiled environments and avoids running
 the tests on the host. It is not meant to be applied upstream.
diff --git a/package/musepack/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/musepack/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
index 4bfeca0a04..dade23f7aa 100644
--- a/package/musepack/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
+++ b/package/musepack/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
@@ -1,7 +1,7 @@
 From d2f01ba6fa2a065156fad686d1849309c661e527 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Sun, 31 Aug 2014 12:07:31 +0200
-Subject: [PATCH 2/2] cmake: use the standard CMake flag to drive the shared
+Subject: [PATCH] cmake: use the standard CMake flag to drive the shared
  object build
 
 If BUILD_SHARED_LIBS is set and SHARED undefined, then drive SHARED with
diff --git a/package/netsnmp/0003-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch b/package/netsnmp/0003-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch
index 0829042128..4293e15d25 100644
--- a/package/netsnmp/0003-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch
+++ b/package/netsnmp/0003-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch
@@ -1,7 +1,7 @@
 From 8e273c688aa235ed9c68570a700d31596bac14df Mon Sep 17 00:00:00 2001
 From: Giulio Benetti <giulio.benetti@micronovasrl.com>
 Date: Mon, 15 Oct 2018 19:07:05 +0200
-Subject: [PATCH 1/2] configure: fix AC_CHECK_FUNCS(EVP_sha224 EVP_sha384 ...)
+Subject: [PATCH] configure: fix AC_CHECK_FUNCS(EVP_sha224 EVP_sha384 ...)
  failure on static linking
 
 If building as static lib, AC_CHECK_FUNCS(EVP_sha224 EVP_sha384 ...)
diff --git a/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch b/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
index 2618cbee74..8fcce2a5c7 100644
--- a/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
+++ b/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
@@ -1,7 +1,7 @@
 From 1ab6e3fc3cf61fa5a7b7363e59095e868474524b Mon Sep 17 00:00:00 2001
 From: Giulio Benetti <giulio.benetti@micronovasrl.com>
 Date: Mon, 15 Oct 2018 19:34:26 +0200
-Subject: [PATCH 2/2] configure: fix AC_CHECK_FUNCS(TLS_method TLSv1_method
+Subject: [PATCH] configure: fix AC_CHECK_FUNCS(TLS_method TLSv1_method
  ...) failure on static linking
 
 If building as static lib, AC_CHECK_FUNCS(TLS_method TLSv1_method ...)
diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/0001-add-executable.patch
index 1f8714eaeb..8a59f5a4d8 100644
--- a/package/python-setuptools/0001-add-executable.patch
+++ b/package/python-setuptools/0001-add-executable.patch
@@ -1,7 +1,7 @@
 From 9b3d307f8f6a1af88f3f810f5a6cf0835830e1e8 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Mon, 7 Dec 2015 01:14:33 +0100
-Subject: [PATCH 1/1] add executable
+Subject: [PATCH] add executable
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch b/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
index 07fbb6ccc1..12dac30db8 100644
--- a/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
+++ b/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
@@ -1,7 +1,7 @@
 From dfe6f65b7078315c32cebb727e9c47ead7603475 Mon Sep 17 00:00:00 2001
 From: Asaf Kahlon <asafka7@gmail.com>
 Date: Sun, 13 Oct 2019 16:44:44 +0300
-Subject: [PATCH 1/1] Adjust ws4py for Python 3.7 syntax
+Subject: [PATCH] Adjust ws4py for Python 3.7 syntax
 
 Since Python 3.7, "async" has become a keyword and cannot be used.
 Thus, instead of asyncio.async we will use asyncio.ensure_future.
diff --git a/package/qt5/qt5webkit-examples/0001-Build-examples.patch b/package/qt5/qt5webkit-examples/0001-Build-examples.patch
index 6303006f62..cd925e21c5 100644
--- a/package/qt5/qt5webkit-examples/0001-Build-examples.patch
+++ b/package/qt5/qt5webkit-examples/0001-Build-examples.patch
@@ -1,7 +1,7 @@
 From 78f558df35860484711a600d155ae7a13ebf44b2 Mon Sep 17 00:00:00 2001
 From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
 Date: Tue, 28 Nov 2017 23:14:42 -0500
-Subject: [PATCH 1/1] Build examples
+Subject: [PATCH] Build examples
 MIME-Version: 1.0
 Content-Type: text/plain; charset=utf-8
 Content-Transfer-Encoding: 8bit
diff --git a/package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch b/package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch
index 073460018f..569fb55004 100644
--- a/package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch
+++ b/package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch
@@ -1,7 +1,7 @@
 From abf3a1b9c9cdacb574c2b9cdbf3f2a5e18c39ab9 Mon Sep 17 00:00:00 2001
 From: Rodrigo Rebello <rprebello@gmail.com>
 Date: Mon, 29 Feb 2016 22:53:49 -0300
-Subject: [PATCH 1/1] Add 'Libs.private' field to pkg-config file
+Subject: [PATCH] Add 'Libs.private' field to pkg-config file
 
 In order to support static linking, SDL_mixer.pc should include a
 'Libs.private' field listing all the libraries that SDL_mixer requires.
diff --git a/package/x11r7/xdriver_xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch b/package/x11r7/xdriver_xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch
index b7a66c5c27..ec9e49ebc7 100644
--- a/package/x11r7/xdriver_xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch
+++ b/package/x11r7/xdriver_xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch
@@ -1,7 +1,7 @@
 From f223035f4ffcff2a9296d1e907a5193f8e8845a3 Mon Sep 17 00:00:00 2001
 From: Adam Jackson <ajax@redhat.com>
 Date: Tue, 4 Feb 2020 16:38:06 -0500
-Subject: [PATCH xf86-video-ati] Fix link failure with gcc 10
+Subject: [PATCH] Fix link failure with gcc 10
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/package/x11r7/xdriver_xf86-video-imx/0001-Update-to-newer-swap-macros.patch b/package/x11r7/xdriver_xf86-video-imx/0001-Update-to-newer-swap-macros.patch
index 05be6b32ac..90af6bf529 100644
--- a/package/x11r7/xdriver_xf86-video-imx/0001-Update-to-newer-swap-macros.patch
+++ b/package/x11r7/xdriver_xf86-video-imx/0001-Update-to-newer-swap-macros.patch
@@ -1,7 +1,7 @@
 From fc7f191a1a0f290a4e808dd8f9bd58ba1dbd2be4 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Sat, 29 Dec 2012 18:00:36 -0200
-Subject: [PATCH 1/2] ext: Update to newer swap macros
+Subject: [PATCH] ext: Update to newer swap macros
 
 The swap macros now use an internal temporary variable so we need to
 adapt the code according.
diff --git a/package/zip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch b/package/zip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch
index 591b178aaa..c172bb1193 100644
--- a/package/zip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch
+++ b/package/zip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch
@@ -1,7 +1,7 @@
 From 0f5e1658c05746b17f05a1bade263cad19b37e79 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@openwide.fr>
 Date: Thu, 22 Jan 2015 15:20:25 +0100
-Subject: [PATCH 1/6] configure: Remove "Check C compiler type (optimization
+Subject: [PATCH] configure: Remove "Check C compiler type (optimization
  options)"
 
 This test force optimization to -O3
diff --git a/package/zip/0002-configure-Don-t-use-host-CPP.patch b/package/zip/0002-configure-Don-t-use-host-CPP.patch
index 8504912722..179d5817cb 100644
--- a/package/zip/0002-configure-Don-t-use-host-CPP.patch
+++ b/package/zip/0002-configure-Don-t-use-host-CPP.patch
@@ -1,7 +1,7 @@
 From fc5c889131ff6270e1028cc7edd87e7f10a7da6d Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@openwide.fr>
 Date: Thu, 22 Jan 2015 15:21:31 +0100
-Subject: [PATCH 2/6] configure: Don't use host CPP
+Subject: [PATCH] configure: Don't use host CPP
 
 CPP is redefined if a cpp binary (/lib/cpp) is found on the host.
 
diff --git a/package/zip/0003-Makefile-Use-CFLAGS-from-command-line.patch b/package/zip/0003-Makefile-Use-CFLAGS-from-command-line.patch
index 104b7e8d89..7c2b920d65 100644
--- a/package/zip/0003-Makefile-Use-CFLAGS-from-command-line.patch
+++ b/package/zip/0003-Makefile-Use-CFLAGS-from-command-line.patch
@@ -1,7 +1,7 @@
 From 93189390de7322da78bc5b807f4cadaff46393c9 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@openwide.fr>
 Date: Thu, 22 Jan 2015 22:45:30 +0100
-Subject: [PATCH 3/6] Makefile: Use CFLAGS from command line
+Subject: [PATCH] Makefile: Use CFLAGS from command line
 
 Replace CFLAGS_NOOPT by CFLAGS when calling unix/configure script
 to create 'flags' file which contains all variables used to build
diff --git a/package/zip/0004-configure-use-LDFLAGS-from-command-line.patch b/package/zip/0004-configure-use-LDFLAGS-from-command-line.patch
index 35d3860215..efb9fc78f5 100644
--- a/package/zip/0004-configure-use-LDFLAGS-from-command-line.patch
+++ b/package/zip/0004-configure-use-LDFLAGS-from-command-line.patch
@@ -1,7 +1,7 @@
 From 5c58b8737dc9ccf9407f6725f6f07b764d6abb22 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@openwide.fr>
 Date: Thu, 22 Jan 2015 23:47:55 +0100
-Subject: [PATCH 4/6] configure: use LDFLAGS from command line
+Subject: [PATCH] configure: use LDFLAGS from command line
 
 The bzip2 support may not enabled due to a build error
 during the checking for bzip2 library.
diff --git a/package/zip/0005-unix-configure-remove-GID-UID-size-check.patch b/package/zip/0005-unix-configure-remove-GID-UID-size-check.patch
index 38d8d730e1..fd6cdde1dc 100644
--- a/package/zip/0005-unix-configure-remove-GID-UID-size-check.patch
+++ b/package/zip/0005-unix-configure-remove-GID-UID-size-check.patch
@@ -1,7 +1,7 @@
 From d8da4e5f0ebed000f880e60b6cca7c575f7ed1c7 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@openwide.fr>
 Date: Fri, 23 Jan 2015 22:13:14 +0100
-Subject: [PATCH 5/6] unix/configure: remove GID/UID size check
+Subject: [PATCH] unix/configure: remove GID/UID size check
 
 This check can't work for cross-compilation since it
 try to run a target's binary on the host system.
diff --git a/package/zip/0006-unix-configure-borrow-the-LFS-test-from-autotools.patch b/package/zip/0006-unix-configure-borrow-the-LFS-test-from-autotools.patch
index a4e99dbc8c..0276ad2f7b 100644
--- a/package/zip/0006-unix-configure-borrow-the-LFS-test-from-autotools.patch
+++ b/package/zip/0006-unix-configure-borrow-the-LFS-test-from-autotools.patch
@@ -1,7 +1,7 @@
 From fc392c939b9a18959482f588aff0afc29dd6d30a Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@openwide.fr>
 Date: Fri, 23 Jan 2015 22:20:18 +0100
-Subject: [PATCH 6/6] unix/configure: borrow the LFS test from autotools.
+Subject: [PATCH] unix/configure: borrow the LFS test from autotools.
 
 Infozip's LFS check can't work for cross-compilation
 since it try to run a target's binary on the host system.
-- 
2.25.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

