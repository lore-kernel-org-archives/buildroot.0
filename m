Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70218C433EF
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 08:08:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E57BD615E3
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 08:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E57BD615E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A1D605C8;
	Fri, 19 Nov 2021 08:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5-BuHAiUwuN; Fri, 19 Nov 2021 08:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94B3461BDC;
	Fri, 19 Nov 2021 08:08:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40CEF1BF2B3
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 08:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C75681CA0
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 08:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUNnY4Lrj-La for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 08:08:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 968D981C81
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 08:08:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r8so16605725wra.7
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 00:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HeBZ4zXpRzH0vGjCSwN7YLkqTncKcaOAkPQEfKA/g44=;
 b=Z/Cm8oZfnBfj1AIrv8/u7VC5J2UTF6YJr9iYR61r7dwRhLBcjva4MpQ2Q5YbTr7YNS
 fjb37eqOlmEa3IFhkFe1bqsnDQBHxBCIwTvBEzPi4xw3utbOLBGtD0PN59zLy7jRpiJZ
 NrXU4q3JkFBYTGQowwERU71pIvdeYnvfXm7iB0HdLq5yiCVmA+wc3YEQ6C8SCFV7BZWX
 O/+dMTPu6ySLYqaA02QJ10Rfv/1p6uwAe0pjpIBer/EVj4W6eqc9gPkGxLdSLmysocX5
 iZVdXhkUOPxKaN25MGbiLKx23fYSYiHXnMic6Ibva9MNju+OpLdcAYhTa6yUpsn/1LPz
 0uzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HeBZ4zXpRzH0vGjCSwN7YLkqTncKcaOAkPQEfKA/g44=;
 b=DzbTTCb5hvGIOgnaAapeJ5x3+TDU7Dvt5/RsNMn/WYdJm8pe0RS0KPlyP/D97czckj
 OzD/9LCyfHnjiUhU58Q17wHlL/rcjDmgHKE1pT4zT5uh70AqnOfUFcD59rxEJ5sCgF9s
 5MvlP1X8Ncx4YxSbckJxn71hRauW4+/+gr+Q4K+dLfGkvGkE6WwiZwZdjlMbiiL2gyoS
 FnuL6oRW3CkM94Onxq5N+Y0lBRxJR6jJkwogdME6QlSuJwzjN/pMO/AA/0JTkgbzo5AI
 TrhVhEwAYQ/sNJUM92R2LAZ8QD0Zg4eMOwrOgSczEBw1tFyJO8OSzvwBGXKuumXCEpCV
 7Z+g==
X-Gm-Message-State: AOAM533WzJuBtCir/kSCT7y1QJxmfUh9/Zjski3XNqc7gwTacvv/v8S5
 o6OS4WnrwY8PI4+trn/s55LCo/yRA54=
X-Google-Smtp-Source: ABdhPJyh2ncu1RVzuC/o8PH1SJcO5tDqYqU4pRw+tY2DDVENipcYMoKmnHGdxjo9TUaxzuyw2tO7hg==
X-Received: by 2002:a5d:6151:: with SMTP id y17mr5086258wrt.275.1637309295455; 
 Fri, 19 Nov 2021 00:08:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h27sm12158903wmc.43.2021.11.19.00.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 00:08:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Nov 2021 09:06:00 +0100
Message-Id: <20211119080600.2347947-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/strace: fix build with kernel >=
 5.15
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

Fix the following build failure with kernel >= 5.15:

net.c:34:11: fatal error: linux/ipx.h: No such file or directory
   34 | # include <linux/ipx.h>
      |           ^~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d413258fab75c12da29bddb7e0f9e133a34e0160

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-Avoid-relying-on-presence-of-ipx-h.patch | 149 ++++++++++++++++++
 package/strace/strace.mk                      |   2 +
 2 files changed, 151 insertions(+)
 create mode 100644 package/strace/0001-Avoid-relying-on-presence-of-ipx-h.patch

diff --git a/package/strace/0001-Avoid-relying-on-presence-of-ipx-h.patch b/package/strace/0001-Avoid-relying-on-presence-of-ipx-h.patch
new file mode 100644
index 0000000000..2e9fa24ed5
--- /dev/null
+++ b/package/strace/0001-Avoid-relying-on-presence-of-ipx-h.patch
@@ -0,0 +1,149 @@
+From 568ee52f885c463e7a283240f5ef6bbf9351bdb3 Mon Sep 17 00:00:00 2001
+From: Eugene Syromyatnikov <evgsyr@gmail.com>
+Date: Wed, 3 Nov 2021 00:48:59 +0100
+Subject: [PATCH] Avoid relying on presence of ipx.h
+
+After Linux has broken UAPI in commit v5.15-rc1~157^2~207, it is well
+possible that neither kernel nor libc (such as musl, for example)
+provides an IPX-related header.  Avoid relying on its presence
+in the strace's code and conditionalise the relevant checks in the tests.
+
+* configure.ac (AC_CHECK_HEADERS): Add linux/ipx.h.
+* src/net.c: Remove <netipx/ipx.h>/<linux/ipx.h> includes.
+* src/sockaddr.c: Likewise.
+(IPX_NODE_LEN): New macro constant.
+(struct sockaddr_ipx): New type definition.
+* src/xlat/sock_ipx_options.in (IPX_TYPE): Provide a fallback value.
+* tests/net-sockaddr.c [!HAVE_LINUX_IPX_H]: Do not include
+<linux/ipx.h>.
+[!HAVE_LINUX_IPX_H && HAVE_NETIPX_IPX_H]: Include <netipx/ipx.h>.
+[!(HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H)] (check_ipx): Do not
+define.
+(main) [!(HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H)]: Do not call
+check_ipx.
+
+Closes: https://github.com/strace/strace/issues/201
+
+[Retrieved (and backported) from:
+https://github.com/strace/strace/commit/568ee52f885c463e7a283240f5ef6bbf9351bdb3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac                 |  1 +
+ src/net.c                    |  5 -----
+ src/sockaddr.c               | 16 ++++++++++------
+ src/xlat/sock_ipx_options.in |  2 +-
+ tests/net-sockaddr.c         | 10 +++++++++-
+ 5 files changed, 21 insertions(+), 13 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b5053b7aff..c074a70c01 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -424,6 +424,7 @@ AC_CHECK_HEADERS(m4_normalize([
+ 	elf.h
+ 	gcov.h
+ 	iconv.h
++	linux/ipx.h
+ 	mqueue.h
+ 	netinet/sctp.h
+ 	netipx/ipx.h
+diff --git a/src/net.c b/src/net.c
+index bc2b1ad048..42696bfe89 100644
+--- a/src/net.c
++++ b/src/net.c
+@@ -28,11 +28,6 @@
+ #include <arpa/inet.h>
+ #include <net/if.h>
+ #include <asm/types.h>
+-#ifdef HAVE_NETIPX_IPX_H
+-# include <netipx/ipx.h>
+-#else
+-# include <linux/ipx.h>
+-#endif
+ 
+ #include <linux/ip_vs.h>
+ #include "netlink.h"
+diff --git a/src/sockaddr.c b/src/sockaddr.c
+index bdd5a5bb7a..27fda59f26 100644
+--- a/src/sockaddr.c
++++ b/src/sockaddr.c
+@@ -24,12 +24,6 @@
+ #include <linux/if_ether.h>
+ #include <linux/x25.h>
+ 
+-#ifdef HAVE_NETIPX_IPX_H
+-# include <netipx/ipx.h>
+-#else
+-# include <linux/ipx.h>
+-#endif
+-
+ #include "xlat/addrfams.h"
+ #include "xlat/arp_hardware_types.h"
+ #include "xlat/ethernet_protocols.h"
+@@ -42,6 +36,16 @@
+ 
+ #define SIZEOF_SA_FAMILY sizeof_field(struct sockaddr, sa_family)
+ 
++#define IPX_NODE_LEN	6
++struct sockaddr_ipx {
++	uint16_t sipx_family;
++	uint16_t sipx_port;
++	uint32_t sipx_network;
++	unsigned char sipx_node[IPX_NODE_LEN];
++	uint8_t sipx_type;
++	unsigned char sipx_zero;
++};
++
+ static void
+ print_sockaddr_data_un(struct tcb *tcp, const void *const buf, const int addrlen)
+ {
+diff --git a/src/xlat/sock_ipx_options.in b/src/xlat/sock_ipx_options.in
+index eba97fd719..b09be117e4 100644
+--- a/src/xlat/sock_ipx_options.in
++++ b/src/xlat/sock_ipx_options.in
+@@ -1 +1 @@
+-IPX_TYPE
++IPX_TYPE	1
+diff --git a/tests/net-sockaddr.c b/tests/net-sockaddr.c
+index f1f9b01cdd..c8049fd68b 100644
+--- a/tests/net-sockaddr.c
++++ b/tests/net-sockaddr.c
+@@ -24,7 +24,11 @@
+ #include <linux/if_ether.h>
+ #include <linux/if_packet.h>
+ #include <linux/x25.h>
+-#include <linux/ipx.h>
++#if defined HAVE_LINUX_IPX_H
++# include <linux/ipx.h>
++#elif defined HAVE_NETIPX_IPX_H
++# include <netipx/ipx.h>
++#endif
+ #ifdef HAVE_BLUETOOTH_BLUETOOTH_H
+ # include <bluetooth/bluetooth.h>
+ # include <bluetooth/hci.h>
+@@ -269,6 +273,7 @@ check_in6(void)
+ 	printf("connect(-1, %p, %u) = %d EBADF (%m)\n", in6, len, ret);
+ }
+ 
++#if defined HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H
+ static void
+ check_ipx(void)
+ {
+@@ -295,6 +300,7 @@ check_ipx(void)
+ 	       c_ipx.sipx_node[4], c_ipx.sipx_node[5],
+ 	       c_ipx.sipx_type, len, ret);
+ }
++#endif /* HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H */
+ 
+ /* for a bit more compact AX.25 address definitions */
+ #define AX25_ADDR(c_, s_) \
+@@ -773,7 +779,9 @@ main(void)
+ 	check_un();
+ 	check_in();
+ 	check_in6();
++#if defined HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H
+ 	check_ipx();
++#endif
+ 	check_ax25();
+ 	check_x25();
+ 	check_nl();
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 798d7077d6..78d08404f9 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -10,6 +10,8 @@ STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
 STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
 STRACE_CPE_ID_VENDOR = strace_project
+# We're patching configure.ac
+STRACE_AUTORECONF = YES
 STRACE_CONF_OPTS = --enable-mpers=no
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
