Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F1FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 12:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A03FF40616;
	Mon, 14 Mar 2022 12:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NWd968x0-qeA; Mon, 14 Mar 2022 12:22:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 876774060B;
	Mon, 14 Mar 2022 12:22:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 381DD1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2A9B4155C
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_8YnZhupgk9 for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 12:20:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 102B441550
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 12:20:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4008A83E42; Mon, 14 Mar 2022 12:11:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 13:17:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c750dd4e5d03430148841d2d897e90dbe19ce172
X-Git-Newrev: a41b0f31dea3e62b006ac815bf628600676b328f
X-Patchwork-Hint: ignore
Message-Id: <20220314121153.4008A83E42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust: set musl-root for musl
 toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=a41b0f31dea3e62b006ac815bf628600676b328f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without musl-root in config.toml the build stop with the following error:

thread 'main' panicked at 'couldn't find libc.a in musl libdir: output/host/arm-buildroot-linux-musleabihf/sysroot/lib/lib', src/bootstrap/sanity.rs:192:25

musl-root is needed to provide the path to libc.a and libunwind.a because
rust link them statically into the standard library and liblibc [1].

For other libc, musl-root is not used and ignored [2].

[1] https://github.com/rust-lang/rust/commit/cd980b3bee5bd48e8a6cd4c0d7c8e0fb0fdb64dd
[2] https://github.com/rust-lang/rust/blob/1.58.1/src/bootstrap/sanity.rs#L181

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 3c560882ca..cd8c87b68d 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -56,6 +56,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'sysconfdir = "$(HOST_DIR)/etc"'; \
 		echo '[rust]'; \
 		echo 'channel = "stable"'; \
+		echo 'musl-root = "$(STAGING_DIR)"' ; \
 		echo '[target.$(RUSTC_TARGET_NAME)]'; \
 		echo 'cc = "$(TARGET_CROSS)gcc"'; \
 		echo '[llvm]'; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
