Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788CFC433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 23:56:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D296460F02
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 23:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D296460F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 633E440513;
	Thu,  9 Sep 2021 23:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hvKm3-97A_bg; Thu,  9 Sep 2021 23:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9718C40535;
	Thu,  9 Sep 2021 23:56:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B13E21BF27E
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 23:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A059340535
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 23:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLVnxp7NmsS1 for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 23:56:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC86240513
 for <buildroot@buildroot.org>; Thu,  9 Sep 2021 23:56:37 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id v16so161422ilo.10
 for <buildroot@buildroot.org>; Thu, 09 Sep 2021 16:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IxMPVzLiUAi5esnihve0fjQdx0S086rLleCkAKYtxic=;
 b=kF14FUoupu4T4PjxFs7zb6QAuS3QeAbiTHYrqUkvJch4O16j4xkhwYKLcFGRXKPbSs
 iDeTGe9A7tVxmlCX2baxvFht27ApTfn8k1RuX4vJD7wECbTJK3R41MCVILe7mf5lFu86
 FlPEnarcrTtw6auXL9ti6izZzSxigKj4vdO6eYJssAfPSzMoUAfp+RwpVVd6blg9b0dd
 W+fLSTr4UP1xEOOo2khN84pE+Sn5fYJKy+G1Gynz4hEDACudeAaMy47cVsHuZj7iWTUE
 BZ+syHORp22fet3q7mUqaDFkwSBjvbq7Hv0eTk/p/ioD3bllN8AsKgCXgvEs/kEmhe64
 VI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IxMPVzLiUAi5esnihve0fjQdx0S086rLleCkAKYtxic=;
 b=eBK7J7Hn/jHSdXrC/LtP2yIl+WB1ed1IK1k97L6pkQKcdhlB+YsigIhbOiqX/cyBJR
 A5zi1e4K380lc7PJvdgg94y7OLtgR1sRoz5OLRLnhx3MKKMHC59sUDRgMBXTI9lCU/Ls
 R4HUKIsh6txf7dqueg6W11eEznSHHWwLsi+ub0/WOeKY2N+qTSA8IyfCGCRgZxZlpJt1
 MCaBxC6mEDUOdHNUjY+nEx2GR6jtb4q2gGce1VEJuYwlWVOtGwLIp6elh8xc87+NiCy6
 QxVolcDEE59ooDJvW0sZap+UpkIUTk4chuQfZRzbnmvw+jv0ADVtcPBm5bwI5KZTDChn
 ifPw==
X-Gm-Message-State: AOAM531F46cQlJ0WkH7dp/kT2SEWH7mcYhkN7HdxTWaVj9xTfjggLOoa
 Z7w2h2KmD+W9iifsrC17TQVNth3feec=
X-Google-Smtp-Source: ABdhPJxfHm1w1OOJ4wzLSTShZq3M976aberkO6+GiQaZsG5eldr93YavTqs1bs3K/AdkqoeWPpXAkA==
X-Received: by 2002:a92:d848:: with SMTP id h8mr4111288ilq.230.1631231796829; 
 Thu, 09 Sep 2021 16:56:36 -0700 (PDT)
Received: from james-x399.localdomain (97-118-233-80.hlrn.qwest.net.
 [97.118.233.80])
 by smtp.gmail.com with ESMTPSA id y27sm1614930iot.10.2021.09.09.16.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 16:56:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Sep 2021 17:56:35 -0600
Message-Id: <20210909235635.2987074-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcamera: bump to version
 e355ca0087cd93ef80f74c61018e9e9228a93313
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Drop patch that is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ra-add-dependencies-to-libcamera_dep.patch | 37 -------------------
 package/libcamera/libcamera.hash              |  2 +-
 package/libcamera/libcamera.mk                |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch

diff --git a/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch b/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch
deleted file mode 100644
index aa8d659cf3..0000000000
--- a/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1a2fd4526e0858827f47a7e9359df34f0d0e3108 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 27 May 2021 21:00:21 +0200
-Subject: [PATCH] libcamera: add dependencies to libcamera_dep
-
-Add dependencies to libcamera_dep to avoid the following build failure
-with qcam on sparc v8 which is raised since commit
-a8310248fc26cc1e1b791af5e9394c1d20bee269:
-
-FAILED: src/qcam/qcam
-/srv/storage/autobuild/run/instance-0/output-1/host/bin/sparc-linux-g++  -o src/qcam/qcam src/qcam/qcam.p/meson-generated_.._qt5-feathericons_qrc.cpp.o src/qcam/qcam.p/meson-generated_moc_main_window.cpp.o src/qcam/qcam.p/meson-generated_moc_viewfinder_qt.cpp.o src/qcam/qcam.p/.._cam_options.cpp.o src/qcam/qcam.p/.._cam_stream_options.cpp.o src/qcam/qcam.p/format_converter.cpp.o src/qcam/qcam.p/main.cpp.o src/qcam/qcam.p/main_window.cpp.o src/qcam/qcam.p/message_handler.cpp.o src/qcam/qcam.p/viewfinder_qt.cpp.o src/qcam/qcam.p/dng_writer.cpp.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wshadow -include config.h '-Wl,-rpath,$ORIGIN/../libcamera' -Wl,-rpath-link,/srv/storage/autobuild/run/instance-0/output-1/build/libcamera-3a1f67a8031ac5ad96a11d5dc8b2e8976290497b/build/src/libcamera -Wl,--start-group src/libcamera/libcamera.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Core.so /srv/storage/autobuild/run/instance-0/output-1/
 host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Gui.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Widgets.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libtiff.so -Wl,--end-group
-/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/qcam/qcam.p/main_window.cpp.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
-/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line
-
-Fixes:
- - http://autobuild.buildroot.org/results/d0726b2253f1f3d006e057f3b32c646c4b9b5f7a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://bugs.libcamera.org/show_bug.cgi?id=39]
----
- src/libcamera/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libcamera/meson.build b/src/libcamera/meson.build
-index cc2b8669..af3533ad 100644
---- a/src/libcamera/meson.build
-+++ b/src/libcamera/meson.build
-@@ -160,6 +160,7 @@ libcamera_dep = declare_dependency(sources : [
-                                        libcamera_public_headers,
-                                    ],
-                                    include_directories : libcamera_includes,
-+                                   dependencies : libcamera_deps,
-                                    link_with : libcamera)
- 
- subdir('proxy/worker')
--- 
-2.30.2
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 78197b9aeb..52c584bc16 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  fa9efe38397392a338c0ed9d0bf3ac1480d4d1c96b0597e422f8b9fb36f43398  libcamera-3a1f67a8031ac5ad96a11d5dc8b2e8976290497b-br1.tar.gz
+sha256  a5ed581416719b914140eda76ca8a4e0e9c944b859f8fb018fc17497278c5ae1  libcamera-e355ca0087cd93ef80f74c61018e9e9228a93313-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 11a6961da5..677da8ac4c 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = 3a1f67a8031ac5ad96a11d5dc8b2e8976290497b
+LIBCAMERA_VERSION = e355ca0087cd93ef80f74c61018e9e9228a93313
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
