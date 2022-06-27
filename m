Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BC9C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 05:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 256A082F20;
	Mon, 27 Jun 2022 05:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 256A082F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIX9--3a7DBv; Mon, 27 Jun 2022 05:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82C9C82EBA;
	Mon, 27 Jun 2022 05:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C9C82EBA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C6881BF33E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32A7860E19
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32A7860E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTrwT6MT_8Vh for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 05:34:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67E50606EB
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67E50606EB
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 05:34:36 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id p9so5014476ilj.7
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 22:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J1bMxylsH4UJerfgiD6g9IH+I//djozTfohRWLMxT6E=;
 b=bb03u0GMRPHujGDFaljOySo6O5St/kYP9H2aC1yzZaMhgyz243qmI2PRRoUcUJMjCq
 OfGj2mDIrjQuWrx9JkbupxxqHiz3WyHI14SDRk1IV1W7hwqXDyGHlQMpAP4DnTvuZI4g
 d/03dj/95xgNU9WDZ6cNsHDzdWAR5jdhBz0Uj72reyN/NnCmFrufd1zUpRm9DB5UnoUx
 F/A9AGHBf1SD66SvWD+MZDv4X0w33MU+QGoHqzNCjfGObWVBAuu/ji5s/HqPuwVoQ8lB
 3oHgmizmpuH0xfRvacGiJiyBbG8o+RkGah8C4SPrqwX3DmZxsDk6gzruX/hBy8v1Di8W
 FQMQ==
X-Gm-Message-State: AJIora+GAot/z4vblCc5zmH5Ea63YMo6qRF0L0UYSpbS9Ae4KqrkBhNw
 KfDqjHYl2Varz9xeS63+hzFVO/eaZ8s=
X-Google-Smtp-Source: AGRyM1vYM/6vid6tl7amYpwF5T7YtuWcp1GZeo/zR5rFaqKJigCOKIilS5l1OL/CJtzMGjfhway45A==
X-Received: by 2002:a05:6e02:1b87:b0:2d6:5e74:217a with SMTP id
 h7-20020a056e021b8700b002d65e74217amr6202866ili.74.1656308075386; 
 Sun, 26 Jun 2022 22:34:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 n9-20020a056e021ba900b002d95fd5ad64sm4082623ili.59.2022.06.26.22.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 22:34:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 23:34:22 -0600
Message-Id: <20220627053422.618280-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627053422.618280-1-james.hilliard1@gmail.com>
References: <20220627053422.618280-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J1bMxylsH4UJerfgiD6g9IH+I//djozTfohRWLMxT6E=;
 b=OOspwHkSrdkrGWSKd3dypieyw7xYiP+JKDaxHzjhC3uXfyMazHJ6JulY75tf38E0uE
 LcVqMwAWScz4/AIJ3WhxBInLa+pLqH5z9q9YWSpHp1T4qG1QTAN6sMl4xSghqu32PStl
 lDnP+TfnitxNW+H4gW9Tfte1Q7irOBZlmd3g5UfrwDPn3BKJvRsdUVSHrAB9RSZ5BUAz
 K7jEKHC8n19WLnU8jxQFW1yvpvkL02Qjq2Tu3rQRiCE4taf5Ty1yZihNmTiLOy1NJ6vO
 zdc1mqbA8KLyBFD0IB1xLV7OBVXpQ/0G8UWYPWNGwd4CQDZI8GONwUt9HVnOa8qU0+EA
 aF2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OOspwHkS
Subject: [Buildroot] [PATCH 12/12] package/gst1-python: bump version to
 1.20.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-build-on-systems-without-C-compiler.patch | 35 -------------------
 .../gstreamer1/gst1-python/gst1-python.hash   |  4 +--
 package/gstreamer1/gst1-python/gst1-python.mk |  2 +-
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch

diff --git a/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch b/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch
deleted file mode 100644
index 7d3059d61a..0000000000
--- a/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 26c2385faed0bb997368daabd4c64207b3fc01ca Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 15 Apr 2022 18:58:49 +0200
-Subject: [PATCH] gst-python: fix build on systems without C++ compiler
-
-Fix the following build failure on systems without C++ compiler:
-
-The following exception(s) were encountered:
-Running "/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++'"
-
-Fixes:
- - http://autobuild.buildroot.org/results/eebf65036f79d21d347714d62afecd0108393308
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2200>
-
-[Retrieved (and backported) from:
-https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/26c2385faed0bb997368daabd4c64207b3fc01ca]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- subprojects/gst-python/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 1462604b297..c28df16192a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,4 +1,4 @@
--project('gst-python', 'c', 'cpp',
-+project('gst-python', 'c',
-   version : '1.20.1',
-   meson_version : '>= 0.60',
-   default_options : [ 'warning_level=1',
--- 
-GitLab
-
diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index fe1e2068b1..9501d94a97 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.1.tar.xz.sha256sum
-sha256  ba6cd59faa3db3981d8c6982351c239d823c0b8e80b1acf58d2997b050289422  gst-python-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.3.tar.xz.sha256sum
+sha256  db348120eae955b8cc4de3560a7ea06e36d6e1ddbaa99a7ad96b59846601cfdc  gst-python-1.20.3.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 3fd8059bee..0fa1f661b8 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.20.1
+GST1_PYTHON_VERSION = 1.20.3
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
