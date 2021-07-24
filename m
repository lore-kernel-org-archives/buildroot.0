Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43127C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 22:19:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15D160E8B
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 22:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E15D160E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FCA9828F7;
	Sat, 24 Jul 2021 22:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8eM5gNssjjpT; Sat, 24 Jul 2021 22:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B15DB82E1A;
	Sat, 24 Jul 2021 22:19:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 558141BF2BA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 22:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3908382E1A
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 22:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTbmR3UvOgEm for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 22:19:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8F85828F7
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 22:19:30 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j2so6323000wrx.9
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 15:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5uJRjcDFIyLLeIIUO54Sgp7ufW5EycqR43PcTt3JGk=;
 b=KxzhQCfRx9yo91mkOXl0pzEPtMv5tpzeayd4C+PbJAGso2VmfLqw1O4P+BNOm+iFKm
 qKLqI92osipM+M7PzCbe3og2zZmQq9pAmlQG56QXp+6bfFqiL7IPIlLaeCMJhgacHwxb
 fpmomBWIMBskYgqKX1NfMNIO8yUxPQmhvso798XKLRubmCJxDIPRzGwhYQR2pcQ8RSEv
 7R2rDJPE5c7zvw0d8pErrxJFMc9qRMswBhHbwKgrpLFnMVDa72Vrx7UkVPwPH+fCGIWx
 S4RDbiBtFdpNeVPiWYd7uUQ7Y5K4WEEvJ1M18ExLrQSVUMOBPyp65SIoSecd313b1+0c
 zFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5uJRjcDFIyLLeIIUO54Sgp7ufW5EycqR43PcTt3JGk=;
 b=tueTo7dK4+RyO9DGm55itw5dvl3vM2lhkzRSPo7tqDpwcpIYhVeJ2PSWGWIZRtYwkP
 PQUiv5X1l2CyaiZ7snjNhXm5srrvjP57HxmhFVKxA5MCX9yiC+nv6q/3AeYH35WeC/pQ
 7xO77ak5JoyCs7z4xvEwN/KKc1pr64DtzVBxd1I4gWmx3FVh3JAIHYUV+SK7mEpEAYJy
 et6m7WgELh/daKRTUImDZkSs8vzzac5SFTyPpnIaWp0Li8RTzw87zT+70C8z/vPyzjcm
 y7IvTjODm9rnEaIVXrQgOp61X91ACRfiStu3OvxWQPghy0MF6itHPFhPIiN4/w3/Y1fF
 MqVg==
X-Gm-Message-State: AOAM5303rTGbeJWZxjePaNJY4a6KI88zUMKcZUNEVPVdHNbMs7v2DyNk
 RfYGRdRvBUOx5nkENnKrXiPbkocezDWmug==
X-Google-Smtp-Source: ABdhPJwCY1RoiM04pO53J2Ue55Cpt4O60oT1s0g8w7FbHRen0U72vQ8L0QzEMYBr3r+2ZDd3GDJ8SQ==
X-Received: by 2002:a5d:424d:: with SMTP id s13mr1928825wrr.356.1627165168628; 
 Sat, 24 Jul 2021 15:19:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id l14sm35250215wrs.22.2021.07.24.15.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 15:19:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 00:18:50 +0200
Message-Id: <20210724221850.764936-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libffi: bump to version 3.4.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

- Use official tarball
- Drop fourth to seventh patches (already in version)
- Update hash of LICENSE file (update in year:
  https://github.com/libffi/libffi/commit/2bdc8e52efb78d939f23efb4f9c515355610bff5
  https://github.com/libffi/libffi/commit/b844a9c7f1ca792a1dfb0c09d5dae576178e6729)
- Update indentation in hash file (two spaces)

https://github.com/libffi/libffi/blob/v3.4.2/README.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...pc.h-fix-build-failure-with-powerpc7.patch | 51 -------------------
 ...ix-build-failure-on-power7-and-older.patch | 39 --------------
 ...6-Address-platforms-with-no-__int128.patch | 28 ----------
 ...y-to-help-platforms-with-no-__int128.patch | 42 ---------------
 package/libffi/libffi.hash                    |  4 +-
 package/libffi/libffi.mk                      |  7 +--
 6 files changed, 6 insertions(+), 165 deletions(-)
 delete mode 100644 package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
 delete mode 100644 package/libffi/0005-powerpc-fix-build-failure-on-power7-and-older.patch
 delete mode 100644 package/libffi/0006-Address-platforms-with-no-__int128.patch
 delete mode 100644 package/libffi/0007-powerpc64-Use-memcpy-to-help-platforms-with-no-__int128.patch

diff --git a/package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch b/package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
deleted file mode 100644
index 7ee1f1029e..0000000000
--- a/package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From f9d8f11d60cdc656a801e0d8116101beb22e117b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 24 Nov 2019 09:52:01 +0100
-Subject: [PATCH] ffi_powerpc.h: fix build failure with powerpc7
-
-Sicne commit 73dd43afc8a447ba98ea02e9aad4c6898dc77fb0, build on powerpc7
-fails on:
-
-In file included from ../src/powerpc/ffi.c:33:0:
-../src/powerpc/ffi_powerpc.h:61:9: error: '_Float128' is not supported on this target
- typedef _Float128 float128;
-         ^~~~~~~~~
-
-Fix this build failure by checking for __HAVE_FLOAT128 before using
-_Float128, as _Float128 is enabled only on specific conditions, see
-output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/bits/floatn.h:
-
- /* Defined to 1 if the current compiler invocation provides a
-    floating-point type with the IEEE 754 binary128 format, and this glibc
-    includes corresponding *f128 interfaces for it.  */
- #if defined _ARCH_PWR8 && defined __LITTLE_ENDIAN__ && (_CALL_ELF == 2) \
-     && defined __FLOAT128__ && !defined __NO_LONG_DOUBLE_MATH
- # define __HAVE_FLOAT128 1
- #else
- # define __HAVE_FLOAT128 0
- #endif
-
-Fixes:
- - http://autobuild.buildroot.org/results/5c9dd8fb3b6a128882b6250f197c80232d8a3b53
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/powerpc/ffi_powerpc.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/powerpc/ffi_powerpc.h b/src/powerpc/ffi_powerpc.h
-index 5ee2a70..a5a786b 100644
---- a/src/powerpc/ffi_powerpc.h
-+++ b/src/powerpc/ffi_powerpc.h
-@@ -57,7 +57,7 @@ typedef union
-   double d;
- } ffi_dblfl;
- 
--#if defined(__FLOAT128_TYPE__)
-+#if defined(__FLOAT128_TYPE__) && defined(__HAVE_FLOAT128)
- typedef _Float128 float128;
- #elif defined(__FLOAT128__)
- typedef __float128 float128;
--- 
-2.24.0
-
diff --git a/package/libffi/0005-powerpc-fix-build-failure-on-power7-and-older.patch b/package/libffi/0005-powerpc-fix-build-failure-on-power7-and-older.patch
deleted file mode 100644
index d0b91dda68..0000000000
--- a/package/libffi/0005-powerpc-fix-build-failure-on-power7-and-older.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 01a75ed76ea7e57f1b7a5c183e2b1e890e6aa0fd Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Thu, 28 Nov 2019 12:42:41 +0000
-Subject: [PATCH] powerpc: fix build failure on power7 and older (#532)
-
-Build failure looks as:
-```
-libtool: compile:  powerpc-unknown-linux-gnu-gcc \
-    -O2 -mcpu=powerpc -mtune=powerpc -pipe ... -c src/powerpc/ffi.c ...
-In file included from src/powerpc/ffi.c:33:
-src/powerpc/ffi_powerpc.h:65:9: error: '__int128' is not supported on this target
-   65 | typedef __int128 float128;
-      |         ^~~~~~~~
-```
-
-The fix avoids using __int128 in favour of aligned char[16].
-
-Closes: https://github.com/libffi/libffi/issues/531
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
-[Retrieved from:
-https://github.com/libffi/libffi/commit/01a75ed76ea7e57f1b7a5c183e2b1e890e6aa0fd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/powerpc/ffi_powerpc.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/powerpc/ffi_powerpc.h b/src/powerpc/ffi_powerpc.h
-index 5ee2a709..8e2f2f0e 100644
---- a/src/powerpc/ffi_powerpc.h
-+++ b/src/powerpc/ffi_powerpc.h
-@@ -62,7 +62,7 @@ typedef _Float128 float128;
- #elif defined(__FLOAT128__)
- typedef __float128 float128;
- #else
--typedef __int128 float128;
-+typedef char float128[16] __attribute__((aligned(16)));
- #endif
- 
- void FFI_HIDDEN ffi_closure_SYSV (void);
diff --git a/package/libffi/0006-Address-platforms-with-no-__int128.patch b/package/libffi/0006-Address-platforms-with-no-__int128.patch
deleted file mode 100644
index 012c6f0dae..0000000000
--- a/package/libffi/0006-Address-platforms-with-no-__int128.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6663047f56c2932a6b10a790f4ac6666dd181326 Mon Sep 17 00:00:00 2001
-From: Anthony Green <green@moxielogic.com>
-Date: Fri, 29 Nov 2019 07:00:35 -0500
-Subject: [PATCH] Address platforms with no __int128.
-
-[Retrieved from:
-https://github.com/libffi/libffi/commit/6663047f56c2932a6b10a790f4ac6666dd181326]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/powerpc/ffi_linux64.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/powerpc/ffi_linux64.c b/src/powerpc/ffi_linux64.c
-index de0d0337..73647701 100644
---- a/src/powerpc/ffi_linux64.c
-+++ b/src/powerpc/ffi_linux64.c
-@@ -547,9 +547,9 @@ ffi_prep_args64 (extended_cif *ecif, unsigned long *const stack)
-               if (next_arg.ul == gpr_end.ul)
-                 next_arg.ul = rest.ul;
-               if (vecarg_count < NUM_VEC_ARG_REGISTERS64 && i < nfixedargs)
--                *vec_base.f128++ = **p_argv.f128;
-+		memcpy (vec_base.f128++, *p_argv.f128, sizeof (float128));
-               else
--                *next_arg.f128 = **p_argv.f128;
-+		memcpy (next_arg.f128, *p_argv.f128, sizeof (float128));
-               if (++next_arg.f128 == gpr_end.f128)
-                 next_arg.f128 = rest.f128;
-               vecarg_count++;
diff --git a/package/libffi/0007-powerpc64-Use-memcpy-to-help-platforms-with-no-__int128.patch b/package/libffi/0007-powerpc64-Use-memcpy-to-help-platforms-with-no-__int128.patch
deleted file mode 100644
index 53036707d2..0000000000
--- a/package/libffi/0007-powerpc64-Use-memcpy-to-help-platforms-with-no-__int128.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From e50b9ef8b910fa642ef158f6642e60d54d7ad740 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 7 Dec 2019 02:34:14 -0800
-Subject: [PATCH] powerpc64: Use memcpy to help platforms with no __int128.
- (#534)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Retrieved from:
-https://github.com/libffi/libffi/commit/e50b9ef8b910fa642ef158f6642e60d54d7ad740]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/powerpc/ffi_linux64.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/powerpc/ffi_linux64.c b/src/powerpc/ffi_linux64.c
-index 73647701..4d50878e 100644
---- a/src/powerpc/ffi_linux64.c
-+++ b/src/powerpc/ffi_linux64.c
-@@ -680,9 +680,9 @@ ffi_prep_args64 (extended_cif *ecif, unsigned long *const stack)
-                     {
-                       if (vecarg_count < NUM_VEC_ARG_REGISTERS64
-                           && i < nfixedargs)
--                        *vec_base.f128++ = *arg.f128++;
-+		        memcpy (vec_base.f128++, arg.f128, sizeof (float128));
-                       else
--                        *next_arg.f128 = *arg.f128++;
-+		        memcpy (next_arg.f128, arg.f128++, sizeof (float128));
-                       if (++next_arg.f128 == gpr_end.f128)
-                         next_arg.f128 = rest.f128;
-                       vecarg_count++;
-@@ -986,9 +986,9 @@ ffi_closure_helper_LINUX64 (ffi_cif *cif,
-                   do
-                     {
-                       if (pvec < end_pvec && i < nfixedargs)
--                        *to.f128 = *pvec++;
-+		        memcpy (to.f128, pvec++, sizeof (float128));
-                       else
--                        *to.f128 = *from.f128;
-+		        memcpy (to.f128, from.f128, sizeof (float128));
-                       to.f128++;
-                       from.f128++;
-                     }
diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 496ae0d904..cf1977c40d 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	3f2f86094f5cf4c36cfe850d2fe029d01f5c2c2296619407c8ba0d8207da9a6b  libffi-3.3.tar.gz
+sha256  540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9e93620  libffi-3.4.2.tar.gz
 # License files, locally calculated
-sha256	deaf3a42effb551a5b140fa9afefed183a27f1341c6d1bf430d106a5e6931fc0  LICENSE
+sha256  a61d06e8f7be57928e71e800eb9273b05cb8868c484108afe41e4305bb320dde  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index c7705b9e46..0ef2786988 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.3
-LIBFFI_SITE = $(call github,libffi,libffi,v$(LIBFFI_VERSION))
-LIBFFI_CPE_ID_UPDATE = rc0
+LIBFFI_VERSION = 3.4.2
+LIBFFI_SITE = \
+	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
 LIBFFI_INSTALL_STAGING = YES
+# We're patching Makefile.am
 LIBFFI_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
