Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8AFC9832F
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 17:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A268885087;
	Sun, 18 Jan 2026 17:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrbFgTTTpfYV; Sun, 18 Jan 2026 17:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFB3885082
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768756056;
	bh=bP3WxW8Gd1REgtZmS38aE902jLmt5spo6tA/Od9sfvs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ewm3Bvi6j57jZwl/3NlwSxmbIqWNRA0I/KGRDhj1WSAyXnXK+OqnU6cNaFOZ9/LnW
	 LBUMcrGG4Oi0R5RJan1lL7kJu2+ZI/BGAo/y6CtPpTetmFLfSfEMnqt9XgjaQCYlHN
	 swnYmnysm5ZmoiaRr9/fltQHunR4Ga4hJU5la3NbXTlIJGohaSfPvfnaxMIiH+eBXX
	 ayZFJSM0BmR636zErxMmJXdi+5tGy1vEb2/TXDOTYDyTTMQ1bLmPpbHaWg7JMtmEhy
	 QLk9CtQeSSl6ZxyEkLw6PXBcaQ9aUKjzd/SSj9Y68/VQ3tv/KJMO4A0QnqOGXh9twW
	 lHVkJwQPwG4KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFB3885082;
	Sun, 18 Jan 2026 17:07:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 725DE2CE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 17:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EC22405FD
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 17:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DZxEcfxW28k9 for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 17:07:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42FC040567
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42FC040567
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42FC040567
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 17:07:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09ef.dip0.t-ipconnect.de [91.58.9.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46C40A4C2C35;
 Sun, 18 Jan 2026 18:07:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54346)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhWFP-000000000Z3-1ciY;
 Sun, 18 Jan 2026 17:07:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sun, 18 Jan 2026 18:07:30 +0100
Message-ID: <20260118170731.3366652-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768756052;
 bh=+TJrqz/YFp0wY8HFspsVye79+2wlEtQOqkvTntjiANI=;
 h=From:To:Cc:Subject:Date:From;
 b=mh3amecJhxS90RrE7wNbrVOpLst9Yil4eEQ7aqecvi+E9D6iKdC3ZnjMuwEcp/KSc
 LJFvumn1V8jnF1ROQN1cklSUKiqpDpTuai4wrDlGt0YXPRKa9F7oeKTSTdN1AJxcl0
 o0MqY8ZCRlemugUZC7XeSL5rrCIBAKWZAQ3SpjYRYg35lo2SV5WcVui+wexk9E+Da+
 ctZTiFmYKwxLSt8stg+2UqlJiq5RkvyqvjQabrLf34yOWWEHfY4OlHYFC1uDtL22XY
 HNPYw0mTqclv0yQDZWjTJ2Q4UOLeJM4HTMeeV5Z39s8QkM42m8GMnDoKUtmQrPu3gy
 gOabw4ntPCV3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mh3amecJ
Subject: [Buildroot] [PATCH 1/2] package/mcelog: fix musl build with gcc >=
 14.x
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
https://autobuild.buildroot.net/results/902/9020e4fda8cbc4f9886d5e8725f6df8d99716241/

The build error does not occur with gcc-13.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...orrect-prameter-type-for-connect-API.patch | 43 +++++++++++++++++++
 .../0002-client.c-fix-build-w-musl-libc.patch | 42 ++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
 create mode 100644 package/mcelog/0002-client.c-fix-build-w-musl-libc.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
