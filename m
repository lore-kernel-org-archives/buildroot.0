Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8335CD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5908F80ABB;
	Wed,  7 Jan 2026 17:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77QZXAQF0PeI; Wed,  7 Jan 2026 17:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80C6280BAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808043;
	bh=c1KzHtc1/Rg0ce2ZC/2AHP/owugOr07yWsZ/GAsASVA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y4H2QShIo19mOwozd1oMYMQUsJxiDEtoKTB3PCiKHfxbM2ZEvGapKSBhIEUip61eb
	 G3xbAgoonn2ry7RW9a4HcuxPh5vSApRYsWw0EQmAPiPQcHRxQfR+4YM+sB9R6jprnY
	 li6YOkbYxMxow+jKa6YjCMgSTtWlVaK/Q5pCfPlIJCCUokJ8qb6SyQwQbY9g0OSL9J
	 qq1oA383RMmwL8rf5R0GWCB1WYagYEJgfMmcyCYO4E5axHOAcXixYXu1ZgyDn+2Yr3
	 j3UaYVG4fpRxSU9S+T1Vl0YwDRnaLOmc/2DtDY+pohmq2EjW+dv/oDlYqbMQoXqht1
	 D5ang66amPyTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80C6280BAE;
	Wed,  7 Jan 2026 17:47:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFE7A9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CA2F60A5F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOb6M-EBFn8x for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6D1D608AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6D1D608AD
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C686387D42; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:43 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c8f817c9957d6288119ba216425d3aa296246c95
X-Git-Newrev: 770100904c20037cc8becb33616d89987cad70cd
X-Patchwork-Hint: ignore
Message-Id: <20260107174641.C686387D42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/open-lldp: fix
 musl build with >= gcc-14.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=770100904c20037cc8becb33616d89987cad70cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

GCC >= 14.x is stricter amount having access to the prototypes of
functions being used, causing a build failure in open-lldp due to a
missing <string.h> include. This is only visible with musl probably
because with other C libraries <string.h> end up being included by
some other header.

Fixes:
https://autobuild.buildroot.net/results/0f8/0f88cbe9152ab816b4ae17e1d84e8257f458eb4a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fe917c36719de4916bfa4be0397d8c838b0d021d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...lude-string.h-for-mem-function-prototypes.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
