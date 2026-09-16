Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E655BC88E77
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 08:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 936AB80A9B;
	Wed, 16 Sep 2026 08:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IHqlHdwMjsv; Wed, 16 Sep 2026 08:56:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1C53780AC8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789549017;
	b=Uimg9YlbfYgenJxwR25aRJAGDHYMxUPIuBwKRAdYOroS6Jos34EuLp/zRVdoJNsZx0vW
	 hQs4Ad6mkAs1REwPI+EG793pG8YkBF4YFtZx6k4xujwru0nBAo+4Et14pdlC0YyPHmb4a
	 KNEOj3gOY3Bw5Fe53AX3hgTaUldrf9rASmnDWG+WONZ/iNZzB0l9xd4wQPqkdOXNszQ6z
	 y1Lu2ri13epJlmHYS+IqgKOoxQCDIvxBC2zf9qI2/pirkgQl/ronDVNa/QCjOEWcNBDjc
	 vO9mSuiimQrsKNQOjCk6Ipq1gxoFMwSU4Z0zveRKV57YVChynwvgQnhH5va2+S1vdmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789549017;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1fzdn2gVlna7+Prehdn2bZu3gPgf28IiKzO0dCArMQk=;
	b=ZwTstvr/UXZ8rdPEBQWDshK/dVNqQsHQe4wICeetzLxw+QwXGk8Ll+C9u47LZOApTBKI
	 k/lVKLxD0WSwBxOxYBThvmF0jKiumEuL1Tj+ugbqGagzjXcdcPzeiYvuLfk5R4cTOr12f
	 0pBFV+gCZdu03HqNM5MaYaJK2J1fRZFC1BsfhZsvBi3SjMpRej04VXQe6ZcgnauTuPlpr
	 HZvejf0qXWGb3VduOgCZzg6W/i7n4D4zTuuZA648qxq+ZrQtRqWrTjzMDjZYswhrMP4GA
	 r1Xb+NILX68S5Qf+KAeQ4/5hPLRQZX7esSeDblBN0vn0YDxUSMdJEYq5VoWdiDzA5Bg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=fuAmqnzI;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789549017;
	bh=1fzdn2gVlna7+Prehdn2bZu3gPgf28IiKzO0dCArMQk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z+mbfFhv/FrDULxDwzvIbzCpJMA2CkwmPMKy6rSdublDjxu3ilApT0Gju+cRLRwlK
	 +zFIDyL8fpVt2UH2Gp9Vh7qjLT/ZiVoBt5ql802URDGHufOwqPXqSUneo3tgZ+KPA8
	 BJTzAop7+uWbonpN2Q1exFG94779dtKHkXAI9Dck8UFicep+UctnQcSneeNngvzeWC
	 kfKwFnX0/MB8BDwXvdfGMv16mXFGOoQXIpOkicOWOgau5HAh/SEM2SSsQ2RSD4xfml
	 PMBT4A+bUDQvEy7oKmegPUCn7PJ+Xartd3EgL7gvEWUc6poZbWcBRbhvyhxmV0ZWVZ
	 j6P7keF7HEteg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C53780AC8;
	Wed, 16 Sep 2026 08:56:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE89E23F
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 08:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94A2A80A9B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 08:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLffG_Pv2xSl for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 08:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 113A480AC8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789549014;
 b=T/gq2bZ9uSGlGzPQhzNW+c78M4qO1i2otq8NpW5+ZnH38FFMFjhC/EcYg6Cn/ABXDWwK
 zMOnPTlfRuabFQdS4KTxJP4oNDXzpe89YWgXe3G/VOXXkm2/+I2BZB6WiTGyyWTNx8bG0
 Qtf2zEL22NSPp0ldnqbuvmNx/x8nEFQvhFxMEoxVLpB9WzbHD4v2RJIUKIbUXUk5VakPh
 gFhZYVB+zmrqbeeRhuxoJU1v6igYfzbFFcbgdiAol1+Ym1IMBFMmzBU0rZQKAOoDICGh2
 JnVXUVZBZ2Cjd8ZdoJ4INDOuI+uQaE8dIztPfzAaObMfeDavx2V16McbA3WExJnij5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789549014;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=labI7YrBdVamISlowbxO5kZQi0zaNdBXRjlC/4jvHoU=;
 b=Nag9udx9uSsRABX4Uiaa9v2O45CDKudeQn4kjKmEL346M+rv3n24NGtram0aRal0mnqp
 qEVqAekAbVtsOd/r2bF4yVdM4znI9TZsfpLFKSqAF71KhoGsv1NlH86xapNFAIFkBY4AU
 CUt7nmHt4kpTaF0eCOGf7LX5yeaIDRCYQY0lenylb4F2bNBt/ucJfpcKjF4T4LmfIPT2l
 MhlO6/vj2YK93pIHVPlQx0DkbXpvOhPGc0xZjy5Jxxc7d7YudkMuWIgVjxvkVfNY9Oo3T
 lQ6kOow50Bqp1M5kDgU8vDIYWGON+6bnKK8YmnuWKHZHoOdxEl81w8lRGLulhKDOxdQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fuAmqnzI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fuAmqnzI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 113A480AC8
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 08:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789549009;
 bh=labI7YrBdVamISlowbxO5kZQi0zaNdBXRjlC/4jvHoU=;
 h=From:To:Cc:Subject:Date:From;
 b=fuAmqnzIlUSOJrKHsX6VWdkbm0H/bC6+9F4B8sgppCd+2mnlBJajtYRdnSrho9j9A
 uOLtxQknl3PcMWkoJYL1B3CXvdgcU83ovq7eWjVTWqX+pqGik8VPPZWkerdOLKYXBo
 PZYgSeOS2X+edbKzNTN9iVqzcYHcGYcRIkYR6Eq4bgYa6zHHCTTdZbSftmJ6Gjk0v3
 ocfPoCimLobYVQqTLmO5wpV9m+QqXtmamsSWYgHajBWfr4ivQWCCjJylW8gODY5ToS
 5HBm4MzlGXkdeG/htBWnfUsSSqYEzaLw9AG8/AChFK4DXNIDeY/2Bz6N186NZYH66h
 IrRPpiEuIYLrw==
Received: from fli4l.lan.fli4l (p5b3a0ed0.dip0.t-ipconnect.de [91.58.14.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 509B7A4C42BC;
 Wed, 16 Sep 2026 10:56:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35622)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6lRg-000000005BL-0omD;
 Wed, 16 Sep 2026 08:56:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 16 Sep 2026 10:56:48 +0200
Message-ID: <20260916085648.1131241-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/jemalloc: Fix build with gcc 16.x
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

Fixes:
https://autobuild.buildroot.net/results/6fb/6fbebb76cb0e6cafabad0890b8df226e9358a6c3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Replace-std-__throw_bad_alloc.patch  | 160 ++++++++++++++++++
 package/jemalloc/jemalloc.mk                  |   2 +
 2 files changed, 162 insertions(+)
 create mode 100644 package/jemalloc/0001-Replace-std-__throw_bad_alloc.patch

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
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
