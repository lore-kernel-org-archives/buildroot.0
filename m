Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6322BE92714
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E98C7607C8;
	Sat, 27 Dec 2025 15:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2nBDw05FbLN; Sat, 27 Dec 2025 15:53:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6821160768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766850816;
	bh=rF+WZoKgXdZhBXTiWLsS/TgFgHXg5PFTqqBm3fraXwo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HJu8bdjMIZWCOKMpJjpoKO+UGx9o0iCQvvoKv4f0Z58yxa4rxO5/g5VU8zo1UMZVh
	 VLSnmrzm/gIkv6lC4ZOREr/c4VVI5xNfqbQ3qK2p6Fl7INgjvAA5tb27772k+l5vRJ
	 Swji61fnTK3mnnqvaS9Ca/26n/xObZqn1tFWIo5X8c5FS39uipMfg3/ONAfREdq4zw
	 YN2QOenPluqV7WQo+juDVE2fZ5tRQ6nsQAYzV/PyNq3zgdKkV4sqQYSlyg6psdyPeM
	 9ilDT3j3hcsuz8BWrH7mZWTsAE41eN6AsNipOhm5UnAO2Dn4H/Asb4vnqCdCUse816
	 kv3Slz+QyZSHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6821160768;
	Sat, 27 Dec 2025 15:53:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFB76D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D30F4026D
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSvqchmqer-E for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4912C40290
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4912C40290
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 213C087790; Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:53:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2667cab664b568ff0619dacf5d0b38d5926aff61
X-Git-Newrev: fe917c36719de4916bfa4be0397d8c838b0d021d
X-Patchwork-Hint: ignore
Message-Id: <20251227155330.213C087790@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open-lldp: fix musl build with >=
 gcc-14.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fe917c36719de4916bfa4be0397d8c838b0d021d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC >= 14.x is stricter amount having access to the prototypes of
functions being used, causing a build failure in open-lldp due to a
missing <string.h> include. This is only visible with musl probably
because with other C libraries <string.h> end up being included by
some other header.

Fixes:
https://autobuild.buildroot.net/results/0f8/0f88cbe9152ab816b4ae17e1d84e8257f458eb4a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
