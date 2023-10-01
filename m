Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0ACE748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 13:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C060A416A4;
	Sun,  1 Oct 2023 13:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C060A416A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3gsrUP3yD4e; Sun,  1 Oct 2023 13:05:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EABEC40AF4;
	Sun,  1 Oct 2023 13:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EABEC40AF4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B3691BF39F
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 13:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6541C40AF4
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 13:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6541C40AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6PHTkYwZuYB for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 13:05:07 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6210402A7
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 13:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6210402A7
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40566f8a093so125820285e9.3
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 06:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696165504; x=1696770304;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3qy5ssxAXE7n2r0flz+LHcqjjgsyip8HQ+XwXsm8Ucg=;
 b=Pg/er99kzJbsC9cEu3+mm9M7+Upq+kZ3AePumiTX/B+aeMZQ1aHp6XZmerYEccHaE6
 Yo87j5Qk2rwuYwtYFkpULcPUdrfzaCXTVPP4binbAoXtY+MTazFzXTGk/iu/EGwexgAO
 WnUIitBERFjGsv2bV1oTit+h2WCASTEsm+MBDr+/eYX5gyjo617sfxAgOScI3n3ybO4j
 rC0t4QYmyHZdwGvq9ydaO2Jv4h5WYHcko68/QHMe2UGusGEGDd8qqw9+iylMwfYVLTrl
 fRDNelZ+D64158/yHWgf59bClUXn70V/jxvExzXh43kTCwFuMvD1pxm4ipfwMIk+anoe
 EUgA==
X-Gm-Message-State: AOJu0YwCna94mJi3IgCa4KarheAVpTNHnKdYruf/mljFMZ+K0btIcNPU
 pgRScA0B/LAMr02cxee68Vt2oYjhrvg=
X-Google-Smtp-Source: AGHT+IFgMLLIMMDME5jpRZhZYcNHTyx76jqtxQ/GczQKp4PowqCudK6PlhermPZs+7Q1AzvjEzRwlQ==
X-Received: by 2002:a1c:7419:0:b0:401:be5a:989 with SMTP id
 p25-20020a1c7419000000b00401be5a0989mr7456908wmc.23.1696165504124; 
 Sun, 01 Oct 2023 06:05:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m17-20020a7bcb91000000b0040651505684sm5213877wmi.29.2023.10.01.06.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 06:05:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 15:04:59 +0200
Message-Id: <20231001130459.840149-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696165504; x=1696770304; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3qy5ssxAXE7n2r0flz+LHcqjjgsyip8HQ+XwXsm8Ucg=;
 b=ZBhdvfhcx9tsXMvSEuksBQqObfzKjIECY+BVWAt6R53HpzxViwByud8fU1jJCcTe6R
 4v7uVC+I4OpikLrBLpf4kwsWeM9S2kyfpiVhIL6aBV/ywtXRpV5RFpYx5CpsgWLHDHZ+
 LQRmqMvRVjvO3PfPAlARA1Lj0DeozVSzn1btUqqg14N9ziluJ6ApEV/jJPdRslOEvpAH
 gkOorDFISjPc3QnWpJLQoDR7R8gEULoSoKn9HRXMrzyTjmn3KPAlmdqLAqtZ9HBLhYoQ
 X58cv7QUWIGcX8qaLfQ3Ue/claVOdg/w+DdtVTObecaCNHKuPfI3Rh4nVgys09/ok6+M
 sFMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZBhdvfhc
Subject: [Buildroot] [PATCH 1/1] package/memcached: fix uclibc-ng build
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

Fix the following uclibc-ng build failure raised since bump to version
1.6.21 in commit 6ce55ab0ed3b7125cd11ecfe8c18aaf156b5f060 and
https://github.com/memcached/memcached/commit/875371a75cbf1f92350de2d1fa0fae4a35ed572b:

/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: memcached-thread.o: in function `thread_setname':
thread.c:(.text+0xea2): undefined reference to `pthread_setname_np'

Fixes:
 - http://autobuild.buildroot.org/results/e856d381f5ec7d2727f21c8bd46dacb456984416

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-fix-build-on-uclibc-ng.patch         | 64 +++++++++++++++++++
 package/memcached/memcached.mk                |  2 +
 2 files changed, 66 insertions(+)
 create mode 100644 package/memcached/0002-fix-build-on-uclibc-ng.patch

diff --git a/package/memcached/0002-fix-build-on-uclibc-ng.patch b/package/memcached/0002-fix-build-on-uclibc-ng.patch
new file mode 100644
index 0000000000..a5af7a2adb
--- /dev/null
+++ b/package/memcached/0002-fix-build-on-uclibc-ng.patch
@@ -0,0 +1,64 @@
+From c84e5e55e0e9e793849f721d30979242ed6a6ee3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 1 Oct 2023 14:12:38 +0200
+Subject: [PATCH] fix build on uclibc-ng
+
+Fix the following build failure with uclibc-ng raised since version
+1.6.18 and
+https://github.com/memcached/memcached/commit/875371a75cbf1f92350de2d1fa0fae4a35ed572b:
+
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: memcached-thread.o: in function `thread_setname':
+thread.c:(.text+0xea2): undefined reference to `pthread_setname_np'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e856d381f5ec7d2727f21c8bd46dacb456984416
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: unsent yet (waiting feedback on first patch)
+---
+ configure.ac | 1 +
+ extstore.c   | 2 +-
+ thread.c     | 2 +-
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d94f6fb..5ec5088 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -686,6 +686,7 @@ AC_CHECK_FUNCS(clock_gettime)
+ AC_CHECK_FUNCS(preadv)
+ AC_CHECK_FUNCS(pread)
+ AC_CHECK_FUNCS(eventfd)
++AC_CHECK_FUNCS([pthread_setname_np],[AC_DEFINE(HAVE_PTHREAD_SETNAME_NP, 1, [Define to 1 if support pthread_setname_np])])
+ AC_CHECK_FUNCS([accept4], [AC_DEFINE(HAVE_ACCEPT4, 1, [Define to 1 if support accept4])])
+ AC_CHECK_FUNCS([getopt_long], [AC_DEFINE(HAVE_GETOPT_LONG, 1, [Define to 1 if support getopt_long])])
+ 
+diff --git a/extstore.c b/extstore.c
+index b079465..f6a6180 100644
+--- a/extstore.c
++++ b/extstore.c
+@@ -119,7 +119,7 @@ struct store_engine {
+ #define THR_NAME_MAXLEN 16
+ static void thread_setname(pthread_t thread, const char *name) {
+ assert(strlen(name) < THR_NAME_MAXLEN);
+-#if defined(__linux__)
++#if defined(__linux__) && defined(HAVE_PTHREAD_SETNAME_NP)
+ pthread_setname_np(thread, name);
+ #endif
+ }
+diff --git a/thread.c b/thread.c
+index ee120fa..76651c2 100644
+--- a/thread.c
++++ b/thread.c
+@@ -635,7 +635,7 @@ static void thread_libevent_process(evutil_socket_t fd, short which, void *arg)
+ #define THR_NAME_MAXLEN 16
+ void thread_setname(pthread_t thread, const char *name) {
+ assert(strlen(name) < THR_NAME_MAXLEN);
+-#if defined(__linux__)
++#if defined(__linux__) && defined(HAVE_PTHREAD_SETNAME_NP)
+ pthread_setname_np(thread, name);
+ #endif
+ }
+-- 
+2.40.1
+
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 2ebc672d1c..a1a5eac049 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -13,6 +13,8 @@ MEMCACHED_LICENSE = BSD-3-Clause
 MEMCACHED_LICENSE_FILES = COPYING
 MEMCACHED_CPE_ID_VENDOR = memcached
 MEMCACHED_SELINUX_MODULES = memcached
+# We're patching configure.ac
+MEMCACHED_AUTORECONF = YES
 
 ifeq ($(BR2_ENDIAN),"BIG")
 MEMCACHED_CONF_ENV += ac_cv_c_endian=big
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
