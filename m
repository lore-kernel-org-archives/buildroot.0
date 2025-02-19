Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7BFC021B0
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90FB04F3B4;
	Wed, 19 Feb 2025 08:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OI1gdfiAyRYh; Wed, 19 Feb 2025 08:52:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6C0B50408
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6C0B50408;
	Wed, 19 Feb 2025 08:52:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 145BC127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F342260071
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTytvE9wTY-t for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A8FE60671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A8FE60671
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A8FE60671
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43964e79314so59887325e9.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955057; x=1740559857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P57laVPRBuQ5O8Lor2tcPDWHDK2QMP8f5f8RLfKQvZg=;
 b=OcTb3qeIx8ZrP6UU4KaoV/jbVd+zhk4kLJaFjKqGoQKZJ+jGKJsdF5agniZkkgLmp3
 m57cF6pIJiGeYwf+AqQ/EWo5iFAdZnQFq3jO6GvJDLyxnO0C/jds9c/0xG2rm3vxw/jk
 c0alsyZqRLKaOBNc9S1xY+LyG0PE9Wfv+cudX2Ctz+CQvT64EQpEDWTy8dLm1aU6ycWR
 ZyHFiJAwUG9CtxP+cPRhYy7W9EJV/bKQ2vSO9xGTQHZ3hkmiqRaAOq8glSiMNY86jshr
 NZqdUR8znlrSEXhYLZhnW3U+Lfciwmji0V8MgdiixqArg8lw8B/RnxD9bxBghPEvgo8i
 aUIw==
X-Gm-Message-State: AOJu0Yzgw80UHW3IekRPHt98IzoOvtIwVRgKBHbgNB4M2qW/TDeWwide
 EhkTONE1NNhrzBnp7uqUSYiUmOUH0WVdfs416sCZsQHvXZ/SwDtbLEL9eA==
X-Gm-Gg: ASbGncu6ZP+00JC1FcYfhNKZrkO+BaxS3+ZfA2f64tKXjf1fotZYTas4wztrfcRLEzw
 Pr5VInBnEfZSSzFUj7l5HY6CbtY3KpZwnwgwvE0vcxO4SO18ZCocF2KRUqSHkJWsuiqDTW0xMTm
 PQY1wVuLHatpi0CIB0HknKnU8ABaD5i5qrktgNkYuCY6ijny7KqcuIPoZoCy2zdMclY49ezzFOf
 K8epxHBshR1eByvRz+OFaVeRMB8FtmjEelIpc3x03fU+6Nou3+lsbyUTmpK/D/xcxPPL2ZJk2hy
 eMPO8mS/MqKR/dq1sdof8YW2og==
X-Google-Smtp-Source: AGHT+IHiNadvwdIKkIAZwfD0DSRTzEsntGQBFFFw9B5TyNHf/kPDeE6C5PLFNIH6nrgv3MFzEV5AVw==
X-Received: by 2002:a5d:6c66:0:b0:388:c61d:43e0 with SMTP id
 ffacd0b85a97d-38f34167d68mr18846575f8f.48.1739955057467; 
 Wed, 19 Feb 2025 00:50:57 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:56 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 09:50:37 +0100
Message-ID: <ffc1ab29bb215a7d95fa8e57eabae520f4a9b437.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955057; x=1740559857; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P57laVPRBuQ5O8Lor2tcPDWHDK2QMP8f5f8RLfKQvZg=;
 b=DSculN19VqkhJXm21V5BD7b83/be5oMxFC/Yf3A/FaUo7m2jxP4uXVG/hq2pSOOqAH
 bZzpq6YaIgsrdcCLEXYs5c4Qdr9oZDB4/Nvq/UTOuTwqJjICGT9sOJvpXxa/8rd/vney
 TjZZ/KIqWFZhW9e9JNxA7IokfI92/XboWK94LrMoTKpE2/8/y5W5lxtsp6iZA/ov/agv
 4anDtGW6QfvJKbZEJ+I5ulsA+SckMeba2+vixNGvvPTAO8ej3s995TGFo/GIo/eK21bQ
 D6k2OnNC3HoHy4yzfSGM593TGjdrZ671hURTLo/TVUmsBmtvY2lrN+Xusm0MG8FCeouA
 JuRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DSculN19
Subject: [Buildroot] [PATCH 22/27] package/boost: bump to version 1.87.0
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a slew of new libraries as reported by ./bootstrap --show-libraries.
Add a comment about how to maintain the list, and that they may not all
be exposed in the menuconfig.

There has been a few dependency changes. Those have been identified by
removing all selects, building Boost with exactly one option enabled,
identifying those that built without issue (thus were leaf options),
then adding dependencies to failing options, and so on iteratively,
until all options would build when selected on their own, and without a
select that was not already satisfied transitively (that's a limitation,
but hey...)

Some dependencies were dropped, and that has been confirned by
inspecting the corresponding upstream component. For example, contract
no longer needs system since upstream commit eedf51b2c675 (removed
linking to boost.system [...]) and available since boost 1.72.0 (so yes,
we've had superfluous dependencies for a while now, but it is extra
diffficult to detect).

In some cases, this implies a change in what symbol has to be ignored or
not:
  - contract now selects nothing, so appears orphaned, so must be
    ignored;
  - exception is now selected by coroutine, so no longer appears
    orphaned, so must not be ignored;
  - timer now selects nothing, so appears orphaned, so must be ignored;
  - url now select system, so it no longer appears orphaned, so must not
    be ignored.

Drop the backported patch, it's been applied upstream since 1.84.0.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0001-unordered-fix-copy-assign.patch      | 22 ------
 package/boost/Config.in                       | 34 ++++------
 package/boost/boost.hash                      |  2 +-
 package/boost/boost.mk                        | 68 ++++++++++++++++++-
 4 files changed, 81 insertions(+), 45 deletions(-)
 delete mode 100644 package/boost/0001-unordered-fix-copy-assign.patch

diff --git a/package/boost/0001-unordered-fix-copy-assign.patch b/package/boost/0001-unordered-fix-copy-assign.patch
deleted file mode 100644
index 670552535a..0000000000
--- a/package/boost/0001-unordered-fix-copy-assign.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream Patch for Unordered
-
-Prevent erroneous copying of groups data, update max load to properly propagate
-
-Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
-Upstream: https://github.com/boostorg/unordered/commit/067884a4e213352e7c81c441f1453c54735c39f3
-diff --git a/include/boost/unordered/detail/foa/core.hpp b/include/boost/unordered/detail/foa/core.hpp
-index 239d05d3..7ae9f2c8 100644
---- a/boost/unordered/detail/foa/core.hpp
-+++ b/boost/unordered/detail/foa/core.hpp
-@@ -1870,9 +1870,10 @@ private:
- 
-   void fast_copy_elements_from(const table_core& x)
-   {
--    if(arrays.elements){
-+    if(arrays.elements&&x.arrays.elements){
-       copy_elements_array_from(x);
-       copy_groups_array_from(x);
-+      size_ctrl.ml=std::size_t(x.size_ctrl.ml);
-       size_ctrl.size=std::size_t(x.size_ctrl.size);
-     }
-   }
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 784c40278b..d1d1dc2423 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -65,11 +65,11 @@ config BR2_PACKAGE_BOOST_CONTEXT
 comment "boost-context needs a toolchain w/ C++11, gcc>=4.8"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
+# check-symbol ignore
 config BR2_PACKAGE_BOOST_CONTRACT
 	bool "boost-contract"
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Contract programming for C++.
 
@@ -82,10 +82,9 @@ config BR2_PACKAGE_BOOST_COROUTINE
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context, boost-thread
-	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_CONTEXT
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  deprecated coroutine library, the non-deprecated coroutine2
 	  library is a header-only library and does not need to be
@@ -105,7 +104,6 @@ config BR2_PACKAGE_BOOST_DATE_TIME
 	  A set of date-time libraries based on generic programming
 	  concepts.
 
-# check-symbol ignore
 config BR2_PACKAGE_BOOST_EXCEPTION
 	bool "boost-exception"
 	help
@@ -125,7 +123,6 @@ config BR2_PACKAGE_BOOST_FIBER
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  C++11 userland threads library.
 
@@ -149,7 +146,6 @@ config BR2_PACKAGE_BOOST_FILESYSTEM
 
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
-	select BR2_PACKAGE_BOOST_REGEX
 	help
 	  The BGL graph interface and graph components are generic, in
 	  the same sense as the the Standard Template Library (STL).
@@ -165,6 +161,8 @@ config BR2_PACKAGE_BOOST_IOSTREAMS
 	bool "boost-iostreams"
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_BOOST_RANDOM
+	select BR2_PACKAGE_BOOST_REGEX
 	help
 	  Boost.IOStreams provides a framework for defining streams,
 	  stream buffers and i/o filters.
@@ -172,6 +170,7 @@ config BR2_PACKAGE_BOOST_IOSTREAMS
 config BR2_PACKAGE_BOOST_JSON
 	bool "boost-json"
 	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Boost.JSON is a portable C++ library which provides containers
 	  and algorithms that implement JavaScript Object Notation, or
@@ -193,7 +192,6 @@ config BR2_PACKAGE_BOOST_LOCALE
 	depends on !(BR2_TOOLCHAIN_HAS_GCC_BUG_64735 && BR2_PACKAGE_ICU) # boost-thread
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
 		|| !BR2_PACKAGE_ICU # boost-thread
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD if BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -214,11 +212,7 @@ config BR2_PACKAGE_BOOST_LOG
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
-	select BR2_PACKAGE_BOOST_ATOMIC
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_REGEX
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Logging library.
@@ -233,6 +227,8 @@ comment "boost-log needs a toolchain not affected by GCC bug 64735"
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_RANDOM
 	help
 	  Boost.Math includes several contributions in the domain of
 	  mathematics:
@@ -282,6 +278,8 @@ config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 config BR2_PACKAGE_BOOST_PYTHON
 	bool "boost-python"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_GRAPH
 	help
 	  The Boost Python Library is a framework for interfacing Python
 	  and C++. It allows you to quickly and seamlessly expose C++
@@ -324,8 +322,6 @@ config BR2_PACKAGE_BOOST_SYSTEM
 config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_TIMER
 	help
 	  Support for simple program testing, full unit testing, and for
 	  program execution monitoring.
@@ -334,18 +330,16 @@ config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
-	select BR2_PACKAGE_BOOST_CHRONO
-	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_CHRONO  # For dependents only
 	help
 	  Portable C++ multi-threading. C++11, C++14.
 
 comment "boost-thread needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
+# check-symbol ignore
 config BR2_PACKAGE_BOOST_TIMER
 	bool "boost-timer"
-	select BR2_PACKAGE_BOOST_CHRONO
-	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Event timer, progress timer, and progress display classes.
 
@@ -361,9 +355,9 @@ config BR2_PACKAGE_BOOST_TYPE_ERASURE
 comment "boost-type_erasure needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
-# check-symbol ignore
 config BR2_PACKAGE_BOOST_URL
 	bool "boost-url"
+	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Boost.URL is a portable C++ library which provides containers
 	  and algorithms which model a "URL," more formally described
@@ -382,9 +376,9 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_m68k_cf
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
-	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_CONTAINER
 	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_SERIALIZATION
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The Boost.Wave library is a Standards conformant, and highly
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 14403758ac..505f0b9721 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
 # From https://www.boost.org/users/history/version_1_83_0.html
-sha256  6478edfe2f3305127cffe8caf73ea0176c53769f4bf1585be237eb30798c3b8e  boost_1_83_0.tar.bz2
+sha256  af57be25cb4c4f4b413ed692fe378affb4352ea50fbe294a11ef548f4d527d89  boost_1_87_0.tar.bz2
 
 # Locally computed
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 600364c5a7..834c4403b3 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.83.0
+BOOST_VERSION = 1.87.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = https://archives.boost.io/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
@@ -12,40 +12,104 @@ BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 BOOST_CPE_ID_VENDOR = boost
 
+# This is the list of libraries that Boost can build. They may not all be
+# exposed in the Buildroot menuconfig; only add them as the need arises.
+# How to maintain that list (the last step takes a bit of time):
+#  - make boost-direclean
+#  - make boost-patch
+#  - cd output/build/boost-X.Y.Z
+#  - ./bootstrap.sh --show-libraries |sed -r -e '/^ +- (.+)$/!d; s//\t\1 \\/' |sort
 BOOST_ALL_LIBS = \
+	any \
+	asio \
+	assert \
 	atomic \
+	beast \
+	bimap \
+	bind \
+	charconv \
 	chrono \
+	cobalt \
+	compat \
 	container \
+	container_hash \
 	context \
 	contract \
+	conversion \
+	core \
 	coroutine \
+	coroutine2 \
+	crc \
 	date_time \
+	describe \
+	detail \
+	dll \
+	endian \
 	exception \
 	fiber \
 	filesystem \
+	flyweight \
+	function \
+	function_types \
+	geometry \
 	graph \
 	graph_parallel \
+	hana \
 	headers \
+	heap \
+	integer \
+	interprocess \
+	intrusive \
 	iostreams \
+	iterator \
 	json \
+	lambda2 \
+	lexical_cast \
 	locale \
+	lockfree \
 	log \
 	math \
+	move \
+	mp11 \
 	mpi \
+	msm \
+	multi_index \
+	mysql \
 	nowide \
+	optional \
+	outcome \
+	parameter \
+	pfr \
+	poly_collection \
+	predef \
+	process \
 	program_options \
 	python \
 	random \
+	ratio \
+	redis \
 	regex \
+	scope \
 	serialization \
+	signals2 \
+	smart_ptr \
 	stacktrace \
+	stl_interfaces \
 	system \
 	test \
 	thread \
+	throw_exception \
 	timer \
+	tuple \
 	type_erasure \
+	type_index \
+	unordered \
 	url \
-	wave
+	uuid \
+	variant \
+	variant2 \
+	wave \
+	winapi
 
 BOOST_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
