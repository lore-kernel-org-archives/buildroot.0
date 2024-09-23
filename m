Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B71CF9C6F
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 05:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F258606B4;
	Mon, 23 Sep 2024 05:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjYzoK3q2EEU; Mon, 23 Sep 2024 05:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 083FF6078B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 083FF6078B;
	Mon, 23 Sep 2024 05:46:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D0D01BF5AD
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 05:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2966F60670
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 05:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55sj70X4HUGu for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 05:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB74A60665
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB74A60665
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB74A60665
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 05:46:38 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d2daa2262so513517566b.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 22:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727070396; x=1727675196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w5A+Otrh1VG+ja80Hibcjlp5G0mrYFjXboFUb0Ozeuw=;
 b=wzh+0rk6iSCkehRWKQmctqIDlRDhQSq2vg9GkuQl/aiE/hxYk9Xahbbhj0hEr6zmGI
 Uha+yceUdkai+j4e9i/ZlZZd6XVTzsEw1MnRSmrN2h91eV7fYfgUHG/UXBDkfxJyxOuE
 nyMAM7j9MW7Qysh3FN21IIp8v/zUH2Z5gn59wROFI9cG9UKU8iySo3WTiCDVO5mF2WoH
 nQUFT/CeoeLFz/8ZRg5j3u1VjX4Sr+f0o4pBM3b/x3evu7R2fyrOaKlFZBPdkKhwevmA
 AbtD9lNggaCWniBsO6BV8IDxx+4saok3soA6c8+qn8VwRVAPU0IHCqidRYXKjSJAZhV4
 sMYQ==
X-Gm-Message-State: AOJu0YymnbO9NCg1SxNak0WZIG1+eZ4W42JlPBF8+RMuKB+09CT4utSA
 dMJ8QV/nlQCMwLwrZYFMHUccQRh+IUH1hFf3Z91MD8XwLfV0Zu2WjpdlP/iMWlIb9eBaarDlhln
 BZmo=
X-Google-Smtp-Source: AGHT+IEvP5TfZLkQ+e6628izaK7fKEOKdIU7uwEl3ik25/ezWa9dLNALCk9rqKj0+HqvJjjos0BxwQ==
X-Received: by 2002:a17:907:c7e3:b0:a8d:401b:db85 with SMTP id
 a640c23a62f3a-a90d504f990mr1007129766b.36.1727070396361; 
 Sun, 22 Sep 2024 22:46:36 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-102-52.retail.telecomitalia.it. [79.20.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b39a2sm1157706566b.106.2024.09.22.22.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 22:46:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 23 Sep 2024 07:46:26 +0200
Message-ID: <20240923054626.2911036-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240923054626.2911036-1-dario.binacchi@amarulasolutions.com>
References: <20240923054626.2911036-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1727070396; x=1727675196;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w5A+Otrh1VG+ja80Hibcjlp5G0mrYFjXboFUb0Ozeuw=;
 b=hlkjyy2lKtAPyNJ55jLoenwfnJ+d/5p8aUIvvlVLAXTukKjVyFnu/mv02YXs0OHMUB
 vYRXasR2bNBQkLpWnwHORY5NyyMJ2XXy3no9UaiQ/UV9304JmQLlM+y45WoatehUy9J7
 HDLLNQiZ0eKYJAeZqQyE3LcB6sE6y/+UPdxfA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hlkjyy2l
Subject: [Buildroot] [PATCH v3 2/2] package/iproute2: bump to version 6.11.0
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The building test using musl as the C library for the cross-compilation
toolchain raised errors that required the application of two additional
patches.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Drop changes in .mk. After applying the patches they are not required
   anymore.
 - Update commit message.

 ...04-bridge-mst-fix-a-musl-build-issue.patch | 73 +++++++++++++++++++
 ...e-mst-fix-a-further-musl-build-issue.patch | 56 ++++++++++++++
 package/iproute2/iproute2.hash                |  2 +-
 package/iproute2/iproute2.mk                  |  2 +-
 4 files changed, 131 insertions(+), 2 deletions(-)
 create mode 100644 package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch
 create mode 100644 package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch

diff --git a/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch b/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch
new file mode 100644
index 000000000000..9dddfb6e7f26
--- /dev/null
+++ b/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch
@@ -0,0 +1,73 @@
+From 0359ee6dc57ee8aa21a3f0f7404422c0f9372d3a Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sun, 22 Sep 2024 14:00:42 +0200
+Subject: [PATCH] bridge: mst: fix a musl build issue
+
+This patch fixes a compilation error raised by the bump to version 6.11.0
+in Buildroot using musl as the C library for the cross-compilation
+toolchain.
+
+After setting the CFLGAS
+
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+IPROUTE2_CFLAGS += -D__UAPI_DEF_IN6_ADDR=0 -D__UAPI_DEF_SOCKADDR_IN6=0 \
+			-D__UAPI_DEF_IPV6_MREQ=0
+endif
+
+to fix the following errors:
+
+In file included from ../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/arpa/inet.h:9,
+                 from ../include/libnetlink.h:14,
+                 from mst.c:10:
+../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:23:8: error: redefinition of 'struct in6_addr'
+   23 | struct in6_addr {
+      |        ^~~~~~~~
+In file included from ../include/uapi/linux/if_bridge.h:19,
+                 from mst.c:7:
+../include/uapi/linux/in6.h:33:8: note: originally defined here
+   33 | struct in6_addr {
+      |        ^~~~~~~~
+../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:34:8: error: redefinition of 'struct sockaddr_in6'
+   34 | struct sockaddr_in6 {
+      |        ^~~~~~~~~~~~
+../include/uapi/linux/in6.h:50:8: note: originally defined here
+   50 | struct sockaddr_in6 {
+      |        ^~~~~~~~~~~~
+../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:42:8: error: redefinition of 'struct ipv6_mreq'
+   42 | struct ipv6_mreq {
+      |        ^~~~~~~~~
+../include/uapi/linux/in6.h:60:8: note: originally defined here
+   60 | struct ipv6_mreq {
+
+I got this further errors
+
+../include/uapi/linux/in6.h:72:25: error: field 'flr_dst' has incomplete type
+   72 |         struct in6_addr flr_dst;
+      |                         ^~~~~~~
+../include/uapi/linux/if_bridge.h:711:41: error: field 'ip6' has incomplete type
+  711 |                         struct in6_addr ip6;
+      |                                         ^~~
+
+fixed by including the netinet/in.h header.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://patchwork.kernel.org/project/netdevbpf/patch/20240922145011.2104040-1-dario.binacchi@amarulasolutions.com/
+---
+ bridge/mst.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/bridge/mst.c b/bridge/mst.c
+index 873ca5369fd6..c8f7e6606c3c 100644
+--- a/bridge/mst.c
++++ b/bridge/mst.c
+@@ -4,6 +4,7 @@
+  */
+ 
+ #include <stdio.h>
++#include <netinet/in.h>
+ #include <linux/if_bridge.h>
+ #include <net/if.h>
+ 
+-- 
+2.43.0
+
diff --git a/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch b/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch
new file mode 100644
index 000000000000..f4e7c317bf9c
--- /dev/null
+++ b/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch
@@ -0,0 +1,56 @@
+From 62c4dfff5ff596984ece7960fba49b05d69f37a7 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sun, 22 Sep 2024 14:11:18 +0200
+Subject: [PATCH] bridge: mst: fix a further musl build issue
+
+This patch fixes the following build errors:
+
+In file included from mst.c:11:
+../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
+   80 | _PRINT_FUNC(tv, const struct timeval *)
+      |                              ^~~~~~~
+../include/json_print.h:50:37: note: in definition of macro '_PRINT_FUNC'
+   50 |                                     type value);                        \
+      |                                     ^~~~
+../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
+   80 | _PRINT_FUNC(tv, const struct timeval *)
+      |                              ^~~~~~~
+../include/json_print.h:55:45: note: in definition of macro '_PRINT_FUNC'
+   55 |                                             type value)                 \
+      |                                             ^~~~
+../include/json_print.h: In function 'print_tv':
+../include/json_print.h:58:48: error: passing argument 5 of 'print_color_tv' from incompatible pointer type [-Wincompatible-pointer-types]
+   58 |                                                value);                  \
+      |                                                ^~~~~
+      |                                                |
+      |                                                const struct timeval *
+../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
+   80 | _PRINT_FUNC(tv, const struct timeval *)
+      | ^~~~~~~~~~~
+../include/json_print.h:50:42: note: expected 'const struct timeval *' but argument is of type 'const struct timeval *'
+   50 |                                     type value);                        \
+      |                                          ^
+../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
+   80 | _PRINT_FUNC(tv, const struct timeval *)
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://patchwork.kernel.org/project/netdevbpf/patch/20240922145011.2104040-2-dario.binacchi@amarulasolutions.com/
+---
+ bridge/mst.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/bridge/mst.c b/bridge/mst.c
+index c8f7e6606c3c..fccb7fd68140 100644
+--- a/bridge/mst.c
++++ b/bridge/mst.c
+@@ -4,6 +4,7 @@
+  */
+ 
+ #include <stdio.h>
++#include <sys/time.h>
+ #include <netinet/in.h>
+ #include <linux/if_bridge.h>
+ #include <net/if.h>
+-- 
+2.43.0
+
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 0760183b9e66..028a32439644 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  91a62f82737b44905a00fa803369c447d549e914e9a2a4018fdd75b1d54e8dce  iproute2-6.10.0.tar.xz
+sha256  1f795398a04aeaacd06a8f6ace2cfd913c33fa5953ca99daae83bb5c534611c3  iproute2-6.11.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 08b890b33117..c452b64cdea1 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.10.0
+IPROUTE2_VERSION = 6.11.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
