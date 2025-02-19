Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D709CC021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9B7881313;
	Wed, 19 Feb 2025 08:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eo_Eia5fEc71; Wed, 19 Feb 2025 08:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C3E684D9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C3E684D9F;
	Wed, 19 Feb 2025 08:51:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DE42C8
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17A5D4F386
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZCDmVgshFif for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E12F503C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E12F503C1
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E12F503C1
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4399deda38cso1238155e9.1
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955054; x=1740559854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gBgnV9uB361OaiWzuRlovPeKJ5JPynTGlYcI4oFFzc4=;
 b=P9e9dty2I9wh6eWZVDCcCG/hzoSs6KvHp4nWZ3zywsjSIoVgL04cgqEWoXKvX99ZtV
 IJx3sibb2MeEElzMsNcOcIlMkCdrUjzuUNsAYqc58LXxPyjthtgkAjVlZ9hULl5P8b0L
 7GjEIKkHzrLoRiOq3uQEaCzn7iT1Oh/VjVSHDxdYtNyQ19zjin5SYIxOhTxxgk301Zo1
 XaxhZe6zHNT1opsHJOQRwcbNy9W4y6lONk1R2zn6B10b9+WiVytrzGRdON20+ztvtLdT
 8LgXkUmAO3BPJ2u258EWcOLy+vLy8Zhbf/4/d36kBrmBGOnRk/Jx5bEPNObpiDehTgV6
 x20g==
X-Gm-Message-State: AOJu0YzSBU8+IH+A2TJXKqk6wxaAhS7tGtUVvRuNuNPZlDiX8TN4Bq2V
 Go9ywXdgTassxZQjMLUhWM+o34+6oQjqUNFgSUOWPDa4qvxLaCzjbzpFvw==
X-Gm-Gg: ASbGncuKhkG5qjkgwww+WJUaWB9Z6JuYfEccHbZRoY6OHm0OjERMfkcoji3B+KgV/7T
 8Yf2YX0LDx+IRyfOjDZ4+0JYuiKpA4KpXhKQercRNYuYjxNqFSGzO4vejNSzAzLtStdbQ6F8w82
 Hjx2JToEPSlAl3byOEwtCceCX5K4Vmj8mlJ3q7p5Yj62ZqZH+ABZyp2XOBbIqn8K0vSLPP+/ocB
 waPzyIRmLVdB4MznPjRsmVFmUj2rSCS67WLwNBAHQGYvskvB808nlzPo2UGAeCymLxau7ySxbSh
 +EZVyQtp5eQ2aZSwORntcmUzmA==
X-Google-Smtp-Source: AGHT+IHsXVI1UFDNmS1bmW6+w6AM2lPKE3QRMB2ra/smzyoTtQC/Pv9hnOlfKN/aUYDzCpRigyF+aA==
X-Received: by 2002:a05:600c:4f91:b0:439:9a40:aa09 with SMTP id
 5b1f17b1804b1-4399a40ad23mr16754395e9.25.1739955054027; 
 Wed, 19 Feb 2025 00:50:54 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:53 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 09:50:32 +0100
Message-ID: <acb508b4dbb8f51e04526a8a2b56e5a7cdbe3534.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955054; x=1740559854; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gBgnV9uB361OaiWzuRlovPeKJ5JPynTGlYcI4oFFzc4=;
 b=PDnUCBAb1I+QO//BGmBG3CNYXqP3oRpo3eKjCSB6m0Jvgei98nXJJo+idHoSPooqrb
 zyoS0dceaO010d/sEl9944+6q8bwhu0z8UT6/cUWsEtIfW+bc7Qj5E3uYtv2yijnvTOJ
 KQFJuf/JmP31OnH7NIdjSMMqaB5qXXYFYo3uRzfBzgc7/NxPbyL0/Lf+VTGpMnmSkzVL
 w+T/ysFPMm1uGDIvkk2yIYeBCVTGaItbQLRk7JrN0f1W5cVZa1Kme7RbgOpz62I5hnnT
 jfnA2vS93Vd50cYzY/xkRT5oWOReSpsqJDorjigpsbw045aWf7kltFbnhw+7Ex1dzQ8E
 PU3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PDnUCBAb
Subject: [Buildroot] [PATCH 17/27] package/boost: commonalise list of libs
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

For the ost variant, if we do not have an option for a library, the
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
