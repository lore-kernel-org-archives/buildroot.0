Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FFACCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5964B40A04;
	Sat, 18 Oct 2025 19:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iDx7uT0kLvf; Sat, 18 Oct 2025 19:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B90240A33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B90240A33;
	Sat, 18 Oct 2025 19:27:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B6CCD8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70E684002D
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cE1xTriyJDRU for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C9EE240F78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9EE240F78
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9EE240F78
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:27:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 11C48A4C0EA6;
 Sat, 18 Oct 2025 21:27:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47044)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vACaQ-000000003qQ-0Mfu;
 Sat, 18 Oct 2025 19:27:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 18 Oct 2025 21:27:29 +0200
Message-ID: <20251018192729.3113082-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760815650;
 bh=7ZDTcIo1Hl3VcVzPqX/Z8RcDQt+hGmCutgRuGDEzM3k=;
 h=From:To:Cc:Subject:Date:From;
 b=VjzvP445H1mWHRxobLUnOXOBAekHYFLghixV2u8v70YkkN6XKDygjgisKymaFpAaX
 xdPqX4Storun2GwVjkiqiw82jwyOYEWhM47PU2JAJ6yX4vcCY7l0aVwWFBkEU3X/UA
 bmbASbBr5P75Vv1sNhBgSJ5jYBWivCa/OSqNnSiwGUkkG4ofe0F4nLaZDqlSrYo2el
 DuIJtqwlw/mjWAaYJU30d8kI5GbhdhEz1Tl1bLiJTLMoBbGooOznC9MxXgMU2XwB7T
 cdrkt+EQSFpp8l2AG8PrG6RQne+NAwshjNLA4rrOMeCdE8FgIHd+xp9ewpSfMb8s+m
 igeyBFY57r15Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=VjzvP445
Subject: [Buildroot] [PATCH 1/1] package/iproute2: add upstream patch to fix
 musl/uclibc build
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

Buildroot commit 532d5561f48b6c430e7414ba5eacccf9b6c1bd22 bumped
iproute2 to version 6.17.0 which added lib/bridge.c:
https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/log/lib/bridge.c?h=v6.17.0
and causes build errors on musl & uclibc toolchains.

Added upstream patch to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/951/951e4198b2ba109fd9c746fe2e6316a29085aeeb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ridge-avoid-redefinition-of-in6_addr.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch

diff --git a/package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch b/package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch
new file mode 100644
index 0000000000..c684b030a8
--- /dev/null
+++ b/package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch
@@ -0,0 +1,36 @@
+From 7119f3736f689ab396ca4193ac593938affd55fa Mon Sep 17 00:00:00 2001
+From: Yureka <yureka@cyberchaos.dev>
+Date: Sun, 12 Oct 2025 14:39:47 +0200
+Subject: lib: bridge: avoid redefinition of in6_addr
+
+On musl libc, which does not use the kernel definitions of in6_addr, including
+the libc headers after the kernel (UAPI) headers would cause a redefinition
+error. The opposite order avoids the redefinition.
+
+Fixes: 9e89d5b94d749f37525cd8778311e1c9f28f172a
+Signed-off-by: Yureka <yureka@cyberchaos.dev>
+
+Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=7119f3736f689ab396ca4193ac593938affd55fa
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/bridge.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/bridge.c b/lib/bridge.c
+index 5386aa017..104f5858b 100644
+--- a/lib/bridge.c
++++ b/lib/bridge.c
+@@ -2,8 +2,8 @@
+ 
+ #include <net/if.h>
+ 
+-#include "bridge.h"
+ #include "utils.h"
++#include "bridge.h"
+ 
+ void bridge_print_vlan_flags(__u16 flags)
+ {
+-- 
+cgit 1.2.3-korg
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
