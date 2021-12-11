Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970DDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 21:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5088640416;
	Sat, 11 Dec 2021 21:12:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwfBy93JYsBN; Sat, 11 Dec 2021 21:12:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 997B8403DD;
	Sat, 11 Dec 2021 21:12:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 987061BF3A0
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8452D40173
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qh6gfURGBXRG for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 21:12:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC749400C8
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 21:12:52 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d24so20821781wra.0
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 13:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Iq31Qxh/YwXIy1udUv/yPKvCzvhN1k85ToMfA//Nyc4=;
 b=pN+mQRxeIhwIp8J3csk/pQnQXTrk5o7QX5Vds4JJHIG39SwnBzpDzNRwN4nKUAkF4j
 8rvt/nOkcEAwC235PImuoNt8M1nd7L/3TPpkK+v8a+pee0HPm2pbOVEwgbTZO7H2VtAf
 AW4YHTaxPTFTBt9I5CKnUbmLOysFBTAhZOwaOS6nCXj6PWNqnDwGtVmyOzu+XT6nO1NR
 kTY1xQVmyNn5VA6MzqtBaHb0/F30QOQ0fEmdV+fwaVcMZ3VR0oq1ntIGyX8fwjodZkMy
 znIfiUmke3hmlDB8lOeIKIDGNi/SovTMzKfSaNj5ii4lhbUATSUoNYVkxCQXqLX8skzr
 n9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Iq31Qxh/YwXIy1udUv/yPKvCzvhN1k85ToMfA//Nyc4=;
 b=bkz7dQapasNzeOXA5LOd9VUWVMrthB3NGHcykAS9fQQAeuQhExydpA3Gsf49sujDOB
 RFKKI+hHlAuK39NOjSEGpsqbs8yevaQdL7k4ZBXnpWfj0/Hsff8Fr/ydcsKIBOcg7/qb
 SSnA/zGUhSwdI55S+sPO/QLG5TbF9YVMTwWXfGyT+KbftxPdwuS2e7V4dRhpmmu9OM2R
 CY0aTXQ9Wvb7vao5kwCzj1ZMV3nPQJJN8TMVzfSCj1yDM0gu38SxF6S7raMLhMLqW+rX
 99H6VnMPl+z5IThGQbjDXjGripZJ6Uo1fcu6AC6t7Oo7jsSwAtntL3r0QyAXqQBKEuvm
 l2qg==
X-Gm-Message-State: AOAM533birYToiTi+2LlYnxPOLQC2ykxYfGUpnxTOq8ZzLDEk5kAYg+b
 DWFeOs5cOsYD5vBr6Bj37f0dSVpWvttGoA==
X-Google-Smtp-Source: ABdhPJy/YsBYG6Dy6TKxCbtFa8HFd99RNf+KP7/Y9RQKoMjlv0r8oo2Amlhfb7mpSYMOhD8ZP7Y5dw==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr6873714wro.688.1639257170560; 
 Sat, 11 Dec 2021 13:12:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id k7sm2986899wrg.105.2021.12.11.13.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 13:12:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 22:12:34 +0100
Message-Id: <20211211211234.233209-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rp-pppoe: fix musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure raised since bump of pppd to
version 2.4.9 in commit 075b01f2f7b5a9241b4bfe76db8f14af0284060c:

In file included from pppoe.h:133,
                 from debug.c:19:
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/netinet/if_ether.h:116:8: error: redefinition of 'struct ethhdr'
  116 | struct ethhdr {
      |        ^~~~~~
In file included from pppoe.h:121,
                 from debug.c:19:
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/linux/if_ether.h:163:8: note: originally defined here
  163 | struct ethhdr {
      |        ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ccca18fcbcde65cb6784f5559eac68ca17ab14a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...src-pppoe.h-fix-build-with-musl-libc.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch

diff --git a/package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch b/package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000000..29ba72be4f
--- /dev/null
+++ b/package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch
@@ -0,0 +1,60 @@
+From bbf5b2759cff0c65b47fd6dbe5fe7341f205ad03 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 11 Dec 2021 22:03:16 +0100
+Subject: [PATCH] src/pppoe.h: fix build with musl libc
+
+musl libc defines its own struct ethhdr that conflicts with the kernel
+define one. The kernel headers provide a way to suppress its struct
+ethhdr. For that to work the libc headers must precede the kernel. Move
+the kernel linux/if_ether.h include below libc netinet/if_ether.h. That
+fixes the following build failure:
+
+In file included from pppoe.h:133,
+                 from debug.c:19:
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/netinet/if_ether.h:116:8: error: redefinition of 'struct ethhdr'
+  116 | struct ethhdr {
+      |        ^~~~~~
+In file included from pppoe.h:121,
+                 from debug.c:19:
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/linux/if_ether.h:163:8: note: originally defined here
+  163 | struct ethhdr {
+      |        ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ccca18fcbcde65cb6784f5559eac68ca17ab14a3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/dfskoll/rp-pppoe/pull/4]
+---
+ src/pppoe.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/pppoe.h b/src/pppoe.h
+index 4780092..2b08111 100644
+--- a/src/pppoe.h
++++ b/src/pppoe.h
+@@ -117,10 +117,6 @@ typedef unsigned long UINT32_t;
+ #error Could not find a 32-bit integer type
+ #endif
+ 
+-#ifdef HAVE_LINUX_IF_ETHER_H
+-#include <linux/if_ether.h>
+-#endif
+-
+ #include <netinet/in.h>
+ 
+ #ifdef HAVE_NETINET_IF_ETHER_H
+@@ -134,6 +130,10 @@ typedef unsigned long UINT32_t;
+ #endif
+ #endif
+ 
++#ifdef HAVE_LINUX_IF_ETHER_H
++#include <linux/if_ether.h>
++#endif
++
+ 
+ 
+ /* Ethernet frame types according to RFC 2516 */
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
