Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B7AC02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 09:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A4AB81DFA;
	Mon,  3 Feb 2025 09:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SONgZK1zKMEo; Mon,  3 Feb 2025 09:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 367BD81DFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 367BD81DFE;
	Mon,  3 Feb 2025 09:34:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0C5112A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 09:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82AC160673
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 09:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFHaYAJz8uGj for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 09:34:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4981D60667
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4981D60667
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4981D60667
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 09:34:12 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so3726881f8f.0
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 01:34:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738575250; x=1739180050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1o71E2WaUnzKv5hg27z/ydd46Spc7IbqUu5bdSYXYPs=;
 b=emVhFaGuQSCM3sMnwt7ROGCpVNPENFRbcwY+k8T2SyVEjFfPZ3Yj67pIgghNoZmAmi
 97h2pHMy98cnAFuQlv+4IBEYYqBDpUL3mR/X6XBm9KqPfxTe97b7yv3QSN+errkTMoFo
 /luzaeDA/nwRKHiI3aZKQ1Ri83scLbDGhMzm2US8KJznVA8tlsG7WU6pdir58WhjXiQd
 0RMkZsePZmPr05W5FA+Ha3sp837ZvqOm26wvaRXriVT7mDGbhM2AGIOWMGee2nY+Vcnd
 DVD8j4UOTQ5SuajCCqxoQ+nCTesFQZVi8w3MwCC8OnhBZBto7vnnID2LM5y05dvlHIwu
 lXCQ==
X-Gm-Message-State: AOJu0YwcIxG6FDtf39Bea79VYvKeW6uMRfWDTcTzgrgdJaomikaBhXoY
 l6vIBRZVd4Xafjn31LfPf96uECAYLmPxo/3gB+Sm/Vl/GwLojGwkC2h9BOOIlrA=
X-Gm-Gg: ASbGnctLnT/H7IYdFUoJymSwef7apxn0q1N3Z8o5LrZSh6W3sPzvWhPnqczLidFo+ze
 lju2+UGOlBBnkpuMIt/a/S7ueu1EzWng6qMl8s4tVV0WEiJYOWfHwj79mhHliT61IhPUvPCZvo5
 Y68ydpIWUN5mmqM8dy+FBDcb4W6Jwt/d5qjR/mYhDg63b/g54QqpqRGiuZsACWz+AfjR3VlaPK7
 v4HROefC6sD8JwryeE1P5uw3HSf58mDlwFkqjUlhgMmJmO8UB66GGfA4HssFCzB/Pu05kVe3C+G
 EP86WnYK93j0Cc8dJU2dy8CCSLqJ1aPP+mlz01hXmXgxKGBt3KSY
X-Google-Smtp-Source: AGHT+IGPyAuxbePNV1AMdS7Hv9HwIXUpuvG5LFczGw4C3XwOCAfpTPCb42RqeqwAdCMDQhifFi/0Pg==
X-Received: by 2002:a5d:6487:0:b0:38b:669d:4dd4 with SMTP id
 ffacd0b85a97d-38c5192f1f4mr16870465f8f.11.1738575250025; 
 Mon, 03 Feb 2025 01:34:10 -0800 (PST)
Received: from landeda.. (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c12193asm12147327f8f.49.2025.02.03.01.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 01:34:09 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Paul Cercueil <paul@crapouillou.net>
Date: Mon,  3 Feb 2025 10:34:07 +0100
Message-ID: <6246c5a629103772d6986edc70e15aa9d6aebe44.1738575233.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1738575233.git.yann.morin.1998@free.fr>
References: <cover.1738575233.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738575250; x=1739180050; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1o71E2WaUnzKv5hg27z/ydd46Spc7IbqUu5bdSYXYPs=;
 b=Xr6IaucmOrG4pzH/LSgsZhfW2Ado4Mt8Fsx0CUWoD1KdDYkkClNMWn39hGvHdoYIj+
 FEHxEbwyM7oKz/Adh08FFOVZW2Nbi8vSBLsE0hsm2ot7cNlZ2GF4RcYG012/1sexh+Qp
 vUrI9iDleilJ7/Ay2zoqCPrerZBb7qqjx920L4yPRHr/mSezbjMS5pt8lmNulCEVR6PV
 vWeT8N4InCmENT6GHKNzH6EoeB8HpRNOl3FB0KhQGVqwPAmEW1ikViaHsu5XCQCtxwkL
 1xb9JQjve5M+CZOPlq309BmUffZWDAFw576XEynwG2RaUZ43PiLz8Y6+q6zuyajrFmuN
 fEdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xr6Iaucm
Subject: [Buildroot] [PATCH 2/3] package/libserialport: update to 0.1.2
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

Drop the patch, that has been upstreamed as b2359c5c994c (libserialport:
Fix Linux files not compiled in with a toolchain for ucLinux).

Accordingly, drop the now superfluous autoreconf.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 .checkpackageignore                           |  1 -
 .../0001-uclinux-detection.patch              | 26 -------------------
 package/libserialport/libserialport.hash      |  2 +-
 package/libserialport/libserialport.mk        |  3 +--
 4 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 package/libserialport/0001-uclinux-detection.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 65d017116e..b8529e36fa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -711,7 +711,6 @@ package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.pat
 package/libsepol/0001-support-static-only.patch lib_patch.Upstream
 package/libserial/0001-SerialPort.cpp-fix-build-when-size_t-is-an-unsigned-.patch lib_patch.Upstream
 package/libserial/0002-SerialPort.cpp-don-t-use-high-baudrates-when-not-ava.patch lib_patch.Upstream
-package/libserialport/0001-uclinux-detection.patch lib_patch.Upstream
 package/libshdata/0001-backend-Add-missing-include-files.patch lib_patch.Upstream
 package/libshdata/0002-examples-stress_test-Fix-build-with-musl-libc.patch lib_patch.Upstream
 package/libsidplay2/0001-sidplay2-libs-2.1.1.patch lib_patch.Upstream
diff --git a/package/libserialport/0001-uclinux-detection.patch b/package/libserialport/0001-uclinux-detection.patch
deleted file mode 100644
index 7d7199c1f0..0000000000
--- a/package/libserialport/0001-uclinux-detection.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From faab9aa5879fab93556b7a3a6f24070eeb3cbf15 Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul.cercueil@analog.com>
-Date: Mon, 29 Aug 2016 11:11:01 +0200
-Subject: [PATCH] Fix Linux files not compiled in with a toolchain for ucLinux
-
-Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index f6b66e8..de6f5b9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -74,7 +74,7 @@ AC_DEFINE_UNQUOTED([SP_LIB_VERSION_REVISION], [$SP_LIB_VERSION_REVISION], [.])
- AC_DEFINE_UNQUOTED([SP_LIB_VERSION_AGE], [$SP_LIB_VERSION_AGE], [.])
- AC_DEFINE_UNQUOTED([SP_LIB_VERSION_STRING], ["$SP_LIB_VERSION"], [.])
- 
--AM_CONDITIONAL([LINUX], [test -z "${host_os##linux*}"])
-+AM_CONDITIONAL([LINUX], [test -z "${host_os##linux*}" || test -z "${host_os##uclinux*}"])
- AM_CONDITIONAL([WIN32], [test -z "${host_os##mingw*}" || test -z "${host_os##cygwin*}"])
- AM_CONDITIONAL([MACOSX], [test -z "${host_os##darwin*}"])
- AM_CONDITIONAL([FREEBSD], [test -z "${host_os##freebsd*}"])
--- 
-2.8.1
-
diff --git a/package/libserialport/libserialport.hash b/package/libserialport/libserialport.hash
index 39f0c8f1f0..5bf7823d63 100644
--- a/package/libserialport/libserialport.hash
+++ b/package/libserialport/libserialport.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4a2af9d9c3ff488e92fb75b4ba38b35bcf9b8a66df04773eba2a7bbf1fa7529d  libserialport-0.1.1.tar.gz
+sha256  5deb92b5ca72c0347b07b786848350deca2dcfd975ce613b8e0e1d947a4b4ca9  libserialport-0.1.2.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/libserialport/libserialport.mk b/package/libserialport/libserialport.mk
index 84d7a5315b..f3331db074 100644
--- a/package/libserialport/libserialport.mk
+++ b/package/libserialport/libserialport.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBSERIALPORT_VERSION = 0.1.1
+LIBSERIALPORT_VERSION = 0.1.2
 LIBSERIALPORT_SITE = http://sigrok.org/download/source/libserialport
 LIBSERIALPORT_LICENSE = LGPL-3.0+
 LIBSERIALPORT_LICENSE_FILES = COPYING
 LIBSERIALPORT_INSTALL_STAGING = YES
 LIBSERIALPORT_DEPENDENCIES = host-pkgconf
-LIBSERIALPORT_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
