Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724FFCD343E
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 06:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE0396120B;
	Tue, 19 Sep 2023 06:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE0396120B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgbLr5s1LnEX; Tue, 19 Sep 2023 06:16:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC6C460B0E;
	Tue, 19 Sep 2023 06:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC6C460B0E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7043F1BF33B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 06:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44F6241B8B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 06:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44F6241B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ynCk_YCCH0ND for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 06:16:02 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0336C4095A
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 06:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0336C4095A
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-404314388ceso56025565e9.2
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 23:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695104159; x=1695708959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ztFPDmFKCU4VF2l52GuC/rQ60j1fpXw0q1EVLSuIcxQ=;
 b=DbUNZqAFQiBqpE4cpNf+lAUNuma0fru8d4fiG2c3InF2hXe6k59fRQDyuPtR38f2EY
 ZWpnbnMBvV6dNjpH+qrBdVmWTs4H4X9jVDRnck4D5E/Nf5JpfSjwhcVw2e6PcLdGKx1W
 4w0BEuY5dRoEetYNw16KXirXFvXLJgWey5JtAFYMFFGyvwcnutjEnLz9nDO7RUzo7hA2
 k8HY/f0RJiWKNPPbyDe/UTe3qyBULAnzM8eIHoSaKeNjrN6YlJ0H+BDieVqPyeIpLxi8
 GyhB+tZ550VVCy8BCSwwB0i2TcTfO3IP+CcYLmmVR/8yHohtqBSWTKrHfQDNon3lqueI
 e6eA==
X-Gm-Message-State: AOJu0YwMnNJOQGgSoYXnLqfigKvxitxncjNRUNlUszWwec+Mcck4HPK5
 YOk5Y+eF/bqP8wcVFJMlJvVcDXv29Vg=
X-Google-Smtp-Source: AGHT+IFpuuClRQdqlc4EHjCBlSoBAb9bHw0WO5b9KCmcOj94rcN1cX3QiZwc4FUFiK7F7FGz3r3Cpg==
X-Received: by 2002:a7b:c412:0:b0:3fe:207c:1aea with SMTP id
 k18-20020a7bc412000000b003fe207c1aeamr9213088wmi.23.1695104159270; 
 Mon, 18 Sep 2023 23:15:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2129-239.w92-167.abo.wanadoo.fr.
 [92.167.208.239]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b003fef5e76f2csm627631wmq.0.2023.09.18.23.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 23:15:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 08:15:56 +0200
Message-Id: <20230919061556.4252-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695104159; x=1695708959; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ztFPDmFKCU4VF2l52GuC/rQ60j1fpXw0q1EVLSuIcxQ=;
 b=M1EQHT9WkrQzGt+M2PS3C6FTh+5KWrLiZmm6tmOYCTxvttjr3EKPgUaAZ0k2Znj2Ox
 kq0SEdeJC4ES8dvqdALgyjYOLD4zGoaangKAGOtKBh0vnDgsxrU4G4rxc5TxIqfbnq3I
 n0OrF2NSPLDsR1mTbTUdncvyenVgZ6+X8IIMRGT6Q2EtLf3DaDQddz/8OKTMjMqR5/bY
 YxkY7ZlhUhia9mnyKYzo3/IYQO+upfSxx1LpvhWe64g8dPOoPQc0oWJZGhNdicRqiUwp
 feMAVaO39ZPtT8b3/CioEIEunzno37NA8AIP1uaok/QqDWg/qSRJm/tEB/qSLAuSWtFX
 OtEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M1EQHT9W
Subject: [Buildroot] [PATCH v2,
 1/1] package/binutils: fix install of libsframe
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with oprofile raised since bump of
binutils to version 2.40 in commit
35656482d3b74ab12a6c2395ac9ca61b60a2fd49:

configure: error: bfd library not found

[...]

configure:17928: checking for bfd_openr in -lbfd
configure:17953: /home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lbfd  -liberty -lpopt  -ldl -lintl >&5
/home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/12.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: warning: libsframe.so.0, needed by /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libbfd.so, not found (try using -rpath or -rpath-link)

Indeed, in this case, libsframe is not installed even after applying
commit 1b4d921e1da614a72fed2a79d5c4f8e0b6d1cd45 because
BR2_BINUTILS_VERSION_2_40_X is not selected by anyone (binutils package
is selected by oprofile and the toolchain is not generated by buildroot)

To fix this issue, invert the logic: install libsframe by default (i.e.
when binutils is selected or with a buildroot toolchain). libsframe will
not be installed only if binutils < 2.40 is detected.

Fixes:
 - http://autobuild.buildroot.org/results/af9a2d52823a332b48e6df14d2708b6a4b3833a4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Baruch Siach):
 - Fix title typo

 package/binutils/Config.in.host | 6 +++---
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 36436c0b27..bc7dc4443c 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -5,7 +5,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 	default y
 	depends on !BR2_microblaze
 
-config BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
+config BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
 	bool
 
 choice
@@ -17,18 +17,18 @@ choice
 
 config BR2_BINUTILS_VERSION_2_39_X
 	bool "binutils 2.39"
+	select BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
 
 config BR2_BINUTILS_VERSION_2_40_X
 	bool "binutils 2.40"
-	select BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
 
 config BR2_BINUTILS_VERSION_2_41_X
 	bool "binutils 2.41"
-	select BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
 
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.34.50)"
 	depends on BR2_arc
+	select BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
 
 endchoice
 
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index ecb00077d6..4bc1b69fa0 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -105,7 +105,7 @@ endif
 # our TARGET_CONFIGURE_ARGS are taken into consideration for those
 BINUTILS_MAKE_ENV = $(TARGET_CONFIGURE_ARGS)
 
-ifeq ($(BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME),y)
+ifeq ($(BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME),)
 define BINUTILS_INSTALL_STAGING_LIBSFRAME
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libsframe DESTDIR=$(STAGING_DIR) install
 endef
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
