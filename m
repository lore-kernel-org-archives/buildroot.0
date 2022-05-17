Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD1DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 17:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 629FC83FB1;
	Tue, 17 May 2022 17:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZPcwRBcS00F; Tue, 17 May 2022 17:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FA4483FB0;
	Tue, 17 May 2022 17:23:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 770C21BF5E0
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 17:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7346E40CCF
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 17:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=iki.fi
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHQ6TY1ZOR1X for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 17:23:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3126A40C14
 for <buildroot@buildroot.org>; Tue, 17 May 2022 17:23:02 +0000 (UTC)
Received: from localhost (91-154-92-55.elisa-laajakaista.fi [91.154.92.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: sakkinen)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id E2B9D1B00240;
 Tue, 17 May 2022 20:22:58 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1652808179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z1k06CLUU4QlgcBMAFO3dHNdOBiEc5rc+MFtB0SnhO8=;
 b=K6F8IuPsxDB/d5dsr+cIVEG7TMcC3jwI9AAlOgK0+L/aBqqrAx5Sx/+cqdalze+bqteVxz
 1aYlpvf9aGkAqJBkcgz6IVFSFEEvwiC7VGl+SSOLRglZx07HaarjNKPJUWK2OF6OgK5ThJ
 9DjpcpO0zbxC1bq1aos0GvNpGyRI9JRaQewjgd3gX2C7KOHkQCmSAnIdxvqizzr1+V5zuM
 HeV7ukPtKJF/ExFCsyUiUBpjurrKJXTCScTemZOmp7NuVe+3GD3oUytloZDDYcIFW0tR1e
 M7Z56+zCG+u++M9M3oUAjp2XGtTifmkffllVt++SrBe2WessOuru+c/AIcf1wA==
From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 20:21:10 +0300
Message-Id: <20220517172110.22265-1-jarkko.sakkinen@iki.fi>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1652808178; a=rsa-sha256; cv=none;
 b=hPvJ/ZIXavw9NhKU3owf2OVGxzt9WeIms1g0HuunF/Rfioid1bv20k0MP20jMnJh99qKgS
 Ozah9uQDfNaTT8PyxQTvoe4/5fdZ8VfxpcgmfkHsKGwp9sdgR4eAf+3wpw9ctFAaU+DOKG
 8QNrNur6/KTDZlKe7mTGPyp4ALXkssHMkrlXFwrrLCC0DohTva3o8WClVEbdfM90GxjbgI
 8eG57e8gyR63wSIMwY/+IiT0LLCeHRsIDRX/O/3J9e3QFl9xoze9rLoCHoAqwNYVTgUsN2
 w7PTjRQsBCx9sSNRj85nR/aQMsmKND5sCc5dDYnz53o3bk+ObslPJ5fcXy+iSA==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1652808178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z1k06CLUU4QlgcBMAFO3dHNdOBiEc5rc+MFtB0SnhO8=;
 b=E1FZb6jXyrXdaptV8VJNvfWWDsEt4NwHC7smkjZ7OWDTC9ubfiPvcEVIkwY77eYbCCcfzP
 H068ECixnuR8Kk3vfnTERv8OmKuoGEaqyDGLZ7kv4RqM/7okRJQrZ8QoPGiwSy6dUkHHOc
 P7nKZmgAumLxK34MW4Vkrk7bDsTjxGuUgrB1SvMvJ/ucZWdWFMcyDRNxO3mgoHDy4CwM8/
 +4C7r8oQmd8IW/psLVh4ga34AcqDHTNewt2b8YUJvGTfcYInnNjroxvHtbDiSRBUfa9t41
 2pUXWWgLNW3rFVaAy16n9dNfAYCiLccToxsx9l07sO7zcEElAKd55ynYanDjUg==
Subject: [Buildroot] [PATCH RFC] package/enarx: add
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
Cc: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
---
Hi,

This is not a patch that I intend to include BuildRoot yet but to
show changes I needed to make to get nightly Rust working, many of
which are quite unorthodox.

I'd like to get ideas based on those how to properly make BuildRoot
to support nightly Rust in addition to the stable version. I can look
into that myself, as long as I get some feedback/tips on how to do
things better.

BR, Jarkko

 package/Config.in                             |   1 +
 package/enarx/Config.in                       |   9 ++
 package/enarx/enarx.mk                        |  16 +++
 package/enarx/remove-incompatible-flags.patch |  36 +++++
 package/pkg-cargo.mk                          |  10 +-
 package/rust-bin/rust-bin.hash                | 129 ------------------
 package/rust-bin/rust-bin.mk                  |   2 +-
 package/rust/rust.hash                        |   6 -
 package/rust/rust.mk                          |   2 +-
 9 files changed, 69 insertions(+), 142 deletions(-)
 create mode 100644 package/enarx/Config.in
 create mode 100644 package/enarx/enarx.mk
 create mode 100644 package/enarx/remove-incompatible-flags.patch
 delete mode 100644 package/rust-bin/rust-bin.hash
 delete mode 100644 package/rust/rust.hash

diff --git a/package/Config.in b/package/Config.in
index 8892134133..11a08930ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2538,6 +2538,7 @@ menu "System tools"
 	source "package/efivar/Config.in"
 	source "package/embiggen-disk/Config.in"
 	source "package/emlog/Config.in"
+	source "package/enarx/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/gkrellm/Config.in"
diff --git a/package/enarx/Config.in b/package/enarx/Config.in
new file mode 100644
index 0000000000..a2b9939def
--- /dev/null
+++ b/package/enarx/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ENARX
+	bool "enarx"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Application deployment system enabling applications to run within
+	  Trusted Execution Environments (TEEs
+
+	  https://github.com/enarx/enarx
diff --git a/package/enarx/enarx.mk b/package/enarx/enarx.mk
new file mode 100644
index 0000000000..1eaa23d1d6
--- /dev/null
+++ b/package/enarx/enarx.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# enarx
+#
+################################################################################
+
+ENARX_VERSION = master
+ENARX_SITE = $(call github,enarx,enarx,$(ENARX_VERSION))
+ENARX_LICENSE = GPL3
+ENARX_LICENSE_FILES = LICENSE
+ENARX_CARGO_BUILD_OPTS = \
+	-Z bindeps
+ENARX_CARGO_INSTALL_OPTS = \
+	-Z bindeps
+
+$(eval $(cargo-package))
diff --git a/package/enarx/remove-incompatible-flags.patch b/package/enarx/remove-incompatible-flags.patch
new file mode 100644
index 0000000000..de0fa9b73e
--- /dev/null
+++ b/package/enarx/remove-incompatible-flags.patch
@@ -0,0 +1,36 @@
+From ee444d43531dfd463732dc934716e9798e75cbce Mon Sep 17 00:00:00 2001
+From: Jarkko Sakkinen <jarkko@profian.com>
+Date: Mon, 16 May 2022 11:16:35 +0300
+Subject: [PATCH] build: remove incompatible flags
+
+Signed-off-by: Jarkko Sakkinen <jarkko@profian.com>
+---
+ crates/shim-kvm/build.rs | 2 --
+ crates/shim-sgx/build.rs | 2 --
+ 2 files changed, 4 deletions(-)
+
+diff --git a/crates/shim-kvm/build.rs b/crates/shim-kvm/build.rs
+index 6cfbd707..47aa7799 100644
+--- a/crates/shim-kvm/build.rs
++++ b/crates/shim-kvm/build.rs
+@@ -5,6 +5,4 @@ fn main() {
+         "cargo:rustc-link-arg-bin=enarx-shim-kvm=-T{}/layout.ld",
+         std::env::var("CARGO_MANIFEST_DIR").unwrap()
+     );
+-    println!("cargo:rustc-link-arg-bin=enarx-shim-kvm=-Wl,--sort-section=alignment");
+-    println!("cargo:rustc-link-arg-bin=enarx-shim-kvm=-nostartfiles");
+ }
+diff --git a/crates/shim-sgx/build.rs b/crates/shim-sgx/build.rs
+index efe9d836..239262f2 100644
+--- a/crates/shim-sgx/build.rs
++++ b/crates/shim-sgx/build.rs
+@@ -5,6 +5,4 @@ fn main() {
+         "cargo:rustc-link-arg-bin=enarx-shim-sgx=-T{}/layout.ld",
+         std::env::var("CARGO_MANIFEST_DIR").unwrap()
+     );
+-    println!("cargo:rustc-link-arg-bin=enarx-shim-sgx=-Wl,--sort-section=alignment");
+-    println!("cargo:rustc-link-arg-bin=enarx-shim-sgx=-nostartfiles");
+ }
+-- 
+2.36.1
+
diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index f7e3f39503..a808a38c51 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -21,7 +21,7 @@
 ################################################################################
 
 PKG_COMMON_CARGO_ENV = \
-	CARGO_HOME=$(HOST_DIR)/share/cargo
+	CARGO_HOME=$(HOME)/.cargo
 
 # __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS is needed to allow
 # passing the -Z target-applies-to-host, which is needed together with
@@ -117,7 +117,7 @@ define $(2)_BUILD_CMDS
 		$$(TARGET_CONFIGURE_OPTS) \
 		$$(PKG_CARGO_ENV) \
 		$$($(2)_CARGO_ENV) \
-		cargo build \
+		$(CARGO_HOME)/bin/cargo build \
 			--offline \
 			$$(if $$(BR2_ENABLE_DEBUG),,--release) \
 			--manifest-path Cargo.toml \
@@ -132,7 +132,7 @@ define $(2)_BUILD_CMDS
 		$$(HOST_CONFIGURE_OPTS) \
 		$$(HOST_PKG_CARGO_ENV) \
 		$$($(2)_CARGO_ENV) \
-		cargo build \
+		$(CARGO_HOME)/bin/cargo build \
 			--offline \
 			--release \
 			--manifest-path Cargo.toml \
@@ -153,7 +153,7 @@ define $(2)_INSTALL_TARGET_CMDS
 		$$(TARGET_CONFIGURE_OPTS) \
 		$$(PKG_CARGO_ENV) \
 		$$($(2)_CARGO_ENV) \
-		cargo install \
+		$(CARGO_HOME)/bin/cargo install \
 			--offline \
 			--root $$(TARGET_DIR)/usr/ \
 			--bins \
@@ -173,7 +173,7 @@ define $(2)_INSTALL_CMDS
 		$$(HOST_CONFIGURE_OPTS) \
 		$$(HOST_PKG_CARGO_ENV) \
 		$$($(2)_CARGO_ENV) \
-		cargo install \
+		$(CARGO_HOME)/bin/cargo install \
 			--offline \
 			--root $$(HOST_DIR) \
 			--bins \
diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
deleted file mode 100644
index 5e1100c671..0000000000
--- a/package/rust-bin/rust-bin.hash
+++ /dev/null
@@ -1,129 +0,0 @@
-# From https://static.rust-lang.org/dist/rust-1.60.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  5d18bc384273edbd8a4b6d18104685651fb42d5f07bdf518ef2ec3641269c95d  rust-1.60.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  94567ff691b46ef3dff64f3866445a278a17b20639e62cdc4b6fcd7aed86cec8  rust-1.60.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  d7643bf1c46765600b7f12e95c68c7bf98c720c9483d79d5d54884ea9c7f97be  rust-1.60.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  7ff0a817d040688235b69c54e42266d5267481900a621012e7f3a4b9f58d0570  rust-1.60.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  9502d2ceff5d0f9963cdb5dea1e5f83f140132f84df1f588be588d5d151d6637  rust-1.60.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  3e2914c26a60297d3b08fc30eee4fe919bf0a1bc24abb28a4ceb67b9f580e063  rust-1.60.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  2fb5c3cba35f3c1815a24c4f0de1ae34ce6ccfb7fb63cb724070670e8bfceba2  rust-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  cc20c99079d69bd85e5ddb4990415bcc76293513e3b05e8a0ad1d2efa9b968a4  rust-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  1af141aa6ea084f8333cca4973488395414a87c2bdd77c1d58994869cf3cde5d  rust-1.60.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  83c3fb8645379ec308192fa713df87044892639495722077e07aa779b310239e  rust-1.60.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  fbc39c2ba2eee9bad7305d73d02a63ada651961be8fd9e0dae520bda5d715c6e  rust-std-1.60.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  16e8f0e03e6a025ef1f96cb76890810d4212525de82340d8cbf2f627725f2ec7  rust-std-1.60.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  0260245f927a38efccf36c7c652e263b7dd69b80383e09426204bd9592990f9f  rust-std-1.60.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  aa40798080243dcdb199a1b7ffd21c056cdc94a76b0a8a339d5a8ad7a64fdc5a  rust-std-1.60.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  4c0722a9fa5cafa3c720bec8ab110147a0ccbe6947a4b98284e61fa01c006045  rust-std-1.60.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  1429378d662b3bd15b69f426b30678d032ad193d805d7931997943ce8ebe96df  rust-std-1.60.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  48df1c532e23bda5476d287d9280da5cdbd0ed52f4f2e2af5dc088e816a52123  rust-std-1.60.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  84aaa30d90acd0e633c80d54c368d3fcda2b78cbe547e97aeae944765ad93481  rust-std-1.60.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  b913c45d85fcc1caf7de684127cf00a51430e0096e7c470e18ec76a8eec0b6d7  rust-std-1.60.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  3b28be7ae8f669d40fcb01c36e83d9e0107164815c26e080d7cbcf4185b20be2  rust-std-1.60.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  5499545cb0799a56f9d974e513234acfddac4aa7c40703b4780022069a6b1a69  rust-std-1.60.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  925db12e7103935e90264890afdafd93e8485893effbd3fcd526ee9404683db1  rust-std-1.60.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  790288c7060c5dc4aaaf5cc4d2842feeb86a046ce4689023f7def3cf4a091126  rust-std-1.60.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-i586-unknown-linux-musl.tar.xz.asc
-sha256  d583a74a61c8df3e1fdfc0ce86d0275c6922b584205385e94440b4b16278b74e  rust-std-1.60.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  04a7ed0ab0811e3d4dc86053af1d49a8654bfdd6a1a5c22419e8a2c42c33c382  rust-std-1.60.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-i686-unknown-linux-musl.tar.xz.asc
-sha256  c7f7f87b0c66e68dc939d4fe906ee61d6bf8f4836b6e54eb02eccc07e805e806  rust-std-1.60.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  0f5ad9aaf415314308b0c5400b4e8300abe0d31233708902dbed0c5ad5bb70cb  rust-std-1.60.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips-unknown-linux-musl.tar.xz.asc
-sha256  7b8c08adf5c9c4eae38b8929c58916e15ab7ada2d4e3438c60d1d778ba1ba0d6  rust-std-1.60.0-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  8cfc02116e2c15d96696332b8260a217f30aa21e95fac0b241a6a1b4252787e4  rust-std-1.60.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  ca6096a4a6366c1faed3b71052bff5a3722bf7a186218f05980c4291d48ef31b  rust-std-1.60.0-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  636cff37d1fb5474b576d9772d9754aa2d936611363ce658f1b422f444aa1ad7  rust-std-1.60.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  a7b9428705e1267a22ad778d75f6e9c4ffab31e7f82180585c2bb187548c8ab6  rust-std-1.60.0-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  ff963e0a04a5ae8511f75a5e11f42fce4e14942487ce7b6a4615a3b2ef412407  rust-std-1.60.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  75e0212990727dc31e11bc76ddee87c0a94628427c5f18e5c63a3365ca7bfb38  rust-std-1.60.0-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  81138f4b9c8ec6f68fa81f10ec0da5962a7bb433a85009fe970ec3bb6596b1af  rust-std-1.60.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  b390bec6ce697a6347fb6c5dd70bb23f562cc9945ed215f10fd08dbc1a38293f  rust-std-1.60.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  3bfce36ef03027574f2f1e17d24b172bd086a0a3adbd8944955d18ad9919a78e  rust-std-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  9a1d788ed9d0b456ea6974b6468199455d82e437e56025de2a1d4031e9f67174  rust-std-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  3d44442c5dc02fbdc4f71dd4f76dac714fa69a8021a3350b3919439a7ac548ac  rust-std-1.60.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  83039cd55d4ab7606d81f0e199f042e011cbe55b07b252913543c339c6c2f434  rust-std-1.60.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  6fb8ee3650beb10836ae48a9aaa535473e64eaca20695b88113267aea3c7557f  rust-std-1.60.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  0801252694e49eca069003f311e23e124a6dee3557e613133dc2e3cab7bed64d  rust-std-1.60.0-x86_64-unknown-linux-musl.tar.xz
-# Locally generated
-sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
-sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 7cfe5cd6df..e073097991 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.60.0
+RUST_BIN_VERSION = nightly
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
deleted file mode 100644
index 81f366e564..0000000000
--- a/package/rust/rust.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.asc
-sha256  a025876deccbcb3f288d8e02623ea321f94623f31305d3c5c6f17855bb9685db  rustc-1.60.0-src.tar.xz
-# Locally generated
-sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
-sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 445fde70a4..a3dfe7d5d2 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.60.0
+RUST_VERSION = nightly
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
