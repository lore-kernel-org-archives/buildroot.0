Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7C8C0219D
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 22:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96A9182E95;
	Fri,  7 Feb 2025 22:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36aK4QzNhGXl; Fri,  7 Feb 2025 22:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93AC381F25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93AC381F25;
	Fri,  7 Feb 2025 22:14:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12DC21B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 22:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 027DC409B4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 22:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YxNHYhHbea15 for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 22:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.53;
 helo=mail-wm1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F9A24059B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F9A24059B
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F9A24059B
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 22:14:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so27969315e9.0
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 14:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738966464; x=1739571264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DJfBC1Qz+2GaM64AC1sJVMZBct1xLN8LpwppyQKDnwM=;
 b=k3gbQCdH4tCbTaapTSPXVONniyhcxBlo2xbGTsarJpNQ6MhGAdM4aAKwIe2yAOWaBP
 MdkRhDrqRVPbsarSQpX63N/KrZGY4kTy2xPVAIdohXNXywAfi53GL5wAtUj0lQczoBnd
 zsjjDlQq5kd3KhEL4oeTfNNrTSEo9Qyt7NUqAUfEr+47HuMHogWEco7CQXC4CWBiC0e8
 cyq37RwIoNja62AQdHU1JpteH5OBiKU1dIEuXU4FK1NZ8DDOIfTtA2AGhwHIiOPXAnzb
 iQkxBNARPtrm+k++yWQi5+WKPwvsqD6UzWYl7tQTSgOjSuEE9Yfew68luNSuNocNsFq/
 2E7A==
X-Gm-Message-State: AOJu0YwqmQ8LkkZ/2v9ZDK0aQERTVibZ0n4kG4SY1msk7/MVybbyW6jg
 86zu3xMOakxDqMWCeh3TSBpVzIqejqZq9RbTwOhUBRJYVItp+YaO1w6fFwPOJzU=
X-Gm-Gg: ASbGncux1cZidh0mnzElm1drphgcJgvCMdzRqchqx9jlG/lTCOJ2z96Rbna52JQcpZ4
 wo5ZlxKYkC18EQUoeShXoLHkbz6wNYvU+lS106TRiw5eo81VHH8ZWYZeT0znKm2qE9BO88b8g1e
 gsdMvHoS+a31PYqDla9esuLliL18cDAK/kJbFKsPHc2ajXwzHYhobR+3OvPYhfMhpuQ8cC+uMY9
 A/U9ss/gw6Xi1iifyy7FHUYGA+cmfEQgkis67y2YonKfKmtv+qgTZiYBPfakWCn55Ki+8DD0FXQ
 IruFxtq82JXopVdv/33/rrseRXU+U3jOQy8ljIEBNkYZUg==
X-Google-Smtp-Source: AGHT+IHxjs7Et5vdcqL/Bv421neUzPw+FjzuOc/L/HG8mbaG0Ho7hZ5ihad/W9Z9rvH/6d+dnNbhfQ==
X-Received: by 2002:a05:600c:4687:b0:434:fa61:fdfb with SMTP id
 5b1f17b1804b1-43924991398mr46396755e9.18.1738966463349; 
 Fri, 07 Feb 2025 14:14:23 -0800 (PST)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:c6ae:4084:c50f:f7ad])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dca0041sm66428855e9.14.2025.02.07.14.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 14:14:23 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Fri,  7 Feb 2025 23:14:20 +0100
Message-ID: <20250207221420.839802-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/x11r7/xlib_libxshmfence: bump version
 to 1.3.3
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

Announcement:
https://lists.x.org/archives/xorg-announce/2022-December/003287.html

Removed 0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch,
which is accepted upstream.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...tex.h-fix-build-on-32-bit-architectu.patch | 46 -------------------
 .../xlib_libxshmfence/xlib_libxshmfence.hash  |  6 +--
 .../xlib_libxshmfence/xlib_libxshmfence.mk    |  2 +-
 3 files changed, 4 insertions(+), 50 deletions(-)
 delete mode 100644 package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch

diff --git a/package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch b/package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch
deleted file mode 100644
index 40a796c4f2..0000000000
--- a/package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4fca45a71f08a5bebd12d39c85f49e0b0e4426bf Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Fri, 5 Apr 2024 10:45:15 +0200
-Subject: [PATCH] src/xshmfence_futex.h: fix build on 32-bit architectures
- using 64-bit time_t
-
-Fix the following build failure on 32-bit architectures using 64-bit
-time_t (e.g. riscv32):
-
-xshmfence_futex.h: In function 'sys_futex':
-xshmfence_futex.h:58:24: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
-   58 |         return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
-      |                        ^~~~~~~~~
-      |                        sys_futex
-
-Similar to:
-https://gitlab.freedesktop.org/mesa/mesa/-/commit/7d87478124061915582412ba410759afe863d679
-
-Fixes:
-https://gitlab.com/buildroot.org/buildroot/-/commit/e39ad96136a8c340b3aea6b036024e28f14584f3
-
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
-Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxshmfence/-/merge_requests/8>
-Upstream: https://gitlab.freedesktop.org/xorg/lib/libxshmfence/-/commit/4fca45a71f08a5bebd12d39c85f49e0b0e4426bf
----
- src/xshmfence_futex.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/xshmfence_futex.h b/src/xshmfence_futex.h
-index 673ac0e..4476038 100644
---- a/src/xshmfence_futex.h
-+++ b/src/xshmfence_futex.h
-@@ -53,6 +53,10 @@ static inline int futex_wait(int32_t *addr, int32_t value) {
- #include <sys/time.h>
- #include <sys/syscall.h>
- 
-+#if defined(SYS_futex_time64) && !defined(SYS_futex)
-+#define SYS_futex SYS_futex_time64
-+#endif
-+
- static inline long sys_futex(void *addr1, int op, int val1, struct timespec *timeout, void *addr2, int val3)
- {
- 	return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
--- 
-2.34.1
-
diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
index e8f83d427f..a9549ead30 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003287.html
-sha256  870df257bc40b126d91b5a8f1da6ca8a524555268c50b59c0acd1a27f361606f  libxshmfence-1.3.2.tar.xz
-sha512  e20a6827e370726cf50489a69f4a52b897f1c44e3eba8c72a4e626b08724e877d090770b8016765736d887d5d5eaba1fda9c29066e62d259b4d1e2064bc1626c  libxshmfence-1.3.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003572.html
+sha256  d4a4df096aba96fea02c029ee3a44e11a47eb7f7213c1a729be83e85ec3fde10  libxshmfence-1.3.3.tar.xz
+sha512  2261b840ea621cf4ce31961ec9df17aa2e253b268afe289dfb97c240aee27b9f443fe36de5de52a2e1210b69092efde21871e20556bac9b4f1d8a3ead1b4c498  libxshmfence-1.3.3.tar.xz
 # Locally computed
 sha256  64a579d1a0b3347301d87c94698a58ea7933d0ae6ca7e8fdd702fde2ea376301  COPYING
diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
index 4241102855..b8c9ebfe97 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXSHMFENCE_VERSION = 1.3.2
+XLIB_LIBXSHMFENCE_VERSION = 1.3.3
 XLIB_LIBXSHMFENCE_SOURCE = libxshmfence-$(XLIB_LIBXSHMFENCE_VERSION).tar.xz
 XLIB_LIBXSHMFENCE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSHMFENCE_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
