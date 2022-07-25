Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92730C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3752340D93;
	Mon, 25 Jul 2022 15:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3752340D93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PLfTURQkWDOm; Mon, 25 Jul 2022 15:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD547416FD;
	Mon, 25 Jul 2022 15:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD547416FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2290A1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B47A84C34
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B47A84C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LmZjt7tNWz7G for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:22:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B28F7847FF
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B28F7847FF
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:22:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z13so16458299wro.13
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1QEs00wYSz/Hm47+fHafMoHyrOL6CBoswST3nT2JVuM=;
 b=WpJtoGHbQVLJg/97psKZeIvvidNxtD7yGcNazxyJarcWwH2ivbE0CuLDtJc04J5G8S
 gsOR0tll59Nx/zWHkGI6jdyXmRnftCHxROz6b80+KN1vkxeATDJuWwCWvmFt8NvJrcIg
 +a5LQ84yL2O+/qgSb7dwbL3Z5me5o554gvyjmQ5WVO0S+Qsc47auq6r2t8XcgvXZN0Fm
 FwbDa6A3hXXpeLqx1HdyqRAh9v9K9mN0QHLFjpwMrSH9l0982a+cbZPjrNfogLD0jt2B
 LjX1dd5BQ3I8W3Cq5RITCRTeKKoZrLY9h3EUHKJAm/4l78mnYQ8mTTRSbxEW4BHO7rE7
 3vGw==
X-Gm-Message-State: AJIora88puFh7I1/goQ4TRLJbdr1uccTO8/rtBRtdOTZ89/PuGOjZByX
 UmaExMhhDv5g5JbeMiaYSXphHkiTGkzWvw==
X-Google-Smtp-Source: AGRyM1sXd8AigYcVx9/8+qw2WwgaJk0czfSeNiM291I7A3+3PiSMaX2N1vDLNAVseV+pij+i3uj72Q==
X-Received: by 2002:a5d:69ca:0:b0:21d:640c:79f6 with SMTP id
 s10-20020a5d69ca000000b0021d640c79f6mr7781763wrw.309.1658762551757; 
 Mon, 25 Jul 2022 08:22:31 -0700 (PDT)
Received: from arnoutx1.home ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c378800b003a2e7c13a3asm14244983wmr.42.2022.07.25.08.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 08:22:31 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 17:22:26 +0200
Message-Id: <20220725152229.3370033-2-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220725152229.3370033-1-arnout@mind.be>
References: <20220725152229.3370033-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1QEs00wYSz/Hm47+fHafMoHyrOL6CBoswST3nT2JVuM=;
 b=fkCGI9ShxfcSpZtAZMk2rP0PgrFyjcWW2vncMpjsZFw+93WAFDu5/d+X/S2Lx/DcFI
 yYkcYwQYP8ot1zyA+jV4SGmEmfYbGgTZxJQL6QzRgtBLyoFD/CyrURb299n8hsTclWdA
 5bTwSZgTimB7g58GfAQmj0qr5H/fSq1/JI3g620kqhaK7B7AN9wlgzWOrlL3UIm/kVMr
 nQvhZ86I3v7D5WkgFWpF6XLfkFDG8Otzy70MrPo1Dh9dqeytqkj617hClDgRSThaHuAP
 Chi8LOwvm4IgdVkVkPJNhyeNbHigzxZwR44yMp3gvvrE/6pdkG83qCLBLd4EDcNZYdFb
 4mxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fkCGI9Sh
Subject: [Buildroot] [PATCH 2/5] package/*: use BR2_ENABLE_LTO to enable LTO
 instead of BR2_GCC_ENABLE_LTO
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
Cc: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>,
 Douglas RAILLARD <public.douglas.raillard@gmail.com>,
 Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The BR2_GCC_ENABLE_LTO controls whether or not LTO is available in the
(internal) toolchain - it shouldn't be used to control whether packages
are built with LTO. Use the new BR2_ENABLE_LTO option instead.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/fastd/fastd.mk         | 2 +-
 package/log4cplus/log4cplus.mk | 2 +-
 package/netdata/netdata.mk     | 2 +-
 package/rocksdb/rocksdb.mk     | 2 +-
 package/unbound/unbound.mk     | 2 +-
 package/valgrind/valgrind.mk   | 2 +-
 package/wireshark/wireshark.mk | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index 5cd6a909c3..6c496cf9ef 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -46,7 +46,7 @@ else
 FASTD_CONF_OPTS += -Dsystemd=disabled
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 FASTD_CONF_OPTS += -Db_lto=true
 else
 FASTD_CONF_OPTS += -Db_lto=false
diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index b2e9ac3ed1..2dab661654 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -11,7 +11,7 @@ LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
 LOG4CPLUS_LICENSE_FILES = LICENSE
 LOG4CPLUS_INSTALL_STAGING = YES
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 LOG4CPLUS_CONF_OPTS += --enable-lto
 else
 LOG4CPLUS_CONF_OPTS += --disable-lto
diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 04b146591f..9e661f4943 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -23,7 +23,7 @@ NETDATA_DEPENDENCIES = libuv util-linux zlib
 # provided by autoconf relies on wchar_t.
 NETDATA_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 NETDATA_CONF_OPTS += --enable-lto
 else
 NETDATA_CONF_OPTS += --disable-lto
diff --git a/package/rocksdb/rocksdb.mk b/package/rocksdb/rocksdb.mk
index c355d0012d..bed0634134 100644
--- a/package/rocksdb/rocksdb.mk
+++ b/package/rocksdb/rocksdb.mk
@@ -69,7 +69,7 @@ else
 ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_ZSTD=1
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 ROCKSDB_MAKE_OPTS += USE_LTO=1
 else
 ROCKSDB_MAKE_OPTS += USE_LTO=0
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 988508576b..8863d039bb 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -35,7 +35,7 @@ else
 UNBOUND_CONF_OPTS += --without-pthreads
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 UNBOUND_CONF_OPTS += --enable-flto
 else
 UNBOUND_CONF_OPTS += --disable-flto
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index b4c4b8b5a2..17b131c3ec 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -52,7 +52,7 @@ VALGRIND_CONF_OPTS += \
 	--host=$(patsubst arm-%,armv7-%,$(GNU_TARGET_NAME))
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 VALGRIND_CONF_OPTS += --enable-lto
 else
 VALGRIND_CONF_OPTS += --disable-lto
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 1a549f7037..e5d5e6f677 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -31,7 +31,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 WIRESHARK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 WIRESHARK_CONF_OPTS += -DENABLE_LTO=ON
 else
 WIRESHARK_CONF_OPTS += -DENABLE_LTO=OFF
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
