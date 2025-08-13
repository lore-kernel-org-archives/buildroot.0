Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC73FCA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 20:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9531042AB1;
	Wed, 13 Aug 2025 20:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAUwuoRFv-6G; Wed, 13 Aug 2025 20:14:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F8F242AB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F8F242AB2;
	Wed, 13 Aug 2025 20:14:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 219C2938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 20:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FE7861B76
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 20:14:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhsCVoGKl-T0 for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 20:14:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D566A61C03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D566A61C03
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D566A61C03
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 20:14:01 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 16F16E00108;
 Wed, 13 Aug 2025 22:13:58 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Wed, 13 Aug 2025 22:13:54 +0200
Message-ID: <20250813201355.6232-1-fl@n621.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1755116038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=eI2WTXxbOEiL6fcCplEsndrg1n3D5KjAntpUcGd52/c=;
 b=NqWQuP2SpNeOSyzfs88zFSyar3NsNJ2u04NIwSshTfC5thRIaeXs62EleTNuzprRIPgXLc
 Jp+XokhI2QvsKMDZeJsVsF0SxESth9zBL0dnDnOPIBS0obcDxsREr8yI8Ry9P+eSZVRAbq
 cHRcTdm2h4P0OVliH+Fef4BNBqZMa1M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=NqWQuP2S
Subject: [Buildroot] [PATCH 1/1] package/start-stop-daemon: fix build issues
 with musl and GCC 14
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

Unlike glibc and uClibc, musl doesn't play tricks with transparent
unions for the second argument to bind() to accept the various sockaddr
variants, but rather just defines it as "struct sockaddr*". As GCC 14 no
longer allows arbitrary implicit pointer casts, this results in a build
error. Import the upstream patch that adds the cast.

Fixes: https://autobuild.buildroot.org/results/00b/00b42a35a80c2deb61f2cd40aedd231597bbb290
Signed-off-by: Florian Larysch <fl@n621.de>
---
 ...t-sockaddr_un-to-struct-sockaddr-on-.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/start-stop-daemon/0003-s-s-d-Cast-struct-sockaddr_un-to-struct-sockaddr-on-.patch

diff --git a/package/start-stop-daemon/0003-s-s-d-Cast-struct-sockaddr_un-to-struct-sockaddr-on-.patch b/package/start-stop-daemon/0003-s-s-d-Cast-struct-sockaddr_un-to-struct-sockaddr-on-.patch
new file mode 100644
index 0000000000..c093b49e2e
--- /dev/null
+++ b/package/start-stop-daemon/0003-s-s-d-Cast-struct-sockaddr_un-to-struct-sockaddr-on-.patch
@@ -0,0 +1,31 @@
+From 209ffbbf7c8fcf49d9296c969feb7a41aece6525 Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Tue, 6 Dec 2022 18:37:08 +0100
+Subject: [PATCH] s-s-d: Cast struct sockaddr_un to struct sockaddr on bind()
+ call
+
+Changelog: internal
+Warned-by: gcc -Wincompatible-pointer-types on musl-libc
+
+Upstream: https://git.dpkg.org/cgit/dpkg/dpkg.git/commit/?id=209ffbbf7c8fcf49d9296c969feb7a41aece6525
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ utils/start-stop-daemon.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/start-stop-daemon.c b/utils/start-stop-daemon.c
+index 6863151c1..a15c0493f 100644
+--- a/utils/start-stop-daemon.c
++++ b/utils/start-stop-daemon.c
+@@ -632,7 +632,7 @@ create_notify_socket(void)
+ 	su.sun_family = AF_UNIX;
+ 	strncpy(su.sun_path, sockname, sizeof(su.sun_path) - 1);
+ 
+-	rc = bind(fd, &su, sizeof(su));
++	rc = bind(fd, (struct sockaddr *)&su, sizeof(su));
+ 	if (rc < 0)
+ 		fatale("cannot bind to notification socket");
+ 
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
