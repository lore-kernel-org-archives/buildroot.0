Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BC7E81E0B
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 15:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A671C83C5F;
	Fri,  6 Oct 2023 15:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A671C83C5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8pm3jgy9Uxv; Fri,  6 Oct 2023 15:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 573C283C59;
	Fri,  6 Oct 2023 15:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 573C283C59
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04DD11BF32D
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 15:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0C0C42628
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 15:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0C0C42628
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M0qlQQk5wzUq for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB34842E84
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB34842E84
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8F6D842FC; Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Oct 2023 17:31:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cbc2af604e73780c0c6b5c093c55c2f7ee2c4e3
X-Git-Newrev: 0fd6954fcb2b922ff95779420a36e99229e75f92
X-Patchwork-Hint: ignore
Message-Id: <20231006153223.A8F6D842FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs/nodejs-bin: new provider of
 host-nodejs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0fd6954fcb2b922ff95779420a36e99229e75f92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package downloads the pre-built version of nodejs, if the host
platform supports it.

Reuse the variables defined in nodejs.mk.

For the definition of BR2_PACKAGE_PROVIDES_HOST_NODEJS, take care of
defaulting to host-nodejs-bin if host-nodejs is not selected at all.
This makes sure that in the future we will be able to run 'make
foo-source' for a package that uses nodejs vendoring, and it will use
the prebuilt nodejs to perform the vendoring.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout:
 - update to 16.20.0 to match nodejs.mk - including hashes;
 - add HOST_NODEJS_BIN_ACTUAL_SOURCE_TARBALL + hash;
 - move to package/nodejs/nodejs-bin;
 - drop DEVELOPERS change, it's already covered by package/nodejs;
 - re-order the series;
 - immediately add it as a virtual package provider;
 - add prompt and helpt text to choice;
 - select host-nodejs-bin as provider if host-nodejs is not selected at
   all.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/nodejs/Config.in.host             | 46 ++++++++++++++++++++++++++-----
 package/nodejs/nodejs-bin/nodejs-bin.hash |  1 +
 package/nodejs/nodejs-bin/nodejs-bin.mk   | 37 +++++++++++++++++++++++++
 package/nodejs/nodejs.hash                |  8 ++++--
 4 files changed, 83 insertions(+), 9 deletions(-)

diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index 72b498dada..a8ab89176c 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -1,12 +1,18 @@
+config BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
+	bool
+	default y if BR2_HOSTARCH = "aarch64"
+	default y if BR2_HOSTARCH = "arm"
+	default y if BR2_HOSTARCH = "ppc64le"
+	default y if BR2_HOSTARCH = "x86_64"
+
 comment "host nodejs needs a host gcc >= 8"
+	depends on !BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
 	depends on !BR2_HOST_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_HOST_NODEJS
 	bool "host nodejs"
-	depends on BR2_HOST_GCC_AT_LEAST_8
-	select BR2_PACKAGE_HOST_PYTHON3
-	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
-	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	depends on BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS || \
+		BR2_HOST_GCC_AT_LEAST_8
 	help
 	  Event-driven I/O server-side JavaScript environment based on
 	  V8.
@@ -15,6 +21,30 @@ config BR2_PACKAGE_HOST_NODEJS
 
 if BR2_PACKAGE_HOST_NODEJS
 
+choice
+	prompt "host nodejs variant"
+	default BR2_PACKAGE_HOST_NODEJS_BIN if BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
+	default BR2_PACKAGE_HOST_NODEJS_SRC
+	help
+	  Select a nodejs variant - built from source or
+	  pre-built.
+
+config BR2_PACKAGE_HOST_NODEJS_BIN
+	bool "pre-built version"
+	depends on BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
+
+config BR2_PACKAGE_HOST_NODEJS_SRC
+	bool "compile from source"
+	depends on BR2_HOST_GCC_AT_LEAST_8
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+
+comment "host nodejs from source needs a host gcc >= 8"
+	depends on !BR2_HOST_GCC_AT_LEAST_8
+
+endchoice
+
 config BR2_PACKAGE_HOST_NODEJS_COREPACK
 	bool "Corepack"
 	help
@@ -28,8 +58,10 @@ config BR2_PACKAGE_HOST_NODEJS_COREPACK
 	  what currently happens with npm, which is shipped by Node.js
 	  by default.
 
+endif
+
 config BR2_PACKAGE_PROVIDES_HOST_NODEJS
 	string
-	default "host-nodejs-src"
-
-endif
+	default "host-nodejs-src" if BR2_PACKAGE_HOST_NODEJS_SRC
+	# default to host-nodejs-bin so it's used if nothing is set explicitly
+	default "host-nodejs-bin" if !BR2_PACKAGE_HOST_NODEJS_SRC
diff --git a/package/nodejs/nodejs-bin/nodejs-bin.hash b/package/nodejs/nodejs-bin/nodejs-bin.hash
new file mode 120000
index 0000000000..0c3ac2ce77
--- /dev/null
+++ b/package/nodejs/nodejs-bin/nodejs-bin.hash
@@ -0,0 +1 @@
+../nodejs.hash
\ No newline at end of file
diff --git a/package/nodejs/nodejs-bin/nodejs-bin.mk b/package/nodejs/nodejs-bin/nodejs-bin.mk
new file mode 100644
index 0000000000..bf603e573c
--- /dev/null
+++ b/package/nodejs/nodejs-bin/nodejs-bin.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# nodejs-bin
+#
+################################################################################
+
+NODEJS_BIN_VERSION = $(NODEJS_COMMON_VERSION)
+NODEJS_BIN_SITE = $(NODEJS_COMMON_SITE)
+NODEJS_BIN_SOURCE = node-v$(NODEJS_BIN_VERSION)-linux-$(NODEJS_BIN_ARCH).tar.xz
+HOST_NODEJS_BIN_ACTUAL_SOURCE_TARBALL = node-v$(NODEJS_BIN_VERSION).tar.xz
+NODEJS_BIN_DL_SUBDIR = nodejs
+
+NODEJS_BIN_LICENSE = $(NODEJS_LICENSE)
+NODEJS_BIN_LICENSE_FILES = $(NODEJS_LICENSE_FILES)
+NODEJS_BIN_CPE_ID_VENDOR = $(NODEJS_CPE_ID_VENDOR)
+NODEJS_BIN_CPE_ID_PRODUCT = $(NODEJS_CPE_ID_PRODUCT)
+
+HOST_NODEJS_BIN_PROVIDES = host-nodejs
+
+ifeq ($(HOSTARCH),aarch64)
+NODEJS_BIN_ARCH = arm64
+else ifeq ($(HOSTARCH),arm)
+# We assume that if someone does a build on ARM, it will be on an
+# ARMv7 machine
+NODEJS_BIN_ARCH = armv7l
+else ifeq ($(HOSTARCH),ppc64le)
+NODEJS_BIN_ARCH = ppc64le
+else ifeq ($(HOSTARCH),x86_64)
+NODEJS_BIN_ARCH = x64
+endif
+
+define HOST_NODEJS_BIN_INSTALL_CMDS
+	rsync -a --exclude=CHANGELOG.md --exclude=LICENSE --exclude=README.md \
+		$(@D)/* $(HOST_DIR)/
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 6ab4c53e79..eaf41f6437 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,9 @@
-# From https://nodejs.org/dist/v16.20.0/SHASUMS256.txt
+# From https://nodejs.org/dist/v16.20.0/SHASUMS256.txt.asc
+sha256  aca4794ca60f2e17689a700eeaa95d7adcd5fd01cdd2e4f9d596ac41b600b796  node-v16.20.0-linux-arm64.tar.xz
+sha256  5b79addab37bbdc31b442f8e648efad0b5d3aa5f3e0d682f23f4db483408eb2a  node-v16.20.0-linux-armv7l.tar.xz
+sha256  b439a8f874e8c2fad287ba75a3229407551f5ff9eb41e45e43e9bf67f184f618  node-v16.20.0-linux-ppc64le.tar.xz
+sha256  dff21020b555cc165a1ac36da7d4f6c810b35409c94e00afc51d5d370aae47ae  node-v16.20.0-linux-x64.tar.xz
 sha256  e0990f992234e40a51fe11f92c3816c93a77e1b081145d3dd762cd1026345349  node-v16.20.0.tar.xz
 
-# Hash for license file
+# Locally calculated
 sha256  ba325815d3df8819bebaf37cad67d6e1f82271e1e4a1189b53abd28e261977d6  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
