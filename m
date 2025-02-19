Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225D4C021AB
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF796403FC;
	Wed, 19 Feb 2025 08:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pis517LO87E1; Wed, 19 Feb 2025 08:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A4CC503DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A4CC503DF;
	Wed, 19 Feb 2025 08:51:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0797A127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFA6B4F39A
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUVDtAelAsuT for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D83BD503A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D83BD503A3
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D83BD503A3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so2874883f8f.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955049; x=1740559849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=inpbX2HbcllW2Fm5I+l3j0o5C9jDy0yfHGXz8kDYSWM=;
 b=BwFCCpmRGmuAZdadNDOPWCPpSrFBbmqiEQ2fOM4POWx1B38NUc2Ghx/fdd3Bs7k7Kz
 xiBUX6IXT+7QCMYfQxbSmsAfCHYW31oKjj36mx3fFBGC7R8YfP20O2oqfUG08U2HloJZ
 OEyIFIOooD/iSYjrlBCD19hqOC9o3iDcTxHaOdX5OIioKaEIpX2J7jzpR/kZsWh6j4gi
 oxeIcFlJSlsFWnlBYOc++ru7Xt8CjtVDwkiB9KEeTFHK+RGXPaVa8iFgtoItJl9jYd2P
 p2VpAd8AweN8XC4m3YV7Wx3N69mvjwfClWnGz78OY+uMUD78UPGiTVnWhlxUQBN5AGqa
 WlxQ==
X-Gm-Message-State: AOJu0YwkOuEOh2OGPY0NVHaUDM7A6PbNHebunlypjzJA5Ykk0QVJxaJK
 v9t+6vRN7m+QwAe6snd38xw1YGg7XkTx2339bxxUpVMaCfq+WaPRZMGMsg==
X-Gm-Gg: ASbGncuBShLdLpWIx50zDgoI5kem5EAAEnnVtVw6bGyL668NE/XYcC9qdBHbYcH4XiA
 Vj70TqsymR7r3KLGUhQG2mtPmdlD6E+lKs4S4Z6WzpGNhNXdRbcRqCbrvwSfZv7YMuYATEHQmoF
 2cTzXnvXvm/iUymiPstChMsTUW6VuBbhAQJzGyGHmsgbumgmGJ/0r4+BLHoBdyoyFAEZKtDRUDe
 2Bja8ITAALQBGOzGOwQ+MSkhdJRQMW7vqknsshwnYxJIQ4OaekeboJla3+Z+qEWxcphb7uO3Mje
 m68Z0rKqf9hXDg3ITl3HGWkltA==
X-Google-Smtp-Source: AGHT+IFmu3yn+lHjXLrw8gGr60eZndgywDHqpuwtGIZK7pYzP+kJSbAiv7hmz9NwFH1+zRBHkGCK8w==
X-Received: by 2002:a05:6000:1888:b0:38f:2403:8e98 with SMTP id
 ffacd0b85a97d-38f5878e43amr2207358f8f.20.1739955048668; 
 Wed, 19 Feb 2025 00:50:48 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:48 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 09:50:24 +0100
Message-ID: <5490ba6a8140c287857a66cf76a2448ce4ba717e.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955049; x=1740559849; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=inpbX2HbcllW2Fm5I+l3j0o5C9jDy0yfHGXz8kDYSWM=;
 b=F8HXb4uRSM6/9six3FR+KnZOw38MF9rbvZdC21uyIOz5gRMdtQxokWogF0loAO05yK
 zQWakUKKCS0/WBTpFFM9kQeqqo5BLqOOI/JChieyiJL6g8tGC/ZIN9GAFFe/odzRd5Yt
 CaAotE74m2QYtu1fucQp/ITYUWYS1j1jKe4mU+HdIE4uce9ZzeioKG/rPDjLxPp6xMyP
 4+/DhvmMFPvdewGLN0QT37zizlN96JlZqswcot3pAy9ae+dRQ0W/jE8rP7ipM8ynvJmP
 urqt5RgHHlQ6UTUk13la57NwrNa6N0fuZuAIHJJv1FvGG8eJcmkQkRndaoesw9Va2Kqo
 ul+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F8HXb4uR
Subject: [Buildroot] [PATCH 09/27] package/boost: move taget library
 selection variables closer together
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/boost.mk | 66 +++++++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 044dd275b3..1dcc4a4b3a 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -12,39 +12,6 @@ BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 BOOST_CPE_ID_VENDOR = boost
 
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
-
 BOOST_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 BOOST_FLAGS = --with-toolset=gcc
@@ -152,6 +119,39 @@ endif
 BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
 endif
 
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTRACT),,contract)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FIBER),,fiber)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_IOSTREAMS),,iostreams)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_JSON),,json)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOCALE),,locale)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_NOWIDE),,nowide)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_REGEX),,regex)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SERIALIZATION),,serialization)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_STACKTRACE),,stacktrace)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SYSTEM),,system)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TEST),,test)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TIMER),,timer)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TYPE_ERASURE),,type_erasure)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_URL),,url)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
+
 BOOST_WITHOUT_FLAGS_COMMASEPARATED += $(subst $(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
 BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPARATED))
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
