Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4E5C5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 17:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED5ED407D0;
	Mon, 17 Aug 2026 17:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEc88Jwo-dHP; Mon, 17 Aug 2026 17:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB576406B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786986456;
	bh=rQNeICqsCAMherU4+afLpG7znnmsf8D/EpYuuOcfhEI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i0zxyEd7/Kc0k3Gy/mkuaLWM+OST1u9eFcKolnxF5hmNpS3cMna0SnogXsiAke5cF
	 wY6/Hhjr1dVpJLTdPMap22IpOcdmJk8UoEcH8dsbzdNOB7jckp9p9+8lir2cUWi8KJ
	 3nOiMle640z6ryws7h3Si3yO/zCATdbE4AGxW+SNuWZf3Q06Lte4XnfRizfyB2B116
	 mSGTLWfJTpMORiqngTR0VRdRPiUBqHTZC00vL5UfSPdqnmjdOXBmahrtS66q8NXKUt
	 pn6+A70O6gI6mLZz6cCUDXMjCOtOuD1VP9Ta1UBbZfF3oSUULqBxsZny0/k0j2cgRZ
	 70hIMgT3ApbDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB576406B9;
	Mon, 17 Aug 2026 17:07:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62B71337
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5443380FFD
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiQCAVKlMugY for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 17:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 355BB81004
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 355BB81004
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:07:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7837D8CA20; Mon, 17 Aug 2026 17:06:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Aug 2026 18:52:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 335a57525f28425fa076e1b2098679dc2211f8e4
X-Git-Newrev: de14a2ab51b22edbde4bdae03670932ee3918610
X-Patchwork-Hint: ignore
Message-Id: <20260817170642.7837D8CA20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnl: fix build with kernel < 4.15
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1352306670514965767=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1352306670514965767==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/de14a2ab51b22edbde4bdae03670932ee3918610
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 0f2e9cc8784715bdf18e72c433fe9bece4537f85 bumped the
package from 3.11.0 to 3.12.0. This bump includes upstream commit
https://github.com/thom311/libnl/commit/9f8945251da404fb59778edc74be5775091e1f44
which added the usage of enums not present in older kernel versions.

The Gitlab pipelines caught the build errors with the defconfig
bootlin-aarch64-glibc-old:

lib/route/nh_encap_ila.c:50:19: error: ‘ILA_ATTR_IDENT_TYPE’ undeclared
 (first use in this function)
lib/route/nh_encap_ila.c:53:19: error: ‘ILA_ATTR_HOOK_TYPE’ undeclared
 (first use in this function)

Both enums were added to the Linux kernel in version 4.15:
https://github.com/torvalds/linux/commit/fddb231ebe647749782a9ebf11106a81f7168ba7
https://github.com/torvalds/linux/commit/70d5aef48a421a68bd9d1bf8f8267af406681580

Add upstream commit to fix the problem.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-include-linux-include-linux-header-ila.h.patch | 107 +++++++++++++++++++++
 package/libnl/libnl.mk                             |   4 +
 2 files changed, 111 insertions(+)

diff --git a/package/libnl/0002-include-linux-include-linux-header-ila.h.patch b/package/libnl/0002-include-linux-include-linux-header-ila.h.patch
new file mode 100644
index 0000000000..3270366dac
--- /dev/null
+++ b/package/libnl/0002-include-linux-include-linux-header-ila.h.patch
@@ -0,0 +1,107 @@
+From 49f8b364c9a6f6db4ab535f999386fecfa38241b Mon Sep 17 00:00:00 2001
+From: Thomas Haller <thom311@gmail.com>
+Date: Thu, 11 Dec 2025 22:27:07 +0100
+Subject: [PATCH] include/linux: include linux header "ila.h"
+
+Taken from v6.18 (7d0a66e4bb9081d75c82ec4957c50034cb0ea449).
+
+https://github.com/thom311/libnl/issues/447
+
+Upstream: https://github.com/thom311/libnl/commit/49f8b364c9a6f6db4ab535f999386fecfa38241b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Makefile.am                       |  1 +
+ include/linux-private/linux/ila.h | 68 +++++++++++++++++++++++++++++++
+ 2 files changed, 69 insertions(+)
+ create mode 100644 include/linux-private/linux/ila.h
+
+diff --git a/Makefile.am b/Makefile.am
+index 2bd0c06e..e63e3112 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -278,6 +278,7 @@ noinst_HEADERS = \
+ 	include/linux-private/linux/if_packet.h \
+ 	include/linux-private/linux/if_tunnel.h \
+ 	include/linux-private/linux/if_vlan.h \
++	include/linux-private/linux/ila.h \
+ 	include/linux-private/linux/in.h \
+ 	include/linux-private/linux/in6.h \
+ 	include/linux-private/linux/in_route.h \
+diff --git a/include/linux-private/linux/ila.h b/include/linux-private/linux/ila.h
+new file mode 100644
+index 00000000..6a6c97cf
+--- /dev/null
++++ b/include/linux-private/linux/ila.h
+@@ -0,0 +1,68 @@
++/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
++/* ila.h - ILA Interface */
++
++#ifndef _LINUX_ILA_H
++#define _LINUX_ILA_H
++
++/* NETLINK_GENERIC related info */
++#define ILA_GENL_NAME		"ila"
++#define ILA_GENL_VERSION	0x1
++
++enum {
++	ILA_ATTR_UNSPEC,
++	ILA_ATTR_LOCATOR,			/* u64 */
++	ILA_ATTR_IDENTIFIER,			/* u64 */
++	ILA_ATTR_LOCATOR_MATCH,			/* u64 */
++	ILA_ATTR_IFINDEX,			/* s32 */
++	ILA_ATTR_DIR,				/* u32 */
++	ILA_ATTR_PAD,
++	ILA_ATTR_CSUM_MODE,			/* u8 */
++	ILA_ATTR_IDENT_TYPE,			/* u8 */
++	ILA_ATTR_HOOK_TYPE,			/* u8 */
++
++	__ILA_ATTR_MAX,
++};
++
++#define ILA_ATTR_MAX		(__ILA_ATTR_MAX - 1)
++
++enum {
++	ILA_CMD_UNSPEC,
++	ILA_CMD_ADD,
++	ILA_CMD_DEL,
++	ILA_CMD_GET,
++	ILA_CMD_FLUSH,
++
++	__ILA_CMD_MAX,
++};
++
++#define ILA_CMD_MAX	(__ILA_CMD_MAX - 1)
++
++#define ILA_DIR_IN	(1 << 0)
++#define ILA_DIR_OUT	(1 << 1)
++
++enum {
++	ILA_CSUM_ADJUST_TRANSPORT,
++	ILA_CSUM_NEUTRAL_MAP,
++	ILA_CSUM_NO_ACTION,
++	ILA_CSUM_NEUTRAL_MAP_AUTO,
++};
++
++enum {
++	ILA_ATYPE_IID = 0,
++	ILA_ATYPE_LUID,
++	ILA_ATYPE_VIRT_V4,
++	ILA_ATYPE_VIRT_UNI_V6,
++	ILA_ATYPE_VIRT_MULTI_V6,
++	ILA_ATYPE_NONLOCAL_ADDR,
++	ILA_ATYPE_RSVD_1,
++	ILA_ATYPE_RSVD_2,
++
++	ILA_ATYPE_USE_FORMAT = 32, /* Get type from type field in identifier */
++};
++
++enum {
++	ILA_HOOK_ROUTE_OUTPUT,
++	ILA_HOOK_ROUTE_INPUT,
++};
++
++#endif /* _LINUX_ILA_H */
+-- 
+2.47.3
+
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 2dcb594141..5b79ea24a1 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -13,6 +13,10 @@ LIBNL_CPE_ID_VALID = YES
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
 
+# 0002-include-linux-include-linux-header-ila.h.patch
+LIBNL_AUTORECONF = YES
+HOST_LIBNL_AUTORECONF = YES
+
 HOST_LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)

--===============1352306670514965767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1352306670514965767==--
