Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AE8C021A1
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 10:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E13EA8407A;
	Wed, 12 Feb 2025 10:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCo9Oc6EwSDS; Wed, 12 Feb 2025 10:54:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5556183F72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5556183F72;
	Wed, 12 Feb 2025 10:54:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF8D2C2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 10:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93F7461027
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 10:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMZMpF2VSKH9 for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 10:54:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 956C761026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 956C761026
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 956C761026
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 10:54:15 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 857713FA3D;
 Wed, 12 Feb 2025 11:54:08 +0100 (CET)
Received: from UDERZO.MYINSIA.INT (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id CDD0B5F497;
 Wed, 12 Feb 2025 11:54:40 +0100 (CET)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Wed, 12 Feb 2025 05:53:42 -0500
Message-Id: <20250212105342.591220-2-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250212105342.591220-1-guillaume.chaye@zeetim.com>
References: <20250212105342.591220-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1739357648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jxM2ZAkVtVSYjg4gKyl4gZ7H2qcp17gV3GedZK3mp4=;
 b=iHNDA3gmTJtll5TZ9Q68miwr9xnKLBo2W5LOm/IPRbwp+uIHquTPkirXJ/MnG/inTpdA5a
 i1iUORzEFcCFcMVLHDHQ1f7hiYaLgU76rnXO3uBNO8AxlFDj4U8y9WeyreBrawiZJloO6o
 iDGb9WHoluSQ6JXi7JIw3/TyUhRzzWBvZ67BM3PAWMgSuagjKXW4A/WcpVkXV4UMEyI3N8
 +Wm1YfkG8vJIKyQx7/AXW5f4213+iabdJ3nL7LvFi/rojjnkL5VEVouo+zAuEcSfFdj8xD
 BearNgu3JRbFyQxn3JTpNIqvbyUbahetSUAQNA9IZJHy4v09us/EN6xdcPFblw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=iHNDA3gm
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
Cc: Guillaume Chaye <guillaume.chaye@zeetim.com>
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
