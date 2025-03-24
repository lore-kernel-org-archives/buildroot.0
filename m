Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3A4C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 14:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA7F98203A;
	Mon, 24 Mar 2025 14:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CV0AGdfZEfR7; Mon, 24 Mar 2025 14:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1641B81FED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1641B81FED;
	Mon, 24 Mar 2025 14:12:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 292E5C0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 14:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AF4782037
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 14:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kA9MfZkCZnAH for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 14:12:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C62C881947
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C62C881947
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C62C881947
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 14:12:54 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 0A1923FA14;
 Mon, 24 Mar 2025 15:12:48 +0100 (CET)
Received: from UDERZO.insia.net (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id 5E3375F499;
 Mon, 24 Mar 2025 15:14:09 +0100 (CET)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Mon, 24 Mar 2025 10:12:23 -0400
Message-Id: <20250324141223.9427-2-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324141223.9427-1-guillaume.chaye@zeetim.com>
References: <20250324141223.9427-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1742825568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jxM2ZAkVtVSYjg4gKyl4gZ7H2qcp17gV3GedZK3mp4=;
 b=scRr1A5YSCqfEtjPbPW4b/GBVlHW2fTyjwfCWEy7ltgU2dsVwWfTKmcabUqFpsqVfKi0SV
 NBPdb3cQg4Kj1fc5W4CBu33TqLQHiDXuhnB7riZ6W+KXdNiVAtv48vCffQVU7GHUNH7qtG
 4hfNbbG/tF0/+mf9L9EjtniDLMaOliX8nlnLHI3a+eV5MEJX85A+Z86KYH33xfGTdvB9H1
 lYx2tDqLPSOvUHe6XuBtQKRXywlgrXML2oYSiA9WfT8K+gKsM2ZfWfOIA/qKlC16Kn/Pej
 5ufG0sL4XCesKIuojKJYawThK1063w7Kp6itx83bHvgFjNNKx+ZGJHD++KRK9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=scRr1A5Y
Subject: [Buildroot] [PATCH 2/2] package/cargo-c: cargo-c is a cargo applet
 to build and install C-ABI compatible dynamic and static libraries.
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

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
---
 DEVELOPERS                     |  3 +++
 package/cargo-c/add-cargo-lock |  9 +++++++++
 package/cargo-c/cargo-c.hash   |  3 +++
 package/cargo-c/cargo-c.mk     | 22 ++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100755 package/cargo-c/add-cargo-lock
 create mode 100644 package/cargo-c/cargo-c.hash
 create mode 100644 package/cargo-c/cargo-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ff069b9c40..1750ee415d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1331,6 +1331,9 @@ F:	package/python-rpi-ws281x/
 F:	package/python-wtforms/
 F:	package/rpi-rgb-led-matrix/
 
+N:	Guillaume Chaye	<guillaume.chaye@zeetim.com>
+F:	package/cargo-c/
+
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
 F:	package/libxcrypt/
diff --git a/package/cargo-c/add-cargo-lock b/package/cargo-c/add-cargo-lock
new file mode 100755
index 0000000000..7b4c96b3bd
--- /dev/null
+++ b/package/cargo-c/add-cargo-lock
@@ -0,0 +1,9 @@
+#!/usr/bin/env bash
+
+if [ -f "${CARGO_C_LOCKFILE}" ]; then
+    echo "Adding Cargo.lock inside package..."
+	cp "${CARGO_C_LOCKFILE}" .
+else
+	echo "Error: Cargo.lock file not found!"
+	exit 1
+fi
diff --git a/package/cargo-c/cargo-c.hash b/package/cargo-c/cargo-c.hash
new file mode 100644
index 0000000000..21e0654608
--- /dev/null
+++ b/package/cargo-c/cargo-c.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  387e25aa120f945c5455557ca7815b8085090b825d2d4fd0b46cc9fdce0c34bc  Cargo.lock
+sha256  99d27284f1c1a832d41c8e3fcea7dc29020d5458e3864c9c7cab18847e4c4899  vv0.10.9.tar.gz
diff --git a/package/cargo-c/cargo-c.mk b/package/cargo-c/cargo-c.mk
new file mode 100644
index 0000000000..00ce805d35
--- /dev/null
+++ b/package/cargo-c/cargo-c.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# cargo-c
+#
+################################################################################
+
+CARGO_C_VERSION = v0.10.9
+CARGO_C_CARGO_LOCK_URL = https://github.com/lu-zero/cargo-c/releases/download/$(CARGO_C_VERSION)/Cargo.lock
+CARGO_C_SITE= $(call github,lu-zero,cargo-c,$(CARGO_C_VERSION))
+CARGO_C_SOURCE=v$(CARGO_C_VERSION).tar.gz
+HOST_CARGO_C_DEPENDENCIES+= host-libopenssl host-tar
+
+define HOST_CARGO_C_DOWNLOAD_CARGO_LOCK
+	@$(call MESSAGE, "Downloading Cargo.lock")
+	$(call DOWNLOAD, $(CARGO_C_CARGO_LOCK_URL))
+endef
+
+HOST_CARGO_C_PRE_DOWNLOAD_HOOKS+= HOST_CARGO_C_DOWNLOAD_CARGO_LOCK
+HOST_CARGO_C_DL_ENV+= CARGO_C_LOCKFILE=$(HOST_CARGO_C_DL_DIR)/Cargo.lock
+HOST_CARGO_C_DOWNLOAD_POST_PROCESS_OPTS+= -v$(HOST_CARGO_C_PKGDIR)/add-cargo-lock
+
+$(eval $(host-cargo-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
