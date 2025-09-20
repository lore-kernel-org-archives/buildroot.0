Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F23CAC5A0
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 11:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 859E7615E3;
	Sat, 20 Sep 2025 11:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYD-Ag9Z8_Lq; Sat, 20 Sep 2025 11:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EC5F615D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EC5F615D9;
	Sat, 20 Sep 2025 11:13:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2961D7F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 998D6614B8
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4IclZqon3A2 for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 11:13:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 526766133B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 526766133B
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 526766133B
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:13:11 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-62f4a8dfadcso3460080a12.1
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 04:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758366789; x=1758971589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4jFsBcN6kprcNVT/Skq1F41EQ7EjefdR+TGHkLBOSag=;
 b=v0zMjwZ0xSGvOupIQka7YX0TLQ7mWup99R+0trzm/rbU9SRlFNA2hbIVwjfuOYji/8
 AVhRIRF0I6RxNQeSyB1GqgugRy6nxQeRg5ESkdgpmcfo64xxnGYbxti7+M/DW9fb9rnr
 rlNRyeQvgGZIE6uAhuP0H+uxlUPctJSWOZwbUIFCxXN5vg3UfoXKFn3keDcwDKN0aRQc
 2p5WuXsoUu6RS3T5vxBVSQIUDecHDFrzaryKSG3s3Z1/a6T21XTHqF9wpDcxBXrvbOAm
 361z+R3GDnf0Shomp4HRYeJahM/N4glhMNFVfpJsjIksWSJO4+WTPsQvXVPLQpvd4FI/
 A27g==
X-Gm-Message-State: AOJu0YwnHuMLA8KJ/6upgEPkZeRGQtZNnj/Mpnd9uDqknVmsG/Ap5Cw6
 Si7lHMhtZQwu5qLRAup2vYRFyDK6Fda7vKrkQUw0aDTkKgcxK167K38qOIQ0o/HZbdtNahddD0M
 eC0Kx
X-Gm-Gg: ASbGnct/931kbzyVFZAv7x7K8O12wDm9IcrhKwJJY+/S3BL/aI5mY/Kw9yFPX9yEZrV
 nHPc4k3h2chyEeNTD5oqzWW1OTDvkcpmSFyTpCJXWMDuEJ5YBRaITye/M2bzdBr9zPTe/pT9U5W
 3lVTLjAX/ovu0U9xN8zzObbbqUIwsWx+3I65NY0dh5HU1jGBkocqFjs50iopbw9k2Cz0HvurNYN
 YB1FOjXliO5YqIEQbP+VMmraou73BdtMi3DUL4YfzIiob2x3WVN9SgtHpMtJHKTgUq6m3s/Anio
 aq/X9kbLHNIuYmhzFwKHu/1VXNX3xBBejogjNaEmeB1fvMAzfXlnd6AFjObr15LPbBtZZY/tFAX
 9c+pVIgaF4DTkRW2nloAYzmNPDCvdvc2ue1tZWU7NNNLuUZpzMD14xOcu2GeFQ1vssSj4hAUW/g
 HaYDCgDhtJ9T11hNx/zqg+rIkQCbrwZtvgbZqCfV5UcT+aGvjf5BFyr05wLxlf8DED
X-Google-Smtp-Source: AGHT+IHzeXuFt6LaWPlfxHU6D3IRaXzlht48A4xYIZZayFGCc4Cua3iIvb10XnRqOA68TNCHNhTF9w==
X-Received: by 2002:a05:6402:27cb:b0:631:fe26:a661 with SMTP id
 4fb4d7f45d1cf-631fe26af8dmr631734a12.3.1758366788915; 
 Sat, 20 Sep 2025 04:13:08 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fa5d17efdsm4884874a12.15.2025.09.20.04.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 04:13:08 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 20 Sep 2025 13:12:43 +0200
Message-ID: <20250920111244.2575859-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758366789; x=1758971589;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4jFsBcN6kprcNVT/Skq1F41EQ7EjefdR+TGHkLBOSag=;
 b=mw9g45tsExqGYau4LPmgx4ZNaRNpzC0783DKGp1wuuznqDtaUmyyg1hr0RRmyfdT0P
 45FALim12qqIGNy8mBmHjsbFkezh1WoGd8tTIq4vq23Piy3srxOONRfBCxYtG51rssey
 QBtD21k6hKfyeqrNXC8WHAn0LAAY4hwXYbZH0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=mw9g45ts
Subject: [Buildroot] [PATCH 1/2] package/cmocka: bump to version 1.1.8
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The removed patch has been merged in version 1.1.6.

Release notes:
https://gitlab.com/cmocka/cmocka/-/tags/cmocka-1.1.6
https://gitlab.com/cmocka/cmocka/-/tags/cmocka-1.1.7
https://gitlab.com/cmocka/cmocka/-/tags/cmocka-1.1.8

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                           |  1 -
 .../0001-Don-t-redefine-uintptr_t.patch       | 77 -------------------
 package/cmocka/cmocka.hash                    |  2 +-
 package/cmocka/cmocka.mk                      |  2 +-
 4 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 package/cmocka/0001-Don-t-redefine-uintptr_t.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index d8d0bc6969fe..17deae937c7e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -292,7 +292,6 @@ package/chipmunk/0001-Fix-build-failure-on-musl.patch lib_patch.Upstream
 package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch lib_patch.Upstream
 package/chrony/S49chronyd lib_sysv.Variables
 package/cmake/0001-rename-cmake-rootfile.patch lib_patch.Upstream
-package/cmocka/0001-Don-t-redefine-uintptr_t.patch lib_patch.Upstream
 package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch lib_patch.Upstream
 package/connman/S45connman lib_sysv.Variables
 package/copas/0001-Do-not-load-coxpcall-for-LuaJIT.patch lib_patch.Upstream
diff --git a/package/cmocka/0001-Don-t-redefine-uintptr_t.patch b/package/cmocka/0001-Don-t-redefine-uintptr_t.patch
deleted file mode 100644
index 4123d8db22da..000000000000
--- a/package/cmocka/0001-Don-t-redefine-uintptr_t.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 28ce16b29911e5adc60140b572dee177adc7a178 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 18 Nov 2019 18:56:46 +0100
-Subject: [PATCH] Don't redefine uintptr_t
-
-Add a call to check_type_size in ConfigureChecks.cmake and use it in
-include/cmocka.h to avoid the following redefinition error on riscv64:
-
-In file included from /data/buildroot/buildroot-test/instance-0/output/build/cmocka-1.1.5/src/cmocka.c:62:
-/data/buildroot/buildroot-test/instance-0/output/build/cmocka-1.1.5/include/cmocka.h:132:28: error: conflicting types for 'uintptr_t'
-       typedef unsigned int uintptr_t;
-                            ^~~~~~~~~
-In file included from /data/buildroot/buildroot-test/instance-0/output/host/riscv64-buildroot-linux-musl/sysroot/usr/include/stdint.h:20,
-                 from /data/buildroot/buildroot-test/instance-0/output/host/riscv64-buildroot-linux-musl/sysroot/usr/include/inttypes.h:9,
-                 from /data/buildroot/buildroot-test/instance-0/output/build/cmocka-1.1.5/src/cmocka.c:27:
-/data/buildroot/buildroot-test/instance-0/output/host/riscv64-buildroot-linux-musl/sysroot/usr/include/bits/alltypes.h:104:24: note: previous declaration of 'uintptr_t' was here
- typedef unsigned _Addr uintptr_t;
-                        ^~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/30922c18150ea62aefe123d1b7cd1444efab963f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
-[Retrieved from:
-https://gitlab.com/cmocka/cmocka/commit/28ce16b29911e5adc60140b572dee177adc7a178]
----
- ConfigureChecks.cmake | 3 +++
- config.h.cmake        | 4 ++++
- include/cmocka.h      | 2 +-
- 3 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/ConfigureChecks.cmake b/ConfigureChecks.cmake
-index fe8da35..028774f 100644
---- a/ConfigureChecks.cmake
-+++ b/ConfigureChecks.cmake
-@@ -70,6 +70,9 @@ if (HAVE_TIME_H)
-     check_struct_has_member("struct timespec" tv_sec "time.h" HAVE_STRUCT_TIMESPEC)
- endif (HAVE_TIME_H)
- 
-+# TYPES
-+check_type_size(uintptr_t UINTPTR_T)
-+
- # FUNCTIONS
- check_function_exists(calloc HAVE_CALLOC)
- check_function_exists(exit HAVE_EXIT)
-diff --git a/config.h.cmake b/config.h.cmake
-index f8d79da..55fc69f 100644
---- a/config.h.cmake
-+++ b/config.h.cmake
-@@ -75,6 +75,10 @@
- 
- #cmakedefine HAVE_STRUCT_TIMESPEC 1
- 
-+/***************************** TYPES *****************************/
-+
-+#cmakedefine HAVE_UINTPTR_T 1
-+
- /*************************** FUNCTIONS ***************************/
- 
- /* Define to 1 if you have the `calloc' function. */
-diff --git a/include/cmocka.h b/include/cmocka.h
-index 3e923dd..0aa557e 100644
---- a/include/cmocka.h
-+++ b/include/cmocka.h
-@@ -120,7 +120,7 @@ typedef uintmax_t LargestIntegralType;
-     ((LargestIntegralType)(value))
- 
- /* Smallest integral type capable of holding a pointer. */
--#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED)
-+#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED) && !defined(HAVE_UINTPTR_T)
- # if defined(_WIN32)
-     /* WIN32 is an ILP32 platform */
-     typedef unsigned int uintptr_t;
--- 
-2.22.0
-
diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
index 74d67d6ecb6c..8dc0532388dc 100644
--- a/package/cmocka/cmocka.hash
+++ b/package/cmocka/cmocka.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f0ccd8242d55e2fd74b16ba518359151f6f8383ff8aef4976e48393f77bba8b6  cmocka-1.1.5.tar.xz
+sha256  58435b558766d7f4c729ba163bdf3aec38bed3bc766dab684e3526ed0aa7c780  cmocka-1.1.8.tar.xz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index 297f95f46504..04a0640f4cbd 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CMOCKA_VERSION = 1.1.5
+CMOCKA_VERSION = 1.1.8
 CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
 CMOCKA_SITE = https://cmocka.org/files/1.1
 CMOCKA_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
