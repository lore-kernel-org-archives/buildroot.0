Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E8EC9832F
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 17:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45EF86F8B2;
	Sun, 18 Jan 2026 17:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwUfrVHZ1jiF; Sun, 18 Jan 2026 17:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D56FD6F8AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768756071;
	bh=9hJ4uPUJ0XGnmqcNIRB/SDQUG4VhyiAKeMabm8qFNdk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nKgEma4LjwhcSVsEKsXoBeDoI2Jy/gqjGj0idrIxGOrI+U7uzIvGJi/eFQji4zGpt
	 wGEUEd/E0BdvomnMPwcHZPRrOGrrLUFoQi6bFwbr7sbCPW7b2pt4EkL2MIuXjZhsBh
	 ifykyXe8iJrDDVEMrtxZjPSKbiSPquIFPy2W46ji1SYXacPsc2q8RnS1xdHSZPlU/m
	 FUScbEg//QYFLm+jrvXGu4xmloPBYtQfUFTPdRUDoUgULTzUIWGJ2Q0idj8dBicK/A
	 Ipdsv806E3+8Q96PR31huzh1Qp72Te7N+RX52hqOGZg+JhE40nrGtUBv4POU+Dvf8m
	 NEZUT4YH3nVkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D56FD6F8AD;
	Sun, 18 Jan 2026 17:07:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A0762A8
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 17:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F271585087
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 17:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDara7oVnBTV for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 17:07:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4EE7C85085
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EE7C85085
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EE7C85085
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 17:07:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09ef.dip0.t-ipconnect.de [91.58.9.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 67F09A4C45E3;
 Sun, 18 Jan 2026 18:07:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54346)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhWFP-000000000Z3-27RX;
 Sun, 18 Jan 2026 17:07:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sun, 18 Jan 2026 18:07:31 +0100
Message-ID: <20260118170731.3366652-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260118170731.3366652-1-bernd@kuhls.net>
References: <20260118170731.3366652-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768756052;
 bh=v7qlcc42NrFcKmyjTz1tm49qmE98hbdH59UnygCePpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iWxWMnqwQhJz+fn50ZcAiQwh+Dky6WuO9oIcVyAeD2Ve73psvDVF5R89EMkH2LJM2
 sfO5ih2nsxrieenoJMRSdXRrrr0DlpKZXfdlSOagNCDrOLjblG0EGFVQp8QzZq1/u7
 XFp1PoWYj/9vd9SNeOgHSQRHrULG7154k3sWsflGI9pdR6531oPglXBwNreui8ss5T
 a/eJ07XW1h12yqBrnD7uvvx9NSBW6hu1WwkzjYFE5C1sMfQ8Stl6Fm1y6wC9u7v7VQ
 ooCPxTOvR+hwjFyulZe/3Z+7WEnYWzGYYQrqiJAWwoBEQQDn+hcDyMlWBWGzv/4u9U
 jw8tTZzlECQIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=iWxWMnqw
Subject: [Buildroot] [PATCH 2/2] package/mcelog: bump version to 210
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

https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/log/

Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...orrect-prameter-type-for-connect-API.patch | 43 -------------------
 .../0002-client.c-fix-build-w-musl-libc.patch | 42 ------------------
 package/mcelog/mcelog.hash                    |  2 +-
 package/mcelog/mcelog.mk                      |  2 +-
 4 files changed, 2 insertions(+), 87 deletions(-)
 delete mode 100644 package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
 delete mode 100644 package/mcelog/0002-client.c-fix-build-w-musl-libc.patch

diff --git a/package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch b/package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
deleted file mode 100644
index cc9d0e84c6..0000000000
--- a/package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c17897deb52daab300c585a6a6c2456d062d80cf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 May 2024 22:50:19 -0700
-Subject: [PATCH] server: Correct prameter type for connect() API
-
-connect() function expects the second argument to be point to sockaddr
-as per man sockaddr
-
-int connect (int, const struct sockaddr *, socklen_t);
-
-Fixes build failures with -Wincompatible-pointer-types when using GCC-14
-and musl
-
-Fixes
-| server.c: In function 'server_ping':
-| server.c:308:33: error: passing argument 2 of 'connect' from incompatible pointer type [-Wincompatible-pointer-types]
-|   308 |                 if (connect(fd, un, sizeof(struct sockaddr_un)) < 0)
-|       |                                 ^~
-|       |                                 |
-|       |                                 struct sockaddr_un *
-
-Signed-off-by: Andi Kleen <ak@linux.intel.com>
-
-Upstream: https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/?id=c17897deb52daab300c585a6a6c2456d062d80cf
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- server.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/server.c b/server.c
-index 54c7d57..51b7d3a 100644
---- a/server.c
-+++ b/server.c
-@@ -305,7 +305,7 @@ static int server_ping(struct sockaddr_un *un)
- 	if (sigsetjmp(ping_timeout_ctx, 1) == 0) {
- 		ret = -1;
- 		alarm(initial_ping_timeout);
--		if (connect(fd, un, sizeof(struct sockaddr_un)) < 0)
-+		if (connect(fd, (const struct sockaddr *)un, sizeof(struct sockaddr_un)) < 0)
- 			goto cleanup;
- 		if (write(fd, PAIR("ping\n")) < 0)
- 			goto cleanup;
diff --git a/package/mcelog/0002-client.c-fix-build-w-musl-libc.patch b/package/mcelog/0002-client.c-fix-build-w-musl-libc.patch
deleted file mode 100644
index f7334c8c6f..0000000000
--- a/package/mcelog/0002-client.c-fix-build-w-musl-libc.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a90e39f896a2f1b76ad3c304b69c451ec92a687a Mon Sep 17 00:00:00 2001
-From: Brahmajit Das <brahmajit.xyz@gmail.com>
-Date: Mon, 12 Jun 2023 10:55:28 +0000
-Subject: [PATCH] client.c: fix build w/ musl libc
-
-Without the patch, I'm getting the following error:
-
-client.c:47:2: error: call to undeclared library function 'strncpy' with type
-      'char *(char *, const char *, unsigned long)'; ISO C99 and later do not support implicit function declarations
-      [-Wimplicit-function-declaration]
-        strncpy(sun.sun_path, path, sizeof(sun.sun_path)-1);
-        ^
-client.c:47:2: note: include the header <string.h> or explicitly provide a declaration for 'strncpy'
-client.c:60:19: error: call to undeclared library function 'memcmp' with type 'int
-      (const void *, const void *, unsigned long)'; ISO C99 and later do not support implicit function declarations
-      [-Wimplicit-function-declaration]
-                        if (n >= 5 && !memcmp(buf + n - 5, "done\n", 5)) {
-                                       ^
-client.c:60:19: note: include the header <string.h> or explicitly provide a declaration for 'memcmp'
-2 errors generated.
-
-Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
-
-Upstream: https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/?id=a90e39f896a2f1b76ad3c304b69c451ec92a687a
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- client.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/client.c b/client.c
-index 883b1de..7119ed9 100644
---- a/client.c
-+++ b/client.c
-@@ -19,6 +19,7 @@
- #include <sys/socket.h>
- #include <sys/un.h>
- #include <unistd.h>
-+#include <string.h>
- #include "mcelog.h"
- #include "client.h"
- #include "paths.h"
diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
index a82d6f2ed2..309a0fa197 100644
--- a/package/mcelog/mcelog.hash
+++ b/package/mcelog/mcelog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  52ad2771a8dc8e30b44a52864620cf1be1fce81f9ae83c4652a9e2d010b1a533  mcelog-194.tar.gz
+sha256  5760c1b433ca4caccf140d51490e2565d117a684942d9f6b4d79b6209465e11e  mcelog-210.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index 5cd00cc354..62bd492e0f 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = 194
+MCELOG_VERSION = 210
 MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
 MCELOG_LICENSE = GPL-2.0
 MCELOG_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
