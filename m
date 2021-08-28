Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6939DC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 10:21:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C25960ED3
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 10:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C25960ED3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2CAA606A2;
	Sat, 28 Aug 2021 10:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qaXcum6boqoU; Sat, 28 Aug 2021 10:21:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6025960720;
	Sat, 28 Aug 2021 10:21:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF9821BF4E7
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 10:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA8B240222
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 10:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HR-bPJdQg2NB for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 10:21:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABDC3401CF
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 10:21:41 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so5960003wms.2
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DrVCTeKQlgy2rMCU2MddEqG0YOh1w3wW0/Gmy/6MohQ=;
 b=hPJDFgR8EyvuprpsGpak7RPdEVfAEg+V8C5T+FjPlDQej4Q1fS4Jtta82BMzfeYCZe
 Jj4UaV/uAnp220jYb4A7Flv1cTo5kFnsxvN4IJGwm7bF7Oe//4eYhToXQi5EVmirPiWM
 7VDLdct5XTf93Hl5MWTj5qKhX8tOsrQ35X3PlaLdnMORcjtyunEEFqLT3nScU1lf12Zu
 BjpBfF9F7FXLWDDmBcZxrL51s5eh2VXDghCaKjRr4ngk6sXvBG5ymUL6om8F38BV34Ww
 7NBqUHMTeofrlQdvLxx7HhQPlm8xAG3oU+DTtNTwXL9uGsqNpItnRylsIDXsyDndofNq
 OSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DrVCTeKQlgy2rMCU2MddEqG0YOh1w3wW0/Gmy/6MohQ=;
 b=SsXtp/EELVvQlz9RjUkdllp4sCLg03QcC2lx0GYdDaKm27QXRWUgRB33VOW1zj3lew
 u7fHILD5j8gIg0Hyu22KrGn4RfPf+5KEczTDHKTpbAkvsYa91mqidwq2dJAEVaLWAPvF
 LkQLkuhRDEk4zMpqnvLjoxMB8bWOx2Z61B857/tHs2YhSMMyDbOkO8ktBbCdxUve9QDA
 p4iGiG8A5GlCC/ZqBmqS6VVn9cObMijUMR6LmS1i3iHB5tGD/BxnO9q5mcLvBkjwD8bi
 zZSbvK208IOai4gYONYQpxP67Ik4HprrsfwHAHLfD/0/+eFrZoBcDbKHLbiunk9na4i7
 KHyw==
X-Gm-Message-State: AOAM532xBkjuKp6El3AWJnxO+0nVxTrWQ5ADNNJU/3M6ru5KNgmn4ADT
 wgBu7UNmTMNPjKmewe+1b/fNjoqWhJChHQ==
X-Google-Smtp-Source: ABdhPJwCcrahTdsq9qZw7ha7uJFKkuPA4gC3R4oTo0xAowmCsn66cNy0rj82S7u5cQVNf555oHaZFQ==
X-Received: by 2002:a1c:2904:: with SMTP id p4mr12810865wmp.178.1630146099321; 
 Sat, 28 Aug 2021 03:21:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id d24sm7580901wmb.35.2021.08.28.03.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 03:21:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 12:21:29 +0200
Message-Id: <20210828102129.779491-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qemu: security bump to version 6.1.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

- Fixes CVE-2021-3527, CVE-2021-3544, CVE-2021-3545, CVE-2021-3546,
  CVE-2021-3582, CVE-2021-3607 and CVE-2021-3608
- Drop second, fourth and fifth patches (already in version)

https://wiki.qemu.org/ChangeLog/6.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-Fix-build-with-64-bits-time_t.patch  | 98 -------------------
 ...atch => 0002-meson-add-tests-option.patch} |  0
 ....c-fix-fuse-lseek-on-uclibc-or-musl.patch} |  0
 .../0004-Makefile-ignore-long-options.patch   | 41 --------
 ...5-block-export-fuse.c-fix-musl-build.patch | 46 ---------
 package/qemu/qemu.hash                        |  2 +-
 package/qemu/qemu.mk                          |  2 +-
 7 files changed, 2 insertions(+), 187 deletions(-)
 delete mode 100644 package/qemu/0002-Fix-build-with-64-bits-time_t.patch
 rename package/qemu/{0003-meson-add-tests-option.patch => 0002-meson-add-tests-option.patch} (100%)
 rename package/qemu/{0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch => 0003-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch} (100%)
 delete mode 100644 package/qemu/0004-Makefile-ignore-long-options.patch
 delete mode 100644 package/qemu/0005-block-export-fuse.c-fix-musl-build.patch

diff --git a/package/qemu/0002-Fix-build-with-64-bits-time_t.patch b/package/qemu/0002-Fix-build-with-64-bits-time_t.patch
deleted file mode 100644
index 934c0e28fd..0000000000
--- a/package/qemu/0002-Fix-build-with-64-bits-time_t.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 839e51aa452345b440f8d2d0df84ab58bdedfcd1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 14 Nov 2020 21:54:17 +0100
-Subject: [PATCH] Fix build with 64 bits time_t
-
-time element is deprecated on new input_event structure in kernel's
-input.h [1]
-
-This will avoid the following build failure:
-
-hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_status':
-hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no member named 'time'
-  198 |     if (gettimeofday(&evdev.time, NULL)) {
-      |                            ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/a538167e288c14208d557cd45446df86d3d599d5
- - http://autobuild.buildroot.org/results/efd4474fb4b6c0ce0ab3838ce130429c51e43bbb
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- contrib/vhost-user-input/main.c | 10 +++++++++-
- hw/input/virtio-input-host.c    | 10 +++++++++-
- 2 files changed, 18 insertions(+), 2 deletions(-)
-
-diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
-index 6020c6f33a..e688c3e0a9 100644
---- a/contrib/vhost-user-input/main.c
-+++ b/contrib/vhost-user-input/main.c
-@@ -15,6 +15,11 @@
- #include "standard-headers/linux/virtio_input.h"
- #include "qapi/error.h"
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- enum {
-     VHOST_USER_INPUT_MAX_QUEUES = 2,
- };
-@@ -113,13 +118,16 @@ vi_evdev_watch(VuDev *dev, int condition, void *data)
- static void vi_handle_status(VuInput *vi, virtio_input_event *event)
- {
-     struct input_event evdev;
-+    struct timeval tval;
-     int rc;
- 
--    if (gettimeofday(&evdev.time, NULL)) {
-+    if (gettimeofday(&tval, NULL)) {
-         perror("vi_handle_status: gettimeofday");
-         return;
-     }
- 
-+    evdev.input_event_sec = tval.tv_sec;
-+    evdev.input_event_usec = tval.tv_usec;
-     evdev.type = le16toh(event->type);
-     evdev.code = le16toh(event->code);
-     evdev.value = le32toh(event->value);
-diff --git a/hw/input/virtio-input-host.c b/hw/input/virtio-input-host.c
-index 85daf73f1a..2e261737e1 100644
---- a/hw/input/virtio-input-host.c
-+++ b/hw/input/virtio-input-host.c
-@@ -16,6 +16,11 @@
- #include <sys/ioctl.h>
- #include "standard-headers/linux/input.h"
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- /* ----------------------------------------------------------------- */
- 
- static struct virtio_input_config virtio_input_host_config[] = {
-@@ -193,13 +198,16 @@ static void virtio_input_host_handle_status(VirtIOInput *vinput,
- {
-     VirtIOInputHost *vih = VIRTIO_INPUT_HOST(vinput);
-     struct input_event evdev;
-+    struct timeval tval;
-     int rc;
- 
--    if (gettimeofday(&evdev.time, NULL)) {
-+    if (gettimeofday(&tval, NULL)) {
-         perror("virtio_input_host_handle_status: gettimeofday");
-         return;
-     }
- 
-+    evdev.input_event_sec = tval.tv_sec;
-+    evdev.input_event_usec = tval.tv_usec;
-     evdev.type = le16_to_cpu(event->type);
-     evdev.code = le16_to_cpu(event->code);
-     evdev.value = le32_to_cpu(event->value);
--- 
-2.29.2
-
diff --git a/package/qemu/0003-meson-add-tests-option.patch b/package/qemu/0002-meson-add-tests-option.patch
similarity index 100%
rename from package/qemu/0003-meson-add-tests-option.patch
rename to package/qemu/0002-meson-add-tests-option.patch
diff --git a/package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch b/package/qemu/0003-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
similarity index 100%
rename from package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
rename to package/qemu/0003-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
diff --git a/package/qemu/0004-Makefile-ignore-long-options.patch b/package/qemu/0004-Makefile-ignore-long-options.patch
deleted file mode 100644
index 2d14b70c03..0000000000
--- a/package/qemu/0004-Makefile-ignore-long-options.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 14833e24dea49303ebc2464813601054b6cdfcac Mon Sep 17 00:00:00 2001
-From: Alexey Neyman <stilor@att.net>
-Date: Wed, 21 Jul 2021 19:08:46 -0700
-Subject: [PATCH] Makefile: ignore long options
-
-When searching for options like -n in MAKEFLAGS, current code may result
-in a false positive match when make is invoked with long options like
---no-print-directory. This has been observed with certain versions of
-host make (e.g. 3.82) while building the Qemu package in buildroot.
-
-Filter out such long options before searching for one-character options.
-
-Signed-off-by: Alexey Neyman <stilor@att.net>
-Message-Id: <20210722020846.3678817-1-stilor@att.net>
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
----
- Makefile | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 6c36330eef..401c623a65 100644
---- a/Makefile
-+++ b/Makefile
-@@ -129,9 +129,11 @@ endif
- # 4. Rules to bridge to other makefiles
- 
- ifneq ($(NINJA),)
--MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
--MAKE.k = $(findstring k,$(firstword $(MAKEFLAGS)))
--MAKE.q = $(findstring q,$(firstword $(MAKEFLAGS)))
-+# Filter out long options to avoid flags like --no-print-directory which
-+# may result in false positive match for MAKE.n
-+MAKE.n = $(findstring n,$(firstword $(filter-out --%,$(MAKEFLAGS))))
-+MAKE.k = $(findstring k,$(firstword $(filter-out --%,$(MAKEFLAGS))))
-+MAKE.q = $(findstring q,$(firstword $(filter-out --%,$(MAKEFLAGS))))
- MAKE.nq = $(if $(word 2, $(MAKE.n) $(MAKE.q)),nq)
- NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
-         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
--- 
-2.27.0
-
diff --git a/package/qemu/0005-block-export-fuse.c-fix-musl-build.patch b/package/qemu/0005-block-export-fuse.c-fix-musl-build.patch
deleted file mode 100644
index 0da6b3ff73..0000000000
--- a/package/qemu/0005-block-export-fuse.c-fix-musl-build.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4d5280c066eb46a31556044fb52c2618928b0019 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 9 Aug 2021 10:04:07 +0200
-Subject: [PATCH] block/export/fuse.c: fix musl build
-
-Fix the following build failure on musl raised since version 6.0.0 and
-https://gitlab.com/qemu-project/qemu/-/commit/4ca37a96a75aafe7a37ba51ab1912b09b7190a6b
-because musl does not define FALLOC_FL_ZERO_RANGE:
-
-../block/export/fuse.c: In function 'fuse_fallocate':
-../block/export/fuse.c:563:23: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
-  563 |     } else if (mode & FALLOC_FL_ZERO_RANGE) {
-      |                       ^~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/b96e3d364fd1f8bbfb18904a742e73327d308f64
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to qemu-devel@nongnu.org]
----
- block/export/fuse.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/block/export/fuse.c b/block/export/fuse.c
-index ada9e263eb..07e31129a6 100644
---- a/block/export/fuse.c
-+++ b/block/export/fuse.c
-@@ -635,6 +635,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
-             offset += size;
-             length -= size;
-         } while (ret == 0 && length > 0);
-+#ifdef FALLOC_FL_ZERO_RANGE
-     } else if (mode & FALLOC_FL_ZERO_RANGE) {
-         if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
-             /* No need for zeroes, we are going to write them ourselves */
-@@ -654,6 +655,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
-             offset += size;
-             length -= size;
-         } while (ret == 0 && length > 0);
-+#endif
-     } else if (!mode) {
-         /* We can only fallocate at the EOF with a truncate */
-         if (offset < blk_len) {
--- 
-2.30.2
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 5e873791b8..0613fce493 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  87bc1a471ca24b97e7005711066007d443423d19aacda3d442558ae032fa30b9  qemu-6.0.0.tar.xz
+sha256  eebc089db3414bbeedf1e464beda0a7515aad30f73261abc246c9b27503a3c96  qemu-6.1.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a58bc9024a..37dfc63907 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 6.0.0
+QEMU_VERSION = 6.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
