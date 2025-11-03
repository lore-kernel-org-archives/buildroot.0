Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50E6CCF9F8
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 15:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6232C60034;
	Mon,  3 Nov 2025 15:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPz5hkLQaKKe; Mon,  3 Nov 2025 15:01:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A9BA60067
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A9BA60067;
	Mon,  3 Nov 2025 15:01:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CADB278
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 15:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4893840063
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 15:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpUol2HSmdgz for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 15:01:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6880B40064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6880B40064
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6880B40064
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 15:01:51 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id B53F6E001E5;
 Mon,  3 Nov 2025 16:01:42 +0100 (CET)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
	Florian Larysch <fl@n621.de>
Date: Mon,  3 Nov 2025 16:01:26 +0100
Message-ID: <20251103150141.11286-1-fl@n621.de>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1762182102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Si9r7i4EzJRTUgvOIW74DhkY0dX08f1E+q5W8iFlJYQ=;
 b=oAoL0pQlnmbVH4QqfwSEeYm8iynzNhL2I6TVPEULXqEXhZiRn98qjHkjUbLBCDtq95bm9m
 sCq7ZXbFK4OOkQcD2/YjxvYXmek8+RVk0/4oKm/3rWJ53b0CD2vSCt6uk9719g+P7q2aRo
 T5Swd4Uhjf1eBFokhlr2vcGmrjXytpg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=oAoL0pQl
Subject: [Buildroot] [PATCH v2 1/1] package/sigsum-go: new package
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
 - Update to newly released v0.12.0 (see [1])

[1] https://git.glasklar.is/sigsum/core/sigsum-go/-/blob/v0.12.0/NEWS
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
index 7c2967f41d..0e5c13d53d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1136,6 +1136,7 @@ F:	package/cpulimit/
 
 N:	Florian Larysch <fl@n621.de>
 F:	package/casync-nano/
+F:	package/sigsum-go/
 
 N:	Floris Bos <bos@je-eigen-domein.nl>
 F:	package/ipmitool/
diff --git a/package/Config.in b/package/Config.in
index 47d56f813a..27d37a7a64 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2802,6 +2802,7 @@ comment "Utilities"
 	source "package/screen/Config.in"
 	source "package/screenfetch/Config.in"
 	source "package/sexpect/Config.in"
+	source "package/sigsum-go/Config.in"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
 	source "package/time/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index d0088364d0..606a825d44 100644
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
index 0000000000..7da228a7d3
--- /dev/null
+++ b/package/sigsum-go/sigsum-go.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  89d19dcf6f125681c0d65e93b0d926875458a51a9f07f41f34774cb5bf70ef6e  sigsum-go-v0.12.0-git4-go2.tar.gz
+sha256  6a1e3378dcd18baade08ac30ec4ba33b72d1b1697c00226ef85b9c9cefdb4e65  LICENSE
diff --git a/package/sigsum-go/sigsum-go.mk b/package/sigsum-go/sigsum-go.mk
new file mode 100644
index 0000000000..16b19964b6
--- /dev/null
+++ b/package/sigsum-go/sigsum-go.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# sigsum-go
+#
+################################################################################
+
+SIGSUM_GO_VERSION = v0.12.0
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
