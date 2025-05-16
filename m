Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6783AC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27294608FA;
	Fri, 16 May 2025 11:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFUR9hYBCyle; Fri, 16 May 2025 11:41:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C35360B2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C35360B2B;
	Fri, 16 May 2025 11:41:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4333E13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29C1B80E7A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdI0GGC_ocUH for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6015A80DAA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6015A80DAA
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:41:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51FFF86B66; Fri, 16 May 2025 11:41:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 13:26:31 +0200
Subject: [git commit] package/rust: fix bootstrap with Rust≥1.83
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9911873aa2a94af29d62b05d091a52d70ebba85
X-Git-Newrev: 740204bf9a731b0c276f3b78202d6f4d55a2dae5
X-Patchwork-Hint: ignore
Message-Id: <20250516114149.51FFF86B66@busybox.osuosl.org>
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1523402288748988489=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1523402288748988489==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=740204bf9a731b0c276f3b78202d6f4d55a2dae5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rust includes an option `download-ci-llvm` in config.toml that enables
downloading prebuilt LLVM binaries from Rust's CI infrastructure instead
of building LLVM from source. This option helps speed up the bootstrap
process and is enabled by default starting from Rust 1.83.

However, starting from commit [1] the bootstrap process performs
a strict check via the function
check_incompatible_options_for_ci_llvm().

This validation, implemented in the function
check_incompatible_options_for_ci_llvm(), checks for any incompatible
custom options such as `llvm.ldflags`, `llvm.cflags`, `targets`, etc.

If any of these are set locally and differ from the values used to build
the CI-provided LLVM, the build fails immediately with the error:

      ERROR: Setting `llvm.ldflags` is incompatible with
             `llvm.download-ci-llvm`.

Buildroot explicitly sets `llvm.ldflags` in rust.mk to ensure proper
host linking during the build of host-rust. Removing this setting may
introduce portability or reliability issues across toolchains.

To address the issue without compromising the build environment, this
patch disables the use of CI-provided LLVM by setting:

      [llvm]
      download-ci-llvm = false

This follows the recommendation from the Rust bootstrap script itself.

Note: this is a temporary workaround to restore compatibility with Rust
≥1.83. Other solutions will be investigated to avoid disabling the use
of prebuilt LLVM in the future, while preserving Buildroot’s reproducible
build setup.

[1] https://github.com/rust-lang/rust/commit/9df7680ecf698bf7087616b595774ee1023d3c7b

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 29c03594d2..6481e40561 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -48,6 +48,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo '[target.$(RUSTC_TARGET_NAME)]'; \
 		echo 'cc = "$(TARGET_CROSS)gcc"'; \
 		echo '[llvm]'; \
+		echo 'download-ci-llvm = false'; \
 		echo 'ninja = false'; \
 		echo 'ldflags = "$(HOST_LDFLAGS)"'; \
 	) > $(@D)/config.toml

--===============1523402288748988489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1523402288748988489==--
