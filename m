Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A96CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 15:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC352400D7;
	Sun, 24 Sep 2023 15:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC352400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixJL7h6BwZmQ; Sun, 24 Sep 2023 15:45:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EF1140913;
	Sun, 24 Sep 2023 15:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EF1140913
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6B01BF3E8
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9B4C80E8C
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9B4C80E8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HkkqQMdTLqPH for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 15:45:15 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C14F80E87
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 15:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C14F80E87
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-401187f8071so33989735e9.0
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 08:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695570313; x=1696175113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G2lQaEqMqJwjfDE5zcQINC7+AyE/IoMTNjLsw+ptVwg=;
 b=ZXBD7yK9a5Pj9uTOkpLC1m5izVcsQxl1idiBPWGAJLn0eJFNAQ22wi4P1WXW0Pj4tk
 w7HyXVovBYnrqhHQEbqhFDiG8NA1gtLeGIqcnr9Bome9SQ3tmYt+4mzDOsFljMk+J79M
 77qVwpqrLQa6neyiYQ3EY7ZdllDbaOiaN7yZ86NARMEWWo8zmTaaPBj4s6Uwp5Ko9dnl
 tcTw7USCwLBY8ZnBu/WhZJ1oqd0d5GmdpA9KTdSTdd0CeLoyNYWyKHfcHTNFbGeYHzin
 o7plDBTw+0cX5zlt45QWmOxYUdEYvBrcWE1DM5o1JwNk8o13IrtJ6Rm33yvb6puOdjrS
 UFhA==
X-Gm-Message-State: AOJu0YwbHuwW+hvBaUX1DQr34+WNoHTMf1GALyTRLJ+WPY273GdRq4cY
 ruRY8InbBfUT2gwHwMbsFDYIcyqJmy4=
X-Google-Smtp-Source: AGHT+IFg4kJ9k38wW9DY5I7fzJuDhWBKpY0x8mEIdAt3UiNS5MzZxTw2TPOedUSrvVGLj/g8vpH7ag==
X-Received: by 2002:a05:600c:cf:b0:401:609f:7f9a with SMTP id
 u15-20020a05600c00cf00b00401609f7f9amr5809019wmm.8.1695570312540; 
 Sun, 24 Sep 2023 08:45:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m15-20020a7bce0f000000b003fed4fa0c19sm12745003wmc.5.2023.09.24.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 08:45:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 17:45:06 +0200
Message-Id: <20230924154506.830383-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695570313; x=1696175113; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G2lQaEqMqJwjfDE5zcQINC7+AyE/IoMTNjLsw+ptVwg=;
 b=BK5Ib2tm3DuXePNU4hyyyp/lnv4woX/77Y2iyHLQ9PX0rh/fvB9Io/TwaTmUSJL9bJ
 vf05OEwyh/zr+R0OcCQlOpkN8zhZnMjRKwKqGlK0FLWS9H48XTR0svt1ekEPDHyfjfwG
 W44Of1IplNlg5PA7NAFDw4xio7YJOOQPRuUMrra1R8Bhj4o7R6U7AqdbeGvugUolVs2z
 FaCSAwyLzsTkGMKzGvGrjjeu9t/bkX8uHB+u4Kwd2WHPqPoLWnkRUeYg23y+xRXwwSxN
 mDcUsWgQBTGR6IAdygheC0BZ0vqJVil0Os1XJsc6kQzAtCdY+qxIeLHo0HZxJOhD9nIj
 TF2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BK5Ib2tm
Subject: [Buildroot] [PATCH 1/1] package/liburcu: bump to version 0.14.0
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Alexander Egorenkov <egorenar-dev@posteo.net>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop second and third patches (already in version)
- C++ is mandatory since
  https://github.com/urcu/userspace-rcu/commit/153b081a9b007aad7bece415dc3bf1125edd2da3

https://github.com/urcu/userspace-rcu/blob/v0.14.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  2 -
 ...ix-don-t-use-C-thread_local-on-MacOs.patch | 41 --------------
 ...-Thread-local-storage-except-on-MSVC.patch | 53 -------------------
 package/liburcu/Config.in                     |  6 ++-
 package/liburcu/liburcu.hash                  |  4 +-
 package/liburcu/liburcu.mk                    |  2 +-
 package/lttng-libust/Config.in                |  6 ++-
 package/lttng-tools/Config.in                 |  6 ++-
 package/multipath-tools/Config.in             |  6 ++-
 package/netsniff-ng/Config.in                 |  4 +-
 package/xfsprogs/Config.in                    |  6 ++-
 11 files changed, 26 insertions(+), 110 deletions(-)
 delete mode 100644 package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch
 delete mode 100644 package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 8ca197df63..0a6e1672c6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -786,8 +786,6 @@ package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.pa
 package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch Upstream
 package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch Upstream
 package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch Upstream
-package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch Upstream
-package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch Upstream
 package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch Upstream
 package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch Upstream
 package/libuwsc/0002-fix-bad-indentation.patch Upstream
diff --git a/package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch b/package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch
deleted file mode 100644
index 002df34d70..0000000000
--- a/package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From e915ab84fd0c02d37504f3eb1e1f3be93ea6dc37 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Thu, 9 Sep 2021 12:11:16 -0400
-Subject: [PATCH] fix: don't use C++ thread_local on MacOs
-
-Recent versions of Apple's clang++ do support 'thread_local' but the
-implementation generates additional helper symbols. This is a problem
-when accessing an extern TLS variable in a C++ compile unit that is
-provided by a C library that doesn't have those extra symbols.
-
-Fallback to using '__thread' on MacOs.
-
-Change-Id: I87cb5b3c9293f7bf66f7115f453b546dd793a449
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-
-[Retrieved from:
-https://github.com/urcu/userspace-rcu/commit/e915ab84fd0c02d37504f3eb1e1f3be93ea6dc37]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/urcu/tls-compat.h | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/include/urcu/tls-compat.h b/include/urcu/tls-compat.h
-index 24ef1b9a..25cf375a 100644
---- a/include/urcu/tls-compat.h
-+++ b/include/urcu/tls-compat.h
-@@ -34,7 +34,12 @@ extern "C" {
- 
- #ifdef CONFIG_RCU_TLS
- 
--#if defined (__cplusplus) && (__cplusplus >= 201103L)
-+/*
-+ * Don't use C++ 'thread_local' on MacOs, the implementation is incompatible
-+ * with C and will result in a link error when accessing an extern variable
-+ * provided by the C library from C++ code.
-+ */
-+#if defined (__cplusplus) && (__cplusplus >= 201103L) && !defined(__APPLE__)
- # define URCU_TLS_STORAGE_CLASS	thread_local
- #elif defined (__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)
- # define URCU_TLS_STORAGE_CLASS	_Thread_local
diff --git a/package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch b/package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch
deleted file mode 100644
index aa71cf2f20..0000000000
--- a/package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 2e359284497c361e3208501fc70d49b2c54dc4ef Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 14 Sep 2021 10:41:08 -0400
-Subject: [PATCH] Always use '__thread' for Thread local storage except on MSVC
-
-Use the GCC extension '__thread' [1] for Thread local storage on all C
-and C++ compilers except MSVC.
-
-While C11 and C++11 respectively offer '_Thread_local' and
-'thread_local' as potentialy faster implementations, they offer no
-guarantees of compatibility when used in a library interface which might
-be used by both C and C++ client code.
-
-[1] https://gcc.gnu.org/onlinedocs/gcc/Thread-Local.html
-
-Change-Id: If4fe8bcdbda24b21dedf382112bd5c5f836c00c8
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-
-[Retrieved from:
-https://github.com/urcu/userspace-rcu/commit/2e359284497c361e3208501fc70d49b2c54dc4ef]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/urcu/tls-compat.h | 15 +++++++--------
- 1 file changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/include/urcu/tls-compat.h b/include/urcu/tls-compat.h
-index 25cf375a..a2c94ded 100644
---- a/include/urcu/tls-compat.h
-+++ b/include/urcu/tls-compat.h
-@@ -35,15 +35,14 @@ extern "C" {
- #ifdef CONFIG_RCU_TLS
- 
- /*
-- * Don't use C++ 'thread_local' on MacOs, the implementation is incompatible
-- * with C and will result in a link error when accessing an extern variable
-- * provided by the C library from C++ code.
-+ * Default to '__thread' on all C and C++ compilers except MSVC. While C11 has
-+ * '_Thread_local' and C++11 has 'thread_local', only '__thread' seems to have
-+ * a compatible implementation when linking public extern symbols across
-+ * language boundaries.
-+ *
-+ * For more details, see 'https://gcc.gnu.org/onlinedocs/gcc/Thread-Local.html'.
-  */
--#if defined (__cplusplus) && (__cplusplus >= 201103L) && !defined(__APPLE__)
--# define URCU_TLS_STORAGE_CLASS	thread_local
--#elif defined (__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)
--# define URCU_TLS_STORAGE_CLASS	_Thread_local
--#elif defined (_MSC_VER)
-+#if defined(_MSC_VER)
- # define URCU_TLS_STORAGE_CLASS	__declspec(thread)
- #else
- # define URCU_TLS_STORAGE_CLASS	__thread
diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 5dc8528971..5e8fd6060f 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_LIBURCU
 	bool "liburcu"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Userspace implementation of the Read-Copy-Update (RCU)
 	  synchronization mechanism. This library is mainly used by
@@ -25,6 +26,7 @@ config BR2_PACKAGE_LIBURCU
 
 	  http://lttng.org/urcu
 
-comment "liburcu needs a toolchain w/ threads"
+comment "liburcu needs a toolchain w/ threads, C++"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index bed765dd6f..a78b196ef6 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,5 +1,5 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.13.2.tar.bz2.sha256
-sha256  1213fd9f1b0b74da7de2bb74335b76098db9738fec5d3cdc07c0c524f34fc032  userspace-rcu-0.13.2.tar.bz2
+# http://www.lttng.org/files/urcu/userspace-rcu-0.14.0.tar.bz2.sha256
+sha256  ca43bf261d4d392cff20dfae440836603bf009fce24fdc9b2697d837a2239d4f  userspace-rcu-0.14.0.tar.bz2
 
 # Hash for license files
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index d7776c61ec..bb5e2c0ec7 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.13.2
+LIBURCU_VERSION = 0.14.0
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 8472cab7bb..88e1164f97 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP # liburcu
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -16,6 +17,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 
 	  http://lttng.org
 
-comment "lttng-libust needs a toolchain w/ dynamic library, wchar, threads"
+comment "lttng-libust needs a toolchain w/ dynamic library, wchar, threads, C++"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 9c86cc2646..5750c5c4e0 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # uses dlfcn
+	depends on BR2_INSTALL_LIBSTDCPP # liburcu
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_POPT
@@ -27,6 +28,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 
 	  http://lttng.org
 
-comment "lttng-tools needs a toolchain w/ threads, dynamic library"
+comment "lttng-tools needs a toolchain w/ threads, dynamic library, C++"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/multipath-tools/Config.in b/package/multipath-tools/Config.in
index 4c648a6abb..bc0f67190d 100644
--- a/package/multipath-tools/Config.in
+++ b/package/multipath-tools/Config.in
@@ -1,8 +1,9 @@
-comment "multipath-tools needs udev and a toolchain w/ threads, dynamic library"
+comment "multipath-tools needs udev and a toolchain w/ threads, dynamic library, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_MULTIPATH_TOOLS
 	bool "multipath-tools"
@@ -12,6 +13,7 @@ config BR2_PACKAGE_MULTIPATH_TOOLS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_INSTALL_LIBSTDCPP # liburcu
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBAIO
diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index 9ad3628f14..489d0b6f9a 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_NETSNIFF_NG
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_spin_lock
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # liburcu
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBURCU
@@ -28,7 +29,8 @@ comment "mausezahn needs glibc or musl toolchain"
 
 endif
 
-comment "netsniff-ng needs a toolchain w/ NPTL, headers >= 3.0"
+comment "netsniff-ng needs a toolchain w/ NPTL, C++, headers >= 3.0"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index a382b63ff8..d14c3d4698 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -1,13 +1,15 @@
-comment "xfsprogs needs a toolchain w/ threads"
+comment "xfsprogs needs a toolchain w/ threads, C++"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP # liburcu
 	select BR2_PACKAGE_INIH
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_UTIL_LINUX
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
