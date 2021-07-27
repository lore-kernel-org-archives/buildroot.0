Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3E7C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 08:01:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4F80611F0
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 08:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4F80611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F53B40172;
	Tue, 27 Jul 2021 08:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5OOVdQlLeuTV; Tue, 27 Jul 2021 08:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9799402C8;
	Tue, 27 Jul 2021 08:01:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D4C381BF293
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 08:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D19704010A
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 08:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Q_2C_TB8nnE for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 08:01:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FFF1403B7
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 08:01:26 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so1674301wmd.3
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 01:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0uWxQ5xb1I30/qpWR6SRsaYQLZSecQ3NP28LyckBjDo=;
 b=DAlwacLNtC8S+VXAJvhXPkk/OLgAS7rL9RLvkFm6a0AJ1r6VZvBdqNp8oQSjF0THOI
 M6z1B4uAHrjMgMOzv5UfsZ3oWq7ZVBSexEgmQlRAXjc77GwZbERievgw0F88euS0JGte
 s7nNoKJl8WIhf+eB1No07PkrQrw+8NHw7hy5GvjhhU2dGttyIw5uPnMPw61QQHN04U0T
 wiXG/iMUMl5MOo70nSOLbuuZOP+b8Ehl5n7B40Kwuq/JQJzcY90Ifi+7WEjdKZXKpEeM
 BnbCB7niiN4nIztHRqTDeNPcnyd1J8Mg0XnFNv2dj6k7MX3Gsx5Xw/oBmskHO5zXABsT
 C2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0uWxQ5xb1I30/qpWR6SRsaYQLZSecQ3NP28LyckBjDo=;
 b=eeIJOcZ+t3w9B2NSamudExrkbQx5Tts+rgp5vhz9+WsWRoU/ExhBXQKcOORYYzGzln
 Q4BNylOH8WZDe9tnvqtuTikd1NoVZjuasoa87xoXnthbGffL5dJD/AQjrvQb4Hz/5NIC
 CrUpUwNRqn26SdoYW/BrLMIz5UNoHH29SoelTT2sLLomyQyS9LGWznpRcFhXGCwOMLKV
 jJOC3ASHf1TS7HUUEj3G0xjzvIXZaJ+dGEbZUMLWnOlt36WHC0hJzitFVy0Gk5EUKSVa
 uXjVJ1dTXzfucI8YtRUWikZ00Q0EGGvwQLPikQ8dsnphs5eCUXfdxMLLMqUkgQ4B+OkQ
 h/dA==
X-Gm-Message-State: AOAM530nR7pr37jSugNGSr2jkTWTuMZl1JpD7iCpC6/Fx9o8eI9DLBhx
 GZ92wlvAZCsXfWbpynSoOWnJ04ndjAR5Cg==
X-Google-Smtp-Source: ABdhPJyhf8hEQysqEbPgpi16QVVuElZpO77qUyzvuz1SUBSZKs2vvyke1wsDkvdOQAiK2B0Y1Pr4gg==
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr2681734wmi.67.1627372884322; 
 Tue, 27 Jul 2021 01:01:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id d67sm2067180wmd.9.2021.07.27.01.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 01:01:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 10:01:14 +0200
Message-Id: <20210727080115.2314012-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] Revert "package/daq3: fix build without
 threads"
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This reverts commit 7c8641e5a97b89c14aebd730772e9cc037de6ccc as threads
are also used by afpacket and bpf modules if libpcap is found.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/daq3/0001-add-disable-example.patch | 49 ---------------------
 package/daq3/daq3.mk                        |  3 +-
 2 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 package/daq3/0001-add-disable-example.patch

diff --git a/package/daq3/0001-add-disable-example.patch b/package/daq3/0001-add-disable-example.patch
deleted file mode 100644
index c126e32859..0000000000
--- a/package/daq3/0001-add-disable-example.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 1d7031dde8da39cd2151f87d68dddea91f304603 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 19 Jun 2021 11:31:35 +0200
-Subject: [PATCH] add --disable-example
-
-Add --disable-example to be able to build daq on toolchains without
-threads support
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/snort3/libdaq/pull/13]
----
- Makefile.am  | 5 ++++-
- configure.ac | 5 +++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index dcba62b..0a79319 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -7,6 +7,9 @@ pkgconfig_DATA = libdaq.pc
- if BUILD_MODULES
-     MODULES_DIR = modules
- endif
--SUBDIRS = api $(MODULES_DIR) example test
-+SUBDIRS = api $(MODULES_DIR) test
-+if BUILD_EXAMPLE
-+    SUBDIRS += example
-+endif
- 
- ACLOCAL_AMFLAGS = -I m4
-diff --git a/configure.ac b/configure.ac
-index 23b38a2..36a09ee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -274,6 +274,11 @@ AM_CONDITIONAL([BUILD_MODULES], [test "$enable_afpacket_module" = yes -o \
- 
- LIBS=${save_LIBS}
- 
-+AC_ARG_ENABLE(example,
-+              AS_HELP_STRING([--disable-example],[do not build the example]),
-+              [enable_example="$enableval"], [enable_example=yes])
-+AM_CONDITIONAL([BUILD_EXAMPLE], [test "$enable_example" = yes])
-+
- AC_CHECK_LIB([dl], [dlopen], [LIBDL="-ldl"])
- 
- AM_CONDITIONAL([BUILD_SHARED_MODULES], [ test "$enable_shared" = yes ])
--- 
-2.30.2
-
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index b726031d39..1de7e53a79 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -12,7 +12,6 @@ DAQ3_INSTALL_STAGING = YES
 DAQ3_DEPENDENCIES = host-pkgconf
 # From git
 DAQ3_AUTORECONF = YES
-DAQ3_CONF_OPTS = --disable-example
 
 ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
 DAQ3_DEPENDENCIES += libnetfilter_queue
@@ -21,7 +20,7 @@ else
 DAQ3_CONF_OPTS += --disable-nfq-module
 endif
 
-ifeq ($(BR2_PACKAGE_LIBPCAP)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 DAQ3_DEPENDENCIES += libpcap
 DAQ3_CONF_OPTS += --enable-pcap-module
 else
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
