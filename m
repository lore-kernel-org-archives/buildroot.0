Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C19FA3745
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 09:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7900860A66;
	Mon, 31 Oct 2022 09:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7900860A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 051a3ZMgRDwN; Mon, 31 Oct 2022 09:07:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 876D66072A;
	Mon, 31 Oct 2022 09:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 876D66072A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BA731BF358
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 575686072A
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 575686072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5BJdzpaaSE2N for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:07:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 781BE605AE
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 781BE605AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6164E87735; Mon, 31 Oct 2022 09:07:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 10:06:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6942ad11ff03a587ba557aa359d2064f2371c38
X-Git-Newrev: 04154a6517294dbe11a8fd653557b429a6704466
X-Patchwork-Hint: ignore
Message-Id: <20221031090735.6164E87735@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/cargo-post-process: cargo
 output for vendor config
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

commit: https://git.buildroot.net/buildroot/commit/?id=04154a6517294dbe11a8fd653557b429a6704466
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the output of `cargo vendor` to generate the vendor configuration.

Fixes the need to patch the generated configuration if there are
non-crates.io dependencies.

Note:
  `cargo vendor` currently prints a newline before it prints the
  needed configuration.

  This is fixed in +nightly, will end up in +stable soon and must
  be considered when updating cargo.
  See: https://github.com/rust-lang/cargo/pull/11273

  Until then it is needed to remove this first line to make sure
  that the contents of .cargo/config will be the same as they were
  generated with the earlier version of the script. Thus, the
  hashes of the packages that use this script remain the same.

Signed-off-by: Simon Richter <simon.richter@ptwdosimetry.com>
[yann.morin.1998@free.fr: add comment in rust-bin.mk and rust.mk]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rust-bin/rust-bin.mk        |  2 ++
 package/rust/rust.mk                |  2 ++
 support/download/cargo-post-process | 26 +++++++++++++++++++-------
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 6560151d99..a356acd3dc 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# When updating this version, check whether support/download/cargo-post-process
+# still generates the same archives.
 RUST_BIN_VERSION = 1.64.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 411dda21c4..4b5e5fac48 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# When updating this version, check whether support/download/cargo-post-process
+# still generates the same archives.
 RUST_VERSION = 1.64.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index a4a4718a2a..186e9eb69b 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -1,6 +1,7 @@
 #!/usr/bin/env bash
 
 set -e
+set -o pipefail
 
 . "${0%/*}/helpers"
 
@@ -22,17 +23,28 @@ post_process_unpack "${base_name}" "${output}"
 
 # Do the Cargo vendoring
 pushd "${base_name}" > /dev/null
-cargo vendor --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} --locked VENDOR
 
 # Create the local .cargo/config with vendor info
+#
+# The first line of the output to stdout is empty.
+# So skip it to have the file start with the vendoring
+# configuration (`tail --lines=+2`).
+#
+# NOTE:
+#   There is  a patch for cargo to remove the first empty line:
+#   See: https://github.com/rust-lang/cargo/pull/11273
+#
+#   The patch already landed in +nightly and will end up
+#   in +stable soon.
+#
+# ->  When updating rust/cargo, the call to `tail` must be removed.
+#
 mkdir -p .cargo/
-cat <<EOF >.cargo/config
-[source.crates-io]
-replace-with = "vendored-sources"
+cargo vendor \
+    --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
+    --locked VENDOR \
+    | tail --lines=+2 | tee .cargo/config
 
-[source.vendored-sources]
-directory = "VENDOR"
-EOF
 popd > /dev/null
 
 post_process_repack "$(pwd)" "${base_name}" "${output}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
