Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C227C46CA1
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 20:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 256724159D;
	Mon, 18 Sep 2023 20:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 256724159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ihABJZWZJE_g; Mon, 18 Sep 2023 20:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE65F415C3;
	Mon, 18 Sep 2023 20:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE65F415C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 552FB1BF39C
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3189C41599
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3189C41599
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id abEJcUm8KnfC for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 20:53:02 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 040DB400BF
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 040DB400BF
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-401da71b85eso54977385e9.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 13:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695070380; x=1695675180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=64EnwUm021S0kanukNeY+I+YOQ1GCpjXyIVI+DD0clc=;
 b=IH15fM+caVugJ9ZeXm45ZarcuiMjZ6RF+MRnoXlL4UrccIySbQCkFyu8HU/V7eKpYD
 AqgdnRbJA3iGoQsQp9JywzubIkphiQn3pAlgl4YUgm6ZU+u44zLE0MR4V0iJHZl2g8Wk
 ILy7I4w4Q6ZFR1ilRNLVjmdogn9jRvJePoFtt9LkTYE9x1xJf74bwXjfRAkHvnjzYOhN
 FvMA/elKw/V5f8UPIVjToNgfBvDM5DJgr7TKvIs0ePR+6/25pzRt/Y9xrsnGII9HFHnA
 cTN3l9i8BAotyvapZ+pf6ISozdydPoCiGvkxArMkLyYswoSoDWLFiUVPh0Ul1Qm2cQpH
 WY7Q==
X-Gm-Message-State: AOJu0YyGkfeqP/3p8CM9hYMIYKCI3afwPK9+JMhtgIEPLIDwZPEA5ri+
 mRrXcx2EeLW3V+G4GTMJO3NUVflSfGk=
X-Google-Smtp-Source: AGHT+IE9OXk8LQaN0IFY7+ZdkXHrVm7E/lnmlhJisxIDFKg4kSpcPiGxnIBLMC8geMSosttklw4TTA==
X-Received: by 2002:a7b:cb88:0:b0:3fb:e2af:49f6 with SMTP id
 m8-20020a7bcb88000000b003fbe2af49f6mr7995766wmi.39.1695070379686; 
 Mon, 18 Sep 2023 13:52:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m10-20020a7bcb8a000000b003fed7fa6c00sm16393210wmi.7.2023.09.18.13.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:52:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 22:52:55 +0200
Message-Id: <20230918205255.2850663-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695070380; x=1695675180; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=64EnwUm021S0kanukNeY+I+YOQ1GCpjXyIVI+DD0clc=;
 b=ms89ZFwGY4PktDNZDspcLRPQxXQDB3VJfIwqrecCrCtCE8lLHjw/JuwvyReSmBaIUA
 rOrgjzSG2Unexskg7xf7CFq4q3AqSjE9xhUqX95p6CZ2MwL1X3e9AKzX4DVRBVUEXd+r
 sC3IhxXHIcBiwgjlwbpQG80gvlKiteVuYRKC+OA+n+W332vZjKuImdgNx/Q+/jOZvkdV
 pZBvJU98CMpZZku02/M2HAPqYaM9XVlcqYTWyvObkDnTPDRpI4/pKzs6eNFjj7rJw1LI
 Ql0tijT+TMiyGc/xw5FJZUHT3aHTl+Ffu3jozNhULossBvdd5E87hINOxC+ZKlKlgHOU
 601g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ms89ZFwG
Subject: [Buildroot] [PATCH 1/1] package/binutils: fix install of libstrace
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
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
