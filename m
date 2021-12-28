Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A0CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 13:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EE7E4013A;
	Tue, 28 Dec 2021 13:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0FE3vxsoZ7B; Tue, 28 Dec 2021 13:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEE5F40145;
	Tue, 28 Dec 2021 13:53:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F051A1BF363
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF0BD60687
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:53:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZb8BSucQ71F for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 13:53:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DC456064D
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 13:53:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id c66so11650455wma.5
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 05:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SBUtv+P5pdT/f91amUGa85XLXzpKcsEVeRpaKYWJJag=;
 b=Vhk8V3AXSid05DSoNT9i3NsvvT5hy/F+20npoZ5hC/OSw7NMu6m8cVzzolgA/VitMk
 L0O9tuAhOVvR3D4Hp2K1YhV/OUvg3iyw1cVvQ4aThqRtOaPYAOb6RGe0RFinKAErbAF4
 2ksNl0YAwE2d/DRZrCM7K44pIBzRZzCfK8hzTvvpUcA6EGZaJ1c7fIQvP1dbYbjFbR4R
 9XhO34Wpix6kv1q5lbHX9mubgoeP+RHk+GAhdNRmW6+pPxi2zMsUImioMrniw57jRdss
 /CWdQyjyjk1DlqJGD4gupt290QHv79e5ZtIYGQnjTWDOq1pA5z6F70cGLFx1UazokUU9
 upZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SBUtv+P5pdT/f91amUGa85XLXzpKcsEVeRpaKYWJJag=;
 b=qv5r2bj9mc9D7XvBhQDY2tOynrVOrSFlmvJVvVSYVtJN2JqzINHIBiwfyZjdf8paiq
 anWB6EwXqkjTM6+yOOAtCK2xwscj6lS6zzODhS+6DJBlzIKpzCzolFr1jOxGLu1+aXon
 x45DxRcfU+NgUutJH3Qnx1cuyXqWsxoRGNOnsCpNPOu0jF8/rLGKXMAVLSpK9/zsacAG
 g9nMiH7k6nxB0bVIkrfqIAN07YP3BqKMMSyyvl++4o20liwZRWCd3lx0OI4jKwwJ1S7P
 VrklOao+4/7h2TK9xpai5+CuSrFcgW9CzVZO5z8k00HbbghT5Zg1crk6wsZDFZopv5Bh
 hLCQ==
X-Gm-Message-State: AOAM533XglU6lTlOn9nZz4doMl5YPpB5blo6ZgIjQgyzIQOMmGCP/bWg
 bBvJKF879mVqMYFRVhh/yedGuUMKxWJN8Q==
X-Google-Smtp-Source: ABdhPJyGMs6n6SPgJtBDJnEwqEAhSBjhgnAey/1Plx7LxlPnEUguIbzpGJjcl3qLq6ZPuBNIrJFsIA==
X-Received: by 2002:a05:600c:35d4:: with SMTP id
 r20mr17781638wmq.190.1640699626474; 
 Tue, 28 Dec 2021 05:53:46 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id d4sm17941021wrx.102.2021.12.28.05.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 05:53:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 14:53:05 +0100
Message-Id: <20211228135305.3696192-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opencv4: bump to version 4.5.5
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

https://github.com/opencv/opencv/wiki/ChangeLog#version455

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...src-cap_ffmpeg_impl.hpp-fix-build-wi.patch | 52 -------------------
 package/opencv4/opencv4.hash                  |  2 +-
 package/opencv4/opencv4.mk                    |  2 +-
 3 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch

diff --git a/package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch b/package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch
deleted file mode 100644
index 6d5d6d0647..0000000000
--- a/package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 4c92a2869b9a8f736a12ba859b74e5cadce62387 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Nov 2021 09:50:17 +0100
-Subject: [PATCH] modules/videoio/src/cap_ffmpeg_impl.hpp: fix build with gcc
- 4.8
-
-Fix the following build failure with gcc 4.8:
-
-In file included from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_impl.hpp:100:0,
-                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:50:
-/home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp: In constructor 'HWAccelIterator::HWAccelIterator(cv::VideoAccelerationType, bool, AVDictionary*)':
-/home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp:939:23: error: use of deleted function 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)'
-             s_stream_ = std::istringstream(accel_list);
-                       ^
-In file included from /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/complex:45:0,
-                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core/cvstd.inl.hpp:47,
-                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core.hpp:3306,
-                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/include/opencv2/videoio.hpp:46,
-                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/precomp.hpp:57,
-                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:42:
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: note: 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)' is implicitly deleted because the default definition would be ill-formed:
-     class basic_istringstream : public basic_istream<_CharT, _Traits>
-           ^
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: error: use of deleted function 'std::basic_istream<char>& std::basic_istream<char>::operator=(const std::basic_istream<char>&)'
-
-Fixes:
- - http://autobuild.buildroot.org/results/60f8846b435dafda0ced412d59ffe15bdff0810d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/opencv/opencv/commit/4c92a2869b9a8f736a12ba859b74e5cadce62387]
----
- modules/videoio/src/cap_ffmpeg_impl.hpp | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
-index d393b73ff4a2..76e1b855b7c8 100644
---- a/modules/videoio/src/cap_ffmpeg_impl.hpp
-+++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
-@@ -93,6 +93,12 @@ extern "C" {
- }
- #endif
- 
-+// GCC 4.x compilation bug. Details: https://github.com/opencv/opencv/issues/20292
-+#if (defined(__GNUC__) && __GNUC__ < 5) && !defined(__clang__)
-+#undef USE_AV_HW_CODECS
-+#define USE_AV_HW_CODECS 0
-+#endif
-+
- //#define USE_AV_HW_CODECS 0
- #ifndef USE_AV_HW_CODECS
- #if LIBAVUTIL_VERSION_MAJOR >= 56 // FFMPEG 4.0+
diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
index 791ebe3d35..6d43138be8 100644
--- a/package/opencv4/opencv4.hash
+++ b/package/opencv4/opencv4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c20bb83dd790fc69df9f105477e24267706715a9d3c705ca1e7f613c7b3bad3d  opencv4-4.5.4.tar.gz
+sha256  a1cfdcf6619387ca9e232687504da996aaa9f7b5689986b8331ec02cb61d28ad  opencv4-4.5.5.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 1859b866dd..e75f7144de 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV4_VERSION = 4.5.4
+OPENCV4_VERSION = 4.5.5
 OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
