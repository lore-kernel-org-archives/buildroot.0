Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12234C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 11:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B30CC606EC;
	Wed, 27 Dec 2023 11:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B30CC606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bjiPhSl52pab; Wed, 27 Dec 2023 11:32:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D50C460F8D;
	Wed, 27 Dec 2023 11:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D50C460F8D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBA651BF267
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 11:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C10EA60F89
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 11:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C10EA60F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5-XTd2MQgTEP for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 11:32:31 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69B0E606EC
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 11:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69B0E606EC
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so28676835e9.1
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 03:32:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703676748; x=1704281548;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pwleMW9guex5UiswGGixBfTqUuVXXkhz7N069oB63rk=;
 b=RysdBbmF7tFTE9opEhnjul7izWmHn/C5IqSSUcONbe1rYz8ewDZ+bcB4x+BlDBlsLf
 mCsmHUO7boin88DBMGNSmzvwjP+tlvszXNwK1/EAR+vhodv8WYlzVa78pRCU2zaDAyRj
 uLUS2/CNkYo3DBTB41Nnu+rrbj/x9l8t8Gl9E6qBpKNlTKUyI05KFjl67KN2Z3cL8Ns8
 WWCJTM0QnQPfIxIBzcS5vwdMv7yeo5kW5+t+6Fn4Bul+L9ByAinWux7lZdP6AhL1LH8a
 xBOEdC3S87ilorcuMQwbWzd2ls5drYvhL+c84/yRC0eZHVB6RCI7r1tpGEGZfus8BTmQ
 jAmQ==
X-Gm-Message-State: AOJu0YwWONm1k/DJcH/BK/nl1crZdbIfoS0nUkThDgalKi6WY6bGpEyU
 STLBqy++3YLHv5X6V/M4SlaB9kcNJmY=
X-Google-Smtp-Source: AGHT+IFgmUaEmgvlrFR8cUurm/oVaknG/rO34wTrbOq/M6OoI492K9ZNQkAZ/6abji2cy95NQgxGZg==
X-Received: by 2002:a05:600c:35d6:b0:40d:5d05:8640 with SMTP id
 r22-20020a05600c35d600b0040d5d058640mr603270wmq.2.1703676748405; 
 Wed, 27 Dec 2023 03:32:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c6-20020adfe706000000b0033342338a24sm14711147wrm.6.2023.12.27.03.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Dec 2023 03:32:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 12:32:26 +0100
Message-ID: <20231227113226.1142519-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703676748; x=1704281548; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pwleMW9guex5UiswGGixBfTqUuVXXkhz7N069oB63rk=;
 b=GiUW3GTk3vNeoTEx6AEAt9SsWJh/qLgCo0KcjixTgtHG23yy4y4YC0Cq3lepDdpJX9
 5FIpzriC8sBzXsAdH8zlUi9WzjNpSm9YaQLDPJCJ/TFpUrIpDwz2+EcceumETYuP3GIu
 48WQVW+Sbe6t6U4ND+Yh6tAWHj9CrKxBH9BvqWzqBjUW15BA6I1bkf7rvzTAo4L7bGDA
 s38a9o20ZuUl/HMnK0Z5gsoT61njrx8gn8rgPkD7xh2ElbWsPNzkUPtWiiTyWp2TfqVY
 rUMn8PTlztRAI6dYTbJaMBUkotaW7hDKRvuQKI8N5XlMMcZcjib9+qFPWo8CQJOp4BJM
 O1ww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GiUW3GTk
Subject: [Buildroot] [PATCH 1/1] package/botan: bump to version 3.2.0
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

- Drop patches (already in version)
- Update hash of license.txt (update in year:
  https://github.com/randombit/botan/commit/4d0371816763f16ea0b9694155016db591293c8e)

https://github.com/randombit/botan/blob/3.2.0/news.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  2 --
 ...01-Add-superh-alias-needed-by-Debian.patch | 22 --------------
 ...-data-arch-superh.txt-add-sh4-eb-aeb.patch | 30 -------------------
 package/botan/botan.hash                      |  4 +--
 package/botan/botan.mk                        |  2 +-
 5 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 package/botan/0001-Add-superh-alias-needed-by-Debian.patch
 delete mode 100644 package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 4e6c688380..d9c6bec6d3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -210,8 +210,6 @@ package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch Upstre
 package/bmx7/0002-Fix-linking-error.patch Upstream
 package/bmx7/0003-Reorder-includes-to-avoid-ethhdr-collision.patch Upstream
 package/boinc/S99boinc-client Indent Shellcheck Variables
-package/botan/0001-Add-superh-alias-needed-by-Debian.patch Upstream
-package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch Upstream
 package/brickd/S70brickd Indent Shellcheck Variables
 package/bridge-utils/0001-fix-build-on-musl.patch Upstream
 package/brltty/0001-Fix-linking-error-on-mips64el.patch Upstream
diff --git a/package/botan/0001-Add-superh-alias-needed-by-Debian.patch b/package/botan/0001-Add-superh-alias-needed-by-Debian.patch
deleted file mode 100644
index c6236849e9..0000000000
--- a/package/botan/0001-Add-superh-alias-needed-by-Debian.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 454c7c04385a47d511cf8999ccff2746afbab06b Mon Sep 17 00:00:00 2001
-From: Jack Lloyd <jack@randombit.net>
-Date: Sat, 21 Nov 2020 12:37:06 -0500
-Subject: [PATCH] Add superh alias needed by Debian
-
-[Retrieved from:
-https://github.com/randombit/botan/commit/454c7c04385a47d511cf8999ccff2746afbab06b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/build-data/arch/superh.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/build-data/arch/superh.txt b/src/build-data/arch/superh.txt
-index 6af6dbe682..8e2833a914 100644
---- a/src/build-data/arch/superh.txt
-+++ b/src/build-data/arch/superh.txt
-@@ -1,4 +1,5 @@
- 
- <aliases>
- sh4
-+sh4a
- </aliases>
diff --git a/package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch b/package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch
deleted file mode 100644
index aa9f3ad5ba..0000000000
--- a/package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c88897ebaf173b97068811b520a4741039f09dcd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 20 Aug 2022 15:16:22 +0200
-Subject: [PATCH] src/build-data/arch/superh.txt: add sh4{eb,aeb}
-
-Fix the following build failure with sh4{eb,aeb}:
-
-  ERROR: Unknown or unidentifiable processor "sh4aeb"
-
-Fixes:
- - http://autobuild.buildroot.org/results/d7750b734736a66e10bc5a8ee06708041b36443a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/randombit/botan/commit/c88897ebaf173b97068811b520a4741039f09dcd]
----
- src/build-data/arch/superh.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/build-data/arch/superh.txt b/src/build-data/arch/superh.txt
-index 8e2833a914..e17edb097a 100644
---- a/src/build-data/arch/superh.txt
-+++ b/src/build-data/arch/superh.txt
-@@ -2,4 +2,6 @@
- <aliases>
- sh4
- sh4a
-+sh4eb
-+sh4aeb
- </aliases>
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index 64da04415e..840191aa4b 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  dae047f399c5a47f087db5d3d9d9e8f11ae4985d14c928d71da1aff801802d55  Botan-2.19.3.tar.xz
+sha256  049c847835fcf6ef3a9e206b33de05dd38999c325e247482772a5598d9e5ece3  Botan-3.2.0.tar.xz
 # Locally computed
-sha256  472faf6d2231130382779f96de506be19296473750356449fc426ddc9cb03b50  license.txt
+sha256  1833cde7c7cc03296b1ef2ddc178b1cd7fd1c476840f32cf6aedb09ab0bc9004  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 52019f36eb..74cf6175dd 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.19.3
+BOTAN_VERSION = 3.2.0
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
