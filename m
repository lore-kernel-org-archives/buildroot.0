Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3402C36008
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 17:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8400340B7D;
	Mon, 24 Mar 2025 17:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZrfIiGBf5A7; Mon, 24 Mar 2025 17:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99595408F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99595408F3;
	Mon, 24 Mar 2025 17:33:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9F80E0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBDCA6083C
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-auI1-K-qc2 for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 17:33:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E206E60759
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E206E60759
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp3.osuosl.org (Postfix) with ESMTP id E206E60759
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:33:11 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id 099001FCFB;
 Mon, 24 Mar 2025 18:33:06 +0100 (CET)
Received: from UDERZO.insia.net (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id 839C25F497;
 Mon, 24 Mar 2025 18:34:27 +0100 (CET)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Mon, 24 Mar 2025 13:32:46 -0400
Message-Id: <20250324173246.100112-2-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324173246.100112-1-guillaume.chaye@zeetim.com>
References: <20250324173246.100112-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1742837586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AfmzoyJ89pPWleir9nlya9YZxGNbMZaM1tS5YD2PeTo=;
 b=Yt193s7iH+r74bVBOAjxaeQ2GDr73XpCB4Z6ztZ8ZhEJaZ3BPZI2JkWhQhLH90G4fN0RpQ
 U1dFePVD8B13GnUdI8LG6WMbnV/Rxe+oa2xpTixYWGYokg8Yqt1iglsKFWS/fIRc8gCjEv
 h7VEeJ0PoqJVNzI0QgNUZAP9zljbAyMG1cVEPN/fhDFnyhTX48jvVmK99UwZ7iIyg+MtJh
 MB/TVqRRtodSOT6V8rKpdSTtwG/z+fixXke3pHiXMcSx1IReEGzig+um+lrRwq025Exv5j
 REey2VIaRK6M0b9GIs1qGDWeCwuk10ZJkTZsmX9XipPnbXKNuppWWusCJOj6Ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=Yt193s7i
Subject: [Buildroot] [PATCHv2 2/2] package/cargo-c: cargo-c is a cargo
 applet to build and install C-ABI compatible dynamic and static libraries.
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

I cannot update cargo-c neither to v0.10.10 nor v0.10.11 because of rustc 1.83 requirement.

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
index c080608bcf..05662a9201 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1354,6 +1354,9 @@ F:	package/python-rpi-ws281x/
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
index 0000000000..473d13cdcd
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
index 0000000000..ab357ce61a
--- /dev/null
+++ b/package/cargo-c/cargo-c.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  387e25aa120f945c5455557ca7815b8085090b825d2d4fd0b46cc9fdce0c34bc  Cargo.lock
+sha256  99d27284f1c1a832d41c8e3fcea7dc29020d5458e3864c9c7cab18847e4c4899  v0.10.9.tar.gz
diff --git a/package/cargo-c/cargo-c.mk b/package/cargo-c/cargo-c.mk
new file mode 100644
index 0000000000..dedb3d8d09
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
+CARGO_C_SOURCE=$(CARGO_C_VERSION).tar.gz
+HOST_CARGO_C_DEPENDENCIES+= host-libopenssl host-pkgconf host-tar
+
+define HOST_CARGO_C_DOWNLOAD_CARGO_LOCK
+	@$(call MESSAGE, "Downloading Cargo.lock")
+	$(call DOWNLOAD, $(CARGO_C_CARGO_LOCK_URL))
+endef
+
+HOST_CARGO_C_PRE_DOWNLOAD_HOOKS+= HOST_CARGO_C_DOWNLOAD_CARGO_LOCK
+HOST_CARGO_C_DL_ENV+= CARGO_C_LOCKFILE=$(HOST_CARGO_C_DL_DIR)/Cargo.lock
+HOST_CARGO_C_DOWNLOAD_POST_PROCESS_OPTS+= -v $(abspath $(HOST_CARGO_C_PKGDIR)/add-cargo-lock)
+
+$(eval $(host-cargo-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
