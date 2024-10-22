Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3075FCDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEB3D80E08;
	Tue, 22 Oct 2024 20:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-i8Rm1dkwjk; Tue, 22 Oct 2024 20:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E15EB80E0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E15EB80E0B;
	Tue, 22 Oct 2024 20:43:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF70E2072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90CC280E0C
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V38-oI9pq1Cj for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:43:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.46;
 helo=mail-wm1-f46.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28D4880DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28D4880DF9
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28D4880DF9
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:43:40 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4315abed18aso57290025e9.2
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 13:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729629819; x=1730234619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GlETcZdaLZqolrwpk+KB4oXw+NzddYc0R1CtYYqYXcM=;
 b=fybuKLC9zDldLnnPDH18Ymio3TaWLROhh2vNNUbhfnb9HZEolGAShu+G4AD0FXB/2m
 lkPXlDDGPi1MMdLP6bI5bmpT88kWyvUaNTbUSWIf1UmZYyOrspVaZB1nJenJik5RFFvE
 Q4S5duJslZHHVbm8ej5e0X8VZWw8tFK44B1DSO/+6Ud1ySt7KD6hwHJd9dze5/MvWt2A
 u3iuQ6APrwvwpkSYN5sgz2BixxKvzSL117x9QrWq5TzCnLSmhwOEjahaMNchLFzJhAiL
 WQEQgX+eVH+N5wi2VSTnj/3fOg4F+zQm/9embCDUWeh87XLUqsPVtcAqgGUBFM3RMpYG
 uMwQ==
X-Gm-Message-State: AOJu0YxRINk7AaYTxGcGia7pWKMiDK9t4mKBHdDNfaI6LpTdsh2QU4F8
 Fjf7K0RyfvkIjNu/HwzGn99xL62aXmZGMZ+EIf8r4yaJvN/Wy+qIzrhS0XKv
X-Google-Smtp-Source: AGHT+IHLUVBzrZpwpBVoddJVkSB38gz0Xxm5kL5yL85V7VDk1O2O6lnfirM5fMhq+k/Yq370YYgUDA==
X-Received: by 2002:adf:e386:0:b0:374:af19:7992 with SMTP id
 ffacd0b85a97d-37efcee8c34mr179427f8f.7.1729629818326; 
 Tue, 22 Oct 2024 13:43:38 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:c6c1:70d7:3bc8:98d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a37d4esm7411711f8f.3.2024.10.22.13.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 13:43:37 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Martin Kepplinger <martink@posteo.de>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Tue, 22 Oct 2024 22:43:33 +0200
Message-ID: <20241022204333.2045190-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/x11vnc: add and rework compile
 patches
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Add the "Upstream" field to the patch message for:
 - 0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 - 0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch

Add a compile patch for GCC >= 10 which enables -fno-common by default.

Fixes:
 - https://autobuild.buildroot.org/results/b22/b2231fe06fe56036a5ddbe61cb8556b046e3a7b7/build-end.log
 - https://autobuild.buildroot.org/results/8af/8afbcc63818d3e1586731e178f16635e773d5600/build-end.log
 - ...

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 .checkpackageignore                           |  2 -
 ...ld-on-32bit-arches-with-64bit-time_t.patch |  8 ++--
 ...-to-shared-memory-segments-to-curre.patch} |  8 ++--
 .../0003-Fix-build-with-fno-common.patch      | 48 +++++++++++++++++++
 4 files changed, 58 insertions(+), 8 deletions(-)
 rename package/x11vnc/{0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch => 0002-scan-limit-access-to-shared-memory-segments-to-curre.patch} (81%)
 create mode 100644 package/x11vnc/0003-Fix-build-with-fno-common.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index f38b900735..24be828232 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1364,8 +1364,6 @@ package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-ser
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck lib_sysv.Variables
-package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch lib_patch.Upstream
-package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch lib_patch.Upstream
 package/xen/0001-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch lib_patch.Upstream
 package/xen/0002-Fix-build-with-64-bits-time_t.patch lib_patch.Upstream
 package/xen/0003-libs-light-fix-tv_sec-printf-format.patch lib_patch.Upstream
diff --git a/package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
index 87dc3c994f..a9af88e55d 100644
--- a/package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
+++ b/package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -1,4 +1,4 @@
-From daecf59cc8b294265666482a4766aaa3148c308b Mon Sep 17 00:00:00 2001
+From 8ca0465fda181bd20e5d30c36fb2aea56ed27b6b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Nov 2019 11:43:32 -0800
 Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
@@ -8,8 +8,7 @@ input.h [1]
 
 [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
 
-[Retrieved from:
-https://github.com/LibVNC/x11vnc/commit/daecf59cc8b294265666482a4766aaa3148c308b]
+Upstream: https://github.com/LibVNC/x11vnc/commit/daecf59cc8b294265666482a4766aaa3148c308b
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/uinput.c | 25 +++++++++++++++++++++----
@@ -107,3 +106,6 @@ index 28fbad3..d71bcde 100644
  	ev.type = EV_KEY;
  	ev.code = (unsigned char) scancode;
  	ev.value = down;
+-- 
+2.43.0
+
diff --git a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
similarity index 81%
rename from package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
rename to package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
index e4dbdf1894..05977375d8 100644
--- a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
+++ b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
@@ -1,10 +1,9 @@
-From 69eeb9f7baa14ca03b16c9de821f9876def7a36a Mon Sep 17 00:00:00 2001
+From 3870280eca9c10a3607440209e9caf6d7749e379 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Gu=C3=A9nal=20DAVALAN?= <guenal.davalan@uca.fr>
 Date: Wed, 18 Nov 2020 08:40:45 +0100
 Subject: [PATCH] scan: limit access to shared memory segments to current user
 
-[Retrieved from:
-https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a]
+Upstream: https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/scan.c | 2 +-
@@ -23,3 +22,6 @@ index 43e00d2..12994d5 100644
  
  	if (shm->shmid == -1) {
  		rfbErr("shmget(%s) failed.\n", name);
+-- 
+2.43.0
+
diff --git a/package/x11vnc/0003-Fix-build-with-fno-common.patch b/package/x11vnc/0003-Fix-build-with-fno-common.patch
new file mode 100644
index 0000000000..eccfd3872a
--- /dev/null
+++ b/package/x11vnc/0003-Fix-build-with-fno-common.patch
@@ -0,0 +1,48 @@
+From 08d57adf499264fcd32461a4092cd799c474d669 Mon Sep 17 00:00:00 2001
+From: Alexander Tsoy <alexander@tsoy.me>
+Date: Tue, 28 Jan 2020 22:21:01 +0300
+Subject: [PATCH] Fix build with -fno-common
+
+GCC 10 defaults to -fno-common
+
+Upstream: https://github.com/LibVNC/x11vnc/commit/a48b0b1cd887d7f3ae67f525d7d334bd2feffe60
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ src/util.c | 3 +++
+ src/util.h | 6 +++---
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/util.c b/src/util.c
+index a82a1a4..6a52ebf 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -47,6 +47,9 @@ int hxl = 0;
+ #ifdef LIBVNCSERVER_HAVE_LIBPTHREAD
+ MUTEX(x11Mutex);
+ MUTEX(scrollMutex);
++MUTEX(clientMutex);
++MUTEX(inputMutex);
++MUTEX(pointerMutex);
+ #endif
+ 
+ int nfix(int i, int n);
+diff --git a/src/util.h b/src/util.h
+index 35c1afd..99b5dd1 100644
+--- a/src/util.h
++++ b/src/util.h
+@@ -102,9 +102,9 @@ extern struct timeval _mysleep;
+ #ifdef LIBVNCSERVER_HAVE_LIBPTHREAD
+ extern MUTEX(x11Mutex);
+ extern MUTEX(scrollMutex);
+-MUTEX(clientMutex);
+-MUTEX(inputMutex);
+-MUTEX(pointerMutex);
++extern MUTEX(clientMutex);
++extern MUTEX(inputMutex);
++extern MUTEX(pointerMutex);
+ #endif
+ 
+ #define X_INIT INIT_MUTEX(x11Mutex)
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
