Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FABC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 834E760A93;
	Sat,  8 Jan 2022 22:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HkLX99cGx-mS; Sat,  8 Jan 2022 22:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F0CA60A9B;
	Sat,  8 Jan 2022 22:38:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BC6B1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6243F81465
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r50O5mZGUAH3 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88EF1813A6
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 59034832C8; Sat,  8 Jan 2022 22:29:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:35:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad034892d8b8748eea52b45aa05dbeb271645dbb
X-Git-Newrev: 301a8eae0c2aded1821b44da1ab051c53df60486
X-Patchwork-Hint: ignore
Message-Id: <20220108222949.59034832C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo.mk: introduce the cargo
 package infrastructure
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

commit: https://git.buildroot.net/buildroot/commit/?id=301a8eae0c2aded1821b44da1ab051c53df60486
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to be package agnostic, the install phase is now using cargo
instead of install. TARGET_CONFIGURE_OPTS is now also set when running
cargo in order to support cross compiling C code within cargo.

This commit also adds support/download/cargo-post-process to perform
the vendoring on Cargo packages.

The <pkg>_LICENSE variable of cargo packages is expanded with ",
vendored dependencies licenses probably not listed" as currently for
all packages, the licenses of the vendored dependencies are not taken
into account.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
[Thomas: add support for host-cargo-package and vendoring]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Makefile.in                 |   1 +
 package/pkg-cargo.mk                | 166 ++++++++++++++++++++++++++++++++++++
 support/download/cargo-post-process |  38 +++++++++
 3 files changed, 205 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index dae7a859fd..0ca2a5844e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -441,3 +441,4 @@ include package/pkg-waf.mk
 include package/pkg-golang.mk
 include package/pkg-meson.mk
 include package/pkg-qmake.mk
+include package/pkg-cargo.mk
diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
new file mode 100644
index 0000000000..47ae86bfae
--- /dev/null
+++ b/package/pkg-cargo.mk
@@ -0,0 +1,166 @@
+################################################################################
+# Cargo package infrastructure
+#
+# This file implements an infrastructure that eases development of package
+# .mk files for Cargo packages. It should be used for all packages that use
+# Cargo as their build system.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this Cargo infrastructure requires the .mk file
+# to only specify metadata information about the package: name, version,
+# download URL, etc.
+#
+# We still allow the package .mk file to override what the different steps
+# are doing, if needed. For example, if <PKG>_BUILD_CMDS is already defined,
+# it is used as the list of commands to perform to build the package,
+# instead of the default Cargo behaviour. The package can also define some
+# post operation hooks.
+#
+################################################################################
+
+# __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS is needed to allow
+# passing the -Z target-applies-to-host, which is needed together with
+# CARGO_TARGET_APPLIES_TO_HOST to fix build problems when target
+# architecture == host architecture.
+PKG_CARGO_ENV = \
+	CARGO_HOME=$(HOST_DIR)/share/cargo \
+	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
+	CARGO_TARGET_APPLIES_TO_HOST="false"
+
+################################################################################
+# inner-cargo-package -- defines how the configuration, compilation and
+# installation of a cargo package should be done, implements a few hooks
+# to tune the build process for cargo specifities and calls the generic
+# package infrastructure to generate the necessary make targets
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including a HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the type (target or host)
+################################################################################
+
+define inner-cargo-package
+
+# We need host-rustc to run cargo
+$(2)_DOWNLOAD_DEPENDENCIES += host-rustc
+
+$(2)_DOWNLOAD_POST_PROCESS = cargo
+$(2)_DL_ENV = CARGO_HOME=$$(HOST_DIR)/share/cargo
+
+# Due to vendoring, it is pretty likely that not all licenses are
+# listed in <pkg>_LICENSE.
+$(2)_LICENSE += , vendored dependencies licenses probably not listed
+
+# Note: in all the steps below, we "cd" into the build directory to
+# execute the "cargo" tool instead of passing $(@D)/Cargo.toml as the
+# manifest-path. Indeed while the latter seems to work, it in fact
+# breaks in subtle ways as the way cargo searches for its
+# configuration file is based (among other rules) on the current
+# directory. This means that if cargo is started outside of a package
+# directory, its configuration file will not be taken into account.
+#
+# Also, we pass:
+#  * --offline to prevent cargo from downloading anything: all
+#    dependencies should have been built by the download post
+#    process logic
+#  * --locked to force cargo to use the Cargo.lock file, which ensures
+#    that a fixed set of dependency versions is used
+
+#
+# Build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+ifeq ($(4),target)
+define $(2)_BUILD_CMDS
+	cd $$(@D) && \
+	$$(TARGET_MAKE_ENV) \
+		$$(TARGET_CONFIGURE_OPTS) \
+		$$(PKG_CARGO_ENV) \
+		$$($(2)_CARGO_ENV) \
+		cargo build \
+			--offline \
+			--target $$(RUSTC_TARGET_NAME) \
+			$$(if $$(BR2_ENABLE_DEBUG),--debug,--release) \
+			--manifest-path Cargo.toml \
+			--locked \
+			-Z target-applies-to-host \
+			$$($(2)_CARGO_BUILD_OPTS)
+endef
+else # ifeq ($(4),target)
+define $(2)_BUILD_CMDS
+	cd $$(@D) && \
+	$$(HOST_MAKE_ENV) \
+		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
+		$$(HOST_CONFIGURE_OPTS) \
+		$$(PKG_CARGO_ENV) \
+		$$($(2)_CARGO_ENV) \
+		cargo build \
+			--offline \
+			--release \
+			--manifest-path Cargo.toml \
+			--locked \
+			$$($(2)_CARGO_BUILD_OPTS)
+endef
+endif # ifeq ($(4),target)
+endif # ifndef $(2)_BUILD_CMDS
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	cd $$(@D) && \
+	$$(TARGET_MAKE_ENV) \
+		$$(TARGET_CONFIGURE_OPTS) \
+		$$(PKG_CARGO_ENV) \
+		$$($(2)_CARGO_ENV) \
+		cargo install \
+			--target $$(RUSTC_TARGET_NAME) \
+			--offline \
+			--root $$(TARGET_DIR)/usr/ \
+			--bins \
+			--path ./ \
+			--force \
+			--locked \
+			-Z target-applies-to-host \
+			$$($(2)_CARGO_INSTALL_OPTS)
+endef
+endif
+
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	cd $$(@D) && \
+	$$(HOST_MAKE_ENV) \
+		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
+		$$(HOST_CONFIGURE_OPTS) \
+		$$(PKG_CARGO_ENV) \
+		$$($(2)_CARGO_ENV) \
+		cargo install \
+			--offline \
+			--root $$(HOST_DIR) \
+			--bins \
+			--path ./ \
+			--force \
+			--locked \
+			$$($(2)_CARGO_INSTALL_OPTS)
+endef
+endif
+
+# Call the generic package infrastructure to generate the necessary
+# make targets
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
+
+endef
+
+################################################################################
+# cargo-package -- the target generator macro for Cargo packages
+################################################################################
+
+cargo-package = $(call inner-cargo-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+host-cargo-package = $(call inner-cargo-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
new file mode 100755
index 0000000000..2d1c66661d
--- /dev/null
+++ b/support/download/cargo-post-process
@@ -0,0 +1,38 @@
+#!/usr/bin/env bash
+
+set -e
+
+. "${0%/*}/helpers"
+
+while getopts "n:o:" OPT; do
+    case "${OPT}" in
+    o)  output="${OPTARG}";;
+    n)  base_name="${OPTARG}";;
+    :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
+    \?) error "unknown option '%s'\n" "${OPTARG}";;
+    esac
+done
+
+# Already vendored tarball, nothing to do
+if tar tf "${output}" | grep -q "^[^/]*/VENDOR" ; then
+    exit 0
+fi
+
+post_process_unpack "${base_name}" "${output}"
+
+# Do the Cargo vendoring
+pushd "${base_name}" > /dev/null
+cargo vendor --locked VENDOR
+
+# Create the local .cargo/config with vendor info
+mkdir -p .cargo/
+cat <<EOF >.cargo/config
+[source.crates-io]
+replace-with = "vendored-sources"
+
+[source.vendored-sources]
+directory = "VENDOR"
+EOF
+popd > /dev/null
+
+post_process_repack "$(pwd)" "${base_name}" "${output}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
