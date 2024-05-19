Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CA9C25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 09:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E789B4033C;
	Sun, 19 May 2024 09:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3p02E2JsTOwb; Sun, 19 May 2024 09:16:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A996740360
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A996740360;
	Sun, 19 May 2024 09:16:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CE201C3BEF
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 09:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDADE40119
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 09:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FOdE-U-JDy3q for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 09:16:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.172;
 helo=mail-lj1-f172.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E21494010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E21494010F
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E21494010F
 for <buildroot@buildroot.org>; Sun, 19 May 2024 09:16:32 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2e724bc46c4so2331271fa.2
 for <buildroot@buildroot.org>; Sun, 19 May 2024 02:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716110190; x=1716714990;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O7B65dX3O49HXEqS831oO7eKJX6LteX8GS1akTQIRtI=;
 b=QkPmOTOGUSEROf4RuJdB4rHgPj1PFKhHZ3rtrfHv7vDRHg0Ua79R5o9nKdVL1DJXOt
 SRJbFBoKBYzbsNL1Dqp1so6FyJBtyj4iGUPet1drui8KdNx/BRTd/T5CjrTueTRZqerM
 p8yP4A3Q2YiiU92LJZi2LfqU5KCVETosDiUQWmQSsudQq+5niq7/sBxupauxrA+9yONc
 PUc+3XYXqtJJWCSFwOB/+piVBNfLmyTllkgrqlOvPmWMQeeiR9mhv0G51U5FmJLtjyqF
 o9S0NCTGn5jZK7cIAmFlyjMYcwqwUmiv1jLshmSrLXsrfvX2clTPUj7a0kUwCEGwrGld
 YpRQ==
X-Gm-Message-State: AOJu0Yy3iAuAr9kIq+D0bvhtF/sDE0eYnCD14yGxm3xIsRT9L3/o6pxT
 e7OsZnsQFGhs8VHMkYOIWr23u0i6I355o2Hp3IQhkYq8Dh0CGou5WVksTw==
X-Google-Smtp-Source: AGHT+IFN1qeKzxgp/tt1My5rNTVV6mysjuzoQTHGdiFWYX0XjGmqlRCU5sEmEiW/ODRnwis1RjBl9w==
X-Received: by 2002:a2e:a7c5:0:b0:2e6:f4c1:31e5 with SMTP id
 38308e7fff4ca-2e6f4c13875mr97015051fa.23.1716110190013; 
 Sun, 19 May 2024 02:16:30 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:511e:920d:27e2:2c76])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fe518a8fasm351628415e9.33.2024.05.19.02.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 02:16:29 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sun, 19 May 2024 11:16:26 +0200
Message-Id: <20240519091627.2195972-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v4 1/2] package/x11r7/xlib_libxshmfence: fix
 build on riscv32
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In preparation to revert e39ad96136a8c340b3aea6b036024e28f14584f3,
and (partial) 26642e4cc09666110d5105e7867579a0e48cfa09.

xshmfence_futex.h: In function 'sys_futex':
xshmfence_futex.h:58:24: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
   58 |         return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
      |                        ^~~~~~~~~
      |                        sys_futex

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/commit/e39ad96136a8c340b3aea6b036024e28f14584f3

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v4: move xlib_libxshmfence to separate patch series
---
 ...tex.h-fix-build-on-32-bit-architectu.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch

diff --git a/package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch b/package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch
new file mode 100644
index 0000000000..f4ef558615
--- /dev/null
+++ b/package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch
@@ -0,0 +1,46 @@
+From 4fca45a71f08a5bebd12d39c85f49e0b0e4426bf Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Fri, 5 Apr 2024 10:45:15 +0200
+Subject: [PATCH] src/xshmfence_futex.h: fix build on 32-bit architectures
+ using 64-bit time_t
+
+Fix the following build failure on 32-bit architectures using 64-bit
+time_t (e.g. riscv32):
+
+xshmfence_futex.h: In function 'sys_futex':
+xshmfence_futex.h:58:24: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
+   58 |         return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
+      |                        ^~~~~~~~~
+      |                        sys_futex
+
+Similar to:
+https://gitlab.freedesktop.org/mesa/mesa/-/commit/7d87478124061915582412ba410759afe863d679
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/commit/e39ad96136a8c340b3aea6b036024e28f14584f3
+
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxshmfence/-/merge_requests/8>
+Upstream: https://gitlab.freedesktop.org/xorg/lib/libxshmfence/-/commit/4fca45a71f08a5bebd12d39c85f49e0b0e4426bf
+---
+ src/xshmfence_futex.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/xshmfence_futex.h b/src/xshmfence_futex.h
+index 673ac0e..4476038 100644
+--- a/src/xshmfence_futex.h
++++ b/src/xshmfence_futex.h
+@@ -53,6 +53,10 @@ static inline int futex_wait(int32_t *addr, int32_t value) {
+ #include <sys/time.h>
+ #include <sys/syscall.h>
+ 
++#ifndef SYS_futex
++#define SYS_futex SYS_futex_time64
++#endif
++
+ static inline long sys_futex(void *addr1, int op, int val1, struct timespec *timeout, void *addr2, int val3)
+ {
+ 	return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
