Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B14C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 837D981D7C;
	Thu, 10 Feb 2022 19:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fyPqrv0sg6Z5; Thu, 10 Feb 2022 19:22:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5D4F82437;
	Thu, 10 Feb 2022 19:22:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54CC91BF3BB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43D3D82437
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPZ0Ffga1X3U for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:22:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53DBE81D7C
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:22:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EA93D20004;
 Thu, 10 Feb 2022 19:22:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nIF14-00044r-8n; Thu, 10 Feb 2022 20:22:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:22:02 +0100
Message-Id: <20220210192203.15626-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/rust: drop host-python2 support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-python2 is gone, so always use host-python3.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rust/rust.mk | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 5fad7d404c..46487fe4b7 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -14,18 +14,11 @@ HOST_RUST_PROVIDES = host-rustc
 
 HOST_RUST_DEPENDENCIES = \
 	toolchain \
+	host-python3 \
 	host-rust-bin \
 	host-openssl \
 	$(BR2_CMAKE_HOST_DEPENDENCY)
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-HOST_RUST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
-HOST_RUST_DEPENDENCIES += host-python3
-else
-HOST_RUST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
-HOST_RUST_DEPENDENCIES += host-python
-endif
-
 HOST_RUST_VERBOSITY = $(if $(VERBOSE),2,0)
 
 # Some vendor crates contain Cargo.toml.orig files. The associated
@@ -50,7 +43,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'target = ["$(RUSTC_TARGET_NAME)"]'; \
 		echo 'cargo = "$(HOST_RUST_BIN_DIR)/cargo/bin/cargo"'; \
 		echo 'rustc = "$(HOST_RUST_BIN_DIR)/rustc/bin/rustc"'; \
-		echo 'python = "$(HOST_DIR)/bin/python$(HOST_RUST_PYTHON_VERSION)"'; \
+		echo 'python = "$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)"'; \
 		echo 'submodules = false'; \
 		echo 'vendor = true'; \
 		echo 'extended = true'; \
@@ -71,12 +64,12 @@ define HOST_RUST_CONFIGURE_CMDS
 endef
 
 define HOST_RUST_BUILD_CMDS
-	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(HOST_RUST_PYTHON_VERSION) x.py build
+	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
 endef
 
 define HOST_RUST_INSTALL_CMDS
-	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(HOST_RUST_PYTHON_VERSION) x.py dist
-	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(HOST_RUST_PYTHON_VERSION) x.py install
+	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py dist
+	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py install
 endef
 
 $(eval $(host-generic-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
