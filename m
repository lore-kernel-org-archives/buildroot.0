Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791AFD3B7EA
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 18:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EF8282251;
	Mon,  8 Dec 2025 18:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9we3U19nTFJv; Mon,  8 Dec 2025 18:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33E3682334
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765218767;
	bh=ByOHOiZa+JnmANcvEivIv3ML6wD5n9n305Da05vQzJQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K8xBrpO/vkZwNyDPCIH+ICLyVrEFCb7ra7HPxnQL1DeVM24qYA7OfL+A2egugbfXt
	 INixjPxRJyVe3th73FLEiAiEvK5/MCLNIuN1zVGUqvUCv+rm+CQTY2ktSoW3vcBJUw
	 8WDrQTYLNLIDvY9pgbdMHqDVOtPUAKVygqVdw28ThjlJjtKSLZT5WDqDPurxlpCo0k
	 lw2y0/UFnMkQHmNEhOfKpFV1NTeg5QaVwcd1RltumB9Xsm0a7R90I6leA7T/6abgN6
	 O2D8pqLIiagZomTBSzOxZS4mTufKtXJr/kxMkFwOHc4Sg+cCFgzf4Rn2+E+zuxx27V
	 0Z8LqG5RYRSqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33E3682334;
	Mon,  8 Dec 2025 18:32:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85F85E7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 18:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B91460A58
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 18:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oN4j_f-aKEtc for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 18:32:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B8F060A42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B8F060A42
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B8F060A42
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 18:32:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B614CA4C06E5;
 Mon,  8 Dec 2025 19:32:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47052)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSg2L-000000004Ts-0Fmz;
 Mon, 08 Dec 2025 18:32:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Laurent Charpentier <laurent_pubs@yahoo.com>
Date: Mon,  8 Dec 2025 19:32:41 +0100
Message-ID: <20251208183241.2523817-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765218761;
 bh=zDcWtYzsFcyiaPDh5KcgU3iaHbOB9a8F4ir+nzUcQMA=;
 h=From:To:Cc:Subject:Date:From;
 b=fWo5BCDP54UZsFu5sR/o2iz5VuCsCsvgMygINjAPScItN6N1PlKvwh+P6DOtgHaFy
 9QzsxdfGpQQQxberqPWFc6fJ3KCFI5pfNkrJwyXoEF5XeqkW60Yi7Uq0V5jTLPboA1
 xXII24rvGMy66pTtaZpsmmRjKqbFtEQvK9XUkirEwM4yWnGlP3BGKr49XGNWNQDNjg
 f7ztu+VSUI3cUO1vUwcG2n/jBp64Kyosqup6he3/izrWa+w82rSIMaF/HOhtjMmn4Z
 f8Jemofee/EKxQVRT6ehDS9dxYx3iXly6TeooxzJg7Me9hot2YyWgJq9fgzU9u4GXA
 aQkA04e9qF2sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fWo5BCDP
Subject: [Buildroot] [PATCH 1/1] package/open-lldp: bump version to 1.1.1
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

Added upstream patch to fix build with gcc 14.x.

Fixes:
https://autobuild.buildroot.net/results/0f8/0f88cbe9152ab816b4ae17e1d84e8257f458eb4a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...string.h-for-mem-function-prototypes.patch | 26 +++++++++++++++++++
 package/open-lldp/open-lldp.hash              |  2 +-
 package/open-lldp/open-lldp.mk                |  2 +-
 3 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 package/open-lldp/0001-clif-Include-string.h-for-mem-function-prototypes.patch

diff --git a/package/open-lldp/0001-clif-Include-string.h-for-mem-function-prototypes.patch b/package/open-lldp/0001-clif-Include-string.h-for-mem-function-prototypes.patch
new file mode 100644
index 0000000000..de67131c58
--- /dev/null
+++ b/package/open-lldp/0001-clif-Include-string.h-for-mem-function-prototypes.patch
@@ -0,0 +1,26 @@
+From f9d0099ac7d9041447cce4d3edd9577b4b52c09c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 22:37:14 -0700
+Subject: [PATCH] clif: Include string.h for mem* function prototypes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/intel/openlldp/commit/f9d0099ac7d9041447cce4d3edd9577b4b52c09c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ clif.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/clif.c b/clif.c
+index cad6f75..0758a7e 100644
+--- a/clif.c
++++ b/clif.c
+@@ -32,6 +32,7 @@
+ 
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <string.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
diff --git a/package/open-lldp/open-lldp.hash b/package/open-lldp/open-lldp.hash
index 1fbd8dd0ca..8bbba470aa 100644
--- a/package/open-lldp/open-lldp.hash
+++ b/package/open-lldp/open-lldp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  13e0890527192a6289e6dac82056c447a1e2624ff93b0b6bbd8a42d15b2cbc8c  open-lldp-1.1.tar.gz
+sha256  2faa9db57f8426db9f394bd2bab87237a350ae43437b16faf6569250cda25a69  open-lldp-1.1.1.tar.gz
 sha256  67af5abeb092213cd9c53781503320f635ba28b641e0c3f24d367e8e93a9839b  COPYING
diff --git a/package/open-lldp/open-lldp.mk b/package/open-lldp/open-lldp.mk
index d42dbcc5c3..0b84b6773e 100644
--- a/package/open-lldp/open-lldp.mk
+++ b/package/open-lldp/open-lldp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN_LLDP_VERSION = 1.1
+OPEN_LLDP_VERSION = 1.1.1
 OPEN_LLDP_SITE = $(call github,intel,openlldp,v$(OPEN_LLDP_VERSION))
 OPEN_LLDP_DEPENDENCIES = readline libnl libconfig host-pkgconf
 OPEN_LLDP_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
