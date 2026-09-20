Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE07C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E77E4057E;
	Sun, 20 Sep 2026 13:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 236knBX1FKbu; Sun, 20 Sep 2026 13:42:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4048A40B2F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789911738;
	b=cHfXN6NAVYknjftlBB2+sK0KL0w6/7IBrAxLt1uBXJcc9s82/QQ0LUIC8UEW/cSlNfzD
	 0zsgIdriHfLmuBHBo76Kp0g7S5NNCTG1nFKvjZ72CwX9OhEK35jTU6Z8CoD4VYpOq5axV
	 uCihI4fJyeQMSa91YU5Z/kEjaUpd/bDoK+ovet57Zt+lveCXx9IqOCGgjIRXFuswKlGvl
	 lol9H86xOffnnDqAAF3aHXyqNdBC9MY72erlgcFoqxbcH/OR6YdXKOlnKIEDtYjvyb1HT
	 WoU7sIhrQqzaRoBBm6hX2CTlZzMBoyOsjTbTFfwPcN8bL+T36nCMfdnWlfmYgCzGEiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789911738;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=x1lL1nz3jiLpPNR7kYgX8HYbnm3YGuWasaI7b21aaBs=;
	b=XPs0ShpQTEFLwUuqzxpOBt5KCfb7sfbSmmtlT2QU5aty1uQFNfhiryKd/H3Yq29/Ccpl
	 udhq72Lx7qfjrJEl2Jn92D30d058R4eGG+KrnjlFgx4v7gtMvZmjm/HCBmfFCj1BeQ+6G
	 n+KqF1UXPxeig2gCf/HIn+hN65vC3bXwsQII8m4RlUflcdEBL3P0omsvHiUgQl5KSqZKe
	 6kbF2rq5vNCo/lyFhMfLL9evYwN3luiA5YacbOH8UFbPjurNG1GKanwarCI/wIOjEvPhU
	 lbCc2jkEFoqmqYgYdu6Tkt4/KnDTjc4z12KzBLP/v97CZW7GWYLUCwZ7IDbnfu2aj1A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789911738;
	bh=x1lL1nz3jiLpPNR7kYgX8HYbnm3YGuWasaI7b21aaBs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MnjJKIIsv4XUomIwe4ci6puZ7M4XiPsmD9SH5v+PGyFj9BwlbooH4LczZnZ+uSW4q
	 qjOzk8ZaQrkj+v4BC9qVIIYAjTvXs7XieQMc0Pf3ZJGCblxxDYp9D8bX7pZNp3bgDQ
	 UsFr73eqVcFdvf3D0+cvr7/yrXkB1VVXQTlAGjtkuPsXv6rF8W1gEko61z8ogMV3R2
	 qR7leBNWZxMfr8tuD/Ou7nKsyGZShYpbKfuUoNcTxKI6W/1ZAoKs87SkMmdm2JfykW
	 Hpf9WN5+WJJMOZbccRF9a/oqab+fcUNT7f1fLNo4R42rYqZtfHqwPWNUNkhpnKbwkt
	 M8/fi+STZrKhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4048A40B2F;
	Sun, 20 Sep 2026 13:42:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28287224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A1FE809C4
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmZ2CY6GO0eX for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:42:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 28667809B3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789911736;
 b=opGv94gd+lC8JVtpcnNTN8iO5LAa641JrfmmQBNuntIofi0KdsEhzgkfrr9+guJGY/Sw
 8GGvHlcIQjR9HL/zzxmkzSiZzZYUrSeefwLwC+hDFd2uCK5ToEDwx4P0xoR+HZkbbsS+V
 kNBvD5UKxrT+rTmf9B+vrmv4agOmSs0LwQeCBq9e3Se6ao5nAX7TnsJ4UXCg9Ftcnx+0+
 mKMfhNjr4QPyHdKZh5JMduYpd8iMhKXAH9SHIiO213mFhjYrdDqtstuQfQT02R86PN3Kj
 KTk61MExFHRO6VuqtKL27qjryso1DoNQCyjom59vNiQABawTB/0SEPWKyjvNiao9Lxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789911736;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=acpr7AdozEBXzhy+H9HbHJoSyMoyW1irlmPAgj6h+5Y=;
 b=pEanQ+Q35NEWKU/XDWz4Mcpw9W9rLJ5qxPUwADHS38R82ZS0gXc2hnuuOpsZ9zhzfFfn
 OlbfHtArKWN11YT6zO1PVIwDtJYCV+zBYqIIWR0ZM7RBoPTqKo5SldM/uXmEofrXP+zA2
 vm0bMmZv7QyzjnC0HyPR7WxT5pS2P4bMS+7/aj+yqHMfLzTCdDa1mWqBYtK31whLSkz8k
 iZNeOWwq22mwWS2pS4aCuyb8PFoCjptfq97fFpCqtTVuPakgKpzx5Hz3Bbb5kptsoGvTV
 A3acdmPcbpu1zfa09hRxETaXUUQ0QOBUcPzpu9b3dqEUHyIRaNeDbiR47DMVZe/gcvQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28667809B3
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:42:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD5A58BE96; Sun, 20 Sep 2026 13:41:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 15:41:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c633879757647767f106ce9a77abe005494a4b06
X-Git-Newrev: 7253d50c82cb83a8a39bded6d4d9b1b93cd3505b
X-Patchwork-Hint: ignore
Message-Id: <20260920134107.CD5A58BE96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jemalloc: fix build with gcc 16.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7253d50c82cb83a8a39bded6d4d9b1b93cd3505b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/6fb/6fbebb76cb0e6cafabad0890b8df226e9358a6c3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
