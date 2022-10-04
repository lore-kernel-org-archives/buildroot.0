Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156E5C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 09:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89DB640B34;
	Tue,  4 Oct 2022 09:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89DB640B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQUMU73_6j6K; Tue,  4 Oct 2022 09:37:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 976AE405B7;
	Tue,  4 Oct 2022 09:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 976AE405B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D67631BF27C
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 09:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1F2B405B7
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 09:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1F2B405B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxpSgGA-jzj2 for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 09:37:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29703400CE
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29703400CE
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 09:37:16 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id a26so27617097ejc.4
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 02:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=eZ94gwUWBGsCKIcMLLeLJTSDTe9pGepq34GXsyOr2Bo=;
 b=Pms1svhqN5n4FJ4lJDyw0C0mxqynBwbT4WNhvvDLXbSskh7FATIGnc3Qa3eNGoXe5+
 MJFmdzHOPdjMHgjcmv/R6RwlVb3A3OF+EXI+qKMalyrI5QoScTUQtGMqRTLQz6DQgBpX
 ZpBG4KdXPtcYt8uKbb7rT35HFwEuaFe1Jvuoiya/ygNG687UWufJ5SvkWHDuViGAVXEr
 EEPzfrLSXmVUQNyjTJMdQkByyRvxyjyMxt5ku332uK/Uv5Xdro4ZMKu321arS9KoxPLn
 K7qx7QfJ0jt4QNIZi4GypsNQDtY0qGP06UU8X1QqFKjFhccZZUluB7abGdWkVCa0CZQg
 ulsg==
X-Gm-Message-State: ACrzQf1W0pIjR/PSaZKgwZw+JcIpkEWOQYfmlcjcv1yZEx60UHEatF5C
 qIHRnxIXinVk6p3/KQcWhTvrY5s0g6QssA==
X-Google-Smtp-Source: AMsMyM7j62K2QE+MJwYi3Yvm8RC+nqnqjLjBxuh2RJHSj+HBT9zRbhV0ahuD4m/TlaAQvlPfo77rcg==
X-Received: by 2002:a17:907:6e9e:b0:78c:5533:4158 with SMTP id
 sh30-20020a1709076e9e00b0078c55334158mr4980097ejc.417.1664876233684; 
 Tue, 04 Oct 2022 02:37:13 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 o12-20020aa7dd4c000000b0045769dee1fdsm1318155edw.29.2022.10.04.02.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 02:37:13 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 11:36:49 +0200
Message-Id: <20221004093649.31017-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=eZ94gwUWBGsCKIcMLLeLJTSDTe9pGepq34GXsyOr2Bo=;
 b=MWmKiEK4P7dpaBEmjB+qMEBHDO1BH/55NTmcswD0k1qKBMeCxuZ8jX3sDZfJyhcCQj
 L5COiXojVv7XyBCrn8xfqRtwaFayF/jv9wAxoNQDPQ/ks7VFgna1aU98L2RvBnIDNNkS
 NvVmkhOgJDWBrJFHfO2gOzwVaOu+1hkvyTErO0hDj/aT9z9gtLdiwchsXlUMCQIypVdR
 kRaZ79EmWT6SNGZ6eVSqZSAiGzeaOaeo2nLrxwBxXMH306s3t6/5uxHnk9a9PSpL+6p+
 nDgKYuTJzT5zXiNqQ4deT13Rsxi/XNdQKFgNwvjNL8ksxaWt+9RZkLtWJnblZWWNohW9
 KTFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MWmKiEK4
Subject: [Buildroot] [PATCH 1/1] package/qt6: bump to version 6.4.0
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop the qsimd_p.h fix, this has been fixed upstream since 6.3.2/6.4.0

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6.mk                            |  4 +-
 ...al-qsimd_p.h-fix-build-on-ARM-v7-due.patch | 49 -------------------
 package/qt6/qt6base/qt6base.hash              |  4 +-
 package/qt6/qt6serialport/qt6serialport.hash  |  4 +-
 4 files changed, 6 insertions(+), 55 deletions(-)
 delete mode 100644 package/qt6/qt6base/0001-src-corelib-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index b609baf4c6..575b2f826c 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QT6_VERSION_MAJOR = 6.3
-QT6_VERSION = $(QT6_VERSION_MAJOR).2
+QT6_VERSION_MAJOR = 6.4
+QT6_VERSION = $(QT6_VERSION_MAJOR).0
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/0001-src-corelib-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch b/package/qt6/qt6base/0001-src-corelib-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch
deleted file mode 100644
index 1097a79922..0000000000
--- a/package/qt6/qt6base/0001-src-corelib-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From d69db2ba3ce47f6eded0a8843c413a67d26e6375 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 24 Jul 2022 20:37:51 +0200
-Subject: [PATCH] src/corelib/global/qsimd_p.h: fix build on ARM < v7 due to
- yield instruction
-
-On ARM < v7 with gcc, the build fails with:
-
-/tmp/ccRlrCQi.s: Assembler messages:
-/tmp/ccRlrCQi.s:3858: Error: selected processor does not support `yield' in ARM mode
-/tmp/ccRlrCQi.s:3875: Error: selected processor does not support `yield' in ARM mode
-/tmp/ccRlrCQi.s:4606: Error: selected processor does not support `yield' in ARM mode
-/tmp/ccRlrCQi.s:4853: Error: selected processor does not support `yield' in ARM mode
-/tmp/ccRlrCQi.s:5268: Error: selected processor does not support `yield' in ARM mode
-
-while building src/corelib/thread/qfutureinterface.cpp.
-
-This is due to the fact that the qYieldCpu() macro on ARM, assumes
-that if the compiler is gcc, we can do asm volatile("yield"). However,
-this instruction is only guaranteed to exist on ARMv7+ cores. It
-doesn't exist on ARMv5, and only some (but not all) ARMv6 cores have
-it. If it's not available, we just fallback to the default behavior of
-qYieldCpu(), which is to do nothing.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream bug: https://bugreports.qt.io/browse/QTBUG-105162
----
- src/corelib/global/qsimd_p.h | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/corelib/global/qsimd_p.h b/src/corelib/global/qsimd_p.h
-index d270d09f2f..b84b257e54 100644
---- a/src/corelib/global/qsimd_p.h
-+++ b/src/corelib/global/qsimd_p.h
-@@ -428,7 +428,10 @@ static inline void qYieldCpu()
-          https://stackoverflow.com/a/70076751/134841
-          https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105416
-     */
--    asm volatile("yield"); /* this works everywhere */
-+#    if defined(Q_PROCESSOR_ARM_V7)
-+    /* The yield instruction appeared in ARMv7 */
-+    asm volatile("yield");
-+#    endif
- #  else
-     __yield(); /* this is what should work everywhere */
- #  endif
--- 
-2.37.1
-
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index e43a6ff52d..5dd26973fa 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.2/submodules/qtbase-everywhere-src-6.3.2.tar.xz.sha256
-sha256  7929ba4df870b6b30870bc0aed2525cfc606ed7091107b23cf7ed7e434caa9a6  qtbase-everywhere-src-6.3.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.0/submodules/qtbase-everywhere-src-6.4.0.tar.xz.sha256
+sha256  cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55db75b22b94ead9b37d  qtbase-everywhere-src-6.4.0.tar.xz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 50202a1e26..fb1b3dcf6b 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtserialport-everywhere-src-6.3.1.tar.xz.sha256
-sha256  c7d207322367c63647edbd06ded9c76ba9071961daac1d1021b622b762c35e6f  qtserialport-everywhere-src-6.3.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.0/submodules/qtserialport-everywhere-src-6.4.0.tar.xz.sha256
+sha256  f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac614f4a4483  qtserialport-everywhere-src-6.4.0.tar.xz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
