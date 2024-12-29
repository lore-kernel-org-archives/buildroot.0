Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59363E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 20:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28D1660876;
	Sun, 29 Dec 2024 20:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctdp_XTMzPaJ; Sun, 29 Dec 2024 20:27:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2931F6068A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2931F6068A;
	Sun, 29 Dec 2024 20:27:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AD6772
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A75E605A5
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sDMNIuK3peY for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 20:27:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE8FC6068A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE8FC6068A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE8FC6068A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:27:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 130C51C0002;
 Sun, 29 Dec 2024 20:26:56 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 29 Dec 2024 21:26:44 +0100
Message-ID: <20241229202647.788835-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735504018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WRd/6lGORVuw/Awc7LQiqSyorhyNWGJESydVegOxhY8=;
 b=JL9I9J3ddvB6xZyaEZ1hY41e9tLFc1ZLFU49IzmdVQHC4vGngBlwmkd8XX26My+U1ULd8a
 UOHT7NJf2Jk+I1NDCRq457GqXNZwm4HNrW+Z3TNnVxK+Y1mUgsDkL9oyzsb6q6zM7VQaOg
 FmOBK90un+LIRlosAhV1knNhr6FkcruWdPbIgZXrl22S7FX92c/IlLm0eCltJ7dNSeY3o/
 PeGhHvUUxEbLjqNwOo1J8yJvHVe+dadoKF3FHqQETU4XK8OAroOFXi1L0OztW8Dr4EU5rS
 iSiPOO3N+eUyvpDfhUrguW4YBBuTMDnLkSY1cs7MTbI7Fnkad/ezqYFImeF0IQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JL9I9J3d
Subject: [Buildroot] [PATCH v2 1/2] package/procps-ng: add wchar dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since procps-ng was bumped from 3.3.17 to 4.0.4 in commit
d79f40dbbe98983bc657d4c82d46b38b8283351b ("package/procps-ng: security
bump to version 4.0.4"), the build has been failing on !wchar
configurations with:

src/ps/output.c:68:10: fatal error: wctype.h: No such file or directory
   68 | #include <wctype.h>
      |          ^~~~~~~~~~
compilation terminated.

The problematic code has been added by upstream commit
https://gitlab.com/procps-ng/procps/-/commit/605ea4a8f7460920b6de9e432757bd13f80f0dba,
which landed in upstream release v4.0.0.

To solve this, we simply add a BR2_USE_WCHAR dependency, and update
the comment related to this dependency on the only reverse dependency
of procps-ng.

Fixes:

  http://autobuild.buildroot.net/results/afc035e866bec6f2c14f9d52fa74a9c1897706de/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
v1 -> v2: no changes
---
 package/igt-gpu-tools/Config.in | 2 +-
 package/procps-ng/Config.in     | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
index 809c8e28ac..08fc34e917 100644
--- a/package/igt-gpu-tools/Config.in
+++ b/package/igt-gpu-tools/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_IGT_GPU_TOOLS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_USE_WCHAR # elfutils
+	depends on BR2_USE_WCHAR # elfutils, procps-ng
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 # linux/dma-buf.h
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps-ng
 	select BR2_PACKAGE_CAIRO
diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 7af0e97fb4..2b97096f00 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -1,7 +1,13 @@
+comment "procps-ng needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_PROCPS_NG
 	bool "procps-ng"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
 	help
 	  Standard informational utilities and process-handling tools.
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
