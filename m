Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BEDE9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBBFB611DF;
	Wed,  4 Feb 2026 17:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G787mfSgnwga; Wed,  4 Feb 2026 17:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F2C060A6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224894;
	bh=QgXKimLpV0XZS3+/XdW+ZvV6h4mt6DiJBp9DkdTgWkI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AKCmTAD7w4uWl6npZck4TSsFSa+H9VzuM7F1r+/knjLEMkp7Ws4hy+aHpkJ5Cqopt
	 D1ZRChk7S3VXlkObA7teq1GwJIX+WqsGimmvpy59SBCkYYS2lMhk7YmRi5TEGUiisE
	 TriLHibniBgu7H81HArmhMvjv49DWHbSvCl7ZPVrVUAcj0TQ8q8xCFCeucF28FTBGU
	 iXjQtz8z9AEZ3mc8P4oZ8PUQBxycrhcPwFed9UY9mffEhEkO78fswENWXqrsGBInQu
	 E9F/ke62t2eKgOtLDroGFU5xgQpZmIBIZmS+6UFkP7z/KOa7KFTUhQBdZCled7kvYE
	 toqNz5oX4YSqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F2C060A6D;
	Wed,  4 Feb 2026 17:08:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71E3CF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 633D640581
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzdSVtUK0G9l for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 900984054D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 900984054D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63FE38697C; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:26:43 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 2ae91fd40e8d0445ceaee3214e67641b2b29fd4f
X-Git-Newrev: aa94a00b94c77313b8317f451e1a6c13b278473b
X-Patchwork-Hint: ignore
Message-Id: <20260204170747.63FE38697C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/mcelog: fix musl
 build with gcc >= 14.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa94a00b94c77313b8317f451e1a6c13b278473b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes:
https://autobuild.buildroot.net/results/902/9020e4fda8cbc4f9886d5e8725f6df8d99716241/

The build error does not occur with gcc-13.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a042ea816a44a72084fe90effc912787f1a2a673)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ver-Correct-prameter-type-for-connect-API.patch | 43 ++++++++++++++++++++++
 .../0002-client.c-fix-build-w-musl-libc.patch      | 42 +++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch b/package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
new file mode 100644
index 0000000000..cc9d0e84c6
--- /dev/null
+++ b/package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
@@ -0,0 +1,43 @@
+From c17897deb52daab300c585a6a6c2456d062d80cf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 May 2024 22:50:19 -0700
+Subject: [PATCH] server: Correct prameter type for connect() API
+
+connect() function expects the second argument to be point to sockaddr
+as per man sockaddr
+
+int connect (int, const struct sockaddr *, socklen_t);
+
+Fixes build failures with -Wincompatible-pointer-types when using GCC-14
+and musl
+
+Fixes
+| server.c: In function 'server_ping':
+| server.c:308:33: error: passing argument 2 of 'connect' from incompatible pointer type [-Wincompatible-pointer-types]
+|   308 |                 if (connect(fd, un, sizeof(struct sockaddr_un)) < 0)
+|       |                                 ^~
+|       |                                 |
+|       |                                 struct sockaddr_un *
+
+Signed-off-by: Andi Kleen <ak@linux.intel.com>
+
+Upstream: https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/?id=c17897deb52daab300c585a6a6c2456d062d80cf
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ server.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/server.c b/server.c
+index 54c7d57..51b7d3a 100644
+--- a/server.c
++++ b/server.c
+@@ -305,7 +305,7 @@ static int server_ping(struct sockaddr_un *un)
+ 	if (sigsetjmp(ping_timeout_ctx, 1) == 0) {
+ 		ret = -1;
+ 		alarm(initial_ping_timeout);
+-		if (connect(fd, un, sizeof(struct sockaddr_un)) < 0)
++		if (connect(fd, (const struct sockaddr *)un, sizeof(struct sockaddr_un)) < 0)
+ 			goto cleanup;
+ 		if (write(fd, PAIR("ping\n")) < 0)
+ 			goto cleanup;
diff --git a/package/mcelog/0002-client.c-fix-build-w-musl-libc.patch b/package/mcelog/0002-client.c-fix-build-w-musl-libc.patch
new file mode 100644
index 0000000000..f7334c8c6f
--- /dev/null
+++ b/package/mcelog/0002-client.c-fix-build-w-musl-libc.patch
@@ -0,0 +1,42 @@
+From a90e39f896a2f1b76ad3c304b69c451ec92a687a Mon Sep 17 00:00:00 2001
+From: Brahmajit Das <brahmajit.xyz@gmail.com>
+Date: Mon, 12 Jun 2023 10:55:28 +0000
+Subject: [PATCH] client.c: fix build w/ musl libc
+
+Without the patch, I'm getting the following error:
+
+client.c:47:2: error: call to undeclared library function 'strncpy' with type
+      'char *(char *, const char *, unsigned long)'; ISO C99 and later do not support implicit function declarations
+      [-Wimplicit-function-declaration]
+        strncpy(sun.sun_path, path, sizeof(sun.sun_path)-1);
+        ^
+client.c:47:2: note: include the header <string.h> or explicitly provide a declaration for 'strncpy'
+client.c:60:19: error: call to undeclared library function 'memcmp' with type 'int
+      (const void *, const void *, unsigned long)'; ISO C99 and later do not support implicit function declarations
+      [-Wimplicit-function-declaration]
+                        if (n >= 5 && !memcmp(buf + n - 5, "done\n", 5)) {
+                                       ^
+client.c:60:19: note: include the header <string.h> or explicitly provide a declaration for 'memcmp'
+2 errors generated.
+
+Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
+
+Upstream: https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/?id=a90e39f896a2f1b76ad3c304b69c451ec92a687a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ client.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/client.c b/client.c
+index 883b1de..7119ed9 100644
+--- a/client.c
++++ b/client.c
+@@ -19,6 +19,7 @@
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ #include <unistd.h>
++#include <string.h>
+ #include "mcelog.h"
+ #include "client.h"
+ #include "paths.h"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
