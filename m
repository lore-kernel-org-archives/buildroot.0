Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DA4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 20:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C30F1402EB;
	Thu, 10 Feb 2022 20:45:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mVi1ZbHKDGTc; Thu, 10 Feb 2022 20:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C16E44012B;
	Thu, 10 Feb 2022 20:45:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BAF41BF398
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98675408F9
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CpTe6TZaP7Vr for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 20:45:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0458408E9
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 20:45:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 75FE982DF5; Thu, 10 Feb 2022 20:37:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 21:44:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39b025258539b8686eb5615a6df10e2c06b5c228
X-Git-Newrev: 4c8ae13e7ce84d76e7ed06d05322a49b26bd3c7f
X-Patchwork-Hint: ignore
Message-Id: <20220210203748.75FE982DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust: drop host-python2 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4c8ae13e7ce84d76e7ed06d05322a49b26bd3c7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-python2 is gone, so always use host-python3.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
