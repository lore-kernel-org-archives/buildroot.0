Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4890C4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 18:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9268A60AD1;
	Tue, 16 Apr 2024 18:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9A7FCRdIEcdG; Tue, 16 Apr 2024 18:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9091860ACE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9091860ACE;
	Tue, 16 Apr 2024 18:43:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EC331BF969
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 18:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7877C40225
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 18:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0m1kcy2UrEn for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 18:42:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.48;
 helo=mail-ej1-f48.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4FDB40211
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4FDB40211
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4FDB40211
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 18:42:26 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a523524e5baso578874166b.3
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 11:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713292944; x=1713897744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d/YaeWOq3x6nXJaUidsQDKKtkoIbKgnsEegulVvGcpc=;
 b=EsPOJ1n8HyPrfYF+56DdkM1fE9n1GToZg+MKMvIAgRo/w3y3wzKMvAUW2VQWgyRsos
 fsXVW1nqFeqmthq7xfsw/utUDQ6zsp8ldcawN6kdcrEVra7vEg9IS8wd/91aJapR1yZO
 M/jibPIAiUt+TVOlTC2pdH0UddS0VD7SodG/J7eY94o6BbLGI0arEJfZ5tH3Lol5KYKb
 hzknY1SD92Jn3pX2T7Cv23OK2oVOxv285BYXziPFp4eqmEpSpg+Jbfoe5VYGFQ9bsDL1
 GMzxd39f4fsEWM3FogVNQ/YI2G162MQuUxX/2RO1q9q7wF1+vrry8suYbKAMEmSICcw6
 Rjdg==
X-Gm-Message-State: AOJu0YxiBYwbqUhaH0ODYdj+8cxdKhC8KG9dEzMTlerXv0Wlr+FM/jQM
 B+Zdf3RKGEg/nFRm58yk5fRPCR6hVhrTHfl+riq0JLf0KdzzAhkLSSnMpTQW
X-Google-Smtp-Source: AGHT+IEEElxgSZa7n2z/COt2COY7EZsE9u35jBRHEOWxcwI08JqyuurW74dtGXrrOoP2QRqXl1iSCA==
X-Received: by 2002:a17:907:6e87:b0:a52:401c:472b with SMTP id
 sh7-20020a1709076e8700b00a52401c472bmr12431364ejc.73.1713292943673; 
 Tue, 16 Apr 2024 11:42:23 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:ddfc:df5d:2cba:1046])
 by smtp.gmail.com with ESMTPSA id
 ht8-20020a170907608800b00a525669000csm4328455ejc.154.2024.04.16.11.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 11:42:23 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 20:42:07 +0200
Message-Id: <20240416184209.2621561-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184209.2621561-1-thomas@devoogdt.com>
References: <CACXRmJhRXXUUGFz=P9gOhVkqtAMePE4xgDg8rMNafuPMDWU3nQ@mail.gmail.com>
 <20240416184209.2621561-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v3 2/4] package/x11r7/xlib_libxshmfence: fix
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>
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
v2: n/a
v3: n/a
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
