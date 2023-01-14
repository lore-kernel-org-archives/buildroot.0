Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F99C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 08:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 964FC60806;
	Sat, 14 Jan 2023 08:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 964FC60806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doH4WoNYAOHi; Sat, 14 Jan 2023 08:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D59260A70;
	Sat, 14 Jan 2023 08:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D59260A70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 645551BF48C
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 08:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F21560806
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 08:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F21560806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jf7gL8oQMZ0c for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 08:05:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE1F607C7
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AE1F607C7
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 08:05:03 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id m21so34147439edc.3
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 00:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1pBdurv7bRY9QMkRrfcQaOvrlSWRx5IJ/n6mAP1efhg=;
 b=AwvGLUzaF1s8+252906rE6ewsnRN+hMCY/9gUskxcLU3dnoA8E5T3Aw0Fwj4nCVGpM
 BePTIFEcpZjFFZo47hSeugK2Xf1E8bz0cjGN7SjEsWTkGcbA3ApZfeltkgTzuTiQpSCT
 KAAjvPh0t5IctUCOhpiFZbeZOlliJPGXe/ZqGdEp+dJIR6ECg2ULLCLFluZ1Zqi/yD1E
 K3aW0pYkryUI8sNft1oTcbl39zl0uVJkZp1sippJW7g9S7yPHhHmLapBnmpxfyk1Cl+a
 6bI9/Zttl4deeo5hXD5L6B29gJKbZviN26TbeamUUhG0MjamnhT50xH8p3tS8v2fBRLv
 ykMw==
X-Gm-Message-State: AFqh2krwg0m/mgVICd8eaWTW045TSjdQQDUNl+5J5w04cXUhrDATY+FG
 /MDzjptPqhWzxbBqLBZgiegAQsFrjfc=
X-Google-Smtp-Source: AMrXdXv2SCAN3SYye3tU5upTUajhwfAnJLPoAZLUMu8C0FUrPUqC5n43XpE4n4shDs3I2/uAMib0YA==
X-Received: by 2002:a05:6402:3983:b0:475:c640:ddd2 with SMTP id
 fk3-20020a056402398300b00475c640ddd2mr77919257edb.26.1673683501350; 
 Sat, 14 Jan 2023 00:05:01 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 n3-20020a05640204c300b0046ab2bd784csm8922191edw.64.2023.01.14.00.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 00:05:00 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 09:04:04 +0100
Message-Id: <20230114080403.26526-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1pBdurv7bRY9QMkRrfcQaOvrlSWRx5IJ/n6mAP1efhg=;
 b=GR8CAPUgIaA+emd++FvcT0vBRIzVUeqrBwI3jCTaWCCubRQOFP/eO2w6w6793V0fs8
 QjRQL5voVCQvc93ZvnsDvn448s+VHSQZw2UM76K+KgKFSrKz3w3FEZ1guC8oqGqXREnf
 /nnV3sebqH7KVhouF4TcT8HlkxhvkwlsNAQ1inuqr/hL+Hj35/d8UtHZeCkhmznsRf0W
 vxqgdMLgwO/Stnfds8Eh5ca6vHAbOJ9e7uFucorfnGxpmTKxHge8N40faljjGe/pyt1n
 omRmAISjk8yS+K8n5VlqEpUkGilJwyeSnHLEqogePZr+7UZGvvlJ+bgaeiEHC0Ieotbm
 4lZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GR8CAPUg
Subject: [Buildroot] [PATCH] package/modem-manager: bump version to 1.20.4
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch that is now upstream.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...n-hardcode-building-a-shared-library.patch | 54 -------------------
 package/modem-manager/modem-manager.hash      |  2 +-
 package/modem-manager/modem-manager.mk        |  2 +-
 3 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch

diff --git a/package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch b/package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch
deleted file mode 100644
index e99396d0d1..0000000000
--- a/package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From a9651f2390d3691dc74bcdb24b69a043fb0aacae Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 31 Dec 2022 10:18:32 +0100
-Subject: [PATCH] meson: Un-hardcode building a shared library
-
-Use library() instead of shared_library() to allow specifying which kind
-of library to build with "meson setup --default-library ..."
-
-This will avoid the following static build failure:
-
-FAILED: src/ModemManager
-/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/bin/m68k-linux-gcc  -o src/ModemManager src/ModemManager.p/meson-generated_.._mm-daemon-enums-types.c.o src/ModemManager.p/main.c.o src/ModemManager.p/mm-auth-provider.c.o src/ModemManager.p/mm-base-bearer.c.o src/ModemManager.p/mm-base-call.c.o src/ModemManager.p/mm-base-manager.c.o src/ModemManager.p/mm-base-modem-at.c.o src/ModemManager.p/mm-base-modem.c.o src/ModemManager.p/mm-base-sim.c.o src/ModemManager.p/mm-base-sms.c.o src/ModemManager.p/mm-bearer-list.c.o src/ModemManager.p/mm-broadband-bearer.c.o src/ModemManager.p/mm-broadband-modem.c.o src/ModemManager.p/mm-call-list.c.o src/ModemManager.p/mm-context.c.o src/ModemManager.p/mm-device.c.o src/ModemManager.p/mm-dispatcher.c.o src/ModemManager.p/mm-dispatcher-connection.c.o src/ModemManager.p/mm-dispatcher-fcc-unlock.c.o src/ModemManager.p/mm-filter.c.o src/ModemManager.p/mm-iface-modem-3gpp.c.o src/ModemManager.p/mm-iface-modem-3gpp-profile-manag
 er.c.o src/ModemManager.p/mm-iface-modem-3gpp-ussd.c.o src/ModemManager.p/mm-iface-modem.c.o src/ModemManager.p/mm-iface-modem-cdma.c.o src/ModemManager.p/mm-iface-modem-firmware.c.o src/ModemManager.p/mm-iface-modem-location.c.o src/ModemManager.p/mm-iface-modem-messaging.c.o src/ModemManager.p/mm-iface-modem-oma.c.o src/ModemManager.p/mm-iface-modem-sar.c.o src/ModemManager.p/mm-iface-modem-signal.c.o src/ModemManager.p/mm-iface-modem-simple.c.o src/ModemManager.p/mm-iface-modem-time.c.o src/ModemManager.p/mm-iface-modem-voice.c.o src/ModemManager.p/mm-plugin.c.o src/ModemManager.p/mm-plugin-manager.c.o src/ModemManager.p/mm-port-probe.c.o src/ModemManager.p/mm-port-probe-at.c.o src/ModemManager.p/mm-private-boxed-types.c.o src/ModemManager.p/mm-sms-list.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static '-Wl,-rpath,$ORIGIN/../libmm-glib' -Wl,-rpath-link,/home/autobuild/autobuild/instance-11/output-1/build/modem-manager-1.20.2/build/libmm-glib -Wl,--start-group src/libport.a s
 rc/libkerneldevice.a src/libhelpers.a libmm-glib/libmm-glib.so.0.9.0 libqcdm/src/libqcdm.a libmm-glib/generated/tests/libmm-test-generated.a -Wl,--export-dynamic /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgmodule-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libglib-2.0.a -pthread -lm /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpcre.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgio-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgobject-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libffi.a /home/auto
 build/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libz.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libmount.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libblkid.a -Wl,--end-group
-/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/11.2.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `libmm-glib/libmm-glib.so.0.9.0'
-
-Fixes:
- - http://autobuild.buildroot.org/results/9803d593305df36c4a8d67aac2fb4c9a3120a072
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998@free.fr: actual backport of upstreeam commit]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- libmm-glib/meson.build | 2 +-
- plugins/meson.build    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libmm-glib/meson.build b/libmm-glib/meson.build
-index 42f8ac61..de668dab 100644
---- a/libmm-glib/meson.build
-+++ b/libmm-glib/meson.build
-@@ -129,7 +129,7 @@ deps = [include_dep]
- 
- libname = 'mm-glib'
- 
--libmm_glib = shared_library(
-+libmm_glib = library(
-   libname,
-   version: mm_glib_version,
-   sources: sources,
-diff --git a/plugins/meson.build b/plugins/meson.build
-index f849bb53..9e081beb 100644
---- a/plugins/meson.build
-+++ b/plugins/meson.build
-@@ -18,7 +18,7 @@ if enable_tests
-     libmm_test_generated_dep
-   ]
- 
--  libmm_test_common = shared_library(
-+  libmm_test_common = library(
-     'mm-test-common',
-     sources: sources,
-     include_directories: top_inc,
--- 
-2.25.1
-
diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index e6967f8d62..4b8b795af7 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 #Locally calculated after checking https://www.freedesktop.org/software/ModemManager/ModemManager-1.18.12.tar.xz.asc
-sha256  ba56aa764edc148f58348a589743cf1c1e27c55dcd7ebd820dcedd52fb8d7179  ModemManager-1.20.2.tar.gz
+sha256  9c16b47547faac9515f2d03d1e8175de9c5e6769b1ee16b608ba6cfe6f04b03e  ModemManager-1.20.4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index f1fc17523a..979a80a8e9 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.20.2
+MODEM_MANAGER_VERSION = 1.20.4
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.gz
 MODEM_MANAGER_SITE = https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/archive/$(MODEM_MANAGER_VERSION)
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
