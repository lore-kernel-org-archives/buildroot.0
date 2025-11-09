Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79945CCFA1E
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 11:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C8D081349;
	Sun,  9 Nov 2025 11:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VzozpfrrgMD; Sun,  9 Nov 2025 11:04:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5230D8134C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5230D8134C;
	Sun,  9 Nov 2025 11:04:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 054CD25D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 11:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBCD28134C
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 11:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JobKdwV9v38g for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 11:04:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA34981349
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA34981349
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA34981349
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 11:04:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd38.dip0.t-ipconnect.de [84.161.189.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DFB28A4C4424
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 12:03:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47282)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vI3DB-000000002Wi-25sE
 for buildroot@buildroot.org; Sun, 09 Nov 2025 11:03:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Nov 2025 12:03:56 +0100
Message-ID: <20251109110357.3158832-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762686238;
 bh=OVxFovZydMyQYdZLTtgyqzwZuS1qvnR/hkVVuJl2h9E=;
 h=From:To:Subject:Date:From;
 b=mmI417rB2nbLsUxjXaohTBVEAaFwB4nBPV7fjlGHBctSWwJhoUMacZ+shU+jujwrJ
 InBsxlBzJvVzhjVgU1bIUyEYuY/RddiYjmEhDFrQPDQ6Se33HKHT8uHz+9l4UixYwX
 zckqBgYJk+m5O98ZH7L0dxupNg91tH6o/KytK9iQDCXyUpKgtVy6BiGcMcntbAHOEZ
 3pwifwgA+Ji7ed28JhYj/QzySen3Q6TuPBmfSOfzKNDlPwZYPQELsIyy5lAcsgex43
 0jQPDg3w3Mtwu70KfnxVVl6azE7zcF+ABUrTWS/BIwsyL85glR9CsXnMatnrz5HQbq
 +rROE0NSKhsWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=mmI417rB
Subject: [Buildroot] [PATCH 1/2] package/nbd: Fix build on musl + gcc14
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

Fixes:
https://autobuild.buildroot.net/results/1e8/1e88151bb3aad1c1769e12b4930a2c33cd1c6830/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...1-nbd-client-Fix-build-on-musl-gcc14.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch

diff --git a/package/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch b/package/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch
new file mode 100644
index 0000000000..72f43b1f9c
--- /dev/null
+++ b/package/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch
@@ -0,0 +1,46 @@
+From 4664b8dd3bc124c27b160720113339c1da97c2c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2024 17:50:51 -0700
+Subject: [PATCH] nbd-client: Fix build on musl + gcc14
+
+GCC-14 has promoted incompatible-pointer-types warning into error which is
+now flagged especially with when building on musl
+
+Fixes following error
+
+| ../nbd-3.26.1/nbd-client.c: In function 'openunix':
+| ../nbd-3.26.1/nbd-client.c:345:27: error: passing argument 2 of 'connect' from incompatible pointer type [-Wincompatible-pointer-types]
+|   345 |         if (connect(sock, &un_addr, sizeof(un_addr)) == -1) {
+|       |                           ^~~~~~~~
+|       |                           |
+|       |                           struct sockaddr_un *
+| In file included from ../nbd-3.26.1/nbd-client.c:25:
+| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/nbd/3.26.1/recipe-sysroot/usr/include/sys/socket.h:386:19: note: expected 'const struct sockaddr *' but argument is of type 'struct sockaddr_un *'
+|   386 | int connect (int, const struct sockaddr *, socklen_t);
+|       |                   ^~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/NetworkBlockDevice/nbd/commit/4664b8dd3bc124c27b160720113339c1da97c2c4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ nbd-client.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nbd-client.c b/nbd-client.c
+index f4e120f..bc79bdf 100644
+--- a/nbd-client.c
++++ b/nbd-client.c
+@@ -342,7 +342,7 @@ int openunix(const char *path) {
+ 		return -1;
+ 	};
+ 
+-	if (connect(sock, &un_addr, sizeof(un_addr)) == -1) {
++	if (connect(sock, (struct sockaddr*)&un_addr, sizeof(un_addr)) == -1) {
+ 		err_nonfatal("CONNECT failed");
+ 		close(sock);
+ 		return -1;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
