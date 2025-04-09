Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991AEC369A6
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A15D61AD8;
	Wed,  9 Apr 2025 20:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMmejBwBCo5H; Wed,  9 Apr 2025 20:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 768E861AC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 768E861AC1;
	Wed,  9 Apr 2025 20:04:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14A28256
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C08EF617A1
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvaXVTUsTXoj for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 74C1A60EAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74C1A60EAA
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74C1A60EAA
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:54 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso838085e9.2
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229032; x=1744833832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x+sSV5QWujT7M0hWUxvK3oHIAN8S+ZpHHDZjKcjJJx0=;
 b=LNgSiyUTozJ6LLz+YBLwm+j1sVsMcsrlHyWZ9f/2n4qBCTX9YdIEY3jXepCjNvUKF9
 CrR3xMX4eugGiHSeGP3zCGrqNOkmnLc+DcfUXyx2WAXFdPhupF18k1fi9q3rlPsNL5a6
 Is9G8hvPp7QpzxnsqbaUNFb2nAPLFs+ClEH/7KVBSo86f50hk6X7L+BTOpKkVkwyPPxS
 jqIPh76tuKBQKVEkHBwsoWk05BX3mcyrWFCTC9+7Wi88sufP3N49tiKZdIvbW+krokNG
 sOArk2RJq5VPzqhkJy07N6JSRr6eJ2GNEvvsX9AYCPD1zm4XwgJ2cMRwhdbsX42Unahn
 jnzw==
X-Gm-Message-State: AOJu0YyyTV1IYK+hvVCiT1wxl5DrAFtxudwcAWsD0+1++J065Fig1ejb
 1Cjsg+j9iqMmI98IJOfw3sgi3Y43EuFkvSpq+0hi/BPLKTtpxahatCgoAw==
X-Gm-Gg: ASbGncsNDpQkPbMJIXcEpbSgYhmlgoaO70XNSIxfU0s0sG3++FXj37EwoGS9fk2NzX4
 sESv9mkDpgaPPvCRTAjZSIH3bZjcU0lvwXN62iFPqq7kSOLBt4uNte/6r7s2CHu+ku32xFCl256
 rUOjOKf4QBhYn95iLIitR99l9CG0DYan3+iq7dxHnLdNYM+H0SJhr9MO9jE4de52IVKFW1KIt5+
 I37kz/qxzULqkuKonX6LhQS+5VOSIZbJcgZ/T8rudQ+jFd+Y+5UXUWwoj2+o0fE+aHSd+TJNyvK
 yGvR4cKhc8ZUKwBWHTlcCXBKeiGH7L8WfoFDoktDGGpcjE1i0KE=
X-Google-Smtp-Source: AGHT+IHrdieUpYwONDmK9sKMn4iox5YipoEnLZOevYS71+c3DwOQ6Bd0Iey5tsnmaMb4tODfKZx+Ng==
X-Received: by 2002:a5d:598e:0:b0:39c:1424:2827 with SMTP id
 ffacd0b85a97d-39d8f46d10bmr75918f8f.15.1744229032391; 
 Wed, 09 Apr 2025 13:03:52 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:52 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 22:03:32 +0200
Message-ID: <1ef10064377bab30363c372eb685a32c984d92de.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229032; x=1744833832; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+sSV5QWujT7M0hWUxvK3oHIAN8S+ZpHHDZjKcjJJx0=;
 b=G2p6LRYS2FbzvN8/qrsibOpzcqRN1Xpzn/HPRWnTvKKGowbqpYIP54J+QxEkSTzM+v
 ynd+dLrXktacPQ7IC9NwU/+3aLkxPjv6wdkRx4EfeIIAOWxcKk+yuKA0ei5/u2zp4pVW
 lh62bnzh82Y4eSJwWSgL63W8A1hLqy8yBwNSPXBtBCxAPYjN5eRPknUzm6BBK9HetBVl
 URdzkFjee5T3n51WEgSwIylRtvFKxLQBdjfNLSerdBPQwT5zsgkI4Rx0vXK4qHfpz3I7
 tiD84hhqrq8OIYlJwYsIywOfh4+AQEeE+nLV58X1i9HqbB7JSkNeLuh9Bu1xdVemcpDB
 BjfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G2p6LRYS
Subject: [Buildroot] [PATCH 17/29 v2] package/boost: commonalise list of libs
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

The list of available libraries is duplicated for the host and target
variants, which is prone to getting desynchronised next time we bump and
the list changes (with additions or removals).

This incidentally greatly cleanups the target variant variable, which
used the superfluous, verbose repetition of append-assignments rather
than a multi-line single assignment.

For the host variant, if we do not have an option for a library, the
library will default to being disabled, which is exactly what we want.

Note: This diff best viewed with: --anchored='BOOST_TARGET_CXXFLAGS ='

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in      |   6 ++
 package/boost/Config.in.host |   2 +
 package/boost/boost.mk       | 103 +++++++++++++----------------------
 3 files changed, 47 insertions(+), 64 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index c7c90aa9ab..f37efd129b 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -98,6 +98,7 @@ config BR2_PACKAGE_BOOST_DATE_TIME
 	  A set of date-time libraries based on generic programming
 	  concepts.
 
+# check-symbol ignore
 config BR2_PACKAGE_BOOST_EXCEPTION
 	bool "boost-exception"
 	help
@@ -146,6 +147,7 @@ config BR2_PACKAGE_BOOST_GRAPH
 	  The BGL graph interface and graph components are generic, in
 	  the same sense as the the Standard Template Library (STL).
 
+# check-symbol ignore
 config BR2_PACKAGE_BOOST_GRAPH_PARALLEL
 	bool "boost-graph_parallel"
 	help
@@ -249,12 +251,14 @@ config BR2_PACKAGE_BOOST_MATH
 comment "boost-math needs a toolchain w/ C++14, gcc>=5.0"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
+# check-symbol ignore
 config BR2_PACKAGE_BOOST_MPI
 	bool "boost-mpi"
 	help
 	  Message Passing Interface library, for use in
 	  distributed-memory parallel application programming.
 
+# check-symbol ignore
 config BR2_PACKAGE_BOOST_NOWIDE
 	bool "boost-nowide"
 	help
@@ -294,6 +298,7 @@ config BR2_PACKAGE_BOOST_SERIALIZATION
 	help
 	  Serialization for persistence and marshalling.
 
+# check-symbol ignore
 config BR2_PACKAGE_BOOST_STACKTRACE
 	bool "boost-stacktrace"
 	depends on !BR2_STATIC_LIBS
@@ -349,6 +354,7 @@ config BR2_PACKAGE_BOOST_TYPE_ERASURE
 comment "boost-type_erasure needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
+# check-symbol ignore
 config BR2_PACKAGE_BOOST_URL
 	bool "boost-url"
 	help
diff --git a/package/boost/Config.in.host b/package/boost/Config.in.host
index d377a8fbd8..bf69287383 100644
--- a/package/boost/Config.in.host
+++ b/package/boost/Config.in.host
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_HOST_BOOST
 	bool
 
+# keep host variant as minimal as possible, only add options when
+# an actual host package needs it.
 if BR2_PACKAGE_HOST_BOOST
 
 config BR2_PACKAGE_HOST_BOOST_REGEX
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 95191476a8..2b952baaac 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -12,36 +12,7 @@ BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 BOOST_CPE_ID_VENDOR = boost
 
-BOOST_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
-
-BOOST_FLAGS = --with-toolset=gcc
-
-ifeq ($(BR2_PACKAGE_ICU),y)
-BOOST_FLAGS += --with-icu=$(STAGING_DIR)/usr
-BOOST_DEPENDENCIES += icu
-else
-BOOST_FLAGS += --without-icu
-endif
-
-ifeq ($(BR2_PACKAGE_BOOST_IOSTREAMS),y)
-BOOST_DEPENDENCIES += bzip2 zlib
-endif
-
-ifeq ($(BR2_PACKAGE_BOOST_PYTHON),y)
-BOOST_FLAGS += \
-	--with-python-root=$(HOST_DIR) \
-	--with-python=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)
-BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
-BOOST_DEPENDENCIES += python3
-endif
-
-HOST_BOOST_FLAGS = \
-	--without-icu \
-	--with-toolset=gcc
-
-# keep host variant as minimal as possible, only add options when
-# an actual host package needs it.
-HOST_BOOST_WITHOUT_FLAGS = \
+BOOST_ALL_LIBS = \
 	atomic \
 	chrono \
 	container \
@@ -64,10 +35,10 @@ HOST_BOOST_WITHOUT_FLAGS = \
 	program_options \
 	python \
 	random \
-	$(if $(BR2_PACKAGE_HOST_BOOST_REGEX),,regex) \
+	regex \
 	serialization \
 	stacktrace \
-	$(if $(BR2_PACKAGE_HOST_BOOST_SYSTEM),,system) \
+	system \
 	test \
 	thread \
 	timer \
@@ -75,6 +46,38 @@ HOST_BOOST_WITHOUT_FLAGS = \
 	url \
 	wave
 
+BOOST_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+BOOST_FLAGS = --with-toolset=gcc
+
+ifeq ($(BR2_PACKAGE_ICU),y)
+BOOST_FLAGS += --with-icu=$(STAGING_DIR)/usr
+BOOST_DEPENDENCIES += icu
+else
+BOOST_FLAGS += --without-icu
+endif
+
+ifeq ($(BR2_PACKAGE_BOOST_IOSTREAMS),y)
+BOOST_DEPENDENCIES += bzip2 zlib
+endif
+
+ifeq ($(BR2_PACKAGE_BOOST_PYTHON),y)
+BOOST_FLAGS += \
+	--with-python-root=$(HOST_DIR) \
+	--with-python=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)
+BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
+BOOST_DEPENDENCIES += python3
+endif
+
+HOST_BOOST_FLAGS = \
+	--without-icu \
+	--with-toolset=gcc
+
+HOST_BOOST_WITHOUT_FLAGS = \
+	$(foreach lib, $(BOOST_ALL_LIBS), \
+		$(if $(BR2_PACKAGE_HOST_BOOST_$(call UPPERCASE,$(lib))),,$(lib)) \
+	)
+
 HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED = $(subst $(space),$(comma),$(strip $(HOST_BOOST_WITHOUT_FLAGS)))
 HOST_BOOST_FLAGS += $(if $(HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED))
 
@@ -126,38 +129,10 @@ endif
 BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
 endif
 
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTRACT),,contract)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FIBER),,fiber)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_IOSTREAMS),,iostreams)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_JSON),,json)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOCALE),,locale)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_NOWIDE),,nowide)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_REGEX),,regex)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SERIALIZATION),,serialization)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_STACKTRACE),,stacktrace)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SYSTEM),,system)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TEST),,test)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TIMER),,timer)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TYPE_ERASURE),,type_erasure)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_URL),,url)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
+BOOST_WITHOUT_FLAGS = \
+	$(foreach lib, $(BOOST_ALL_LIBS), \
+		$(if $(BR2_PACKAGE_BOOST_$(call UPPERCASE,$(lib))),,$(lib)) \
+	)
 
 BOOST_WITHOUT_FLAGS_COMMASEPARATED += $(subst $(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
 BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPARATED))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
