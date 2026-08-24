Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E664C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 06:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 192F260629;
	Mon, 24 Aug 2026 06:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vUP-MNMunkx; Mon, 24 Aug 2026 06:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787553540;
	bh=tiaZUJWE9ATbTtFls8g50b+gGAOxhJae+IS+lPG2RB8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CsS5370MVnu6hvPnRC4lGO7cAUfBClaeN62OwT05RQBbShwIlbCvv9s6gFS1Uoqv9
	 0tTPZmIGm3qnU1u0/O1bSHHiMl5jFtqWBJgRjIDj9q5XZ+XS8kYzwy3gBXTE5YdBR9
	 ik487ITxwxIGXIHfPY3zw3dr6AgL4AbE6wTbSwbg77OuCGwq2jIHpaCEKumXGFeHlv
	 4jzE9fDllguWh9keMhkCHDfPaznPUOvKUyPuviLUy/tkAysPU+nwcim/if3UhvEy0b
	 G5XuRgfSMxZwxuAbLYIf2ZkOzXXeeeGaykPL66zFHxV26bw7Pd+8+DmtyLepnLQG7e
	 wACpRuGwqLH8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EE20606CE;
	Mon, 24 Aug 2026 06:39:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4758D386
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38E2460635
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pgj9bHVPmKWy for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 06:38:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Fe5CZp72
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D081C6060B
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:55 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c1670dad7a8so537359166b.3
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 23:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1787553534; x=1788158334;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eeyVjRmFUyreHlB0/wMhY25evOWELYmYRYX8Y5SOHc0=;
 b=Fe5CZp72+vkV42eav3jAzwl6tyOoWDZEKAPBoxj899FOilM9vtjzXf93HEXfrp4h0z
 sVHYEtj6B55xZD3KgdB0X94ZBOT1R2p/S/4+BQAQ6AplpRu1VdNqDm7qUfLNy9ysZ6Sd
 vWoffQv9F1ssIpkRuFfZUZvBXaNAtiWKLYTv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787553534; x=1788158334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eeyVjRmFUyreHlB0/wMhY25evOWELYmYRYX8Y5SOHc0=;
 b=oiwUB0ksqSE3acEtQ8p2e+0OK69/rcOeFice/WsgNdte/3oKgw6Quv8cSGFEk4iBLV
 rX7gQQNoOHom7RIEy1H0C0ejvmlntq4GkbaiIwfsMLMUXvZxPs9oRkRv6ILX74H535ut
 jr1dcwPOXn6njX9MRULj3Y4CXjxTECrD93nb3UWBowEFju+WRpk3AjFh09WtUBGlJNR9
 9TTy+1QTu6M5acFnGRZdjZOKV2forP8u8YdN24zWUxzAlES/vYg+pxr/QI9jJoIvygDe
 kXzIE7LBzQfMhaDSy4xOP+XjdQfZf9tQWa316f3SrwzOBjrwm6IW3euq1BrueraSPy+L
 Ew4w==
X-Gm-Message-State: AFuF++kDREqBeGebIFYL0t/E9yI3b1ek5jDlXMHP96ve4CRInh8w/aU5
 xv+4l/F83gKH/vzdv/BVwfueFnu2IeBgE3KMztD2rD+sOhyKenOGNddrjhMYjSwxyi6mjt9CsBG
 ByhUtHuo=
X-Gm-Gg: AR+sD12W7VbU+lOHKIrCPTTAuW74lJwqGl3pLA5rEZ68oCEBECGnEXSk0J3HeTKGMy/
 pAO/Uj3uuSKCq1y9MT2IhQaGs4jBvdd85om7VtYbXXXTHgpyhXQwBhCpfJX+SotJr/JjJlHB13+
 stfUxNCe6GlMuWk02NAM/2SA0+xwwJ2n8ULDh+IBBS/kb+KW3OJnkjETunpcIht4NtSnaD11RFd
 E6juGkW00w54lc2sEyxVhVMQpuGXAom38nA3NthJwlBv/HRhA71VTwA/SdPsFbsDr/W0haHbHBw
 Qcgd8j0KNRcAg1gGxNEDnj458kB29Ivigwa3Wbj9addNI7/Fo84970lCJ+MTVSi1Ana9awEtC07
 zCJJbZwsJ6WqY0ZCm5ALaL/yO/ZpkJGXvRIRXuhlrhQpmVXIWOKijZUnEpeJ8y0Oy5J6fbfHS03
 qLOfU5wFAQArHhWMjV2Cb4LAYAdzz71AOaic+DySn4dsKRyyiXkDB8X+7VUY2xfBvYNvG7vOy7x
 OOzP0pnCsnZ7RbCyDJcAkPSXdeLyOJ0qyyMsVWYHwZeKxOsZM07hwtsHSaw5a9ULWX1m8L07GEi
 3YDosSoHA+1opnroH2ldWHYWN/XbdXBD5PM4KTM5AToAs/iE2tf4GfX4C0Q9hA==
X-Received: by 2002:a17:907:7b9b:b0:c1f:bda0:a771 with SMTP id
 a640c23a62f3a-c246a68427amr2826784166b.13.1787553533531; 
 Sun, 23 Aug 2026 23:38:53 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249685ef7bsm1226186766b.52.2026.08.23.23.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 23:38:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Fischer <mf@go-sys.de>
Date: Mon, 24 Aug 2026 08:38:42 +0200
Message-ID: <20260824063843.839745-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
References: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 5/6] package/canvenient: new package
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

CANvenient is an abstraction layer for multiple CAN APIs on Windows and
Linux. It provides a unified interface for CAN communication, allowing
developers to write code that is portable across different platforms and
CAN hardware.

Project page: https://github.com/CANopenTerm/CANvenient

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../canvenient/0001-Fix-build-with-musl.patch | 43 +++++++++++++++++++
 package/canvenient/Config.in                  | 13 ++++++
 package/canvenient/canvenient.hash            |  3 ++
 package/canvenient/canvenient.mk              | 14 ++++++
 6 files changed, 75 insertions(+)
 create mode 100644 package/canvenient/0001-Fix-build-with-musl.patch
 create mode 100644 package/canvenient/Config.in
 create mode 100644 package/canvenient/canvenient.hash
 create mode 100644 package/canvenient/canvenient.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2de3312fe9c8..49c5b93c13ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -820,6 +820,7 @@ F:	package/armadillo/
 F:	package/atf/
 F:	package/babeld/
 F:	package/bc/
+F:	package/canvenient/
 F:	package/cmocka/
 F:	package/connman/
 F:	package/drogon/
diff --git a/package/Config.in b/package/Config.in
index 7ae097582e3c..8fae0a27e7f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1992,6 +1992,7 @@ menu "Networking"
 	source "package/batman-adv/Config.in"
 	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
+	source "package/canvenient/Config.in"
 	source "package/cni-plugins/Config.in"
 	source "package/cpp-httplib/Config.in"
 	source "package/cppzmq/Config.in"
diff --git a/package/canvenient/0001-Fix-build-with-musl.patch b/package/canvenient/0001-Fix-build-with-musl.patch
new file mode 100644
index 000000000000..8043a87ac743
--- /dev/null
+++ b/package/canvenient/0001-Fix-build-with-musl.patch
@@ -0,0 +1,43 @@
+From 46ac90d46b7773a804cd0bbaf71fa487bcc4cca8 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sat, 22 Aug 2026 17:38:47 +0200
+Subject: [PATCH] Fix build with musl
+
+This was exposed while integrating the package into Buildroot and
+testing its compilation with a musl-based toolchain:
+
+  CANvenient_SocketCAN.c: In function 'socketcan_open':
+  CANvenient_SocketCAN.c:186:24: error: storage size of 'tv' isn't known
+    186 |         struct timeval tv;
+        |                        ^~
+  CANvenient_SocketCAN.c: In function 'socketcan_recv':
+  CANvenient_SocketCAN.c:364:36: error: invalid application of 'sizeof' to incomplete type 'struct timeval'
+    364 |     char ctrlmsg[CMSG_SPACE(sizeof(struct timeval))];
+        |                                    ^~~~~~
+  CANvenient_SocketCAN.c:406:28: error: invalid use of undefined type 'const struct timeval'
+    406 |             *timestamp = tv->tv_sec * 1000000ULL + tv->tv_usec;
+        |                            ^~
+
+Include <sys/time.h> to fix the build.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/CANopenTerm/CANvenient/pull/6
+---
+ src/drivers/CANvenient_SocketCAN.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/drivers/CANvenient_SocketCAN.c b/src/drivers/CANvenient_SocketCAN.c
+index d4db584ff51d..fb356b8f227f 100644
+--- a/src/drivers/CANvenient_SocketCAN.c
++++ b/src/drivers/CANvenient_SocketCAN.c
+@@ -20,6 +20,7 @@ void socketcan_close(int index);
+ #include <dirent.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
++#include <sys/time.h>
+ #include <net/if.h>
+ #include <linux/can.h>
+ #include <linux/can/raw.h>
+-- 
+2.43.0
+
diff --git a/package/canvenient/Config.in b/package/canvenient/Config.in
new file mode 100644
index 000000000000..6989bf496ef3
--- /dev/null
+++ b/package/canvenient/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_CANVENIENT
+	bool "canvenient"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBSOCKETCAN
+	help
+	  CANvenient is a portable CAN abstraction library
+	  supporting several driver backends. On Linux it is
+	  implemented on top of SocketCAN.
+
+	  https://github.com/CANopenTerm/CANvenient
+
+comment "canvenient needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/canvenient/canvenient.hash b/package/canvenient/canvenient.hash
new file mode 100644
index 000000000000..32b5559d3503
--- /dev/null
+++ b/package/canvenient/canvenient.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  dae4c0a4b6a2b62220341466509a57d9a10ee5cc60be5a2def42d0afd345dc41  canvenient-1.02.tar.gz
+sha256  877e5e09cf4243583c7b0593d1453343f6e8d67977e3e4e97ed001dd0856a334  LICENSE.md
diff --git a/package/canvenient/canvenient.mk b/package/canvenient/canvenient.mk
new file mode 100644
index 000000000000..68b5af3dcc4d
--- /dev/null
+++ b/package/canvenient/canvenient.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# canvenient
+#
+################################################################################
+
+CANVENIENT_VERSION = 1.02
+CANVENIENT_SITE = $(call github,CANopenTerm,CANvenient,v$(CANVENIENT_VERSION))
+CANVENIENT_LICENSE = MIT
+CANVENIENT_LICENSE_FILES = LICENSE.md
+CANVENIENT_INSTALL_STAGING = YES
+CANVENIENT_DEPENDENCIES = libsocketcan
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
