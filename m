Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4B9C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E40B412C0;
	Thu, 24 Sep 2026 19:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKcyU7m2BaWm; Thu, 24 Sep 2026 19:00:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BC3F7412A4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276415;
	b=l7BmoiLty/tvIe0HYM00eCDfxiYaYwredeRDdqcz1guD0ZPo3AtgK2voWdMyNlT2WN3u
	 iK4v2G5fn2/7N19+5G0FvVWJCUynzjIgn9c8Gla6hg8KIBqALLlwjB9c0a0GD4Hx+TtS2
	 rSvwOoCLNxqGN7vSpFAWSABGSn1OVLplMgcF9NjwzjHCH9J3rnARwPoqNsqQ0+TZnhNPI
	 GbN7sLR5WdOtVzOL70j5eKCxeCUeZZqvyilM0UKHuqjpnTbNkuasPYL5GLWzWSa9TaAoL
	 7DcNcHM+mu4/0JDDu0Z9IbIbNpnofRSqYjUGKoH2yyDoEsLQfyldrcpAn019jQmmyfA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276415;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=biUiOEhSOLx7sXtHk11qdrUXqfvpsKYBzMU9QJPMQpY=;
	b=h0/chUnf8Hu9AuwcQfQvQD51Mj35K5MNpV9G6v78Q/EvKKjCKP5eOFdpLTxZaOvTDY/O
	 Kr04MgCrb29b2DCsRtI+rl1FpP0UMZLTx5J/Qp5IaLNHktnq5Iy750GLe+q9Bj+3V51S3
	 avmS42Lq0/yQEoHiDpTOhsiKxn7oTCfcbtHXnGJLDhkF4fO7F6Z2jUFvlW/lP1m7H8KHk
	 0H2mT4gK8c50P1ZvciBur2aIviOcWEaJjAWILoppz17zcbW8g8vea5u6nRU/Ibz0q1otF
	 EXN5z3NWqDi01qyu89qHFezQWMXQioJfa3YZZuy+y86TrmAeMe3vqzEreTqO6RN96Ew==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276415;
	bh=biUiOEhSOLx7sXtHk11qdrUXqfvpsKYBzMU9QJPMQpY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TTe1ToiLUh78lwaL12bQJi5Vkgoluo8uaZpmLnwN4qAIHeXGQaniPCzQo/DkDVk5n
	 X1nrY1prq1JnXTTHhU/uNYRufqMqwl6+jZIzw3eQ+VCHYi66CweJkt1xW1oGogbYOd
	 dysO+6P2Xqrx2TKYtm1LtfprzlmGrmBmFYbqaP7c8DTVJBbNfupryJVmdK3LX01uKm
	 YX3g8EEWn3fY3SaTxzvD9yOtNCbQkL05Os9vetHR8giIg8DZB+CEzKDR/3Svf05qfz
	 2aSaQFsxDjzVOTYjedmNYDUhaJv0VvBkSox38HdBAihQNQbunWd8Px/5kp1LlPSjMq
	 FN6UdLq94NR6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC3F7412A4;
	Thu, 24 Sep 2026 19:00:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2DBA328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3A674017A
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REgCMzfuTOlQ for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 85C14404D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=kMb7BsuV7t3Nvd+WnYv2uezpiEdIMVDgIgY1oByTSRQqKDGSCBJnLpRc48my9HQNx8oC
 JgAk3Z1F4EpvaFtMRx+zXxS7m2fzil5vxw93EsLPM6tnqvVOL4+L+dX9dNUIY+xDvg/+0
 i5xgSDS+JGURdBNAAsHFXh3b9ghKRhDlwLT7ALCKJyi7tp6vk4sDOxLSIq4h3CF9GL4Oq
 5huWwYXWpkuL5oiFLz8YSfrDD9SravTAVZ/k7EWS2eEODiU9VoGa8EEEiBBdBkZ0L9bsy
 +0kaYnl2uMKRSNNB8CFqZznlrZqMGGaj9QqBhbSy2p/hK48GkPkLVkvXNTHYufbcf3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uHy379pIHEBDsojbDE2ybz3CRzH4DP/vuhQ1fi/sT2A=;
 b=KnHU/mVlXElu5/RroaR2AxWn7oGfByDYjyBniq1GFD4yyyuewvcQo2cmJPnCHW4L+A52
 Sds5GyErQ341QgwdA+naFhNLj00x7fzGfI10eukEiiRablsNJvA28k7WDYsz+anIxtZdb
 M147P37nIjaWuQ12S3UNLfT8f6oJ+OBw6e+Pm37adWliWvFSGsSOLvedK9FjLLrbMh0zN
 b7JZOuKOddoVZhNgRSMWmTzugt1RwBkrCXtloj+log0AqNsxH76nbLjxr2FKROVnOSsjR
 KrHCRl2ocZUNQsdPSwHD+yxaMGZwPY6NtwgtdTFQxdm2pI7h4OtfcRX08mRarAmWzPQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85C14404D6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28CBE9828F; Thu, 24 Sep 2026 18:55:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:38:41 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 791b2d0794204d895ecd70e362ab1824527a0f67
X-Git-Newrev: 064d5eee96380e1c20b3498e6249944df1701a55
X-Patchwork-Hint: ignore
Message-Id: <20260924185544.28CBE9828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/jemalloc: fix
 build with gcc 16.x
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6013234788862567785=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6013234788862567785==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/064d5eee96380e1c20b3498e6249944df1701a55
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes:
https://autobuild.buildroot.net/results/6fb/6fbebb76cb0e6cafabad0890b8df226e9358a6c3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7253d50c82cb83a8a39bded6d4d9b1b93cd3505b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .../0001-Replace-std-__throw_bad_alloc.patch       | 160 +++++++++++++++++++++
 package/jemalloc/jemalloc.mk                       |   2 +
 2 files changed, 162 insertions(+)

diff --git a/package/jemalloc/0001-Replace-std-__throw_bad_alloc.patch b/package/jemalloc/0001-Replace-std-__throw_bad_alloc.patch
new file mode 100644
index 0000000000..6bb61ba117
--- /dev/null
+++ b/package/jemalloc/0001-Replace-std-__throw_bad_alloc.patch
@@ -0,0 +1,160 @@
+From 1a15fe33a48c52bfe26ea83e49f0d317a47da3ea Mon Sep 17 00:00:00 2001
+From: lexprfuncall <cshapiro@meta.com>
+Date: Mon, 27 Apr 2026 11:50:27 -0700
+Subject: [PATCH] Replace std::__throw_bad_alloc call with standard C++ (#2900)
+
+* Replace std::__throw_bad_alloc call with standard C++
+
+Since December of 2025, std::__throw_bad_alloc is no longer visible
+through #include <new> causing jemalloc build failures with gcc 16.
+As far as I can tell, all std::__throw_bad_alloc did was arrange to
+raise a std::bad_alloc exception if exceptions are enabled.  I am not
+sure whether its usage was truly meaningful in jemalloc since the call
+is wrapped in a try catch and any usage of try catch is considered an
+error when compiling with -fno-exceptions on gcc, at least.
+
+This change adds a check to configure.ac that determines whether
+exceptions are enabled by compiling a simple try catch that raises a
+std::bad_alloc exception.  If that test succeeds, the macro
+JEMALLOC_HAVE_CXX_EXCEPTIONS is defined, and jemalloc will raise an
+exception.  Otherwise, we call std::terminate() to abort.
+
+This was tested on FreeBSD with the gcc16 port with and without exceptions
+enabled.
+
+* Replace std::set_new_handler calls with std::get_new_handler
+
+Previously, std::set_new_handler was used as a workaround for
+compilers with only partial support for C++11.  Now that C++14 is a
+requirement to enable C++ support, we can assume std::get_new_handler
+is available.
+
+Upstream: https://github.com/jemalloc/jemalloc/commit/1a15fe33a48c52bfe26ea83e49f0d317a47da3ea
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Makefile.in                                   |  6 +++--
+ configure.ac                                  | 23 +++++++++++++++++
+ .../internal/jemalloc_internal_defs.h.in      |  3 +++
+ src/jemalloc_cpp.cpp                          | 25 ++++++++++---------
+ 4 files changed, 43 insertions(+), 14 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index a93048d7b8..1f9d14f1f2 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -337,9 +337,11 @@ TESTS_INTEGRATION += \
+ endif
+ ifeq (@enable_cxx@, 1)
+ CPP_SRCS := $(srcroot)src/jemalloc_cpp.cpp
+-TESTS_INTEGRATION_CPP := $(srcroot)test/integration/cpp/basic.cpp \
+-	$(srcroot)test/integration/cpp/infallible_new_true.cpp \
++TESTS_INTEGRATION_CPP := $(srcroot)test/integration/cpp/basic.cpp
++ifeq (@enable_cxx_exceptions@, 1)
++TESTS_INTEGRATION_CPP += $(srcroot)test/integration/cpp/infallible_new_true.cpp \
+ 	$(srcroot)test/integration/cpp/infallible_new_false.cpp
++endif
+ else
+ CPP_SRCS :=
+ TESTS_INTEGRATION_CPP :=
+diff --git a/configure.ac b/configure.ac
+index 321a729012..d151829832 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -374,7 +374,30 @@ fi
+ if test "x$enable_cxx" = "x1"; then
+   AC_DEFINE([JEMALLOC_ENABLE_CXX], [ ], [ ])
+ fi
++if test "x$enable_cxx" = "x1"; then
++  dnl Now check whether the C++ compiler has exceptions enabled.
++  AC_LANG_PUSH([C++])
++  SAVED_CXXFLAGS="${CXXFLAGS}"
++  CXXFLAGS="${CXXFLAGS} ${EXTRA_CXXFLAGS}"
++  JE_COMPILABLE([C++ exception support], [
++#include <new>
++], [
++	try {
++		throw std::bad_alloc();
++	} catch (const std::bad_alloc &) {
++	}
++], [je_cv_cxx_exceptions])
++  CXXFLAGS="${SAVED_CXXFLAGS}"
++  AC_LANG_POP([C++])
++  if test "x${je_cv_cxx_exceptions}" = "xyes" ; then
++    AC_DEFINE([JEMALLOC_HAVE_CXX_EXCEPTIONS], [ ], [ ])
++    enable_cxx_exceptions="1"
++  else
++    enable_cxx_exceptions="0"
++  fi
++fi
+ AC_SUBST([enable_cxx])
++AC_SUBST([enable_cxx_exceptions])
+ AC_SUBST([CONFIGURE_CXXFLAGS])
+ AC_SUBST([SPECIFIED_CXXFLAGS])
+ AC_SUBST([EXTRA_CXXFLAGS])
+diff --git a/include/jemalloc/internal/jemalloc_internal_defs.h.in b/include/jemalloc/internal/jemalloc_internal_defs.h.in
+index 31ae2e8ed2..54d4da2032 100644
+--- a/include/jemalloc/internal/jemalloc_internal_defs.h.in
++++ b/include/jemalloc/internal/jemalloc_internal_defs.h.in
+@@ -465,6 +465,9 @@
+ /* Is C++ support being built? */
+ #undef JEMALLOC_ENABLE_CXX
+ 
++/* Are C++ exceptions enabled? */
++#undef JEMALLOC_HAVE_CXX_EXCEPTIONS
++
+ /* Performs additional size checks when defined. */
+ #undef JEMALLOC_OPT_SIZE_CHECKS
+ 
+diff --git a/src/jemalloc_cpp.cpp b/src/jemalloc_cpp.cpp
+index 4e838d3b51..ac109bb28e 100644
+--- a/src/jemalloc_cpp.cpp
++++ b/src/jemalloc_cpp.cpp
+@@ -1,4 +1,4 @@
+-#include <mutex>
++#include <exception>
+ #include <new>
+ // NOLINTBEGIN(misc-use-anonymous-namespace)
+ 
+@@ -78,29 +78,30 @@ handleOOM(std::size_t size, bool nothrow) {
+ 	void *ptr = nullptr;
+ 
+ 	while (ptr == nullptr) {
+-		std::new_handler handler;
+-		// GCC-4.8 and clang 4.0 do not have std::get_new_handler.
+-		{
+-			static std::mutex           mtx;
+-			std::lock_guard<std::mutex> lock(mtx);
+-
+-			handler = std::set_new_handler(nullptr);
+-			std::set_new_handler(handler);
+-		}
++		std::new_handler handler = std::get_new_handler();
+ 		if (handler == nullptr)
+ 			break;
+ 
++#ifdef JEMALLOC_HAVE_CXX_EXCEPTIONS
+ 		try {
+ 			handler();
+ 		} catch (const std::bad_alloc &) {
+ 			break;
+ 		}
++#else
++		handler();
++#endif
+ 
+ 		ptr = je_malloc(size);
+ 	}
+ 
+-	if (ptr == nullptr && !nothrow)
+-		std::__throw_bad_alloc();
++	if (ptr == nullptr && !nothrow) {
++#ifdef JEMALLOC_HAVE_CXX_EXCEPTIONS
++		throw std::bad_alloc();
++#else
++		std::terminate();
++#endif
++	}
+ 	return ptr;
+ }
+ 
diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index 61045c50d5..8ac661b9d5 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -9,6 +9,8 @@ JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
 JEMALLOC_SITE = https://github.com/jemalloc/jemalloc/releases/download/$(JEMALLOC_VERSION)
 JEMALLOC_LICENSE = BSD-2-Clause
 JEMALLOC_LICENSE_FILES = COPYING
+# 0001-Replace-std-__throw_bad_alloc.patch
+JEMALLOC_AUTORECONF = YES
 JEMALLOC_INSTALL_STAGING = YES
 JEMALLOC_CONFIG_SCRIPTS = jemalloc-config
 

--===============6013234788862567785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6013234788862567785==--
