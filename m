Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E766C3DA7D
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 09:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8DB6408B3;
	Sat, 31 Dec 2022 09:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8DB6408B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FFgie4LoO7_a; Sat, 31 Dec 2022 09:34:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14454408E4;
	Sat, 31 Dec 2022 09:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14454408E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9752E1BF83E
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 09:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70AB0408E4
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 09:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70AB0408E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16IrnhWUZjAr for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 09:34:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 967BD408B3
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 967BD408B3
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 09:34:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bs20so19923195wrb.3
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 01:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pTob+4AkJm/jBs+1ZxiLIEbDcuuWh+ONsks7snjtDXs=;
 b=HpE/FZkKTf0pnCs/VU6mjtIlep1mXDz76+xKk9ticfTSvIxVN4jECtb/q/hMADdEQT
 15ezEDCfdgb0hRSEDEK4NdewilUd1npQr0/kRqcBQSdnsNW8qz6sADeqv9EWdo3ijJKd
 GzQLc3brsenLQxnLi5DqEsl/JWNfD7MBrn/viaM+2cDKf7y4dyssbON23QfjM8RGm68M
 krYyeWiZJLzWvrdUyvgMCsHTn7jtD6lxYaztVggehtku0pwZx1SWfJVU+b6wzkFJXuKX
 39nWdVUIpGMVJw4YQOWfKKEsRqbVdCyb3NKsVh1FCzNPf6PYVbT1yu3HwxGwI0FKziej
 c4kw==
X-Gm-Message-State: AFqh2kqQs5EZhkZ6Apdjb+41uYJvWV2+Ag7/nj8+pwCRVABaFuH0lS4F
 R1SEqoWITPA5cov4pFeN2cH+6SUV6Lg=
X-Google-Smtp-Source: AMrXdXtGd7Zu0Y2MQOAi7wIhej5PR9w3X/De9t/2+M4MgEw+4Onzt872WsbhDAvoD/qS6xWOkgNWDg==
X-Received: by 2002:a5d:514f:0:b0:293:3671:a70f with SMTP id
 u15-20020a5d514f000000b002933671a70fmr971746wrt.69.1672479270285; 
 Sat, 31 Dec 2022 01:34:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f2-20020adfdb42000000b00241d544c9b1sm7396180wrj.90.2022.12.31.01.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 01:34:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 10:34:25 +0100
Message-Id: <20221231093425.237228-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pTob+4AkJm/jBs+1ZxiLIEbDcuuWh+ONsks7snjtDXs=;
 b=iaL0oWK2hxQflaiOc2sIcLJ10pctEWngQ+MeCSYFOc9CP4/0VgHdFaicQNCN11J8Bn
 avW6ykT4H55FCZTTa8cNnkmXlmVvNppLg1OiHrdDxnLyejS6GVY/GKWNBKtU+mJ3WEGG
 mHsC0X2v4WE0ejE2DDXp+YgUFOcvkSRRCSNwxRLnZEYGrG1Y/6kc1fSPAuk+OwI5lbUm
 5FJIA44w1iAdKx9hNJYEVqztGcqK7KUBvstaq/RW30KXK9mLVrbBDk6ET3VgeaptY+DN
 OL6Y9lfPazTU7QGJymgIR9pxpnbSyoa1gbR7zVKoU3qlOu5X1HGV4mQDUbiAEu2Tf2Ox
 gY9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iaL0oWK2
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: fix static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure raised since bump to version
1.20.2 in commit b95334b71fbdde0f7621b58ed35fa98df9e0966d:

FAILED: src/ModemManager
/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/bin/m68k-linux-gcc  -o src/ModemManager src/ModemManager.p/meson-generated_.._mm-daemon-enums-types.c.o src/ModemManager.p/main.c.o src/ModemManager.p/mm-auth-provider.c.o src/ModemManager.p/mm-base-bearer.c.o src/ModemManager.p/mm-base-call.c.o src/ModemManager.p/mm-base-manager.c.o src/ModemManager.p/mm-base-modem-at.c.o src/ModemManager.p/mm-base-modem.c.o src/ModemManager.p/mm-base-sim.c.o src/ModemManager.p/mm-base-sms.c.o src/ModemManager.p/mm-bearer-list.c.o src/ModemManager.p/mm-broadband-bearer.c.o src/ModemManager.p/mm-broadband-modem.c.o src/ModemManager.p/mm-call-list.c.o src/ModemManager.p/mm-context.c.o src/ModemManager.p/mm-device.c.o src/ModemManager.p/mm-dispatcher.c.o src/ModemManager.p/mm-dispatcher-connection.c.o src/ModemManager.p/mm-dispatcher-fcc-unlock.c.o src/ModemManager.p/mm-filter.c.o src/ModemManager.p/mm-iface-modem-3gpp.c.o src/ModemManager.p/mm-iface-modem-3gpp-profile-manage
 r.c.o src/ModemManager.p/mm-iface-modem-3gpp-ussd.c.o src/ModemManager.p/mm-iface-modem.c.o src/ModemManager.p/mm-iface-modem-cdma.c.o src/ModemManager.p/mm-iface-modem-firmware.c.o src/ModemManager.p/mm-iface-modem-location.c.o src/ModemManager.p/mm-iface-modem-messaging.c.o src/ModemManager.p/mm-iface-modem-oma.c.o src/ModemManager.p/mm-iface-modem-sar.c.o src/ModemManager.p/mm-iface-modem-signal.c.o src/ModemManager.p/mm-iface-modem-simple.c.o src/ModemManager.p/mm-iface-modem-time.c.o src/ModemManager.p/mm-iface-modem-voice.c.o src/ModemManager.p/mm-plugin.c.o src/ModemManager.p/mm-plugin-manager.c.o src/ModemManager.p/mm-port-probe.c.o src/ModemManager.p/mm-port-probe-at.c.o src/ModemManager.p/mm-private-boxed-types.c.o src/ModemManager.p/mm-sms-list.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static '-Wl,-rpath,$ORIGIN/../libmm-glib' -Wl,-rpath-link,/home/autobuild/autobuild/instance-11/output-1/build/modem-manager-1.20.2/build/libmm-glib -Wl,--start-group src/libport.a sr
 c/libkerneldevice.a src/libhelpers.a libmm-glib/libmm-glib.so.0.9.0 libqcdm/src/libqcdm.a libmm-glib/generated/tests/libmm-test-generated.a -Wl,--export-dynamic /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgmodule-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libglib-2.0.a -pthread -lm /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpcre.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgio-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgobject-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libffi.a /home/autob
 uild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libz.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libmount.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libblkid.a -Wl,--end-group
/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/11.2.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `libmm-glib/libmm-glib.so.0.9.0'

Fixes:
 - http://autobuild.buildroot.org/results/9803d593305df36c4a8d67aac2fb4c9a3120a072

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...n-hardcode-building-a-shared-library.patch | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch

diff --git a/package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch b/package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch
new file mode 100644
index 0000000000..435499a8f9
--- /dev/null
+++ b/package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch
@@ -0,0 +1,54 @@
+From b075b757dca1681835dc1492e60de7688db78218 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 31 Dec 2022 10:18:32 +0100
+Subject: [PATCH] meson: Un-hardcode building a shared library
+
+Use library() instead of shared_library() to allow specifying which kind
+of library to build with "meson setup --default-library ..."
+
+This will avoid the following static build failure:
+
+FAILED: src/ModemManager
+/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/bin/m68k-linux-gcc  -o src/ModemManager src/ModemManager.p/meson-generated_.._mm-daemon-enums-types.c.o src/ModemManager.p/main.c.o src/ModemManager.p/mm-auth-provider.c.o src/ModemManager.p/mm-base-bearer.c.o src/ModemManager.p/mm-base-call.c.o src/ModemManager.p/mm-base-manager.c.o src/ModemManager.p/mm-base-modem-at.c.o src/ModemManager.p/mm-base-modem.c.o src/ModemManager.p/mm-base-sim.c.o src/ModemManager.p/mm-base-sms.c.o src/ModemManager.p/mm-bearer-list.c.o src/ModemManager.p/mm-broadband-bearer.c.o src/ModemManager.p/mm-broadband-modem.c.o src/ModemManager.p/mm-call-list.c.o src/ModemManager.p/mm-context.c.o src/ModemManager.p/mm-device.c.o src/ModemManager.p/mm-dispatcher.c.o src/ModemManager.p/mm-dispatcher-connection.c.o src/ModemManager.p/mm-dispatcher-fcc-unlock.c.o src/ModemManager.p/mm-filter.c.o src/ModemManager.p/mm-iface-modem-3gpp.c.o src/ModemManager.p/mm-iface-modem-3gpp-profile-manag
 er.c.o src/ModemManager.p/mm-iface-modem-3gpp-ussd.c.o src/ModemManager.p/mm-iface-modem.c.o src/ModemManager.p/mm-iface-modem-cdma.c.o src/ModemManager.p/mm-iface-modem-firmware.c.o src/ModemManager.p/mm-iface-modem-location.c.o src/ModemManager.p/mm-iface-modem-messaging.c.o src/ModemManager.p/mm-iface-modem-oma.c.o src/ModemManager.p/mm-iface-modem-sar.c.o src/ModemManager.p/mm-iface-modem-signal.c.o src/ModemManager.p/mm-iface-modem-simple.c.o src/ModemManager.p/mm-iface-modem-time.c.o src/ModemManager.p/mm-iface-modem-voice.c.o src/ModemManager.p/mm-plugin.c.o src/ModemManager.p/mm-plugin-manager.c.o src/ModemManager.p/mm-port-probe.c.o src/ModemManager.p/mm-port-probe-at.c.o src/ModemManager.p/mm-private-boxed-types.c.o src/ModemManager.p/mm-sms-list.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static '-Wl,-rpath,$ORIGIN/../libmm-glib' -Wl,-rpath-link,/home/autobuild/autobuild/instance-11/output-1/build/modem-manager-1.20.2/build/libmm-glib -Wl,--start-group src/libport.a s
 rc/libkerneldevice.a src/libhelpers.a libmm-glib/libmm-glib.so.0.9.0 libqcdm/src/libqcdm.a libmm-glib/generated/tests/libmm-test-generated.a -Wl,--export-dynamic /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgmodule-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libglib-2.0.a -pthread -lm /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpcre.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgio-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgobject-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libffi.a /home/auto
 build/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libz.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libmount.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libblkid.a -Wl,--end-group
+/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/11.2.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `libmm-glib/libmm-glib.so.0.9.0'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9803d593305df36c4a8d67aac2fb4c9a3120a072
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/merge_requests/944]
+---
+ libmm-glib/meson.build | 2 +-
+ plugins/meson.build    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libmm-glib/meson.build b/libmm-glib/meson.build
+index 42f8ac61..de668dab 100644
+--- a/libmm-glib/meson.build
++++ b/libmm-glib/meson.build
+@@ -129,7 +129,7 @@ deps = [include_dep]
+ 
+ libname = 'mm-glib'
+ 
+-libmm_glib = shared_library(
++libmm_glib = library(
+   libname,
+   version: mm_glib_version,
+   sources: sources,
+diff --git a/plugins/meson.build b/plugins/meson.build
+index f849bb53..9e081beb 100644
+--- a/plugins/meson.build
++++ b/plugins/meson.build
+@@ -18,7 +18,7 @@ if enable_tests
+     libmm_test_generated_dep
+   ]
+ 
+-  libmm_test_common = shared_library(
++  libmm_test_common = library(
+     'mm-test-common',
+     sources: sources,
+     include_directories: top_inc,
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
