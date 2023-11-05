Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8F9C4167B
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8858D410BC;
	Sun,  5 Nov 2023 21:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8858D410BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m_vIoyJZaOfA; Sun,  5 Nov 2023 21:25:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA518410EA;
	Sun,  5 Nov 2023 21:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA518410EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 401AE1BF45A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1732440A68
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1732440A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9L9NVe4t1Myz for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:24:59 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B432400CB
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B432400CB
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so2439715f8f.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699219496; x=1699824296;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FKba8Dv7jPZibce3bpdjpLViMh8jMLV8DwPouQDYazs=;
 b=S5bS5cavROOVRE9CaRiZYCAi+w0FAjjelmcoERoxW6bGAQyNDxARgEPjj7qgauFvxE
 uTPESq4/mWiBBT5FkN/TcvQc6Z9H87DCOcVA/fjlDpZiHjyuS2uZw0hybIK91mvsj7eD
 ppocozL/+4ufzkMxm0nlLUMHMho0JYn1C4gOXupRfUtn4rKpEPbc6PPtRTQW/j5zclEr
 Fm34L801e2vO3Uj3alBfoGcew1oxHKeakADsm4I9O6kZ6t2hpgEmiSys5koZ073Fqcro
 tCLz3iJX9UWIQky1ThaDJUxMoITWW1nhhZeYCzYwbrriD5rGmiYYNlLvdSyLRpv8XF1O
 0BrA==
X-Gm-Message-State: AOJu0YybTg/xEEEk0W/j0H0wjJgv4YHAB1dbktQfH7NUnNI/PLqR92/5
 lIHHuaQREbujToJYzMYzsdKXTHuVWoo=
X-Google-Smtp-Source: AGHT+IE0f4VA3OYoP/F4fTjL96Y15K0UPz6/48L7XjKKIGRqDQ8CL1tzfxoB4z9183fuDK+MofiGtA==
X-Received: by 2002:a05:6000:1c0f:b0:32f:a48b:1e2b with SMTP id
 ba15-20020a0560001c0f00b0032fa48b1e2bmr8314945wrb.5.1699219496256; 
 Sun, 05 Nov 2023 13:24:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e15-20020a5d594f000000b00327b5ca093dsm7621654wri.117.2023.11.05.13.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 13:24:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 22:24:53 +0100
Message-ID: <20231105212453.49399-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699219496; x=1699824296; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FKba8Dv7jPZibce3bpdjpLViMh8jMLV8DwPouQDYazs=;
 b=RYoSlA6WE/FJti0ag3OVYl7Nts7Sg4sUmT1Jms2gGmWvQumEtS/LD06BN5l50/sidJ
 eyUciTf3LA4IRVu4rCpzLghNMVhCZl9ERg/+nAZ/dZKW32qs8VfWg9yRTv1q6rLFLI24
 4dO8Opc0zdWAzA+hXrYO5pnmPkwJs+M0RDfJb5LkAyGQxTq422PPM4GhsC2YjJiwvJQG
 7a74GM3mefKEBL4K7yvG808Ta1E5vLGVRXq9QHRBfE0NoWaAwmz7vsiJRAI9QxEtYcvc
 CkSNWuDQUZ2VvIhMMnhlMgxXQJgpR3Nh2wbSWIPjo3UXlFcbNrfNT5WqZFEjfru/BvDG
 rU/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RYoSlA6W
Subject: [Buildroot] [PATCH 1/1] package/wavemon: bump to version 0.9.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/uoaerg/wavemon/releases/tag/v0.9.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...001-iw_if.h-don-t-include-linux-if.h.patch | 41 -------------------
 package/wavemon/wavemon.hash                  |  2 +-
 package/wavemon/wavemon.mk                    |  2 +-
 4 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 3d876c1bab..7a76b31a44 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1450,7 +1450,6 @@ package/wampcc/0001-Add-RISC-V-endian-detection.patch Upstream
 package/wampcc/0002-include-wampcc-platform.h-fix-build-with-musl-1.2.0.patch Upstream
 package/wampcc/0003-Broken-build-on-Windows.patch Upstream
 package/watchdogd/S01watchdogd Indent NotExecutable
-package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch Upstream
 package/webrtc-audio-processing/0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch Upstream
 package/wget/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch Upstream
 package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch Upstream
diff --git a/package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch b/package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch
deleted file mode 100644
index 95f54e4b7f..0000000000
--- a/package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 4ac1482bb40376e47805c3737dfed60abb1dd3b4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 22 Dec 2021 00:39:35 +0100
-Subject: [PATCH] iw_if.h: don't include linux/if.h (#109)
-
-Don't include linux/if.h to avoid the following build failure:
-
-In file included from iw_if.h:31:0,
-                 from conf.c:19:
-/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h: At top level:
-/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:143:8: error: redefinition of 'struct ifmap'
- struct ifmap {
-        ^
-In file included from iw_if.h:26:0,
-                 from conf.c:19:
-/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/net/if.h:111:8: note: originally defined here
- struct ifmap
-        ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/a6ee162cf04b70b144b54e1ca4b7b2421071c50c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/uoaerg/wavemon/commit/4ac1482bb40376e47805c3737dfed60abb1dd3b4]
----
- iw_if.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/iw_if.h b/iw_if.h
-index 9e7fa89..6607e0b 100644
---- a/iw_if.h
-+++ b/iw_if.h
-@@ -28,7 +28,6 @@
- #include <net/ethernet.h>
- #include <sys/types.h>
- #include <sys/socket.h>
--#include <linux/if.h>
- 
- /* Definitions from linux/ieee80211.h (not necessarily part of distro headers) */
- #define WLAN_CAPABILITY_ESS		(1<<0)
diff --git a/package/wavemon/wavemon.hash b/package/wavemon/wavemon.hash
index 7c685f6500..342f2f7d91 100644
--- a/package/wavemon/wavemon.hash
+++ b/package/wavemon/wavemon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e7e4167292136ca7ff12ddeb880904c10f33e97620ea6aa5f7838e859fdb40ed  wavemon-0.9.4.tar.gz
+sha256  f84c55a40b470f2b98908d20cd0b38ffef6f587daed23b50281c9592df3331c6  wavemon-0.9.5.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index 50e3fd275e..74917e8392 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVEMON_VERSION = 0.9.4
+WAVEMON_VERSION = 0.9.5
 WAVEMON_SITE = $(call github,uoaerg,wavemon,v$(WAVEMON_VERSION))
 WAVEMON_LICENSE = GPL-3.0+
 WAVEMON_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
