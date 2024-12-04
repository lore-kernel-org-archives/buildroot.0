Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DABC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 884DD6FA47;
	Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fUtFJrukaGz; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DC5D6068F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DC5D6068F;
	Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 918B468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F88580510
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiV_TQrsx8fq for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C93680A83
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C93680A83
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89BC487A71; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Dec 2024 21:12:14 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0964a91579a4b1135a96588c7bfcae4663d8678
X-Git-Newrev: e35c5ee607e62837fc15c623de430c2ce4570b8e
X-Patchwork-Hint: ignore
Message-Id: <20250228162931.89BC487A71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rust/rust: remove
 Cargo.toml.orig fixup
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e35c5ee607e62837fc15c623de430c2ce4570b8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When the rust package was added in Buildroot it was using
the 1.23.0 release [1]  where some vendored sources contained a
Cargo.toml.orig file that caused issues with
support/scripts/apply-patches.sh used by Buildroot package
infrastructure.

Since then, Buildroot is now using rust 1.74.1 (2024.02.x),
1.79.0 (2024.08.x) and 1.82.0 (master) where vendored
sources no longer contains any Cargo.toml.orig file.
So this post-extract hook is no longer needed.

Moreover, since Rust 1.81.0 are present in
src/tools/rustc-perf/collector/compile-benchmarks/<vendored pkg>
where there is no .cargo-checksum.json file.

Since then, the sed command fail and stop the build:

  sed: can't read [...]/host-rust-1.81.0/src/tools/rustc-perf/collector/compile-benchmarks/serde_derive-1.0.136/.cargo-checksum.json: No such file or directory

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8232367821

[1] b50522d838d8ddfef80bf8036e511319982da16e

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/rust/rust.mk | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 802aa0f413..29c03594d2 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -25,22 +25,6 @@ HOST_RUST_DEPENDENCIES = \
 
 HOST_RUST_VERBOSITY = $(if $(VERBOSE),2,0)
 
-# Some vendor crates contain Cargo.toml.orig files. The associated
-# .cargo-checksum.json file will contain a checksum for Cargo.toml.orig but
-# support/scripts/apply-patches.sh will delete them. This will cause the build
-# to fail, as Cargo will not be able to find the file and verify the checksum.
-# So, remove all Cargo.toml.orig entries from the affected .cargo-checksum.json
-# files
-define HOST_RUST_EXCLUDE_ORIG_FILES
-	for file in $$(find $(@D) -name '*.orig'); do \
-		crate=$$(dirname $${file}); \
-		fn=$${crate}/.cargo-checksum.json; \
-		sed -i -e 's/"Cargo.toml.orig":"[a-z0-9]\+",//g' $${fn}; \
-	done
-endef
-
-HOST_RUST_POST_EXTRACT_HOOKS += HOST_RUST_EXCLUDE_ORIG_FILES
-
 define HOST_RUST_CONFIGURE_CMDS
 	( \
 		echo '[build]'; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
