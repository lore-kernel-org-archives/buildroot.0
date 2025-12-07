Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB221D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98F416058D;
	Sun,  7 Dec 2025 14:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmPbOY-ChI-a; Sun,  7 Dec 2025 14:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAEF2605A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118580;
	bh=v/3+TReDQg1dLKrl8s6/2RBf5CS0jFvX6Pw6LmX8mWI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nFdMfv68ZqnDrWnnyRXRuII9rHNfxeSmQQ2Z2Xe6omfE6qFPKXjQH6BmDLo1hLyCO
	 fyar8c2cWJlqRGf9BfsyIcQCgFYe/+6ZF/E8Vy6AZqNscGYfO45WIHPAoajj3V9duv
	 Un3KxLiZSEoEAi1/8A9qqWWTbNiJHjTJ2SBEIKRpkA2bUuWDUzjg46m0PS+jzzlbpu
	 tcTU8oxlL8B9E/Ov2ny1AZX/ehl8R2SS8vBtLFGZb15yLp4nqGVIc4Vsom8t1Irrz0
	 4ullR4tHptEnJGsbV42PGnGysJozRcE/ykamJUJe23UTJGaKNko1qFIPnWhRGrFWDc
	 zG8VWeRI3Pp6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAEF2605A2;
	Sun,  7 Dec 2025 14:43:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0088C2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DACE46089D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xFjGFp9rXXO for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C88C0607AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C88C0607AA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C88C0607AA
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:42:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 66985A4C08F8;
 Sun,  7 Dec 2025 15:42:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyF-00000000416-2CHV;
 Sun, 07 Dec 2025 14:42:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:10 +0100
Message-ID: <20251207144243.3696572-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118564;
 bh=ncnhN2a/CpdK4mZ1D+jf1xfi+MXGkqxV8q5843KBbuo=;
 h=From:To:Cc:Subject:Date:From;
 b=p3uyDKWwAuG0kFxqJoN+oW3VOAkZxIFdlWMKyPAjhH+rJi6/WW3rfza91FmFulRwX
 0rn9hcW1MhsIILp1NZ5Hubvfc3Im0ggTvOyYKz31ESseOBmx9a+7bxSrLnOD1b37Hr
 BXstgq4+oaCigowPwfAtDCQwfU2nFIbFpY9f9cQcsyLKyCRVd64VJK5jkVm1eOds3o
 bP5KHiIx5KEz7QO7EtLoJwFy68LsxdqHcdeb21GdSA96s6BLKRR0artn8A6Z2fyYgQ
 eu6pGK90jVWvdziqOT4wtheOsvZjxljEdYs0s1pDfFboWBoSKKbqIntIMh5v5mfy9D
 Yga+CVf8gk98Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=p3uyDKWw
Subject: [Buildroot] [PATCH/next 01/33] package/libstrophe: bump version to
 0.14.0
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added upstream patch to fix build with gcc-15.x.

Fixes:
https://autobuild.buildroot.net/results/6e1/6e176c77a6cb7508b0502c77d78df78ae4602ef9/
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...e-function-pointer-when-compiled-as-.patch | 60 +++++++++++++++++++
 package/libstrophe/libstrophe.hash            |  2 +-
 package/libstrophe/libstrophe.mk              |  2 +-
 3 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 package/libstrophe/0001-Use-void-to-store-function-pointer-when-compiled-as-.patch

diff --git a/package/libstrophe/0001-Use-void-to-store-function-pointer-when-compiled-as-.patch b/package/libstrophe/0001-Use-void-to-store-function-pointer-when-compiled-as-.patch
new file mode 100644
index 0000000000..f61e2d8193
--- /dev/null
+++ b/package/libstrophe/0001-Use-void-to-store-function-pointer-when-compiled-as-.patch
@@ -0,0 +1,60 @@
+From dfb3e868248d86fc0f5553dffbb6f7c367c3c383 Mon Sep 17 00:00:00 2001
+From: Steffen Jaeckel <s@jaeckel.eu>
+Date: Wed, 26 Mar 2025 14:14:19 +0100
+Subject: [PATCH] Use `void*` to store function pointer when compiled as C23.
+
+[0] decided that `rettype (*foo)();` must now be interpreted as
+`rettype (*foo)(void);`. Luckily it also allows now to store function
+pointers in a `void*` (c.f. Ch. J.5.7).
+
+[0]: https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3096.pdf
+
+Signed-off-by: Steffen Jaeckel <s@jaeckel.eu>
+
+Upstream: https://github.com/strophe/libstrophe/commit/dfb3e868248d86fc0f5553dffbb6f7c367c3c383
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/common.h  | 7 ++++++-
+ src/handler.c | 2 --
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/common.h b/src/common.h
+index 75134be..c387c0f 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -30,12 +30,17 @@
+ #include "snprintf.h"
+ 
+ /** handlers **/
++#if (__STDC_VERSION__ >= 202000L)
++typedef void* xmpp_void_handler;
++#else
++typedef int (*xmpp_void_handler)();
++#endif
+ 
+ typedef struct _xmpp_handlist_t xmpp_handlist_t;
+ struct _xmpp_handlist_t {
+     /* common members */
+     int user_handler;
+-    int (*handler)();
++    xmpp_void_handler handler;
+     void *userdata;
+     int enabled; /* handlers are added disabled and enabled after the
+                   * handler chain is processed to prevent stanzas from
+diff --git a/src/handler.c b/src/handler.c
+index 1c9bf9f..0577252 100644
+--- a/src/handler.c
++++ b/src/handler.c
+@@ -25,8 +25,6 @@
+ #include "common.h"
+ #include "ostypes.h"
+ 
+-typedef int (*xmpp_void_handler)();
+-
+ /* Remove item from the list pointed by head, but don't free it.
+  * There can be a situation when user's handler deletes another handler which
+  * is the previous in the list. handler_fire_stanza() and handler_fire_timed()
+-- 
+2.47.3
+
diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index ec5a55985a..a4951e608d 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  86c0abd348ae66feb40b6886f2c7f04525f1d5b20a48c10d4db4ed532dc63f22  libstrophe-0.13.1.tar.xz
+sha256  8a7ebc274bd79fa4e5dfcfbf06123adbc9f70abd8bebf2843c2940e9086aeee0  libstrophe-0.14.0.tar.xz
 sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index 42d582fe9c..85e8753f2b 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.13.1
+LIBSTROPHE_VERSION = 0.14.0
 LIBSTROPHE_SOURCE = libstrophe-$(LIBSTROPHE_VERSION).tar.xz
 LIBSTROPHE_SITE = https://github.com/strophe/libstrophe/releases/download/$(LIBSTROPHE_VERSION)
 LIBSTROPHE_DEPENDENCIES = host-pkgconf
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
