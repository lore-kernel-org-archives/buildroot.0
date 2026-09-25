Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEE2C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB81060E15;
	Fri, 25 Sep 2026 14:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oi3Ifk53j0KN; Fri, 25 Sep 2026 14:46:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4C35460DB7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347568;
	b=ni35YGxR241NXB1ww5JG7tPSYAJ+0RcYjq+2BhZTCBVn5Dirh/Lu26pS0Glo31KY5zqC
	 aUCDf+WsX9PBjw3Zqi3MEGwr0Hdr0YIuP0J0mGiMAaBnYnXLLwfJ2tG3X8jlxQ18bUCcZ
	 M3Sc+QS5/VUJQr2acp6rb3slTZ+IAbmgToLeXqCr2EJUEGeZ/yAWN/deAb0ily7EE/8iQ
	 dtmyfEBMB582uCvRDURvwkQtRFYLOUfUbWRApweSozDCN1hu9fMv0gqn7Sn2WA6ZZdArG
	 SVTJCk29G7UV5oH+MQiknoJMM2TJAjGdAUTaF+aYdSjltAXtF3c8HaDXRBowbmAXZjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347568;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KPdMT1uvMZDmIyuWDU1jJHyjKfuzGp5A+9sjYV9LYfI=;
	b=VDX2riOLi5ccelhjAGrob6cONPT/iMN/2kpV0517FLbBEQi8/cnrgEVMite34/pjP6Vt
	 iMFUV8UsUooE38aF0WqjM0Qozj+nMzxAQuzxo6ye8Vc8M6CGvU59r78XxGaKdADOA3WGq
	 9/bPsW7Z3A7pH2qbwv062NO4zr8iiH5j8+i5zF3hpWg3DZXbK3LF6eHEiiIYPGnEbPfxV
	 GAAZxQBi4UjlmExdjwITwy3mU+761Tt9DDSH8CIKjSk6HeGnNusvXTz3Pvn4QfoHWTA9O
	 6CKeNY8061Xi1meiZKAaBwoW1ivFlY3IKKbbmVmLzYzgMNjV4xiIRDZyTa2nH3pjCNQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347568;
	bh=KPdMT1uvMZDmIyuWDU1jJHyjKfuzGp5A+9sjYV9LYfI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hIZxrvOrPpN9IGmD73ZJti1pRIC7nPAMEei+838/RgjOEuI69OSO3/LgfJNDl2+tH
	 IZUJ6ofeIBEI2x8HaJdpiEsZlxnXcAyO2SFvb8xT2uOU+L2NocVuHKHzcHVPYUzgJd
	 l6D8MFu0a8KzQP98J0z3W4UU0ksoGNXebGvTstVk5yJ+65M/n5+b9lBaAI8IVIuAzR
	 z69Fcek9wfVANOKsTIhY72P2we3fCJiY+EbRHSvPgT3Lf0zxe0HdH5gBmzwopJqoZg
	 Li/DmtxRq4DzDtL4yxOHapnl0gGvzrFxKfy0bcHPVKct5/g1Hax83WDIU/0u6hgB3e
	 jiNun+n2ZAU7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C35460DB7;
	Fri, 25 Sep 2026 14:46:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3521332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4DAA60DBC
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otYs9yXkmYeX for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5C6A560DB7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347562;
 b=TC6SQLJLtz17vo5LQ6s8GndWphIUC3Ivm9tlAzcpyI4430NM9lcohd7l8BOIT6UrP+iy
 VQiWPfbhW2q5c/QhQDwGIh53d13Y6EUKof2N4dQYF8EXGUBYZ6m1HMLL47U3o1F6GDQPg
 KRYIwummfowi4naFJw/d5lqAmgLF1Xu1dMyf9364tljzzetPjV/CRIbBQMAkclQDRxZvK
 +EQp63+ETSK9LBe0oE01lWU8MGhoOveZRavoXerTjaFBWRu64oVtUWQV+poXPhxBYo6PN
 m5K83HQwThieT8Uvv8u0jnKlNmkNvAymGHpq79zxTIpuIq3H1MAwZjRzgsnFHS8xprw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347562;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=oDICW++YD9spmOC8xJyWRuCJyr19RPM7tA/DCXciBB8=;
 b=diegGePywybBEdUOhxvZdWnU/0ke4X4xL1NMbxZTwHqWG1AYsFOUJ78d8yejMBjEHeAc
 GL1AHidupA2xjNA3eLy4jL3V+gWLDiV3oFE2FJcNCuQRtwLEbn2AEqWCsjJCVG2TB9Oxq
 PH3Uf4TVzkk9km6u16bn7U2DQsiOWKQnUk2JNag7PdDYOAe4trcJArhIRMqg2SzXfg023
 js+1n3yd/G322Sqj6K9GFkXHlXRLjIZdKdnGQNhY5Fvwhzdur0imm+WCtUBiW/c+EMHUG
 d44Jkti/AOMHI9mfTaIvaEyyFd4+vgSGYZpaxh2m825W+78uVVDtd3pqrrZkM5GevvA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bcxMG5ui; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C6A560DB7
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:01 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843378fb37so590987f8f.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347560; x=1790952360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oDICW++YD9spmOC8xJyWRuCJyr19RPM7tA/DCXciBB8=;
 b=OUNZ8qPavl9SDcI/vhPAkB0tY5LPh4IR/CZxpV8+lj7yTvIg0k8T1vEvohoG1MHqyt
 tF3lYB6MX2sSrN+aDH6d142rekYl0l0PAys8Vwf1EJhNaY0+AOq5iToiUycAOmIrsZEE
 GPeb4KAiyfo78l44pEIkqW0QP1AKnRrXmF2VYKwP9jN430jE+9RzNHPStJYdUuzExyIx
 A5o1Ngk6y02IvxfAnl21jvtEFDc0jsPteqK78tohs+/pZNP1WKMkkMh9vqpVtNHVmCbF
 3ggOdC4zI9vhqUYVeezcrC+MTQjR9N3iVLBoou+TMUV8K1D3gSUqkSvkDtfZtrPIOHoL
 ZnbA==
X-Gm-Message-State: AFuF++k5ptN4gShXNKP+yc7kUWEJWnPvFWWxHoEIUO5jGs1LrXMYAnG5
 R+BTWNfuebBxgDmBmY4HBfHFv4jZN3o4STNFvlg0pTmsfGkbVeV3/QCpVcu9BS9GUbVli4VHOuV
 waF3KL5XrEg==
X-Gm-Gg: AYBFou1vQDeGGQARw3Qiel3YX72E265+7jRO7mZN94G2G2TyAQa2oajauLBvFkZP7vB
 bPiQWMTbe8eYKZcehPZTEgfsOR8VDrZnpE04qBpYXuifUUOguo3nVFuw5c3O5sk38kioNMNr2sk
 s1V1vvpHdCHwuH2J8vFKPzSJV/KAZqNwDwsy53BUtuWZBx0zpATIuvIYdhMukvqlRifqb3KZQBV
 +5Mb0VAHy8sj0eHvoeQxJUF1Ippp9LB/s4RQcdbI2XtuRNsV71cxjh/5luX3afEvqTFIgjfxBQV
 Sq64wTfWqVklSx3dLe4Xu1EnG+C9ODo5BimCy2JVxlWe6wVNoIkJbHJQR3f8JuMcPP+/rtJwhEM
 7huPeI7u59lxO55pDEEwkHZfoPBi5gAPthlQO0fhiEgQzSL0wQOEvnu4ldEyeid57YTDUwApdPS
 8tjozAUJnSHmTJ1Jmr+TQWfmwLw74bRNClxOoWZ0qCKXsirQ/BnCGwZsVFGxe7M/Tvt0oGg8hUN
 qEtGIM760bgB0AUhSAZPNjey1KD1SriaU4HaVBfVQ==
X-Received: by 2002:a05:6000:4103:b0:488:7496:15b5 with SMTP id
 ffacd0b85a97d-48874961605mr7717596f8f.47.1790347559837; 
 Fri, 25 Sep 2026 07:45:59 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a349731sm8072236f8f.12.2026.09.25.07.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:59 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:57 +0200
Message-ID: <20260925144558.4098582-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916085648.1131241-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/jemalloc: Fix build with gcc
 16.x
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes:
> https://autobuild.buildroot.net/results/6fb/6fbebb76cb0e6cafabad0890b8df226e9358a6c3/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  .../0001-Replace-std-__throw_bad_alloc.patch  | 160 ++++++++++++++++++
>  package/jemalloc/jemalloc.mk                  |   2 +
>  2 files changed, 162 insertions(+)
>  create mode 100644 package/jemalloc/0001-Replace-std-__throw_bad_alloc.patch
> 
> diff --git a/package/jemalloc/0001-Replace-std-__throw_bad_alloc.patch b/package/jemalloc/0001-Replace-std-__throw_bad_alloc.patch
> new file mode 100644
> index 0000000000..6bb61ba117
> --- /dev/null
> +++ b/package/jemalloc/0001-Replace-std-__throw_bad_alloc.patch
> @@ -0,0 +1,160 @@
> +From 1a15fe33a48c52bfe26ea83e49f0d317a47da3ea Mon Sep 17 00:00:00 2001
> +From: lexprfuncall <cshapiro@meta.com>
> +Date: Mon, 27 Apr 2026 11:50:27 -0700
> +Subject: [PATCH] Replace std::__throw_bad_alloc call with standard C++ (#2900)
> +
> +* Replace std::__throw_bad_alloc call with standard C++
> +
> +Since December of 2025, std::__throw_bad_alloc is no longer visible
> +through #include <new> causing jemalloc build failures with gcc 16.
> +As far as I can tell, all std::__throw_bad_alloc did was arrange to
> +raise a std::bad_alloc exception if exceptions are enabled.  I am not
> +sure whether its usage was truly meaningful in jemalloc since the call
> +is wrapped in a try catch and any usage of try catch is considered an
> +error when compiling with -fno-exceptions on gcc, at least.
> +
> +This change adds a check to configure.ac that determines whether
> +exceptions are enabled by compiling a simple try catch that raises a
> +std::bad_alloc exception.  If that test succeeds, the macro
> +JEMALLOC_HAVE_CXX_EXCEPTIONS is defined, and jemalloc will raise an
> +exception.  Otherwise, we call std::terminate() to abort.
> +
> +This was tested on FreeBSD with the gcc16 port with and without exceptions
> +enabled.
> +
> +* Replace std::set_new_handler calls with std::get_new_handler
> +
> +Previously, std::set_new_handler was used as a workaround for
> +compilers with only partial support for C++11.  Now that C++14 is a
> +requirement to enable C++ support, we can assume std::get_new_handler
> +is available.
> +
> +Upstream: https://github.com/jemalloc/jemalloc/commit/1a15fe33a48c52bfe26ea83e49f0d317a47da3ea
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + Makefile.in                                   |  6 +++--
> + configure.ac                                  | 23 +++++++++++++++++
> + .../internal/jemalloc_internal_defs.h.in      |  3 +++
> + src/jemalloc_cpp.cpp                          | 25 ++++++++++---------
> + 4 files changed, 43 insertions(+), 14 deletions(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index a93048d7b8..1f9d14f1f2 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -337,9 +337,11 @@ TESTS_INTEGRATION += \
> + endif
> + ifeq (@enable_cxx@, 1)
> + CPP_SRCS := $(srcroot)src/jemalloc_cpp.cpp
> +-TESTS_INTEGRATION_CPP := $(srcroot)test/integration/cpp/basic.cpp \
> +-	$(srcroot)test/integration/cpp/infallible_new_true.cpp \
> ++TESTS_INTEGRATION_CPP := $(srcroot)test/integration/cpp/basic.cpp
> ++ifeq (@enable_cxx_exceptions@, 1)
> ++TESTS_INTEGRATION_CPP += $(srcroot)test/integration/cpp/infallible_new_true.cpp \
> + 	$(srcroot)test/integration/cpp/infallible_new_false.cpp
> ++endif
> + else
> + CPP_SRCS :=
> + TESTS_INTEGRATION_CPP :=
> +diff --git a/configure.ac b/configure.ac
> +index 321a729012..d151829832 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -374,7 +374,30 @@ fi
> + if test "x$enable_cxx" = "x1"; then
> +   AC_DEFINE([JEMALLOC_ENABLE_CXX], [ ], [ ])
> + fi
> ++if test "x$enable_cxx" = "x1"; then
> ++  dnl Now check whether the C++ compiler has exceptions enabled.
> ++  AC_LANG_PUSH([C++])
> ++  SAVED_CXXFLAGS="${CXXFLAGS}"
> ++  CXXFLAGS="${CXXFLAGS} ${EXTRA_CXXFLAGS}"
> ++  JE_COMPILABLE([C++ exception support], [
> ++#include <new>
> ++], [
> ++	try {
> ++		throw std::bad_alloc();
> ++	} catch (const std::bad_alloc &) {
> ++	}
> ++], [je_cv_cxx_exceptions])
> ++  CXXFLAGS="${SAVED_CXXFLAGS}"
> ++  AC_LANG_POP([C++])
> ++  if test "x${je_cv_cxx_exceptions}" = "xyes" ; then
> ++    AC_DEFINE([JEMALLOC_HAVE_CXX_EXCEPTIONS], [ ], [ ])
> ++    enable_cxx_exceptions="1"
> ++  else
> ++    enable_cxx_exceptions="0"
> ++  fi
> ++fi
> + AC_SUBST([enable_cxx])
> ++AC_SUBST([enable_cxx_exceptions])
> + AC_SUBST([CONFIGURE_CXXFLAGS])
> + AC_SUBST([SPECIFIED_CXXFLAGS])
> + AC_SUBST([EXTRA_CXXFLAGS])
> +diff --git a/include/jemalloc/internal/jemalloc_internal_defs.h.in b/include/jemalloc/internal/jemalloc_internal_defs.h.in
> +index 31ae2e8ed2..54d4da2032 100644
> +--- a/include/jemalloc/internal/jemalloc_internal_defs.h.in
> ++++ b/include/jemalloc/internal/jemalloc_internal_defs.h.in
> +@@ -465,6 +465,9 @@
> + /* Is C++ support being built? */
> + #undef JEMALLOC_ENABLE_CXX
> + 
> ++/* Are C++ exceptions enabled? */
> ++#undef JEMALLOC_HAVE_CXX_EXCEPTIONS
> ++
> + /* Performs additional size checks when defined. */
> + #undef JEMALLOC_OPT_SIZE_CHECKS
> + 
> +diff --git a/src/jemalloc_cpp.cpp b/src/jemalloc_cpp.cpp
> +index 4e838d3b51..ac109bb28e 100644
> +--- a/src/jemalloc_cpp.cpp
> ++++ b/src/jemalloc_cpp.cpp
> +@@ -1,4 +1,4 @@
> +-#include <mutex>
> ++#include <exception>
> + #include <new>
> + // NOLINTBEGIN(misc-use-anonymous-namespace)
> + 
> +@@ -78,29 +78,30 @@ handleOOM(std::size_t size, bool nothrow) {
> + 	void *ptr = nullptr;
> + 
> + 	while (ptr == nullptr) {
> +-		std::new_handler handler;
> +-		// GCC-4.8 and clang 4.0 do not have std::get_new_handler.
> +-		{
> +-			static std::mutex           mtx;
> +-			std::lock_guard<std::mutex> lock(mtx);
> +-
> +-			handler = std::set_new_handler(nullptr);
> +-			std::set_new_handler(handler);
> +-		}
> ++		std::new_handler handler = std::get_new_handler();
> + 		if (handler == nullptr)
> + 			break;
> + 
> ++#ifdef JEMALLOC_HAVE_CXX_EXCEPTIONS
> + 		try {
> + 			handler();
> + 		} catch (const std::bad_alloc &) {
> + 			break;
> + 		}
> ++#else
> ++		handler();
> ++#endif
> + 
> + 		ptr = je_malloc(size);
> + 	}
> + 
> +-	if (ptr == nullptr && !nothrow)
> +-		std::__throw_bad_alloc();
> ++	if (ptr == nullptr && !nothrow) {
> ++#ifdef JEMALLOC_HAVE_CXX_EXCEPTIONS
> ++		throw std::bad_alloc();
> ++#else
> ++		std::terminate();
> ++#endif
> ++	}
> + 	return ptr;
> + }
> + 
> diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
> index 61045c50d5..8ac661b9d5 100644
> --- a/package/jemalloc/jemalloc.mk
> +++ b/package/jemalloc/jemalloc.mk
> @@ -9,6 +9,8 @@ JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
>  JEMALLOC_SITE = https://github.com/jemalloc/jemalloc/releases/download/$(JEMALLOC_VERSION)
>  JEMALLOC_LICENSE = BSD-2-Clause
>  JEMALLOC_LICENSE_FILES = COPYING
> +# 0001-Replace-std-__throw_bad_alloc.patch
> +JEMALLOC_AUTORECONF = YES
>  JEMALLOC_INSTALL_STAGING = YES
>  JEMALLOC_CONFIG_SCRIPTS = jemalloc-config
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
