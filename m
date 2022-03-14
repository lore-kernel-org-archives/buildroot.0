Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E86C3527A
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 12:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 979A9405F4;
	Mon, 14 Mar 2022 12:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWbBzfXDrHPi; Mon, 14 Mar 2022 12:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 477BD4060C;
	Mon, 14 Mar 2022 12:22:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A49211BF3A9
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18D5483EDD
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXLOEDShfNvD for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 12:20:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0C1183E83
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 12:20:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0D83583E3D; Mon, 14 Mar 2022 12:11:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 13:17:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0d1f211950fe7cdf1bbb52397cdb86519d4a404
X-Git-Newrev: 15682493918ead960d326bf24763e9b5d8d331d9
X-Patchwork-Hint: ignore
Message-Id: <20220314121153.0D83583E3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust: install rustc and rust-std
 built by Buildroot
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

commit: https://git.buildroot.net/buildroot/commit/?id=15682493918ead960d326bf24763e9b5d8d331d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test TestRust is currently broken with ripgrep package with
the following error:

error[E0514]: found crate `core` compiled by an incompatible version of rustc
  |
  = help: please recompile that crate using this compiler (rustc 1.58.1) (consider running `cargo clean` first)
  = note: the following crate versions were found:
          crate `core` compiled by rustc 1.58.1 (db9d1b20b 2022-01-20): TestRust/host/lib/rustlib/x86_64-unknown-linux-gnu/lib/libcore-6cfcec236d576603.rlib

error[E0514]: found crate `std` compiled by an incompatible version of rustc

The problem is not really a cross-compilation issue (we are building
for an armv7 target on x86_64 host) but a problem with rust-std libraries
(rlib).

We can notice that "rustc 1.58.1 (db9d1b20b 2022-01-20)" is the same
version as the prebuilt rustc used to bootstrap the build:

TestRust/host/bin/rustc --version
rustc 1.58.1

TestRustBin/host/bin/rustc --version
rustc 1.58.1 (db9d1b20b 2022-01-20)

Indeed we are using host-rust-bin to bootstrap the host-rust compiler
package built by Buildroot. The problem is that the
libcore-6cfcec236d576603.rlib file come from host-rust-bin (rust-std)
and is not removed before installing host-rust built by Buildroot.

We actually spent a lot of time to build host-rust with rust-std
and forget to install this important library HOST_DIR.

Looking at the host-rust build directory we can notice two installer
script "install.sh" (the same scripts used to install host-rust-bin):

TestRust/build/host-rust-1.58.1/build/tmp/tarball/rust/x86_64-unknown-linux-gnu/rust-1.58.1-x86_64-unknown-linux-gnu/install.sh
TestRust/build/host-rust-1.58.1/build/tmp/tarball/rust-std/armv7-unknown-linux-gnueabihf/rust-std-1.58.1-armv7-unknown-linux-gnueabihf/install.sh

The "tarball" directory is generated by the "python x.py dist" during
the install step, we have to keep it.

Replace "python x.py install" by theses two install scripts.
Installing rust-std with the install.sh script replace the rust-std
libraries installed by host-rust-bin.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202544

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
[Arnout: remove redundant parenthesis; only use a variable for the
common install opts]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rust/rust.mk | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 46487fe4b7..3c560882ca 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -67,9 +67,26 @@ define HOST_RUST_BUILD_CMDS
 	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
 endef
 
+HOST_RUST_INSTALL_OPTS = \
+	--prefix=$(HOST_DIR) \
+	--disable-ldconfig
+
+define HOST_RUST_INSTALL_RUSTC
+	cd $(@D)/build/tmp/tarball/rust/$(RUSTC_HOST_NAME)/rust-$(RUST_VERSION)-$(RUSTC_HOST_NAME); \
+		./install.sh $(HOST_RUST_INSTALL_OPTS) --components=rustc,cargo,rust-std-$(RUSTC_HOST_NAME)
+endef
+
+ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
+define HOST_RUST_INSTALL_LIBSTD_TARGET
+	cd $(@D)/build/tmp/tarball/rust-std/$(RUSTC_TARGET_NAME)/rust-std-$(RUST_VERSION)-$(RUSTC_TARGET_NAME); \
+		./install.sh $(HOST_RUST_INSTALL_OPTS)
+endef
+endif
+
 define HOST_RUST_INSTALL_CMDS
 	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py dist
-	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py install
+	$(HOST_RUST_INSTALL_RUSTC)
+	$(HOST_RUST_INSTALL_LIBSTD_TARGET)
 endef
 
 $(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
