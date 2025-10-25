Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A97CCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 13:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8532E404C1;
	Sat, 25 Oct 2025 13:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_IrlbE4tjzC; Sat, 25 Oct 2025 13:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CC49404BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CC49404BA;
	Sat, 25 Oct 2025 13:49:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7C9AD7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D738404C1
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kC6xY53QzhW7 for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 13:49:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 114A8404BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 114A8404BA
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 114A8404BA
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:49:12 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id A6A2DE003AE;
 Sat, 25 Oct 2025 15:49:09 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
	Florian Larysch <fl@n621.de>
Date: Sat, 25 Oct 2025 15:48:55 +0200
Message-ID: <20251025134904.1222-1-fl@n621.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1761400149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xYCDlVhHgBvLQrCorqqTn8CsFrdeIip5pf0xemMzgnY=;
 b=c8Z6dj6DO2wzrk9e+LeEpRu3LvwYKz2VPUpeI1HP6cyeKEY/G7RtzNmsV2b196tFjKI8wq
 1hNSqmwKdWpCNMF31CBdug3TrRZ2v2qCevtnVqYh1l1XC8cTIHN9yaftWg2TKgDCAvGYUc
 uoGrP6cK6W5Q6yxil2ZYeT3amjo2vCk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=c8Z6dj6D
Subject: [Buildroot] [PATCH 1/1] package/sigsum-go: new package
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

I'm getting check-pkg build failures for bootlin-riscv64-glibc and
bootlin-riscv64-musl with this. However, this is exactly what is
happening in multiple other places [1][2][3], so I don't think it's a
specific problem with this package. Alas, I'm completely unfamiliar with
how the Go toolchain works so I haven't been able to root-cause this
yet.

[1] https://autobuild.buildroot.org/results/29f/29fb1fe14cad264aac62919fc50394679aac1ad1/build-end.log
[2] https://autobuild.buildroot.org/results/b61/b610288293df6e684d77926c2fc15e48216165fd/build-end.log
[3] https://autobuild.buildroot.org/results/dfa/dfa6f3aa5c4345ab17c3bf9f3b1e87868690d51e/build-end.log

 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/Config.in.host           |  1 +
 package/sigsum-go/Config.in      | 25 +++++++++++++++++++++++
 package/sigsum-go/Config.in.host |  8 ++++++++
 package/sigsum-go/sigsum-go.hash |  3 +++
 package/sigsum-go/sigsum-go.mk   | 35 ++++++++++++++++++++++++++++++++
 7 files changed, 74 insertions(+)
 create mode 100644 package/sigsum-go/Config.in
 create mode 100644 package/sigsum-go/Config.in.host
 create mode 100644 package/sigsum-go/sigsum-go.hash
 create mode 100644 package/sigsum-go/sigsum-go.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 66199a5b72..887ce50508 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1135,6 +1135,7 @@ F:	package/cpulimit/
 
 N:	Florian Larysch <fl@n621.de>
 F:	package/casync-nano/
+F:	package/sigsum-go/
 
 N:	Floris Bos <bos@je-eigen-domein.nl>
 F:	package/ipmitool/
diff --git a/package/Config.in b/package/Config.in
index 161d61728b..6c6c0bba20 100644
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
index b0f7529a13..9d811ffea6 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -110,6 +110,7 @@ menu "Host utilities"
 	source "package/sdbus-cpp/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
 	source "package/sentry-cli/Config.in.host"
+	source "package/sigsum-go/Config.in.host"
 	source "package/skopeo/Config.in.host"
 	source "package/sloci-image/Config.in.host"
 	source "package/squashfs/Config.in.host"
diff --git a/package/sigsum-go/Config.in b/package/sigsum-go/Config.in
new file mode 100644
index 0000000000..4fb4223be1
--- /dev/null
+++ b/package/sigsum-go/Config.in
@@ -0,0 +1,25 @@
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
index 0000000000..a85ee5b8bb
--- /dev/null
+++ b/package/sigsum-go/sigsum-go.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f7ebdf6d28c851dab3a7321156b67f4e853c845f6cb6ea7d93ccf68bb734fe8f  sigsum-go-v0.11.2-git4-go2.tar.gz
+sha256  6a1e3378dcd18baade08ac30ec4ba33b72d1b1697c00226ef85b9c9cefdb4e65  LICENSE
diff --git a/package/sigsum-go/sigsum-go.mk b/package/sigsum-go/sigsum-go.mk
new file mode 100644
index 0000000000..7442aa67a6
--- /dev/null
+++ b/package/sigsum-go/sigsum-go.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# sigsum-go
+#
+################################################################################
+
+SIGSUM_GO_VERSION = v0.11.2
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
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
