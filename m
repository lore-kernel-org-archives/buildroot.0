Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0A7D3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 20:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89DCA81DF0;
	Mon,  8 Dec 2025 20:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjQYKVKoUQec; Mon,  8 Dec 2025 20:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8215881DFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765224708;
	bh=v2hmXLFl8tj4S6S3Yg6c4Y5gDcLCtI6qPaBHE3LVIx8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aPlrCQKe+k6X+lyA8ZHOo3qGPpls241eN02W7jwXf7zBd8gaMINoOArX7+opmFARw
	 YlEZYuJVBSe6onniuo4ukR8XAsArru90RvPsRfmdVikPn/Qk7oqWzOvDg8oWACJIBg
	 akX56OX/KbaSyZE5wkqTndxiJPh83vGKcFvEPJ7bDxiFUCjBKk8uo/cnxBK1Z/mIBW
	 wsbqTL0zNQVoCGYZaaLZqS7A7fVvTn7TmnxUWEsYO2hSR1IDKaj5mqLGZP77sQPX6I
	 8JInBypVfvG1JxQ3n+GG/JVtSReKwnK5tSgmBtQiptibh3sEA4Ak6biXNVJnTco5wB
	 jxEdZOb0MtymQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8215881DFE;
	Mon,  8 Dec 2025 20:11:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CF13E7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8300161085
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zS4-GFQpEKL4 for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 20:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DDC360D59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DDC360D59
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DDC360D59
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:11:46 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 0B4A6E0008A;
 Mon,  8 Dec 2025 21:11:43 +0100 (CET)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
	Florian Larysch <fl@n621.de>
Date: Mon,  8 Dec 2025 21:11:21 +0100
Message-ID: <20251208201137.13839-1-fl@n621.de>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1765224703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WCkMlwE9voC0ChevBU5afoRxqZVr/znvM+U2YquaEqs=;
 b=togtMaVnpELiU3JwST3ceB5B/bQKQ9VT6uscYzYUTPo2ZXy+HDwU4Em+HKPhs1yi3It6Rr
 Ad1KZegDZgYm0TK9HJEipLO/qwK6XAf45GhMpo3HFb1f8XKAHiYW6GNs/QsH+Zq6WtiWKr
 UJ+OvMO8TlQNeOcm3RQxoxiouK8xoEA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=togtMaVn
Subject: [Buildroot] [PATCH v3 1/1] package/sigsum-go: new package
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

Add the reference command line tools for interacting with Sigsum
signature transparency logs.

Signed-off-by: Florian Larysch <fl@n621.de>
---
v2:
 - Update to newly released v0.12.0

v3:
 - Update to newly released v0.13.1 (see [1])

[1] https://git.glasklar.is/sigsum/core/sigsum-go/-/blob/v0.13.1/NEWS
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/Config.in.host           |  1 +
 package/sigsum-go/Config.in      | 28 +++++++++++++++++++++++
 package/sigsum-go/Config.in.host |  8 +++++++
 package/sigsum-go/sigsum-go.hash |  3 +++
 package/sigsum-go/sigsum-go.mk   | 39 ++++++++++++++++++++++++++++++++
 7 files changed, 81 insertions(+)
 create mode 100644 package/sigsum-go/Config.in
 create mode 100644 package/sigsum-go/Config.in.host
 create mode 100644 package/sigsum-go/sigsum-go.hash
 create mode 100644 package/sigsum-go/sigsum-go.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5c9eb94f56..74dac44f05 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1132,6 +1132,7 @@ F:	package/cpulimit/
 
 N:	Florian Larysch <fl@n621.de>
 F:	package/casync-nano/
+F:	package/sigsum-go/
 
 N:	Floris Bos <bos@je-eigen-domein.nl>
 F:	package/ipmitool/
diff --git a/package/Config.in b/package/Config.in
index 83414b3e0b..96fad54843 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2790,6 +2790,7 @@ comment "Utilities"
 	source "package/screen/Config.in"
 	source "package/screenfetch/Config.in"
 	source "package/sexpect/Config.in"
+	source "package/sigsum-go/Config.in"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index f76d0ce36a..6357eec265 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -110,6 +110,7 @@ menu "Host utilities"
 	source "package/sdbus-cpp/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
 	source "package/sentry-cli/Config.in.host"
+	source "package/sigsum-go/Config.in.host"
 	source "package/skopeo/Config.in.host"
 	source "package/sloci-image/Config.in.host"
 	source "package/snagboot/Config.in.host"
diff --git a/package/sigsum-go/Config.in b/package/sigsum-go/Config.in
new file mode 100644
index 0000000000..f96f18b30a
--- /dev/null
+++ b/package/sigsum-go/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_SIGSUM_GO
+	bool "sigsum-go"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  Command-line utilities for interacting with Sigsum logs.
+
+	  https://git.glasklar.is/sigsum/core/sigsum-go/
+
+if BR2_PACKAGE_SIGSUM_GO
+
+config BR2_PACKAGE_SIGSUM_GO_KEY
+	bool "sigsum-key"
+
+config BR2_PACKAGE_SIGSUM_GO_POLICY
+	bool "sigsum-policy"
+
+config BR2_PACKAGE_SIGSUM_GO_SUBMIT
+	bool "sigsum-submit"
+
+config BR2_PACKAGE_SIGSUM_GO_TOKEN
+	bool "sigsum-token"
+
+config BR2_PACKAGE_SIGSUM_GO_VERIFY
+	bool "sigsum-verify"
+	default y
+
+endif
diff --git a/package/sigsum-go/Config.in.host b/package/sigsum-go/Config.in.host
new file mode 100644
index 0000000000..5bc876603f
--- /dev/null
+++ b/package/sigsum-go/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_SIGSUM_GO
+	bool "host sigsum-go"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  Command-line utilities for interacting with Sigsum logs.
+
+	  https://git.glasklar.is/sigsum/core/sigsum-go/
diff --git a/package/sigsum-go/sigsum-go.hash b/package/sigsum-go/sigsum-go.hash
new file mode 100644
index 0000000000..b032e1839d
--- /dev/null
+++ b/package/sigsum-go/sigsum-go.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  9056406413868fe68a3fcc6415dff5a0045b35baa2242a17fea7a697b1c68e3d  sigsum-go-v0.13.1-git4-go2.tar.gz
+sha256  6a1e3378dcd18baade08ac30ec4ba33b72d1b1697c00226ef85b9c9cefdb4e65  LICENSE
diff --git a/package/sigsum-go/sigsum-go.mk b/package/sigsum-go/sigsum-go.mk
new file mode 100644
index 0000000000..23e3d62696
--- /dev/null
+++ b/package/sigsum-go/sigsum-go.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# sigsum-go
+#
+################################################################################
+
+SIGSUM_GO_VERSION = v0.13.1
+SIGSUM_GO_SITE = https://git.glasklar.is/sigsum/core/sigsum-go
+SIGSUM_GO_SITE_METHOD = git
+SIGSUM_GO_LICENSE = BSD-2-Clause
+SIGSUM_GO_LICENSE_FILES = LICENSE
+
+SIGSUM_GO_GOMOD = sigsum.org/sigsum-go
+
+ifeq ($(BR2_PACKAGE_SIGSUM_GO_KEY),y)
+SIGSUM_GO_BUILD_TARGETS += cmd/sigsum-key
+endif
+
+ifeq ($(BR2_PACKAGE_SIGSUM_GO_POLICY),y)
+SIGSUM_GO_BUILD_TARGETS += cmd/sigsum-policy
+endif
+
+ifeq ($(BR2_PACKAGE_SIGSUM_GO_SUBMIT),y)
+SIGSUM_GO_BUILD_TARGETS += cmd/sigsum-submit
+endif
+
+ifeq ($(BR2_PACKAGE_SIGSUM_GO_TOKEN),y)
+SIGSUM_GO_BUILD_TARGETS += cmd/sigsum-token
+endif
+
+ifeq ($(BR2_PACKAGE_SIGSUM_GO_VERIFY),y)
+SIGSUM_GO_BUILD_TARGETS += cmd/sigsum-verify
+endif
+
+HOST_SIGSUM_GO_GOMOD = sigsum.org/sigsum-go
+HOST_SIGSUM_GO_BUILD_TARGETS = cmd/sigsum-key cmd/sigsum-token cmd/sigsum-submit cmd/sigsum-verify
+
+$(eval $(golang-package))
+$(eval $(host-golang-package))
-- 
2.51.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
