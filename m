Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D03ECFD30D
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 22:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19BAD41075;
	Sat, 22 Nov 2025 22:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9J1vVgItWaa1; Sat, 22 Nov 2025 22:53:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3389241076
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3389241076;
	Sat, 22 Nov 2025 22:53:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55D6E34E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F64360AC7
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXESi9UjfgiN for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 22:53:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6572460A99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6572460A99
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6572460A99
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:53:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F213AA4C7547;
 Sat, 22 Nov 2025 23:53:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44488)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMwTi-000000000na-1rOT;
 Sat, 22 Nov 2025 22:53:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 22 Nov 2025 23:53:14 +0100
Message-ID: <20251122225314.2208991-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763851995;
 bh=N43FCtvNIz2ZFoly9GQPs49vV4ob18RB1VxO6i5qKxA=;
 h=From:To:Cc:Subject:Date:From;
 b=m4s9ULX7yjv36hal2maDM2KEKR9Z9OGk5JMzzHB8MQ3WuFeJdtK06Ywr0D1kbgzZy
 ifO0LditIn38BVrGxu3t0fyz8lM0cmz6IEnBM49KgZDxfYtamtvdw4YZEqhvJMkAsL
 XFIANcFiUrpKOYZLVDuilQKf5xToiej/gJVoJ31mt68mDpKnGTeagTn8Kr8jnSlfxu
 z8/v8M707bqfo6NFUMJYax6b5ES4ikdU09RzWbJ2ZrZj+Bj778QBDim0LuP1huMR9D
 6rAYGJ/WswEzEEzZyLskln5ApHCL4euQiJnd0zFoolbpFhULF+cmhxvIkz4IfE2V7b
 dmPtpW1Q5PgcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=m4s9ULX7
Subject: [Buildroot] [PATCH 1/1] package/atf: fix build with newer gcc
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

Buildroot commit d6c3257e931ed256e3ebcd78938f6146bba8586f bumped the
package from 0.21 to 0.23. Upstream release 0.22 includes commit
https://github.com/freebsd/atf/commit/d7c7c53c0626ab59a62aa4efcf05323b3621baa9
which uses CLOCK_MONOTONIC without including time.h.

Fixes:
https://autobuild.buildroot.net/results/41b/41b25ee8e66e34323eca011e4b5fe479ece9ed76/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-atf-check.cpp-include-time.h.patch   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/atf/0001-atf-check.cpp-include-time.h.patch

diff --git a/package/atf/0001-atf-check.cpp-include-time.h.patch b/package/atf/0001-atf-check.cpp-include-time.h.patch
new file mode 100644
index 0000000000..9207602382
--- /dev/null
+++ b/package/atf/0001-atf-check.cpp-include-time.h.patch
@@ -0,0 +1,33 @@
+From 67e7d350a15aff88c151b1fc838dac83d35be955 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 22 Nov 2025 23:47:41 +0100
+Subject: [PATCH] atf-check.cpp: include time.h
+
+Fixes build error with gcc 14 as reported by the buildroot autobuilders:
+https://autobuild.buildroot.net/results/41b/41b25ee8e66e34323eca011e4b5fe479ece9ed76/build-end.log
+
+atf-sh/atf-check.cpp: In function 'useconds_t get_monotonic_useconds()':
+atf-sh/atf-check.cpp:183:24: error: 'CLOCK_MONOTONIC' was not declared in this scope
+
+Upstream: https://github.com/freebsd/atf/pull/108
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ atf-sh/atf-check.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/atf-sh/atf-check.cpp b/atf-sh/atf-check.cpp
+index 1354e3a..94da413 100644
+--- a/atf-sh/atf-check.cpp
++++ b/atf-sh/atf-check.cpp
+@@ -30,6 +30,7 @@ extern "C" {
+ #include <limits.h>
+ #include <signal.h>
+ #include <stdint.h>
++#include <time.h>
+ #include <unistd.h>
+ }
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
