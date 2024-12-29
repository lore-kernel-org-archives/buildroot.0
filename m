Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F3AE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 13:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B76A4064E;
	Sun, 29 Dec 2024 13:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d05U9jAJl8dT; Sun, 29 Dec 2024 13:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D54304064F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D54304064F;
	Sun, 29 Dec 2024 13:17:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02688CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 13:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4E8E80FA2
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 13:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYeUgoQZoac6 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 13:17:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92DD980F9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92DD980F9F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92DD980F9F
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 13:17:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E6A0EFF802;
 Sun, 29 Dec 2024 13:17:12 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 29 Dec 2024 14:17:09 +0100
Message-ID: <20241229131711.707899-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735478233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4H6Jd0cxLplFP0WJaIz9OGcN08JWDK3Sy8riV/jwzUU=;
 b=MDo0X5KhtU8zIAFXB5ZShbKH4dLNBH3oo+DD47R3KEcsRQSXw9OAg2LHTP6c/KmiGljVsq
 9S0cKgh8sA+4NoktfF5pVomPAyyjcA42ljyZQ2wnqJuVAzjclOfcr17DlKvf/suC32gLM3
 EEFAcwTCO88jKd5r2VWJqIMh3w5bQAEXVp2SD2yXpZ9exqnGsBBp1uNXXSaZHAyT7cLu8Z
 VOMaXWgB9kYBlhZTp/kxBwT0j67ZncZ7Ze+x3GKgAfA9qdHC14crT/gkQrzG29nFes1uPW
 pU0U5t/dCNOoc5uWgNlTaZG73DJWbOICNJBiaxdyzMeQZuCwOfcJ9To9Vc/OpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MDo0X5Kh
Subject: [Buildroot] [PATCH 1/2] package/procps-ng: add wchar dependency
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
